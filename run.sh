#!/bin/sh -e

ARCH_USER="${ARCH_USER-osf}"

docker run --rm -it --privileged \
	-v /etc/machine-id:/etc/machine-id \
	-v $HOME:/home/$ARCH_USER \
	-v /run/user/1000/bus:/run/user/1000/bus \
	-e DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
	arch
