#!/bin/env bash
# https://www.reddit.com/r/i3wm/comments/8ak3ix/different_background_image_per_workspace/
# Assigns wallpaper based on currently-active workspace

xprop -spy -root _NET_CURRENT_DESKTOP | while read -r event; do
    num=$(i3-msg -t get_workspaces | jq ".[] | select(.focused==true) | .num")
    feh --bg-fill "/home/$USER/pic/walls/${num}.jpg"
done
