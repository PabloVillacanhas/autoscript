#!/bin/bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
	git \
	tmux \
	xclip \
	vim \
	fonts-powerline \
	zsh \
	golang \
	fzf \
	postgresql-client-* \
	flatpak

sudo apt autoremove -y

