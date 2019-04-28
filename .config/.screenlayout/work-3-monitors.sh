#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 3840x120 --rotate normal --output DP1 --off --output DVI-I-3-2 --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DVI-I-2-1 --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output DP2 --off
sleep 1
#i3-msg move workspace number 1 to output DVI-I-3-2
#i3-msg move workspace number 2 to output DVI-I-2-1
i3-msg workspace number 1,move workspace to output DVI-I-3-2
i3-msg workspace number 2,move workspace to output DVI-I-2-1
#sleep 1
sh ~/.config/polybar/launch.sh
