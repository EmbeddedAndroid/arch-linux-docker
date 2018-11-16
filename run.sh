#!/bin/sh

docker stop arch
docker rm arch

ARCH_USER="${ARCH_USER-osf}"

docker run -dit --restart=always --privileged \
        --name arch --net=host --tmpfs /tmp \
	-v /etc/machine-id:/etc/machine-id \
	-v $HOME:/home/$ARCH_USER \
	-v /run/user/1000/bus:/run/user/1000/bus \
	-v /dev:/dev \
	-v /var/run:/var/run \
	-e DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
	arch:i3
