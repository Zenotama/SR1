-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss01_scene03\tss01_scene03.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__ground.cts
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
	thread_new_cutscene_shot("shot11", 11)
	thread_new_cutscene_shot("shot12", 12)
	thread_new_cutscene_shot("shot13", 13)
	thread_new_cutscene_shot("shot14", 14)
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_johnny", 2.59616, 0.0, -1.0652, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_1")
	teleport_to_slate_pos("#PLAYER#", 1.77318, 0.0, 1.40444, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_1")
	teleport_to_slate_pos("CS_saintsd", 0.203511, 0.0, 2.16336, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_1")
	teleport_to_slate_pos("CS_dex", 2.65285, 0.0, 2.66562, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_1")
	teleport_to_slate_pos("CS_saintsa", 1.36626, 0.0, 3.4041, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_1")
	teleport_to_slate_pos("CS_julius", 1.24332, 0.0, -3.2072, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_1")
	teleport_to_slate_pos("CS_troy", 0.552196, 0.0, -1.71277, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_1")
	teleport_to_slate_pos("CS_SaintC", -95.9007, 0.0, 1.55999, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_1")
end

function shot2()
	teleport_to_slate_pos("CS_johnny", 2.56653, 0.0, -1.12792, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_2")
	teleport_to_slate_pos("#PLAYER#", 1.56755, 0.0, 1.0331, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_2")
	teleport_to_slate_pos("CS_saintsd", 0.275274, 0.0, 2.18758, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_2")
	teleport_to_slate_pos("CS_dex", 2.68029, 0.0, 2.60221, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_2")
	teleport_to_slate_pos("CS_saintsa", 1.38351, 0.0, 3.39872, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_2")
	teleport_to_slate_pos("CS_julius", 1.24483, 0.0, -3.20746, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_2")
	teleport_to_slate_pos("CS_troy", 0.959083, 0.0, -0.687544, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_2")
	teleport_to_slate_pos("CS_SaintC", -107.603, 0.0, 1.73925, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_2")
end

function shot3()
	teleport_to_slate_pos("CS_johnny", 2.5828, 0.0, -0.720534, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_3")
	teleport_to_slate_pos("#PLAYER#", 1.60669, 0.0, 1.05153, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_3")
	teleport_to_slate_pos("CS_saintsd", 0.0926901, 0.0, 1.68994, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_3")
	teleport_to_slate_pos("CS_dex", 2.15216, 0.0, 1.04168, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_3")
	teleport_to_slate_pos("CS_saintsa", 1.43471, 0.0, 3.23576, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_3")
	teleport_to_slate_pos("CS_julius", 1.24786, 0.0, -3.17552, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_3")
	teleport_to_slate_pos("CS_troy", 0.412928, 0.0, -0.0469964, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_3")
	teleport_to_slate_pos("CS_SaintC", -106.338, 0.0, 1.65752, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_3")
end

function shot4()
	teleport_to_slate_pos("CS_johnny", 2.3762, 0.0, -0.57509, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_4")
	teleport_to_slate_pos("#PLAYER#", 1.64968, 0.0, 1.04069, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_4")
	teleport_to_slate_pos("CS_saintsd", 0.288357, 0.0, 2.07089, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_4")
	teleport_to_slate_pos("CS_dex", 0.981591, 0.0, 2.77104, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_4")
	teleport_to_slate_pos("CS_saintsa", 1.88892, 0.0, 3.23881, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_4")
	teleport_to_slate_pos("CS_julius", 1.4631, 0.0, -1.31913, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_4")
	teleport_to_slate_pos("CS_troy", 0.371262, 0.0, 0.0258614, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_4")
	teleport_to_slate_pos("CS_SaintC", 0.822857, 0.0, 1.15475, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_4")
end

function shot5()
	teleport_to_slate_pos("CS_johnny", 2.60626, 0.0, -0.847176, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_5")
	teleport_to_slate_pos("#PLAYER#", 1.57917, 0.0, 1.08701, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_5")
	teleport_to_slate_pos("CS_saintsd", 0.292495, 0.0, 2.07139, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_5")
	teleport_to_slate_pos("CS_dex", 1.26084, 0.0, 2.54571, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_5")
	teleport_to_slate_pos("CS_saintsa", 2.77752, 0.0, 2.55168, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_5")
	teleport_to_slate_pos("CS_julius", 1.45106, 0.0, -0.379851, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_5")
	teleport_to_slate_pos("CS_troy", 0.215005, 0.0, 0.153262, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_5")
	teleport_to_slate_pos("CS_SaintC", 0.10782, 0.0, 1.07769, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_5")
end

function shot6()
	teleport_to_slate_pos("CS_johnny", 2.41085, 0.0, 0.714073, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_6")
	teleport_to_slate_pos("#PLAYER#", 1.4362, 0.0, 1.91444, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_6")
	teleport_to_slate_pos("CS_saintsd", 0.297543, 0.0, 2.04374, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_6")
	teleport_to_slate_pos("CS_dex", 1.33163, 0.0, 2.47945, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_6")
	teleport_to_slate_pos("CS_saintsa", 2.79185, 0.0, 2.58113, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_6")
	teleport_to_slate_pos("CS_julius", 0.597543, 0.0, 0.180514, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_6")
	teleport_to_slate_pos("CS_troy", -0.2851, 0.0, 0.704572, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_6")
	teleport_to_slate_pos("CS_SaintC", -0.025768, 0.0, 1.71492, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_6")
end

function shot7()
	teleport_to_slate_pos("CS_johnny", 2.33779, 0.0, 0.588269, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_7")
	teleport_to_slate_pos("#PLAYER#", 1.38802, 0.0, 1.94615, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_7")
	teleport_to_slate_pos("CS_saintsd", 0.272228, 0.0, 2.14079, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_7")
	teleport_to_slate_pos("CS_dex", 1.23484, 0.0, 2.43948, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_7")
	teleport_to_slate_pos("CS_saintsa", 1.88954, 0.0, 3.26527, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_7")
	teleport_to_slate_pos("CS_julius", 0.686237, 0.0, 0.18937, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_7")
	teleport_to_slate_pos("CS_troy", -0.283635, 0.0, 0.694791, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_7")
	teleport_to_slate_pos("CS_SaintC", -0.0585057, 0.0, 1.65691, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_7")
end

function shot8()
	teleport_to_slate_pos("CS_johnny", 2.32818, 0.0, 0.598463, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_8")
	teleport_to_slate_pos("#PLAYER#", 1.41495, 0.0, 1.9097, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_8")
	teleport_to_slate_pos("CS_saintsd", 0.286909, 0.0, 2.09576, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_8")
	teleport_to_slate_pos("CS_dex", 0.939479, 0.0, 2.53277, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_8")
	teleport_to_slate_pos("CS_saintsa", 1.89402, 0.0, 3.23782, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_8")
	teleport_to_slate_pos("CS_julius", 0.663236, 0.0, 0.205484, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_8")
	teleport_to_slate_pos("CS_troy", -0.311778, 0.0, 0.685466, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_8")
	teleport_to_slate_pos("CS_SaintC", -0.0908998, 0.0, 1.52726, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_8")
end

function shot9()
	teleport_to_slate_pos("CS_johnny", 2.33175, 0.0, 0.653254, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_9")
	teleport_to_slate_pos("#PLAYER#", 1.40399, 0.0, 1.91872, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_9")
	teleport_to_slate_pos("CS_saintsd", 0.284403, 0.0, 2.09271, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_9")
	teleport_to_slate_pos("CS_dex", 0.932065, 0.0, 2.53329, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_9")
	teleport_to_slate_pos("CS_saintsa", 1.81649, 0.0, 3.26174, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_9")
	teleport_to_slate_pos("CS_julius", 0.663775, 0.0, 0.204256, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_9")
	teleport_to_slate_pos("CS_troy", -0.310256, 0.0, 0.674905, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_9")
	teleport_to_slate_pos("CS_SaintC", -0.105537, 0.0, 1.54556, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_9")
end

function shot10()
	teleport_to_slate_pos("CS_johnny", 2.34896, 0.0, 0.676296, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_10")
	teleport_to_slate_pos("#PLAYER#", 1.40978, 0.0, 1.91809, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_10")
	teleport_to_slate_pos("CS_saintsd", 0.27694, 0.0, 2.09356, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_10")
	teleport_to_slate_pos("CS_dex", 0.86114, 0.0, 2.77525, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_10")
	teleport_to_slate_pos("CS_saintsa", 1.99488, 0.0, 3.21594, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_10")
	teleport_to_slate_pos("CS_julius", 0.643682, 0.0, 0.206034, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_10")
	teleport_to_slate_pos("CS_troy", -0.323598, 0.0, 0.675787, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_10")
	teleport_to_slate_pos("CS_SaintC", -0.102527, 0.0, 1.54438, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_10")
end

function shot11()
	teleport_to_slate_pos("CS_johnny", 2.31212, 0.0, 0.65787, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_11")
	teleport_to_slate_pos("#PLAYER#", 1.40199, 0.0, 1.9173, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_11")
	teleport_to_slate_pos("CS_saintsd", 0.277979, 0.0, 2.09379, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_11")
	teleport_to_slate_pos("CS_dex", 0.951717, 0.0, 2.7669, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_11")
	teleport_to_slate_pos("CS_saintsa", 2.17555, 0.0, 3.07255, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_11")
	teleport_to_slate_pos("CS_julius", 0.652919, 0.0, 0.216771, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_11")
	teleport_to_slate_pos("CS_troy", -0.32344, 0.0, 0.690038, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_11")
	teleport_to_slate_pos("CS_SaintC", -0.127361, 0.0, 1.57917, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_11")
end

function shot12()
	teleport_to_slate_pos("CS_johnny", 2.31901, 0.0, 0.649694, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_12")
	teleport_to_slate_pos("#PLAYER#", 1.34278, 0.0, 1.9308, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_12")
	teleport_to_slate_pos("CS_saintsd", 0.264179, 0.0, 2.09094, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_12")
	teleport_to_slate_pos("CS_dex", 0.991076, 0.0, 2.99727, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_12")
	teleport_to_slate_pos("CS_saintsa", 2.43671, 0.0, 2.89955, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_12")
	teleport_to_slate_pos("CS_julius", 0.65372, 0.0, 0.214646, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_12")
	teleport_to_slate_pos("CS_troy", -0.333839, 0.0, 0.665507, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_12")
	teleport_to_slate_pos("CS_SaintC", -0.109026, 0.0, 1.54228, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_12")
end

function shot13()
	teleport_to_slate_pos("CS_johnny", 2.33356, 0.0, 0.65321, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_13")
	teleport_to_slate_pos("#PLAYER#", 1.28098, 0.0, 1.95088, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_13")
	teleport_to_slate_pos("CS_saintsd", 0.279658, 0.0, 2.09572, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_13")
	teleport_to_slate_pos("CS_dex", 0.975336, 0.0, 2.97904, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_13")
	teleport_to_slate_pos("CS_saintsa", 2.62613, 0.0, 2.84762, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_13")
	teleport_to_slate_pos("CS_julius", 0.656642, 0.0, 0.214377, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_13")
	teleport_to_slate_pos("CS_troy", -0.321846, 0.0, 0.6463, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_13")
	teleport_to_slate_pos("CS_SaintC", -0.10071, 0.0, 1.51107, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_13")
end

function shot14()
	teleport_to_slate_pos("CS_johnny", 2.32652, 0.0, 0.659218, "slate_chruch_yard")
	play_custom_action_do("CS_johnny", "tss01_scene03_johnny_14")
	teleport_to_slate_pos("#PLAYER#", 1.27107, 0.0, 1.96516, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss01_scene03_player_14")
	teleport_to_slate_pos("CS_saintsd", 0.277882, 0.0, 2.09592, "slate_chruch_yard")
	play_custom_action_do("CS_saintsd", "tss01_scene03_saintsd_14")
	teleport_to_slate_pos("CS_dex", 0.974464, 0.0, 2.96395, "slate_chruch_yard")
	play_custom_action_do("CS_dex", "tss01_scene03_dex_14")
	teleport_to_slate_pos("CS_saintsa", 2.49278, 0.0, 2.88731, "slate_chruch_yard")
	play_custom_action_do("CS_saintsa", "tss01_scene03_saintsa_14")
	teleport_to_slate_pos("CS_julius", 0.656332, 0.0, 0.211181, "slate_chruch_yard")
	play_custom_action_do("CS_julius", "tss01_scene03_julius_14")
	teleport_to_slate_pos("CS_troy", -0.338223, 0.0, 0.666008, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss01_scene03_troy_14")
	teleport_to_slate_pos("CS_SaintC", -0.10071, 0.0, 1.51107, "slate_chruch_yard")
	play_custom_action_do("CS_SaintC", "tss01_scene03_saintsc_14")
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_johnny")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_saintsd")
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_saintsa")
	stop_custom_actions("CS_julius")
	stop_custom_actions("CS_troy")
	stop_custom_actions("CS_SaintC")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
