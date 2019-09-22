#"/bin/bash

asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git
~/.asdf/plugins/nodejs/bin/import-release-team-keyring &> /dev/null

sudo install nodejs 9.5.0

sudo npm install -g yarn
