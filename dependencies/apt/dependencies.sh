#!/bin/bash

#VIRTUALBOX
echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

#VSCODE
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#DOCKER & COMPOSE
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/debian \
	      $(lsb_release -cs) \
	         stable"
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
	git \
	curl \
	ca-certificates \
	gnupg2 \
	software-properties-common \
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
	traceroute \
	pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware \
	libcurl3 virtualbox-6.0 \
	docker-ce docker-ce-cli containerd.io

sudo apt autoremove -y

