#!/bin/sh -e
docker stop arch
docker rm arch

ARCH_USER="${ARCH_USER-osf}"

docker run --rm -it --privileged --name arch --net=host --tmpfs /tmp \
	-v /etc/machine-id:/etc/machine-id \
	-v $HOME:/home/$ARCH_USER \
	-v /run/user/1000/bus:/run/user/1000/bus \
	-v /dev:/dev \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-e DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
	arch:i3
