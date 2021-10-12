#!/bin/zsh
# Ensures PulseAudio runs with adequate priority
# See https://askubuntu.com/questions/475987/a2dp-on-pulseaudio-terrible-choppy-skipping-audio

grp=audio
# For some reason this isn't working...
# TODO: Try autoloading with full function definition path
autoload colors
cat <<-MSG
${fg[blue]}
Append the file ./limits.conf to /etc/security/limits.conf.  This will ensure that PulseAudio runs with adequate priority, provided that the current user is added to the "$grp" group.  (This will be taken care of by this script.)

Adding user ${fg_bold[green]}$(whoami)${fg_bold[blue]} to group ${fg_bold[green]}${grp}${fg_bold[blue]}.
${reset_color}
MSG

if read -q "?${fg_bold[red]}Proceed?${reset_color} "; then
    echo && sudo usermod -aG $grp $(whoami)
else
    echo && echo "${fg_bold[red]}Aborted${reset_color}" >&2
fi
