#!/bin/bash

#-- Set Wallpaper --#
# nitrogen --restore &

#-- Set colorscheme with pywal --#
#-- Do not set wallpaper mode --#
# wal -R -n

#-- Set wallpaper mode --#
wal -R

#-- Autostart Programs --#
nm-applet & # nm-applet systray network applet
picom & # Launch picom compositor
dunst & # Launch dunst notification daemon
