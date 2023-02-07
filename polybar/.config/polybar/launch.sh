#!/usr/bin/env sh

killall -q polybar

#polybar example >> /tmp/polybar.log 2>&1 &
if type "xrandr"; then
  for m in $(xrandr --query | grep "connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done;
else
    polybar --reload example &
fi
