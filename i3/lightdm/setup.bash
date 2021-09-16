#!/bin/bash
# Script to help with LightDM setup

source "`pwd`/../include.bash" || exit 1

main() {
    # see `man lightdm`
    # Available greeters:
    # - slick-greeter
    # - GTK (default)
    local greeter="$(INPUT "Enter desired greeter (blank for default):")"
    if [ -n "$greeter" ]; then
        dm-tool switch-to-greeter "$greeter"
    fi
}

main "$@"
