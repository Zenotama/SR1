


function screenshot_boom()
	group_create("test_one_$G_kaboom", true)	
	vehicle_detonate("screenshot_$v_boom")
	set_debug_game_paused()
end