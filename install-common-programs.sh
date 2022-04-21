#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

echo 'install oh-my-zsh...'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'install fnm...'
curl -fsSL https://fnm.vercel.app/install | bash

echo 'fnm zsh completions...'
fnm completions --shell zsh > ~/.zfunc/_fnm

echo 'install vimplug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'install ghcup ...'
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

echo 'install nodejs lts...'
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo 'install yarn...'
npm install --global yarn

echo 'Done.'