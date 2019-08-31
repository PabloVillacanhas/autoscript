#!/bin/bash

. resources/constants
. resources/colors
. resources/texts
. utils/fileutils.sh
. utils/ioutils.sh

#------------GLOBAL_VARS & CONSTANTS-----------
readonly DIST=$(echo $(uname -v) | cut -d" " -f3)

#--------------------USER----------------------
ask_confirmation $auth
echo "$?"
if [[ $? == 1 ]]; then
	echo "no confirmado"
	exit 1
fi

#-----UPDATE UPGRADE AND INSTALL PACKAGES------
./dependencies/apt/dependencies.sh

#----------MANAGE GIT REPOSITORIES-------------
./dependencies/git/dependencies.sh

#---------------------ZSH----------------------
if [[ -z $ZSH ]]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	chsh -s $(which zsh)
else
	upgrade_oh_my_zsh
fi
cp terminal/.zshrc $HOME/.zshrc
cp terminal/oh-my-zsh.sh $ZSH

#---------------------TMUX---------------------
cp configfiles/.tmux.conf $HOME/.tmux.conf

#---------------------GIT----------------------
cp configfiles/.gitconfig $HOME/.gitconfig
