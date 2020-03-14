#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

BLUR="4x3"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
convert $PICTURE  -swirl 360 $PICTURE
i3lock -i $PICTURE -f -e
rm $PICTURE
