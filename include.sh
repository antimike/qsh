#!/bin/bash
# IO and convenience functions

__FORMAT__() {
    # Use `caller 0` or `caller 1`
    # Use FUNCNAME + case switching to determine output color
    # Can include fallbacks for when only POSIX `sh` is available
    # echo -e "\e[COLORmSample Text\e[0m"
    if [ $# -eq 0 ]; then
        cat -
    else
        echo "$@"   # Placeholder
    fi
    return $?
}

ERROR() {
    # Prints error message to stderr and exits
    # Calculates unique error code for each invocation in script based on line
    # number (so should only be invoked once per line)
    # Supports rudimentary templating: %Q is replaced by "queue '${QFILE}'"
    local context=( $(caller 0) )
    local -i errorno="$(grep -n "${FUNCNAME[0]}" "${context[2]}" |
        grep -n "${context[0]}" | cut -f1 -d':')"
    __FORMAT__ "$@"
    exit $errorno
} >&2

WARN() {
    __FORMAT__ "$@"
    return $?
}

NOTIFY() {
    __FORMAT__ "$@"
    return $?
}

YESNO() {
    read -s -n 1
    while :; do
        case "$REPLY" in
            [yY]|[nN]) break ;;
            *) WARN "Please press 'y/Y' for 'yes' or 'n/N' for 'no'." ;;
        esac
    done
    [ "${REPLY^^*}" == "Y" ]
    return $?
}

CHOOSE() {
    # TODO: Check / rewrite
    local -n ref="$1" && shift || return -1
    while :; do
        NOTIFY "Choose one of the following:" >&2
        select opt in "$@"; do
            for x in "${ref[@]}"; do
                [ "$x" == "$opt" ] && echo "$opt" && return 0
            done
            echo "Invalid choice." >&2
        done
    done
    return $?
}

PROMPT() {
    # TODO: Check for ways to __FORMAT__ correctly
    # (redirect stderr?)
    local var="$1"; shift
    read -p "$* " "$var"
}
