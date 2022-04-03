#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x


echo "Linking dotfiles to the home folder...."

mkdir -p "$HOME/.zfunc"

ln -fs "$PWD/.zshrc" "$HOME/.zshrc"
ln -fs "$PWD/.vimrc" "$HOME/.vimrc"
ln -fs "$PWD/.gitconfig" "$HOME/.gitconfig"
ln -fs "$PWD/.tmux.conf" "$HOME/.tmux.conf"

touch "$HOME/.env.local" # This is where I keep my secret env variables.
touch "$HOME/.gitconfig.local"

echo "Done."
