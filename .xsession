#!/bin/bash

# idk what this does
xrdb -merge .Xresources

# start the window compositor
compton --daemon

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
    IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1)
    DATE_TIME=$(date +%Z\=%Y-%m-%d\ %T)
    TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

    xsetroot -name "$IP $NEMP $DATE_TIME"
    sleep 1s
done &

# finally start dwm
exec dwm
