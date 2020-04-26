#!/bin/sh
xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x312 --rotate normal --output VGA1 --off --output VIRTUAL1 --off --output VGA-1-2 --off --output HDMI-1-1 --mode 1920x1080 --pos 1366x0 --rotate normal
feh --bg-fill ~/Pictures/perth.jpg &
picom &
killall conky
sh ~/conky/conky.sh
