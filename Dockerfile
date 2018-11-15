FROM archlinux/base

ARG USERNAME=osf

RUN pacman --noconfirm -Syu i3-gaps i3-wm i3blocks i3lock i3status terminator dmenu xorg-server xf86-video-intel xf86-input-synaptics xorg-xrandr arandr xorg-xkill xorg-xinit alsa-utils aspell-en bash-completion openssh sudo unzip wget zip dnsutils firefox thunderbird chromium tex-gyre-fonts ttf-ubuntu-font-family ttf-dejavu ttf-liberation ttf-font-awesome pulseaudio pavucontrol git tig tk gvim xterm

RUN  groupmod -g 1000 users \
	&& groupmod -g 29 audio \
	&& useradd -ms /bin/bash $USERNAME -u 1000 -g users -G sys,adm,uucp,wheel,tty,log,audio

USER $USERNAME
COPY xinitrc /etc/X11/xinit/xinitrc
COPY entrypoint.sh /entrypoint.sh
COPY sudoer /etc/sudoers.d/users_group
COPY Xwrapper.config /etc/X11/
WORKDIR /home/$USERNAME

ENTRYPOINT /entrypoint.sh
