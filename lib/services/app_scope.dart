import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'asmr_player.dart';
import 'prefs.dart';
import 'voice_guide.dart';

/// Navigazione tra schede e richieste di "avvio rapido" della respirazione.
class AppController extends ChangeNotifier {
  int tabIndex = 0;

  /// Incrementato ogni volta che qualcuno chiede di avviare subito una
  /// sessione di respirazione; la scheda Respira lo ascolta.
  int autoStartTicket = 0;

  void goTo(int index) {
    if (tabIndex == index) return;
    tabIndex = index;
    notifyListeners();
  }

  void startBreathing() {
    tabIndex = 1;
    autoStartTicket++;
    notifyListeners();
  }
}

/// Immagini IA disponibili in assets (`scene_<id>.jpg`). Se un file manca, la
/// scena usa solo il gradiente procedurale.
class SceneImages {
  SceneImages._(this._available);

  /// Nessuna immagine: le scene usano solo il gradiente (utile nei test).
  const SceneImages.none() : _available = const {};

  final Set<String> _available;

  static Future<SceneImages> load() async {
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      return SceneImages._(manifest.listAssets().toSet());
    } catch (_) {
      return SceneImages._(const {});
    }
  }

  bool has(String assetPath) => _available.contains(assetPath);
}

class AppScope extends InheritedWidget {
  const AppScope({
    super.key,
    required this.prefs,
    required this.player,
    required this.nav,
    required this.images,
    required this.voice,
    required super.child,
  });

  final AppPrefs prefs;
  final AsmrPlayer player;
  final AppController nav;
  final SceneImages images;
  final VoiceGuide voice;

  static AppScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope non trovato sopra questo widget');
    return scope!;
  }

  @override
  bool updateShouldNotify(AppScope oldWidget) =>
      prefs != oldWidget.prefs ||
      player != oldWidget.player ||
      nav != oldWidget.nav ||
      images != oldWidget.images ||
      voice != oldWidget.voice;
}
