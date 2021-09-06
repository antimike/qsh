#!/bin/bash
# Functions and script for interpreting queue templates and dumping results to YAML-esque format

# IDEA: Use udev rule-like syntax for template modification (i.e., "+=" operator
# for arrays, ":=" for static defn, etc.)
__print_array() {
    local -n ref="$1"
    printf '%s\n' ""
}

__print_val() {
    # Default type is "string"
    # Idea: use "-m" for multiline / editable input
    local type="-s" decl=
    if [ "${1:0:1}" = "-" ]; then
        type="$1"; shift
    fi
    local -n ref="$1" &&
        decl="$(declare -p "$ref" 2>/dev/null)" ||
        return -1
    local val="${decl#*=}"
    case "$type" in
        -*A*) ;;
        -*a*) ;;
        *) echo "$defn"; return $? ;;
    esac
}

parsed="$(getopt -o "$(printf '%s' "${!opts[@]}")" \
    --long "$(printf '%s,' "${opts[@]}" | sed 's/,$//')")"

req() {
    :
}

opt() {
    :
}

def() {
    :
}

uid() {
    :
}

final() {
    :
}
