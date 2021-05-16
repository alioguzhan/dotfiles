#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x


echo "Linking dotfiles to the home folder...."

mkdir -p "$HOME/.zfunc"

ln -fs "$PWD/.zshrc" "$HOME/.zshrc"
ln -fs "$PWD/.vimrc" "$HOME/.vimrc"
ln -fs "$PWD/.gitconfig" "$HOME/.gitconfig"
ln -fs "$PWD/.tmux.conf" "$HOME/.tmux.conf"
# i3
mkdir -p "$HOME/.logs"
mv "$HOME"/.config/i3 "$HOME"/.config/i3.old 2>/dev/null || true
mv "$HOME"/.config/i3status "$HOME"/.config/i3status.old 2>/dev/null || true
mv "$HOME"/.config/i3blocks "$HOME"/.config/i3blocks.old 2>/dev/null || true

ln -fs "$PWD/i3-setup/i3" "$HOME/.config"
ln -fs "$PWD/i3-setup/i3status" "$HOME/.config" # i3status
ln -fs "$PWD/i3-setup/dunstrc" "$HOME/.config/dunst/"
ln -fs "$PWD/i3-setup/.Xresources" "$HOME/"
ln -fs "$PWD/i3-setup/.xsettingsd" "$HOME/"
# ln -fs "$PWD/i3-setup/compton.conf" "$HOME/.config/"
ln -fs "$PWD/i3-setup/i3blocks" "$HOME/.config" # i3blocks

touch "$HOME/.env_secret" # This is where I keep my secret env variables.
echo "Done."