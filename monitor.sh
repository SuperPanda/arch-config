xrandr --newmode "1368x768"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync 
xrandr --addmode VGA1 1368x768
xrandr --output VGA1 --mode 1368x768
xrandr --output VIRTUAL1 --off --output LVDS1 --mode 1366x768 --pos 0x224 --rotate normal --output VGA1 --mode 1368x768 --pos 1366x0 --rotate normal
feh --bg-fill ~/Desktop/gdrive/wallpapers/squares.jpg

