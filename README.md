# Libera la Mente

App Flutter (iOS + Android) per calmare la mente in un minuto: **respirazione
quadrata**, **pillole scritte** e **ASMR da YouTube**. Gratuita, senza account,
senza pubblicità, tutto in locale.

## Schede

| Scheda   | Cosa fa |
|----------|---------|
| **Oggi** | Pillola del giorno (cambia ogni giorno) su uno sfondo "vivo"; cuore / copia / un'altra. Chip *Come ti senti?* (Ansioso, Insonne, …) che imposta scena + suono + ritmo. Pulsante **Spegni la mente**: un tocco → scena casuale, suono calmante casuale, sessione avviata. |
| **Respira** | Quadrato del respiro (Inspira → Trattieni → Espira → Trattieni), punto luminoso lungo i lati, quadrato interno che si espande, sfondo che "respira". Lato 3/4/5/6 s, durata 1/3/5/10 min o ∞, metronomo tattile (tic a ogni secondo, colpo ai cambi di fase), **voce guida** (TTS di sistema, it/en) che dice la fase a ogni cambio, schermo sempre acceso, selettore suono in-line. 12 sfondi: 6 scene a **colori** (gradienti animati) + le stesse 6 in versione **foto**. |
| **Ascolta** | **Mixer di suoni** locali (pioggia, fuoco, vento, rumore bianco/rosa/marrone: sintetizzati con `tool/`, senza copyright, offline e a schermo spento) + 17 categorie ASMR da YouTube (Rumore bianco, Barbiere, Barbiere giapponese, Pulizie, Scarpe, Fuoco, Pioggia, Temporale, Onde, Foresta, Notte d'estate, Viaggio in treno, Sussurri ITA, Tastiera, Pagine di libri, Fusa di gatto, Lo-fi), 160 video verificati come incorporabili. |
| **Oasi** | Statistiche con calendario delle ultime 4 settimane, card **Offrimi un caffè** (PayPal + mail), pillole salvate, pillole tue, suoni preferiti, video tuoi (incolla un link YouTube), timer di spegnimento, scena preferita, vibrazione, info. |

Il **mini-player** sopra la barra di navigazione contiene l'unico player
YouTube dell'app: l'audio continua cambiando scheda. Tocca il titolo per
espanderlo (volume + timer di spegnimento).

## Lingue

Interfaccia e contenuti in **italiano** e **inglese**; la lingua segue il
telefono (fallback inglese) e si può forzare in *Oasi → Lingua*.

- Stringhe UI, nomi di categorie/scene/stati d'animo: `lib/l10n/app_it.arb`
  (template) e `app_en.arb`. Dopo una modifica: `flutter gen-l10n`.
- Contenuti (pillole, titoli dei video): tipo `LText(it, en)` in `lib/data/`.
- Per aggiungere una lingua: nuovo `app_xx.arb`, `more: {'xx': ...}` negli
  `LText`, e la voce in `kLanguageNames` (Oasi).

## Struttura

```
lib/
  main.dart                 avvio, tema, localizzazione, AppScope
  l10n/                     app_it.arb, app_en.arb, l10n_ext.dart (helper)
  theme.dart                palette scura e calda
  models/models.dart        Pillola, AsmrCategory, AsmrVideo, CalmSceneDef, Mood
  data/pillole.dart         catalogo pillole (originali / classici / ispirate)
  data/asmr_catalog.dart    categorie e video YouTube
  data/scenes.dart          scene visive + prompt IA + mood
  services/prefs.dart       SharedPreferences: preferiti, contenuti tuoi, stats
  services/asmr_player.dart player YouTube unico + sleep timer
  services/app_scope.dart   InheritedWidget, AppController, SceneImages
  services/youtube_oembed.dart  titolo/canale di un link incollato
  services/voice_guide.dart     voce guida (clip + flutter_tts)
  services/sound_mixer.dart     mixer di suoni locali (just_audio)
  config.dart               email, link donazioni
  screens/                  home_shell, oggi, respira, ascolta, oasi
  widgets/                  calm_scene, breathing_box, mini_player, video_tile,
                            asmr_picker, pill_card
assets/images/              immagini IA delle scene (vedi README lì dentro)
assets/audio/               clip della voce guida (it/en)
assets/mixer/               loop del mixer (generati da tool/genera_suoni.py)
```

## Avvio

```bash
flutter pub get
flutter run
```

Richiede rete (i suoni sono embed YouTube). Su Android il permesso INTERNET è
già nel manifest.

## Aggiungere contenuti

- **Pillole**: `lib/data/pillole.dart`, ognuna `LText(it, en)`. Tre tipi:
  `originale`, `classico` (pubblico dominio, citazione), `ispirata`
  (parafrasi di un libro moderno, con fonte: *Libera la mente*, *Flow*, …). Le citazioni letterali di libri coperti da copyright vanno
  aggiunte dall'utente nella sezione *Le mie pillole* (o qui, a tuo rischio).
- **Video**: `lib/data/asmr_catalog.dart`. Verifica che un ID sia incorporabile:
  `curl -s -o /dev/null -w "%{http_code}" "https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=ID&format=json"`
  → deve rispondere `200`.
- **Immagini IA**: `assets/images/scene_<id>.jpg` (prompt nel README della cartella).

## Limiti noti (v1)

- L'embed YouTube si ferma quando lo schermo si blocca o l'app va in
  background: è una regola di YouTube per i player incorporati. Per l'ascolto
  notturno "a schermo spento" servirebbero file audio royalty-free locali
  (es. Freesound/Pixabay) con `just_audio` + `audio_service`.
- Un solo video YouTube alla volta: con due WebView in parallelo la
  riproduzione non è affidabile su iOS. Il mixer locale invece si somma al video.
- Voce guida, in ordine di preferenza: clip mp3 in `assets/audio/<lang>/`
  (voce neurale o umana — vedi `assets/audio/README.md` e
  `tool/genera_voce.sh`), poi la voce di sistema scelta in *Oasi → Voce
  guida → Scegli la voce*, poi la migliore trovata sul telefono
  (Premium > Enhanced > base, femminile, offline). Su iPhone le voci
  Premium/Enhanced si scaricano da Impostazioni › Accessibilità › Contenuto
  letto › Voci.
- Donazioni: `kDonateUrl` usa il pagamento PayPal a importo libero
  (`cmd=_xclick`) perché il flusso "Donate" è riservato alle organizzazioni.
  Un link PayPal.Me è la soluzione più pulita: sostituisci la costante.
- La richiesta di contributo ("paga quanto vuoi") compare una sola volta, dopo
  la prima sessione completata. Donazioni ricorrenti: volutamente assenti.
- Niente notifiche e niente widget home: prossimi passi naturali
  (`flutter_local_notifications`, `home_widget`).

## Rilascio

Android: vedi `store/RELEASE.md` (AAB firmato, materiale store, checklist Play Console).
La firma richiede `android/key.properties` + `android/upload-keystore.jks`, fuori da git.

## Debug: aprire una scheda da riga di comando

Solo in build debug, se esiste `tmp/demo.json` nel container dell'app:

```bash
C=$(xcrun simctl get_app_container booted it.calmalamente.calmaLaMente data)
echo '{"tab":1,"video":"Hvtc9BWahMQ","start":true,"lang":"en"}' > "$C/tmp/demo.json"
xcrun simctl launch booted it.calmalamente.calmaLaMente
```
