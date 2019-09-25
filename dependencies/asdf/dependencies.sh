#!/bin/bash

asdf update

asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git

#~/.asdf/plugins/nodejs/bin/import-release-team-keyring &> /dev/null

asdf install nodejs 12.0.0

