#!/bin/bash

GITHUB_INSTALLER="../make-git-repo.template.bash"

if ! [ -x "$GITHUB_INSTALLER" ]; then
    echo "Install script '${GITHUB_INSTALLER}' not found or not executable" >&2
    exit 1
fi

declare -a CONFIG_CMDS=( "./configure" "make" "sudo make install" )
declare -a REQUIRES=( "ncurses-devel" )
GITHUB_USER="meskio" GITHUB_REPO="tudu" $GITHUB_INSTALLER
