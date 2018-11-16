#!/bin/sh -ex

eval `dbus-launch --sh-syntax`
echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"

sudo /usr/lib/systemd/systemd-udevd --daemon
sudo udevadm trigger
pulseaudio &

startx
