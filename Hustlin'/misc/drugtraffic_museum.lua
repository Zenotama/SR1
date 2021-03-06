---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: drugtraffic_museum
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk34", true )
	load_chunks("sr_chunk34_WH", "sr_chunk34")
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
end

function shot1()
	local excluded_lights_1 = {"BB Omni03", "BB Omni04", "BB Omni06", "BB Omni12", "BB Omni07", "drulab_FreeSpot07", "drulab_FreeSpot06", "BB PC Key Omni16"}
	light_set_lights(excluded_lights_1, 8, false)

	local included_lights_1 = {"BB Omni02", "BB Omni05", "BB Omni11", "BB Omni13", "BB Omni15"}
	light_set_lights(included_lights_1, 5, true)

	fade_in(0.5)
	select_slate("slate_druglab_museum")
	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", 5.671, -0.007, 0.89, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_1")
	teleport_to_slate_pos("CS_marvin", 1.921, 0.04, 0.703, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_1")
	set_level_lights(false)
	set_far_clip(70)
end

function shot2()
	local excluded_lights_2 = {"BB Omni03", "BB Omni06", "BB Omni12", "BB Omni13", "BB Omni07", "drulab_FreeSpot07", "drulab_FreeSpot06", "BB PC Key Omni16"}
	light_set_lights(excluded_lights_2, 8, false)

	local included_lights_2 = {"BB Omni02", "BB Omni04", "BB Omni05", "BB Omni11", "BB Omni15"}
	light_set_lights(included_lights_2, 5, true)

	teleport_to_slate_pos("#PLAYER#", 3.135, 0.0, 0.824, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_2")
	teleport_to_slate_pos("CS_marvin", 1.957, 0.041, 0.769, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_2")
	set_far_clip(70)
end

function shot3()
	local excluded_lights_3 = {"BB Omni03", "BB Omni04", "BB Omni05", "BB Omni06", "BB Omni11", "BB Omni12", "BB Omni13", "BB Omni07", "drulab_FreeSpot07", "drulab_FreeSpot06", "BB PC Key Omni16"}
	light_set_lights(excluded_lights_3, 11, false)

	local included_lights_3 = {"BB Omni02", "BB Omni15"}
	light_set_lights(included_lights_3, 2, true)

	teleport_to_slate_pos("#PLAYER#", 2.969, 0.005, 0.833, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_3")
	teleport_to_slate_pos("CS_marvin", 1.345, 0.042, 0.577, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_3")
	set_far_clip(70)
end

function shot4()
	local excluded_lights_4 = {"BB Omni03", "BB Omni04", "BB Omni06", "BB Omni12", "BB Omni07", "drulab_FreeSpot07", "drulab_FreeSpot06"}
	light_set_lights(excluded_lights_4, 7, false)

	local included_lights_4 = {"BB Omni02", "BB Omni05", "BB Omni11", "BB Omni13", "BB Omni15", "BB PC Key Omni16"}
	light_set_lights(included_lights_4, 6, true)

	teleport_to_slate_pos("#PLAYER#", 1.337, -0.011, 0.832, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_4")
	teleport_to_slate_pos("CS_marvin", -1.366, 0.076, 1.423, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_4")
	set_far_clip(70)
end

function shot5()
	local excluded_lights_5 = {"BB Omni03", "BB Omni04", "BB Omni06", "BB Omni12", "BB Omni13", "drulab_FreeSpot07", "drulab_FreeSpot06"}
	light_set_lights(excluded_lights_5, 7, false)

	local included_lights_5 = {"BB Omni02", "BB Omni05", "BB Omni11", "BB Omni07", "BB Omni15", "BB PC Key Omni16"}
	light_set_lights(included_lights_5, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.197, 0.004, 1.128, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_5")
	teleport_to_slate_pos("CS_marvin", -4.384, 0.043, 0.203, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_5")
	set_far_clip(70)
end

function shot6()
	local excluded_lights_6 = {"BB Omni03", "BB Omni04", "BB Omni06", "BB Omni12", "BB Omni07", "drulab_FreeSpot07", "drulab_FreeSpot06"}
	light_set_lights(excluded_lights_6, 7, false)

	local included_lights_6 = {"BB Omni02", "BB Omni05", "BB Omni11", "BB Omni13", "BB Omni15", "BB PC Key Omni16"}
	light_set_lights(included_lights_6, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.213, 0.005, 1.103, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_6")
	teleport_to_slate_pos("CS_marvin", -3.162, 0.044, 1.218, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_6")
	set_far_clip(70)
end

function shot7()
	local excluded_lights_7 = {"BB Omni03", "BB Omni04", "BB Omni06", "BB Omni12", "BB Omni13", "drulab_FreeSpot07", "drulab_FreeSpot06"}
	light_set_lights(excluded_lights_7, 7, false)

	local included_lights_7 = {"BB Omni02", "BB Omni05", "BB Omni11", "BB Omni07", "BB Omni15", "BB PC Key Omni16"}
	light_set_lights(included_lights_7, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.207, 0.006, 1.092, "slate_druglab_museum")
	play_custom_action_do("#PLAYER#", "drugTraffic_museum_player_7")
	teleport_to_slate_pos("CS_marvin", -3.183, 0.045, 1.288, "slate_druglab_museum")
	play_custom_action_do("CS_marvin", "drugTraffic_museum_marvin_7")
	delay(4.2)
	fade_out(0.5)
	set_far_clip(70)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	set_far_clip(5000)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_marvin")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_far_clip(5000)
end
