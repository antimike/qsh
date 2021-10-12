#!/bin/zsh

name=universal-ctags
url=https://github.com/$name/ctags.git
src=${SOURCE_DIR:-$HOME/Source}/$name
inst=/usr/local

{ command -v autoconf && command -v automake; } >/dev/null 2>&1 ||
    { echo "Autotools (autoconf and automake) not found" >&2; exit 1; }

if read -q "?Install $name to source dir $src and executable dir $inst? "; then
    echo
    git clone $url $src
    pushd $src
    ./autogen.sh
    ./configure --prefix=$inst
    make
    make install
    popd
fi
