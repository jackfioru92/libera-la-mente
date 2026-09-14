import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

/// Un suono del mixer: loop locale in assets/mixer, sintetizzato (nessun
/// copyright), funziona offline e a schermo spento.
class MixerSound {
  const MixerSound(this.id, this.icon);
  final String id;
  final IconData icon;
  String get asset => 'assets/mixer/$id.m4a';
}

const List<MixerSound> mixerSounds = [
  MixerSound('pioggia', Icons.water_drop),
  MixerSound('fuoco', Icons.local_fire_department),
  MixerSound('vento', Icons.air),
  MixerSound('bianco', Icons.graphic_eq),
  MixerSound('rosa', Icons.blur_on),
  MixerSound('marrone', Icons.waves),
];

/// Combinazioni pronte: id → volumi.
const Map<String, Map<String, double>> mixerPresets = {
  'notte': {'pioggia': 0.7, 'marrone': 0.3},
  'camino': {'fuoco': 0.8, 'vento': 0.25},
  'sonno': {'marrone': 0.6, 'rosa': 0.3},
  'temporale': {'pioggia': 0.8, 'vento': 0.5, 'marrone': 0.2},
};

/// Mixer: un [AudioPlayer] per suono, tutti in loop, volumi indipendenti.
/// Può suonare insieme al video YouTube.
class SoundMixer extends ChangeNotifier {
  SoundMixer({required this.loadVolumes, required this.saveVolumes}) {
    _volumes = {for (final s in mixerSounds) s.id: 0.0};
    final saved = loadVolumes();
    if (saved != null) {
      for (final e in saved.entries) {
        if (_volumes.containsKey(e.key)) _volumes[e.key] = e.value.clamp(0, 1);
      }
    }
  }

  /// Persistenza dei volumi (SharedPreferences), iniettata per non legare
  /// il mixer alle prefs.
  final Map<String, double>? Function() loadVolumes;
  final void Function(Map<String, double>) saveVolumes;

  late final Map<String, double> _volumes;
  final Map<String, AudioPlayer> _players = {};
  bool _playing = false;

  bool get playing => _playing;
  double volume(String id) => _volumes[id] ?? 0;
  Map<String, double> get volumes => Map.unmodifiable(_volumes);

  /// Suoni con volume > 0.
  List<MixerSound> get active =>
      mixerSounds.where((s) => (_volumes[s.id] ?? 0) > 0).toList();

  bool get isActive => _playing && active.isNotEmpty;

  Future<AudioPlayer> _player(MixerSound s) async {
    var p = _players[s.id];
    if (p != null) return p;
    p = AudioPlayer();
    _players[s.id] = p;
    try {
      await p.setLoopMode(LoopMode.one);
      await p.setAsset(s.asset);
    } catch (e) {
      debugPrint('SoundMixer: ${s.id}: $e');
    }
    return p;
  }

  Future<void> setVolume(String id, double v) async {
    final sound = mixerSounds.firstWhere((s) => s.id == id);
    _volumes[id] = v.clamp(0, 1);
    notifyListeners();
    saveVolumes(_volumes);
    final p = await _player(sound);
    await p.setVolume(_volumes[id]!);
    if (_volumes[id]! > 0) {
      if (_playing && !p.playing) p.play();
    } else if (p.playing) {
      await p.pause();
    }
  }

  Future<void> applyPreset(String id) async {
    final preset = mixerPresets[id];
    if (preset == null) return;
    for (final s in mixerSounds) {
      await setVolume(s.id, preset[s.id] ?? 0);
    }
    if (!_playing) await play();
  }

  Future<void> play() async {
    _playing = true;
    notifyListeners();
    for (final s in active) {
      final p = await _player(s);
      await p.setVolume(_volumes[s.id]!);
      p.play();
    }
  }

  Future<void> stop() async {
    _playing = false;
    notifyListeners();
    for (final p in _players.values) {
      if (p.playing) await p.pause();
    }
  }

  Future<void> toggle() => _playing ? stop() : play();

  Future<void> clear() async {
    await stop();
    for (final s in mixerSounds) {
      _volumes[s.id] = 0;
    }
    saveVolumes(_volumes);
    notifyListeners();
  }

  @override
  void dispose() {
    for (final p in _players.values) {
      p.dispose();
    }
    super.dispose();
  }

  static Map<String, double>? decodeVolumes(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      final m = jsonDecode(raw) as Map<String, dynamic>;
      return m.map((k, v) => MapEntry(k, (v as num).toDouble()));
    } catch (_) {
      return null;
    }
  }

  static String encodeVolumes(Map<String, double> v) => jsonEncode(v);
}
