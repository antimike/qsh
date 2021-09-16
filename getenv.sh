#!/bin/sh
# Sets high-level env variables describing host

source "`pwd`/include.sh"

_get_template_vars() {
    :
}

_set_hostname() {
    # https://docs.fedoraproject.org/en-US/quick-docs/changing-hostname/
    local short="$(
        INPUT "Enter short hostname (use 'hostnamectl' to change later):"
    )"
    local long="$(
        INPUT "Enter long hostname:"
    )"
    local icon="$(
        INPUT "Enter icon name (blank for default):"
    )"
    sudo hostnamectl set-hostname --pretty "$long"
    sudo hostnamectl set-hostname --static "$short"
    if [ -n "$icon" ]; then
        sudo hostnamectl set-icon-name
    fi
}

main() {
    local template="`pwd`/template.env"
    while read -r line; do
        read -r varname default <<<"$line"
    done <$template
    _set_hostname
}
