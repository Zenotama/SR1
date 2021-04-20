---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: lc04_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk02", true)
	load_chunks("sr_chunk02_mec", "sr_chunk02")
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
	thread_new_cutscene_shot("shot8", 8)
	thread_new_cutscene_shot("shot9", 9)
	thread_new_cutscene_shot("shot10", 10)
	thread_new_cutscene_shot("shot11", 11)
end

function shot1()
	local excluded_lights_1 = {"mechOmni11", "mechOmni13", "mechOmni14"}
	light_set_lights(excluded_lights_1, 3, false)

	local included_lights_1 = {"mechOmni04", "mechOmni10", "mechOmni12", "GB_FreeSpot05", "GB_FreeSpot06"}
	light_set_lights(included_lights_1, 5, true)

	fade_in(0.5)
	select_slate("slate_samsons_garage")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_dex", 4.284, 0.006, 5.242, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_1")
	teleport_to_slate_pos("CS_troy", 2.076, 0.003, 0.163, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_1")
	teleport_to_slate_pos("#PLAYER#", -7.813, -0.011, 0.604, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_1")
	set_level_lights(false)
	tree_shadows_enable(false)
	set_far_clip(100)
	character_hide("CS_dex")
end

function shot2()
	local excluded_lights_2 = {"mechOmni10", "GB_FreeSpot05", "mechOmni14", "GB_FreeSpot06"}
	light_set_lights(excluded_lights_2, 4, false)

	local included_lights_2 = {"mechOmni04", "mechOmni11", "mechOmni12", "mechOmni13"}
	light_set_lights(included_lights_2, 4, true)

	teleport_to_slate_pos("CS_dex", 4.637, 0.005, 2.908, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_2")
	teleport_to_slate_pos("CS_troy", 1.037, 0.004, 0.397, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_2")
	teleport_to_slate_pos("#PLAYER#", -1.948, -0.009, 0.044, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_2")
	set_far_clip(20)
	character_show("CS_dex")
end

function shot3()
	local excluded_lights_3 = {"mechOmni11", "mechOmni13", "mechOmni14"}
	light_set_lights(excluded_lights_3, 3, false)

	local included_lights_3 = {"mechOmni04", "mechOmni10", "mechOmni12", "GB_FreeSpot05", "GB_FreeSpot06"}
	light_set_lights(included_lights_3, 5, true)

	teleport_to_slate_pos("CS_dex", 4.001, 0.006, 2.148, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_3")
	teleport_to_slate_pos("CS_troy", 1.025, 0.01, 0.422, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_3")
	teleport_to_slate_pos("#PLAYER#", -1.86, 0.004, -0.088, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_3")
	set_far_clip(90)
end

function shot4()
	local excluded_lights_4 = {"mechOmni11", "mechOmni13", "GB_FreeSpot05", "mechOmni14", "GB_FreeSpot06"}
	light_set_lights(excluded_lights_4, 5, false)

	local included_lights_4 = {"mechOmni04", "mechOmni10", "mechOmni12"}
	light_set_lights(included_lights_4, 3, true)

	teleport_to_slate_pos("CS_dex", 2.907, 0.006, 2.384, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_4")
	teleport_to_slate_pos("CS_troy", 1.167, 0.003, 0.325, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_4")
	teleport_to_slate_pos("#PLAYER#", -1.848, 0.005, -0.053, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_4")
	set_far_clip(20)
end

function shot5()
	local excluded_lights_5 = {"mechOmni11", "mechOmni13", "mechOmni14"}
	light_set_lights(excluded_lights_5, 3, false)

	local included_lights_5 = {"mechOmni04", "mechOmni10", "mechOmni12", "GB_FreeSpot05", "GB_FreeSpot06"}
	light_set_lights(included_lights_5, 5, true)

	teleport_to_slate_pos("CS_dex", 2.902, 0.006, 2.386, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_5")
	teleport_to_slate_pos("CS_troy", 1.131, 0.004, 0.391, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_5")
	teleport_to_slate_pos("#PLAYER#", -1.832, 0.005, -0.083, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_5")
	set_far_clip(500)
end

function shot6()
	local excluded_lights_6 = {"mechOmni10", "GB_FreeSpot05", "GB_FreeSpot06"}
	light_set_lights(excluded_lights_6, 3, false)

	local included_lights_6 = {"mechOmni04", "mechOmni11", "mechOmni12", "mechOmni13", "mechOmni14"}
	light_set_lights(included_lights_6, 5, true)

	teleport_to_slate_pos("CS_dex", 2.209, 0.005, -1.242, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_6")
	teleport_to_slate_pos("CS_troy", 1.166, 0.014, 0.406, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_6")
	teleport_to_slate_pos("#PLAYER#", -1.867, 0.006, -0.083, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_6")
	set_far_clip(19)
end

function shot7()
	local excluded_lights_7 = {"mechOmni11", "mechOmni13", "GB_FreeSpot05", "mechOmni14"}
	light_set_lights(excluded_lights_7, 4, false)

	local included_lights_7 = {"mechOmni04", "mechOmni10", "mechOmni12", "GB_FreeSpot06"}
	light_set_lights(included_lights_7, 4, true)

	teleport_to_slate_pos("CS_dex", 2.206, 0.005, -1.243, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_7")
	teleport_to_slate_pos("CS_troy", 1.235, 0.003, 0.44, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_7")
	teleport_to_slate_pos("#PLAYER#", -1.856, 0.007, -0.05, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_7")
	set_far_clip(500)
end

function shot8()
	local excluded_lights_8 = {"mechOmni11", "mechOmni13", "GB_FreeSpot05"}
	light_set_lights(excluded_lights_8, 3, false)

	local included_lights_8 = {"mechOmni04", "mechOmni10", "mechOmni12", "mechOmni14", "GB_FreeSpot06"}
	light_set_lights(included_lights_8, 5, true)

	teleport_to_slate_pos("CS_dex", 2.211, 0.005, -1.243, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_8")
	teleport_to_slate_pos("CS_troy", 1.247, 0.003, 0.426, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_8")
	teleport_to_slate_pos("#PLAYER#", -1.863, 0.006, -0.074, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_8")
	set_far_clip(100)
end

function shot9()
	local excluded_lights_9 = {"mechOmni11", "mechOmni13", "GB_FreeSpot05", "mechOmni14"}
	light_set_lights(excluded_lights_9, 4, false)

	local included_lights_9 = {"mechOmni04", "mechOmni10", "mechOmni12", "GB_FreeSpot06"}
	light_set_lights(included_lights_9, 4, true)

	teleport_to_slate_pos("CS_dex", 2.211, 0.005, -1.244, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_9")
	teleport_to_slate_pos("CS_troy", 1.283, 0.003, 0.436, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_9")
	teleport_to_slate_pos("#PLAYER#", -1.878, 0.005, -0.095, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_9")
	set_far_clip(100)
end

function shot10()
	local excluded_lights_10 = {"mechOmni10", "GB_FreeSpot05", "mechOmni14"}
	light_set_lights(excluded_lights_10, 3, false)

	local included_lights_10 = {"mechOmni04", "mechOmni11", "mechOmni12", "mechOmni13", "GB_FreeSpot06"}
	light_set_lights(included_lights_10, 5, true)

	teleport_to_slate_pos("CS_dex", 2.216, 0.005, -1.248, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_10")
	teleport_to_slate_pos("CS_troy", 1.288, 0.003, 0.456, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_10")
	teleport_to_slate_pos("#PLAYER#", -1.854, 0.004, -0.093, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_10")
	set_far_clip(25)
end

function shot11()
	local excluded_lights_11 = {"mechOmni11", "mechOmni12", "mechOmni13", "GB_FreeSpot05", "mechOmni14"}
	light_set_lights(excluded_lights_11, 5, false)

	local included_lights_11 = {"mechOmni04", "mechOmni10", "GB_FreeSpot06"}
	light_set_lights(included_lights_11, 3, true)

	set_far_clip(200)
	teleport_to_slate_pos("CS_dex", 2.222, 0.005, -1.247, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_11")
	teleport_to_slate_pos("CS_troy", 1.281, 0.003, 0.463, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_11")
	teleport_to_slate_pos("#PLAYER#", -1.84, 0.005, -0.055, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_11")
	delay(3.36667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	set_far_clip(5000)
	tree_shadows_enable(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_troy")
	stop_custom_actions("#PLAYER#")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_far_clip(5000)
	tree_shadows_enable(true)
end