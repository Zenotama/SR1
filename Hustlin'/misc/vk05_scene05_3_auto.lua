-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk05_scene05\vk05_scene05.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk38_greens__interiors.cts
-------------------------------------


function cutscene_main()
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
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_jnny", -0.0588429, 0.0, -4.42129, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_1")
	teleport_to_slate_pos("#PLAYER#", -3.11382, 0.0, 0.211398, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_1")
	teleport_to_slate_pos("CS_grn", -3.86254, 0.0, 0.282272, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_1")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_1")
	teleport_to_slate_pos("CS_pist", -3.25275, 0.0, 0.253333, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_1")
end

function shot2()
	teleport_to_slate_pos("CS_jnny", -0.0582452, 0.0, -4.42242, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_2")
	teleport_to_slate_pos("#PLAYER#", -2.98194, 0.0, 0.186974, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_2")
	teleport_to_slate_pos("CS_grn", -3.86254, 0.0, 0.282272, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_2")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_2")
	teleport_to_slate_pos("CS_pist", -3.05119, 0.0, 0.316152, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_2")
end

function shot3()
	teleport_to_slate_pos("CS_jnny", -0.0603534, 0.0, -4.42389, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_3")
	teleport_to_slate_pos("#PLAYER#", -2.76637, 0.0, -0.369364, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_3")
	teleport_to_slate_pos("CS_grn", -3.86254, 0.0, 0.282272, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_3")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_3")
	teleport_to_slate_pos("CS_pist", -2.62679, 0.0, -0.32608, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_3")
end

function shot4()
	teleport_to_slate_pos("CS_jnny", -0.0600386, 0.0, -4.42524, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_4")
	teleport_to_slate_pos("#PLAYER#", -1.54992, 0.0, -2.59128, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_4")
	teleport_to_slate_pos("CS_grn", -3.86254, 0.0, 0.282272, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_4")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_4")
	teleport_to_slate_pos("CS_pist", -1.40786, 0.0, -2.55393, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_4")
end

function shot5()
	teleport_to_slate_pos("CS_jnny", -0.0341823, 0.0, -4.45569, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_5")
	teleport_to_slate_pos("#PLAYER#", -0.557565, 0.0, -4.56387, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_5")
	teleport_to_slate_pos("CS_grn", -3.86254, 0.0, 0.282272, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_5")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_5")
	teleport_to_slate_pos("CS_pist", -0.539226, 0.0, -4.41413, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_5")
end

function shot6()
	teleport_to_slate_pos("CS_jnny", 0.409112, 0.0, -3.93114, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_6")
	teleport_to_slate_pos("#PLAYER#", 0.0982657, 0.0, -4.33997, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_6")
	teleport_to_slate_pos("CS_grn", -3.86254, 0.0, 0.282272, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_6")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_6")
	teleport_to_slate_pos("CS_pist", -0.033968, 0.0, -4.28448, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_6")
end

function shot7()
	teleport_to_slate_pos("CS_jnny", 0.434573, 0.0, -3.85534, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_7")
	teleport_to_slate_pos("#PLAYER#", 0.173659, 0.0, -4.36059, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_7")
	teleport_to_slate_pos("CS_grn", -3.85456, 0.0, 0.288393, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_7")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_7")
	teleport_to_slate_pos("CS_pist", -0.234396, 0.0, -3.25051, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_7")
end

function shot8()
	teleport_to_slate_pos("CS_jnny", 0.408867, 0.0, -3.87314, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_8")
	teleport_to_slate_pos("#PLAYER#", 0.156564, 0.0, -4.35305, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_8")
	teleport_to_slate_pos("CS_grn", -3.87248, 0.0, 0.290407, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_8")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_8")
	teleport_to_slate_pos("CS_pist", -0.0371384, 0.0, -3.4343, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_8")
end

function shot9()
	teleport_to_slate_pos("CS_jnny", 0.440053, 0.0, -3.81905, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_9")
	teleport_to_slate_pos("#PLAYER#", 0.137078, 0.0, -4.36832, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_9")
	teleport_to_slate_pos("CS_grn", -3.87248, 0.0, 0.290407, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_9")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_9")
	teleport_to_slate_pos("CS_pist", 0.081199, 0.0, -3.49648, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_9")
end

function shot10()
	teleport_to_slate_pos("CS_jnny", 0.483732, 0.0, -3.95159, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_jnny", "vk05_scene05_jnny_10")
	teleport_to_slate_pos("#PLAYER#", 0.156703, 0.0, -4.34812, "slate_anthony_2nd_fl")
	play_custom_action_do("#PLAYER#", "vk05_scene05_pc_10")
	teleport_to_slate_pos("CS_grn", -3.87248, 0.0, 0.290407, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_grn", "vk05_scene05_grn_10")
	teleport_to_slate_pos("CS_chair", 0.0188357, 0.0, -4.91091, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_chair", "vk05_scene05_chair_10")
	teleport_to_slate_pos("CS_pist", -3.0127, 0.0, 0.114693, "slate_anthony_2nd_fl")
	play_custom_action_do("CS_pist", "vk05_scene05_pist_10")
	delay(7)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_jnny")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_grn")
	stop_custom_actions("CS_chair")
	stop_custom_actions("CS_pist")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end