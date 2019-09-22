#!/bin/bash

. $HOME/.autoscript/configfiles/bashrc
cp $AUTOSCRIPT_PATH/configfiles/bashrc $HOME/.bashrc
. $HOME/.bashrc

. $AUTOSCRIPT_PATH/resources/constants
. $AUTOSCRIPT_PATH/resources/colors
. $AUTOSCRIPT_PATH/utils/systemutils.sh
. $AUTOSCRIPT_PATH/utils/ioutils.sh
. $AUTOSCRIPT_PATH/utils/fileutils.sh

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
fi
$AUTOSCRIPT_PATH/terminal/initconf.sh

#-----UPDATE UPGRADE AND INSTALL PACKAGES------
request_confirmation_default_y "Do you want to install dependencies?"
if [[ $? == 0 ]]; then
	$AUTOSCRIPT_PATH/dependencies/apt/dependencies.sh
	$AUTOSCRIPT_PATH/dependencies/git/dependencies.sh
	$AUTOSCRIPT_PATH/dependencies/node/dependencies.sh
fi

#---------------------TMUX---------------------
cp $AUTOSCRIPT_PATH/configfiles/tmux.conf $HOME/.tmux.conf

#---------------------GIT----------------------
cp $AUTOSCRIPT_PATH/configfiles/.gitconfig $HOME/.gitconfig

#-------------------SET AS COMMAND-------------
if [[ ! -f "/usr/local/bin/autoscript"  ]]; then
	sudo ln -s $AUTOSCRIPT_PATH/autoscript.sh /usr/local/bin/autoscript
fi
