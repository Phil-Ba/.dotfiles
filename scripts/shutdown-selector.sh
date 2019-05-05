#!/bin/bash

hibernate="Hibernate"
shutdown="Shutdown"
restart="Restart"
suspend="Suspend"

selected=$(echo -e "$hibernate|$shutdown|$suspend|$restart" | rofi -sep '|' -dmenu -p "Select action" -no-custom -no-fixed-num-lines)

echo $selected
locker=$HOME/.config/i3/lock
case $selected in
    $hibernate)
	$locker && systemctl hibernate
	;;
    $shutdown)
	$locker && systemctl poweroff
	;;
    $suspend)
	$locker && systemctl suspend
	;;
    $restart)
	systemctl reboot
	;;
esac
