# Rilascio Android — checklist

## Cosa è già pronto

| Cosa | Dove |
|---|---|
| App bundle firmato (da caricare) | `build/app/outputs/bundle/release/app-release.aab` |
| APK firmato (per provare sul telefono) | `build/app/outputs/flutter-apk/app-release.apk` |
| Icona 512×512 | `store/icon-512.png` |
| Feature graphic 1024×500 | `store/feature-graphic-1024x500.png` (IT) / `-en.png` |
| Screenshot telefono 1080×1920 | `store/screenshots/it/` e `store/screenshots/en/` (4 + 4) |
| Testi della scheda | `store/listing_it.md`, `store/listing_en.md` |
| Privacy policy | `docs/privacy-policy.md` → pubblicare con GitHub Pages (sotto) |
| Chiave di upload | `android/upload-keystore.jks` + `android/key.properties` (**non** in git) |

Application ID: `it.liberalamente.app` · versione `1.0.0` (versionCode 1) · minSdk 24 · targetSdk 36.

## 0. Salva la chiave di upload (una volta sola)

Copia `android/upload-keystore.jks` e `android/key.properties` in un posto sicuro
(password manager, disco cifrato). Con Play App Signing la chiave di upload si
può resettare tramite supporto Google se la perdi, ma meglio non arrivarci.

## 1. Privacy policy online (5 minuti)

Su GitHub: repo → **Settings → Pages → Source: Deploy from a branch → main, cartella `/docs`** → Save.
Dopo un paio di minuti l'URL da usare nella console è:

`https://jackfioru92.github.io/libera-la-mente/privacy-policy.html`

(Il repo deve essere pubblico oppure serve GitHub Pro per Pages su repo privati.)

## 2. Google Play Console

1. **Account sviluppatore** (play.google.com/console): 25 $ una tantum; per un account personale Google
   chiede verifica identità e, dal 2024, **un test chiuso con almeno 12 tester per 14 giorni**
   prima di poter pubblicare in produzione. Mettilo in conto: Internal → Closed test → Production.
2. **Crea app**: nome "Libera la Mente", lingua predefinita Italiano, App, Gratuita.
3. **Configurazione app → Contenuto dell'app**, compilare:
   - *Norme sulla privacy*: l'URL del punto 1.
   - *Accesso all'app*: tutte le funzionalità disponibili senza accesso speciale.
   - *Annunci*: no.
   - *Classificazione contenuti*: questionario IARC → nessun contenuto sensibile → "Per tutti".
   - *Pubblico di destinazione*: 13+ (oppure 18+); non rivolta ai bambini.
   - *App per la salute*: dichiara che è un'app di benessere/meditazione, **non** un dispositivo medico.
   - *Sicurezza dei dati*: "Nessun dato raccolto o condiviso" (l'app non raccoglie nulla; i video sono
     riprodotti dal player YouTube, che è dichiarato nella privacy policy). Nessuna crittografia
     necessaria, nessuna richiesta di eliminazione dati perché non ci sono account.
   - *Funzionalità finanziarie*: nessuna (il caffè è un link esterno a PayPal).
   - *App governative / Notizie / COVID*: no.
4. **Scheda dello store principale** (italiano): copia da `store/listing_it.md`; carica icona,
   feature graphic, i 4 screenshot telefono. Aggiungi la traduzione **English (United Kingdom o
   United States)** da `store/listing_en.md` con gli screenshot `en/`.
5. **Test e rilascio → Test interno → Crea release**: Play App Signing (lasciare attivo, è quello
   che protegge la chiave vera), carica `app-release.aab`, note di rilascio dal listing. Aggiungi la tua
   email come tester e installa dal link.
6. Quando sei soddisfatto: **Test chiuso** (12 tester, 14 giorni) → richiedi accesso alla produzione
   → **Produzione**.

## 3. Prossime versioni

- In `pubspec.yaml` alza `version: 1.0.1+2` (il numero dopo `+` deve sempre crescere).
- `flutter build appbundle --release` → carica il nuovo AAB.
- Mai cambiare `applicationId` né perdere la chiave di upload.

## Prima di produzione (da valutare)

- Le clip vocali sono generate con edge‑tts (servizio Microsoft usato in modo non ufficiale):
  rigenerale con `tool/genera_voce.sh openai` o `eleven`, o registra una voce umana.
- Il link "Offrimi un caffè" usa il pagamento PayPal a importo libero: un link PayPal.Me è più pulito.
- La pillola del giorno e i video: controlla ogni tanto che i video siano ancora online (`tool/` → oEmbed).
