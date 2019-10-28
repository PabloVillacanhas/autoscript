#!/bin/bash

if [[ ! -f ~/.zshrc  ]]; then
	#Need revisitor for first instalation
	. terminal/zshrc
fi

. $AUTOSCRIPT_PATH/resources/constants
. $AUTOSCRIPT_PATH/resources/colors
. $AUTOSCRIPT_PATH/utils/systemutils.sh
. $AUTOSCRIPT_PATH/utils/ioutils.sh
. $AUTOSCRIPT_PATH/utils/fileutils.sh

#------------GLOBAL_VARS & CONSTANTS-----------
readonly VERSION=$(lsb_release -sr)
readonly DIST=$(lsb_release -si)
readonly DISTVERSION="$DIST $VERSION"
sudo cp $AUTOSCRIPT_PATH/terminal/profile /etc/profile

#--------------------USER----------------------
AUTOSCRIPT_PROFILE=${AUTOSCRIPT_PROFILEx:-"HOME"}

request_confirmation_default_y "You are $BGreen$(whoami)$Coloroff under $BYellow$DISTVERSION$Coloroff at $BCyan$AUTOSCRIPT_PROFILE$Coloroff are you sure yo want to continue?"
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
cp $AUTOSCRIPT_PATH/configfiles/tool-versions $HOME/.tool-versions
request_confirmation_default_y "Do you want to install dependencies?"
if [[ $? == 0 ]]; then
	$AUTOSCRIPT_PATH/dependencies/apt/dependencies.sh
	$AUTOSCRIPT_PATH/dependencies/git/dependencies.sh
	$AUTOSCRIPT_PATH/dependencies/node/dependencies.sh
	$AUTOSCRIPT_PATH/dependencies/flatpak/dependencies.sh
fi

#------------------SYNC APPS-------------------
$AUTOSCRIPT_PATH/apps/vscode/setup.sh

#---------------------TMUX---------------------
tmux source-file ~/.tmux.conf

#---------------------GIT----------------------
cp $AUTOSCRIPT_PATH/configfiles/.gitconfig $HOME/.gitconfig

#-------------------SET AS COMMAND-------------
if [[ ! -f "/usr/local/bin/autoscript"  ]]; then
	sudo ln -s $AUTOSCRIPT_PATH/autoscript.sh /usr/local/bin/autoscript
fi
