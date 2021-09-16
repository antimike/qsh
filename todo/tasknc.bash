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
    local repo="tasknc" dest="${SOURCE_DIR}/${repo}"
    local url="https://github.com/lharding/${repo}.git"
    git clone "$url" "$dest" && echo "$dest"
    return $?
}

main() {
    local cloned=
    cloned="$(_clone_repo)" &&
        _install_dependencies &&
        pushd "$cloned" >/dev/null &&
        _install_tasknc
    popd >/dev/null
}
