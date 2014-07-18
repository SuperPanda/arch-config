#!/bin/sh

# click to start, click to stop

if pidof conky | grep [0-9] > /dev/null
then
 exec killall conky
else
 exec conky -c ~/.conkyrc1 & exec conky -c ~/.conkyrc2 & exec 
conky -c ~/.conkyrc3

fi
