function chinatown_init()
end

function chinatown_main()
	--message("test chinatown") -- test
end

-- debug function - call from the console with 'lua' command
function warp_chinatown()
	message("warping...")
	delay(0)
	player_teleport(  "chinatown_$nav-warp")
end