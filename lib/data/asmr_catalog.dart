import 'package:flutter/material.dart';

import '../models/models.dart';

/// Categorie ASMR. L'ordine è quello mostrato nella griglia.
/// Nomi e descrizioni tradotti: lib/l10n/app_*.arb (chiavi cat*).
const List<AsmrCategory> asmrCategorie = [
  AsmrCategory(
    id: 'bianco',
    icona: Icons.graphic_eq,
    colori: [Color(0xFF2C2F3A), Color(0xFF6B7080)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'barber',
    icona: Icons.content_cut,
    colori: [Color(0xFF3A2A4D), Color(0xFF7A4E8C)],
  ),
  AsmrCategory(
    id: 'casa',
    icona: Icons.cleaning_services,
    colori: [Color(0xFF1E3A4C), Color(0xFF3E7C93)],
  ),
  AsmrCategory(
    id: 'scarpe',
    icona: Icons.brush,
    colori: [Color(0xFF4A2E1E), Color(0xFF9A6B45)],
  ),
  AsmrCategory(
    id: 'fuoco',
    icona: Icons.local_fire_department,
    colori: [Color(0xFF4A1E12), Color(0xFFC2531F)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'pioggia',
    icona: Icons.water_drop,
    colori: [Color(0xFF12283A), Color(0xFF3B6E8F)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'temporale',
    icona: Icons.thunderstorm,
    colori: [Color(0xFF141A2E), Color(0xFF3F4C8A)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'onde',
    icona: Icons.waves,
    colori: [Color(0xFF0A2A3A), Color(0xFF1F7A8C)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'foresta',
    icona: Icons.forest,
    colori: [Color(0xFF0F2E1F), Color(0xFF3D7A4E)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'sussurri',
    icona: Icons.record_voice_over,
    colori: [Color(0xFF2E1F3A), Color(0xFF7A4E7C)],
  ),
  AsmrCategory(
    id: 'tastiera',
    icona: Icons.keyboard,
    colori: [Color(0xFF1F2A2E), Color(0xFF4E7A7C)],
  ),
  AsmrCategory(
    id: 'lofi',
    icona: Icons.radio,
    colori: [Color(0xFF2A1F3A), Color(0xFF8C4E7A)],
    calmante: true,
  ),
];

/// Categoria virtuale per i video aggiunti dall'utente.
const AsmrCategory categoriaMiei = AsmrCategory(
  id: 'miei',
  icona: Icons.playlist_add_check,
  colori: [Color(0xFF2A2A2A), Color(0xFF555555)],
);

/// Video YouTube incorporati (embed ufficiale, nessun download).
/// Tutti gli ID sono stati verificati come embeddabili tramite oEmbed.
const List<AsmrVideo> asmrVideos = [
  // Barber
  AsmrVideo(
    id: 'vmlvi9DjOdg',
    categoriaId: 'barber',
    autore: 'Pandorixs ASMR',
    titolo: LText(
      'Barber Shop: taglio, barba e rasoio per dormire',
      'Barber shop: haircut, beard trim & razor shave for sleep',
    ),
  ),
  AsmrVideo(
    id: 'o65gyb_-rcc',
    categoriaId: 'barber',
    autore: 'Pandorixs ASMR',
    titolo: LText(
      'Barber shop: taglio e rasatura',
      'Barber shop cut and shave',
    ),
  ),
  AsmrVideo(
    id: 'UrmhZiwdqjE',
    categoriaId: 'barber',
    autore: 'Bubs ASMR',
    titolo: LText(
      'Barber Shop 💈 taglio e rasatura (personal attention)',
      'Barber shop 💈 haircut & beard shave (personal attention)',
    ),
  ),
  AsmrVideo(
    id: 'wTCIF6mVtsA',
    categoriaId: 'barber',
    autore: 'Bubs ASMR',
    titolo: LText(
      'Haircut & Shave 💈 roleplay rilassante',
      'Haircut & shave 💈 relaxing barbershop roleplay',
    ),
  ),
  AsmrVideo(
    id: 'DJ6H1n0B_E0',
    categoriaId: 'barber',
    autore: 'Tingting ASMR',
    titolo: LText(
      'Dreamy Barber Shop: rasatura e taglio',
      'Dreamy barber shop: shave and haircut',
    ),
  ),
  AsmrVideo(
    id: 'ge0PywZjSDo',
    categoriaId: 'barber',
    autore: 'ieva ASMR',
    titolo: LText(
      '3 ore di rasoio a mano libera e massaggio, no talking',
      '3h straight razor shave & scalp massage, no talking',
    ),
  ),
  // Clean house
  AsmrVideo(
    id: '0InM0zoNTEg',
    categoriaId: 'casa',
    autore: 'Mandy Flores',
    titolo: LText(
      'Pulizie di casa super soddisfacenti, no talking',
      'Super satisfying house cleaning, no talking',
    ),
  ),
  AsmrVideo(
    id: '1b5XXQia9_k',
    categoriaId: 'casa',
    autore: 'Coline Cleans',
    titolo: LText(
      'Cleaning Home no talking 🧹 clean with me',
      'Cleaning home no talking 🧹 clean with me',
    ),
  ),
  AsmrVideo(
    id: '1D1KngJFU7g',
    categoriaId: 'casa',
    autore: 'Kriss Relax Home',
    titolo: LText(
      'Pulizia della stanza, routine silenziosa',
      'Relaxing room cleaning, quiet home routine',
    ),
  ),
  AsmrVideo(
    id: '7T-_8C4ssVU',
    categoriaId: 'casa',
    autore: 'Hattie Homemaking',
    titolo: LText(
      'Pulisco tutta la casa, time lapse rilassante',
      'Cleaning my whole house, relaxing time lapse',
    ),
  ),
  AsmrVideo(
    id: '7v7UlkQf5Uk',
    categoriaId: 'casa',
    autore: 'Classic ASMR',
    titolo: LText(
      'Pulizie e faccende di casa, no talking',
      'Cleaning and house chores, no talking',
    ),
  ),
  AsmrVideo(
    id: '72iwbGUrEJ8',
    categoriaId: 'casa',
    autore: 'Classic ASMR',
    titolo: LText(
      'Spolverare e spazzare, lo-fi, no talking',
      'Dusting and sweeping, lo-fi, no talking',
    ),
  ),
  // Clean shoes
  AsmrVideo(
    id: 'h94esGEn1Ow',
    categoriaId: 'scarpe',
    autore: 'Shoe Shine Street ASMR',
    titolo: LText(
      'Shoe Shine 😌 pulizia sneakers per dormire',
      'Shoe shine 😌 sneaker cleaning to fall asleep',
    ),
  ),
  AsmrVideo(
    id: 'iAlYg7kjAv0',
    categoriaId: 'scarpe',
    autore: "Peter's ShoeRevive",
    titolo: LText(
      'Scarpe vecchie: pulizia e lucidatura a specchio',
      'Old shoes: cleaning and mirror shine',
    ),
  ),
  AsmrVideo(
    id: 'whO5PFcYVJE',
    categoriaId: 'scarpe',
    autore: 'Shoe Shine & Revival',
    titolo: LText(
      'Restauro scarpe: pulizia profonda e lucido',
      'Shoe restoration: deep cleaning & high gloss shine',
    ),
  ),
  AsmrVideo(
    id: 'bcqWCe54Y7Y',
    categoriaId: 'scarpe',
    autore: 'Jason Dornstar',
    titolo: LText(
      'La lucidatura di scarpe più raffinata: picking, scraping, brushing',
      "World's finest shoe shine: picking, scraping, brushing",
    ),
  ),
  AsmrVideo(
    id: 's_OeDGV6Wb4',
    categoriaId: 'scarpe',
    autore: "Peter's ShoeRevive",
    titolo: LText(
      'Extreme shoe shine, suoni rilassanti',
      'Extreme shoe shine, relaxing sounds',
    ),
  ),
  AsmrVideo(
    id: 'sZFIZwcH5cs',
    categoriaId: 'scarpe',
    autore: "Peter's ShoeRevive",
    titolo: LText(
      'Mirror shine e pulizia dettagliata',
      'Ultimate mirror shine and detailed cleaning',
    ),
  ),
  AsmrVideo(
    id: 'dKFp4Ylop1U',
    categoriaId: 'scarpe',
    autore: "Peter's ShoeRevive",
    titolo: LText(
      'Lucidatura e restauro stivali in pelle',
      'Shoe shining & leather boot restoration',
    ),
  ),
  // Rumore bianco
  AsmrVideo(
    id: 'XR3yzT4PTXs',
    categoriaId: 'bianco',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Rumore bianco per dormire, 10 ore, schermo nero',
      'White noise for sleeping, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'nMfPqeZjc2c',
    categoriaId: 'bianco',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'White noise, schermo nero: sonno, studio, focus',
      'White noise, black screen: sleep, study, focus',
    ),
  ),
  AsmrVideo(
    id: 'Og40mpl8VNc',
    categoriaId: 'bianco',
    autore: "Let's Find Out",
    titolo: LText(
      'Rumore bianco morbido, 10 ore, no ads',
      'Soft white noise, 10 hours, no ads',
    ),
  ),
  AsmrVideo(
    id: '_v0L-WbuJoE',
    categoriaId: 'bianco',
    autore: 'SottoDreams',
    titolo: LText(
      'Brown noise profondo, 10 ore, schermo nero',
      'Deep brown noise, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'n3YSh6Z8qeY',
    categoriaId: 'bianco',
    autore: 'Cat Trumpet',
    titolo: LText(
      'Brown noise, 10 ore: relax e acufeni',
      'Brown noise, 10 hours: relaxation & tinnitus relief',
    ),
  ),
  AsmrVideo(
    id: 'E1bbH03JhKA',
    categoriaId: 'bianco',
    autore: 'NeuroscIQ',
    titolo: LText('10 ore di rumore bianco', '10 hours of white noise'),
  ),
  // Fuoco
  AsmrVideo(
    id: 'Hvtc9BWahMQ',
    categoriaId: 'fuoco',
    autore: 'Fireplace 4K',
    titolo: LText(
      'Camino 4K, 10 ore di fuoco che scoppietta',
      'Fireplace 4K, 10 hours of crackling fire',
    ),
  ),
  AsmrVideo(
    id: '6VB4bgiB0yA',
    categoriaId: 'fuoco',
    autore: 'Fireplace 4K',
    titolo: LText(
      'Camino rilassante, ceppi che bruciano, 10 ore',
      'Relaxing fireplace, burning logs, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'wp2GVCZgpPE',
    categoriaId: 'fuoco',
    autore: 'Relax with TV Backgrounds',
    titolo: LText(
      'Cozy fire crackling, 10 ore, senza musica',
      'Cozy fire crackling, 10 hours, no music',
    ),
  ),
  AsmrVideo(
    id: 'rWO4CVxOJcs',
    categoriaId: 'fuoco',
    autore: 'Juicy fire',
    titolo: LText(
      'Camino 4K, 10 ore per dormire e studiare',
      'Fireplace 4K, 10 hours for sleep & study',
    ),
  ),
  AsmrVideo(
    id: 'EiwLa7pGy5Q',
    categoriaId: 'fuoco',
    autore: 'Zolaq Fireplace Ambience 4K',
    titolo: LText(
      'Camino in baita, 10 ore di scoppiettio',
      'Cozy cabin fireplace, 10 hours of crackling',
    ),
  ),
  // Pioggia
  AsmrVideo(
    id: 'c1XOgrBz6sU',
    categoriaId: 'pioggia',
    autore: 'The Relaxed Guy',
    titolo: LText(
      'Pioggia gentile sulla finestra, 10 ore, schermo nero',
      'Gentle rain on window, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'aqZnwSNrNK4',
    categoriaId: 'pioggia',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Pioggia sulla finestra, senza tuoni, 10 ore',
      'Rain on window, no thunder, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'p7Mbl-SqVEU',
    categoriaId: 'pioggia',
    autore: 'Nightfall Ambient',
    titolo: LText(
      'Rain on window, 10 ore di ambience per dormire',
      'Rain on window, 10 hours of sleep ambience',
    ),
  ),
  AsmrVideo(
    id: 'blVKVI-AphI',
    categoriaId: 'pioggia',
    autore: 'Nature Soundzzz',
    titolo: LText(
      'Pioggia gentile, schermo nero dopo 5 minuti',
      'Gentle rain, black screen after 5 minutes',
    ),
  ),
  AsmrVideo(
    id: 'P3Wg0QKsb-M',
    categoriaId: 'pioggia',
    autore: 'smilemedia',
    titolo: LText(
      '🌧️ Pioggia sulla finestra, schermo scuro, 10 ore',
      '🌧️ Rain on window, dark screen, 10 hours',
    ),
  ),
  // Temporale
  AsmrVideo(
    id: '3RMqRC5fzd0',
    categoriaId: 'temporale',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Pioggia e tuoni per dormire, 10 ore',
      'Rain and thunder for sleeping, 10 hours',
    ),
  ),
  AsmrVideo(
    id: '73RTs236cII',
    categoriaId: 'temporale',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Temporale nella foresta pluviale, 10 ore',
      'Rainforest thunderstorm, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'ekXFslHOvZ8',
    categoriaId: 'temporale',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Pioggia e tuoni, 10 ore: sonno, studio, relax',
      'Rain & thunder, 10 hours: sleep, study, relax',
    ),
  ),
  AsmrVideo(
    id: 'BSmYxnvUDHw',
    categoriaId: 'temporale',
    autore: 'New Bliss',
    titolo: LText(
      'Pioggia e tuoni lontani, sonno profondo, 4K',
      'Rain and distant thunder, deep sleep, 4K',
    ),
  ),
  AsmrVideo(
    id: 'AIjwrIdtlRg',
    categoriaId: 'temporale',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Dormi con tuoni e pioggia, 10 ore',
      'Sleep to thunder & rain, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'nDq6TstdEi8',
    categoriaId: 'temporale',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Epic thunder & rain, 10 ore',
      'Epic thunder & rain, 10 hours',
    ),
  ),
  // Onde
  AsmrVideo(
    id: 'SfqQNf-tkYM',
    categoriaId: 'onde',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Onde del mare per dormire, 10 ore',
      'Ocean waves for sleeping, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'iEy9BXGs2R4',
    categoriaId: 'onde',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Onde di notte, sonno profondo, 10 ore',
      'Nighttime ocean waves, deep sleep, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'JekUNGo-RVk',
    categoriaId: 'onde',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Onde come rumore bianco, 10 ore',
      'Ocean waves as white noise, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'uY7l_4unbnE',
    categoriaId: 'onde',
    autore: 'Christopher Lloyd Clarke',
    titolo: LText(
      'Onde sognanti, 10 ore di relax',
      'Dreamy ocean waves, 10 hours of relaxation',
    ),
  ),
  AsmrVideo(
    id: '5qBu4cgpdzk',
    categoriaId: 'onde',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Ocean waves sleep sounds, 10 ore',
      'Ocean waves sleep sounds, 10 hours',
    ),
  ),
  // Foresta
  AsmrVideo(
    id: 'bN6PNAN3ZCc',
    categoriaId: 'foresta',
    autore: 'TopRelaxMusic',
    titolo: LText(
      'Foresta in primavera, uccellini, 10 ore',
      'Spring forest, birds singing, 10 hours',
    ),
  ),
  AsmrVideo(
    id: '2cLQjwf4Y9g',
    categoriaId: 'foresta',
    autore: 'ZenScape',
    titolo: LText(
      'Foresta tranquilla con canto degli uccelli, 4K',
      'Peaceful forest with birdsong, 4K',
    ),
  ),
  AsmrVideo(
    id: '1N-ytsA_p8s',
    categoriaId: 'foresta',
    autore: 'Nature Forest Ambience',
    titolo: LText(
      'Ruscello, uccelli e grilli, 10 ore',
      'Forest stream, birds and crickets, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'GJpZ3ExYmWs',
    categoriaId: 'foresta',
    autore: 'Fobos Relax',
    titolo: LText(
      'Forest ambience 4K, uccelli e acqua, 10 ore',
      'Forest ambience 4K, birds and water, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'EHklxmBvzwc',
    categoriaId: 'foresta',
    autore: 'TheSilentWatcher',
    titolo: LText(
      'La foresta che canta, 10 ore in tempo reale',
      'The singing forest, 10 hours in real time',
    ),
  ),
  AsmrVideo(
    id: 'xuu1pBvCkz0',
    categoriaId: 'foresta',
    autore: 'Overtone Ambient',
    titolo: LText(
      'Suoni della foresta: uccelli, insetti, grilli',
      'Forest sounds: birds, insects, crickets',
    ),
  ),
  // Sussurri ITA
  AsmrVideo(
    id: 'VVNi37Snjcc',
    categoriaId: 'sussurri',
    autore: 'EL ASMR',
    titolo: LText(
      'Sussurri intensi per dormire 💤',
      'Intense Italian whispers for sleep 💤',
    ),
  ),
  AsmrVideo(
    id: '1xpEtlWUBCk',
    categoriaId: 'sussurri',
    autore: 'AppleTingles ASMR',
    titolo: LText(
      'Per quando hai davvero bisogno di dormire',
      'For when you really need to sleep (ITA)',
    ),
  ),
  AsmrVideo(
    id: 'w8wcasN20lM',
    categoriaId: 'sussurri',
    autore: 'ari asmr',
    titolo: LText(
      'Chiacchiere notturne e sussurri per addormentarti',
      'Night-time chatter and whispers to fall asleep (ITA)',
    ),
  ),
  AsmrVideo(
    id: 'tn4fh0v8h6U',
    categoriaId: 'sussurri',
    autore: 'AppleTingles ASMR',
    titolo: LText(
      'Il video che ti farà dormire prima della fine',
      'The video that puts you to sleep before the end (ITA)',
    ),
  ),
  AsmrVideo(
    id: '5AVY41g_TfA',
    categoriaId: 'sussurri',
    autore: 'WelshASMR82_Italian',
    titolo: LText(
      'Sussurri lenti per dormire, lavorare o studiare',
      'Slow whispers to sleep, work or study (ITA)',
    ),
  ),
  AsmrVideo(
    id: 'BIIWByin6BI',
    categoriaId: 'sussurri',
    autore: 'AppleTingles ASMR',
    titolo: LText(
      'Per chi ha bisogno di dormire subito',
      'For those who need to sleep right now (ITA)',
    ),
  ),
  // Tastiera & tapping
  AsmrVideo(
    id: 'hO3gC7kEC3E',
    categoriaId: 'tastiera',
    autore: 'Ana Aster ASMR',
    titolo: LText(
      'Digitazione su 5 tastiere, no talking',
      'Typing on 5 keyboards, no talking',
    ),
  ),
  AsmrVideo(
    id: 'jFRNUtEmUn0',
    categoriaId: 'tastiera',
    autore: 'Ana Aster ASMR',
    titolo: LText(
      '4 tastiere diverse per dormire, no talking',
      '4 different keyboards for sleep, no talking',
    ),
  ),
  AsmrVideo(
    id: '43Sw9MkTi_M',
    categoriaId: 'tastiera',
    autore: 'Aismr glow',
    titolo: LText(
      'Tastiera con ambience di foresta, no talking',
      'Keyboard typing with forest ambience, no talking',
    ),
  ),
  AsmrVideo(
    id: 'YXIS3_kg8IQ',
    categoriaId: 'tastiera',
    autore: 'Voxil',
    titolo: LText(
      'Tastiera meccanica per studiare, 20 min',
      'Mechanical keyboard for studying, 20 min',
    ),
  ),
  AsmrVideo(
    id: 'Pa8FO9P-oLE',
    categoriaId: 'tastiera',
    autore: "Jojo's ASMR",
    titolo: LText(
      'Tastiere dal suono celestiale, no talking',
      'Keyboards that sound heavenly, no talking',
    ),
  ),
  // Lo-fi
  AsmrVideo(
    id: 'jfKfPfyJRdk',
    categoriaId: 'lofi',
    autore: 'Lofi Girl',
    titolo: LText(
      'lofi hip hop radio 📚 beats to relax/study to',
      'lofi hip hop radio 📚 beats to relax/study to',
    ),
  ),
  AsmrVideo(
    id: 'rUxyKA_-grg',
    categoriaId: 'lofi',
    autore: 'Lofi Girl',
    titolo: LText(
      'lofi hip hop radio 💤 beats to sleep/chill to',
      'lofi hip hop radio 💤 beats to sleep/chill to',
    ),
  ),
  AsmrVideo(
    id: '4xDzrJKXOOY',
    categoriaId: 'lofi',
    autore: 'Lofi Girl',
    titolo: LText(
      'synthwave radio 🌌 beats to chill/game to',
      'synthwave radio 🌌 beats to chill/game to',
    ),
  ),
];

AsmrCategory categoriaById(String id) =>
    asmrCategorie.firstWhere((c) => c.id == id, orElse: () => categoriaMiei);

List<AsmrVideo> videoDiCategoria(String id) =>
    asmrVideos.where((v) => v.categoriaId == id).toList();
