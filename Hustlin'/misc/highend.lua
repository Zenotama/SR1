function highend_init()
end

function highend_main()
	--message("test highend") -- test
end

-- debug function - call from the console with 'lua' command
function warp_highendretail()
	message("warping...")
	delay(0)
	player_teleport(  "highend_$nav-warp")
end