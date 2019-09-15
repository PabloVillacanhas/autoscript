. $AUTOSCRIPT_PATH/resources/colors
<<REQUEST_CONFIRMATION
Request confirmation.
$1-Sentence before confirmation
Returns
0-Confirmation aproved
1-COnfirmation ddenied
REQUEST_CONFIRMATION
request_confirmation(){
	printf "%b" "$1"
	read response
	echo "$response"
}