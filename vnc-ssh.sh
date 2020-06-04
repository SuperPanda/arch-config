#killall Xephyr;
#Xephyr -screen 1920x1080 -resizeable -br -ac -noreset :1 &
#sleep 3;
DISPLAY=:1 ssh -Y -L xxxx:localhost:xxxx xxx.xxx.xxx.xxx;
