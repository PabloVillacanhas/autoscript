#!/bin/bash

#---------------COMMON FUNCTIONS --------------
<<APPEND_TO_FILE
This method appends some string ONLY if it is not present yet 
	1-String to append
	2-File
	3-Task description
APPEND_TO_FILE
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

#---------------ZSH---------------
# Configure zsh via oh my zsh!
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Spaceship plugin & others
npm install -g spaceship-prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
append_to_file 'ZSH_THEME="spaceship"' $HOME/.zshrc "Spaceship setted as the ZSH theme"


# Set ZSH as default shell
chsh -s $(which zsh)
sed -ri "^\${USER}s@/bin/bash@/usr/bin/zsh/g" /etc/passwd

#LOGOUT to let thing take effect
