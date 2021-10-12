#!/bin/zsh
# Setup to allow global NPM installs without using sudo

export NPM_INSTALL_PREFIX=${NPM_INSTALL_PREFIX:-$HOME/.npm-packages}

mkdir -p $NPM_INSTALL_PREFIX
npm config set prefix $NPM_INSTALL_PREFIX

export PATH="$PATH:$NPM_INSTALL_PREFIX/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_INSTALL_PREFIX/share/man"
