#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

echo 'install vimplug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'install nodejs lts...'
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

mkdir -p ~/.npm-global
npm config set prefix "$HOME/.npm-global"

echo 'install yarn...'
npm install --global yarn

echo 'Done.'
