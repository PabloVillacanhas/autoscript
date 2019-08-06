#!/bin/bash

#---------------COMMON FUNCTIONS --------------
append_to_file () {
	if [ ! -f "$2" ]
	then
		touch "$2"
	fi

	local string_exists=$( grep "$1" $2 ) 
	if [ -z "$string_exists" ] 
	then
		echo -e "$1" >> $2
		echo "$3 DONE"
	else
		echo "$3 already done"
	fi
}

#-----UPDATE UPGRADE AND INSTALL PACKAGES------
sudo chmod +x ./dependencies.sh
./dependencies.sh

#---------------TMUX---------------
def_tmux='if [[ -z "$TMUX" ]]; then
	if tmux has-session 2>/dev/null; then
		exec tmux attach
	else
		exec tmux
	fi
fi'
append_to_file "$def_tmux" ~/.bashrc "Automatically init tmux when open terminal"

mouse_tmux='set -g mouse on'
append_to_file "$mouse_tmux" ~/.tmux.conf "Set mouse interaction in tmux"

term='set -g default-terminal "tmux-256color"'
append_to_file "$term" ~/.tmux.conf "Set correct terminal in tmux"

#-----------
