#!/bin/bash

prin=$(xrandr -q | cut -d ' ' -f1 | sed '2q;d')
sec=$(xrandr -q | cut -d ' ' -f1 | sed '27q;d')

if [ "$(xrandr -q | awk '/ connected / {print $1}' | wc -l)" -eq 2 ]; then
	xrandr --output $prin --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $sec --mode 1366x768 --pos 1920x0 --rotate normal --output Virtual3 --off --output Virtual4 --off --output Virtual5 --off --output Virtual6 --off --output Virtual7 --off --output Virtual8 --off
	sd "bspc monitor -d I II III IV V VI VII VII IX X;bspc monitor monitor1 -r" "bspc monitor Virtual1 -n monitor0;bspc monitor Virtual2 -n monitor1;bspc monitor monitor0 -d I II III IV V;bspc monitor monitor1 -d VI VII VIII IX X" ~/.config/bspwm/bspwmrc
elif [ "$(xrandr -q | awk '/ connected / {print $1}' | wc -l)" -eq 1 ]; then
	xrandr -s 1152x864
#	xrandr -s 1920x1080
	sd "bspc monitor $prin -n monitor0;bspc monitor $sec -n monitor1;bspc monitor monitor0 -d I II III IV V;bspc monitor monitor1 -d VI VII VIII IX X" "bspc monitor -d I II III IV V VI VII VII IX X;bspc monitor monitor1 -r"  ~/.config/bspwm/bspwmrc
else
	echo "x"
fi

pkill polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
polybar barup &
polybar bardown &
