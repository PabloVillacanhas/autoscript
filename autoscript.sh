#!/bin/bash
export AUTOSCRIPT_PATH=$(pwd)
. $AUTOSCRIPT_PATH/resources/constants
. $AUTOSCRIPT_PATH/resources/colors
. $AUTOSCRIPT_PATH/utils/systemutils.sh
. $AUTOSCRIPT_PATH/utils/ioutils.sh
. $AUTOSCRIPT_PATH/utils/fileutils.sh
#. $AUTOSCRIPT_PATH/utils/sytemutils.sh

#------------GLOBAL_VARS & CONSTANTS-----------
readonly DIST=$(echo $(uname -v) | cut -d" " -f3)

#--------------------USER----------------------
request_confirmation_default_y "You are $BGreen$(whoami)$Coloroff under $BYellow$DIST$Coloroff distribution are you sure yo want to continue?"
if [[ $? == 1 ]]; then
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
./dependencies/apt/dependencies.sh

#----------MANAGE GIT REPOSITORIES-------------
./dependencies/git/dependencies.sh

#---------------------TMUX---------------------
cp configfiles/.tmux.conf $HOME/.tmux.conf

#---------------------GIT----------------------
cp configfiles/.gitconfig $HOME/.gitconfig
