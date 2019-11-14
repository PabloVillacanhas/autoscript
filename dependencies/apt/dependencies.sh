#!/bin/bash

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
	git \
	curl \
	apt-transport-https \
	tmux \
	xclip \
	vim \
	fonts-powerline \
	zsh \
	golang \
	fzf \
	postgresql-client-* \
	flatpak \
	code \
	openvpn \
	pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware


sudo apt autoremove -y

