#!/bin/sh -ex

sudo /usr/lib/systemd/systemd-udevd --daemon
sudo udevadm trigger

startx
