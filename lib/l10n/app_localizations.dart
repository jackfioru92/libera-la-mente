import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
  ];

  /// No description provided for @appName.
  ///
  /// In it, this message translates to:
  /// **'Libera la Mente'**
  String get appName;

  /// No description provided for @tabToday.
  ///
  /// In it, this message translates to:
  /// **'Oggi'**
  String get tabToday;

  /// No description provided for @tabBreathe.
  ///
  /// In it, this message translates to:
  /// **'Respira'**
  String get tabBreathe;

  /// No description provided for @tabListen.
  ///
  /// In it, this message translates to:
  /// **'Ascolta'**
  String get tabListen;

  /// No description provided for @tabOasis.
  ///
  /// In it, this message translates to:
  /// **'Oasi'**
  String get tabOasis;

  /// No description provided for @greetingNight.
  ///
  /// In it, this message translates to:
  /// **'Buonanotte'**
  String get greetingNight;

  /// No description provided for @greetingMorning.
  ///
  /// In it, this message translates to:
  /// **'Buongiorno'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In it, this message translates to:
  /// **'Buon pomeriggio'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In it, this message translates to:
  /// **'Buonasera'**
  String get greetingEvening;

  /// No description provided for @howDoYouFeel.
  ///
  /// In it, this message translates to:
  /// **'Come ti senti?'**
  String get howDoYouFeel;

  /// No description provided for @quickStart.
  ///
  /// In it, this message translates to:
  /// **'Spegni la mente'**
  String get quickStart;

  /// No description provided for @quickStartHint.
  ///
  /// In it, this message translates to:
  /// **'Un tocco: scena, respiro quadrato e un suono a caso.'**
  String get quickStartHint;

  /// No description provided for @moodAnxious.
  ///
  /// In it, this message translates to:
  /// **'Ansioso'**
  String get moodAnxious;

  /// No description provided for @moodSleepless.
  ///
  /// In it, this message translates to:
  /// **'Insonne'**
  String get moodSleepless;

  /// No description provided for @moodOverloaded.
  ///
  /// In it, this message translates to:
  /// **'Sovraccarico'**
  String get moodOverloaded;

  /// No description provided for @moodRestless.
  ///
  /// In it, this message translates to:
  /// **'Agitato'**
  String get moodRestless;

  /// No description provided for @moodLow.
  ///
  /// In it, this message translates to:
  /// **'Giù di tono'**
  String get moodLow;

  /// No description provided for @moodDistracted.
  ///
  /// In it, this message translates to:
  /// **'Distratto'**
  String get moodDistracted;

  /// No description provided for @pillSave.
  ///
  /// In it, this message translates to:
  /// **'Salva'**
  String get pillSave;

  /// No description provided for @pillUnsave.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi dai salvati'**
  String get pillUnsave;

  /// No description provided for @pillCopy.
  ///
  /// In it, this message translates to:
  /// **'Copia'**
  String get pillCopy;

  /// No description provided for @pillCopied.
  ///
  /// In it, this message translates to:
  /// **'Pillola copiata'**
  String get pillCopied;

  /// No description provided for @pillAnother.
  ///
  /// In it, this message translates to:
  /// **'Un\'altra'**
  String get pillAnother;

  /// No description provided for @inspiredBy.
  ///
  /// In it, this message translates to:
  /// **'Ispirata a {source}'**
  String inspiredBy(String source);

  /// No description provided for @yourPill.
  ///
  /// In it, this message translates to:
  /// **'La tua pillola'**
  String get yourPill;

  /// No description provided for @phaseInhale.
  ///
  /// In it, this message translates to:
  /// **'Inspira'**
  String get phaseInhale;

  /// No description provided for @phaseHold.
  ///
  /// In it, this message translates to:
  /// **'Trattieni'**
  String get phaseHold;

  /// No description provided for @phaseExhale.
  ///
  /// In it, this message translates to:
  /// **'Espira'**
  String get phaseExhale;

  /// No description provided for @ready.
  ///
  /// In it, this message translates to:
  /// **'Pronto'**
  String get ready;

  /// No description provided for @labelSide.
  ///
  /// In it, this message translates to:
  /// **'Lato'**
  String get labelSide;

  /// No description provided for @labelMinutes.
  ///
  /// In it, this message translates to:
  /// **'Minuti'**
  String get labelMinutes;

  /// No description provided for @secondsShort.
  ///
  /// In it, this message translates to:
  /// **'{n} s'**
  String secondsShort(int n);

  /// No description provided for @noTimeLimit.
  ///
  /// In it, this message translates to:
  /// **'Senza limite di tempo'**
  String get noTimeLimit;

  /// No description provided for @sessionOf.
  ///
  /// In it, this message translates to:
  /// **'Sessione da {minutes} min'**
  String sessionOf(int minutes);

  /// No description provided for @cycleElapsed.
  ///
  /// In it, this message translates to:
  /// **'Ciclo {cycle} · {time}'**
  String cycleElapsed(int cycle, String time);

  /// No description provided for @cycleRemaining.
  ///
  /// In it, this message translates to:
  /// **'Ciclo {cycle} · {time} rimanenti'**
  String cycleRemaining(int cycle, String time);

  /// No description provided for @sessionCompletedTitle.
  ///
  /// In it, this message translates to:
  /// **'Sessione completata'**
  String get sessionCompletedTitle;

  /// No description provided for @sessionCompletedBody.
  ///
  /// In it, this message translates to:
  /// **'{cycles} cicli in {minutes} min.\nResta ancora un momento con questo respiro.'**
  String sessionCompletedBody(int cycles, int minutes);

  /// No description provided for @thanks.
  ///
  /// In it, this message translates to:
  /// **'Grazie'**
  String get thanks;

  /// No description provided for @soundButton.
  ///
  /// In it, this message translates to:
  /// **'Suono'**
  String get soundButton;

  /// No description provided for @start.
  ///
  /// In it, this message translates to:
  /// **'Inizia'**
  String get start;

  /// No description provided for @stop.
  ///
  /// In it, this message translates to:
  /// **'Ferma'**
  String get stop;

  /// No description provided for @listenSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Suoni ASMR da YouTube, divisi per categoria. Continuano mentre respiri.'**
  String get listenSubtitle;

  /// No description provided for @videoCount.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, =1{1 video} other{{count} video}}'**
  String videoCount(int count);

  /// No description provided for @noVideosHere.
  ///
  /// In it, this message translates to:
  /// **'Nessun video qui.'**
  String get noVideosHere;

  /// No description provided for @removeVideoTitle.
  ///
  /// In it, this message translates to:
  /// **'Rimuovere il video?'**
  String get removeVideoTitle;

  /// No description provided for @cancel.
  ///
  /// In it, this message translates to:
  /// **'Annulla'**
  String get cancel;

  /// No description provided for @remove.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi'**
  String get remove;

  /// No description provided for @chooseSound.
  ///
  /// In it, this message translates to:
  /// **'Scegli un suono'**
  String get chooseSound;

  /// No description provided for @favAdd.
  ///
  /// In it, this message translates to:
  /// **'Salva nei preferiti'**
  String get favAdd;

  /// No description provided for @favRemove.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi dai preferiti'**
  String get favRemove;

  /// No description provided for @catBarber.
  ///
  /// In it, this message translates to:
  /// **'ASMR Barbiere'**
  String get catBarber;

  /// No description provided for @catBarberDesc.
  ///
  /// In it, this message translates to:
  /// **'Forbici, rasoio, pennello da barba'**
  String get catBarberDesc;

  /// No description provided for @catHouse.
  ///
  /// In it, this message translates to:
  /// **'ASMR Pulizie di casa'**
  String get catHouse;

  /// No description provided for @catHouseDesc.
  ///
  /// In it, this message translates to:
  /// **'Spazzole, spugne, faccende in silenzio'**
  String get catHouseDesc;

  /// No description provided for @catShoes.
  ///
  /// In it, this message translates to:
  /// **'ASMR Cura delle scarpe'**
  String get catShoes;

  /// No description provided for @catShoesDesc.
  ///
  /// In it, this message translates to:
  /// **'Lucidatura e restauro di scarpe'**
  String get catShoesDesc;

  /// No description provided for @catWhite.
  ///
  /// In it, this message translates to:
  /// **'Rumore bianco'**
  String get catWhite;

  /// No description provided for @catWhiteDesc.
  ///
  /// In it, this message translates to:
  /// **'Bianco e marrone: coprono tutto'**
  String get catWhiteDesc;

  /// No description provided for @catFire.
  ///
  /// In it, this message translates to:
  /// **'Scoppiettio del fuoco'**
  String get catFire;

  /// No description provided for @catFireDesc.
  ///
  /// In it, this message translates to:
  /// **'Camino acceso, legna che crepita'**
  String get catFireDesc;

  /// No description provided for @catRain.
  ///
  /// In it, this message translates to:
  /// **'Pioggia'**
  String get catRain;

  /// No description provided for @catRainDesc.
  ///
  /// In it, this message translates to:
  /// **'Pioggia sulla finestra, senza tuoni'**
  String get catRainDesc;

  /// No description provided for @catStorm.
  ///
  /// In it, this message translates to:
  /// **'Temporale'**
  String get catStorm;

  /// No description provided for @catStormDesc.
  ///
  /// In it, this message translates to:
  /// **'Pioggia e tuoni in lontananza'**
  String get catStormDesc;

  /// No description provided for @catWaves.
  ///
  /// In it, this message translates to:
  /// **'Onde del mare'**
  String get catWaves;

  /// No description provided for @catWavesDesc.
  ///
  /// In it, this message translates to:
  /// **'Il mare di notte, lento e costante'**
  String get catWavesDesc;

  /// No description provided for @catForest.
  ///
  /// In it, this message translates to:
  /// **'Foresta'**
  String get catForest;

  /// No description provided for @catForestDesc.
  ///
  /// In it, this message translates to:
  /// **'Uccellini, ruscelli, vento tra le foglie'**
  String get catForestDesc;

  /// No description provided for @catWhispers.
  ///
  /// In it, this message translates to:
  /// **'Sussurri (ITA)'**
  String get catWhispers;

  /// No description provided for @catWhispersDesc.
  ///
  /// In it, this message translates to:
  /// **'Whispering in italiano per dormire'**
  String get catWhispersDesc;

  /// No description provided for @catKeyboard.
  ///
  /// In it, this message translates to:
  /// **'Tastiera e tapping'**
  String get catKeyboard;

  /// No description provided for @catKeyboardDesc.
  ///
  /// In it, this message translates to:
  /// **'Tasti meccanici, tapping lento'**
  String get catKeyboardDesc;

  /// No description provided for @catLofi.
  ///
  /// In it, this message translates to:
  /// **'Lo-fi radio'**
  String get catLofi;

  /// No description provided for @catLofiDesc.
  ///
  /// In it, this message translates to:
  /// **'Beat lenti per studiare o dormire'**
  String get catLofiDesc;

  /// No description provided for @catMine.
  ///
  /// In it, this message translates to:
  /// **'I miei video'**
  String get catMine;

  /// No description provided for @catMineDesc.
  ///
  /// In it, this message translates to:
  /// **'Link YouTube che hai aggiunto tu'**
  String get catMineDesc;

  /// No description provided for @sceneDawn.
  ///
  /// In it, this message translates to:
  /// **'Alba lenta'**
  String get sceneDawn;

  /// No description provided for @sceneRain.
  ///
  /// In it, this message translates to:
  /// **'Pioggia alla finestra'**
  String get sceneRain;

  /// No description provided for @sceneForest.
  ///
  /// In it, this message translates to:
  /// **'Foresta nella nebbia'**
  String get sceneForest;

  /// No description provided for @sceneNight.
  ///
  /// In it, this message translates to:
  /// **'Notte di stelle'**
  String get sceneNight;

  /// No description provided for @sceneOcean.
  ///
  /// In it, this message translates to:
  /// **'Oceano calmo'**
  String get sceneOcean;

  /// No description provided for @sceneLavender.
  ///
  /// In it, this message translates to:
  /// **'Campo di lavanda'**
  String get sceneLavender;

  /// No description provided for @sceneColors.
  ///
  /// In it, this message translates to:
  /// **'Colori'**
  String get sceneColors;

  /// No description provided for @scenePhoto.
  ///
  /// In it, this message translates to:
  /// **'Foto'**
  String get scenePhoto;

  /// No description provided for @sleepsIn.
  ///
  /// In it, this message translates to:
  /// **'Si spegne tra {time}'**
  String sleepsIn(String time);

  /// No description provided for @minutesShort.
  ///
  /// In it, this message translates to:
  /// **'{n} min'**
  String minutesShort(int n);

  /// No description provided for @sleepTimerTooltip.
  ///
  /// In it, this message translates to:
  /// **'Timer di spegnimento'**
  String get sleepTimerTooltip;

  /// No description provided for @sleepOff.
  ///
  /// In it, this message translates to:
  /// **'Spento'**
  String get sleepOff;

  /// No description provided for @nMinutes.
  ///
  /// In it, this message translates to:
  /// **'{n} minuti'**
  String nMinutes(int n);

  /// No description provided for @oneHour.
  ///
  /// In it, this message translates to:
  /// **'1 ora'**
  String get oneHour;

  /// No description provided for @oneHourHalf.
  ///
  /// In it, this message translates to:
  /// **'1 ora e mezza'**
  String get oneHourHalf;

  /// No description provided for @close.
  ///
  /// In it, this message translates to:
  /// **'Chiudi'**
  String get close;

  /// No description provided for @oasisTitle.
  ///
  /// In it, this message translates to:
  /// **'La mia Oasi'**
  String get oasisTitle;

  /// No description provided for @statSessions.
  ///
  /// In it, this message translates to:
  /// **'sessioni'**
  String get statSessions;

  /// No description provided for @statMinutes.
  ///
  /// In it, this message translates to:
  /// **'minuti'**
  String get statMinutes;

  /// No description provided for @statStreak.
  ///
  /// In it, this message translates to:
  /// **'giorni di fila'**
  String get statStreak;

  /// No description provided for @savedPills.
  ///
  /// In it, this message translates to:
  /// **'Pillole salvate'**
  String get savedPills;

  /// No description provided for @savedPillsHint.
  ///
  /// In it, this message translates to:
  /// **'Tocca il cuore su una pillola per ritrovarla qui.'**
  String get savedPillsHint;

  /// No description provided for @myPills.
  ///
  /// In it, this message translates to:
  /// **'Le mie pillole'**
  String get myPills;

  /// No description provided for @add.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi'**
  String get add;

  /// No description provided for @myPillsHint.
  ///
  /// In it, this message translates to:
  /// **'Scrivi una frase tua o una citazione da un libro che ami: entrerà nella rotazione di \"Un\'altra\".'**
  String get myPillsHint;

  /// No description provided for @favSounds.
  ///
  /// In it, this message translates to:
  /// **'Suoni preferiti'**
  String get favSounds;

  /// No description provided for @favSoundsHint.
  ///
  /// In it, this message translates to:
  /// **'I suoni con il cuore compaiono qui.'**
  String get favSoundsHint;

  /// No description provided for @myVideos.
  ///
  /// In it, this message translates to:
  /// **'I miei video'**
  String get myVideos;

  /// No description provided for @addLink.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi link'**
  String get addLink;

  /// No description provided for @myVideosHint.
  ///
  /// In it, this message translates to:
  /// **'Incolla un link YouTube: il video entra nella libreria e nel selettore della schermata Respira.'**
  String get myVideosHint;

  /// No description provided for @sleepTimer.
  ///
  /// In it, this message translates to:
  /// **'Timer di spegnimento'**
  String get sleepTimer;

  /// No description provided for @sleepTimerHint.
  ///
  /// In it, this message translates to:
  /// **'Quando avvii un suono, si ferma da solo dopo questo tempo.'**
  String get sleepTimerHint;

  /// No description provided for @favScene.
  ///
  /// In it, this message translates to:
  /// **'Scena preferita'**
  String get favScene;

  /// No description provided for @vibration.
  ///
  /// In it, this message translates to:
  /// **'Vibrazione'**
  String get vibration;

  /// No description provided for @vibrationTitle.
  ///
  /// In it, this message translates to:
  /// **'Un tocco al cambio di fase'**
  String get vibrationTitle;

  /// No description provided for @vibrationSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Per respirare a occhi chiusi.'**
  String get vibrationSubtitle;

  /// No description provided for @voiceGuide.
  ///
  /// In it, this message translates to:
  /// **'Voce guida'**
  String get voiceGuide;

  /// No description provided for @voiceGuideTitle.
  ///
  /// In it, this message translates to:
  /// **'Dice la fase a voce'**
  String get voiceGuideTitle;

  /// No description provided for @voiceGuideSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Inspira, trattieni, espira: senza guardare lo schermo.'**
  String get voiceGuideSubtitle;

  /// No description provided for @voiceOn.
  ///
  /// In it, this message translates to:
  /// **'Voce guida attiva'**
  String get voiceOn;

  /// No description provided for @voiceOff.
  ///
  /// In it, this message translates to:
  /// **'Voce guida spenta'**
  String get voiceOff;

  /// No description provided for @chooseVoice.
  ///
  /// In it, this message translates to:
  /// **'Scegli la voce'**
  String get chooseVoice;

  /// No description provided for @voiceAuto.
  ///
  /// In it, this message translates to:
  /// **'Automatica (la migliore sul telefono)'**
  String get voiceAuto;

  /// No description provided for @voiceQualityPremium.
  ///
  /// In it, this message translates to:
  /// **'Premium'**
  String get voiceQualityPremium;

  /// No description provided for @voiceQualityEnhanced.
  ///
  /// In it, this message translates to:
  /// **'Alta qualità'**
  String get voiceQualityEnhanced;

  /// No description provided for @voiceQualityBase.
  ///
  /// In it, this message translates to:
  /// **'Base'**
  String get voiceQualityBase;

  /// No description provided for @voiceHintIos.
  ///
  /// In it, this message translates to:
  /// **'Voci più naturali: Impostazioni › Accessibilità › Contenuto letto › Voci › Italiano, scarica una voce Premium o Migliorata.'**
  String get voiceHintIos;

  /// No description provided for @voiceHintAndroid.
  ///
  /// In it, this message translates to:
  /// **'Voci più naturali: Impostazioni › Sistema › Lingue › Sintesi vocale › Google, scarica la voce italiana in alta qualità.'**
  String get voiceHintAndroid;

  /// No description provided for @voiceNone.
  ///
  /// In it, this message translates to:
  /// **'Nessuna voce trovata per questa lingua.'**
  String get voiceNone;

  /// No description provided for @voiceClipsInUse.
  ///
  /// In it, this message translates to:
  /// **'In uso: voce registrata (clip incluse nell\'app). Le voci di sistema qui sotto servono solo per le frasi senza clip.'**
  String get voiceClipsInUse;

  /// No description provided for @language.
  ///
  /// In it, this message translates to:
  /// **'Lingua'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In it, this message translates to:
  /// **'Sistema'**
  String get languageSystem;

  /// No description provided for @info.
  ///
  /// In it, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @infoText.
  ///
  /// In it, this message translates to:
  /// **'Libera la Mente è gratuita, senza account e senza pubblicità. Nessun dato lascia il telefono.\n\nI suoni sono video YouTube incorporati con il player ufficiale: restano di proprietà dei rispettivi creatori. Le pillole \"ispirate a\" sono parafrasi delle idee dei libri citati, non citazioni letterali.'**
  String get infoText;

  /// No description provided for @buyMeCoffee.
  ///
  /// In it, this message translates to:
  /// **'Offrimi un caffè'**
  String get buyMeCoffee;

  /// No description provided for @donateHint.
  ///
  /// In it, this message translates to:
  /// **'Se l\'app ti aiuta, un caffè aiuta me a tenerla gratuita e senza pubblicità.'**
  String get donateHint;

  /// No description provided for @contactMe.
  ///
  /// In it, this message translates to:
  /// **'Scrivimi'**
  String get contactMe;

  /// No description provided for @newPill.
  ///
  /// In it, this message translates to:
  /// **'Nuova pillola'**
  String get newPill;

  /// No description provided for @pillTextHint.
  ///
  /// In it, this message translates to:
  /// **'Il testo della pillola'**
  String get pillTextHint;

  /// No description provided for @pillSourceHint.
  ///
  /// In it, this message translates to:
  /// **'Fonte (facoltativa): libro, autore…'**
  String get pillSourceHint;

  /// No description provided for @save.
  ///
  /// In it, this message translates to:
  /// **'Salva'**
  String get save;

  /// No description provided for @addYoutubeVideo.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi video YouTube'**
  String get addYoutubeVideo;

  /// No description provided for @youtubeLinkHint.
  ///
  /// In it, this message translates to:
  /// **'https://youtu.be/… oppure ID'**
  String get youtubeLinkHint;

  /// No description provided for @category.
  ///
  /// In it, this message translates to:
  /// **'Categoria'**
  String get category;

  /// No description provided for @linkNotRecognized.
  ///
  /// In it, this message translates to:
  /// **'Link YouTube non riconosciuto'**
  String get linkNotRecognized;

  /// No description provided for @addedNoTitle.
  ///
  /// In it, this message translates to:
  /// **'Aggiunto (titolo non disponibile: verifica che sia incorporabile)'**
  String get addedNoTitle;

  /// No description provided for @addedWithTitle.
  ///
  /// In it, this message translates to:
  /// **'Aggiunto: {title}'**
  String addedWithTitle(String title);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
