#!/bin/bash
# Installs some cool fonts

_nerdfonts() {
    # Get other modules' font dependencies in Makefile
    local fonts="$@"
    local dir="${SOURCE_DIR:-$HOME/Source}/nerd-fonts"
    local url="https://github.com/ryanoasis/nerd-fonts"
    if declare -p CLONED_REPOS >/dev/null 2>&1; then
        CLONED_REPOS["$dir"]="$url"
    fi
    git clone --depth 1 "$url" "$dir"
    pushd "$dir"
    ./install.sh "$@"; local status=$?
    popd
    return $status
}

_powerline() {
    sudo dnf install powerline-fonts -y
    return $?
}

main() {
    _powerline
    _nerdfonts "$@"
    exit $?
}

main "$@"
