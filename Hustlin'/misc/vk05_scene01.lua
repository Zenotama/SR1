---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: vk05_scene01
-- Exported By: Ev.religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk02_church", true )
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
	local excluded_lights_1 = {"CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday FreeSpot03"}
	light_set_lights(excluded_lights_1, 8, false)

	local included_lights_1 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight16", "CH_Walllight17", "CH_Walllight10", "CH_Walllight15", "CH_Walllight14", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni05", "BB Allday Omni08", "BB Allday Omni09", "BB Allday Omni10"}
	light_set_lights(included_lights_1, 15, true)

	fade_in(0.5)
	select_slate("slate_church_juliusroom")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_dex", 1.594, 0.0, 1.345, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_1")
	teleport_to_slate_pos("#PLAYER#", -6.59, 0.0, -0.578, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_1")
	teleport_to_slate_pos("CS_aish", -0.008, 0.0, -0.946, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_1")
	teleport_to_slate_pos("CS_jul", 0.097, 0.0, 2.242, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_1")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_1")
	teleport_to_slate_pos("CS_dchr", 1.691, 0.0, 1.409, "slate_church_juliusroom")
	play_custom_action_do("CS_dchr", "vk05_scene01_jchr_1")
	teleport_to_slate_pos("CS_jchr", 0.147, 0.0, 2.338, "slate_church_juliusroom")
	play_custom_action_do("CS_jchr", "vk05_scene01_dchair_1")
	set_level_lights(false)
end

function shot2()
	local excluded_lights_2 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight16", "CH_Walllight15", "CH_Walllight11", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday Omni08", "BB Allday Omni09", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_2, 15, false)

	local included_lights_2 = {"CH_Walllight17", "CH_Walllight10", "CH_Walllight14", "CH_Omni04", "CH_Walllight18", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06"}
	light_set_lights(included_lights_2, 8, true)

	teleport_to_slate_pos("CS_dex", 1.595, 0.0, 1.345, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_2")
	teleport_to_slate_pos("#PLAYER#", -2.299, 0.0, 0.615, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_2")
	teleport_to_slate_pos("CS_aish", 0.075, 0.0, -0.923, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_2")
	teleport_to_slate_pos("CS_jul", 0.1, 0.0, 2.246, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_2")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_2")
end

function shot3()
	local excluded_lights_3 = {"CH_Omni05", "CH_Walllight17", "CH_Walllight14", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday Omni08", "BB Allday Omni09", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_3, 15, false)

	local included_lights_3 = {"CH_Walllight19", "CH_Walllight16", "CH_Walllight10", "CH_Walllight15", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04"}
	light_set_lights(included_lights_3, 8, true)

	teleport_to_slate_pos("CS_dex", 1.594, 0.0, 1.345, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_3")
	teleport_to_slate_pos("#PLAYER#", -2.682, 0.0, 1.083, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_3")
	teleport_to_slate_pos("CS_aish", 0.026, 0.0, -0.914, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_3")
	teleport_to_slate_pos("CS_jul", 0.121, 0.0, 2.213, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_3")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_3")
	teleport_to_slate_pos("CS_dchr", 1.691, 0.0, 1.409, "slate_church_juliusroom")
	play_custom_action_do("CS_dchr", "vk05_scene01_jchr_3")
	teleport_to_slate_pos("CS_jchr", 0.147, 0.0, 2.338, "slate_church_juliusroom")
	play_custom_action_do("CS_jchr", "vk05_scene01_dchair_3")
end

function shot4()
	local excluded_lights_4 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight17", "CH_Walllight10", "CH_Walllight14", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday Omni08", "BB Allday Omni09", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_4, 19, false)

	local included_lights_4 = {"CH_Walllight16", "CH_Walllight15", "BB Allday Omni01", "BB Allday Omni02"}
	light_set_lights(included_lights_4, 4, true)

	teleport_to_slate_pos("CS_dex", 1.599, 0.0, 1.342, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_4")
	teleport_to_slate_pos("#PLAYER#", -2.535, 0.0, 1.199, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_4")
	teleport_to_slate_pos("CS_aish", 0.027, 0.0, -0.914, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_4")
	teleport_to_slate_pos("CS_jul", 0.128, 0.0, 2.216, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_4")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_4")
	teleport_to_slate_pos("CS_jchr", 0.147, 0.0, 2.338, "slate_church_juliusroom")
	play_custom_action_do("CS_jchr", "vk05_scene01_dchair_4")
end

function shot5()
	local excluded_lights_5 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight16", "CH_Walllight10", "CH_Walllight15", "CH_Walllight11", "CH_Omni04", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday Omni08", "BB Allday Omni09", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_5, 17, false)

	local included_lights_5 = {"CH_Walllight17", "CH_Walllight14", "CH_Walllight18", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06"}
	light_set_lights(included_lights_5, 6, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.342, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_5")
	teleport_to_slate_pos("#PLAYER#", -2.598, 0.0, 1.117, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_5")
	teleport_to_slate_pos("CS_aish", 0.023, 0.0, -0.935, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_5")
	teleport_to_slate_pos("CS_jul", 0.125, 0.0, 2.212, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_5")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_5")
end

function shot6()
	local excluded_lights_6 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight17", "CH_Walllight10", "CH_Walllight14", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday Omni08", "BB Allday Omni09", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_6, 19, false)

	local included_lights_6 = {"CH_Walllight16", "CH_Walllight15", "BB Allday Omni01", "BB Allday Omni02"}
	light_set_lights(included_lights_6, 4, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.342, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_6")
	teleport_to_slate_pos("#PLAYER#", -2.423, 0.0, 1.073, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_6")
	teleport_to_slate_pos("CS_aish", 0.017, 0.0, -0.945, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_6")
	teleport_to_slate_pos("CS_jul", 0.126, 0.0, 2.214, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_6")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_6")
	teleport_to_slate_pos("CS_jchr", 0.147, 0.0, 2.338, "slate_church_juliusroom")
	play_custom_action_do("CS_jchr", "vk05_scene01_dchair_6")
end

function shot7()
	local excluded_lights_7 = {"CH_Omni05", "CH_Walllight16", "CH_Walllight17", "CH_Walllight10", "CH_Walllight14", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni07", "BB Allday Omni08", "BB Allday FreeSpot03"}
	light_set_lights(excluded_lights_7, 14, false)

	local included_lights_7 = {"CH_Walllight19", "CH_Walllight15", "BB Allday Omni01", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni09", "BB Allday Omni10"}
	light_set_lights(included_lights_7, 9, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.342, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_7")
	teleport_to_slate_pos("#PLAYER#", -2.574, 0.0, 1.034, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_7")
	teleport_to_slate_pos("CS_aish", 0.01, 0.0, -0.887, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_7")
	teleport_to_slate_pos("CS_jul", 0.125, 0.0, 2.213, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_7")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_7")
	teleport_to_slate_pos("CS_dchr", 1.691, 0.0, 1.409, "slate_church_juliusroom")
	play_custom_action_do("CS_dchr", "vk05_scene01_jchr_7")
end

function shot8()
	local excluded_lights_8 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight16", "CH_Walllight10", "CH_Walllight15", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni07", "BB Allday Omni08", "BB Allday Omni09", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_8, 19, false)

	local included_lights_8 = {"CH_Walllight17", "CH_Walllight14", "BB Allday Omni05", "BB Allday FreeSpot01"}
	light_set_lights(included_lights_8, 4, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.344, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_8")
	teleport_to_slate_pos("#PLAYER#", -2.142, 0.0, 0.706, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_8")
	teleport_to_slate_pos("CS_aish", -1.043, 0.0, 0.176, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_8")
	teleport_to_slate_pos("CS_jul", 0.125, 0.0, 2.213, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_8")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_8")
end

function shot9()
	local excluded_lights_9 = {"CH_Walllight17", "CH_Walllight14", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni06", "BB Allday Omni07", "BB Allday Omni08", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(excluded_lights_9, 12, false)

	local included_lights_9 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight16", "CH_Walllight10", "CH_Walllight15", "BB Allday Omni01", "BB Allday Omni04", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday FreeSpot02", "BB Allday Omni09"}
	light_set_lights(included_lights_9, 11, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.344, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_9")
	teleport_to_slate_pos("#PLAYER#", -4.171, 0.0, 0.875, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_9")
	teleport_to_slate_pos("CS_aish", -1.045, 0.0, 0.176, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_9")
	teleport_to_slate_pos("CS_jul", 0.125, 0.0, 2.213, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_9")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_9")
	teleport_to_slate_pos("CS_dchr", 1.691, 0.0, 1.409, "slate_church_juliusroom")
	play_custom_action_do("CS_dchr", "vk05_scene01_jchr_9")
end

function shot10()
	local excluded_lights_10 = {"CH_Omni05", "CH_Walllight16", "CH_Walllight17", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni09"}
	light_set_lights(excluded_lights_10, 15, false)

	local included_lights_10 = {"CH_Walllight19", "CH_Walllight10", "CH_Walllight15", "CH_Walllight14", "BB Allday Omni07", "BB Allday Omni08", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(included_lights_10, 8, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.344, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_10")
	teleport_to_slate_pos("#PLAYER#", -5.495, 0.0, -0.459, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_10")
	teleport_to_slate_pos("CS_aish", 0.028, 0.0, -1.485, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_10")
	teleport_to_slate_pos("CS_jul", 0.125, 0.0, 2.214, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_10")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_10")
end

function shot11()
	local excluded_lights_11 = {"CH_Omni05", "CH_Walllight19", "CH_Walllight11", "CH_Omni04", "CH_Walllight18", "BB Allday Omni01", "BB Allday Omni02", "BB Allday Omni03", "BB Allday Omni04", "BB Allday Omni05", "BB Allday FreeSpot01", "BB Allday Omni06", "BB Allday FreeSpot02", "BB Allday Omni09"}
	light_set_lights(excluded_lights_11, 14, false)

	local included_lights_11 = {"CH_Walllight16", "CH_Walllight17", "CH_Walllight10", "CH_Walllight15", "CH_Walllight14", "BB Allday Omni07", "BB Allday Omni08", "BB Allday FreeSpot03", "BB Allday Omni10"}
	light_set_lights(included_lights_11, 9, true)

	teleport_to_slate_pos("CS_dex", 1.592, 0.0, 1.344, "slate_church_juliusroom")
	play_custom_action_do("CS_dex", "vk05_scene01_dex_11")
	teleport_to_slate_pos("#PLAYER#", -6.22, 0.0, -1.38, "slate_church_juliusroom")
	play_custom_action_do("#PLAYER#", "vk05_scene01_pc_11")
	teleport_to_slate_pos("CS_aish", 0.032, 0.0, -1.489, "slate_church_juliusroom")
	play_custom_action_do("CS_aish", "vk05_scene01_ais_11")
	teleport_to_slate_pos("CS_jul", 0.124, 0.0, 2.208, "slate_church_juliusroom")
	play_custom_action_do("CS_jul", "vk05_scene01_jul_11")
	teleport_to_slate_pos("CS_chr", -2.706, 0.0, 1.092, "slate_church_juliusroom")
	play_custom_action_do("CS_chr", "vk05_scene01_chr_11")
	teleport_to_slate_pos("CS_dchr", 1.691, 0.0, 1.409, "slate_church_juliusroom")
	play_custom_action_do("CS_dchr", "vk05_scene01_jchr_11")
	teleport_to_slate_pos("CS_jchr", 0.147, 0.0, 2.338, "slate_church_juliusroom")
	play_custom_action_do("CS_jchr", "vk05_scene01_dchair_11")
	delay(1.9)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("CS_dex")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_aish")
	stop_custom_actions("CS_jul")
	stop_custom_actions("CS_chr")
	stop_custom_actions("CS_dchr")
	stop_custom_actions("CS_jchr")
	letterbox_fade_out(true)
	fade_out(0.5)
end