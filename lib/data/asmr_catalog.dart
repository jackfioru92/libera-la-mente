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
    id: 'giappone',
    icona: Icons.spa,
    colori: [Color(0xFF3A1F2E), Color(0xFF8C4E5E)],
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
    id: 'grilli',
    icona: Icons.nightlight_round,
    colori: [Color(0xFF14261E), Color(0xFF3E6A4A)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'treno',
    icona: Icons.train,
    colori: [Color(0xFF22262E), Color(0xFF5A6478)],
    calmante: true,
  ),
  AsmrCategory(
    id: 'pagine',
    icona: Icons.menu_book,
    colori: [Color(0xFF3A2E1E), Color(0xFF8A6A3E)],
  ),
  AsmrCategory(
    id: 'gatto',
    icona: Icons.pets,
    colori: [Color(0xFF2E2A3A), Color(0xFF7A6A8C)],
    calmante: true,
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
  // Barber: solo forbici (i preferiti dell'autore in cima)
  AsmrVideo(
    id: 'kugOo5WllEk',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText(
      'Taglio uomo solo forbici, 3 ore',
      'Men\'s haircut with scissors only, 3 hours',
    ),
  ),
  AsmrVideo(
    id: 'se-qWTTad8I',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText('Taglio uomo, 3 ore', 'Men\'s haircut, 3 hours'),
  ),
  AsmrVideo(
    id: '00hKOxcuBb0',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText(
      'Forbici sfoltitrici, 1 ora',
      'Thinning scissors haircut, 1 hour',
    ),
  ),
  AsmrVideo(
    id: 'hKhGNzVRA28',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText(
      'Taglio a forbice "shingling", 1 ora',
      'Shingling scissors haircut, 1 hour',
    ),
  ),
  AsmrVideo(
    id: 'rGRNVy2ylKw',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText('Forbici + pioggia', 'Scissors haircut + rain sound'),
  ),
  AsmrVideo(
    id: 'cDaMksWkt3w',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText(
      'Taglio uomo di SWITCHSCISSORS',
      'SWITCHSCISSORS\' men\'s haircut',
    ),
  ),
  AsmrVideo(
    id: 'WpAaK3ShK3w',
    categoriaId: 'barber',
    autore: 'SWITCHSCISSORS',
    titolo: LText('Taglio uomo, solo forbici', 'Men\'s haircut, scissors'),
  ),
  AsmrVideo(
    id: 'yIBc4AbkN9w',
    categoriaId: 'barber',
    autore: 'CalmCuts',
    titolo: LText(
      'Solo forbici, 1 ora, no talking (parte 1)',
      'Scissors only, 1 hour, no talking (part 1)',
    ),
  ),
  AsmrVideo(
    id: 'xqoEALKAIG8',
    categoriaId: 'barber',
    autore: 'CalmCuts',
    titolo: LText(
      'Solo forbici, 1 ora, no talking (parte 2)',
      'Scissors only, 1 hour, no talking (part 2)',
    ),
  ),
  AsmrVideo(
    id: '8WGC7PvqZjg',
    categoriaId: 'barber',
    autore: 'CalmCuts',
    titolo: LText(
      'Textured crop, solo forbici, no talking',
      'Textured crop haircut, scissors only, no talking',
    ),
  ),
  AsmrVideo(
    id: 'M5P07dkqIUk',
    categoriaId: 'barber',
    autore: 'Hair Hood',
    titolo: LText(
      'Taglio a forbice rilassante, sonno immediato',
      'Relaxing scissor haircut, instant sleep',
    ),
  ),
  AsmrVideo(
    id: 'i5tFNI6_mSw',
    categoriaId: 'barber',
    autore: 'Tonyy Asmr',
    titolo: LText(
      'Forbici e suoni da barbiere in stereo, no talking',
      'Scissors & barbershop sounds in stereo, no talking',
    ),
  ),
  AsmrVideo(
    id: 'S17mHuZQ968',
    categoriaId: 'barber',
    autore: 'ASMR Den',
    titolo: LText(
      '1 ora di suoni da barbiere, senza pubblicità in mezzo',
      '1 hour of barbershop sounds, no mid-roll ads',
    ),
  ),
  // Barbiere giapponese
  AsmrVideo(
    id: 'PVWrdXzJBqg',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'La vecchia scuola del barbiere tradizionale giapponese',
      'How old-school barbering is meant to be done, traditional Japan',
    ),
  ),
  AsmrVideo(
    id: 'HJ_A6cBKCjo',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Vecchia scuola con le forbici: taglio classico e rasoio',
      'Old-school barbering with scissors: classic haircut & straight razor',
    ),
  ),
  AsmrVideo(
    id: 'HWpkXVmsJrM',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Solo forbici dal barbiere tradizionale giapponese',
      'Scissors-only haircut by a traditional Japanese barber',
    ),
  ),
  AsmrVideo(
    id: 'px8wwnOJPSI',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Taglio e rasatura in una bottega su misura a Tokyo, no talking',
      'Haircut & shave at a bespoke barber in Tokyo, no talking',
    ),
  ),
  AsmrVideo(
    id: 'bvvTIsoviQI',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Barbiera giapponese: taglio, barba e massaggio a Tokyo',
      'Japanese female barber: haircut, shave & massage in Tokyo',
    ),
  ),
  AsmrVideo(
    id: 'S-BSLjv50wc',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Barbiere veterano: taglio, shampoo e massaggio',
      'Veteran barber: traditional haircut, shampoo & massage',
    ),
  ),
  AsmrVideo(
    id: 'kWQzJ9htbpo',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Servizio completo: taglio, shampoo, rasatura e massaggio',
      'Full service: haircut, shampoo, shave & massage',
    ),
  ),
  AsmrVideo(
    id: 'Rxl1-tisAls',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Ha fatto tutto: taglio, rasatura, massaggio',
      'He did everything: haircut, shave, massage',
    ),
  ),
  AsmrVideo(
    id: '3a5xFfX9O8w',
    categoriaId: 'giappone',
    autore: 'Yes Plz ASMR',
    titolo: LText(
      'Lei ha fatto tutto: servizio completo dal barbiere',
      'She did everything: full barbering service',
    ),
  ),
  AsmrVideo(
    id: 'fI5a3V1G4aQ',
    categoriaId: 'giappone',
    autore: 'Nomad Barber',
    titolo: LText(
      'Taglio e rasatura in una barberia giapponese di 105 anni',
      'Haircut & shave at a 105-year-old Japanese barbershop',
    ),
  ),
  AsmrVideo(
    id: 'PLna-heet9Y',
    categoriaId: 'giappone',
    autore: 'Svetlana Yuminova',
    titolo: LText(
      'Rasatura tradizionale in POV: schiuma densa e rasoio',
      'Traditional shave POV: thick foam & sharp razor, no talking',
    ),
  ),
  // Clean shoes: Angelo Shoe Shine
  AsmrVideo(
    id: 'RwDf-2Wuclw',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText('Restauro completo', 'Full restoration'),
  ),
  AsmrVideo(
    id: 'fHOcD2HiYZA',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Restauro totale: da vecchie a nuove',
      'Total restoration: old to new',
    ),
  ),
  AsmrVideo(
    id: 'y7x0teONz94',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Il restauro di stivali più soddisfacente',
      'The most satisfying boot restoration',
    ),
  ),
  AsmrVideo(
    id: 'ytVrWKagDJQ',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Il miglior restauro di stivali',
      'The best boot restoration',
    ),
  ),
  AsmrVideo(
    id: 'iBpByL7neok',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Restauro di stivali, il migliore in assoluto',
      'The very best boot restoration',
    ),
  ),
  AsmrVideo(
    id: 'Y3rrclN8ybA',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Stivali distrutti, restaurati',
      'Destroyed boot restoration',
    ),
  ),
  AsmrVideo(
    id: 'tugo7rkNUE8',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText('Un restauro incredibile', 'Unbelievable restoration'),
  ),
  AsmrVideo(
    id: 'CgDR2j0gq1g',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText('Restauro di vecchi stivali', 'Old boot restoration'),
  ),
  AsmrVideo(
    id: '3-MI3Zw0n9k',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Stivali vecchi e opachi, restaurati',
      'Old and dull boot restoration',
    ),
  ),
  AsmrVideo(
    id: '8Y7uHaU-nl8',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Restaurare stivali per rilassarsi',
      'Restoring your boots for relaxation',
    ),
  ),
  AsmrVideo(
    id: 'IcB5Mdl3qTg',
    categoriaId: 'scarpe',
    autore: 'Angelo Shoe Shine',
    titolo: LText(
      'Stivali vecchi e secchi, restaurati',
      'Restoring old and dry boots',
    ),
  ),
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
  // Barber (2)
  AsmrVideo(
    id: 'd2Sz4h3xLq0',
    categoriaId: 'barber',
    autore: 'ASMR Treasury',
    titolo: LText(
      'Barbershop: veri suoni di tosatrice, no talking',
      'Barbershop: real clipper sounds, no talking',
    ),
  ),
  AsmrVideo(
    id: 'b1w75CSRc8M',
    categoriaId: 'barber',
    autore: 'Crisp Cuts ASMR',
    titolo: LText(
      'Taglio ultra rilassante: massaggio, forbici, rasoio',
      'Ultra-relaxing haircut: scalp massage, scissors, razor',
    ),
  ),
  AsmrVideo(
    id: 'BUJ_mwBUgy0',
    categoriaId: 'barber',
    autore: 'DoubleCut Twins ASMR',
    titolo: LText(
      'Taper haircut ✂️ veri suoni da barbiere, no talking',
      'Taper haircut ✂️ real barber sounds, no talking',
    ),
  ),
  AsmrVideo(
    id: '-1DOOYKTsEo',
    categoriaId: 'barber',
    autore: 'HooligansASMR',
    titolo: LText(
      '💈 Taglio rilassante dal barbiere, no talking',
      '💈 Relaxing barber shop haircut, no talking',
    ),
  ),
  AsmrVideo(
    id: 'kHfA6gzOeq0',
    categoriaId: 'barber',
    autore: 'Hermes ASMR',
    titolo: LText(
      'Barber ASMR no talking: tapping e taglio',
      'Barber ASMR no talking: tapping and cutting',
    ),
  ),
  AsmrVideo(
    id: 'sTR5J6w0TA0',
    categoriaId: 'barber',
    autore: 'ASMR Den',
    titolo: LText(
      '1 ora di suoni da barbiere, no talking, stereo',
      '1 hour of barbershop sounds, no talking, stereo',
    ),
  ),
  AsmrVideo(
    id: 'JEbhH8u_CYg',
    categoriaId: 'barber',
    autore: 'Alex Barber ASMR',
    titolo: LText(
      'Servizio completo: taglio, barba e lavaggio',
      'Full barber service: haircut, beard trim & hair wash',
    ),
  ),
  // Clean house (2)
  AsmrVideo(
    id: 'FSnoyOQJ4YE',
    categoriaId: 'casa',
    autore: "Rebecca's Beautiful ASMR Addiction",
    titolo: LText(
      'Extreme clean, no talking: spolverare, spruzzare, lucidare',
      'Extreme clean, no talking: wiping, dusting, polishing',
    ),
  ),
  AsmrVideo(
    id: 'I2Bmtu02VeI',
    categoriaId: 'casa',
    autore: 'Vacuuming and Cleaning Tips',
    titolo: LText(
      'Pulizia del bagno con tanti suoni di sapone',
      'Bathroom cleaning with lots of soapy sounds',
    ),
  ),
  AsmrVideo(
    id: 'X7ThJIA-Ffc',
    categoriaId: 'casa',
    autore: 'Vacuum Vibe',
    titolo: LText(
      'Battiscopa e legno: suoni di panno, no talking',
      'Baseboard & woodwork wiping sounds, no talking',
    ),
  ),
  AsmrVideo(
    id: 'RA8DHqSzMqA',
    categoriaId: 'casa',
    autore: "Rebecca's Beautiful ASMR Addiction",
    titolo: LText(
      'Spolverare e pulire: spray, panno, spazzola',
      'Dusting & cleaning: spray cans, wiping, brushing',
    ),
  ),
  // Clean shoes (2)
  AsmrVideo(
    id: 'ctw7h0xRZmU',
    categoriaId: 'scarpe',
    autore: "Peter's ShoeRevive",
    titolo: LText('Pure shoe shine, no talking', 'Pure shoe shine, no talking'),
  ),
  AsmrVideo(
    id: 'ZBqMqmx5MaY',
    categoriaId: 'scarpe',
    autore: 'Paul - The Guy From Vienna',
    titolo: LText(
      'Come pulire gli stivali, passo passo, no talking',
      'How to clean boots, step by step, no talking',
    ),
  ),
  AsmrVideo(
    id: 'fgGcY9QcH20',
    categoriaId: 'scarpe',
    autore: 'wiping stuff ASMR',
    titolo: LText(
      'Pulizia e lucidatura delle scarpe da lavoro',
      'Cleaning & polishing my work shoes',
    ),
  ),
  AsmrVideo(
    id: 'cGgR7BADuQE',
    categoriaId: 'scarpe',
    autore: 'DDAKS Shoe shine ASMR',
    titolo: LText(
      'Stivali militari: 1 ora di pulizia e lucidatura',
      'Military boot shine: 1 hour of cleaning & polishing',
    ),
  ),
  AsmrVideo(
    id: '0M6JL8SnHFA',
    categoriaId: 'scarpe',
    autore: 'TALIA SHINNE REVIVAL',
    titolo: LText(
      'Scarpe in pelle: puro restauro, no talking',
      'Leather shoe cleaning: pure restoration sounds',
    ),
  ),
  AsmrVideo(
    id: 'MAhoi0c-ulg',
    categoriaId: 'scarpe',
    autore: 'TALIA SHINNE REVIVAL',
    titolo: LText(
      'Ti addormenterai prima che la scarpa sia pulita 😴',
      "You'll be asleep before this shoe is clean 😴",
    ),
  ),
  AsmrVideo(
    id: 'vQFnFa7AU1Q',
    categoriaId: 'scarpe',
    autore: "Peter's ShoeRevive",
    titolo: LText(
      'Da sporche a specchio: restauro completo',
      'Dirty to mirror shine: full restoration',
    ),
  ),
  // Sussurri ITA (2)
  AsmrVideo(
    id: '3pw42RT9_yA',
    categoriaId: 'sussurri',
    autore: 'EL ASMR Ita',
    titolo: LText(
      'Per un sonno profondo 💤 sussurri, tongue clicking, tapping',
      'Deep sleep 💤 whispers, tongue clicking, tapping (ITA)',
    ),
  ),
  AsmrVideo(
    id: 'czRObEiv3uY',
    categoriaId: 'sussurri',
    autore: 'Ale ASMR Therapy',
    titolo: LText(
      'Sussurri e carezze sul viso per dormire subito',
      'Whispers and face touching to fall asleep fast (ITA)',
    ),
  ),
  AsmrVideo(
    id: '3wmEChnF4dY',
    categoriaId: 'sussurri',
    autore: 'Carlotta ASMR',
    titolo: LText(
      'Sussurri intensi per te, 45 minuti di relax',
      'Intense whispers for you, 45 minutes of relaxation (ITA)',
    ),
  ),
  AsmrVideo(
    id: 'MXsyt1qHbag',
    categoriaId: 'sussurri',
    autore: 'EL ASMR',
    titolo: LText(
      '💖 Sussurri nelle tue orecchie + mic scratching',
      '💖 Whispers in your ears + mic scratching (ITA)',
    ),
  ),
  AsmrVideo(
    id: 'kkqccDx0KAc',
    categoriaId: 'sussurri',
    autore: 'Chiara ASMR',
    titolo: LText(
      "Un'ora e 14 trigger per farti dormire",
      'One hour and 14 triggers to make you sleep (ITA)',
    ),
  ),
  // Pagine di libri
  AsmrVideo(
    id: 'j-jdcJaRYcM',
    categoriaId: 'pagine',
    autore: 'TheASMRGirl',
    titolo: LText(
      'Sfogliare un libro, no talking',
      'Book page turning, no talking',
    ),
  ),
  AsmrVideo(
    id: 'YIumDOcSPT4',
    categoriaId: 'pagine',
    autore: 'Maxence Rodier ASMR',
    titolo: LText(
      'Pagine di libri antichi che scricchiolano 📖',
      'Crinkly old books page turning 📖',
    ),
  ),
  AsmrVideo(
    id: 'xthg-1Y4R3E',
    categoriaId: 'pagine',
    autore: 'TheASMRGirl',
    titolo: LText(
      'Sfogliare lentamente, no talking',
      'Slow book page turning, no talking',
    ),
  ),
  AsmrVideo(
    id: 's2Z5rdu_2ME',
    categoriaId: 'pagine',
    autore: 'Just Paper ASMR',
    titolo: LText(
      'Pagine sottili: suoni di carta per dormire e studiare',
      'Thin page turning: paper sounds for sleep & study',
    ),
  ),
  AsmrVideo(
    id: 'UgcqREaVFcg',
    categoriaId: 'pagine',
    autore: 'Mia Lasswell',
    titolo: LText(
      'Suoni di pagine girate, relax profondo',
      'Page turning sounds, deep relaxation',
    ),
  ),
  AsmrVideo(
    id: 'QE2ErXN3grA',
    categoriaId: 'pagine',
    autore: 'Maxence Rodier ASMR',
    titolo: LText(
      'Libri antichi in libreria, 1 ora',
      'Crinkly antique books in a bookshop, 1 hour',
    ),
  ),
  AsmrVideo(
    id: 'A2MVpzcIPJo',
    categoriaId: 'pagine',
    autore: 'TheASMRGirl',
    titolo: LText(
      'Sfogliare accanto al fuoco, no talking',
      'Page turning next to fire, no talking',
    ),
  ),
  // Fusa di gatto
  AsmrVideo(
    id: 'HRxp-IWVu7Y',
    categoriaId: 'gatto',
    autore: 'TMSOFT',
    titolo: LText(
      'Fusa di gatto, 10 ore, schermo nero',
      'Cat purring, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'cqlPHCc7xYo',
    categoriaId: 'gatto',
    autore: 'Calming Audio',
    titolo: LText('Fusa di gatto per 10 ore', 'Cat purring sound for 10 hours'),
  ),
  AsmrVideo(
    id: 'j4_3HJmXOFk',
    categoriaId: 'gatto',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Fusa 🐱 con rumore bianco, 10 ore',
      'Cat purring 🐱 with white noise, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'gL6zxsQMC5A',
    categoriaId: 'gatto',
    autore: 'Moonlight Aura Vibes',
    titolo: LText(
      'Fusa, 10 ore, schermo nero',
      'Cat purring, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'DF_RF3q6tAU',
    categoriaId: 'gatto',
    autore: 'Soothing Sounds for Sleep',
    titolo: LText(
      'Fusa, 10 ore: relax, studio, calma',
      'Cat purring, 10 hours: relax, study, calm',
    ),
  ),
  AsmrVideo(
    id: 'EpqyaFrzYvI',
    categoriaId: 'gatto',
    autore: 'Relaxing Sounds',
    titolo: LText(
      'Gatto che fa le fusa, 10 ore, sonno profondo',
      'Purring cat, 10 hours, deep sleep',
    ),
  ),
  // Lo-fi (2)
  AsmrVideo(
    id: 'E2vONfzoyRI',
    categoriaId: 'lofi',
    autore: 'Lofi Girl',
    titolo: LText(
      'jazz lofi radio 🎷 beats to chill/study to',
      'jazz lofi radio 🎷 beats to chill/study to',
    ),
  ),
  AsmrVideo(
    id: 'KsfdFd10358',
    categoriaId: 'lofi',
    autore: 'Jazzy Lofi Beats',
    titolo: LText(
      'Jazz lofi con pioggia, per concentrarsi',
      'Rainy jazz lofi for concentration & deep work',
    ),
  ),
  AsmrVideo(
    id: 'e4wvocg8U2I',
    categoriaId: 'lofi',
    autore: 'The Japanese Town',
    titolo: LText(
      'Pioggia tranquilla 🌙 lofi per dormire, live',
      'Tranquil rain 🌙 lofi beats to sleep, live',
    ),
  ),
  AsmrVideo(
    id: 'asWn6GSVvKk',
    categoriaId: 'lofi',
    autore: 'The Japanese Town',
    titolo: LText(
      'Sussurri di pioggia 🌙 lofi hip hop, live',
      'Whispers of rain 🌙 lofi hip hop, live',
    ),
  ),
  AsmrVideo(
    id: '_Cnpoo8EMn8',
    categoriaId: 'lofi',
    autore: 'chill chill journal',
    titolo: LText(
      'Pioggia e jazz lofi per riposare',
      'Peaceful rain & lofi jazz to rest and sleep',
    ),
  ),
  AsmrVideo(
    id: 'YCiCeGp9MgA',
    categoriaId: 'lofi',
    autore: 'Groove Boom Hop',
    titolo: LText(
      'Jazz x hip hop soulful, radio 24/7',
      'Soulful jazz x hip hop, 24/7 radio',
    ),
  ),
  // Notte d'estate: grilli e fuoco da campo
  AsmrVideo(
    id: 'EUCzn76UFE0',
    categoriaId: 'grilli',
    autore: 'TMSOFT',
    titolo: LText(
      'Fuoco da campo e grilli, 10 ore, schermo nero',
      'Summer campfire and crickets, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'QMJYlmX1sNU',
    categoriaId: 'grilli',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Fuoco da campo con grilli',
      'Campfire sleep sounds with crickets chirping',
    ),
  ),
  AsmrVideo(
    id: '_RqfH05VcrQ',
    categoriaId: 'grilli',
    autore: 'Serene Sounds',
    titolo: LText(
      'Notte d\'estate: grilli, 10 ore',
      'Summer night sounds: crickets, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'qUaF33IE3jw',
    categoriaId: 'grilli',
    autore: 'SleepySounds',
    titolo: LText(
      'Fuoco da campo e grilli, 10 ore',
      'Campfire and crickets, 10 hour sleep sound',
    ),
  ),
  AsmrVideo(
    id: '5-UWXylsgag',
    categoriaId: 'grilli',
    autore: 'TheSilentWatcher',
    titolo: LText(
      'Lucciole e grilli, 10 ore',
      'Fireflies & crickets, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'L_awYF03B0Q',
    categoriaId: 'grilli',
    autore: 'FIREOS',
    titolo: LText(
      'Fuoco da campo 4K con grilli nel bosco',
      '4K campfire with gentle crickets, forest night',
    ),
  ),
  AsmrVideo(
    id: 'nINkKPFTrG4',
    categoriaId: 'grilli',
    autore: 'KDeKay Sleep Sounds',
    titolo: LText(
      'Conversazioni di grilli, 10 ore binaurali',
      'Cricket conversations, 10 hours binaural',
    ),
  ),
  AsmrVideo(
    id: 'vR7rWIs4wbc',
    categoriaId: 'grilli',
    autore: 'Beautiful Relaxation',
    titolo: LText(
      'Fuoco che crepita e grilli nella foresta, live',
      'Crackling campfire & crickets in the forest, live',
    ),
  ),
  // Viaggio in treno
  AsmrVideo(
    id: 'pqfQhPM8reU',
    categoriaId: 'treno',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Treno per dormire, rumore bianco, 10 ore',
      'Train sound for sleep, white noise, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'pyyJQD91qMU',
    categoriaId: 'treno',
    autore: 'Relaxing White Noise',
    titolo: LText(
      'Treno di lusso, 10 ore di viaggio',
      'Luxury train ride, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'XpgXGyiQvqc',
    categoriaId: 'treno',
    autore: 'Sleep Sounds Express',
    titolo: LText(
      'In treno di notte, 10 ore',
      'Riding a train at night, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'o05TB15lVQY',
    categoriaId: 'treno',
    autore: 'AfterHours Music Studio',
    titolo: LText(
      'Treno, 10 ore, schermo nero',
      'Train sleep sounds, 10 hours, black screen',
    ),
  ),
  AsmrVideo(
    id: 'KtPj5rLNbeY',
    categoriaId: 'treno',
    autore: 'CalmYourStress',
    titolo: LText(
      'Treno notturno, binari gentili, 10 ore',
      'Night train ride, gentle tracks, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'Hq7-lwQBJMU',
    categoriaId: 'treno',
    autore: 'Focus Flow',
    titolo: LText(
      'Ritmo dei binari e natura lontana, 10 ore',
      'Rhythmic railway sounds & distant nature, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'BELKTFzdjPU',
    categoriaId: 'treno',
    autore: 'Amtrak',
    titolo: LText(
      '10 ore a bordo di un Amtrak',
      '10-hour Amtrak train ambiance',
    ),
  ),
  AsmrVideo(
    id: '0Ujw4Zq1D9o',
    categoriaId: 'treno',
    autore: 'Serene Soundscape',
    titolo: LText(
      'Pioggia sul treno notturno, 10 ore',
      'Rain on a cozy sleeper train, 10 hours',
    ),
  ),
  AsmrVideo(
    id: 'UcC365Wf58s',
    categoriaId: 'treno',
    autore: 'Black & White Ambience',
    titolo: LText(
      'Treno e pioggia battente, 10 ore',
      'Heavy rain & train sounds, 10 hours',
    ),
  ),
];

AsmrCategory categoriaById(String id) =>
    asmrCategorie.firstWhere((c) => c.id == id, orElse: () => categoriaMiei);

List<AsmrVideo> videoDiCategoria(String id) =>
    asmrVideos.where((v) => v.categoriaId == id).toList();
