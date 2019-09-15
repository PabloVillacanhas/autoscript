#!/bin/bash

read -p "Do you want to install dependencies? [Y/n] " response

if [[ $response =~ ^[yY][eE][sS]|[yY]+$ ]]; then
	sudo apt update && sudo apt upgrade

	sudo apt install \
		git \
		tmux \
		xclip \
		vim \
		fonts-powerline \
		zsh \
		npm \
		golang

	sudo apt autoremove
else
	echo "Avoiding installing dependencies"
fi

install_yarn(){
	sudo apt remove cmdtest
	sudo apt remove yarn
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update
	sudo apt install yarn
}
