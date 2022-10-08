#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines
set -x

_DISTRO=$( (lsb_release -is || cat /etc/*release || uname -om) 2>/dev/null | head -n1 | awk '{print $1;}')
# install required packages
if [ "$_DISTRO" = "Fedora" ]; then
      bash "./install-packages-fedora.sh"
elif [ "$_DISTRO" = "Ubuntu" ] || which apt-get || which apt || which dpkg; then
      bash "./install-packages-debian.sh"
else
      echo "I couldn't tell the distro. Exiting..."
      exit 1
fi

# link dot files
bash "./dotfiles.sh"

# prepare modern space cadet
bash "./modern-space-cadet.sh"

echo "Done."
