rem
rem BlockZ // controls.agc
rem

rem Based on current platform, update device direction accordingly
function updateDeviceDirection()
	if g_Platform = PLATFORM_PC
		rem Keyboard
		g_AccelX = getDirectionX()
		g_AccelY = getDirectionY()
	elseif g_Platform = PLATFORM_ANDROID
	
	endif
endfunction

