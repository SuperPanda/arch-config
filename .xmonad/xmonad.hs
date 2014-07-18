import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import System.IO 
import XMonad.Actions.CycleWS
import XMonad.Actions.CycleWindows
import XMonad.Actions.RotSlaves
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.DynamicLog
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.SetWMName
--import XMonad.Layout.WindowNavigation
--import XMonad.Actions.Navigation2D
import qualified XMonad.StackSet as W

--myWorkspaces = ["1:main","2:web","3:communication","4:terminals","5:music","6:gimp"]

myManageHook = composeAll 
    [ 
    --className =? "Guake" --> doFloat
    --, className =? "Guake" --> transparency 0.2
    --, 
    manageDocks   
    ]

--myLayout = windowNavigation (Tall 1 (3/100) (1/2) ||| Mirror Tall 1 (3/100) (1/2) ||| Full)

main = do
       xmproc <- spawnPipe "/usr/bin/xmobar /home/panda/.xmobarrc"
       xmonad $ defaultConfig 
		{ manageHook = manageHook defaultConfig <+> manageDocks 
               	, layoutHook = avoidStruts $ layoutHook defaultConfig
                , startupHook = setWMName "LG3D"
		, handleEventHook = fullscreenEventHook
               	, logHook = dynamicLogWithPP xmobarPP 
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = xmobarColor "blue" "" . shorten 37
			, ppLayout = const "" -- to disable the layout info on xmobar
			}
                        >> updatePointer (Relative 0.02 0.02)
               , modMask = mod4Mask	-- Rebind mod to Windows key		
               , terminal = "xfce4-terminal"
               } `additionalKeys`
               [ ((mod4Mask, xK_z), spawn "i3lock -i /home/panda/Pictures/wallpapers/squares.png -z")
               , ((mod4Mask .|. shiftMask, xK_z), spawn "i3lock -i /home/panda/Pictures/wallpapers/squares.png -z && systemctl suspend")
               --, ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
               , ((mod4Mask, xK_f), spawn "firefox")
               --, ((mod4Mask, xK_t), spawn "thunderbird")
               , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
               , ((0, xK_Print), spawn "scrot")
	       --, ((mod4Mask, xK_n), spawn "calcurse")
               , ((mod4Mask,   xK_Right     ), moveTo Next HiddenNonEmptyWS)
               , ((mod4Mask .|. shiftMask,     xK_Right     ), shiftToNext >> nextWS)
               , ((mod4Mask .|. controlMask, xK_Right ), moveTo Next EmptyWS)
               , ((mod4Mask,   xK_Left      ), moveTo Prev HiddenNonEmptyWS)
               , ((mod4Mask .|. shiftMask,     xK_Left      ), shiftToPrev >> prevWS)
               , ((mod4Mask .|. controlMask, xK_Left ), moveTo Prev EmptyWS)
	       --, ((mod4Mask, xK_KP_Up), rotFocusedUp)
               --, ((mod4Mask, xK_KP_Down), rotFocusedDown)
               , ((mod4Mask, xK_q), rotAllUp)
               , ((mod4Mask, xK_a), rotAllDown)
               , ((mod4Mask,     xK_r      ), spawn "dmenu_run")
		,((mod4Mask,	xK_b	), sendMessage ToggleStruts)
		,((mod4Mask, xK_Tab), windows W.focusDown) 
		--,((mod4Mask, xK_KP_Left), windowGo L False)
		,((mod4Mask .|. shiftMask, xK_Tab), windows W.focusUp)
		--,((mod4Mask, xK_KP_Down), windowGo D False)
		,((mod4Mask,	xK_c	), spawn "/home/panda/scripts/conky.sh")
		,((0, 0x1008FF12), spawn "amixer set Master toggle")
		,((0, 0x1008FF13), spawn "amixer set Master 2+")
		,((0, 0x1008FF11), spawn "amixer set Master 2-")
               ]
