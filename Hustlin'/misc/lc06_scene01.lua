---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: lc06_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk02_church", true )
	load_chunks("sr_chunk02", "sr_chunk02_church")
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
end

function shot1()
	local excluded_lights_1 = {"CH_Walllight03", "CH_Omni03", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight07", "CH_Walllight13", "CH_Walllight12", "CH_spot", "CH_Omni13", "CH_spot03", "CH photo Omni14", "CH Dex fill Omni14"}
	light_set_lights(excluded_lights_1, 14, false)

	local included_lights_1 = {"CH_Walllight02", "CH_Omni04", "CH_Omni07", "CH_Walllight06", "CH_Omni08", "CH_Omni09", "CH_spot02", "BB FreeSpot01", "CH Troy Rim Omni14"}
	light_set_lights(included_lights_1, 9, true)

	--set_level_lights(false)
	fade_in(0.5)
	select_slate("slate_church_main")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_dex", -11.488, 0.0, -0.939, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_1")
	teleport_to_slate_pos("#PLAYER#", -9.858, 0.0, -13.328, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_1")
	teleport_to_slate_pos("CS_troy", -9.561, 0.0, -1.348, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_1")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_1")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_1")
	set_level_lights(false)
end

function shot2()
	local excluded_lights_2 = {"CH_Walllight02", "CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight06", "CH_Omni08", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot", "CH_Omni13", "CH photo Omni14", "CH Troy Rim Omni14"}
	light_set_lights(excluded_lights_2, 17, false)

	local included_lights_2 = {"CH_Omni07", "CH_Walllight07", "CH_spot02", "BB FreeSpot01", "CH_spot03", "CH Dex fill Omni14"}
	light_set_lights(included_lights_2, 6, true)

	teleport_to_slate_pos("CS_dex", -11.488, 0.0, -0.939, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_2")
	teleport_to_slate_pos("#PLAYER#", -9.852, 0.0, -9.693, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_2")
	teleport_to_slate_pos("CS_troy", -9.579, 0.0, -1.342, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_2")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_2")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_2")
end

function shot3()
	local excluded_lights_3 = {"CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight07", "CH_Walllight06", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot02", "CH_spot", "CH_Omni13", "CH photo Omni14", "CH Dex fill Omni14"}
	light_set_lights(excluded_lights_3, 17, false)

	local included_lights_3 = {"CH_Walllight02", "CH_Omni07", "CH_Omni08", "BB FreeSpot01", "CH_spot03", "CH Troy Rim Omni14"}
	light_set_lights(included_lights_3, 6, true)

	teleport_to_slate_pos("CS_dex", -11.498, 0.0, -0.94, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_3")
	teleport_to_slate_pos("#PLAYER#", -9.921, 0.0, -7.163, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_3")
	teleport_to_slate_pos("CS_troy", -9.576, 0.0, -1.344, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_3")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_3")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_3")
end

function shot4()
	local excluded_lights_4 = {"CH_Walllight02", "CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight06", "CH_Omni08", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot", "CH_Omni13", "CH photo Omni14", "CH Troy Rim Omni14"}
	light_set_lights(excluded_lights_4, 17, false)

	local included_lights_4 = {"CH_Omni07", "CH_Walllight07", "CH_spot02", "BB FreeSpot01", "CH_spot03", "CH Dex fill Omni14"}
	light_set_lights(included_lights_4, 6, true)

	teleport_to_slate_pos("CS_dex", -11.421, 0.0, -0.92, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_4")
	teleport_to_slate_pos("#PLAYER#", -9.929, 0.0, -5.945, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_4")
	teleport_to_slate_pos("CS_troy", -9.592, 0.0, -1.342, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_4")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_4")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_4")
end

function shot5()
	local excluded_lights_5 = {"CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight07", "CH_Walllight06", "CH_Omni09", "CH_Walllight13", "CH_Omni13", "CH photo Omni14", "CH Dex fill Omni14"}
	light_set_lights(excluded_lights_5, 13, false)

	local included_lights_5 = {"CH_Walllight02", "CH_Omni07", "CH_Walllight05", "CH_Omni08", "CH_Walllight12", "CH_spot02", "CH_spot", "BB FreeSpot01", "CH_spot03", "CH Troy Rim Omni14"}
	light_set_lights(included_lights_5, 10, true)

	teleport_to_slate_pos("CS_dex", -11.423, 0.0, -0.908, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_5")
	teleport_to_slate_pos("#PLAYER#", -9.942, 0.0, -4.207, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_5")
	teleport_to_slate_pos("CS_troy", -9.588, 0.0, -1.344, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_5")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_5")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_5")
end

function shot6()
	local excluded_lights_6 = {"CH_Walllight02", "CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight06", "CH_Omni08", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot", "CH_Omni13", "CH photo Omni14", "CH Troy Rim Omni14"}
	light_set_lights(excluded_lights_6, 17, false)

	local included_lights_6 = {"CH_Omni07", "CH_Walllight07", "CH_spot02", "BB FreeSpot01", "CH_spot03", "CH Dex fill Omni14"}
	light_set_lights(included_lights_6, 6, true)

	teleport_to_slate_pos("CS_dex", -11.404, 0.0, -0.918, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_6")
	teleport_to_slate_pos("#PLAYER#", -10.017, 0.0, -2.129, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_6")
	teleport_to_slate_pos("CS_troy", -9.59, 0.0, -1.306, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_6")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_6")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_6")
end

function shot7()
	local excluded_lights_7 = {"CH_Walllight02", "CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight07", "CH_Walllight06", "CH_Omni08", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot", "CH_Omni13", "CH photo Omni14", "CH Troy Rim Omni14"}
	light_set_lights(excluded_lights_7, 18, false)

	local included_lights_7 = {"CH_Omni07", "CH_spot02", "BB FreeSpot01", "CH_spot03", "CH Dex fill Omni14"}
	light_set_lights(included_lights_7, 5, true)

	teleport_to_slate_pos("CS_dex", -11.137, 0.0, -1.005, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_7")
	teleport_to_slate_pos("#PLAYER#", -9.994, 0.0, -2.131, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_7")
	teleport_to_slate_pos("CS_troy", -9.575, 0.0, -1.325, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_7")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_7")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_7")
end

function shot8()
	local excluded_lights_8 = {"CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight07", "CH_Walllight06", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_Omni13", "CH photo Omni14", "CH Dex fill Omni14"}
	light_set_lights(excluded_lights_8, 15, false)

	local included_lights_8 = {"CH_Walllight02", "CH_Omni07", "CH_Omni08", "CH_spot02", "CH_spot", "BB FreeSpot01", "CH_spot03", "CH Troy Rim Omni14"}
	light_set_lights(included_lights_8, 8, true)

	teleport_to_slate_pos("CS_dex", -11.089, 0.0, -1.059, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_8")
	teleport_to_slate_pos("#PLAYER#", -10.028, 0.0, -2.121, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_8")
	teleport_to_slate_pos("CS_troy", -9.566, 0.0, -1.325, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_8")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_8")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_8")
end

function shot9()
	local excluded_lights_9 = {"CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight07", "CH_Walllight06", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot02", "CH_Omni13", "BB FreeSpot01", "CH photo Omni14", "CH Dex fill Omni14"}
	light_set_lights(excluded_lights_9, 17, false)

	local included_lights_9 = {"CH_Walllight02", "CH_Omni07", "CH_Omni08", "CH_spot", "CH_spot03", "CH Troy Rim Omni14"}
	light_set_lights(included_lights_9, 6, true)

	teleport_to_slate_pos("CS_dex", -11.096, 0.0, -1.027, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_9")
	teleport_to_slate_pos("#PLAYER#", -9.991, 0.0, -2.107, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_9")
	teleport_to_slate_pos("CS_troy", -9.566, 0.0, -1.329, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_9")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_9")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_9")
end

function shot10()
	local excluded_lights_10 = {"CH_Walllight02", "CH_Walllight03", "CH_Omni03", "CH_Omni04", "CH_Walllight", "CH_Walllight01", "CH_Walllight04", "CH_Walllight05", "CH_Walllight06", "CH_Omni08", "CH_Omni09", "CH_Walllight13", "CH_Walllight12", "CH_spot", "CH_Omni13", "CH photo Omni14", "CH Troy Rim Omni14"}
	light_set_lights(excluded_lights_10, 17, false)

	local included_lights_10 = {"CH_Omni07", "CH_Walllight07", "CH_spot02", "BB FreeSpot01", "CH_spot03", "CH Dex fill Omni14"}
	light_set_lights(included_lights_10, 6, true)

	teleport_to_slate_pos("CS_dex", -11.085, 0.0, -1.023, "slate_church_main")
	play_custom_action_do("CS_dex", "lc06_scene01_dex_10")
	teleport_to_slate_pos("#PLAYER#", -9.982, 0.0, -2.133, "slate_church_main")
	play_custom_action_do("#PLAYER#", "lc06_scene01_player_10")
	teleport_to_slate_pos("CS_troy", -9.569, 0.0, -1.327, "slate_church_main")
	play_custom_action_do("CS_troy", "lc06_scene01_troy_10")
	teleport_to_slate_pos("CS_desk", -10.48, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_desk", "lc06_scene01_desk_10")
	teleport_to_slate_pos("CS_photo", -10.745, 0.0, -1.169, "slate_church_main")
	play_custom_action_do("CS_photo", "lc06_scene01_photo_10")
	delay(3.66667)
	fade_out(0.5)
end

function cutscene_abort()
	--set_level_lights(true)
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
end

function cutscene_end()
	--set_level_lights(true)
	character_show("#PLAYER#")
	stop_custom_actions("CS_dex")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_troy")
	stop_custom_actions("CS_desk")
	stop_custom_actions("CS_photo")
	letterbox_fade_out(true)
	fade_out(0.5)
end
