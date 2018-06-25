#!/bin/bash

# idk what this does
xrdb -merge .Xresources

# start the window compositor
compton --daemon &

# setting feh to do a slideshow but scalling the bg fucks it up hard so have to
# do this instead
while true
do
    ~/.fehbg
    sleep 900s
done &

# set up the name bar
# NOTE: Do not do xrandr in here. You get microstutters. Remember?
while true
do
    BAT="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
    PER=$($BAT | grep -E "percentage" | grep -oE [[:digit:]]+%)
    IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)
    DATE_TIME=$(date +%Z\=%Y-%m-%d\ %T)
    TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

    xsetroot -name "$IP BAT:$PER CPU:$TEMP $DATE_TIME"
    sleep 0.4s
done &

# finally start dwm
exec dwm
