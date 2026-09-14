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
  // ------------------------------------------------------------ originali (2)
  Pillola(
    id: 'o25',
    tema: 'respiro',
    testo: LText(
      'Il respiro è l\'unica cosa che fai da quando sei nato. Sai già come si fa.',
      'Breathing is the one thing you have done since the day you were born. You already know how.',
    ),
  ),
  Pillola(
    id: 'o26',
    tema: 'pensieri',
    testo: LText(
      'Un pensiero ripetuto cento volte non diventa più vero. Solo più rumoroso.',
      'A thought repeated a hundred times does not become truer. Only louder.',
    ),
  ),
  Pillola(
    id: 'o27',
    tema: 'lentezza',
    testo: LText(
      'Fai la prossima cosa piano. Poi vedi se serve davvero la fretta.',
      'Do the next thing slowly. Then see whether the hurry was really needed.',
    ),
  ),
  Pillola(
    id: 'o28',
    tema: 'corpo',
    testo: LText(
      'Il corpo è sempre nel presente. Quando ti perdi, torna da lui.',
      'The body is always in the present. When you get lost, go back to it.',
    ),
  ),
  Pillola(
    id: 'o29',
    tema: 'sonno',
    testo: LText(
      'Non devi addormentarti. Devi solo smettere di cercare di restare sveglio.',
      'You do not have to fall asleep. You only have to stop trying to stay awake.',
    ),
  ),
  Pillola(
    id: 'o30',
    tema: 'gentilezza',
    testo: LText(
      'Anche oggi hai fatto del tuo meglio con quello che avevi. È così che si fa.',
      'Today, too, you did your best with what you had. That is how it is done.',
    ),
  ),

  // ----------------------------------------------------- classici (2)
  Pillola(
    id: 'c15',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Marco Aurelio',
    fonte: LText('Pensieri', 'Meditations'),
    testo: LText('Limitati al presente.', 'Confine yourself to the present.'),
  ),
  Pillola(
    id: 'c16',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Marco Aurelio',
    fonte: LText('Pensieri', 'Meditations'),
    testo: LText(
      'La vita di un uomo è ciò che i suoi pensieri ne fanno.',
      'A man\'s life is what his thoughts make of it.',
    ),
  ),
  Pillola(
    id: 'c17',
    tema: 'gentilezza',
    tipo: TipoPillola.classico,
    autore: 'Marco Aurelio',
    fonte: LText('Pensieri', 'Meditations'),
    testo: LText(
      'Il modo migliore per vendicarsi è non assomigliare a chi ti ha fatto torto.',
      'The best revenge is not to be like the one who wronged you.',
    ),
  ),
  Pillola(
    id: 'c18',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('Lettere a Lucilio', 'Letters to Lucilius'),
    testo: LText(
      'Mentre rimandiamo, la vita passa.',
      'While we put things off, life goes by.',
    ),
  ),
  Pillola(
    id: 'c19',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('Lettere a Lucilio', 'Letters to Lucilius'),
    testo: LText(
      'Chi teme di soffrire, soffre già di ciò che teme.',
      'He who fears suffering is already suffering from what he fears.',
    ),
  ),
  Pillola(
    id: 'c20',
    tema: 'lentezza',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('La tranquillità dell\'animo', 'On Tranquillity of Mind'),
    testo: LText(
      'La mente deve potersi rilassare: riposata, si rialza più forte.',
      'The mind must be given relaxation: it rises stronger after rest.',
    ),
  ),
  Pillola(
    id: 'c21',
    tema: 'gentilezza',
    tipo: TipoPillola.classico,
    autore: 'Epitteto',
    fonte: LText('Manuale', 'Enchiridion'),
    testo: LText(
      'Non pretendere che le cose vadano come vuoi tu; vogli che vadano come vanno, e sarai sereno.',
      'Do not demand that things happen as you wish; wish them to happen as they do, and you will be at peace.',
    ),
  ),
  Pillola(
    id: 'c22',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Epitteto',
    fonte: LText('Diatribe', 'Discourses'),
    testo: LText(
      'Quanto tempo ancora aspetterai prima di pretendere il meglio da te stesso?',
      'How long will you wait before you demand the best of yourself?',
    ),
  ),
  Pillola(
    id: 'c23',
    tema: 'lentezza',
    tipo: TipoPillola.classico,
    autore: 'Lao Tzu',
    fonte: LText('Tao Te Ching', 'Tao Te Ching'),
    testo: LText(
      'Chi ha pazienza vede l\'acqua torbida farsi limpida da sola.',
      'Have patience and muddy water becomes clear by itself.',
    ),
  ),
  Pillola(
    id: 'c24',
    tema: 'gentilezza',
    tipo: TipoPillola.classico,
    autore: 'Lao Tzu',
    fonte: LText('Tao Te Ching', 'Tao Te Ching'),
    testo: LText(
      'Lasciare andare è la vera padronanza.',
      'Letting go is true mastery.',
    ),
  ),
  Pillola(
    id: 'c25',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Chuang Tzu',
    fonte: LText('Zhuangzi', 'Zhuangzi'),
    testo: LText(
      'La mente dell\'uomo saggio è uno specchio: non trattiene, non rifiuta. Riceve, e non conserva.',
      'The mind of the wise is a mirror: it does not grasp, it does not refuse. It receives, but does not keep.',
    ),
  ),
  Pillola(
    id: 'c26',
    tema: 'pensieri',
    tipo: TipoPillola.classico,
    autore: 'Buddha',
    fonte: LText('Dhammapada', 'Dhammapada'),
    testo: LText(
      'Non dimorare nel passato, non sognare il futuro: raccogli la mente nel momento presente.',
      'Do not dwell in the past, do not dream of the future: gather the mind in the present moment.',
    ),
  ),
  Pillola(
    id: 'c27',
    tema: 'gentilezza',
    tipo: TipoPillola.classico,
    autore: 'Rumi',
    fonte: LText('Poesie', 'Poems'),
    testo: LText(
      'Il dolore è il luogo da cui entra la luce.',
      'The wound is the place where the light enters you.',
    ),
  ),
  Pillola(
    id: 'c28',
    tema: 'presente',
    tipo: TipoPillola.classico,
    autore: 'Michel de Montaigne',
    fonte: LText('Saggi', 'Essays'),
    testo: LText(
      'Quando ballo, ballo. Quando dormo, dormo.',
      'When I dance, I dance. When I sleep, I sleep.',
    ),
  ),
  Pillola(
    id: 'c29',
    tema: 'sonno',
    tipo: TipoPillola.classico,
    autore: 'Confucio',
    fonte: LText('Dialoghi', 'Analects'),
    testo: LText(
      'Non importa quanto vai piano, purché tu non ti fermi.',
      'It does not matter how slowly you go, so long as you do not stop.',
    ),
  ),

  // ------------------------------------------ ispirate (2)
  Pillola(
    id: 'h06',
    tema: 'pensieri',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'Non puoi controllare quale pensiero arriva. Puoi scegliere se seguirlo fuori dalla stanza.',
      'You cannot control which thought arrives. You can choose whether to follow it out of the room.',
    ),
  ),
  Pillola(
    id: 'h07',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'A. Puddicombe',
    fonte: LText('Libera la mente', 'The Headspace Guide to Meditation'),
    testo: LText(
      'La consapevolezza non si aggiunge alla giornata: si porta dentro le cose che fai già.',
      'Awareness is not added to the day: you carry it into the things you already do.',
    ),
  ),
  Pillola(
    id: 'i17',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'J. Kabat-Zinn',
    fonte: LText(
      'Dovunque tu vada, ci sei già',
      'Wherever You Go, There You Are',
    ),
    testo: LText(
      'Finché respiri, in te c\'è più di giusto che di sbagliato, qualunque cosa non vada.',
      'As long as you are breathing, there is more right with you than wrong, whatever is the matter.',
    ),
  ),
  Pillola(
    id: 'i18',
    tema: 'respiro',
    tipo: TipoPillola.ispirata,
    autore: 'Thich Nhat Hanh',
    fonte: LText(
      'Il miracolo della presenza mentale',
      'The Miracle of Mindfulness',
    ),
    testo: LText(
      'Sorridi, respira, vai piano. È tutto qui il segreto.',
      'Smile, breathe and go slowly. That is the whole secret.',
    ),
  ),
  Pillola(
    id: 'i19',
    tema: 'attenzione',
    tipo: TipoPillola.ispirata,
    autore: 'M. Csikszentmihalyi',
    fonte: LText('Flow', 'Flow'),
    testo: LText(
      'La noia e l\'ansia sono lo stesso segnale: la sfida e le tue forze non sono in equilibrio.',
      'Boredom and anxiety are the same signal: the challenge and your skills are out of balance.',
    ),
  ),
  Pillola(
    id: 'i20',
    tema: 'presente',
    tipo: TipoPillola.ispirata,
    autore: 'E. Tolle',
    fonte: LText('Il potere di adesso', 'The Power of Now'),
    testo: LText(
      'Il problema non è mai questo momento. È la storia che gli costruisci intorno.',
      'The problem is never this moment. It is the story you build around it.',
    ),
  ),
  Pillola(
    id: 'i21',
    tema: 'gentilezza',
    tipo: TipoPillola.ispirata,
    autore: 'V. Frankl',
    fonte: LText('Uno psicologo nei lager', 'Man\'s Search for Meaning'),
    testo: LText(
      'Non chiedere cosa ti aspetti dalla vita. Chiediti cosa la vita si aspetta da te, oggi.',
      'Do not ask what you expect from life. Ask what life expects from you, today.',
    ),
  ),
  Pillola(
    id: 'i22',
    tema: 'lentezza',
    tipo: TipoPillola.ispirata,
    autore: 'J. Clear',
    fonte: LText('Piccole abitudini per grandi cambiamenti', 'Atomic Habits'),
    testo: LText(
      'Un minuto di respiro al giorno vale più di un\'ora una volta al mese. Le abitudini vincono sull\'intensità.',
      'One minute of breathing a day beats an hour once a month. Habits win over intensity.',
    ),
  ),
  // ------------------------------------------ mattino: citazioni (3)
  Pillola(
    id: 'c30',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Christopher Morley',
    testo: LText(
      'C\'è un solo tipo di successo: fare della propria vita ciò che si desidera.',
      'There is only one success: to be able to spend your life in your own way.',
    ),
  ),
  Pillola(
    id: 'c31',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Nathaniel Hawthorne',
    testo: LText(
      'La felicità è come una farfalla: se la insegui non la prendi mai; se ti siedi tranquillo, può posarsi su di te.',
      'Happiness is like a butterfly: pursued, it is always beyond your grasp; sit down quietly, and it may alight upon you.',
    ),
  ),
  Pillola(
    id: 'c32',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Antoine de Saint-Exupéry',
    testo: LText(
      'Fai della tua vita un sogno, e di un sogno una realtà.',
      'Make your life a dream, and a dream a reality.',
    ),
  ),
  Pillola(
    id: 'c33',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Peter Drucker',
    testo: LText(
      'Il modo migliore per predire il futuro è crearlo.',
      'The best way to predict the future is to create it.',
    ),
  ),
  Pillola(
    id: 'c34',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Seneca',
    fonte: LText('Lettere a Lucilio', 'Letters to Lucilius'),
    testo: LText(
      'Non è perché le cose sono difficili che non osiamo: è perché non osiamo che sono difficili.',
      'It is not because things are difficult that we do not dare; it is because we do not dare that they are difficult.',
    ),
  ),
  Pillola(
    id: 'c35',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Vincent van Gogh',
    fonte: LText('Lettere', 'Letters'),
    testo: LText(
      'Le grandi cose non si fanno d\'impulso, ma con una serie di piccole cose messe insieme.',
      'Great things are not done by impulse, but by a series of small things brought together.',
    ),
  ),
  Pillola(
    id: 'c36',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Proverbio giapponese',
    testo: LText(
      'Cadi sette volte, rialzati otto.',
      'Fall down seven times, get up eight.',
    ),
  ),
  Pillola(
    id: 'c37',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Helen Keller',
    testo: LText(
      'Se guardi il sole, non vedrai mai le ombre.',
      'Keep your face to the sunshine and you cannot see a shadow.',
    ),
  ),
  Pillola(
    id: 'c38',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Charles R. Swindoll',
    testo: LText(
      'La vita è per il 10% ciò che ti accade e per il 90% come reagisci.',
      'Life is 10% what happens to you and 90% how you react to it.',
    ),
  ),
  Pillola(
    id: 'c39',
    tema: 'mattino',
    tipo: TipoPillola.classico,
    autore: 'Robert Louis Stevenson',
    testo: LText(
      'Non giudicare ogni giorno dal raccolto che ottieni, ma dai semi che pianti.',
      'Don\'t judge each day by the harvest you reap, but by the seeds you plant.',
    ),
  ),

  // ------------------------------------------ mattino: originali (3)
  Pillola(
    id: 'o31',
    tema: 'mattino',
    testo: LText(
      'Il mattino non porta solo la luce: porta la possibilità di cambiare ciò che non ti rende felice.',
      'Morning brings more than light: it brings the chance to change what does not make you happy.',
    ),
  ),
  Pillola(
    id: 'o32',
    tema: 'mattino',
    testo: LText(
      'La mente è un giardino: pianta un pensiero di gratitudine appena sveglio e guarda fiorire la giornata.',
      'The mind is a garden: plant one grateful thought as you wake, and watch the day bloom.',
    ),
  ),
  Pillola(
    id: 'o33',
    tema: 'mattino',
    testo: LText(
      'Ogni giorno è una tela bianca che aspetta i tuoi colori migliori.',
      'Every day is a blank canvas waiting for your best colours.',
    ),
  ),
  Pillola(
    id: 'o34',
    tema: 'mattino',
    testo: LText(
      'Non aspettare il momento perfetto: prendi questo momento e rendilo perfetto.',
      'Don\'t wait for the perfect moment: take this moment and make it perfect.',
    ),
  ),
  Pillola(
    id: 'o35',
    tema: 'mattino',
    testo: LText(
      'Oggi hai ventiquattro ore nuove di zecca per fare la differenza.',
      'Today you have twenty-four brand-new hours to make a difference.',
    ),
  ),
  Pillola(
    id: 'o36',
    tema: 'mattino',
    testo: LText(
      'Lascia andare i pesi di ieri: il mattino è fatto per camminare più leggero.',
      'Let go of yesterday\'s weight: the morning is made for walking lighter.',
    ),
  ),
  Pillola(
    id: 'o37',
    tema: 'mattino',
    testo: LText(
      'Ogni alba porta con sé una nuova prospettiva e una nuova forza.',
      'Every dawn brings a new perspective and new strength.',
    ),
  ),
  Pillola(
    id: 'o38',
    tema: 'mattino',
    testo: LText(
      'Inizia oggi credendo che qualcosa di buono stia per accadere.',
      'Start today believing that something good is about to happen.',
    ),
  ),
  Pillola(
    id: 'o39',
    tema: 'mattino',
    testo: LText(
      'Il tuo sorriso del mattino è il miglior biglietto da visita per il mondo.',
      'Your morning smile is your best calling card for the world.',
    ),
  ),
];

/// Pillola del giorno: cambia ogni giorno, uguale per tutti.
Pillola pillolaDelGiorno([DateTime? now]) {
  final d = now ?? DateTime.now();
  final giorno = d.difference(DateTime(d.year, 1, 1)).inDays;
  return pillole[(giorno + d.year) % pillole.length];
}
