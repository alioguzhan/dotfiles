#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

if ! sudo -v; then
    error "Superuser not granted, aborting..."
    exit 1
fi

echo "Preparing modern-space-cadet..."

mkdir -p "$HOME/.modern-space-cadet"

_first=$PWD

cd "$HOME"                               # go home
mkdir -p "$HOME/.modern-space-cadet/src" # create a folder to keep everything
cd .modern-space-cadet/src               # a folder to keep source files and repos
rm -rf tools
git clone https://gitlab.com/interception/linux/tools
rm -rf dual-function-keys
git clone https://gitlab.com/interception/linux/plugins/dual-function-keys
cd tools
rm -rf build
mkdir build
cd build
cmake ..
make
sudo make install
cd ../../
cd dual-function-keys
make && sudo make install

cd "$_first" # go back to dotfiles folder

ln -fs "$PWD/modern-space-cadet/dual-function-keys.yaml" "$HOME/.modern-space-cadet/dual-function-keys.yaml"
sudo ln -fs "$PWD/modern-space-cadet/udevmon.yaml" /etc/udevmon.yaml
sudo ln -fs "$PWD/modern-space-cadet/udevmon.service" /etc/systemd/system/udevmon.service

sudo systemctl daemon-reexec
sudo systemctl enable --now udevmon
sudo systemctl start udevmon
