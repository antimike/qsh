#!/bin/bash
# Installs Nix package manager and checks GPG sig

SIGNING_KEY="B541D55301270E0BCF15CA5D8170B4726D7198DE"
SKEY_URL=https://raw.githubusercontent.com/NixOS/nixos-homepage/master/edolstra.gpg
VERSION=2.4
NAME=nix
PKG=${NAME}-${VERSION}
BASE_URL=https://releases.nixos.org/nix
DOWNLOADS=~/Downloads

double_check_gpg_key() {
    diff <(echo "$1") \
        <(gpg --show-keys --with-fingerprint <(curl "$2") |
            sed -n '2p' |
            sed 's/[[:space:]]//g')
}

main() {
    if pushd $DOWNLOADS; then
        curl -o install-${PKG} ${BASE_URL}/${PKG}/install &&
            curl -o install-${PKG}.asc ${BASE_URL}/${PKG}/install.asc &&
            double_check_gpg_key "$SIGNING_KEY" "$SKEY_URL" &&
            gpg2 --recv-keys "$SIGNING_KEY" &&
            gpg2 --verify ./install-${PKG}.asc &&
            sh ./install-${PKG} &&
        popd
    else
        echo "Directory $DOWNLOADS not found" >&2
        exit 1
    fi
}

main
