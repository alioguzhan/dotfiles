#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

if ! sudo -v; then
      error "Superuser not granted, aborting..."
      exit 1
fi

_DISTRO=$( (lsb_release -is || cat /etc/*release || uname -om) 2>/dev/null | head -n1 | awk '{print $1;}')

# install required packages
if [ "$_DISTRO" = "Ubuntu" ] || which apt-get || which apt || which dpkg; then
      echo "Distro is Debian based. Installing packages..."
      bash "./install-packages-debian.sh"
else
      echo "I couldn't tell the distro. Exiting..."
      exit 1
fi

# link dot files
bash "./dotfiles.sh"

# prepare modern space cadet
bash "./modern-space-cadet.sh"

# install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

echo "Done."
