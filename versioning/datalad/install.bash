#!/bin/bash
# Installs datalad to a virtualenv
# https://github.com/datalad/datalad

DATALAD_VENV=~/env/datalad
if [ "${VENVS@a}" -eq "A" ]; then
    if [ -z "${VENVS[datalad]+x}" ]; then
        export VENVS[datalad]="$DATALAD_VENV"
    else
        DATALAD_VENV="${VENVS[datalad]}"
    fi
fi

# Create and enter a new virtual environment (optional)
virtualenv --python=python3 "$DATALAD_VENV"
. "${DATALAD_VENV}/bin/activate"

# Install from PyPI
pip install datalad
