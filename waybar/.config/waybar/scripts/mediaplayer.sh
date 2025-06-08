#!/bin/bash

while true; do
	player_status=$(playerctl -p spotify_player status 2>/dev/null)
	artist=$(playerctl -p spotify_player metadata artist)
	title=$(playerctl -p spotify_player metadata title)
	
	if [ "$player_status" = "Playing" ]; then
		# Escape special characters for JSON
		artist=$(echo "$artist" | sed 's/&/&amp;/g')
		title=$(echo "$title" | sed 's/&/&amp;/g')

		echo '{"text": "'"$artist - $title"'", "class": "custom-spotify", "alt": "spotify"}'
	elif [ "$player_status" = "Paused" ]; then
		echo '{"text": "'"$artist - $title"'", "class": "custom-spotify", "alt": "spotify (Paused)"}'
	fi
	sleep 3
done