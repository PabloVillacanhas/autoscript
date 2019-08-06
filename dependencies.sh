#!/bin/bash

read -p "Do you want to install dependencies? [Y/n] " response

if [[ "$response" =~ ^[yY][eE][sS]|[yY]+$ ]]
then
	sudo apt update && sudo apt upgrade
	sudo apt install git tmux vim 
	sudo apt autoremove
else
	echo "Avoiding to install dependencies"
fi

