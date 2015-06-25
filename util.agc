rem
rem BlockZ // util.agc
rem

rem Function to initialize core elements of the game
function initApp()
	
	rem Set resolution
	SetScreenResolution(720, 1280)
	SetDisplayAspect(9.0/16.0)
	
	g_DeviceWidth = getDeviceWidth()
	g_DeviceHeight = getDeviceHeight()
	
	
	rem Set orientation
	setOrientationAllowed(TRUE, FALSE, FALSE, FALSE)
	rem Use percentage system
	setDisplayAspect(g_DeviceWidth / g_DeviceHeight)
	rem Set refresh rate
	setSyncRate(0, 1)
	rem Set physics
	setPhysicsDebugOn()
	setPhysicsGravity(0.0, 0.0)
	
	rem Set platform
	if getDeviceName() = "windows"
		g_Platform = PLATFORM_PC
	elseif getDeviceName() = "android"
		g_Platform = PLATFORM_ANDROID
	endif
	
endfunction

