#!/bin/bash
# Installs both free and nonfree RPM Fusion repos

RPMF_BASE="https://mirrors.rpmfusion.org"
RELEASE="$(rpm -E %fedora)"

_usage() {
    cat <<-USAGE
		Usage: ${BASH_SOURCE[0]} [free] [nonfree]
		USAGE
}

_install() {
    local -a urls=( )
    while [ $# -gt 0 ]; do
        local suffix="${1}/fedora/rpmfusion-${1}-release-${RELEASE}.noarch.rpm"
        urls+=( "${RPMF_BASE}/${suffix}" )
        shift
    done
    sudo dnf install -y "${urls[@]}"
    return $?
}

main() {
    if [ $# -eq 0 ]; then
        _usage >&2; exit 1;
    fi
    echo "Install the following RPM fusion repos?"
    printf '    - %s\n' "$@"
    read -n 1 -sp "[yY] for yes "
    case "$REPLY" in
        y|Y) _install "$@" ;;
        *) echo "Aborting" >&2 && exit -1 ;;
    esac
    exit $?
}

main "$@"
