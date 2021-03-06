---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: lc10_scene02
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunks("sr_chunk14", "sr_chunk24")
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
end

function shot1()
	fade_in(0.5)
	select_slate("slate_airport_hanger")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_angelo", 0.692, 0.0, -0.326, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_1")
	teleport_to_slate_pos("CS_carnalesA", -2.243, 0.0, 3.95, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_1")
	teleport_to_slate_pos("CS_carnalesB", -1.359, 0.0, -1.29, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_1")
	teleport_to_slate_pos("CS_guardA", 56.314, 0.0, 254.295, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_1")
	teleport_to_slate_pos("CS_guardB", 37.19, 0.0, 256.651, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_1")
	teleport_to_slate_pos("CS_carDex", -7.856, -0.013, 18.572, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_1")
	teleport_to_slate_pos("CS_dex", -8.32, 0.0, 17.919, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_1")
	teleport_to_slate_pos("#PLAYER#", -7.489, 0.0, 17.919, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_1")
	teleport_to_slate_pos("#PLAYER#", -7.489, 0.0, 17.919, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_1")
	teleport_to_slate_pos("#PLAYER#", -7.489, 0.0, 17.919, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_1")
	teleport_to_slate_pos("CS_lug101", -2.065, 0.0, 3.849, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_1")
	teleport_to_slate_pos("CS_lug201", -3.036, 0.0, 0.106, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_1")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_1")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_1")
	time_of_day_character_shadows_enable(false)
	fat_bones_enable("#PLAYER#", false) 
	spawning_peds(false)
	spawning_cars(false)
	npc_unholster_best_weapon("CS_angelo")
end

function shot2()
	teleport_to_slate_pos("CS_angelo", -0.38, 0.0, 0.707, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_2")
	teleport_to_slate_pos("CS_carnalesA", 0.269, 0.0, 1.694, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_2")
	teleport_to_slate_pos("CS_carnalesB", -1.166, 0.0, -2.488, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_2")
	teleport_to_slate_pos("CS_guardA", 51.822, 0.0, 256.613, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_2")
	teleport_to_slate_pos("CS_guardB", 41.152, 0.0, 283.994, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_2")
	teleport_to_slate_pos("CS_carDex", -4.496, 0.016, 35.632, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_2")
	teleport_to_slate_pos("CS_dex", -4.935, 0.0, 34.964, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_2")
	teleport_to_slate_pos("#PLAYER#", -4.104, 0.0, 34.994, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_2")
	teleport_to_slate_pos("#PLAYER#", -4.104, 0.0, 34.994, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_2")
	teleport_to_slate_pos("#PLAYER#", -4.104, 0.0, 34.994, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_2")
	teleport_to_slate_pos("CS_lug101", 0.345, 0.0, 1.495, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_2")
	teleport_to_slate_pos("CS_lug201", -3.036, 0.0, 0.106, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_2")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_2")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_2")
end

function shot3()
	teleport_to_slate_pos("CS_angelo", 0.289, 0.0, -0.113, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_3")
	teleport_to_slate_pos("CS_carnalesA", 0.957, 0.0, 0.803, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_3")
	teleport_to_slate_pos("CS_carnalesB", -0.244, 0.0, -3.788, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_3")
	teleport_to_slate_pos("CS_guardA", 47.964, 0.0, 257.396, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_3")
	teleport_to_slate_pos("CS_guardB", 39.86, 0.0, 275.092, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_3")
	teleport_to_slate_pos("CS_carDex", 44.287, 0.088, 195.42, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_3")
	teleport_to_slate_pos("CS_dex", 44.231, 0.0, 194.622, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_3")
	teleport_to_slate_pos("#PLAYER#", 44.94, 0.0, 195.054, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_3")
	teleport_to_slate_pos("#PLAYER#", 44.94, 0.0, 195.054, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_3")
	teleport_to_slate_pos("#PLAYER#", 44.94, 0.0, 195.054, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_3")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_3")
	teleport_to_slate_pos("CS_lug201", 0.289, 0.0, -3.761, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_3")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_3")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_3")
end

function shot4()
	teleport_to_slate_pos("CS_angelo", 0.363, 0.0, -0.506, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_4")
	teleport_to_slate_pos("CS_carnalesA", 0.862, 0.0, 0.722, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_4")
	teleport_to_slate_pos("CS_carnalesB", -1.796, 0.0, -0.854, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_4")
	teleport_to_slate_pos("CS_guardA", 53.377, 0.0, 254.512, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_4")
	teleport_to_slate_pos("CS_guardB", 38.181, 0.0, 256.629, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_4")
	teleport_to_slate_pos("CS_carDex", 88.616, 0.135, 336.297, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_4")
	teleport_to_slate_pos("CS_dex", 88.924, 0.0, 335.558, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_4")
	teleport_to_slate_pos("#PLAYER#", 89.364, 0.0, 336.263, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_4")
	teleport_to_slate_pos("#PLAYER#", 89.364, 0.0, 336.263, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_4")
	teleport_to_slate_pos("#PLAYER#", 89.364, 0.0, 336.263, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_4")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_4")
	teleport_to_slate_pos("CS_lug201", 2.423, 0.0, -3.886, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_4")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_4")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_4")
	npc_holster("CS_angelo")
end

function shot5()
	teleport_to_slate_pos("CS_angelo", 0.397, 0.0, -0.478, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_5")
	teleport_to_slate_pos("CS_carnalesA", 0.975, 0.0, 0.352, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_5")
	teleport_to_slate_pos("CS_carnalesB", -1.84, 0.0, -0.797, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_5")
	teleport_to_slate_pos("CS_guardA", 43.724, 0.0, 257.38, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_5")
	teleport_to_slate_pos("CS_guardB", 39.057, 0.0, 256.661, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_5")
	teleport_to_slate_pos("CS_carDex", 60.421, -0.028, 303.346, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_5")
	teleport_to_slate_pos("CS_dex", 62.654, 0.0, 305.771, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_5")
	teleport_to_slate_pos("#PLAYER#", 61.853, 0.0, 305.986, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_5")
	teleport_to_slate_pos("#PLAYER#", 61.853, 0.0, 305.986, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_5")
	teleport_to_slate_pos("#PLAYER#", 61.853, 0.0, 305.986, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_5")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_5")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_5")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_5")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_5")
end

function shot6()
	teleport_to_slate_pos("CS_angelo", 0.498, 0.0, -0.457, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_6")
	teleport_to_slate_pos("CS_carnalesA", 0.916, 0.0, 0.377, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_6")
	teleport_to_slate_pos("CS_carnalesB", -1.739, 0.0, -0.798, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_6")
	teleport_to_slate_pos("CS_guardA", 42.951, 0.0, 258.065, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_6")
	teleport_to_slate_pos("CS_guardB", 38.183, 0.0, 256.522, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_6")
	teleport_to_slate_pos("CS_carDex", 54.913, -0.028, 291.23, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_6")
	teleport_to_slate_pos("CS_dex", 57.555, 0.0, 299.102, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_6")
	teleport_to_slate_pos("#PLAYER#", 56.75, 0.0, 299.308, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_6")
	teleport_to_slate_pos("#PLAYER#", 56.75, 0.0, 299.308, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_6")
	teleport_to_slate_pos("#PLAYER#", 56.75, 0.0, 299.308, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_6")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_6")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_6")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_6")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_6")
end

function shot7()
	teleport_to_slate_pos("CS_angelo", 0.63, 0.0, -0.43, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_7")
	teleport_to_slate_pos("CS_carnalesA", 0.543, 0.0, 0.61, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_7")
	teleport_to_slate_pos("CS_carnalesB", -1.739, 0.0, -0.774, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_7")
	teleport_to_slate_pos("CS_guardA", 42.951, 0.0, 258.065, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_7")
	teleport_to_slate_pos("CS_guardB", 38.862, 0.0, 256.449, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_7")
	teleport_to_slate_pos("CS_carDex", 52.729, -0.028, 281.88, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_7")
	teleport_to_slate_pos("CS_dex", 53.148, 0.0, 282.31, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_7")
	teleport_to_slate_pos("#PLAYER#", 52.338, 0.0, 282.496, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_7")
	teleport_to_slate_pos("#PLAYER#", 52.338, 0.0, 282.496, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_7")
	teleport_to_slate_pos("#PLAYER#", 52.338, 0.0, 282.496, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_7")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_7")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_7")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_7")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_7")
end

function shot8()
	teleport_to_slate_pos("CS_angelo", 0.632, 0.0, -0.431, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_8")
	teleport_to_slate_pos("CS_carnalesA", 0.53, 0.0, 0.624, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_8")
	teleport_to_slate_pos("CS_carnalesB", -1.739, 0.0, -0.73, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_8")
	teleport_to_slate_pos("CS_guardA", 42.515, 0.0, 251.535, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_8")
	teleport_to_slate_pos("CS_guardB", 40.905, 0.0, 257.081, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_8")
	teleport_to_slate_pos("CS_carDex", 46.689, -0.028, 285.774, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_8")
	teleport_to_slate_pos("CS_dex", 46.935, 0.0, 280.144, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_8")
	teleport_to_slate_pos("#PLAYER#", 46.125, 0.0, 280.331, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_8")
	teleport_to_slate_pos("#PLAYER#", 46.125, 0.0, 280.331, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_8")
	teleport_to_slate_pos("#PLAYER#", 46.125, 0.0, 280.331, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_8")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_8")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_8")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_8")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_8")
end

function shot9()
	teleport_to_slate_pos("CS_angelo", 0.637, 0.0, -0.481, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_9")
	teleport_to_slate_pos("CS_carnalesA", 0.532, 0.0, 0.604, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_9")
	teleport_to_slate_pos("CS_carnalesB", -1.739, 0.0, -0.614, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_9")
	teleport_to_slate_pos("CS_guardA", 40.838, 0.0, 252.566, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_9")
	teleport_to_slate_pos("CS_guardB", 45.874, 0.0, 257.54, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_9")
	teleport_to_slate_pos("CS_carDex", 42.84, -0.028, 250.537, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_9")
	teleport_to_slate_pos("CS_dex", 43.662, 0.0, 254.024, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_9")
	teleport_to_slate_pos("#PLAYER#", 42.853, 0.0, 254.211, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_9")
	teleport_to_slate_pos("#PLAYER#", 42.853, 0.0, 254.211, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_9")
	teleport_to_slate_pos("#PLAYER#", 42.853, 0.0, 254.211, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_9")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_9")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_9")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_9")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_9")
end

function shot10()
	teleport_to_slate_pos("CS_angelo", 0.672, 0.0, -0.498, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_10")
	teleport_to_slate_pos("CS_carnalesA", 0.535, 0.0, 0.573, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_10")
	teleport_to_slate_pos("CS_carnalesB", -1.739, 0.0, -0.4, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesB", "lc10_scene02_carnalesB_10")
	teleport_to_slate_pos("CS_guardA", 40.49, 0.0, 252.869, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_10")
	teleport_to_slate_pos("CS_guardB", 46.279, 0.0, 257.612, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_10")
	teleport_to_slate_pos("CS_carDex", 35.104, -0.028, 196.401, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_10")
	teleport_to_slate_pos("CS_dex", 35.703, 0.0, 196.933, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_10")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_10")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_10")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_10")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_10")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_10")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_10")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_10")
end

function shot11()
	teleport_to_slate_pos("CS_angelo", 0.572, 0.0, -0.617, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_11")
	teleport_to_slate_pos("CS_carnalesA", 0.572, 0.0, 0.64, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_11")
	teleport_to_slate_pos("CS_guardA", 40.49, 0.0, 252.869, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_11")
	teleport_to_slate_pos("CS_guardB", 46.279, 0.0, 257.612, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_11")
	teleport_to_slate_pos("CS_carDex", 35.104, -0.028, 196.401, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_11")
	teleport_to_slate_pos("CS_dex", 35.703, 0.0, 196.933, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_11")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_11")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_11")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_11")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_11")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_11")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_11")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_11")
	character_hide("CS_carnalesB")
end

function shot12()
	teleport_to_slate_pos("CS_angelo", 1.209, 0.0, -3.396, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_12")
	teleport_to_slate_pos("CS_carnalesA", 0.632, 0.0, -0.87, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_12")
	teleport_to_slate_pos("CS_guardA", 40.49, 0.0, 252.869, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_12")
	teleport_to_slate_pos("CS_guardB", 46.279, 0.0, 257.612, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_12")
	teleport_to_slate_pos("CS_carDex", 35.104, -0.028, 196.401, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_12")
	teleport_to_slate_pos("CS_dex", 35.703, 0.0, 196.933, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_12")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_12")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_12")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_12")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_12")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_12")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_12")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_12")
end

function shot13()
	teleport_to_slate_pos("CS_angelo", 1.292, 0.0, -3.49, "slate_airport_hanger")
	play_custom_action_do("CS_angelo", "lc10_scene02_angelo_13")
	teleport_to_slate_pos("CS_carnalesA", 0.709, 0.0, -0.888, "slate_airport_hanger")
	play_custom_action_do("CS_carnalesA", "lc10_scene02_carnalesA_13")
	teleport_to_slate_pos("CS_guardA", 40.49, 0.0, 252.869, "slate_airport_hanger")
	play_custom_action_do("CS_guardA", "lc10_scene02_guardA_13")
	teleport_to_slate_pos("CS_guardB", 46.279, 0.0, 257.612, "slate_airport_hanger")
	play_custom_action_do("CS_guardB", "lc10_scene02_guardB_13")
	teleport_to_slate_pos("CS_carDex", 35.104, -0.028, 196.401, "slate_airport_hanger")
	play_custom_action_do("CS_carDex", "lc10_scene02_carDex_13")
	teleport_to_slate_pos("CS_dex", 35.703, 0.0, 196.933, "slate_airport_hanger")
	play_custom_action_do("CS_dex", "lc10_scene02_dex_13")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_13")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_13")
	teleport_to_slate_pos("#PLAYER#", 34.893, 0.0, 197.12, "slate_airport_hanger")
	play_custom_action_do("#PLAYER#", "lc10_scene02_player_13")
	teleport_to_slate_pos("CS_lug101", 2.189, 0.0, -2.578, "slate_airport_hanger")
	play_custom_action_do("CS_lug101", "lc10_scene02_lug101_13")
	teleport_to_slate_pos("CS_lug201", 3.623, 0.0, -3.661, "slate_airport_hanger")
	play_custom_action_do("CS_lug201", "lc10_scene02_lug201_13")
	teleport_to_slate_pos("CS_plane", 0.0, 0.0, 0.0, "slate_airport_hanger")
	play_custom_action_do("CS_plane", "lc10_scene02_plane_13")
	teleport_to_slate_pos("CS_acar", -3.57, -0.017, 0.217, "slate_airport_hanger")
	play_custom_action_do("CS_acar", "lc10_scene02_acar_13")
	delay(1.76667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("CS_angelo")
	stop_custom_actions("CS_carnalesA")
	stop_custom_actions("CS_carnalesB")
	stop_custom_actions("CS_guardA")
	stop_custom_actions("CS_guardB")
	stop_custom_actions("CS_carDex")
	stop_custom_actions("CS_dex")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_lug101")
	stop_custom_actions("CS_lug201")
	stop_custom_actions("CS_plane")
	stop_custom_actions("CS_acar")
	letterbox_fade_out(true)
	fade_out(0.5)
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
end
