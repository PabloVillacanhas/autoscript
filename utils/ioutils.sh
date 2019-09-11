#!/bin/bash

. $AUTOSCRIPT_PATH/resources/colors

<<REQUEST_CONFIRMATION
Request confirmation.
$1-Sentence before confirmation
Returns
0-Confirmation aproved
1-Confirmation denied
REQUEST_CONFIRMATION
request_confirmation(){
	printf "%b" "$1 [Y/n]"
	read res
	if [[ $res =~ [Yy][Ee][Ss] || $res =~ ^[Yy]$ || -z $res ]]; then
		return 0
	else
		return 1
	fi
}
