---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: LC02_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk01", true )
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
end

function shot1()
	fade_in(0.5)
	select_slate("slate_gasstation")
	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", -4.183, -0.463, -1.737, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_1")
	teleport_to_slate_pos("CS_dex", -2.009, -0.462, 0.08, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_1")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_1")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_1")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_1")
	spawning_peds(false)
	--spawning_cars(false)
	set_level_lights(false)
	time_of_day_character_shadows_enable(false)
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", -4.213, -0.463, -1.719, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_2")
	teleport_to_slate_pos("CS_dex", -2.007, -0.462, 0.076, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_2")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_2")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_2")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", -2.789, -0.463, -0.115, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_3")
	teleport_to_slate_pos("CS_dex", -2.044, -0.462, 0.078, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_3")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_3")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_3")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", -2.811, -0.463, -0.081, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_4")
	teleport_to_slate_pos("CS_dex", -2.003, -0.462, 0.077, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_4")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_4")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_4")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", -2.806, -0.463, -0.087, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_5")
	teleport_to_slate_pos("CS_dex", -2.003, -0.462, 0.075, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_5")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_5")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_5")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", -2.802, -0.463, -0.096, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_6")
	teleport_to_slate_pos("CS_dex", -2.001, -0.462, 0.077, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_6")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_6")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_6")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", -2.79, -0.463, -0.114, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_7")
	teleport_to_slate_pos("CS_dex", -1.999, -0.462, 0.086, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_7")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_7")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_7")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_7")
end

function shot8()
	teleport_to_slate_pos("#PLAYER#", -2.791, -0.463, -0.107, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_8")
	teleport_to_slate_pos("CS_dex", -1.991, -0.462, 0.091, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_8")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_8")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_8")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_8")
end

function shot9()
	teleport_to_slate_pos("#PLAYER#", -2.775, -0.463, -0.09, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_9")
	teleport_to_slate_pos("CS_dex", -1.999, -0.462, 0.088, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_9")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_9")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_9")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_9")
end

function shot10()
	teleport_to_slate_pos("#PLAYER#", -2.806, -0.463, -0.085, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_10")
	teleport_to_slate_pos("CS_dex", -2.001, -0.462, 0.076, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_10")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_10")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_10")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_10")
end

function shot11()
	teleport_to_slate_pos("#PLAYER#", -2.792, -0.463, -0.125, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_11")
	teleport_to_slate_pos("CS_dex", -2.005, -0.462, 0.098, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_11")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_11")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_11")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_11")
end

function shot12()
	teleport_to_slate_pos("#PLAYER#", -2.81, -0.463, -0.075, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_12")
	teleport_to_slate_pos("CS_dex", -2.003, -0.462, 0.098, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_12")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_12")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_12")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_12")
end

function shot13()
	teleport_to_slate_pos("#PLAYER#", -2.799, -0.463, -0.108, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_13")
	teleport_to_slate_pos("CS_dex", -2.022, -0.461, 0.107, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_13")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_13")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_13")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_13")
end

function shot14()
	teleport_to_slate_pos("#PLAYER#", -2.8, -0.463, -0.093, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_14")
	teleport_to_slate_pos("CS_dex", -2.016, -0.462, 0.089, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_14")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_14")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_14")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_14")
end

function shot15()
	teleport_to_slate_pos("#PLAYER#", -2.775, -0.463, -0.083, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_15")
	teleport_to_slate_pos("CS_dex", -1.99, -0.462, 0.099, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_15")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_15")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_15")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_15")
end

function shot16()
	teleport_to_slate_pos("#PLAYER#", -2.786, -0.463, -0.088, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_16")
	teleport_to_slate_pos("CS_dex", -1.935, -0.462, 0.142, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_16")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_16")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_16")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_16")
end

function shot17()
	teleport_to_slate_pos("#PLAYER#", -2.828, -0.463, -0.043, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_17")
	teleport_to_slate_pos("CS_dex", -1.954, -0.462, 0.167, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_17")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_17")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_17")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_17")
end

function shot18()
	teleport_to_slate_pos("#PLAYER#", -6.739, -0.463, 1.645, "slate_gasstation")
	play_custom_action_do("#PLAYER#", "lc02_scene01_pc_18")
	teleport_to_slate_pos("CS_dex", -2.064, -0.462, 0.125, "slate_gasstation")
	play_custom_action_do("CS_dex", "lc02_scene01_dex_18")
	teleport_to_slate_pos("CS_troy", -1.294, -0.465, 0.868, "slate_gasstation")
	play_custom_action_do("CS_troy", "lc02_scene01_troy_18")
	teleport_to_slate_pos("CS_Car", -3.872, -0.463, 1.263, "slate_gasstation")
	play_custom_action_do("CS_Car", "lc02_scene01_car_18")
	teleport_to_slate_pos("CS_map", -1.994, -0.463, 0.756, "slate_gasstation")
	play_custom_action_do("CS_map", "lc02_scene01_map_18")
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	time_of_day_character_shadows_enable(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_troy")
	stop_custom_actions("CS_Car")
	stop_custom_actions("CS_map")
	letterbox_fade_out(true)
	fade_out(0.5)
	time_of_day_character_shadows_enable(true)
end