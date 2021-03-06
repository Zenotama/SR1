-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\hitman_chinatown\hitman_chinatown.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk12__interiors.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_server", 3.85271, -0.00153127, 2.80486, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_1")
	teleport_to_slate_pos("CS_wong", -5.23025, 0.565596, -0.864119, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_1")
	teleport_to_slate_pos("#PLAYER#", 3.94102, -0.00213234, 3.18125, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_1")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_1")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_1")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_1")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_1")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_1")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_1")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_1")
end

function shot2()
	teleport_to_slate_pos("CS_server", 1.36118, -0.0060225, 2.32832, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_2")
	teleport_to_slate_pos("CS_wong", -5.23124, 0.565596, -0.862904, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_2")
	teleport_to_slate_pos("#PLAYER#", 1.54289, 0.21603, 3.73169, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_2")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_2")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_2")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_2")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_2")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_2")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_2")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_2")
end

function shot3()
	teleport_to_slate_pos("CS_server", -3.45705, 0.551606, -2.16565, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_3")
	teleport_to_slate_pos("CS_wong", -5.22995, 0.565596, -0.877911, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_3")
	teleport_to_slate_pos("#PLAYER#", -0.900625, 0.538937, 4.23028, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_3")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_3")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_3")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_3")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_3")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_3")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_3")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_3")
end

function shot4()
	teleport_to_slate_pos("CS_server", -4.78641, 0.578685, -1.60035, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_4")
	teleport_to_slate_pos("CS_wong", -5.22793, 0.565596, -0.870097, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_4")
	teleport_to_slate_pos("#PLAYER#", -1.06745, 0.543917, 4.28075, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_4")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_4")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_4")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_4")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_4")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_4")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_4")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_4")
end

function shot5()
	teleport_to_slate_pos("CS_server", -4.83743, 0.574459, -1.56763, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_5")
	teleport_to_slate_pos("CS_wong", -5.23695, 0.565596, -0.885104, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_5")
	teleport_to_slate_pos("#PLAYER#", -1.45115, 0.560585, 4.57874, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_5")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_5")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_5")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_5")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_5")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_5")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_5")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_5")
end

function shot6()
	teleport_to_slate_pos("CS_server", -4.8391, 0.560386, -1.56969, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_6")
	teleport_to_slate_pos("CS_wong", -5.24283, 0.565596, -0.89253, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_6")
	teleport_to_slate_pos("#PLAYER#", -1.45203, 0.59093, 4.56903, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_6")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_6")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_6")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_6")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_6")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_6")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_6")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_6")
end

function shot7()
	teleport_to_slate_pos("CS_server", -4.82965, 0.567971, -1.57822, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_7")
	teleport_to_slate_pos("CS_wong", -5.23768, 0.565596, -0.879507, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_7")
	teleport_to_slate_pos("#PLAYER#", -1.45571, 0.590952, 4.56142, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_7")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_7")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_7")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_7")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_7")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_7")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_7")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_7")
end

function shot8()
	teleport_to_slate_pos("CS_server", -4.68955, 0.524765, -1.90272, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_8")
	teleport_to_slate_pos("CS_wong", -5.23272, 0.565596, -0.872115, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_8")
	teleport_to_slate_pos("#PLAYER#", -1.53561, 0.552491, 4.38409, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_8")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_8")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_8")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_8")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_8")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_8")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_8")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_8")
end

function shot9()
	teleport_to_slate_pos("CS_server", -3.72762, 0.524966, -1.79156, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_9")
	teleport_to_slate_pos("CS_wong", -5.23617, 0.565596, -0.877523, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_9")
	teleport_to_slate_pos("#PLAYER#", -0.977106, 0.53849, 4.15092, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_9")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_9")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_9")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_9")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_9")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_9")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_9")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_9")
end

function shot10()
	teleport_to_slate_pos("CS_server", -3.71492, 0.531347, -1.80483, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_10")
	teleport_to_slate_pos("CS_wong", -5.23169, 0.565596, -0.869536, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_10")
	teleport_to_slate_pos("#PLAYER#", -0.957114, 0.518819, 4.09964, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_10")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_10")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_10")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_10")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_10")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_10")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_10")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_10")
end

function shot11()
	teleport_to_slate_pos("CS_server", -3.77826, 0.582172, -1.68943, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_11")
	teleport_to_slate_pos("CS_wong", -5.23025, 0.578942, -0.864119, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_11")
	teleport_to_slate_pos("#PLAYER#", -0.898252, 0.515787, 4.10158, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_11")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_11")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_11")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_11")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_11")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_11")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_11")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_11")
end

function shot12()
	teleport_to_slate_pos("CS_server", -3.71492, 0.531347, -1.80483, "slate_tea_chinatown")
	play_custom_action_do("CS_server", "hitman_chinatown_server_12")
	teleport_to_slate_pos("CS_wong", -5.24572, 0.565596, -0.900591, "slate_tea_chinatown")
	play_custom_action_do("CS_wong", "hitman_chinatown_wong_12")
	teleport_to_slate_pos("#PLAYER#", -0.896342, 0.515809, 4.08191, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "hitman_chinatown_player_12")
	teleport_to_slate_pos("CS_table", -3.37358, 0.0, 1.78282, "slate_tea_chinatown")
	play_custom_action_do("CS_table", "hitman_chinatown_table_12")
	teleport_to_slate_pos("CS_chair", -5.24969, 0.0, -0.915374, "slate_tea_chinatown")
	play_custom_action_do("CS_chair", "hitman_chinatown_chair_12")
	teleport_to_slate_pos("CS_chair2", -1.43021, 0.0, 4.70692, "slate_tea_chinatown")
	play_custom_action_do("CS_chair2", "hitman_chinatown_chair2_12")
	teleport_to_slate_pos("CS_teacup", -5.08594, 0.0, -0.697629, "slate_tea_chinatown")
	play_custom_action_do("CS_teacup", "hitman_chinatown_teacup_12")
	teleport_to_slate_pos("CS_Photo01", -1.96533, 0.0, 3.9529, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo01", "hitman_chinatown_photo1_12")
	teleport_to_slate_pos("CS_Photo2", -1.96533, 0.0, 4.04827, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo2", "hitman_chinatown_photo2_12")
	teleport_to_slate_pos("CS_Photo3", -1.87318, 0.0, 3.88712, "slate_tea_chinatown")
	play_custom_action_do("CS_Photo3", "hitman_chinatown_photo3_12")
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_server")
	stop_custom_actions("CS_wong")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_table")
	stop_custom_actions("CS_chair")
	stop_custom_actions("CS_chair2")
	stop_custom_actions("CS_teacup")
	stop_custom_actions("CS_Photo01")
	stop_custom_actions("CS_Photo2")
	stop_custom_actions("CS_Photo3")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
