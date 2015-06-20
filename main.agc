rem
rem BlockZ // main.agc
rem

rem ### Includes ###
#include "debug.agc"
#include "util.agc"

#include "vector.agc"
#include "paddle.agc"



rem ### Constants ###
#constant TRUE	1
#constant FALSE	0

#constant STATIC	1
#constant DYNAMIC	2


rem Globals
global g_isDebugging = TRUE
global g_DeviceWidth as float
global g_DeviceHeight as float

rem global dim Blockz[10, 5] as t_Block
global Padde as t_Paddle



rem Initialize application
initApp()



rem MAIN GAME LOOP
do
	printDebugInfo()

    Sync()
loop
