#!/bin/bash

hibernate="Hibernate"
shutdown="Shutdown"
suspend="Suspend"
selected=$(echo -e "$hibernate|$shutdown|$suspend" | rofi -sep '|' -dmenu -p "Select action" -only-match)

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
esac
