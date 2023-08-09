music() {
  if [ "$1" = "0" ]; then
    eww open --toggle music_window_0
  elif [ "$1" = "1" ]; then
    eww open --toggle music_window_1
  fi
}

if [ "$1" = "music" ] && [ "$2" != "STOP" ]; then
  music "$3"
fi
