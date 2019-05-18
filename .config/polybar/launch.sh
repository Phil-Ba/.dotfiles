#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#polybar -c ~/.config/polybar/config main &
# Solution from https://github.com/jaagr/polybar/issues/763 to polybar in
# multiple monitors

xrandr -q | grep " connected" | while read monitor; do
   echo "Launching " + $monitor
  if [[ $monitor == *"primary"* ]]
  then 
    tray_position=right
  else
    tray_position=none
  fi
  echo "tray="$tray_position
  echo "moni1="$monitor
  monitor=$(echo "$monitor" | cut -d ' ' -f1)
  echo "moni2="$monitor
  battery=$(ls -1 /sys/class/power_supply/ | grep BAT)
  BATTERY=$battery MONITOR=$monitor POLYBAR_TRAY=$tray_position polybar --reload --config=$HOME/.config/polybar/config main &

done


echo "Polybar launched..."
