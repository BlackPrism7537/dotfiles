#!/bin/bash                                                       
#   _ _ _ _____ __    __    _____ _____ _____ _____ _____ 
#  | | | |  _  |  |  |  |  |  _  |  _  |  _  |   __| __  |
#  | | | |     |  |__|  |__|   __|     |   __|   __|    -|
#  |_____|__|__|_____|_____|__|  |__|__|__|  |_____|__|__|
#
#  by Bina


current_wp="$HOME/wallpapers/current_wallpaper"
blurred_wp="$HOME/wallpapers/current_wallpaper_blurred.jpg"
blur="50x30"

# write path to wp into file
if [ ! -f $current_wp ]; then
    touch $current_wp
    echo "$HOME/wallpapers/background_1.jpg" > "$current_wp"
fi

# current wallpaper path
current_wallpaper=$(cat "$current_wp")

# create pallete
wal -q -i $current_wallpaper

# launch waybar based on new wallpaper colors
source "$HOME/.cache/wal/colors.sh"
~/.config/waybar/launch.sh

# update soft link to cava colors based on wallpaper colors
# (cava needs to manually be restarted)
ln -sf "$HOME/.cache/wal/cava-colors" "$HOME/.config/cava/config"

# switch to new wallpaper with swww
transition_type="grow"
#transition_type="wipe"
# transition_type="random"

swww img $current_wallpaper \
    --transition-type=$transition_type \
    --transition-pos top-right

# create blurred wallpaper (for wlogout)
magick $current_wallpaper -resize 1920x1080\! $current_wallpaper
echo ":: Resized"
if [ ! "$blur" == "0x0" ] ; then
    magick $current_wallpaper -blur $blur $blurred_wp
    echo ":: Blurred"
fi