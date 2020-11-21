# Make AirPods work-ish on Linux


## Resources

- https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Bluetooth/#hsphfp
- https://support.system76.com/articles/bluetooth/
- https://askubuntu.com/questions/922860/pairing-apple-airpods-as-headset


## Required Programs

Reinstall below:

```bash
sudo apt install --reinstall bluez gnome-bluetooth indicator-bluetooth pulseaudio-module-bluetooth pavucontrol
```

Intall `blueman`:

```bash
sudo apt install blueman
```


## Configs

Open `/etc/bluetooth/main.conf` and Change `ControllerMode` to `bredr`:

Restart bluetooth service:

```bash
sudo /etc/init.d/bluetooth restart
```


## Use as Headset

Update discover module flags

```
sudo nano /etc/pulse/default.pa
```

Find the below line add `headset=ofono` to the end of it:

``` bash
load-module module-bluetooth-discover headset=ofono
```

Install `ofono`:

```bash
sudo apt install ofono
```

Load bluetooth modules:

```bash
load-module module-bluetooth-discover
load-module module-bluetooth-policy
```

```bash
cd /etc/pulse/default.pa
sudo nano /etc/pulse/default.pa
```

Update permission for bluetooth:

```bash
sudo usermod -aG bluetooth pulse
```

Open `/etc/dbus-1/system.d/ofono.conf` and put below:

```conf
  <policy user="pulse">
    <allow send_destination="org.ofono"/>
  </policy>
```

Check if modems are listed:

```bash
git clone git://git.kernel.org/pub/scm/network/ofono/ofono.git\n
cd ofono/test
./list-modems
```

Open `/etc/ofono/phonesim/default.conf` and put below:

```conf
[phonesim]
Driver=phonesim
Address=127.0.0.1
Port=12345
```

Start phonesim:

```bash
ofono -p 12345 /usr/share/phonesim/default.xml&
```

Enable modem:

```bash
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:"true"
```