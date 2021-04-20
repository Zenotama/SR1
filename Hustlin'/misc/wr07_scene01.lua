---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: wr07_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunks("sr_chunk09", "sr_chunk39")
	set_weather(0, true)
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
	thread_new_cutscene_shot("shot16", 16)
	thread_new_cutscene_shot("shot17", 17)
	thread_new_cutscene_shot("shot18", 18)
	thread_new_cutscene_shot("shot19", 19)
	thread_new_cutscene_shot("shot20", 20)
	thread_new_cutscene_shot("shot21", 21)
	thread_new_cutscene_shot("shot22", 22)
end

function shot1()
	local excluded_lights_1 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot06", "BB FreeSpot07", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_1, 19, false)

	set_time_of_day(1, 0)
   	set_level_lights(false)
	--load_chunks("sr_chunk09", "sr_chunk39")
	fade_in(0.5)
	select_slate("slate_wr07_scene01")
	character_hide("#PLAYER#")
end

function shot2()
	local excluded_lights_2 = {"BB FreeSpot03", "BB FreeSpot06", "BB FreeSpot07", "lin_trunklight03_shot6", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_2, 15, false)

	local included_lights_2 = {"BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB Omni04"}
	light_set_lights(included_lights_2, 4, true)

	character_hide("CS_trunk")
	character_hide("CS_lin")
	teleport_to_slate_pos("CS_sharp", -3.308, 0.0, -2.164, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_2")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_2")
end

function shot3()
	local excluded_lights_3 = {"BB FreeSpot03", "BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_3, 13, false)

	local included_lights_3 = {"BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB FreeSpot08", "BB Omni06", "BB Omni07"}
	light_set_lights(included_lights_3, 6, true)

	teleport_to_slate_pos("CS_sharp", -2.23, 0.0, -0.533, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_3")
	teleport_to_slate_pos("CS_donnie", -6.069, 0.0, 4.035, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_3")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_3")
	teleport_to_slate_pos("CS_donniecar", -5.939, -0.025, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_3")
end

function shot4()
	local excluded_lights_4 = {"BB FreeSpot06", "BB FreeSpot07", "lin_trunklight03_shot6", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_4, 12, false)

	local included_lights_4 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB Omni04", "BB Omni05", "BB FreeSpot08"}
	light_set_lights(included_lights_4, 7, true)

	teleport_to_slate_pos("CS_sharp", -2.447, 0.0, 0.685, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_4")
	teleport_to_slate_pos("CS_donnie", -3.381, 0.0, 4.751, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_4")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_4")
end

function shot5()
	local excluded_lights_5 = {"BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_5, 14, false)

	local included_lights_5 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04"}
	light_set_lights(included_lights_5, 5, true)

	character_hide("CS_lincar")
	character_show("CS_trunk")
	npc_unholster_best_weapon("CS_sharp")
	teleport_to_slate_pos("CS_sharp", -2.588, 0.0, 0.863, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_5")
	teleport_to_slate_pos("CS_donnie", -3.615, 0.0, 0.886, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_5")
	teleport_to_slate_pos("CS_trunk", -3.088, 0.0, -0.672, "slate_wr07_scene01")
	play_custom_action_do("CS_trunk", "wr07_scene01_trunk_5")
--	fade_out(0.0)
--	delay(4)
--	fade_in(.3)
end

function shot6()
	local excluded_lights_6 = {"BB FreeSpot05", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_6, 10, false)

	local included_lights_6 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot06", "BB FreeSpot07", "lin_trunklight03_shot6", "BB Omni04", "lin_trunklight01_shot6", "lin_trunklight02_shot6"}
	light_set_lights(included_lights_6, 9, true)

	character_show("CS_lin")
	teleport_to_slate_pos("CS_sharp", -3.053, 0.0, 0.685, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_6")
	teleport_to_slate_pos("CS_lin", -3.498, 0.0, -0.15, "slate_wr07_scene01")
	play_custom_action_do("CS_lin", "wr07_scene01_lin_6")
	teleport_to_slate_pos("CS_donnie", -3.629, 0.0, 0.774, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_6")
	teleport_to_slate_pos("CS_donniecar", -7.199, -0.018, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_6")
	teleport_to_slate_pos("CS_trunk", -3.088, 0.0, -0.672, "slate_wr07_scene01")
	play_custom_action_do("CS_trunk", "wr07_scene01_trunk_6")
	delay(3.1)
	fade_out(0.3)
	delay(.3)
	delay(.8)
	fade_in(0.5)
	delay(10.35)
	fade_out(.3)
end

function shot7()
	local excluded_lights_7 = {"BB FreeSpot03", "BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni05", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_7, 14, false)

	local included_lights_7 = {"BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04", "BB FreeSpot08"}
	light_set_lights(included_lights_7, 5, true)

	character_show("CS_lincar")
	character_hide("CS_trunk")
	character_hide("CS_lin")
	npc_holster("CS_sharp")
	teleport_to_slate_pos("CS_sharp", -2.933, 0.0, 0.757, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_7")
	teleport_to_slate_pos("CS_donnie", -3.422, 0.0, 1.136, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_7")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_7")
	teleport_to_slate_pos("CS_donniecar", -7.199, -0.018, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_7")
	fade_in(0.0)
end

function shot8()
	local excluded_lights_8 = {"BB Omni02", "BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_8, 15, false)

	local included_lights_8 = {"BB FreeSpot03", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04"}
	light_set_lights(included_lights_8, 4, true)

	character_hide("CS_lincar")
	character_hide("CS_sharp")
	teleport_to_slate_pos("CS_sharp", -2.924, 0.0, 0.773, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_8")
	teleport_to_slate_pos("CS_donnie", -3.41, 0.0, 1.13, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_8")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_8")
	teleport_to_slate_pos("CS_donniecar", -7.199, -0.018, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_8")
end

function shot9()
	local excluded_lights_9 = {"BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_9, 13, false)

	local included_lights_9 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04", "BB Omni10"}
	light_set_lights(included_lights_9, 6, true)

	character_show("CS_sharp")
	teleport_to_slate_pos("CS_sharp", -2.857, 0.0, 0.65, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_9")
	teleport_to_slate_pos("CS_donnie", -3.516, 0.0, 1.068, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_9")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_9")
	teleport_to_slate_pos("CS_donniecar", -7.199, -0.018, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_9")
	teleport_to_slate_pos("CS_trunk", -3.088, 0.0, -0.672, "slate_wr07_scene01")
	play_custom_action_do("CS_trunk", "wr07_scene01_trunk_9")
end

function shot10()
	local excluded_lights_10 = {"BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni05", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_10, 12, false)

	local included_lights_10 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04", "BB FreeSpot08", "BB Omni06"}
	light_set_lights(included_lights_10, 7, true)

	character_show("CS_lincar")
	teleport_to_slate_pos("CS_sharp", -2.896, 0.0, 0.783, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_10")
	teleport_to_slate_pos("CS_donnie", -3.446, 0.0, 1.126, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_10")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_10")
	teleport_to_slate_pos("CS_donniecar", -7.199, -0.018, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_10")
	teleport_to_slate_pos("CS_trunk", -3.088, 0.0, -0.672, "slate_wr07_scene01")
	play_custom_action_do("CS_trunk", "wr07_scene01_trunk_10")
end

function shot11()
	local excluded_lights_11 = {"BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB FreeSpot08", "BB Omni07", "BB Omni09", "BB FreeSpot09", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_11, 11, false)

	local included_lights_11 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot07", "BB Omni04", "BB Omni05", "BB Omni06", "BB Omni08", "BB Omni10"}
	light_set_lights(included_lights_11, 8, true)

	teleport_to_slate_pos("CS_sharp", -2.862, 0.0, 0.55, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_11")
end

function shot12()
	local excluded_lights_12 = {"BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni05", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_12, 11, false)

	local included_lights_12 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04", "BB FreeSpot08", "BB Omni06", "BB Omni07"}
	light_set_lights(included_lights_12, 8, true)

	teleport_to_slate_pos("CS_sharp", -2.757, 0.0, 0.916, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_12")
	teleport_to_slate_pos("CS_donnie", -7.327, 0.0, 3.803, "slate_wr07_scene01")
	play_custom_action_do("CS_donnie", "wr07_scene01_donnie_12")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_12")
	teleport_to_slate_pos("CS_donniecar", -7.199, -0.018, 3.431, "slate_wr07_scene01")
	play_custom_action_do("CS_donniecar", "wr07_scene01_dcar_12")
end

function shot13()
	local excluded_lights_13 = {"BB FreeSpot05", "BB FreeSpot06", "lin_trunklight03_shot6", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_13, 12, false)

	local included_lights_13 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot07", "BB Omni04", "BB Omni05", "BB Omni08"}
	light_set_lights(included_lights_13, 7, true)

	teleport_to_slate_pos("CS_sharp", -2.764, 0.0, 0.908, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_13")
end

function shot14()
	local excluded_lights_14 = {"BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni04", "BB FreeSpot08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_14, 10, false)

	local included_lights_14 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot07", "BB Omni05", "BB Omni06", "BB Omni07", "BB Omni08"}
	light_set_lights(included_lights_14, 9, true)

	teleport_to_slate_pos("CS_sharp", -3.093, 0.0, 0.923, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_14")
	teleport_to_slate_pos("CS_lincar", -3.977, -0.006, -1.918, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_14")
end

function shot15()
	local excluded_lights_15 = {"BB FreeSpot03", "BB FreeSpot04", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni04", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_15, 15, false)

	local included_lights_15 = {"BB Omni02", "BB FreeSpot05", "BB FreeSpot07", "BB Omni05"}
	light_set_lights(included_lights_15, 4, true)

	teleport_to_slate_pos("CS_lincar", -4.402, -0.006, -3.61, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_15")
end

function shot16()
	local excluded_lights_16 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_16, 15, false)

	local included_lights_16 = {"BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot07", "BB Omni08"}
	light_set_lights(included_lights_16, 4, true)

	teleport_to_slate_pos("CS_sharp", -4.233, 0.0, -3.976, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_16")
	teleport_to_slate_pos("CS_lincar", -4.989, -5.177, -7.518, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_16")
end

function shot17()
	local excluded_lights_17 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_17, 16, false)

	local included_lights_17 = {"BB FreeSpot05", "BB FreeSpot07", "BB FreeSpot09"}
	light_set_lights(included_lights_17, 3, true)

	teleport_to_slate_pos("CS_lincar", -5.227, -11.006, -10.913, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_17")
	set_framebuffer_tint (0.462,0.937,0.886,1.2)  
	set_framebuffer_saturation (1.5)
end

function shot18()
	local excluded_lights_18 = {"BB FreeSpot03", "BB FreeSpot06", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6"}
	light_set_lights(excluded_lights_18, 13, false)

	local included_lights_18 = {"BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot07", "lin_trunklight03_shot6", "lin_trunklight01_endshots"}
	light_set_lights(included_lights_18, 6, true)

	character_show("CS_trunk")
	character_show("CS_lin")
	teleport_to_slate_pos("CS_lin", -3.527, 0.0, -0.37, "slate_wr07_scene01")
	play_custom_action_do("CS_lin", "wr07_scene01_lin_18")
	teleport_to_slate_pos("CS_trunk", -3.088, 0.0, -0.672, "slate_wr07_scene01")
	play_custom_action_do("CS_trunk", "wr07_scene01_trunk_18")
end

function shot19()
	local excluded_lights_19 = {"BB FreeSpot03", "BB FreeSpot06", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_19, 14, false)

	local included_lights_19 = {"BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot07", "BB Omni07"}
	light_set_lights(included_lights_19, 5, true)

	teleport_to_slate_pos("CS_sharp", -4.233, 0.0, -4.229, "slate_wr07_scene01")
	play_custom_action_do("CS_sharp", "wr07_scene01_sharp_19")
	teleport_to_slate_pos("CS_lincar", -5.526, -12.874, -12.381, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_19")
end

function shot20()
	local excluded_lights_20 = {"BB FreeSpot06", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6"}
	light_set_lights(excluded_lights_20, 12, false)

	local included_lights_20 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot07", "lin_trunklight03_shot6", "lin_trunklight01_endshots"}
	light_set_lights(included_lights_20, 7, true)

	teleport_to_slate_pos("CS_lin", -3.522, 0.0, -0.369, "slate_wr07_scene01")
	play_custom_action_do("CS_lin", "wr07_scene01_lin_20")
	teleport_to_slate_pos("CS_trunk", -3.088, 0.0, -0.672, "slate_wr07_scene01")
	play_custom_action_do("CS_trunk", "wr07_scene01_trunk_20")
	delay(11)
	fade_out(1)
end

function shot21()
	local excluded_lights_21 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot07", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB Omni09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_21, 17, false)

	local included_lights_21 = {"BB FreeSpot06", "BB FreeSpot09"}
	light_set_lights(included_lights_21, 2, true)

	teleport_to_slate_pos("CS_lincar", -8.913, -17.049, -18.636, "slate_wr07_scene01")
	play_custom_action_do("CS_lincar", "wr07_scene01_lcar_21")
	set_framebuffer_tint (0.462,0.937,0.886,1.2)  
	set_framebuffer_saturation (1.5)
	fade_in(0)
end

function shot22()
	local excluded_lights_22 = {"BB FreeSpot03", "BB Omni02", "BB FreeSpot04", "BB FreeSpot05", "BB FreeSpot06", "BB FreeSpot07", "lin_trunklight03_shot6", "BB Omni04", "BB Omni05", "BB FreeSpot08", "BB Omni06", "BB Omni07", "BB Omni08", "BB FreeSpot09", "BB Omni10", "lin_trunklight01_shot6", "lin_trunklight02_shot6", "lin_trunklight01_endshots"}
	light_set_lights(excluded_lights_22, 18, false)

	local included_lights_22 = {"BB Omni09"}
	light_set_lights(included_lights_22, 1, true)

	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", -7.6, -11.402, -23.116, "slate_wr07_scene01")
	play_custom_action_do("#PLAYER#", "wr07_scene01_player_22")
	delay(6.5)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	character_show("#PLAYER#")
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("CS_sharp")
	stop_custom_actions("CS_lin")
	stop_custom_actions("CS_donnie")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_lincar")
	stop_custom_actions("CS_donniecar")
	stop_custom_actions("CS_trunk")
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
end