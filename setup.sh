#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

sudo -n true
test $? -eq 0 || exit 1

echo "initial setup..."

_DISTRO=$( (lsb_release -is || cat /etc/*release || uname -om) 2>/dev/null | head -n1 | awk '{print $1;}')

if [ "$_DISTRO" = "Fedora" ]; then
      echo "Distro is Fedora. Installing pacakges..."
      sudo dnf install -y git curl neofetch vim \
            @development-tools htop zsh cmake gcc-c++ \
            wmctrl xdotool libevdev-devel systemd-devel \
            yaml-cpp-devel boost-devel util-linux-user playerctl
      echo "Disable Selinux temporarily..."
      sudo setenforce 0
      pip3 install spotify-cli-linux
elif [ "$_DISTRO" = "Ubuntu" ] || which apt-get || which apt || which dpkg; then
      echo "Distro is Debian based. Installing packages..."
      sudo apt-get install -y \
            git curl neofetch vim i3 \
            htop zsh libboost-system-dev \
            libboost-thread-dev libboost-program-options-dev \
            libboost-test-dev libudev-dev libyaml-cpp-dev \
            libevdev-dev cmake build-essential \
            wmctrl xdotool libinput-tools playerctl \
            compton hsetroot rxvt-unicode xsel rofi fonts-noto \
            fonts-mplus fonts-font-awesome xsettingsd lxappearance \
            scrot viewnior xclip maim
      pip3 install spotify-cli-linux
else
      echo "I couldn't tell the distro. Exiting..."
      exit 1
fi

mkdir -p "$HOME/.zfunc"

echo "Linking dotfiles to the home folder...."

ln -fs "$PWD/.zshrc" "$HOME/.zshrc"
ln -fs "$PWD/.vimrc" "$HOME/.vimrc"
ln -fs "$PWD/.gitconfig" "$HOME/.gitconfig"
ln -fs "$PWD/.tmux.conf" "$HOME/.tmux.conf"
# i3
mkdir "$HOME/.logs"
mv "$HOME"/.config/i3 "$HOME"/.config/i3.old 2>/dev/null || true
mv "$HOME"/.config/i3status "$HOME"/.config/i3status.old 2>/dev/null || true

ln -fs "$PWD/i3-setup/i3" "$HOME/.config"
ln -fs "$PWD/i3-setup/i3status" "$HOME/.config"
ln -fs "$PWD/i3-setup/dunstrc" "$HOME/.config/dunst/"
ln -fs "$PWD/i3-setup/.Xresources" "$HOME/"
ln -fs "$PWD/i3-setup/.xsettingsd" "$HOME/"
ln -fs "$PWD/i3-setup/compton.conf" "$HOME/.config/"

touch "$HOME/.env_secret" # This is where I keep my secret env variables.
echo "Done."

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

if [ "$_DISTRO" = "Fedora" ]; then
      sudo setenforce 1
fi

fc-cache -fv

echo "Done."
