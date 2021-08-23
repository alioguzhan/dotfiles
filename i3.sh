#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

mkdir -p "$HOME/.logs"
mv "$HOME"/.config/i3 "$HOME"/.config/i3.old 2>/dev/null || true
mv "$HOME"/.config/i3status "$HOME"/.config/i3status.old 2>/dev/null || true
mv "$HOME"/.config/i3blocks "$HOME"/.config/i3blocks.old 2>/dev/null || true

ln -fs "$PWD/i3-setup/i3" "$HOME/.config"
ln -fs "$PWD/i3-setup/i3status" "$HOME/.config" # i3status
ln -fs "$PWD/i3-setup/.Xresources" "$HOME/"
ln -fs "$PWD/i3-setup/.xsettingsd" "$HOME/"
ln -fs "$PWD/i3-setup/i3blocks" "$HOME/.config" # i3blocks
