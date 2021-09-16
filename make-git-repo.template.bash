#!/bin/bash
# The following env variables should be assigned by the caller of this script:
# - SOURCE_DIR
# - REQUIRES
# - GITHUB_USER
# - GITHUB_REPO
# The following can be declared *optionally*, and will be assumed to have
# standard values unless otherwise specified:
# - CONFIG_CMDS : default is ( "make" "sudo make install" )

declare __NAME__=\
    "$(basename "$(readlink -m "${BASH_SOURCE[0]}")")"

if [ -z "${CONFIG_CMDS+x}" ]; then
    declare -a CONFIG_CMDS=( "make" "sudo make install" )
fi

_inform() {
    local ind='    '        # Indent
    echo "[${__NAME__}]: $1" >&2; shift;
    if [ $# -gt 0 ]; then
        printf "${ind}%s\n" "$@" >&2
    fi
}

_confirm() {
    echo "$*" >&2
    while true; do
        read -n 1 -s
        case "$REPLY" in
            y|Y) return 0 ;;
            n|N) return 1 ;;
            *) echo "Please answer [yY] for 'yes' or [nN] for 'no'." >&2 ;;
        esac
    done
}

_install() {
    _inform "Commands to execute:" "${CONFIG_CMDS[@]}"
    _confirm "Proceed?" &&
        for cmd in "$CONFIG_CMDS"; do
            $cmd; local -i status=$?;
            if [ $status -ne 0 ]; then 
                echo "Error executing command: $cmd" >&2
                return $status
            fi
        done
    return $?
}

_install_dependencies() {
    _inform "Dependencies to install:" "${REQUIRES[@]}"
    _confirm "Proceed?" &&
        sudo dnf install -y "${REQUIRES[@]}" \
            --comment="Dependencies for ${GITHUB_REPO}"
    return $?
}

_clone_repo() {
    dest="${SOURCE_DIR}/${GITHUB_REPO}"
    local url=\
        "https://github.com/${GITHUB_USER}/${GITHUB_REPO}.git"
    _inform "Cloning remote repo '${url}' to local directory '${dest}'"
    _confirm "Proceed?" &&
        git clone "$url" "$dest" && echo "$dest"
    return $?
}

main() {
    cat <<-INFORM >&2
		
		${__NAME__}
		$(tr [:graph:] [-*] <<<${__NAME__})
		This script will clone the source repo for the project '${GITHUB_REPO}' on
		Github to a local directory, after which any commands found in the array
		\${CONFIG_CMDS[@]} will be executed in the cloned repository.  If the array
		variable is unset, it will be assigned a value of 
		    ( "make" "sudo make install").
		
		INFORM
    _confirm "Proceed?" && {
        local cloned=
        cloned="$(_clone_repo)" &&
            _install_dependencies &&
            pushd "$cloned" >/dev/null &&
            _install
        popd >/dev/null
    }
    return $?
}
