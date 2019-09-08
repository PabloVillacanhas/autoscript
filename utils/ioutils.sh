. $AUTOSCRIPT_PATH/resources/colors

#Abstraction of queries about perform actions
ask_confirmation() {
    echo "$2"
    read res
    if [[ res =~ [Yy][Ee][Ss] || -x $res ]]; then
        return 1
    else
        return 0
    fi
}

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
