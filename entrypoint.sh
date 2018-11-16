#!/bin/sh -ex

if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
	## if not found, launch a new one
	eval `dbus-launch --sh-syntax`
	echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

sudo /usr/lib/systemd/systemd-udevd --daemon
sudo udevadm trigger
pulseaudio &

startx
