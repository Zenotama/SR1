-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk04a_scene02\vk04a_scene02.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk08_vk4a__interiors.cts
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
	thread_new_cutscene_shot("shot15", 15)
	thread_new_cutscene_shot("shot16", 16)
	thread_new_cutscene_shot("shot17", 17)
	thread_new_cutscene_shot("shot18", 18)
	thread_new_cutscene_shot("shot19", 19)
	thread_new_cutscene_shot("shot20", 20)
	thread_new_cutscene_shot("shot21", 21)
	thread_new_cutscene_shot("shot22", 22)
	thread_new_cutscene_shot("shot23", 23)
	thread_new_cutscene_shot("shot24", 24)
	thread_new_cutscene_shot("shot25", 25)
	thread_new_cutscene_shot("shot26", 26)
	thread_new_cutscene_shot("shot27", 27)
	thread_new_cutscene_shot("shot28", 28)
	thread_new_cutscene_shot("shot29", 29)
	thread_new_cutscene_shot("shot30", 30)
	thread_new_cutscene_shot("shot31", 31)
	thread_new_cutscene_shot("shot32", 32)
	thread_new_cutscene_shot("shot33", 33)
	thread_new_cutscene_shot("shot34", 34)
	thread_new_cutscene_shot("shot35", 35)
	thread_new_cutscene_shot("shot36", 36)
	thread_new_cutscene_shot("shot37", 37)
	thread_new_cutscene_shot("shot38", 38)
	thread_new_cutscene_shot("shot39", 39)
	thread_new_cutscene_shot("shot40", 40)
	thread_new_cutscene_shot("shot41", 41)
	thread_new_cutscene_shot("shot42", 42)
	thread_new_cutscene_shot("shot43", 43)
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_jnny", -1.01787, 0.0, -11.2014, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_1")
	teleport_to_slate_pos("CS_anth", -2.36811, 0.0, -4.40078, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_1")
	teleport_to_slate_pos("CS_tnya", 0.081097, 0.0, 0.435816, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_1")
	teleport_to_slate_pos("CS_sgunjnny", -0.602155, 0.0, -11.0332, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_1")
	teleport_to_slate_pos("#PLAYER#", -1.89807, 0.0321907, -10.8881, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_1")
end

function shot2()
	teleport_to_slate_pos("CS_tnya", 0.787264, 0.0, 4.27615, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_2")
end

function shot3()
	teleport_to_slate_pos("CS_anth", -1.35017, 0.0, -4.18312, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_3")
	teleport_to_slate_pos("CS_sgunant", -1.10657, 0.0, -4.11523, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_3")
	teleport_to_slate_pos("#PLAYER#", -1.22248, 0.0, -3.24013, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_3")
end

function shot4()
	teleport_to_slate_pos("CS_jnny", 0.001642, 0.0, -2.99804, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_4")
	teleport_to_slate_pos("CS_anth", -1.3019, 0.0, -4.22386, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_4")
	teleport_to_slate_pos("#PLAYER#", -1.1581, 0.0, -2.93192, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_4")
end

function shot5()
	teleport_to_slate_pos("CS_jnny", -0.028066, 0.0, -2.98445, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_5")
	teleport_to_slate_pos("CS_anth", -1.5329, 0.0, -4.12039, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_5")
	teleport_to_slate_pos("CS_sgunjnny", 0.122558, 0.0, -2.62913, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_5")
	teleport_to_slate_pos("CS_sgunant", -1.06976, 0.0, -4.06547, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_5")
end

function shot6()
	teleport_to_slate_pos("CS_tnya", 0.739951, 0.0, 4.46205, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_6")
end

function shot7()
	teleport_to_slate_pos("CS_jnny", -0.0180675, 0.0, -2.97807, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_7")
	teleport_to_slate_pos("CS_anth", -1.11555, 0.0, -4.16702, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_7")
	teleport_to_slate_pos("CS_tnya", 0.69936, 0.0, 4.41538, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_7")
	teleport_to_slate_pos("CS_sgunjnny", 0.120385, 0.0, -2.60522, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_7")
	teleport_to_slate_pos("CS_sgunant", -0.770114, 0.0, -3.96103, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_7")
	teleport_to_slate_pos("#PLAYER#", -1.10662, 0.0, -2.32733, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_7")
end

function shot8()
	teleport_to_slate_pos("CS_jnny", -0.0299974, 0.0, -2.97241, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_8")
	teleport_to_slate_pos("CS_anth", -1.03432, 0.0, -4.09867, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_8")
	teleport_to_slate_pos("CS_sgunjnny", 0.102933, 0.0, -2.61908, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_8")
	teleport_to_slate_pos("CS_sgunant", -0.710889, 0.0, -3.89622, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_8")
end

function shot9()
	teleport_to_slate_pos("CS_jnny", -0.0151517, 0.0, -2.87089, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_9")
	teleport_to_slate_pos("CS_anth", -0.98676, 0.0, -4.10936, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_9")
	teleport_to_slate_pos("CS_sgunjnny", 0.125154, 0.0, -2.55318, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_9")
	teleport_to_slate_pos("CS_sgunant", -0.712177, 0.0, -4.0142, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_9")
end

function shot10()
	teleport_to_slate_pos("CS_jnny", 0.0313517, 0.0, -2.99844, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_10")
	teleport_to_slate_pos("CS_anth", -1.0176, 0.0, -4.0955, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_10")
	teleport_to_slate_pos("CS_sgunjnny", 0.32313, 0.0, -2.73905, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_10")
	teleport_to_slate_pos("CS_sgunant", -0.691409, 0.0, -3.93841, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_10")
end

function shot11()
	teleport_to_slate_pos("CS_jnny", 0.0404228, 0.0, -2.89268, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_11")
	teleport_to_slate_pos("CS_anth", -0.417218, 0.0, -3.92092, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_11")
	teleport_to_slate_pos("CS_sgunant", -0.116632, 0.0, -3.92219, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_11")
end

function shot12()
	teleport_to_slate_pos("CS_jnny", 0.0260429, 0.0, -2.88549, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_12")
	teleport_to_slate_pos("CS_anth", -0.544477, 0.0, -3.8928, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_12")
	teleport_to_slate_pos("CS_pistjnny", 0.0192629, 0.0, -3.52158, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_12")
	teleport_to_slate_pos("CS_sgunant", -0.256053, 0.0, -3.92846, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_12")
end

function shot13()
	teleport_to_slate_pos("CS_tnya", -0.16824, 0.0, 1.49069, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_13")
	teleport_to_slate_pos("CS_pistjnny", 1.06373, 0.0, -1.75995, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_13")
end

function shot14()
	teleport_to_slate_pos("CS_jnny", 0.0400952, 0.0, -2.88051, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_14")
	teleport_to_slate_pos("CS_anth", -0.300332, 0.0, -3.73676, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_14")
	teleport_to_slate_pos("CS_sgunant", 0.155345, 0.0, -3.51525, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_14")
end

function shot15()
	teleport_to_slate_pos("CS_anth", -0.327878, 0.0, -3.73318, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_15")
	teleport_to_slate_pos("CS_sgunant", -0.152796, 0.0, -3.99439, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_15")
end

function shot16()
	teleport_to_slate_pos("CS_jnny", 0.00325316, 0.0, -2.86751, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_16")
	teleport_to_slate_pos("CS_sgunant", -0.527789, 0.0, -3.85133, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_16")
end

function shot17()
	teleport_to_slate_pos("CS_jnny", 0.0712414, 0.0, -3.05598, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_17")
	teleport_to_slate_pos("CS_anth", -0.417175, 0.0, -3.95488, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_17")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_17")
	teleport_to_slate_pos("CS_sgunant", 0.264261, 0.0, -3.72868, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_17")
	teleport_to_slate_pos("#PLAYER#", -1.10885, 0.0, -2.32629, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_17")
end

function shot18()
	teleport_to_slate_pos("CS_jnny", -0.0750753, 0.0, -2.50052, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_18")
	teleport_to_slate_pos("CS_anth", -0.440159, 0.0, -4.05567, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_18")
	teleport_to_slate_pos("CS_sgunant", -0.232706, 0.0, -3.65592, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_18")
end

function shot19()
	teleport_to_slate_pos("CS_anth", -0.119605, 0.0, -3.87736, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_19")
	teleport_to_slate_pos("CS_sgunant", 0.0680216, 0.0, -3.37521, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_19")
end

function shot20()
	teleport_to_slate_pos("CS_snta", 33.2821, -7.77731, -35.2732, "slate_vkpolice01")
	play_custom_action_do("CS_snta", "vk04a_scene02_snta_20")
	teleport_to_slate_pos("CS_sntb", 32.5541, -7.77902, -34.8591, "slate_vkpolice01")
	play_custom_action_do("CS_sntb", "vk04a_scene02_sntb_20")
	teleport_to_slate_pos("CS_car", 68.3247, -7.9244, -94.5702, "slate_vkpolice01")
	play_custom_action_do("CS_car", "vk04a_scene02_car_20")
end

function shot21()
	teleport_to_slate_pos("CS_sntb", 28.1066, -7.77902, -39.37, "slate_vkpolice01")
	play_custom_action_do("CS_sntb", "vk04a_scene02_sntb_21")
	teleport_to_slate_pos("CS_car", 29.1979, -7.95912, -39.6833, "slate_vkpolice01")
	play_custom_action_do("CS_car", "vk04a_scene02_car_21")
end

function shot22()
	teleport_to_slate_pos("CS_jnny", 0.23735, 0.0, -2.79832, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_22")
	teleport_to_slate_pos("CS_anth", -0.5493, 0.0, -3.97921, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_22")
	teleport_to_slate_pos("CS_sgunant", -0.202274, 0.0, -3.60247, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_22")
end

function shot23()
	teleport_to_slate_pos("CS_tnya", -0.139651, 0.0, 1.27448, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_23")
	teleport_to_slate_pos("CS_pistjnny", -0.596718, 0.0, 1.35621, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_23")
end

function shot24()
	teleport_to_slate_pos("CS_jnny", 0.235192, 0.0, -2.80137, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_24")
	teleport_to_slate_pos("CS_anth", -0.520647, 0.0, -3.88854, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_24")
	teleport_to_slate_pos("CS_tnya", -0.382983, 0.0, 0.782245, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_24")
	teleport_to_slate_pos("CS_pistjnny", -0.533419, 0.0, 0.476144, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_24")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_24")
	teleport_to_slate_pos("CS_sgunant", -0.257062, 0.0, -3.45805, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_24")
	teleport_to_slate_pos("#PLAYER#", -1.10886, 0.0, -2.32187, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_24")
end

function shot25()
	teleport_to_slate_pos("CS_jnny", 0.213963, 0.0, -2.74917, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_25")
	teleport_to_slate_pos("CS_anth", -0.541292, 0.0, -3.94645, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_25")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_25")
	teleport_to_slate_pos("CS_sgunant", -0.149949, 0.0, -3.57532, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_25")
	teleport_to_slate_pos("#PLAYER#", -1.1086, 0.0, -2.32291, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_25")
end

function shot26()
	teleport_to_slate_pos("#PLAYER#", -1.10757, 0.0, -2.32748, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_26")
end

function shot27()
	teleport_to_slate_pos("CS_jnny", 0.214831, 0.0, -2.55016, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_27")
	teleport_to_slate_pos("CS_anth", -0.533697, 0.0, -3.92166, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_27")
	teleport_to_slate_pos("CS_sgunant", -0.195423, 0.0, -3.56093, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_27")
end

function shot28()
	teleport_to_slate_pos("CS_jnny", 0.515762, 0.0, -2.51702, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_28")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_28")
	teleport_to_slate_pos("#PLAYER#", -1.11072, 0.0, -2.32371, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_28")
end

function shot29()
	teleport_to_slate_pos("CS_jnny", 0.467393, 0.0, -2.13083, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_29")
	teleport_to_slate_pos("CS_anth", -0.426375, 0.0, -3.80045, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_29")
	teleport_to_slate_pos("CS_sgunant", -0.187391, 0.0, -3.4056, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_29")
end

function shot30()
	teleport_to_slate_pos("CS_jnny", 0.237304, 0.0, -2.20646, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_30")
	teleport_to_slate_pos("CS_anth", -0.462963, 0.0, -3.79291, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_30")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_30")
	teleport_to_slate_pos("CS_sgunant", -0.15635, 0.0, -3.41415, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_30")
	teleport_to_slate_pos("#PLAYER#", -1.11044, 0.0, -2.32327, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_30")
end

function shot31()
	teleport_to_slate_pos("CS_anth", -0.607487, 0.0, -3.87543, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_31")
	teleport_to_slate_pos("CS_sgunant", -0.0111559, 0.0, -3.71925, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_31")
end

function shot32()
	teleport_to_slate_pos("CS_jnny", 0.112302, 0.0, -2.84292, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_32")
	teleport_to_slate_pos("CS_anth", -0.743842, 0.0, -3.89989, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_32")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_32")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_32")
end

function shot33()
	teleport_to_slate_pos("CS_jnny", -0.885373, 0.0, -3.92875, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_33")
	teleport_to_slate_pos("CS_anth", -1.47787, 0.0, -4.31785, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_33")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_33")
end

function shot34()
	teleport_to_slate_pos("CS_jnny", -1.49139, 0.0, -4.03802, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_34")
	teleport_to_slate_pos("CS_anth", -1.58359, 0.0, -4.323, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_34")
	teleport_to_slate_pos("CS_tnya", -0.325544, 0.0, 0.701881, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_34")
	teleport_to_slate_pos("CS_pistjnny", -0.442076, 0.0, 0.484366, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_34")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_34")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_34")
	teleport_to_slate_pos("#PLAYER#", -1.50975, 0.0, -2.86748, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_34")
end

function shot35()
	teleport_to_slate_pos("CS_jnny", -1.274, 0.0, -4.74223, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_35")
	teleport_to_slate_pos("CS_anth", -1.49928, 0.0, -4.53954, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_35")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_35")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_35")
end

function shot36()
	teleport_to_slate_pos("CS_jnny", -1.18231, 0.0, -4.85303, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_36")
	teleport_to_slate_pos("CS_anth", -1.20053, 0.0, -4.70403, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_36")
	teleport_to_slate_pos("CS_tnya", 1.3187, 0.0, 0.53238, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_36")
	teleport_to_slate_pos("CS_sgunjnny", 0.90169, 0.0, -3.08746, "slate_vkpolice01")
	play_custom_action_do("CS_sgunjnny", "vk04a_scene02_sgjny_36")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_36")
end

function shot37()
	teleport_to_slate_pos("CS_jnny", -1.19041, 0.0, -4.85318, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_37")
	teleport_to_slate_pos("CS_anth", -1.1536, 0.0, -4.70771, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_37")
end

function shot38()
	teleport_to_slate_pos("CS_jnny", -1.19311, 0.0, -4.81396, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_38")
	teleport_to_slate_pos("CS_anth", -1.19039, 0.0, -4.71251, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_38")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_38")
end

function shot39()
	teleport_to_slate_pos("CS_jnny", -1.20133, 0.0, -4.8342, "slate_vkpolice01")
	play_custom_action_do("CS_jnny", "vk04a_scene02_jnny_39")
	teleport_to_slate_pos("CS_anth", -1.17519, 0.0, -4.72623, "slate_vkpolice01")
	play_custom_action_do("CS_anth", "vk04a_scene02_ant_39")
	teleport_to_slate_pos("CS_tnya", -0.0550564, 0.0, 0.978651, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_39")
	teleport_to_slate_pos("CS_pistjnny", 0.331832, 0.0, 1.05298, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_39")
	teleport_to_slate_pos("CS_sgunant", -0.35485, 0.0, -5.21923, "slate_vkpolice01")
	play_custom_action_do("CS_sgunant", "vk04a_scene02_sgant_39")
end

function shot40()
	teleport_to_slate_pos("#PLAYER#", 3.36244, -7.63129, 9.23521, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_40")
	teleport_to_slate_pos("CS_dump", 3.5565, -8.00243, 8.07512, "slate_vkpolice01")
	play_custom_action_do("CS_dump", "vk04a_scene02_dump_40")
end

function shot41()
	teleport_to_slate_pos("CS_tnya", 0.692908, 0.0, 4.1501, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_41")
	teleport_to_slate_pos("CS_pistjnny", 1.08045, 0.0, 4.79315, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_41")
end

function shot42()
	teleport_to_slate_pos("#PLAYER#", 3.82014, -7.63129, 11.6109, "slate_vkpolice01")
	play_custom_action_do("#PLAYER#", "vk04a_scene02_pc_42")
	teleport_to_slate_pos("CS_dump", 3.5565, -8.00243, 8.07512, "slate_vkpolice01")
	play_custom_action_do("CS_dump", "vk04a_scene02_dump_42")
end

function shot43()
	teleport_to_slate_pos("CS_tnya", 0.565055, 0.0, 4.10205, "slate_vkpolice01")
	play_custom_action_do("CS_tnya", "vk04a_scene02_tnya_43")
	teleport_to_slate_pos("CS_pistjnny", 0.704043, 0.0, 3.88158, "slate_vkpolice01")
	play_custom_action_do("CS_pistjnny", "vk04a_scene02_pjnny_43")
	delay(2.0)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_jnny")
	stop_custom_actions("CS_anth")
	stop_custom_actions("CS_tnya")
	stop_custom_actions("CS_pistjnny")
	stop_custom_actions("CS_sgunjnny")
	stop_custom_actions("CS_sgunant")
	stop_custom_actions("CS_snta")
	stop_custom_actions("CS_sntb")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_dump")
	stop_custom_actions("CS_car")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
