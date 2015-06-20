rem
rem BlockZ // util.agc
rem

rem Function to initialize core elements of the game
function initApp()
	g_DeviceWidth = getDeviceWidth()
	g_DeviceHeight = getDeviceHeight()
	
	rem Use percentage system
	setDisplayAspect(g_DeviceWidth / g_DeviceHeight)
	rem Set refresh rate
	setSyncRate(0, 1)
endfunction
