#!/bin/sh
xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DVI-I-3-2 --off --output DVI-I-2-1 --off

sleep 1
sh ~/.config/polybar/launch.sh
