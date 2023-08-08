#!/bin/bash
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ' ' '{print $2}')"
muted="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ' ' '{print $3}')"

volume=$(echo "$volume * 100 / 1" | bc)

if [ "$muted" == "[MUTED]" ]; then
  icon="󰝟"
elif [ $volume == 0 ]; then
  icon="󰕿"
elif [ $volume -lt 50 ]; then
  icon="󰖀"
else
  icon="󰕾"
fi

echo "$icon $volume% "
