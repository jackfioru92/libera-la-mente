import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

/// Tutte le preferenze e i dati locali dell'utente. Nessun account, nessun
/// server: tutto resta sul telefono.
class AppPrefs extends ChangeNotifier {
  AppPrefs._(this._p);

  final SharedPreferences _p;

  static const _kFavPills = 'fav_pills';
  static const _kFavVideos = 'fav_videos';
  static const _kCustomVideos = 'custom_videos';
  static const _kCustomPills = 'custom_pills';
  static const _kSide = 'side_seconds';
  static const _kSession = 'session_minutes';
  static const _kScene = 'scene_id';
  static const _kSleep = 'sleep_minutes';
  static const _kTotSessions = 'tot_sessions';
  static const _kTotMinutes = 'tot_minutes';
  static const _kStreak = 'streak';
  static const _kLastDay = 'last_day';
  static const _kHaptics = 'haptics';
  static const _kLang = 'language';
  static const _kVoice = 'voice_guide';
  static const _kMixer = 'mixer_volumes';
  static const _kDays = 'session_days';
  static const _kSupport = 'support_asked';

  static Future<AppPrefs> load() async {
    final p = await SharedPreferences.getInstance();
    final prefs = AppPrefs._(p);
    prefs._favPills = (p.getStringList(_kFavPills) ?? const []).toSet();
    prefs._favVideos = (p.getStringList(_kFavVideos) ?? const []).toSet();
    prefs._customVideos = _decodeList(p.getString(_kCustomVideos))
        .map(AsmrVideo.fromJson)
        .toList();
    prefs._customPills = _decodeList(p.getString(_kCustomPills))
        .map(Pillola.fromJson)
        .toList();
    return prefs;
  }

  static List<Map<String, dynamic>> _decodeList(String? raw) {
    if (raw == null || raw.isEmpty) return const [];
    try {
      return (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    } catch (_) {
      return const [];
    }
  }

  // ------------------------------------------------------------- preferiti
  Set<String> _favPills = {};
  Set<String> _favVideos = {};

  bool isFavPill(String id) => _favPills.contains(id);
  bool isFavVideo(String id) => _favVideos.contains(id);
  Set<String> get favPills => _favPills;
  Set<String> get favVideos => _favVideos;

  Future<void> toggleFavPill(String id) async {
    _favPills.contains(id) ? _favPills.remove(id) : _favPills.add(id);
    await _p.setStringList(_kFavPills, _favPills.toList());
    notifyListeners();
  }

  Future<void> toggleFavVideo(String id) async {
    _favVideos.contains(id) ? _favVideos.remove(id) : _favVideos.add(id);
    await _p.setStringList(_kFavVideos, _favVideos.toList());
    notifyListeners();
  }

  // --------------------------------------------------------- contenuti miei
  List<AsmrVideo> _customVideos = [];
  List<Pillola> _customPills = [];

  List<AsmrVideo> get customVideos => List.unmodifiable(_customVideos);
  List<Pillola> get customPills => List.unmodifiable(_customPills);

  Future<void> addCustomVideo(AsmrVideo v) async {
    _customVideos.removeWhere((x) => x.id == v.id);
    _customVideos.insert(0, v);
    await _saveCustomVideos();
  }

  Future<void> removeCustomVideo(String id) async {
    _customVideos.removeWhere((x) => x.id == id);
    _favVideos.remove(id);
    await _p.setStringList(_kFavVideos, _favVideos.toList());
    await _saveCustomVideos();
  }

  Future<void> _saveCustomVideos() async {
    await _p.setString(
      _kCustomVideos,
      jsonEncode(_customVideos.map((v) => v.toJson()).toList()),
    );
    notifyListeners();
  }

  Future<void> addCustomPill(String testo, {String? fonte}) async {
    final id = 'p${DateTime.now().millisecondsSinceEpoch}';
    _customPills.insert(
      0,
      Pillola(
        id: id,
        testo: LText.same(testo.trim()),
        tema: 'personale',
        tipo: TipoPillola.personale,
        fonte: fonte == null || fonte.trim().isEmpty
            ? null
            : LText.same(fonte.trim()),
      ),
    );
    await _saveCustomPills();
  }

  Future<void> removeCustomPill(String id) async {
    _customPills.removeWhere((p) => p.id == id);
    _favPills.remove(id);
    await _p.setStringList(_kFavPills, _favPills.toList());
    await _saveCustomPills();
  }

  Future<void> _saveCustomPills() async {
    await _p.setString(
      _kCustomPills,
      jsonEncode(_customPills.map((p) => p.toJson()).toList()),
    );
    notifyListeners();
  }

  // ---------------------------------------------------------- impostazioni
  int get sideSeconds => _p.getInt(_kSide) ?? 4;
  int get sessionMinutes => _p.getInt(_kSession) ?? 3; // 0 = senza limite
  String get sceneId => _p.getString(_kScene) ?? 'notte';
  int get sleepMinutes => _p.getInt(_kSleep) ?? 0; // 0 = spento
  bool get haptics => _p.getBool(_kHaptics) ?? true;
  bool get voiceGuide => _p.getBool(_kVoice) ?? true;

  String? get mixerVolumesRaw => _p.getString(_kMixer);
  Future<void> setMixerVolumesRaw(String raw) => _p.setString(_kMixer, raw);

  /// True dopo aver mostrato, una volta, la richiesta di contributo.
  bool get supportAsked => _p.getBool(_kSupport) ?? false;

  Future<void> setSupportAsked() async {
    await _p.setBool(_kSupport, true);
    notifyListeners();
  }

  /// Giorni (yyyy-MM-dd) con almeno una sessione: per il calendario.
  Set<String> get sessionDays => (_p.getStringList(_kDays) ?? const []).toSet();

  static String dayKey(DateTime d) => _dayKey(d);

  /// Voce di sistema scelta per una lingua ('' = automatica).
  String voiceId(String lang) => _p.getString('voice_id_$lang') ?? '';

  Future<void> setVoiceId(String lang, String id) async {
    await _p.setString('voice_id_$lang', id);
    notifyListeners();
  }

  Future<void> setVoiceGuide(bool v) async {
    await _p.setBool(_kVoice, v);
    notifyListeners();
  }

  /// '' = segue la lingua del telefono; altrimenti un codice ('it', 'en').
  String get languageCode => _p.getString(_kLang) ?? '';

  Future<void> setLanguageCode(String code) async {
    await _p.setString(_kLang, code);
    notifyListeners();
  }

  Future<void> setSideSeconds(int v) => _setInt(_kSide, v);
  Future<void> setSessionMinutes(int v) => _setInt(_kSession, v);
  Future<void> setSleepMinutes(int v) => _setInt(_kSleep, v);

  Future<void> setSceneId(String id) async {
    await _p.setString(_kScene, id);
    notifyListeners();
  }

  Future<void> setHaptics(bool v) async {
    await _p.setBool(_kHaptics, v);
    notifyListeners();
  }

  Future<void> _setInt(String k, int v) async {
    await _p.setInt(k, v);
    notifyListeners();
  }

  // ------------------------------------------------------------ statistiche
  int get totalSessions => _p.getInt(_kTotSessions) ?? 0;
  int get totalMinutes => _p.getInt(_kTotMinutes) ?? 0;
  int get streak => _p.getInt(_kStreak) ?? 0;

  static String _dayKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Registra una sessione completata (o interrotta dopo almeno un minuto).
  Future<void> recordSession(int minutes) async {
    final today = DateTime.now();
    final todayKey = _dayKey(today);
    final yesterdayKey = _dayKey(today.subtract(const Duration(days: 1)));
    final last = _p.getString(_kLastDay);

    var streak = this.streak;
    if (last == todayKey) {
      // già contato oggi: la serie non cambia
    } else if (last == yesterdayKey) {
      streak += 1;
    } else {
      streak = 1;
    }

    await _p.setInt(_kTotSessions, totalSessions + 1);
    await _p.setInt(_kTotMinutes, totalMinutes + minutes);
    await _p.setInt(_kStreak, streak);
    await _p.setString(_kLastDay, todayKey);
    final days = sessionDays..add(todayKey);
    await _p.setStringList(_kDays, days.toList()..sort());
    notifyListeners();
  }
}
