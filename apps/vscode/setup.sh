#!/bin/bash

extensions=$(cat $AUTOSCRIPT_PATH/configfiles/vscode/vscode_extensions.list)
for x in $extensions
do
    code --install-extension $x
done
cp $AUTOSCRIPT_PATH/configfiles/vscode/user_settings.json $HOME/.config/Code/User/settings.json

