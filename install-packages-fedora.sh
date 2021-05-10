#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

sudo -n true
test $? -eq 0 || exit 1

echo "Distro is Fedora. Installing pacakges..."

sudo dnf install -y git curl neofetch vim \
      @development-tools htop zsh cmake gcc-c++ \
      wmctrl xdotool libevdev-devel systemd-devel \
      yaml-cpp-devel boost-devel util-linux-user playerctl

echo "Disable Selinux"
sudo setenforce 0

pip3 install spotify-cli-linux
