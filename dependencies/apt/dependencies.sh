#!/bin/bash

read -p "Do you want to install dependencies? [Y/n] " response

if [[ $response =~ ^[yY][eE][sS]|[yY]+$ ]]; then
	sudo apt update && sudo apt upgrade -y

	sudo apt install -y \
		git \
		tmux \
		xclip \
		vim \
		fonts-powerline \
		zsh \
		npm \
		golang

	sudo apt autoremove -y
else
	echo "Avoiding installing dependencies"
fi

