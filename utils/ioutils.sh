<<<<<<< Updated upstream
#!/bin/bash

. $AUTOSCRIPT_PATH/resources/colors

=======
. $AUTOSCRIPT_PATH/resources/colors
>>>>>>> Stashed changes
<<REQUEST_CONFIRMATION
Request confirmation.
$1-Sentence before confirmation
Returns
0-Confirmation aproved
<<<<<<< Updated upstream
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
=======
1-COnfirmation ddenied
REQUEST_CONFIRMATION
request_confirmation(){
	printf "%b" "$1"
	read response
	echo "$response"
>>>>>>> Stashed changes
}
