#!/bin/bash

declare SOURCE_DIR="${SOURCE_DIR:-$HOME/Source}"

_install_tasknc() {
    make
    sudo make install
    return $?
}

_install_dependencies() {
    local -a needs_dnf=(
        ncurses
        ncurses-devel
    )
    sudo dnf install -y "${needs_dnf[@]}" \
        --comment="Dependencies for tasknc"
    return $?
}

_clone_repo() {
    local repo="tasknc" 
    local dest="${SOURCE_DIR:-$HOME/Source}/${repo}"
    local url="https://github.com/lharding/${repo}.git"
    git clone "$url" "$dest" && echo "$dest"
    return $?
}

main() {
    local cloned=
    local -i status
    cloned="$(_clone_repo)" &&
        _install_dependencies &&
        pushd "$cloned" >/dev/null &&
        _install_tasknc
    status=$?
    popd >/dev/null
    exit $status
}

main "$@"
