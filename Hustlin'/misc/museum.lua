function museum_init()
end

function museum_main()
	--message("test museum") -- test
end

-- debug function - call from the console with 'lua' command
function warp_museum()
	message("warping...")
	delay(0)
	player_teleport( "museum_$nav-warp" )
end

function player_teleport( nav_name )
	if (is_player_in_vehicle()) then
		teleport_vehicle("#PLAYER#", nav_name )
	else
		teleport("#PLAYER#", nav_name )
	end
end