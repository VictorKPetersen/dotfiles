#!/bin/bash
#-- Autostart Programs --#
nm-applet & # nm-applet systray network applet
picom & # Launch picom compositor
flameshot & # Launch flameshot screenshot applet

#-- Set Wallpaper --#
nitrogen --restore &

