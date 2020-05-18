#!/bin/sh
picom &
feh --bg-fill ~/Pictures/Wallpapers/squares.png &
killall conky
sh ~/conky/conky.sh
barriers --enable-crypto
nextcloud &
