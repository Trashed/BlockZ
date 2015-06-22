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
#include "ball.agc"
#include "game.agc"




rem ### Globals ###
global g_AppState as integer
global g_isDebugging = TRUE
global g_DeviceWidth as float
global g_DeviceHeight as float
global g_Platform as integer

global g_AppExecTime as float

rem Some "mandatory" values in order to keep the game playing
global g_AccelX as float
global g_AccelY as float
global g_IsBallLaunched as integer

rem global dim Blockz[10, 5] as t_Block
global Paddle as t_Paddle
global Ball as t_Ball

rem Initialize application
initApp()

rem Force initial app state
setAppState(STATE_PREPARE_GAME)
rem MAIN GAME LOOP
do
	startTime# = timer()
	printDebugInfo()
	
	select getAppState()
		case STATE_MAIN_MENU:
		
		endcase
		case STATE_PREPARE_GAME
			rem Init game objects
			Paddle = initPaddle()
			Ball = initBall()
			
			
			setAppState(STATE_PLAYING)
		endcase
		case STATE_PLAYING:
			rem Use frametime for updating sprites
			t# = getFrameTime()
			
			rem Update controls
			updateDeviceDirection()
			rem Update game objects
			movePaddle(t#)
			updateBall()
		endcase
	endselect

	rem Calculate main loop execution time
	endTime# = timer()
	g_AppExecTime = endTime# - startTime#
	
    Sync()
loop
