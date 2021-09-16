#!/bin/bash
# tmux alias to be sourced at startup
# Allows tmux service to survive logout

tmux() {
    systemd-run --scope --user tmux "$@"
}
