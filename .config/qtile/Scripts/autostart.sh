#!/bin/bash
#-- Autostart Programs --#
nm-applet & # nm-applet systray network applet
picom & # Launch picom compositor

#-- Set Wallpaper --#
nitrogen --restore &

