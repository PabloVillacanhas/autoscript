#!/bin/bash

. utils/fileutils.sh
. utils/systemutils.sh
. versions

api_repos="https://api.github.com/repos/"

<<DOWNLOAD_REPO_VERSION
This method updates a repository at above specified version if it is not yet  
	$1-Repository url (absolute)
    $2-Local repository path
    $3-Version tag
DOWNLOAD_REPO_VERSION
download_repo_version() {
    repo=$(curl -s "$api_repos$1" | grep -oP '"clone_url": "\K(.*)(?=")')
    if [ ! -f $2 ]; then
        mkdir $2
        git clone repo --branch $3 --depth 1
        echo "$repo repository cloned in $2"
        return
    else
        cd $2
        if [ $(git tag --points-at HEAD) != $3 ]; then
            git pull $3
            echo "$repo now on $3"
        fi
    fi
}

<<DOWNLOAD_LATEST_REPO_VERSION
This method updates a repository to the last release version
	$1-Repository url (absolute)
    $2-Local repository path
DOWNLOAD_LATEST_REPO_VERSION
download_latest_repo_version() {
    version=$(curl -s "$api_repos$1/releases/latest" | grep -oP '"tag_name": "\K(.*)(?=")')
    git -C $2 pull $version
}

#asdf
if [ command_not_exists asdf ]; then
    download_latest_repo_version "$asdf_repo" $HOME/.asdf $asdf_v
    append_to_file_if_not_exists "$HOME/.asdf/asdf.sh" $HOME/.zshrc "Import source functions of asdf to zsh"
    append_to_file_if_not_exists "$HOME/.asdf/completions/asdf.bash" "Allow completion of asdf in zsh" >>~/.zshrc
fi

#spaceship plugin
if ! [ -d $ZSH_CUSTOM/themes/spaceship-prompt ]; then
    download_latest_repo_version $spaceship_repo $ZSH_CUSTOM/themes/spaceship-prompt
fi
