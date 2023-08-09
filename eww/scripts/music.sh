#!/bin/bash
# scripts by adi1090x

## Get data
STATUS="$(mpc status)"
COVER="/tmp/.music_cover.png"
MUSIC_DIR="$HOME/Music"

## Get status
get_status() {
	if [[ $STATUS == *"[playing]"* ]]; then
		echo ""
  elif [[ $STATUS == *"[paused]"* ]]; then
    echo ""
	else
		echo "STOP"
	fi
}

## Get song
get_title() {
	song=`mpc -f %title% current`
	if [[ -z "$song" ]]; then
		echo "Offline"
	else
		echo "$song"
	fi	
}

## Get artist
get_artist() {
	artist=`mpc -f %artist% current`
	if [[ -z "$artist" ]]; then
		echo ""
	else
		echo "$artist"
	fi	
}

## Get album
get_album() {
	album=`mpc -f %album% current`
	if [[ -z "$album" ]]; then
		echo ""
	else
		echo "$album"
	fi	
}

## Get time
get_time() {
	time=`mpc status | grep "%)" | awk '{print $4}' | tr -d '(%)'`
	if [[ -z "$time" ]]; then
		echo "0"
	else
		echo "$time"
	fi	
}
get_ctime() {
	ctime=`mpc status | grep "#" | awk '{print $3}' | sed 's|/.*||g'`
	if [[ -z "$ctime" ]]; then
		echo "0:00"
	else
		echo "$ctime"
	fi	
}
get_ttime() {
	ttime=`mpc -f %time% current`
	if [[ -z "$ttime" ]]; then
		echo "0:00"
	else
		echo "$ttime"
	fi	
}

## Get cover
get_cover() {
	ffmpeg -i "${MUSIC_DIR}/$(mpc current -f %file%)" "${COVER}" -y &> /dev/null
	STATUS=$?

	# Check if the file has a embbeded album art
	if [ "$STATUS" -eq 0 ];then
		echo "$COVER"
	else
		echo "images/music.png"
	fi
}

## Get volume
get_volume() {
  volume=`mpc volume | awk '{print $2}' | tr -d '(%)'`
  if [[ -z "$volume" ]]; then
    echo "0"
  else
    echo $volume
  fi
}

## Execute accordingly
if [[ "$1" == "--title" ]]; then
	get_title
elif [[ "$1" == "--artist" ]]; then
	get_artist
elif [[ "$1" == "--album" ]]; then
  get_album
elif [[ "$1" == "--status" ]]; then
	get_status
elif [[ "$1" == "--time" ]]; then
	get_time
elif [[ "$1" == "--ctime" ]]; then
	get_ctime
elif [[ "$1" == "--ttime" ]]; then
	get_ttime
elif [[ "$1" == "--cover" ]]; then
	get_cover
elif [[ "$1" == "--volume" ]]; then
  get_volume
elif [[ "$1" == "--toggle" ]]; then
	mpc -q toggle
elif [[ "$1" == "--next" ]]; then
	{ mpc -q next; get_cover; }
elif [[ "$1" == "--prev" ]]; then
	{ mpc -q prev; get_cover; }
fi