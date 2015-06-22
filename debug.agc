rem
rem BlockZ // debug.agc
rem
rem Contains a method for printing debugging info to the screen
rem




rem Print debug information on the screen
function printDebugInfo()


	rem If 'd' key is pressed, activate/deactivate debugging
	if getRawKeyPressed( 68 ) = TRUE
		if g_isDebugging = TRUE
			g_isDebugging = FALSE
			setPhysicsDebugOff()
		else
			g_isDebugging = TRUE
			setPhysicsDebugOn()
		endif
	endif	
	
	rem If debugging is activated, show debug info on the screen
	if g_isDebugging = TRUE
		setPrintSize( 2 )		
		
		print( "Last keycode: " + str( getRawLastKey() ) )
		print( "FPS = " + left( str( screenFPS() ), 6 ) )
		print( "W = " + str( g_DeviceWidth ) + ", H = " + str( g_DeviceHeight ) )
		print( "Sprite count: " + str( getManagedSpriteCount() ) )
		print( "Frame time: " + str( getFrameTime() ) )
		print("Main loop exec time: " + str(g_AppExecTime))
		print( "Accel.X : " + str(g_AccelX) + ", Accel.Y: " + str(g_AccelY) )
		print("Is ball launched: " + str(g_IsBallLaunched))
	endif
endfunction
