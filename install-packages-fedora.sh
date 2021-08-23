#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

sudo -n true
test $? -eq 0 || exit 1

echo "Distro is Fedora. Installing pacakges..."

# I am using Ubuntu and Debian on my computers. 
# So the below list is not updated and probably not complete.
sudo dnf install -y git curl neofetch vim \
      @development-tools htop zsh cmake gcc-c++ \
      wmctrl xdotool libevdev-devel systemd-devel \
      yaml-cpp-devel boost-devel util-linux-user playerctl

echo "Disable Selinux (Do not forget to re-eanble this after setup."
sudo setenforce 0

pip3 install spotify-cli-linux
