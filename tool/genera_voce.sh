#!/bin/zsh
# Genera le clip della voce guida in assets/audio/{it,en}/.
#
#   OPENAI_API_KEY=sk-... tool/genera_voce.sh openai [voce]      # voce: nova (default), shimmer, coral
#   ELEVEN_API_KEY=...     tool/genera_voce.sh eleven <voice_id>
#                          tool/genera_voce.sh edge [voce]       # gratis, neurale (pip3 install edge-tts); it: Isabella/Elsa, en: Ava/Jenny
#                          tool/genera_voce.sh say                # voci macOS (qualità base, solo per provare)
#
# Le voci neurali (openai/eleven) sono molto più morbide della sintesi di
# sistema. In alternativa registra le parole con Memo Vocali e salvale con
# gli stessi nomi (vedi assets/audio/README.md).
set -euo pipefail
cd "$(dirname "$0")/.."
MODE=${1:-openai}; VOICE=${2:-nova}
STYLE="Parla molto lentamente, a bassa voce, con calore e calma, come una guida alla meditazione. Pausa breve alla fine."

typeset -A IT EN
IT=(inhale "Inspira" hold "Trattieni" exhale "Espira" complete "Sessione completata" test "Voce guida attiva")
EN=(inhale "Inhale" hold "Hold" exhale "Exhale" complete "Session complete" test "Voice guide on")

gen() { # lang key text
  local lang=$1 key=$2 text=$3 out="assets/audio/$1/$2.mp3"
  case $MODE in
    openai)
      curl -sS https://api.openai.com/v1/audio/speech \
        -H "Authorization: Bearer $OPENAI_API_KEY" -H "Content-Type: application/json" \
        -d "$(jq -n --arg t "$text" --arg v "$VOICE" --arg s "$STYLE" \
             '{model:"gpt-4o-mini-tts",voice:$v,input:$t,instructions:$s,response_format:"mp3",speed:0.85}')" \
        -o "$out" ;;
    eleven)
      curl -sS "https://api.elevenlabs.io/v1/text-to-speech/$VOICE?output_format=mp3_44100_64" \
        -H "xi-api-key: $ELEVEN_API_KEY" -H "Content-Type: application/json" \
        -d "$(jq -n --arg t "$text" '{text:$t,model_id:"eleven_multilingual_v2",voice_settings:{stability:0.7,similarity_boost:0.8,style:0.2}}')" \
        -o "$out" ;;
    edge)
      local v=$VOICE
      if [[ $VOICE == nova ]]; then [[ $lang == it ]] && v=it-IT-IsabellaNeural || v=en-US-AvaNeural; fi
      python3 -m edge_tts --voice "$v" --rate=-25% --pitch=-6Hz --text "$text" --write-media "$out" >/dev/null ;;
    say)
      local v; [[ $lang == it ]] && v=Alice || v=Samantha
      say -v "$v" -r 130 "$text" -o /tmp/voce.aiff && afconvert -f mp4f -d aac -b 64000 /tmp/voce.aiff "${out%.mp3}.m4a" \
        && ffmpeg -y -loglevel error -i "${out%.mp3}.m4a" "$out" && rm -f "${out%.mp3}.m4a" ;;
  esac
  echo "  $out"
}

echo "Italiano:"; for k in ${(k)IT}; do gen it $k "${IT[$k]}"; done
echo "English:";  for k in ${(k)EN}; do gen en $k "${EN[$k]}"; done
echo "Fatto. Ora: flutter clean && flutter run"
