rem
rem BlockZ // main.agc
rem

rem ### Includes ###
#include "constant.agc"
#include "util.agc"
#include "debug.agc"

#include "controls.agc"
#include "vector.agc"
#include "paddle.agc"
#include "game.agc"




rem ### Globals ###
global g_AppState as integer
global g_isDebugging = TRUE
global g_DeviceWidth as float
global g_DeviceHeight as float
global g_Platform as integer

global g_AccelX as float
global g_AccelY as float

rem global dim Blockz[10, 5] as t_Block
global Paddle as t_Paddle


rem Initialize application
initApp()

rem Force initial app state
setAppState(STATE_PREPARE_GAME)
rem MAIN GAME LOOP
do
	printDebugInfo()
	
	select getAppState()
		case STATE_MAIN_MENU:
		
		endcase
		case STATE_PREPARE_GAME
			rem Init game objects
			Paddle = initPaddle()
			
			setAppState(STATE_PLAYING)
		endcase
		case STATE_PLAYING:
			rem Use frametime for updating sprites
			t# = getFrameTime()
			
			rem Update controls
			updateDeviceDirection()
			rem Update game objects
			movePaddle(t#)
		endcase
	endselect

    Sync()
loop
