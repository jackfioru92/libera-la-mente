// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Libera la Mente';

  @override
  String get mixerTitle => 'Mixer di suoni';

  @override
  String get mixerSubtitle =>
      'Suoni generati, senza copyright: funzionano offline e a schermo spento, anche insieme a un video.';

  @override
  String get mixerCardDesc =>
      'Pioggia, fuoco, vento, rumore bianco: crea il tuo sottofondo';

  @override
  String get mixerClear => 'Azzera';

  @override
  String get mixerPlay => 'Avvia il mixer';

  @override
  String get mixerStop => 'Ferma il mixer';

  @override
  String get mixerActive => 'Mixer attivo';

  @override
  String get mixerRain => 'Pioggia';

  @override
  String get mixerFire => 'Fuoco';

  @override
  String get mixerWind => 'Vento';

  @override
  String get mixerWhite => 'Rumore bianco';

  @override
  String get mixerPink => 'Rumore rosa';

  @override
  String get mixerBrown => 'Rumore marrone';

  @override
  String get presetNightRain => 'Pioggia notturna';

  @override
  String get presetFireplace => 'Camino';

  @override
  String get presetDeepSleep => 'Sonno profondo';

  @override
  String get presetStorm => 'Temporale';

  @override
  String get supportTitle => 'Ti è stato utile?';

  @override
  String get welcomeTagline =>
      'Un minuto per calmare la mente: respiro quadrato, una pillola al giorno, suoni per dormire.';

  @override
  String get welcomeIndie =>
      'Libera la Mente è un progetto indipendente, fatto da una persona sola. È gratis, per sempre, senza pubblicità né account, e lo resterà. Se ti fa bene, un piccolo contributo — quanto vuoi tu — aiuta a coprire i costi. Se no, va benissimo lo stesso.';

  @override
  String get continueFree => 'Continua gratis';

  @override
  String get last4Weeks => 'Ultime 4 settimane';

  @override
  String get weekdayLetters => 'LMMGVSD';

  @override
  String get tabToday => 'Oggi';

  @override
  String get tabBreathe => 'Respira';

  @override
  String get tabListen => 'Ascolta';

  @override
  String get tabOasis => 'Oasi';

  @override
  String get greetingNight => 'Buonanotte';

  @override
  String get greetingMorning => 'Buongiorno';

  @override
  String get greetingAfternoon => 'Buon pomeriggio';

  @override
  String get greetingEvening => 'Buonasera';

  @override
  String get howDoYouFeel => 'Come ti senti?';

  @override
  String get quickStart => 'Spegni la mente';

  @override
  String get quickStartHint =>
      'Un tocco: scena, respiro quadrato e un suono a caso.';

  @override
  String get moodAnxious => 'Ansioso';

  @override
  String get moodSleepless => 'Insonne';

  @override
  String get moodOverloaded => 'Sovraccarico';

  @override
  String get moodRestless => 'Agitato';

  @override
  String get moodLow => 'Giù di tono';

  @override
  String get moodDistracted => 'Distratto';

  @override
  String get pillSave => 'Salva';

  @override
  String get pillUnsave => 'Rimuovi dai salvati';

  @override
  String get pillCopy => 'Copia';

  @override
  String get pillCopied => 'Pillola copiata';

  @override
  String get pillAnother => 'Un\'altra';

  @override
  String inspiredBy(String source) {
    return 'Ispirata a $source';
  }

  @override
  String get yourPill => 'La tua pillola';

  @override
  String get phaseInhale => 'Inspira';

  @override
  String get phaseHold => 'Trattieni';

  @override
  String get phaseExhale => 'Espira';

  @override
  String get ready => 'Pronto';

  @override
  String get labelSide => 'Lato';

  @override
  String get labelMinutes => 'Minuti';

  @override
  String secondsShort(int n) {
    return '$n s';
  }

  @override
  String get noTimeLimit => 'Senza limite di tempo';

  @override
  String sessionOf(int minutes) {
    return 'Sessione da $minutes min';
  }

  @override
  String cycleElapsed(int cycle, String time) {
    return 'Ciclo $cycle · $time';
  }

  @override
  String cycleRemaining(int cycle, String time) {
    return 'Ciclo $cycle · $time rimanenti';
  }

  @override
  String get sessionCompletedTitle => 'Sessione completata';

  @override
  String sessionCompletedBody(int cycles, int minutes) {
    return '$cycles cicli in $minutes min.\nResta ancora un momento con questo respiro.';
  }

  @override
  String get thanks => 'Grazie';

  @override
  String get soundButton => 'Suono';

  @override
  String get start => 'Inizia';

  @override
  String get stop => 'Ferma';

  @override
  String get listenSubtitle =>
      'Suoni ASMR da YouTube, divisi per categoria. Continuano mentre respiri.';

  @override
  String videoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count video',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get noVideosHere => 'Nessun video qui.';

  @override
  String get removeVideoTitle => 'Rimuovere il video?';

  @override
  String get cancel => 'Annulla';

  @override
  String get remove => 'Rimuovi';

  @override
  String get chooseSound => 'Scegli un suono';

  @override
  String get favAdd => 'Salva nei preferiti';

  @override
  String get favRemove => 'Rimuovi dai preferiti';

  @override
  String get catBarber => 'ASMR Barbiere';

  @override
  String get catBarberDesc => 'Forbici, rasoio, pennello da barba';

  @override
  String get catHouse => 'ASMR Pulizie di casa';

  @override
  String get catHouseDesc => 'Spazzole, spugne, faccende in silenzio';

  @override
  String get catShoes => 'ASMR Cura delle scarpe';

  @override
  String get catShoesDesc => 'Lucidatura e restauro di scarpe';

  @override
  String get catWhite => 'Rumore bianco';

  @override
  String get catWhiteDesc => 'Bianco e marrone: coprono tutto';

  @override
  String get catFire => 'Scoppiettio del fuoco';

  @override
  String get catFireDesc => 'Camino acceso, legna che crepita';

  @override
  String get catRain => 'Pioggia';

  @override
  String get catRainDesc => 'Pioggia sulla finestra, senza tuoni';

  @override
  String get catStorm => 'Temporale';

  @override
  String get catStormDesc => 'Pioggia e tuoni in lontananza';

  @override
  String get catWaves => 'Onde del mare';

  @override
  String get catWavesDesc => 'Il mare di notte, lento e costante';

  @override
  String get catForest => 'Foresta';

  @override
  String get catForestDesc => 'Uccellini, ruscelli, vento tra le foglie';

  @override
  String get catWhispers => 'Sussurri (ITA)';

  @override
  String get catWhispersDesc => 'Whispering in italiano per dormire';

  @override
  String get catKeyboard => 'Tastiera e tapping';

  @override
  String get catKeyboardDesc => 'Tasti meccanici, tapping lento';

  @override
  String get catPages => 'Pagine di libri';

  @override
  String get catPagesDesc => 'Carta che si sfoglia, libri antichi';

  @override
  String get catCat => 'Fusa di gatto';

  @override
  String get catCatDesc => 'Un gatto che fa le fusa, per ore';

  @override
  String get catLofi => 'Lo-fi radio';

  @override
  String get catLofiDesc => 'Beat lenti per studiare o dormire';

  @override
  String get catMine => 'I miei video';

  @override
  String get catMineDesc => 'Link YouTube che hai aggiunto tu';

  @override
  String get sceneDawn => 'Alba lenta';

  @override
  String get sceneRain => 'Pioggia alla finestra';

  @override
  String get sceneForest => 'Foresta nella nebbia';

  @override
  String get sceneNight => 'Notte di stelle';

  @override
  String get sceneOcean => 'Oceano calmo';

  @override
  String get sceneLavender => 'Campo di lavanda';

  @override
  String get sceneColors => 'Colori';

  @override
  String get scenePhoto => 'Foto';

  @override
  String sleepsIn(String time) {
    return 'Si spegne tra $time';
  }

  @override
  String minutesShort(int n) {
    return '$n min';
  }

  @override
  String get sleepTimerTooltip => 'Timer di spegnimento';

  @override
  String get sleepOff => 'Spento';

  @override
  String nMinutes(int n) {
    return '$n minuti';
  }

  @override
  String get oneHour => '1 ora';

  @override
  String get oneHourHalf => '1 ora e mezza';

  @override
  String get close => 'Chiudi';

  @override
  String get oasisTitle => 'La mia Oasi';

  @override
  String get statSessions => 'sessioni';

  @override
  String get statMinutes => 'minuti';

  @override
  String get statStreak => 'giorni di fila';

  @override
  String get savedPills => 'Pillole salvate';

  @override
  String get savedPillsHint =>
      'Tocca il cuore su una pillola per ritrovarla qui.';

  @override
  String get myPills => 'Le mie pillole';

  @override
  String get add => 'Aggiungi';

  @override
  String get myPillsHint =>
      'Scrivi una frase tua o una citazione da un libro che ami: entrerà nella rotazione di \"Un\'altra\".';

  @override
  String get favSounds => 'Suoni preferiti';

  @override
  String get favSoundsHint => 'I suoni con il cuore compaiono qui.';

  @override
  String get myVideos => 'I miei video';

  @override
  String get addLink => 'Aggiungi link';

  @override
  String get myVideosHint =>
      'Incolla un link YouTube: il video entra nella libreria e nel selettore della schermata Respira.';

  @override
  String get sleepTimer => 'Timer di spegnimento';

  @override
  String get sleepTimerHint =>
      'Quando avvii un suono, si ferma da solo dopo questo tempo.';

  @override
  String get favScene => 'Scena preferita';

  @override
  String get vibration => 'Vibrazione';

  @override
  String get vibrationTitle => 'Un tocco al cambio di fase';

  @override
  String get vibrationSubtitle => 'Per respirare a occhi chiusi.';

  @override
  String get voiceGuide => 'Voce guida';

  @override
  String get voiceGuideTitle => 'Dice la fase a voce';

  @override
  String get voiceGuideSubtitle =>
      'Inspira, trattieni, espira: senza guardare lo schermo.';

  @override
  String get hapticsOn => 'Vibrazione attiva';

  @override
  String get hapticsOff => 'Vibrazione spenta';

  @override
  String get voiceOn => 'Voce guida attiva';

  @override
  String get voiceOff => 'Voce guida spenta';

  @override
  String get chooseVoice => 'Scegli la voce';

  @override
  String get voiceAuto => 'Automatica (la migliore sul telefono)';

  @override
  String get voiceQualityPremium => 'Premium';

  @override
  String get voiceQualityEnhanced => 'Alta qualità';

  @override
  String get voiceQualityBase => 'Base';

  @override
  String get voiceHintIos =>
      'Voci più naturali: Impostazioni › Accessibilità › Contenuto letto › Voci › Italiano, scarica una voce Premium o Migliorata.';

  @override
  String get voiceHintAndroid =>
      'Voci più naturali: Impostazioni › Sistema › Lingue › Sintesi vocale › Google, scarica la voce italiana in alta qualità.';

  @override
  String get voiceNone => 'Nessuna voce trovata per questa lingua.';

  @override
  String get voiceClipsInUse =>
      'In uso: voce registrata (clip incluse nell\'app). Le voci di sistema qui sotto servono solo per le frasi senza clip.';

  @override
  String get language => 'Lingua';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get info => 'Info';

  @override
  String get infoText =>
      'Libera la Mente è gratuita, senza account e senza pubblicità. Nessun dato lascia il telefono.\n\nI suoni sono video YouTube incorporati con il player ufficiale: restano di proprietà dei rispettivi creatori. Le pillole \"ispirate a\" sono parafrasi delle idee dei libri citati, non citazioni letterali.';

  @override
  String get buyMeCoffee => 'Offrimi un caffè';

  @override
  String get donateHint =>
      'Se l\'app ti aiuta, un caffè aiuta me a tenerla gratuita e senza pubblicità.';

  @override
  String get contactMe => 'Scrivimi';

  @override
  String get newPill => 'Nuova pillola';

  @override
  String get pillTextHint => 'Il testo della pillola';

  @override
  String get pillSourceHint => 'Fonte (facoltativa): libro, autore…';

  @override
  String get save => 'Salva';

  @override
  String get addYoutubeVideo => 'Aggiungi video YouTube';

  @override
  String get youtubeLinkHint => 'https://youtu.be/… oppure ID';

  @override
  String get category => 'Categoria';

  @override
  String get linkNotRecognized => 'Link YouTube non riconosciuto';

  @override
  String get addedNoTitle =>
      'Aggiunto (titolo non disponibile: verifica che sia incorporabile)';

  @override
  String addedWithTitle(String title) {
    return 'Aggiunto: $title';
  }
}
