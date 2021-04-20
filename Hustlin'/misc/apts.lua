function apts_init()
end

function apts_main()
	--message("test apts") -- test
end

-- debug function - call from the console with 'lua' command
function warp_apartments()
	message("warping...")
	delay(0)
	player_teleport(  "apts_$nav-warp")
end