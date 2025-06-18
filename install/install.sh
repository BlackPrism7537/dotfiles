#!/bin/bash

#install yay
echo "---- Installing yay ----"

sudo pacman -S --needed base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;
cd ..;
rm -rf yay;

echo "---- yay Installed ----"
echo ""



#setting up yay
echo "---- Setting up yay ----"

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

echo "---- yay Setup ----"
echo ""

#list of packages to install
packages=(
    "hyprland"
    "hyprlock"
    "hypridle"
    "kitty"
    "rofi"
    "zsh"
    "waybar"
    "wlogout"
    "yazi"
    "pwal-git"
    "swww"
    "fastfetch"
    "btop"
    "cava"
    "zoxide"
)

#Installing Packages
echo "---- Installing packages ----"

for package in ${packages[@]}; do
    echo "installing $package"
    yay -S $package
done

echo "Installation Complete!!"