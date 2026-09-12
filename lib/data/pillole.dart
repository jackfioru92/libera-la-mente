import '../models/models.dart';

/// Catalogo delle pillole, ognuna in italiano e inglese.
///
/// Tre famiglie:
///  - [TipoPillola.originale]: testi scritti per l'app.
///  - [TipoPillola.classico]: citazioni da opere di pubblico dominio (Stoici,
///    Tao Te Ching, Dhammapada, Pascal), nella nostra resa.
///  - [TipoPillola.ispirata]: idee-chiave di libri moderni (Libera la mente,
///    Flow, Il potere di adesso, ...) riscritte in parole nostre e attribuite
///    alla fonte. Non sono citazioni letterali: i testi originali sono
///    protetti da copyright.
const List<Pillola> pillole = [
  // ---------------------------------------------------------------- originali
  Pillola(
    id: 'o01',
    tema: 'respiro',
    testo: LText(
      'Non devi risolvere tutto adesso. Adesso devi solo respirare.',
      'You don\'t have to solve everything now. Right now you only have to breathe.',
    ),
  ),
  Pillola(
    id: 'o02',
    tema: 'pensieri',
    testo: LText(
      'I pensieri sono nuvole: passano anche se non fai niente.',
      'Thoughts are clouds: they pass even if you do nothing.',
    ),
  ),
  Pillola(
    id: 'o03',
    tema: 'lentezza',
    testo: LText(
      'Rallenta. Il mondo aspetta più di quanto credi.',
      'Slow down. The world waits longer than you think.',
    ),
  ),
  Pillola(
    id: 'o04',
    tema: 'presente',
    testo: LText(
      'Sei già arrivato: sei qui, in questo momento. Non serve altro.',
      'You have already arrived: you are here, in this moment. Nothing else is needed.',
    ),
  ),
  Pillola(
    id: 'o05',
    tema: 'respiro',
    testo: LText(
      'Un respiro lento dice al corpo che è al sicuro.',
      'A slow breath tells the body it is safe.',
    ),
  ),
  Pillola(
    id: 'o06',
    tema: 'pensieri',
    testo: LText(
      'Non sei i tuoi pensieri. Sei chi li osserva.',
      'You are not your thoughts. You are the one watching them.',
    ),
  ),
  Pillola(
    id: 'o07',
    tema: 'lentezza',
    testo: LText(
      'Una cosa alla volta. Poi un\'altra. È così che si fa tutto.',
      'One thing at a time. Then another. That is how everything gets done.',
    ),
  ),
  Pillola(
    id: 'o08',
    tema: 'gentilezza',
    testo: LText(
      'Parla a te stesso come parleresti a un amico stanco.',
      'Talk to yourself the way you would talk to a tired friend.',
    ),
  ),
  Pillola(
    id: 'o09',
    tema: 'presente',
    testo: LText(
      'La calma non è assenza di rumore: è spazio intorno al rumore.',
      'Calm is not the absence of noise: it is space around the noise.',
    ),
  ),
  Pillola(
    id: 'o10',
    tema: 'corpo',
    testo: LText(
      'Sciogli le spalle. Apri la mascella. Il corpo ascolta prima della mente.',
      'Drop your shoulders. Unclench your jaw. The body listens before the mind does.',
    ),
  ),
  Pillola(
    id: 'o11',
    tema: 'pensieri',
    testo: LText(
      'Non tutto ciò che senti è urgente. Quasi niente lo è.',
      'Not everything you feel is urgent. Almost nothing is.',
    ),
  ),
  Pillola(
    id: 'o12',
    tema: 'respiro',
    testo: LText(
      'Quattro dentro, quattro fermo, quattro fuori, quattro fermo. Il resto può aspettare.',
      'Four in, four hold, four out, four hold. The rest can wait.',
    ),
  ),
  Pillola(
    id: 'o13',
    tema: 'gentilezza',
    testo: LText(
      'Ciò che ti pesa non deve essere portato tutto insieme.',
      'What weighs on you does not have to be carried all at once.',
    ),
  ),
  Pillola(
    id: 'o14',
    tema: 'presente',
    testo: LText(
      'Guarda una cosa nella stanza per dieci secondi. Solo quella.',
      'Look at one thing in the room for ten seconds. Only that.',
    ),
  ),
  Pillola(
    id: 'o15',
    tema: 'corpo',
    testo: LText(
      'Metti i piedi a terra. Senti il pavimento. Sei sostenuto.',
      'Put your feet on the ground. Feel the floor. You are held.',
    ),
  ),
  Pillola(
    id: 'o16',
    tema: 'pensieri',
    testo: LText(
      'L\'ansia racconta storie. Non sei obbligato a leggerle fino in fondo.',
      'Anxiety tells stories. You are not obliged to read them to the end.',
    ),
  ),
  Pillola(
    id: 'o17',
    tema: 'sonno',
    testo: LText(
      'Riposare non è perdere tempo. È il tempo che ti restituisce.',
      'Resting is not wasting time. It is time giving you back.',
    ),
  ),
  Pillola(
    id: 'o18',
    tema: 'respiro',
    testo: LText(
      'Espira più a lungo di quanto inspiri: è il freno naturale del corpo.',
      'Breathe out longer than you breathe in: it is the body\'s natural brake.',
    ),
  ),
  Pillola(
    id: 'o19',
    tema: 'sonno',
    testo: LText(
      'La notte è fatta per lasciare andare, non per risolvere.',
      'Night is for letting go, not for solving.',
    ),
  ),
  Pillola(
    id: 'o20',
    tema: 'gentilezza',
    testo: LText(
      'Se oggi hai solo respirato, hai fatto abbastanza.',
      'If all you did today was breathe, you did enough.',
    ),
  ),
  Pillola(
    id: 'o21',
    tema: 'corpo',
    testo: LText(
      'Bevi un bicchiere d\'acqua. Lentamente. È già una piccola pausa.',
      'Drink a glass of water. Slowly. That is already a small pause.',
    ),
  ),
  Pillola(
    id: 'o22',
    tema: 'lentezza',
    testo: LText(
      'Non stai restando indietro. Stai andando al tuo passo.',
      'You are not falling behind. You are going at your own pace.',
    ),
  ),
  Pillola(
    id: 'o23',
    tema: 'sonno',
    testo: LText(
      'Lascia il telefono dall\'altra parte della stanza. Il sonno arriva a piedi.',
      'Leave the phone on the other side of the room. Sleep arrives on foot.',
    ),
  ),
  Pillola(
    id: 'o24',
    tema: 'presente',
    testo: LText(
      'Adesso. Solo adesso. Il resto è racconto.',
      'Now. Only now. The rest is a story.',
    ),
  ),

  // ----------------------------------------------------- classici (pubblico dominio)
  Pillola(
    id: 'c01',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Epitteto',
    fonte: LText('Manuale', 'Enchiridion'),
    testo: LText(
      'Non sono le cose a turbarci, ma le opinioni che abbiamo delle cose.',
      'It is not things that disturb us, but our opinions about things.',
    ),
  ),
  Pillola(
    id: 'c02',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Epitteto',
    fonte: LText('Manuale', 'Enchiridion'),
    testo: LText(
      'Alcune cose dipendono da noi, altre no. La serenità comincia dal distinguerle.',
      'Some things are up to us, others are not. Serenity begins with telling them apart.',
    ),
  ),
  Pillola(
    id: 'c03',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('Lettere a Lucilio', 'Letters to Lucilius'),
    testo: LText(
      'Soffriamo più spesso nell\'immaginazione che nella realtà.',
      'We suffer more often in imagination than in reality.',
    ),
  ),
  Pillola(
    id: 'c04',
    tema: 'lentezza',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('La brevità della vita', 'On the Shortness of Life'),
    testo: LText(
      'Non è vero che abbiamo poco tempo: è che ne sprechiamo molto.',
      'It is not that we have little time: it is that we waste a lot of it.',
    ),
  ),
  Pillola(
    id: 'c05',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('Lettere a Lucilio', 'Letters to Lucilius'),
    testo: LText(
      'Chi è ovunque, non è in nessun luogo.',
      'To be everywhere is to be nowhere.',
    ),
  ),
  Pillola(
    id: 'c06',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Marco Aurelio',
    fonte: LText('Pensieri', 'Meditations'),
    testo: LText(
      'Hai potere sulla tua mente, non sugli eventi. Comprendilo, e troverai la forza.',
      'You have power over your mind, not over events. Realise this, and you will find strength.',
    ),
  ),
  Pillola(
    id: 'c07',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Marco Aurelio',
    fonte: LText('Pensieri', 'Meditations'),
    testo: LText(
      'Non lasciare che il futuro ti turbi: lo affronterai con la stessa ragione che oggi usi per il presente.',
      'Do not let the future disturb you: you will meet it with the same reason you use for the present today.',
    ),
  ),
  Pillola(
    id: 'c08',
    tema: 'gentilezza',
    tipo: TipoPillola.classico,
    autore: 'Marco Aurelio',
    fonte: LText('Pensieri', 'Meditations'),
    testo: LText(
      'Guarda dentro di te: lì c\'è la fonte del bene, e può sempre zampillare se scavi.',
      'Look within: there lies the source of good, and it will keep springing up if you keep digging.',
    ),
  ),
  Pillola(
    id: 'c09',
    tema: 'lentezza',
    tipo: TipoPillola.classico,
    autore: 'Lao Tzu',
    fonte: LText('Tao Te Ching', 'Tao Te Ching'),
    testo: LText(
      'La natura non ha fretta, eppure tutto si compie.',
      'Nature does not hurry, yet everything is accomplished.',
    ),
  ),
  Pillola(
    id: 'c10',
    tema: 'lentezza',
    tipo: TipoPillola.classico,
    autore: 'Lao Tzu',
    fonte: LText('Tao Te Ching', 'Tao Te Ching'),
    testo: LText(
      'Un viaggio di mille miglia comincia con un solo passo.',
      'A journey of a thousand miles begins with a single step.',
    ),
  ),
  Pillola(
    id: 'c11',
    tema: 'gentilezza',
    tipo: TipoPillola.classico,
    autore: 'Lao Tzu',
    fonte: LText('Tao Te Ching', 'Tao Te Ching'),
    testo: LText(
      'Chi sa accontentarsi è ricco.',
      'Whoever knows they have enough is rich.',
    ),
  ),
  Pillola(
    id: 'c12',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Buddha',
    fonte: LText('Dhammapada', 'Dhammapada'),
    testo: LText(
      'Siamo ciò che pensiamo. Tutto ciò che siamo nasce dai nostri pensieri.',
      'We are what we think. All that we are arises with our thoughts.',
    ),
  ),
  Pillola(
    id: 'c13',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Blaise Pascal',
    fonte: LText('Pensieri', 'Pensées'),
    testo: LText(
      'Tutta l\'infelicità degli uomini viene da una cosa sola: non saper restare tranquilli in una stanza.',
      'All of humanity\'s problems stem from one thing: not being able to sit quietly in a room.',
    ),
  ),
  Pillola(
    id: 'c14',
    tema: 'lentezza',
    tipo: TipoPillola.classico,
    autore: 'Qohelet',
    fonte: LText('Ecclesiaste', 'Ecclesiastes'),
    testo: LText(
      'C\'è un tempo per ogni cosa, e un momento per ogni cosa sotto il cielo.',
      'There is a time for everything, and a season for every activity under heaven.',
    ),
  ),

  // ------------------------------------------ ispirate a libri moderni (parafrasi)
  Pillola(
    id: 'h01',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'La mente è un cielo azzurro. I pensieri sono nuvole: possono coprirlo, ma il cielo è sempre lì.',
      'The mind is a blue sky. Thoughts are clouds: they can cover it, but the sky is always there.',
    ),
  ),
  Pillola(
    id: 'h02',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'Siediti sul bordo della strada e guarda passare il traffico dei pensieri. Non correre in mezzo a fermarlo.',
      'Sit by the side of the road and watch the traffic of your thoughts. Don\'t run out to stop the cars.',
    ),
  ),
  Pillola(
    id: 'h03',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'Dieci minuti al giorno bastano. Non per svuotare la mente: per cambiare il rapporto con ciò che contiene.',
      'Ten minutes a day is enough. Not to empty the mind, but to change your relationship with what is in it.',
    ),
  ),
  Pillola(
    id: 'h04',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'Il momento in cui ti accorgi di esserti distratto non è un fallimento: è già consapevolezza.',
      'The moment you notice you have drifted off is not a failure: it is already awareness.',
    ),
  ),
  Pillola(
    id: 'h05',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'Non devi fermare i pensieri. Devi solo smettere di inseguirli.',
      'You don\'t have to stop your thoughts. You just have to stop chasing them.',
    ),
  ),
  Pillola(
    id: 'i01',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'M. Csikszentmihalyi',
    fonte: LText('Flow', 'Flow'),
    testo: LText(
      'I momenti migliori non arrivano quando ti rilassi, ma quando sei così immerso in qualcosa che il tempo sparisce.',
      'The best moments don\'t come when you relax, but when you are so absorbed in something that time disappears.',
    ),
  ),
  Pillola(
    id: 'i02',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'M. Csikszentmihalyi',
    fonte: LText('Flow', 'Flow'),
    testo: LText(
      'L\'attenzione è la tua energia più preziosa: dove la metti, lì va la tua vita.',
      'Attention is your most precious energy: wherever you place it, that is where your life goes.',
    ),
  ),
  Pillola(
    id: 'i03',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'M. Csikszentmihalyi',
    fonte: LText('Flow', 'Flow'),
    testo: LText(
      'Scegli un compito alla tua altezza: né troppo facile né impossibile. Lì nasce la calma attiva.',
      'Pick a task that matches you: neither too easy nor impossible. That is where active calm is born.',
    ),
  ),
  Pillola(
    id: 'i04',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'E. Tolle',
    fonte: LText('Il potere di adesso', 'The Power of Now'),
    testo: LText(
      'Il momento presente è l\'unica cosa che hai davvero. Non perderlo per un futuro che ancora non c\'è.',
      'The present moment is the only thing you truly have. Don\'t lose it to a future that isn\'t here yet.',
    ),
  ),
  Pillola(
    id: 'i05',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'E. Tolle',
    fonte: LText('Il potere di adesso', 'The Power of Now'),
    testo: LText(
      'Osserva chi pensa dentro di te: il solo fatto di guardarlo lo fa tacere.',
      'Watch the thinker inside you: simply looking at it makes it fall silent.',
    ),
  ),
  Pillola(
    id: 'i06',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'E. Tolle',
    fonte: LText('Il potere di adesso', 'The Power of Now'),
    testo: LText(
      'Accetta, cambia o lascia andare. Ma non restare a lottare dentro.',
      'Accept it, change it or let it go. But don\'t stay inside, fighting.',
    ),
  ),
  Pillola(
    id: 'i07',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'Thich Nhat Hanh',
    fonte: LText(
      'Il miracolo della presenza mentale',
      'The Miracle of Mindfulness',
    ),
    testo: LText(
      'Lava i piatti per lavare i piatti. Il segreto è tutto lì.',
      'Wash the dishes to wash the dishes. That is the whole secret.',
    ),
  ),
  Pillola(
    id: 'i08',
    tema: 'respiro',
    tipo: TipoPillola.ispirata,
    autore: 'Thich Nhat Hanh',
    fonte: LText(
      'Il miracolo della presenza mentale',
      'The Miracle of Mindfulness',
    ),
    testo: LText(
      'Inspirando, so che sto inspirando. Basta questo per tornare a casa.',
      'Breathing in, I know I am breathing in. That alone brings you home.',
    ),
  ),
  Pillola(
    id: 'i09',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'D. Carnegie',
    fonte: LText(
      'Come smettere di preoccuparsi e cominciare a vivere',
      'How to Stop Worrying and Start Living',
    ),
    testo: LText(
      'Vivi in compartimenti stagni di un solo giorno: chiudi la porta a ieri e a domani.',
      'Live in day-tight compartments: shut the door on yesterday and on tomorrow.',
    ),
  ),
  Pillola(
    id: 'i10',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'D. Carnegie',
    fonte: LText(
      'Come smettere di preoccuparsi e cominciare a vivere',
      'How to Stop Worrying and Start Living',
    ),
    testo: LText(
      'Chiediti qual è il peggio che può succedere. Accettalo. Poi lavora per migliorarlo.',
      'Ask yourself what the worst that could happen is. Accept it. Then work to improve on it.',
    ),
  ),
  Pillola(
    id: 'i11',
    tema: 'sonno',
    tipo: TipoPillola.ispirata,
    autore: 'N. V. Peale',
    fonte: LText(
      'Il potere del pensiero positivo',
      'The Power of Positive Thinking',
    ),
    testo: LText(
      'Ogni sera svuota la mente dalle paure, come svuoti le tasche prima di dormire.',
      'Every evening empty your mind of fears, the way you empty your pockets before bed.',
    ),
  ),
  Pillola(
    id: 'i12',
    tema: 'gentilezza',
    tipo: TipoPillola.ispirata,
    autore: 'N. V. Peale',
    fonte: LText(
      'Il potere del pensiero positivo',
      'The Power of Positive Thinking',
    ),
    testo: LText(
      'Una fiducia umile ma solida in te stesso è il primo mattone di ogni giornata buona.',
      'A humble but solid confidence in yourself is the first brick of every good day.',
    ),
  ),
  Pillola(
    id: 'i13',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'V. Frankl',
    fonte: LText('Uno psicologo nei lager', 'Man\'s Search for Meaning'),
    testo: LText(
      'Tra ciò che ti accade e come rispondi c\'è uno spazio. In quello spazio c\'è la tua libertà.',
      'Between what happens to you and how you respond there is a space. In that space lies your freedom.',
    ),
  ),
  Pillola(
    id: 'i14',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'R. Sharma',
    fonte: LText(
      'Il monaco che vendette la sua Ferrari',
      'The Monk Who Sold His Ferrari',
    ),
    testo: LText(
      'La mente è un giardino: se non semini fiori, crescono le erbacce.',
      'The mind is a garden: if you don\'t plant flowers, weeds grow.',
    ),
  ),
  Pillola(
    id: 'i15',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'J. Kabat-Zinn',
    fonte: LText(
      'Dovunque tu vada, ci sei già',
      'Wherever You Go, There You Are',
    ),
    testo: LText(
      'Non puoi fermare le onde, ma puoi imparare a fare surf.',
      'You can\'t stop the waves, but you can learn to surf.',
    ),
  ),
  Pillola(
    id: 'i16',
    tema: 'gentilezza',
    tipo: TipoPillola.ispirata,
    autore: 'Dalai Lama',
    fonte: LText('L\'arte della felicità', 'The Art of Happiness'),
    testo: LText(
      'La felicità non è già pronta da qualche parte: nasce da ciò che fai, un gesto alla volta.',
      'Happiness isn\'t ready-made somewhere: it comes from what you do, one act at a time.',
    ),
  ),
];

/// Pillola del giorno: cambia ogni giorno, uguale per tutti.
Pillola pillolaDelGiorno([DateTime? now]) {
  final d = now ?? DateTime.now();
  final giorno = d.difference(DateTime(d.year, 1, 1)).inDays;
  return pillole[(giorno + d.year) % pillole.length];
}
