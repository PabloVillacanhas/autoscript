#!/bin/bash

<<COMMAND_NOT_EXISTS
This method updates a repository at above specified version if it is not yet  
	$1-Command

    If something is retrieved, the command does not exist
COMMAND_NOT_EXISTS
command_not_exists () {
    #Command send to stdout the location of the program if it exists.
    #If nothing is sent neither stdout nor stderr(program does not exist), the pipe reaches the || operator and echoes something
    command -v $1 >/dev/null 2>&1 || echo "1"
}
