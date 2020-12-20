# Trackpad/Touchpad Gestures

Follow instructions at
[https://github.com/bulletmark/libinput-gestures](https://github.com/bulletmark/libinput-gestures).

In a nutshell:

```bash
# add user to input group
sudo gpasswd -a $USER input
# required packages
sudo apt-get install wmctrl xdotool
sudo apt-get install libinput-tools
# go home
cd ~
# clone the repository
git clone https://github.com/bulletmark/libinput-gestures.git .libinput-gestures
cd .libinput-gestures
# install it
sudo make install
# copy config files to home directory
cp /etc/libinput-gestures.conf ~/.config/libinput-gestures.conf
```

We are ready. Start the service:

```bash
libinput-gestures-setup autostart
libinput-gestures-setup start
```

