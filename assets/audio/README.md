# Clip della voce guida

Se in queste cartelle ci sono i file mp3, l'app li usa **al posto della sintesi
vocale**. È il modo per avere una voce davvero morbida: neurale (OpenAI,
ElevenLabs, Google) oppure umana, registrata con il telefono.

| File            | Italiano              | English            |
|-----------------|-----------------------|--------------------|
| `inhale.mp3`    | "Inspira"             | "Inhale"           |
| `hold.mp3`      | "Trattieni"           | "Hold"             |
| `exhale.mp3`    | "Espira"              | "Exhale"           |
| `complete.mp3`  | "Sessione completata" | "Session complete" |
| `test.mp3`      | "Voce guida attiva"   | "Voice guide on"   |

Cartelle: `it/` e `en/`. Bastano i primi tre; gli altri, se mancano, vanno in
sintesi. Mono, 44.1 kHz, sotto 1 secondo e mezzo, con mezzo secondo di silenzio
alla fine.

Le clip attuali (11/09/2026) sono generate con `tool/genera_voce.sh edge`:
voci neurali Microsoft **Isabella** (it) e **Ava** (en), ritmo -25%, tono -6 Hz.
Alternative già pronte in `design/voce/` (Elsa, Jenny). Nota: edge-tts usa il
servizio "Leggi ad alta voce" di Edge in modo non ufficiale — prima di
pubblicare sugli store valuta di rigenerarle con un servizio con licenza
chiara (OpenAI, ElevenLabs) o con una voce umana.

Generazione automatica: `tool/genera_voce.sh` (vedi commenti in testa al file).
Dopo aver aggiunto i file: `flutter clean && flutter run`.
