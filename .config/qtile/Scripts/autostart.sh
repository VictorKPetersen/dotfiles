#!/bin/bash

#-- Set Wallpaper --#
nitrogen --restore &

#-- Set colorscheme with pywal, do not set wallpaper --#
wal -R -n

#-- Autostart Programs --#
nm-applet & # nm-applet systray network applet
picom & # Launch picom compositor

#-- Opentabletdriver daemon --#
systemctl --user start opentabletdriver.service --now

