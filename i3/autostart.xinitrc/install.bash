#!/bin/bash
# Script to install i3 "the old-fashioned way," autostarting with .xinitrc
# See https://gist.github.com/fntlnz/0572761e0a6d7bdda2af

echo "exec i3" >>~/.xinitrc
sudo sed -i '/user-session=/c\user-session=i3' /etc/lightdm/lightdm.conf
{ 
    sudo systemctl mask gdm.service
    sudo dnf remove gdm
} 2>/dev/null
dconf write /org/gnome/software/download-updates false
systemctl enable lightdm.service
