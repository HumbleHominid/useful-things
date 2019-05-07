#!/bin/bash

# start the window compositor
compton &

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
    KEEB=$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F "+" '{print $2}')

    # Audio stuff
    MATCHES=$(amixer -D pulse get Master | grep -o -i "\[on\]" | wc -l)
    VOL=$(awk -F "[][]" '/%/ { print $2 }' <(amixer -D pulse get Master) | tr '\n' ' ')

    if [ 0 -eq $MATCHES ]
    then
        VOL="Muted"
    fi

    OUT=

    if [ -e $IP ]
    then
        OUT=" $IP"
    fi

    OUT="$OUT $KEEB Volume:$VOL CPU:$TEMP $DATE_TIME "

    xsetroot -name "$OUT"
    sleep 0.1s
done &

# mouse speed for g507
xinput --set-prop 12 "libinput Accel Speed" -0.7

# finally start dwm
exec dwm
