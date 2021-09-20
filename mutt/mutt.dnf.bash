#!/bin/bash
# Installation script for NeoMutt

NM_COPR_REPO="flatcap/neomutt"

sudo dnf copr enable "$NM_COPR_REPO"
sudo dnf install neomutt
