#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

if ! sudo -v; then
      error "Superuser not granted, aborting..."
      exit 1
fi

sudo apt-get install -y \
      build-essential \
      chrome-gnome-shell \
      cmake \
      curl \
      fonts-jetbrains-mono \
      g++ \
      gcc \
      git \
      gnome-sushi \
      gnome-tweaks \
      gnome-weather \
      gthumb \
      htop \
      libboost-program-options-dev \
      libboost-system-dev \
      libboost-test-dev \
      libboost-thread-dev \
      libevdev-dev \
      libudev-dev \
      libyaml-cpp-dev \
      make \
      neofetch \
      pkg-config \
      python3-pip \
      vim \
      vlc \
      xclip \
      zsh

# reload fonts
fc-cache -fv
