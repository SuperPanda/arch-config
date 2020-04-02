#!/bin/sh

# click to start, click to stop

if pidof conky | grep [0-9] > /dev/null
then
 exec killall conky
else
 exec conky -c ~/conky/conkyrc1 & exec conky -c ~/conky/conkyrc2 & exec conky -c ~/conky/conkyrc3 & exec conky -c ~/conky/conkyrc4
fi
