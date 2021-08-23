#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

sudo -n true
test $? -eq 0 || exit 1

echo "Distro is Debian based. Installing packages..."

sudo apt-get install -y \
      git curl neofetch vim i3 \
      htop zsh libboost-system-dev \
      libboost-thread-dev libboost-program-options-dev \
      libboost-test-dev libudev-dev libyaml-cpp-dev \
      libevdev-dev gcc g++ make cmake build-essential \
      wmctrl xdotool libinput-tools playerctl \
      compton hsetroot rxvt-unicode xsel rofi rofi-dev fonts-noto \
      fonts-mplus fonts-font-awesome xsettingsd lxappearance \
      scrot viewnior xclip maim libtool python3-pip sysstat feh light

pip3 install spotify-cli-linux

# reload fonts
fc-cache -fv