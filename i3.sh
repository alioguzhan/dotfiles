#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

sudo -n true
test $? -eq 0 || exit 1

sudo apt install -y \
    i3 compton hsetroot rxvt-unicode xsel rofi rofi-dev fonts-noto \
    wmctrl xdotool libinput-tools playerctl \
    fonts-mplus fonts-font-awesome xsettingsd lxappearance \
    scrot viewnior maim libtool sysstat feh light

pip3 install spotify-cli-linux

mkdir -p "$HOME/.logs"
mv "$HOME"/.config/i3 "$HOME"/.config/i3.old 2>/dev/null || true
mv "$HOME"/.config/i3status "$HOME"/.config/i3status.old 2>/dev/null || true
mv "$HOME"/.config/i3blocks "$HOME"/.config/i3blocks.old 2>/dev/null || true

ln -fs "$PWD/i3-setup/i3" "$HOME/.config"
ln -fs "$PWD/i3-setup/i3status" "$HOME/.config" # i3status
ln -fs "$PWD/i3-setup/.Xresources" "$HOME/"
ln -fs "$PWD/i3-setup/.xsettingsd" "$HOME/"
ln -fs "$PWD/i3-setup/i3blocks" "$HOME/.config" # i3blocks

sudo chmod +s "$(which light)"
