# Immagini delle scene (generate con l'IA)

Le sei immagini attuali sono ritagli dei collage ChatGPT dell'11/09/2026
(originali e tutti i 31 ritagli in `design/ritagli/`), portate a 1080×1920 con
una leggera sfocatura per nascondere l'upscaling. Per una qualità migliore
rigenera ogni scena da sola in verticale (1024×1792 o superiore) e sovrascrivi
il file: nessuna modifica al codice.

Metti qui un file per scena, nome esatto:

| File                  | Scena                 |
|-----------------------|-----------------------|
| `scene_alba.jpg`      | Alba lenta            |
| `scene_pioggia.jpg`   | Pioggia alla finestra |
| `scene_foresta.jpg`   | Foresta nella nebbia  |
| `scene_notte.jpg`     | Notte di stelle       |
| `scene_oceano.jpg`    | Oceano calmo          |
| `scene_lavanda.jpg`   | Campo di lavanda      |

- Formato consigliato: JPG verticale 1080×1920 (9:16), qualità 80, < 400 KB.
- Se un file manca, la scena usa solo il gradiente animato: l'app funziona comunque.
- Dopo aver aggiunto i file: `flutter clean && flutter run` (gli asset vengono
  letti dal manifest all'avvio).

## Prompt suggeriti (Midjourney / DALL·E / Stable Diffusion)

Aggiungi sempre: `--ar 9:16`, "no text, no people, minimal, soft light, calm".

- **Alba lenta**: soft dreamy sunrise over misty hills, pastel peach and lavender sky, matte painting, gentle light
- **Pioggia alla finestra**: cozy window with raindrops at dusk, warm lamp light inside, blurred blue city lights outside, lo-fi anime style
- **Foresta nella nebbia**: quiet pine forest in soft morning fog, light rays between trees, muted green palette, serene
- **Notte di stelle**: calm night sky with soft stars over a still lake, deep indigo and violet, dreamy
- **Oceano calmo**: calm ocean at blue hour, long exposure, silky smooth water, soft gradient sky, peaceful
- **Campo di lavanda**: lavender field at golden hour, soft focus, warm and purple tones, peaceful

Le immagini vengono mostrate all'85% di opacità sopra il gradiente e "respirano"
(zoom leggero) durante la respirazione quadrata.
