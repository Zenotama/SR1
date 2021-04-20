---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: wr08_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunks("sr_chunk02", "sr_chunk40")
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
end

function shot1()
	fade_in(0.5)
	select_slate("slate_chruch_yard")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_julius", 6.279, 0.0, 10.576, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_1")
	teleport_to_slate_pos("#PLAYER#", 7.96, 0.0, 8.426, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "wr08_scene01_player_1")
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	set_level_lights(false)
	tree_shadows_enable(false)
	time_of_day_character_shadows_enable(false)
	spawning_peds(false)
	spawning_cars(false)
end

function shot2()
	teleport_to_slate_pos("CS_julius", 6.277, 0.0, 10.576, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_2")
	teleport_to_slate_pos("#PLAYER#", 6.573, 0.0, 9.996, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "wr08_scene01_player_2")
end

function shot3()
	select_slate("slate_smansion_enter")
	character_hide("#PLAYER#")
	teleport_to_slate_pos("CS_price", 85.998, 0.0, 2.756, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_3")
	teleport_to_slate_pos("CS_rolc", 87.297, 0.0, 6.823, "slate_smansion_enter")
	play_custom_action_do("CS_rolc", "wr08_scene01_rolc_3")
	teleport_to_slate_pos("CS_pricecar", 85.215, 0.043, 0.045, "slate_smansion_enter")
	play_custom_action_do("CS_pricecar", "wr08_scene01_price_car_3")
	teleport_to_slate_pos("CS_rolacar", 83.367, 0.027, 7.355, "slate_smansion_enter")
	play_custom_action_do("CS_rolacar", "wr08_scene01_rolacar_3")
	teleport_to_slate_pos("CS_rolbcar", 81.376, 0.006, 3.421, "slate_smansion_enter")
	play_custom_action_do("CS_rolbcar", "wr08_scene01_rolbcar_3")
	teleport_to_slate_pos("CS_rolb", 85.283, 0.0, 4.423, "slate_smansion_enter")
	play_custom_action_do("CS_rolb", "wr08_scene01_rolb_3")
	teleport_to_slate_pos("CS_rola", 86.362, 0.0, 5.892, "slate_smansion_enter")
	play_custom_action_do("CS_rola", "wr08_scene01_rola_3")
end

function shot4()
	teleport_to_slate_pos("CS_price", 85.998, 0.0, 2.756, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_4")
	teleport_to_slate_pos("CS_rolb", 85.216, 0.0, 4.411, "slate_smansion_enter")
	play_custom_action_do("CS_rolb", "wr08_scene01_rolb_4")
	teleport_to_slate_pos("CS_rola", 86.319, 0.0, 5.891, "slate_smansion_enter")
	play_custom_action_do("CS_rola", "wr08_scene01_rola_4")
end

function shot5()
	teleport_to_slate_pos("CS_price", 85.998, 0.0, 2.756, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_5")
end

function shot6()
	teleport_to_slate_pos("CS_rolc", 87.322, 0.0, 6.632, "slate_smansion_enter")
	play_custom_action_do("CS_rolc", "wr08_scene01_rolc_6")
	teleport_to_slate_pos("CS_rolccar", 89.593, 0.033, 9.271, "slate_smansion_enter")
	play_custom_action_do("CS_rolccar", "wr08_scene01_rolccar_6")
	teleport_to_slate_pos("CS_rolb", 85.3, 0.0, 4.403, "slate_smansion_enter")
	play_custom_action_do("CS_rolb", "wr08_scene01_rolb_6")
	teleport_to_slate_pos("CS_rola", 86.384, 0.0, 5.842, "slate_smansion_enter")
	play_custom_action_do("CS_rola", "wr08_scene01_rola_6")
end

function shot7()
	teleport_to_slate_pos("CS_price", 85.998, 0.0, 2.756, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_7")
end

function shot8()
	teleport_to_slate_pos("CS_price", 85.998, 0.0, 2.756, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_8")
	teleport_to_slate_pos("CS_rolb", 85.323, 0.0, 4.392, "slate_smansion_enter")
	play_custom_action_do("CS_rolb", "wr08_scene01_rolb_8")
	teleport_to_slate_pos("CS_rola", 86.43, 0.0, 5.867, "slate_smansion_enter")
	play_custom_action_do("CS_rola", "wr08_scene01_rola_8")
end

function shot9()
	teleport_to_slate_pos("CS_rolc", 87.326, 0.0, 6.586, "slate_smansion_enter")
	play_custom_action_do("CS_rolc", "wr08_scene01_rolc_9")
	teleport_to_slate_pos("CS_rolb", 85.322, 0.0, 4.386, "slate_smansion_enter")
	play_custom_action_do("CS_rolb", "wr08_scene01_rolb_9")
	teleport_to_slate_pos("CS_rola", 86.429, 0.0, 5.868, "slate_smansion_enter")
	play_custom_action_do("CS_rola", "wr08_scene01_rola_9")
end

function shot10()
	teleport_to_slate_pos("CS_price", 85.998, 0.0, 2.756, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_10")
end

function shot11()
	teleport_to_slate_pos("CS_rolc", 87.323, 0.0, 6.557, "slate_smansion_enter")
	play_custom_action_do("CS_rolc", "wr08_scene01_rolc_11")
	teleport_to_slate_pos("CS_rolb", 85.26, 0.0, 4.453, "slate_smansion_enter")
	play_custom_action_do("CS_rolb", "wr08_scene01_rolb_11")
	teleport_to_slate_pos("CS_rola", 86.204, 0.0, 5.763, "slate_smansion_enter")
	play_custom_action_do("CS_rola", "wr08_scene01_rola_11")
end

function shot12()
	teleport_to_slate_pos("CS_price", 86.185, 0.0, 0.321, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_12")
	teleport_to_slate_pos("CS_pricecar", 85.215, 0.043, 0.045, "slate_smansion_enter")
	play_custom_action_do("CS_pricecar", "wr08_scene01_price_car_12")
end

function shot13()
	teleport_to_slate_pos("CS_price", 85.707, 0.0, 0.212, "slate_smansion_enter")
	play_custom_action_do("CS_price", "wr08_scene01_price_13")
	teleport_to_slate_pos("CS_pricecar", 85.215, 0.043, 0.045, "slate_smansion_enter")
	play_custom_action_do("CS_pricecar", "wr08_scene01_price_car_13")
	teleport_to_slate_pos("CS_rolacar", 83.367, 0.027, 7.355, "slate_smansion_enter")
	play_custom_action_do("CS_rolacar", "wr08_scene01_rolacar_13")
	teleport_to_slate_pos("CS_rolccar", 89.593, 0.033, 9.271, "slate_smansion_enter")
	play_custom_action_do("CS_rolccar", "wr08_scene01_rolccar_13")
	teleport_to_slate_pos("CS_rolbcar", 80.309, -0.02, 2.74, "slate_smansion_enter")
	play_custom_action_do("CS_rolbcar", "wr08_scene01_rolbcar_13")
end

function shot14()
	select_slate("slate_chruch_yard")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_julius", 6.281, 0.0, 10.578, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_14")
	teleport_to_slate_pos("#PLAYER#", 6.576, 0.0, 9.98, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "wr08_scene01_player_14")
end

function shot15()
	character_hide("#PLAYER#")
	teleport_to_slate_pos("CS_troy", 5.168, 0.0, 7.786, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "wr08_scene01_troy_15")
end

function shot16()
	teleport_to_slate_pos("CS_julius", 6.279, 0.0, 10.577, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_16")
end

function shot17()
	teleport_to_slate_pos("CS_julius", 6.278, 0.0, 10.576, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_17")
	teleport_to_slate_pos("CS_troy", 5.324, 0.0, 8.468, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "wr08_scene01_troy_17")
end

function shot18()
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_julius", 6.249, 0.0, 10.537, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_18")
	teleport_to_slate_pos("#PLAYER#", 6.673, 0.0, 9.866, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "wr08_scene01_player_18")
	teleport_to_slate_pos("CS_troy", 5.378, 0.0, 8.658, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "wr08_scene01_troy_18")
end

function shot19()
	character_hide("#PLAYER#")
	teleport_to_slate_pos("CS_julius", 5.985, 0.0, 10.38, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_19")
	teleport_to_slate_pos("CS_troy", 5.378, 0.0, 8.658, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "wr08_scene01_troy_19")
end

function shot20()
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_julius", 6.109, 0.0, 10.302, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_20")
	teleport_to_slate_pos("#PLAYER#", 6.656, 0.0, 9.598, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "wr08_scene01_player_20")
	teleport_to_slate_pos("CS_troy", 5.378, 0.0, 8.658, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "wr08_scene01_troy_20")
end

function shot21()
	character_hide("CS_stander03")
	teleport_to_slate_pos("CS_julius", 6.075, 0.0, 9.692, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "wr08_scene01_julius_21")
	teleport_to_slate_pos("#PLAYER#", 6.824, 0.0, 9.581, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "wr08_scene01_player_21")
	delay(1.6)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	tree_shadows_enable(true)
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("CS_price")
	stop_custom_actions("CS_julius")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_troy")
	stop_custom_actions("CS_rolc")
	stop_custom_actions("CS_pricecar")
	stop_custom_actions("CS_rolacar")
	stop_custom_actions("CS_rolccar")
	stop_custom_actions("CS_rolbcar")
	stop_custom_actions("CS_rolb")
	stop_custom_actions("CS_rola")
	letterbox_fade_out(true)
	fade_out(0.5)
	tree_shadows_enable(true)
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
end

function scripted_event1()
	teleport("CS_stander02", "CS_CSCharnav-stander02_1")
	play_action_sequence("CS_stander02", "stand ready")
end

function scripted_event2()
	teleport("CS_stander03", "CS_CSCharnav-stander03_1")
	play_action_sequence("CS_stander03", "stand ready right")
end

function scripted_event3()
	teleport("CS_stander04", "CS_CSCharnav-stander04_1")
	play_action_sequence("CS_stander04", "stand ready")
end
