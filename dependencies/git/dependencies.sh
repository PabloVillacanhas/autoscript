#!/bin/bash

. utils/fileutils.sh
. versions

<<DOWNLOAD_REPO_VERSION
This method updates a repository at above specified version if it is not yet  
	$1-Repository url (absolute)
    $2-Local repository path
    $3-Version tag
DOWNLOAD_REPO_VERSION
download_repo_version() {
    repo=`echo $git | sed -En 's/.*\.com\/([a-z]?)/\1/p' | cut -d '.' -f 1`
    if [ ! -f $2 ]; then
        mkdir $2
        git clone $1 $2 --branch $3
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

#asdf
download_repo_version https://github.com/asdf-vm/asdf.git $HOME/.asdf $asdf_v
append_to_file_if_not_exists ". $HOME/.asdf/asdf.sh" $HOME/.zshrc "Import source code of asd to zsh"
append_to_file_if_not_exists $HOME/.asdf/completions/asdf.bash' >>~/.zshrc
