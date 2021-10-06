#!/bin/zsh

_get_personal_repos() {
    for repo in $(find ~ -name ".git"); do
        pushd -q $(dirname $repo)
        { git remote -v | grep antimike; } >/dev/null 2>&1 && echo $(dirname $repo)
        popd -q
    done
}

_print_yaml() {
    yq './" "'
}
