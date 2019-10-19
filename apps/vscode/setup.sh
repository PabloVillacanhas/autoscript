#!/bin/bash

extensions=$(cat $AUTOSCRIPT_PATH/configfiles/vscode/vscode_extensions.list)
for x in $extensions
do
    code --install-extension $x
done

