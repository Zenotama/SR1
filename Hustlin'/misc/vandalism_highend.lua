---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: vandalism_highend
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk37b_nc", true)
	pvs_enable(false)
	time_of_day_lights_enable(false)
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
	thread_new_cutscene_shot("shot8", 8)
end

function shot1()
	local excluded_lights_1 = {"BB Omni03", "BB FreeSpot03", "BB Omni04", "BB Omni07", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_1, 7, false)

	local included_lights_1 = {"BB Omni01", "BB Omni02", "BB FreeSpot01", "BB Omni05", "BB Omni06", "BB Omni08", "BB Omni09"}
	light_set_lights(included_lights_1, 7, true)

	fade_in(0.5)
	select_slate("slate_vand_highend")
	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", 2.73, 0.0, 3.881, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_1")
	teleport_to_slate_pos("CS_mary", -3.474, 0.0, -1.585, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_1")
	spawning_remove_all()
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	thread_new("scripted_event4", 4)
	thread_new("scripted_event5", 5)
	set_level_lights(false)
	character_hide("CS_walker01")
	character_hide("CS_sitter01")
end

function shot2()
	local excluded_lights_2 = {"BB Omni01", "BB Omni02", "BB FreeSpot03", "BB Omni07", "BB Omni09", "BB Omni10"}
	light_set_lights(excluded_lights_2, 6, false)

	local included_lights_2 = {"BB Omni03", "BB FreeSpot01", "BB Omni04", "BB Omni05", "BB Omni06", "BB Omni08", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(included_lights_2, 8, true)

	teleport_to_slate_pos("#PLAYER#", 2.248, 0.0, 3.401, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_2")
	teleport_to_slate_pos("CS_mary", -3.526, 0.0, -1.622, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_2")
end

function shot3()
	local excluded_lights_3 = {"BB Omni03", "BB FreeSpot01", "BB FreeSpot03", "BB Omni04", "BB Omni07", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_3, 8, false)

	local included_lights_3 = {"BB Omni01", "BB Omni02", "BB Omni05", "BB Omni06", "BB Omni08", "BB Omni09"}
	light_set_lights(included_lights_3, 6, true)

	teleport_to_slate_pos("#PLAYER#", 1.228, 0.0, 2.318, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_3")
	teleport_to_slate_pos("CS_mary", -3.395, 0.0, -1.406, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_3")
end

function shot4()
	local excluded_lights_4 = {"BB Omni01", "BB Omni07", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_4, 5, false)

	local included_lights_4 = {"BB Omni02", "BB Omni03", "BB FreeSpot01", "BB FreeSpot03", "BB Omni04", "BB Omni05", "BB Omni06", "BB Omni08", "BB Omni09"}
	light_set_lights(included_lights_4, 9, true)

	teleport_to_slate_pos("#PLAYER#", 0.094, 0.0, 1.113, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_4")
	teleport_to_slate_pos("CS_mary", -3.248, 0.0, -1.667, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_4")
end

function shot5()
	local excluded_lights_5 = {"BB Omni01", "BB Omni02", "BB FreeSpot03", "BB Omni06", "BB Omni07", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_5, 8, false)

	local included_lights_5 = {"BB Omni03", "BB FreeSpot01", "BB Omni04", "BB Omni05", "BB Omni08", "BB Omni09"}
	light_set_lights(included_lights_5, 6, true)

	teleport_to_slate_pos("#PLAYER#", -0.838, 0.0, 0.295, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_5")
	teleport_to_slate_pos("CS_mary", -1.157, 0.0, -1.546, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_5")
end

function shot6()
	local excluded_lights_6 = {"BB Omni01", "BB Omni02", "BB FreeSpot03", "BB Omni06", "BB Omni07", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_6, 8, false)

	local included_lights_6 = {"BB Omni03", "BB FreeSpot01", "BB Omni04", "BB Omni05", "BB Omni08", "BB Omni09"}
	light_set_lights(included_lights_6, 6, true)

	teleport_to_slate_pos("#PLAYER#", -0.833, 0.0, 0.289, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_6")
	teleport_to_slate_pos("CS_mary", -1.131, 0.0, -1.532, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_6")
end

function shot7()
	local excluded_lights_7 = {"BB Omni01", "BB Omni02", "BB FreeSpot01", "BB FreeSpot03", "BB Omni06", "BB Omni07", "BB Omni09", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_7, 10, false)

	local included_lights_7 = {"BB Omni03", "BB Omni04", "BB Omni05", "BB Omni08"}
	light_set_lights(included_lights_7, 4, true)

	teleport_to_slate_pos("#PLAYER#", -0.818, 0.0, 0.287, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_7")
	teleport_to_slate_pos("CS_mary", -1.071, 0.0, -0.697, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_7")
end

function shot8()
	local excluded_lights_8 = {"BB Omni01", "BB Omni02", "BB FreeSpot03", "BB Omni06", "BB Omni07", "BB Omni10", "BB ShadowCaster Omni11", "BB Omni11"}
	light_set_lights(excluded_lights_8, 8, false)

	local included_lights_8 = {"BB Omni03", "BB FreeSpot01", "BB Omni04", "BB Omni05", "BB Omni08", "BB Omni09"}
	light_set_lights(included_lights_8, 6, true)

	teleport_to_slate_pos("#PLAYER#", -0.845, 0.0, 0.306, "slate_vand_highend")
	play_custom_action_do("#PLAYER#", "vandalism_highend_player_8")
	teleport_to_slate_pos("CS_mary", -1.19, 0.0, -0.472, "slate_vand_highend")
	play_custom_action_do("CS_mary", "vandalism_highend_mary_8")
	delay(3.3)
	fade_out(0.5)
	spawning_on()
end

function cutscene_abort()
	time_of_day_lights_enable(true)
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	spawning_on()
end

function cutscene_end()
	time_of_day_lights_enable(false)
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_mary")
	letterbox_fade_out(true)
	fade_out(0.5)
end

function scripted_event1()
	teleport("CS_dancer01", "CS_charnav-dancer-01_1")
	play_action_sequence("CS_dancer01", "dance b")
end

function scripted_event2()
	teleport("CS_dancer02", "CS_charnav-dancer-02_1")
	play_action_sequence("CS_dancer02", "dance a")
end

function scripted_event3()
	teleport("CS_sitter01", "CS_charnav-sitter-01_1")
	play_action_sequence("CS_sitter01", "sitting", "Sitting Eating")
end

function scripted_event4()
	teleport("CS_sitter02", "CS_charnav-sitter-02_1")
	play_action_sequence("CS_sitter02", "sitting")
end

function scripted_event5()
	teleport("CS_sitter03", "CS_charnav-sitter-03_1")
	play_action_sequence("CS_sitter03", "sitting")
end
