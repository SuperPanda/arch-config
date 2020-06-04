#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

BLUR="2x2"

$SCREENSHOT
convert $PICTURE -blur $BLUR -swirl 360 $PICTURE
#convert $PICTURE  -swirl 360 $PICTURE
i3lock -i $PICTURE -f -e
rm $PICTURE
