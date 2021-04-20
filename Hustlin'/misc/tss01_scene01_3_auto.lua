-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss01_scene01\tss01_scene01.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", 3.1564, 0.000109538, -3.64745, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_1")
	teleport_to_slate_pos("CS_jul", -8.07535, 1.75658, -16.0746, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_1")
	teleport_to_slate_pos("CS_jnny", -1.16666, 0.0, -8.02194, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_1")
	teleport_to_slate_pos("CS_snta", 1.37337, -0.000542409, -6.38811, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_1")
	teleport_to_slate_pos("CS_sntb", 0.585499, -0.00323129, -4.63448, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_1")
	teleport_to_slate_pos("CS_sntc", -0.610165, -0.00300873, -4.70685, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_1")
	teleport_to_slate_pos("CS_sntd", -2.38574, -0.00510589, -7.2417, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_1")
	teleport_to_slate_pos("CS_troy", -7.53866, 1.77953, -11.9049, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 1.42958, 0.000109538, -5.11473, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_2")
	teleport_to_slate_pos("CS_jul", -6.41794, 1.75658, -12.3426, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_2")
	teleport_to_slate_pos("CS_jnny", -1.15698, 0.0, -8.00751, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_2")
	teleport_to_slate_pos("CS_snta", 1.40128, -0.000542409, -6.50413, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_2")
	teleport_to_slate_pos("CS_sntb", 0.594346, -0.00323129, -4.63286, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_2")
	teleport_to_slate_pos("CS_sntc", -0.608797, -0.00300873, -4.72323, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_2")
	teleport_to_slate_pos("CS_sntd", -2.38742, -0.00510589, -7.2256, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_2")
	teleport_to_slate_pos("CS_troy", -7.23665, 1.77953, -11.9782, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 1.52126, 0.000109538, -5.23708, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_3")
	teleport_to_slate_pos("CS_jul", -6.23586, 1.75658, -12.4583, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_3")
	teleport_to_slate_pos("CS_jnny", -1.13996, 0.0, -8.04849, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_3")
	teleport_to_slate_pos("CS_snta", 1.28814, -0.000542409, -6.45995, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_3")
	teleport_to_slate_pos("CS_sntb", 0.491551, -0.00323129, -4.71699, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_3")
	teleport_to_slate_pos("CS_sntc", -0.615876, -0.00300873, -4.71348, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_3")
	teleport_to_slate_pos("CS_sntd", -2.37152, -0.00510589, -7.23433, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_3")
	teleport_to_slate_pos("CS_troy", -7.23897, 1.77953, -11.9717, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", 1.53379, 0.000109538, -5.25461, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_4")
	teleport_to_slate_pos("CS_jul", -6.24236, 1.75658, -12.44, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_4")
	teleport_to_slate_pos("CS_jnny", -1.24527, 0.0, -7.92692, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_4")
	teleport_to_slate_pos("CS_snta", 1.26178, -0.000542409, -6.52685, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_4")
	teleport_to_slate_pos("CS_sntb", 0.506901, -0.00323129, -4.67803, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_4")
	teleport_to_slate_pos("CS_sntc", -0.541503, -0.00300873, -4.71712, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_4")
	teleport_to_slate_pos("CS_sntd", -2.3136, -0.00510589, -7.28279, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_4")
	teleport_to_slate_pos("CS_troy", -7.23897, 1.77953, -11.9717, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", 1.52386, 0.000109538, -5.24729, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_5")
	teleport_to_slate_pos("CS_jul", -6.27962, 1.75658, -12.4158, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_5")
	teleport_to_slate_pos("CS_jnny", -1.24562, 0.0, -7.92607, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_5")
	teleport_to_slate_pos("CS_snta", 1.28102, -0.000542409, -6.59339, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_5")
	teleport_to_slate_pos("CS_sntb", 0.486926, -0.00323129, -4.64673, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_5")
	teleport_to_slate_pos("CS_sntc", -0.513582, -0.00300873, -4.7974, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_5")
	teleport_to_slate_pos("CS_sntd", -2.30315, -0.00510589, -7.29526, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_5")
	teleport_to_slate_pos("CS_troy", -7.23897, 1.77953, -11.9717, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", 1.34556, 0.000109538, -5.28956, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_6")
	teleport_to_slate_pos("CS_jul", -6.27145, 1.75658, -12.4126, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_6")
	teleport_to_slate_pos("CS_jnny", -1.19632, 0.0, -7.96352, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_6")
	teleport_to_slate_pos("CS_snta", 1.2588, -0.000542409, -6.51236, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_6")
	teleport_to_slate_pos("CS_sntb", 0.48048, -0.00323129, -4.6495, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_6")
	teleport_to_slate_pos("CS_sntc", -0.675723, -0.00300873, -4.64115, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_6")
	teleport_to_slate_pos("CS_sntd", -2.36378, -0.00510589, -7.15913, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_6")
	teleport_to_slate_pos("CS_troy", -7.23897, 1.77953, -11.9717, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", 1.23043, 0.000109538, -5.35784, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_7")
	teleport_to_slate_pos("CS_jul", -6.27348, 1.75658, -12.3771, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_7")
	teleport_to_slate_pos("CS_jnny", -1.08202, 0.0, -8.00775, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_7")
	teleport_to_slate_pos("CS_snta", 1.30103, -0.000542409, -6.53704, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_7")
	teleport_to_slate_pos("CS_sntb", 0.400392, -0.00323129, -4.56895, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_7")
	teleport_to_slate_pos("CS_sntc", -0.700562, -0.00300873, -4.62852, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_7")
	teleport_to_slate_pos("CS_sntd", -2.26208, -0.00510589, -7.17392, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_7")
	teleport_to_slate_pos("CS_troy", -7.23897, 1.77953, -11.9717, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_7")
end

function shot8()
	teleport_to_slate_pos("#PLAYER#", 1.25777, 0.000109538, -5.31269, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_8")
	teleport_to_slate_pos("CS_jul", -6.24765, 1.75658, -12.4239, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_8")
	teleport_to_slate_pos("CS_jnny", -1.08986, 0.0, -8.04985, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_8")
	teleport_to_slate_pos("CS_snta", 2.74379, -0.000542409, -5.17032, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_8")
	teleport_to_slate_pos("CS_sntb", 2.07437, -0.00323129, -4.01457, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_8")
	teleport_to_slate_pos("CS_sntc", -0.575494, -0.00300873, -4.67626, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_8")
	teleport_to_slate_pos("CS_sntd", -2.36488, -0.00510589, -7.25289, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_8")
	teleport_to_slate_pos("CS_troy", -7.23897, 1.77953, -11.9717, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_8")
end

function shot9()
	teleport_to_slate_pos("#PLAYER#", 1.23311, 0.000109538, -5.27213, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_9")
	teleport_to_slate_pos("CS_jul", -6.20155, 1.75658, -12.4433, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_9")
	teleport_to_slate_pos("CS_jnny", -1.07918, 0.0, -8.04214, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_9")
	teleport_to_slate_pos("CS_snta", 2.93285, -0.000542409, -5.28313, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_9")
	teleport_to_slate_pos("CS_sntb", 2.0533, -0.00323129, -4.13238, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_9")
	teleport_to_slate_pos("CS_sntc", -0.586061, -0.00300873, -4.65747, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_9")
	teleport_to_slate_pos("CS_sntd", -2.36903, -0.00510589, -7.25002, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_9")
	teleport_to_slate_pos("CS_troy", -7.19498, 1.77953, -12.0219, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_9")
end

function shot10()
	teleport_to_slate_pos("#PLAYER#", 1.27286, 0.000109538, -5.35369, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_10")
	teleport_to_slate_pos("CS_jul", -6.21074, 1.75658, -12.4372, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_10")
	teleport_to_slate_pos("CS_jnny", -1.04542, 0.0, -7.86853, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_10")
	teleport_to_slate_pos("CS_snta", 2.93904, -0.000542409, -5.20348, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_10")
	teleport_to_slate_pos("CS_sntb", 2.05912, -0.00323129, -4.14264, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_10")
	teleport_to_slate_pos("CS_sntc", -0.587919, -0.00300873, -4.65805, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_10")
	teleport_to_slate_pos("CS_sntd", -2.37102, -0.00510589, -7.24905, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_10")
	teleport_to_slate_pos("CS_troy", -7.19798, 1.77953, -12.02, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_10")
end

function shot11()
	teleport_to_slate_pos("#PLAYER#", 1.90668, 0.000109538, -4.8532, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_11")
	teleport_to_slate_pos("CS_jul", -6.21531, 1.75658, -12.4516, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_11")
	teleport_to_slate_pos("CS_jnny", -1.05179, 0.0, -7.86281, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_11")
	teleport_to_slate_pos("CS_snta", 2.80275, -0.000542409, -5.11289, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_11")
	teleport_to_slate_pos("CS_sntb", 2.06477, -0.00323129, -4.14144, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_11")
	teleport_to_slate_pos("CS_sntc", -0.535286, -0.00300873, -4.73311, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_11")
	teleport_to_slate_pos("CS_sntd", -2.36954, -0.00510589, -7.24702, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_11")
	teleport_to_slate_pos("CS_troy", -7.20757, 1.77953, -12.026, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_11")
end

function shot12()
	teleport_to_slate_pos("#PLAYER#", 1.9964, 0.000109538, -4.91965, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_12")
	teleport_to_slate_pos("CS_jul", -6.21031, 1.75658, -12.4509, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_12")
	teleport_to_slate_pos("CS_jnny", -1.05558, 0.0, -7.8681, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_12")
	teleport_to_slate_pos("CS_snta", 2.90653, -0.000542409, -5.18522, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_12")
	teleport_to_slate_pos("CS_sntb", 2.04636, -0.00323129, -4.11326, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_12")
	teleport_to_slate_pos("CS_sntc", -0.102301, -0.00300873, -5.16799, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_12")
	teleport_to_slate_pos("CS_sntd", -2.36949, -0.00510589, -7.24711, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_12")
	teleport_to_slate_pos("CS_troy", -7.20544, 1.77953, -12.0255, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_12")
end

function shot13()
	teleport_to_slate_pos("#PLAYER#", 1.96074, 0.000109538, -4.86635, "slate_chruch_yard")
	play_custom_action_do("#PLAYER#", "tss_01_scene01_pc_13")
	teleport_to_slate_pos("CS_jul", -6.20667, 1.75658, -12.4514, "slate_chruch_yard")
	play_custom_action_do("CS_jul", "tss_01_scene01_jul_13")
	teleport_to_slate_pos("CS_jnny", -1.05558, 0.0, -7.8681, "slate_chruch_yard")
	play_custom_action_do("CS_jnny", "tss_01_scene01_jnny_13")
	teleport_to_slate_pos("CS_snta", 2.86976, -0.000542409, -5.28952, "slate_chruch_yard")
	play_custom_action_do("CS_snta", "tss_01_scene01_snta_13")
	teleport_to_slate_pos("CS_sntb", 2.12694, -0.00323129, -4.1003, "slate_chruch_yard")
	play_custom_action_do("CS_sntb", "tss_01_scene01_sntb_13")
	teleport_to_slate_pos("CS_sntc", 0.125721, -0.00300873, -5.36882, "slate_chruch_yard")
	play_custom_action_do("CS_sntc", "tss_01_scene01_sntc_13")
	teleport_to_slate_pos("CS_sntd", -2.36949, -0.00510589, -7.24711, "slate_chruch_yard")
	play_custom_action_do("CS_sntd", "tss_01_scene01_sntd_13")
	teleport_to_slate_pos("CS_troy", -7.20544, 1.77953, -12.0255, "slate_chruch_yard")
	play_custom_action_do("CS_troy", "tss_01_scene01_troy_13")
	fade_out(0.0)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_jul")
	stop_custom_actions("CS_jnny")
	stop_custom_actions("CS_snta")
	stop_custom_actions("CS_sntb")
	stop_custom_actions("CS_sntc")
	stop_custom_actions("CS_sntd")
	stop_custom_actions("CS_troy")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end