#!/bin/bash

#---------------COMMON FUNCTIONS --------------
append_to_file () {
	if [ ! -f "$2" ]
	then
		touch "$2"
	fi

	local string_exists=( grep "$1" $2 ) 
	if [ -z "$string_exists" ] 
	then
		echo -e "$1" >> $2
	else
		echo "$3 already done"
	fi
}

#-----UPDATE UPGRADE AND INSTALL PACKAGES------
sudo chmod +x ./dependencies.sh
./dependencies.sh

#---------------TMUX---------------
def_tmux='if [[ ! $TERM =~ screen ]]; then
	exec tmux
fi'
append_to_file "$def_tmux" ~/.bashrc "Automatically init tmux when open terminal"

mouse_tmux='set -g mouse on'
append_to_file "$mouse_tmux" ~/.tmux.conf "Set mouse interaction in tmux"
#-----------
