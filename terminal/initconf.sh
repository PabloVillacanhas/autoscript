#!/bin/zsh
#If not exist directory do:
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions &> /dev/null
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &> /dev/null
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &> /dev/null
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k &> /dev/null
cp $AUTOSCRIPT_PATH/terminal/p10k $HOME/.p10k.zsh
cp $AUTOSCRIPT_PATH/terminal/zshrc $HOME/.zshrc
. $HOME/.zshrc
cp $AUTOSCRIPT_PATH/terminal/oh-my-zsh.sh $ZSH/oh-my-zsh.sh
. $ZSH/oh-my-zsh.sh

