#!/bin/bash

#-- Set Wallpaper --#
nitrogen --restore &

#-- Autostart Programs --#
nm-applet & # nm-applet systray network applet
picom & # Launch picom compositor
dunst & # Launch dunst notification daemon
