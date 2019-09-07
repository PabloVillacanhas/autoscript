<<APPEND_TO_FILE
This method appends some string ONLY if it is not present yet 
	$1-String to append
	$2-File
	$3-Task description
APPEND_TO_FILE
append_to_file_if_not_exists() {
	if [ ! -f "$2" ]; then
		touch "$2"
	fi

	local string_exists=$(grep "$1" $2)
	if [ -z "$string_exists" ]; then
		echo "$1" >>$2
		echo "$3 DONE"
	else
		echo "$3 already done"
	fi
}