git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ./zshrc $HOME/.zshrc
source $HOME/.zshrc
cp ./oh-my-zsh.sh $ZSH
source $HOME/oh-my-zsh.sh $ZSH
