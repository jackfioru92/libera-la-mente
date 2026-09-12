// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Libera la Mente';

  @override
  String get tabToday => 'Today';

  @override
  String get tabBreathe => 'Breathe';

  @override
  String get tabListen => 'Listen';

  @override
  String get tabOasis => 'Oasis';

  @override
  String get greetingNight => 'Good night';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get howDoYouFeel => 'How are you feeling?';

  @override
  String get quickStart => 'Switch off the mind';

  @override
  String get quickStartHint =>
      'One tap: a scene, box breathing and a random sound.';

  @override
  String get moodAnxious => 'Anxious';

  @override
  String get moodSleepless => 'Sleepless';

  @override
  String get moodOverloaded => 'Overloaded';

  @override
  String get moodRestless => 'Restless';

  @override
  String get moodLow => 'Feeling low';

  @override
  String get moodDistracted => 'Distracted';

  @override
  String get pillSave => 'Save';

  @override
  String get pillUnsave => 'Remove from saved';

  @override
  String get pillCopy => 'Copy';

  @override
  String get pillCopied => 'Pill copied';

  @override
  String get pillAnother => 'Another';

  @override
  String inspiredBy(String source) {
    return 'Inspired by $source';
  }

  @override
  String get yourPill => 'Your pill';

  @override
  String get phaseInhale => 'Inhale';

  @override
  String get phaseHold => 'Hold';

  @override
  String get phaseExhale => 'Exhale';

  @override
  String get ready => 'Ready';

  @override
  String get labelSide => 'Side';

  @override
  String get labelMinutes => 'Minutes';

  @override
  String secondsShort(int n) {
    return '$n s';
  }

  @override
  String get noTimeLimit => 'No time limit';

  @override
  String sessionOf(int minutes) {
    return '$minutes min session';
  }

  @override
  String cycleElapsed(int cycle, String time) {
    return 'Cycle $cycle · $time';
  }

  @override
  String cycleRemaining(int cycle, String time) {
    return 'Cycle $cycle · $time left';
  }

  @override
  String get sessionCompletedTitle => 'Session complete';

  @override
  String sessionCompletedBody(int cycles, int minutes) {
    return '$cycles cycles in $minutes min.\nStay with this breath a moment longer.';
  }

  @override
  String get thanks => 'Thanks';

  @override
  String get soundButton => 'Sound';

  @override
  String get start => 'Start';

  @override
  String get stop => 'Stop';

  @override
  String get listenSubtitle =>
      'ASMR sounds from YouTube, sorted by category. They keep playing while you breathe.';

  @override
  String videoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count videos',
      one: '1 video',
    );
    return '$_temp0';
  }

  @override
  String get noVideosHere => 'No videos here.';

  @override
  String get removeVideoTitle => 'Remove this video?';

  @override
  String get cancel => 'Cancel';

  @override
  String get remove => 'Remove';

  @override
  String get chooseSound => 'Pick a sound';

  @override
  String get favAdd => 'Add to favourites';

  @override
  String get favRemove => 'Remove from favourites';

  @override
  String get catBarber => 'ASMR Barber';

  @override
  String get catBarberDesc => 'Scissors, razor, shaving brush';

  @override
  String get catHouse => 'ASMR House cleaning';

  @override
  String get catHouseDesc => 'Brushes, sponges, chores in silence';

  @override
  String get catShoes => 'ASMR Shoe care';

  @override
  String get catShoesDesc => 'Shoe shining and restoration';

  @override
  String get catWhite => 'White noise';

  @override
  String get catWhiteDesc => 'White and brown: they mask everything';

  @override
  String get catFire => 'Crackling fire';

  @override
  String get catFireDesc => 'A lit fireplace, logs crackling';

  @override
  String get catRain => 'Rain';

  @override
  String get catRainDesc => 'Rain on the window, no thunder';

  @override
  String get catStorm => 'Thunderstorm';

  @override
  String get catStormDesc => 'Rain and distant thunder';

  @override
  String get catWaves => 'Ocean waves';

  @override
  String get catWavesDesc => 'The sea at night, slow and steady';

  @override
  String get catForest => 'Forest';

  @override
  String get catForestDesc => 'Birds, streams, wind in the leaves';

  @override
  String get catWhispers => 'Whispers (ITA)';

  @override
  String get catWhispersDesc => 'Italian whispering for sleep';

  @override
  String get catKeyboard => 'Keyboard & tapping';

  @override
  String get catKeyboardDesc => 'Mechanical keys, slow tapping';

  @override
  String get catLofi => 'Lo-fi radio';

  @override
  String get catLofiDesc => 'Slow beats to study or sleep to';

  @override
  String get catMine => 'My videos';

  @override
  String get catMineDesc => 'YouTube links you added';

  @override
  String get sceneDawn => 'Slow dawn';

  @override
  String get sceneRain => 'Rain on the window';

  @override
  String get sceneForest => 'Forest in the mist';

  @override
  String get sceneNight => 'Starry night';

  @override
  String get sceneOcean => 'Calm ocean';

  @override
  String get sceneLavender => 'Lavender field';

  @override
  String get sceneColors => 'Colours';

  @override
  String get scenePhoto => 'Photo';

  @override
  String sleepsIn(String time) {
    return 'Stops in $time';
  }

  @override
  String minutesShort(int n) {
    return '$n min';
  }

  @override
  String get sleepTimerTooltip => 'Sleep timer';

  @override
  String get sleepOff => 'Off';

  @override
  String nMinutes(int n) {
    return '$n minutes';
  }

  @override
  String get oneHour => '1 hour';

  @override
  String get oneHourHalf => '1½ hours';

  @override
  String get close => 'Close';

  @override
  String get oasisTitle => 'My Oasis';

  @override
  String get statSessions => 'sessions';

  @override
  String get statMinutes => 'minutes';

  @override
  String get statStreak => 'day streak';

  @override
  String get savedPills => 'Saved pills';

  @override
  String get savedPillsHint => 'Tap the heart on a pill to find it here.';

  @override
  String get myPills => 'My pills';

  @override
  String get add => 'Add';

  @override
  String get myPillsHint =>
      'Write a line of your own or a quote from a book you love: it joins the \"Another\" rotation.';

  @override
  String get favSounds => 'Favourite sounds';

  @override
  String get favSoundsHint => 'Sounds you hearted show up here.';

  @override
  String get myVideos => 'My videos';

  @override
  String get addLink => 'Add link';

  @override
  String get myVideosHint =>
      'Paste a YouTube link: the video joins the library and the sound picker on the Breathe screen.';

  @override
  String get sleepTimer => 'Sleep timer';

  @override
  String get sleepTimerHint =>
      'When you start a sound, it stops by itself after this long.';

  @override
  String get favScene => 'Favourite scene';

  @override
  String get vibration => 'Vibration';

  @override
  String get vibrationTitle => 'A tap at each phase change';

  @override
  String get vibrationSubtitle => 'So you can breathe with your eyes closed.';

  @override
  String get voiceGuide => 'Voice guide';

  @override
  String get voiceGuideTitle => 'Says each phase out loud';

  @override
  String get voiceGuideSubtitle =>
      'Inhale, hold, exhale: no need to look at the screen.';

  @override
  String get voiceOn => 'Voice guide on';

  @override
  String get voiceOff => 'Voice guide off';

  @override
  String get chooseVoice => 'Choose the voice';

  @override
  String get voiceAuto => 'Automatic (best on this phone)';

  @override
  String get voiceQualityPremium => 'Premium';

  @override
  String get voiceQualityEnhanced => 'Enhanced';

  @override
  String get voiceQualityBase => 'Basic';

  @override
  String get voiceHintIos =>
      'More natural voices: Settings › Accessibility › Spoken Content › Voices › English, download a Premium or Enhanced voice.';

  @override
  String get voiceHintAndroid =>
      'More natural voices: Settings › System › Languages › Text-to-speech › Google, download the high-quality voice.';

  @override
  String get voiceNone => 'No voice found for this language.';

  @override
  String get voiceClipsInUse =>
      'In use: recorded voice (clips bundled with the app). The system voices below are only used for phrases without a clip.';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System';

  @override
  String get info => 'About';

  @override
  String get infoText =>
      'Libera la Mente is free, with no account and no ads. No data leaves your phone.\n\nSounds are YouTube videos embedded with the official player: they remain the property of their creators. Pills marked \"inspired by\" paraphrase the ideas of the books cited; they are not verbatim quotes.';

  @override
  String get buyMeCoffee => 'Buy me a coffee';

  @override
  String get donateHint =>
      'If the app helps you, a coffee helps me keep it free and ad-free.';

  @override
  String get contactMe => 'Write to me';

  @override
  String get newPill => 'New pill';

  @override
  String get pillTextHint => 'The text of the pill';

  @override
  String get pillSourceHint => 'Source (optional): book, author…';

  @override
  String get save => 'Save';

  @override
  String get addYoutubeVideo => 'Add YouTube video';

  @override
  String get youtubeLinkHint => 'https://youtu.be/… or an ID';

  @override
  String get category => 'Category';

  @override
  String get linkNotRecognized => 'YouTube link not recognised';

  @override
  String get addedNoTitle =>
      'Added (title unavailable: check that the video can be embedded)';

  @override
  String addedWithTitle(String title) {
    return 'Added: $title';
  }
}
