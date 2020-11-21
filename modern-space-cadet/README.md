
# Modern Space Cadet by Steve Losh


## Download, Compile and Install

Install required packages:

```bash
sudo apt install libudev-dev libyaml-cpp-dev libevdev-dev cmake
```

Clone and install programs:

```bash
cd # go home
mkdir modern-space-cadet # create a folder to keep everything
mkdir src # create a folder to keep source files and repos
cd src
git clone https://gitlab.com/interception/linux/tools
git clone https://gitlab.com/interception/linux/plugins/dual-function-keys
cd tools
mkdir build
cd build
cmake ..
make
sudo make install
cd ../../
```

Install `Dual Function Keys`:

```bash
cd dual-function-keys
make && sudo make install
```

## Config and Service Files

Create `udevmon.yaml` file:

```bash
sudo nano /etc/udevmon.yaml
```

Paste below and save:

```yaml
- JOB: "intercept -g $DEVNODE | dual-function-keys -c /home/ali/.dual-function-keys.yaml | uinput -d $DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_LEFTSHIFT, KEY_RIGHTSHIFT, KEY_CAPSLOCK]
```

Create a systemd service to make it persistant:

```bash
sudo nano /etc/systemd/system/udevmon.service
```

Paste below and save:

```conf
[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/local/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target
```

Create a config file for `dual-function-keys`:

```bash
nano ~/.dual-function-keys.yaml
```

Paste below and save:

```yaml
# https://github.com/torvalds/linux/blob/master/include/uapi/linux/input-event-codes.h
TIMING:
  TAP_MILLISEC: 200
  DOUBLE_TAP_MILLISEC: 0

MAPPINGS:
  - KEY: KEY_LEFTSHIFT
    TAP: [KEY_LEFTSHIFT, KEY_9]
    HOLD: KEY_LEFTSHIFT
  - KEY: KEY_RIGHTSHIFT
    TAP: [KEY_RIGHTSHIFT, KEY_0]
    HOLD: KEY_RIGHTSHIFT
  - KEY: KEY_CAPSLOCK
    TAP: KEY_LEFTCTRL
    HOLD: KEY_LEFTCTRL
```

Finally, enable systemd service:

```bash
sudo systemctl enable --now udevmon
sudo systemctl start udevmon
sudo systemctl status udevmon
```

## Resources

- https://gitlab.com/interception/linux/tools
- https://gitlab.com/interception/linux/plugins/dual-function-keys
- https://github.com/alols/xcape/issues/122
