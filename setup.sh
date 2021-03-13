#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1

echo "initial setup..."
sudo apt-get install -y libboost-system-dev \
      libboost-thread-dev libboost-program-options-dev \
      libboost-test-dev libudev-dev libyaml-cpp-dev \
      libevdev-dev cmake build-essential vim neofetch \
      wmctrl xdotool libinput-tools

mkdir -p $HOME/.zfunc

echo "Linking dotfiles to the home folder...."
ln -fs $PWD/.zshrc $HOME/.zshrc
ln -fs $PWD/.vimrc $HOME/.vimrc
ln -fs $PWD/.gitconfig $HOME/.gitconfig
ln -fs $PWD/.tmux.conf $HOME/.tmux.conf
echo "Done."

echo "Preparing modern-space-cadet..."
mkdir -p $HOME/.modern-space-cadet
ln -fs $PWD/modern-space-cadet/dual-function-keys.yaml $HOME/.modern-space-cadet/dual-function-keys.yaml
sudo ln -fs $PWD/modern-space-cadet/udevmon.yaml /etc/udevmon.yaml
sudo ln -fs $PWD/modern-space-cadet/udevmon.service /etc/systemd/system/udevmon.service

sudo systemctl enable --now udevmon
sudo systemctl start udevmon
sudo systemctl status udevmon
echo "Done."
