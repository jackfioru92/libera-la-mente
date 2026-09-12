import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

/// Una voce di sistema disponibile sul dispositivo.
class VoiceInfo {
  const VoiceInfo({
    required this.id,
    required this.name,
    required this.locale,
    required this.quality,
    required this.gender,
    required this.networkRequired,
  });

  /// iOS: identifier; Android: name. È ciò che si salva nelle preferenze.
  final String id;
  final String name;
  final String locale;

  /// 0 = base, 1 = buona, 2 = enhanced/alta, 3 = premium/altissima.
  final int quality;
  final String gender; // 'female' | 'male' | ''
  final bool networkRequired;

  /// Punteggio per la scelta automatica: qualità prima di tutto, poi voce
  /// femminile (più morbida per una guida al respiro), poi offline.
  double get score =>
      quality * 10 + (gender == 'female' ? 1 : 0) + (networkRequired ? -5 : 0);

  static VoiceInfo? fromMap(Map<Object?, Object?> m) {
    final name = m['name'] as String?;
    final locale = m['locale'] as String?;
    if (name == null || locale == null) return null;
    final q = (m['quality'] as String? ?? '').toLowerCase();
    final quality = switch (q) {
      'premium' || 'very high' => 3,
      'enhanced' || 'high' => 2,
      'normal' => 1,
      _ => 0,
    };
    final gender = (m['gender'] as String? ?? '').toLowerCase();
    return VoiceInfo(
      id: (m['identifier'] as String?)?.isNotEmpty == true
          ? m['identifier'] as String
          : name,
      name: name,
      locale: locale,
      quality: quality,
      gender: gender == 'female' || gender == 'male' ? gender : '',
      networkRequired: m['network_required'] == '1',
    );
  }
}

/// Voce guida: pronuncia il nome della fase a ogni cambio, così si può
/// respirare a occhi chiusi.
///
/// Ordine di preferenza:
///  1. clip audio in `assets/audio/<lang>/<chiave>.mp3` (voce neurale o
///     umana registrata: la più morbida in assoluto, se presente);
///  2. sintesi vocale di sistema con la voce scelta dall'utente;
///  3. sintesi con la voce migliore trovata sul dispositivo.
/// Mentre parla, l'audio ASMR viene abbassato (iOS e Android).
class VoiceGuide {
  VoiceGuide({this.assets = const {}});

  /// Clip audio presenti nel bundle (vedi [scanAssets]).
  final Set<String> assets;
  final FlutterTts _tts = FlutterTts();
  AudioPlayer? _clipPlayer;
  bool _configured = false;
  String _lang = '';
  String? _appliedVoiceId;

  /// Chiavi delle frasi: uguali in tutte le lingue (il file cambia cartella).
  static const inhale = 'inhale';
  static const hold = 'hold';
  static const exhale = 'exhale';
  static const complete = 'complete';
  static const test = 'test';

  static String clipPath(String lang, String key) =>
      'assets/audio/$lang/$key.mp3';

  bool hasClip(String lang, String key) => assets.contains(clipPath(lang, key));

  Future<void> _configure() async {
    if (_configured) return;
    _configured = true;
    try {
      final session = await AudioSession.instance;
      await session.configure(
        AudioSessionConfiguration(
          avAudioSessionCategory: AVAudioSessionCategory.playback,
          avAudioSessionCategoryOptions:
              AVAudioSessionCategoryOptions.mixWithOthers |
              AVAudioSessionCategoryOptions.duckOthers,
          avAudioSessionMode: AVAudioSessionMode.voicePrompt,
          androidAudioAttributes: const AndroidAudioAttributes(
            contentType: AndroidAudioContentType.speech,
            usage: AndroidAudioUsage.assistanceAccessibility,
          ),
          androidAudioFocusGainType:
              AndroidAudioFocusGainType.gainTransientMayDuck,
          androidWillPauseWhenDucked: false,
        ),
      );
      if (Platform.isIOS) {
        await _tts.setSharedInstance(true);
        await _tts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.duckOthers,
        ], IosTextToSpeechAudioMode.voicePrompt);
      }
      await _tts.awaitSpeakCompletion(false);
      // Più lenta e un filo più grave del normale: meno "annuncio", più guida.
      await _tts.setSpeechRate(0.42);
      await _tts.setPitch(0.95);
      await _tts.setVolume(1.0);
    } catch (e) {
      debugPrint('VoiceGuide.configure: $e');
    }
  }

  static String _tag(String code) => switch (code) {
    'it' => 'it-IT',
    _ => 'en-US',
  };

  /// Voci di sistema per la lingua dell'app, dalla migliore alla peggiore.
  Future<List<VoiceInfo>> voicesFor(String code) async {
    await _configure();
    try {
      final raw = await _tts.getVoices;
      final prefix = code.toLowerCase();
      final list = <VoiceInfo>[];
      for (final item in (raw as List?) ?? const []) {
        if (item is! Map<Object?, Object?>) continue;
        final v = VoiceInfo.fromMap(item);
        if (v == null) continue;
        final loc = v.locale.toLowerCase().replaceAll('_', '-');
        if (loc == prefix || loc.startsWith('$prefix-')) list.add(v);
      }
      list.sort((a, b) => b.score.compareTo(a.score));
      return list;
    } catch (e) {
      debugPrint('VoiceGuide.voicesFor: $e');
      return const [];
    }
  }

  /// Imposta lingua e voce. [preferredVoiceId] è la scelta dell'utente
  /// (può essere null: si usa la migliore disponibile).
  Future<void> setLanguage(String code, {String? preferredVoiceId}) async {
    await _configure();
    final tag = _tag(code);
    try {
      if (_lang != code) {
        _lang = code;
        _appliedVoiceId = null;
        await _tts.setLanguage(tag);
      }
      final voices = await voicesFor(code);
      VoiceInfo? chosen;
      if (preferredVoiceId != null) {
        chosen = voices.where((v) => v.id == preferredVoiceId).firstOrNull;
      }
      chosen ??= voices.firstOrNull;
      if (chosen != null && chosen.id != _appliedVoiceId) {
        _appliedVoiceId = chosen.id;
        await _tts.setVoice({
          'name': chosen.name,
          'locale': chosen.locale,
          if (Platform.isIOS) 'identifier': chosen.id,
        });
      }
    } catch (e) {
      debugPrint('VoiceGuide.setLanguage: $e');
    }
  }

  /// Pronuncia la frase [key] (clip se c'è, altrimenti sintesi di [text]).
  Future<void> say(String key, String text) async {
    await _configure();
    try {
      if (hasClip(_lang, key)) {
        await _tts.stop();
        final p = _clipPlayer ??= AudioPlayer();
        await p.stop();
        await p.setAsset(clipPath(_lang, key));
        p.play();
        return;
      }
      await _clipPlayer?.stop();
      await _tts.stop();
      await _tts.speak(text);
    } catch (e) {
      debugPrint('VoiceGuide.say: $e');
    }
  }

  /// Anteprima di una voce di sistema: ignora le clip.
  Future<void> preview(String text) async {
    await _configure();
    try {
      await _clipPlayer?.stop();
      await _tts.stop();
      await _tts.speak(text);
    } catch (e) {
      debugPrint('VoiceGuide.preview: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _tts.stop();
      await _clipPlayer?.stop();
    } catch (_) {}
  }

  void dispose() {
    _clipPlayer?.dispose();
  }

  /// Le clip presenti nel bundle, da passare al costruttore.
  static Future<Set<String>> scanAssets() async {
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      return manifest
          .listAssets()
          .where((a) => a.startsWith('assets/audio/'))
          .toSet();
    } catch (_) {
      return const {};
    }
  }
}
