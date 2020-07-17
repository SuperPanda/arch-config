#!/bin/sh
picom -b;
sleep 1;
feh --bg-fill ~/Pictures/Wallpapers/squares.png &
if [ $DISPLAY = ":0" ];
then
	killall conky;
	sh ~/conky/conky.sh;
	barriers --enable-crypto;
fi
nextcloud &
