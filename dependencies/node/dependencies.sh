#!/bin/bash

asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git
~/.asdf/plugins/nodejs/bin/import-release-team-keyring &> /dev/null

asdf install nodejs 9.5.0

$(which npm) install -g yarn 
