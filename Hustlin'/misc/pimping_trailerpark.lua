---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: pimping_trailerpark
-- Exported By: Ding.Ye
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk10", true )
	load_chunks("sr_chunk10_trailer", "sr_chunk10" )
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
end

function shot1()
	fade_in(0.5)
	select_slate("slate_pimp_trailer")
	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", 3.773, 0.081, -0.095, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_1")
	teleport_to_slate_pos("CS_brian", -0.571, 0.632, 2.121, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_1")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_1")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_1")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_1")
	time_of_day_character_shadows_enable(false)
	set_level_lights(false)
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 2.126, 0.425, 0.623, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_2")
	teleport_to_slate_pos("CS_brian", -0.569, 0.63, 2.12, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_2")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_2")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_2")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 1.17, 0.618, 0.656, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_3")
	teleport_to_slate_pos("CS_brian", -0.564, 0.637, 2.123, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_3")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_3")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_3")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", 0.865, 0.602, 0.676, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_4")
	teleport_to_slate_pos("CS_brian", -0.537, 0.656, 2.109, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_4")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_4")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_4")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", 0.114, 0.638, 1.845, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_5")
	teleport_to_slate_pos("CS_brian", -0.473, 0.642, 1.267, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_5")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_5")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_5")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", 0.779, 0.618, 0.869, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_6")
	teleport_to_slate_pos("CS_brian", -0.494, 0.618, 1.435, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_6")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_6")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_6")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", 0.762, 0.618, 0.869, "slate_pimp_trailer")
	play_custom_action_do("#PLAYER#", "pimping_trailerpark_player_7")
	teleport_to_slate_pos("CS_brian", -0.481, 0.611, 1.462, "slate_pimp_trailer")
	play_custom_action_do("CS_brian", "pimping_trailerpark_brian_7")
	teleport_to_slate_pos("CS_CanPyramid", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_CanPyramid", "pimping_trailerpark_cans_7")
	teleport_to_slate_pos("CS_beercan", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_beercan", "pimping_trailerpark_can_7")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_pimp_trailer")
	play_custom_action_do("CS_chair", "pimping_trailerpark_chair_7")
	delay(3.96667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	time_of_day_character_shadows_enable(true)
	set_level_lights(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_brian")
	stop_custom_actions("CS_CanPyramid")
	stop_custom_actions("CS_beercan")
	stop_custom_actions("CS_chair")
	letterbox_fade_out(true)
	fade_out(0.5)
	time_of_day_character_shadows_enable(true)
	set_level_lights(true)
end
