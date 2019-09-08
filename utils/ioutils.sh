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
