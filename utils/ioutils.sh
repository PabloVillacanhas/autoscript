#!/bin/bash
. $AUTOSCRIPT_PATH/resources/colors

<<REQUEST_CONFIRMATION
Request confirmation.
$1-Sentence before confirmation
Returns $?
	0 if true
	1 if false
REQUEST_CONFIRMATION
request_confirmation_default_y(){
	printf "%b" "$1 Y/n "
	read response
	if [[ $response =~ [yes]|[yY] || -z $response ]];then
		return 0;
	else
		return 1;
	fi
}
