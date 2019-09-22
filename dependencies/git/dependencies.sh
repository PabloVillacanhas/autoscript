#!/bin/bash

. $AUTOSCRIPT_PATH/utils/fileutils.sh
. $AUTOSCRIPT_PATH/utils/systemutils.sh
. $AUTOSCRIPT_PATH/dependencies/git/versions

api_github="https://api.github.com/repos/"

<<DOWNLOAD_REPO_VERSION
This method updates a repository at above specified version if it is not yet  
	$1-Repository name
    $2-Local repository path
    $3-Version release 
DOWNLOAD_REPO_VERSION
download_repo_version() {
    repo=$(curl -s "$api_github$1" | grep -oP '"clone_url": "\K(.*)(?=")')
    version=$3
    if [[ $3 == "latest" ]];then
	    version=`curl --silent "$api_github$1/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
    fi
    repository_exists $2
    if [[ $? == 0 ]]; then
	    git -c advice.detachedHead=false clone --quiet --branch $version --depth 1 $repo $2
	    echo "$repo repository cloned in $2"
    else
        if [[ $(git -C $2 tag --points-at HEAD) != $version ]]; then
            git -C $2 pull $version 
    else
	    echo "$1 already in the desired version"
        fi
    fi
}

<<REPO_EXISTS
This method checks if repository already exists.
It also creates the path to directory if not exists
	$1-Local path to repository
Returns 0-Repo does not exists 
	1-Repo exists
REPO_EXISTS
repository_exists() {
	if [ ! -d $1 ];then
		mkdir -p $1
		return 0
	else
		if [ ! -d "$1/.git" ]; then
			return 0
		else
			return 1
		fi
	fi
}

#asdf
if [ -n `command_not_exists asdf` ]; then
	download_repo_version "$asdf_repo" $HOME/.asdf $asdf_v
	append_to_file_if_not_exists ". $HOME/.asdf/asdf.sh" $HOME/.zshrc "Import source functions of asdf to zsh"
	append_to_file_if_not_exists ". $HOME/.asdf/completions/asdf.bash" $HOME/.zshrc "Allow completion of asdf in zsh" 
	chmod +x $HOME/.asdf/asdf.sh
	chmod +x $HOME/.asdf/completions/asdf.bash
fi

#spaceship plugin
download_repo_version $spaceship_repo "$ZSH_CUSTOM/themes/spaceship-prompt" $spaceship_v
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 2> /dev/null
