#!/bin/bash
. $AUTOSCRIPT_PATH/resources/constants
. $AUTOSCRIPT_PATH/resources/colors
. $AUTOSCRIPT_PATH/utils/fileutils.sh
. $AUTOSCRIPT_PATH/utils/sytemutils.sh

#------------GLOBAL_VARS & CONSTANTS-----------
readonly DIST=$(echo $(uname -v) | cut -d" " -f3)

#--------------------USER----------------------
printf "%b" "You are $BGreen$(whoami)$Coloroff under $BYellow$DIST$Coloroff distribution are you sure yo want to continue? y/n "
read response
if [[ ! $response == "y" ]]; then
	exit 1
fi

#---------------------ZSH----------------------
if [[ -z $ZSH ]]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	chsh -s $(which zsh)
else
	upgrade_oh_my_zsh
fi
#-----UPDATE UPGRADE AND INSTALL PACKAGES------
sudo chmod +x ./dependencies/apt/dependencies.sh
./dependencies/apt/dependencies.sh

#----------MANAGE GIT REPOSITORIES-------------
./dependencies/git/dependencies.sh

#---------------------TMUX---------------------
cp configfiles/.tmux.conf $HOME/.tmux.conf

#---------------------GIT----------------------
cp configfiles/.gitconfig $HOME/.gitconfig
