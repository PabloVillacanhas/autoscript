#!/bin/bash
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
<<MERGE_FILES
Merge files by compare line by line and copy those lines that are not present 
in the second file from the first one.
	$1-First file
	$2-Second file
Returns 0 if no string was added, 1 otherwise.
MERGE_FILES
merge_files(){
	value=0;
	 while IFS="" read -r line
	 do
		 grep -qxF $line $2 || echo $line >> $2 && return value=1
	 done < $1
}
<<MERGE_FILE_BY_KEY
Merge files by compare two lines and copy those lines whose keys does not match
with the keys in the second file.
MERGE_FILE_BY_KEY
