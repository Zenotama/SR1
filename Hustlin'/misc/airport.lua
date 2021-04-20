function airport_init()
end

function airport_main()
	--message("test airport") -- test
end

-- debug function - call from the console with 'lua' command
function warp_airport()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "airport_$nav-warp")
end