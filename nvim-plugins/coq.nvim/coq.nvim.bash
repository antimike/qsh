#!/bin/bash

if command -v apt >/dev/null 2>&1; then
	sudo apt install --yes -- python3-venv
elif command -v dnf >/dev/null 2>&1; then
	sudo dnf install -- python3-venv
fi
