-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\wr02_scene01\wr02_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk39__interiors.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", 0.492171, 0.0, 5.06146, "slate_popclub")
	play_custom_action_do("#PLAYER#", "wr02_scene01_player_1")
	teleport_to_slate_pos("CS_lin", -0.150928, 0.0, 0.887856, "slate_popclub")
	play_custom_action_do("CS_lin", "wr02_scene01_lin_1")
	teleport_to_slate_pos("CS_de", -1.11962, 0.0, 2.32944, "slate_popclub")
	play_custom_action_do("CS_de", "wr02_scene01_de_1")
	teleport_to_slate_pos("CS_da", 0.216725, 0.0, -1.19913, "slate_popclub")
	play_custom_action_do("CS_da", "wr02_scene01_da_1")
	teleport_to_slate_pos("CS_db", -1.14085, 0.0, 1.39961, "slate_popclub")
	play_custom_action_do("CS_db", "wr02_scene01_db_1")
	teleport_to_slate_pos("CS_dd", -1.83821, 0.0, -2.46908, "slate_popclub")
	play_custom_action_do("CS_dd", "wr02_scene01_dd_1")
	teleport_to_slate_pos("CS_dc", 1.02692, 0.0, -2.33966, "slate_popclub")
	play_custom_action_do("CS_dc", "wr02_scene01_dc_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 0.361653, 0.0, 4.26809, "slate_popclub")
	play_custom_action_do("#PLAYER#", "wr02_scene01_player_2")
	teleport_to_slate_pos("CS_lin", 0.127252, 0.0, 3.21963, "slate_popclub")
	play_custom_action_do("CS_lin", "wr02_scene01_lin_2")
	teleport_to_slate_pos("CS_de", -1.08581, 0.0, 2.2841, "slate_popclub")
	play_custom_action_do("CS_de", "wr02_scene01_de_2")
	teleport_to_slate_pos("CS_da", 0.197519, 0.0, -1.25232, "slate_popclub")
	play_custom_action_do("CS_da", "wr02_scene01_da_2")
	teleport_to_slate_pos("CS_db", -1.14595, 0.0, 1.46903, "slate_popclub")
	play_custom_action_do("CS_db", "wr02_scene01_db_2")
	teleport_to_slate_pos("CS_dd", -1.82443, 0.0, -2.40511, "slate_popclub")
	play_custom_action_do("CS_dd", "wr02_scene01_dd_2")
	teleport_to_slate_pos("CS_dc", 0.960461, 0.0, -2.32873, "slate_popclub")
	play_custom_action_do("CS_dc", "wr02_scene01_dc_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 0.24501, 0.0, 0.354569, "slate_popclub")
	play_custom_action_do("#PLAYER#", "wr02_scene01_player_3")
	teleport_to_slate_pos("CS_lin", 0.171127, 0.0, -0.421681, "slate_popclub")
	play_custom_action_do("CS_lin", "wr02_scene01_lin_3")
	teleport_to_slate_pos("CS_de", -1.13801, 0.0, 2.59888, "slate_popclub")
	play_custom_action_do("CS_de", "wr02_scene01_de_3")
	teleport_to_slate_pos("CS_da", 0.431438, 0.0, -1.03532, "slate_popclub")
	play_custom_action_do("CS_da", "wr02_scene01_da_3")
	teleport_to_slate_pos("CS_db", -1.19437, 0.0, 1.32987, "slate_popclub")
	play_custom_action_do("CS_db", "wr02_scene01_db_3")
	teleport_to_slate_pos("CS_dd", -2.27883, 0.0, -2.43438, "slate_popclub")
	play_custom_action_do("CS_dd", "wr02_scene01_dd_3")
	teleport_to_slate_pos("CS_dc", -0.557621, 0.0, -2.33095, "slate_popclub")
	play_custom_action_do("CS_dc", "wr02_scene01_dc_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", 0.45544, 0.0, -0.265872, "slate_popclub")
	play_custom_action_do("#PLAYER#", "wr02_scene01_player_4")
	teleport_to_slate_pos("CS_lin", 0.374744, 0.0, 0.00827946, "slate_popclub")
	play_custom_action_do("CS_lin", "wr02_scene01_lin_4")
	teleport_to_slate_pos("CS_de", -1.19381, 0.0, -2.08554, "slate_popclub")
	play_custom_action_do("CS_de", "wr02_scene01_de_4")
	teleport_to_slate_pos("CS_da", 1.28756, 0.0, -1.39169, "slate_popclub")
	play_custom_action_do("CS_da", "wr02_scene01_da_4")
	teleport_to_slate_pos("CS_db", -1.04108, 0.0, -0.35766, "slate_popclub")
	play_custom_action_do("CS_db", "wr02_scene01_db_4")
	teleport_to_slate_pos("CS_dd", -1.67345, 0.0, -1.32484, "slate_popclub")
	play_custom_action_do("CS_dd", "wr02_scene01_dd_4")
	teleport_to_slate_pos("CS_dc", 2.97157, 0.0, -0.405687, "slate_popclub")
	play_custom_action_do("CS_dc", "wr02_scene01_dc_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", 0.441307, 0.0, -0.308859, "slate_popclub")
	play_custom_action_do("#PLAYER#", "wr02_scene01_player_5")
	teleport_to_slate_pos("CS_lin", 0.155977, 0.0, -0.112378, "slate_popclub")
	play_custom_action_do("CS_lin", "wr02_scene01_lin_5")
	teleport_to_slate_pos("CS_de", -1.40422, 0.0, -2.0255, "slate_popclub")
	play_custom_action_do("CS_de", "wr02_scene01_de_5")
	teleport_to_slate_pos("CS_da", 1.71377, 0.0, -1.11418, "slate_popclub")
	play_custom_action_do("CS_da", "wr02_scene01_da_5")
	teleport_to_slate_pos("CS_db", -1.14565, 0.0, -0.340913, "slate_popclub")
	play_custom_action_do("CS_db", "wr02_scene01_db_5")
	teleport_to_slate_pos("CS_dd", -1.83692, 0.0, -1.45951, "slate_popclub")
	play_custom_action_do("CS_dd", "wr02_scene01_dd_5")
	teleport_to_slate_pos("CS_dc", 2.93549, 0.0, -0.500858, "slate_popclub")
	play_custom_action_do("CS_dc", "wr02_scene01_dc_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", 0.382821, 0.0, 0.0970948, "slate_popclub")
	play_custom_action_do("#PLAYER#", "wr02_scene01_player_6")
	teleport_to_slate_pos("CS_lin", 0.123427, 0.0, -0.70663, "slate_popclub")
	play_custom_action_do("CS_lin", "wr02_scene01_lin_6")
	teleport_to_slate_pos("CS_de", -1.65424, 0.0, -2.13898, "slate_popclub")
	play_custom_action_do("CS_de", "wr02_scene01_de_6")
	teleport_to_slate_pos("CS_da", 2.34375, 0.0, 1.6851, "slate_popclub")
	play_custom_action_do("CS_da", "wr02_scene01_da_6")
	teleport_to_slate_pos("CS_db", -1.11104, 0.0, -0.289171, "slate_popclub")
	play_custom_action_do("CS_db", "wr02_scene01_db_6")
	teleport_to_slate_pos("CS_dd", -1.93319, 0.0, -1.3735, "slate_popclub")
	play_custom_action_do("CS_dd", "wr02_scene01_dd_6")
	teleport_to_slate_pos("CS_dc", 2.89401, 0.0, -0.455559, "slate_popclub")
	play_custom_action_do("CS_dc", "wr02_scene01_dc_6")
	fade_out(0.0333333)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_lin")
	stop_custom_actions("CS_de")
	stop_custom_actions("CS_da")
	stop_custom_actions("CS_db")
	stop_custom_actions("CS_dd")
	stop_custom_actions("CS_dc")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
