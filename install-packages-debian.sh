#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

sudo -n true
test $? -eq 0 || exit 1

echo "Distro is Debian based. Installing packages..."

sudo apt-get install -y \
      git curl neofetch vim \
      htop zsh libboost-system-dev \
      libboost-thread-dev libboost-program-options-dev \
      libboost-test-dev libudev-dev libyaml-cpp-dev \
      libevdev-dev gcc g++ make cmake build-essential python3-pip \
      xclip gnome-weather chrome-gnome-shell fonts-jetbrains-mono pkg-config

# reload fonts
fc-cache -fv
