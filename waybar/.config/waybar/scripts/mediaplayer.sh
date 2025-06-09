#!/bin/bash
PLAYERS="spotify_player firefox";
INCONS=" ";
META="{{ trunc(artist,17) }} - {{ trunc(title, 17) }}";

get_metadata () {
	echo "$(playerctl metadata --player $1 --format "{{ trunc(artist,17) }} - {{ trunc(title, 17) }}")"
}

get_icon () {
	if [ "$1" = "spotify_player" ]; then
		echo ""
	elif [[ $1 == *"firefox"* ]]; then
		echo ""
	else
		echo ""
	fi
}

PLAYER="spotify_player"
STATUS="$(playerctl --player=$PLAYER status 2>/dev/null)"

if [ "$STATUS" = "Playing" ]; then
	METADATA=$(get_metadata $PLAYER)
	ICON=$(get_icon $PLAYER)
	echo '{"text": "'"$ICON $METADATA"'", "class": "playing", "alt": "spotify"}'
elif [ "$STATUS" = "Paused" ]; then
	METADATA=$(get_metadata $PLAYER)
	ICON=$(get_icon $PLAYER)
	echo '{"text": "'"$ICON $METADATA"'", "class": "paused", "alt": "spotify (Paused)"}'
else 
	ICON=$(get_icon $PLAYER)
	echo '{"text": "'"$ICON"'", "class": "inactive", "alt": "spotify (Inactive)"}'
fi