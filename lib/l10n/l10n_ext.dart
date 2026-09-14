import 'package:flutter/widgets.dart';

import '../models/models.dart';
import 'app_localizations.dart';

export 'app_localizations.dart';

/// `context.l10n.tabToday` invece di `AppLocalizations.of(context).tabToday`.
extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  String get lang => Localizations.localeOf(this).languageCode;
}

/// Nomi tradotti per i contenuti identificati da chiave (categorie, scene,
/// stati d'animo, attribuzione delle pillole).
extension L10nData on AppLocalizations {
  String categoryName(String id) => switch (id) {
    'barber' => catBarber,
    'casa' => catHouse,
    'scarpe' => catShoes,
    'bianco' => catWhite,
    'fuoco' => catFire,
    'pioggia' => catRain,
    'temporale' => catStorm,
    'onde' => catWaves,
    'foresta' => catForest,
    'sussurri' => catWhispers,
    'tastiera' => catKeyboard,
    'lofi' => catLofi,
    'pagine' => catPages,
    'gatto' => catCat,
    _ => catMine,
  };

  String categoryDesc(String id) => switch (id) {
    'barber' => catBarberDesc,
    'casa' => catHouseDesc,
    'scarpe' => catShoesDesc,
    'bianco' => catWhiteDesc,
    'fuoco' => catFireDesc,
    'pioggia' => catRainDesc,
    'temporale' => catStormDesc,
    'onde' => catWavesDesc,
    'foresta' => catForestDesc,
    'sussurri' => catWhispersDesc,
    'tastiera' => catKeyboardDesc,
    'lofi' => catLofiDesc,
    'pagine' => catPagesDesc,
    'gatto' => catCatDesc,
    _ => catMineDesc,
  };

  String sceneName(String id) => switch (id) {
    'alba' => sceneDawn,
    'pioggia' => sceneRain,
    'foresta' => sceneForest,
    'notte' => sceneNight,
    'oceano' => sceneOcean,
    _ => sceneLavender,
  };

  String moodName(String id) => switch (id) {
    'ansioso' => moodAnxious,
    'insonne' => moodSleepless,
    'sovraccarico' => moodOverloaded,
    'agitato' => moodRestless,
    'giu' => moodLow,
    _ => moodDistracted,
  };

  String mixerSoundName(String id) => switch (id) {
    'pioggia' => mixerRain,
    'fuoco' => mixerFire,
    'vento' => mixerWind,
    'bianco' => mixerWhite,
    'rosa' => mixerPink,
    _ => mixerBrown,
  };

  String mixerPresetName(String id) => switch (id) {
    'notte' => presetNightRain,
    'camino' => presetFireplace,
    'sonno' => presetDeepSleep,
    _ => presetStorm,
  };

  /// Fasi della respirazione quadrata nell'ordine dei lati.
  List<String> get phases => [phaseInhale, phaseHold, phaseExhale, phaseHold];

  /// Riga di attribuzione sotto una pillola (vuota per le originali).
  String pillAttribution(Pillola p, String lang) {
    final fonte = p.fonte?.of(lang);
    switch (p.tipo) {
      case TipoPillola.originale:
        return '';
      case TipoPillola.classico:
        return [p.autore, fonte].whereType<String>().join(' · ');
      case TipoPillola.ispirata:
        return inspiredBy([fonte, p.autore].whereType<String>().join(' · '));
      case TipoPillola.personale:
        return fonte == null || fonte.isEmpty ? yourPill : fonte;
    }
  }
}
