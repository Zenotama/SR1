---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: vk09_scene01
-- Exported By: Ev.religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk02", true )
	load_chunks("sr_chunk02_church", "sr_chunk02")
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
	thread_new_cutscene_shot("shot12", 12)
	thread_new_cutscene_shot("shot13", 13)
	thread_new_cutscene_shot("shot14", 14)
	thread_new_cutscene_shot("shot15", 15)
end

function shot1()
	local excluded_lights_1 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_1, 8, false)

	local included_lights_1 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_1, 6, true)

	fade_in(0.5)
	select_slate("slate_church_johnnyroom")
	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", -2.854, -0.006, -1.739, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_1")
	teleport_to_slate_pos("CS_king", -4.365, 0.006, 1.647, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_1")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_1")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_1")
	teleport_to_slate_pos("CS_gat", -3.081, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_1")
	set_level_lights(false)
	npc_unholster_best_weapon("CS_king")
end

function shot2()
	local excluded_lights_2 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_2, 7, false)

	local included_lights_2 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot05_player", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_2, 7, true)

	teleport_to_slate_pos("#PLAYER#", -2.857, -0.005, -1.737, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_2")
	teleport_to_slate_pos("CS_king", -4.363, 0.011, 1.597, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_2")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_2")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_2")
	teleport_to_slate_pos("CS_gat", -3.081, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_2")
end

function shot3()
	local excluded_lights_3 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni04", "CH_FreeSpot04_rim", "CH_FreeSpot07_king", "CH_FreeSpot04_johnny", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_3, 9, false)

	local included_lights_3 = {"CH_FreeSpot01", "BB Omni01", "BB Omni02", "BB Omni03", "CH_FreeSpot05_player"}
	light_set_lights(included_lights_3, 5, true)

	teleport_to_slate_pos("#PLAYER#", -2.942, 0.005, -1.702, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_3")
	teleport_to_slate_pos("CS_king", -4.367, 0.01, 1.606, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_3")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_3")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_3")
	teleport_to_slate_pos("CS_gat", -3.08, 0.004, -4.443, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_3")
end

function shot4()
	local excluded_lights_4 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot04_rim", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_4, 8, false)

	local included_lights_4 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot05_player", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_4, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.91, 0.006, -1.715, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_4")
	teleport_to_slate_pos("CS_king", -4.344, 0.005, 1.743, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_4")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_4")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_4")
	teleport_to_slate_pos("CS_gat", -3.08, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_4")
end

function shot5()
	local excluded_lights_5 = {"BB Omni04", "CH_FreeSpot04_johnny"}
	light_set_lights(excluded_lights_5, 2, false)

	local included_lights_5 = {"CH_FreeSpot01", "CH_FreeSpot02", "CH_FreeSpot03", "BB Omni01", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(included_lights_5, 12, true)

	teleport_to_slate_pos("#PLAYER#", -2.912, 0.006, -1.713, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_5")
	teleport_to_slate_pos("CS_king", -4.24, 0.024, 1.499, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_5")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_5")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_5")
	teleport_to_slate_pos("CS_gat", -3.08, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_5")
end

function shot6()
	local excluded_lights_6 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot04_rim", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_6, 9, false)

	local included_lights_6 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_6, 5, true)

	teleport_to_slate_pos("#PLAYER#", -2.951, 0.004, -1.68, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_6")
	teleport_to_slate_pos("CS_king", -1.672, 0.014, -1.854, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_6")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_6")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_6")
	teleport_to_slate_pos("CS_gat", -3.08, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_6")
end

function shot7()
	local excluded_lights_7 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni01", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot04_johnny", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_7, 8, false)

	local included_lights_7 = {"CH_FreeSpot01", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter01"}
	light_set_lights(included_lights_7, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.935, 0.003, -1.725, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_7")
	teleport_to_slate_pos("CS_king", -1.857, 0.0, -2.472, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_7")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_7")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_7")
	teleport_to_slate_pos("CS_gat", -3.08, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_7")
end

function shot8()
	local excluded_lights_8 = {"CH_FreeSpot01", "CH_FreeSpot03", "BB Omni01", "BB Omni04", "CH_FreeSpot04_rim", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_8, 10, false)

	local included_lights_8 = {"CH_FreeSpot02", "BB Omni02", "BB Omni03", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_8, 4, true)

	teleport_to_slate_pos("#PLAYER#", -2.91, -0.003, -1.712, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_8")
	teleport_to_slate_pos("CS_king", -1.885, 0.003, -2.473, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_8")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_8")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_8")
	teleport_to_slate_pos("CS_gat", -3.078, 0.004, -4.443, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_8")
end

function shot9()
	local excluded_lights_9 = {"CH_FreeSpot03", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot04_johnny", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_9, 7, false)

	local included_lights_9 = {"CH_FreeSpot01", "CH_FreeSpot02", "BB Omni01", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot07_king"}
	light_set_lights(included_lights_9, 7, true)

	teleport_to_slate_pos("#PLAYER#", -2.878, -0.006, -1.728, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_9")
	teleport_to_slate_pos("CS_king", -1.889, 0.004, -2.464, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_9")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_9")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_9")
	teleport_to_slate_pos("CS_gat", -3.078, 0.004, -4.441, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_9")
end

function shot10()
	local excluded_lights_10 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_10, 7, false)

	local included_lights_10 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot07_king", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_10, 7, true)

	teleport_to_slate_pos("#PLAYER#", -2.925, 0.006, -1.719, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_10")
	teleport_to_slate_pos("CS_king", -2.133, 0.009, -2.549, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_10")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_10")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_10")
	teleport_to_slate_pos("CS_gat", -3.078, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_10")
end

function shot11()
	local excluded_lights_11 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot04_johnny", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_11, 8, false)

	local included_lights_11 = {"CH_FreeSpot01", "BB Omni01", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot07_king"}
	light_set_lights(included_lights_11, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.942, 0.005, -1.702, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_11")
	teleport_to_slate_pos("CS_king", -2.06, 0.005, -2.566, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_11")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_11")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_11")
	teleport_to_slate_pos("CS_gat", -3.081, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_11")
end

function shot12()
	local excluded_lights_12 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot04_johnny", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_12, 8, false)

	local included_lights_12 = {"CH_FreeSpot01", "BB Omni01", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot07_king"}
	light_set_lights(included_lights_12, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.934, 0.005, -1.716, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_12")
	teleport_to_slate_pos("CS_king", -2.149, 0.008, -2.617, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_12")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_12")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_12")
	teleport_to_slate_pos("CS_gat", -3.081, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_12")
end

function shot13()
	local excluded_lights_13 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot04_rim", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_13, 9, false)

	local included_lights_13 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_13, 5, true)

	teleport_to_slate_pos("#PLAYER#", -2.914, 0.006, -1.714, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_13")
	teleport_to_slate_pos("CS_king", -2.142, 0.008, -2.615, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_13")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_13")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_13")
	teleport_to_slate_pos("CS_gat", -3.081, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_13")
end

function shot14()
	local excluded_lights_14 = {"CH_FreeSpot02", "BB Omni04", "CH_FreeSpot04_johnny", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_14, 5, false)

	local included_lights_14 = {"CH_FreeSpot01", "CH_FreeSpot03", "BB Omni01", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter01"}
	light_set_lights(included_lights_14, 9, true)

	teleport_to_slate_pos("#PLAYER#", -2.934, 0.005, -1.697, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_14")
	teleport_to_slate_pos("CS_king", -2.124, 0.011, -2.564, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_14")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_14")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_14")
	teleport_to_slate_pos("CS_gat", -3.081, 0.004, -4.442, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_14")
end

function shot15()
	local excluded_lights_15 = {"CH_FreeSpot01", "BB Omni01", "BB Omni04", "CH_FreeSpot05_player", "CH_FreeSpot07_king", "CH_FreeSpot05_kingEnter", "CH_FreeSpot05_kingEnter01", "CH_FreeSpot05_kingEnter02"}
	light_set_lights(excluded_lights_15, 8, false)

	local included_lights_15 = {"CH_FreeSpot02", "CH_FreeSpot03", "BB Omni02", "BB Omni03", "CH_FreeSpot04_rim", "CH_FreeSpot04_johnny"}
	light_set_lights(included_lights_15, 6, true)

	teleport_to_slate_pos("#PLAYER#", -2.931, 0.005, -1.699, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk09_scene01_pc_15")
	teleport_to_slate_pos("CS_king", -1.912, 0.004, -1.494, "slate_church_johnnyroom")
	play_custom_action_do("CS_king", "vk09_scene01_kng_15")
	teleport_to_slate_pos("CS_csAKchar", -3.305, 0.0, -3.355, "slate_church_johnnyroom")
	play_custom_action_do("CS_csAKchar", "vk09_scene01_ak47_15")
	teleport_to_slate_pos("CS_chair", 0.0, 0.0, 0.0, "slate_church_johnnyroom")
	play_custom_action_do("CS_chair", "vk09_scene01_chair_15")
	teleport_to_slate_pos("CS_gat", -3.085, 0.044, -4.471, "slate_church_johnnyroom")
	play_custom_action_do("CS_gat", "vk09_scene01_jny_15")
	delay(4.03333)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	set_level_lights(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_king")
	stop_custom_actions("CS_csAKchar")
	stop_custom_actions("CS_chair")
	stop_custom_actions("CS_gat")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
