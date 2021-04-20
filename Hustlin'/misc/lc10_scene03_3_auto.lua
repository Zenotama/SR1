-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc10_scene03\lc10_scene03.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk25__airground.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_luz", 0.0651616, 0.0, -4.69514, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_1")
	teleport_to_slate_pos("#PLAYER#", -20.1416, 0.0, -14.5443, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_1")
	teleport_to_slate_pos("CS_dex", -20.5537, 0.0, -13.8139, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_1")
	teleport_to_slate_pos("CS_dcar", -19.7677, -0.303201, -13.8535, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_1")
	teleport_to_slate_pos("CS_lcar", -139.642, -0.304871, -3.20168, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_1")
	teleport_to_slate_pos("CS_bag", 3.1957, 0.0, -3.28705, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_1")
end

function shot2()
	teleport_to_slate_pos("CS_luz", -142.83, 0.0, -2.77365, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_2")
	teleport_to_slate_pos("#PLAYER#", 4.43437, 0.0, -4.8135, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_2")
	teleport_to_slate_pos("CS_dex", 3.63506, 0.0, -4.74815, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_2")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_2")
	teleport_to_slate_pos("CS_lcar", -142.981, -0.304712, -3.15572, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_2")
	teleport_to_slate_pos("CS_bag", -140.071, 0.0, -3.08339, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_2")
end

function shot3()
	teleport_to_slate_pos("CS_luz", -3.60768, 0.0, -4.68808, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_3")
	teleport_to_slate_pos("#PLAYER#", 4.49701, 0.0, -4.81327, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_3")
	teleport_to_slate_pos("CS_dex", 3.62764, 0.0, -4.75259, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_3")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_3")
	teleport_to_slate_pos("CS_lcar", -3.73901, -0.311346, -5.07241, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_3")
	teleport_to_slate_pos("CS_bag", -2.9063, 0.0, -4.58535, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_3")
end

function shot4()
	teleport_to_slate_pos("CS_luz", -0.0315762, 0.0, -3.31042, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_4")
	teleport_to_slate_pos("#PLAYER#", 4.84849, 0.0, -4.86089, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_4")
	teleport_to_slate_pos("CS_dex", 3.62924, 0.0, -4.76235, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_4")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_4")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_4")
	teleport_to_slate_pos("CS_bag", 0.277639, 0.0, -3.20808, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_4")
end

function shot5()
	teleport_to_slate_pos("CS_luz", 0.587235, 0.0, -2.75236, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_5")
	teleport_to_slate_pos("#PLAYER#", 4.84751, 0.0, -4.85004, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_5")
	teleport_to_slate_pos("CS_dex", 2.3946, 0.0, -3.73232, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_5")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_5")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_5")
	teleport_to_slate_pos("CS_bag", 0.778447, 0.0, -3.0032, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_5")
end

function shot6()
	teleport_to_slate_pos("CS_luz", 1.65147, 0.0, -3.20835, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_6")
	teleport_to_slate_pos("#PLAYER#", 4.85052, 0.0, -4.85054, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_6")
	teleport_to_slate_pos("CS_dex", 2.26149, 0.0, -3.55798, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_6")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_6")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_6")
	teleport_to_slate_pos("CS_bag", 1.87577, 0.0, -3.35441, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_6")
end

function shot7()
	teleport_to_slate_pos("CS_luz", 1.72289, 0.0, -3.34069, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_7")
	teleport_to_slate_pos("#PLAYER#", 4.75018, 0.0, -4.86678, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_7")
	teleport_to_slate_pos("CS_dex", 2.34567, 0.0, -3.63658, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_7")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_7")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_7")
	teleport_to_slate_pos("CS_bag", 1.94913, 0.0, -3.43659, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_7")
end

function shot8()
	teleport_to_slate_pos("CS_luz", 1.69396, 0.0, -3.21819, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_8")
	teleport_to_slate_pos("#PLAYER#", 4.82621, 0.0, -4.87773, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_8")
	teleport_to_slate_pos("CS_dex", 2.40064, 0.0, -3.60239, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_8")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_8")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_8")
	teleport_to_slate_pos("CS_bag", 1.90997, 0.0, -3.32878, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_8")
end

function shot9()
	teleport_to_slate_pos("CS_luz", 1.65002, 0.0, -3.20297, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_9")
	teleport_to_slate_pos("#PLAYER#", 4.84741, 0.0, -4.86183, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_9")
	teleport_to_slate_pos("CS_dex", 2.40301, 0.0, -3.56283, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_9")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_9")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_9")
	teleport_to_slate_pos("CS_bag", 1.89074, 0.0, -3.2682, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_9")
end

function shot10()
	teleport_to_slate_pos("CS_luz", 1.58166, 0.0, -3.30192, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_10")
	teleport_to_slate_pos("#PLAYER#", 4.84199, 0.0, -4.84236, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_10")
	teleport_to_slate_pos("CS_dex", 2.26652, 0.0, -3.73082, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_10")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_10")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_10")
	teleport_to_slate_pos("CS_bag", 1.81292, 0.0, -3.37733, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_10")
end

function shot11()
	teleport_to_slate_pos("CS_luz", 1.60066, 0.0, -3.28221, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_11")
	teleport_to_slate_pos("#PLAYER#", 4.84768, 0.0, -4.84854, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_11")
	teleport_to_slate_pos("CS_dex", 2.41528, 0.0, -4.49404, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_11")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_11")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_11")
	teleport_to_slate_pos("CS_bag", 1.82669, 0.0, -3.36962, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_11")
end

function shot12()
	teleport_to_slate_pos("CS_luz", 1.70323, 0.0, -3.31302, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_12")
	teleport_to_slate_pos("#PLAYER#", 4.52446, 0.0, -4.85011, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_12")
	teleport_to_slate_pos("CS_dex", 3.68818, 0.0, -4.7745, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_12")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_12")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_12")
	teleport_to_slate_pos("CS_bag", 1.70011, 0.0, -3.80398, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_12")
end

function shot13()
	teleport_to_slate_pos("CS_luz", 1.69085, 0.0, -3.38549, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_13")
	teleport_to_slate_pos("#PLAYER#", 4.48162, 0.0, -4.77242, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_13")
	teleport_to_slate_pos("CS_dex", 3.66413, 0.0, -4.79232, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_13")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_13")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_13")
	teleport_to_slate_pos("CS_bag", 1.72278, 0.0, -3.86693, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_13")
end

function shot14()
	teleport_to_slate_pos("CS_luz", 1.66797, 0.0, -3.40789, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_14")
	teleport_to_slate_pos("#PLAYER#", 4.4814, 0.0, -4.76193, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_14")
	teleport_to_slate_pos("CS_dex", 3.70845, 0.0, -4.81663, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_14")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_14")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_14")
	teleport_to_slate_pos("CS_bag", 1.59309, 0.0, -3.78286, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_14")
end

function shot15()
	teleport_to_slate_pos("CS_luz", 1.64306, 0.0, -3.40343, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_15")
	teleport_to_slate_pos("#PLAYER#", 4.48125, 0.0, -4.75745, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_15")
	teleport_to_slate_pos("CS_dex", 3.7074, 0.0, -4.81573, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_15")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_15")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_15")
	teleport_to_slate_pos("CS_bag", 1.59682, 0.0, -3.69358, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_15")
end

function shot16()
	teleport_to_slate_pos("CS_luz", 1.68358, 0.0, -3.41764, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_16")
	teleport_to_slate_pos("#PLAYER#", 4.48119, 0.0, -4.75734, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_16")
	teleport_to_slate_pos("CS_dex", 3.70903, 0.0, -4.81544, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_16")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_16")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_16")
	teleport_to_slate_pos("CS_bag", 1.64127, 0.0, -3.74504, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_16")
end

function shot17()
	teleport_to_slate_pos("CS_luz", 1.65742, 0.0, -3.32577, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_17")
	teleport_to_slate_pos("#PLAYER#", 4.4777, 0.0, -4.79386, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_17")
	teleport_to_slate_pos("CS_dex", 3.70586, 0.0, -4.81906, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_17")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_17")
	teleport_to_slate_pos("CS_lcar", -9.30176e-005, -0.311524, -5.12387, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_17")
	teleport_to_slate_pos("CS_bag", 1.68526, 0.0, -3.68151, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_17")
end

function shot18()
	teleport_to_slate_pos("CS_luz", -1.51864, 0.0, 3.49718, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_18")
	teleport_to_slate_pos("#PLAYER#", 4.85913, 0.0, -4.81874, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_18")
	teleport_to_slate_pos("CS_dex", 3.70667, 0.0, -4.81875, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_18")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_18")
	teleport_to_slate_pos("CS_lcar", -1.15133, -0.311524, 3.32342, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_18")
	teleport_to_slate_pos("CS_bag", -1.24273, 0.0, 3.92845, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_18")
end

function shot19()
	teleport_to_slate_pos("CS_luz", 0.294642, 0.0, 14.9993, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_19")
	teleport_to_slate_pos("#PLAYER#", 4.49356, 0.0, -4.81234, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_19")
	teleport_to_slate_pos("CS_dex", 3.70724, 0.0, -4.81939, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_19")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_19")
	teleport_to_slate_pos("CS_lcar", 0.666161, -0.311524, 14.8352, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_19")
	teleport_to_slate_pos("CS_bag", 0.55996, 0.0, 15.4372, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_19")
end

function shot20()
	teleport_to_slate_pos("CS_luz", 0.294642, 0.0, 14.9993, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_20")
	teleport_to_slate_pos("#PLAYER#", 5.93984, 0.0, -5.05393, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_20")
	teleport_to_slate_pos("CS_dex", 3.70563, 0.0, -4.82142, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_20")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_20")
	teleport_to_slate_pos("CS_lcar", 0.666161, -0.311524, 14.8352, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_20")
	teleport_to_slate_pos("CS_bag", 0.55996, 0.0, 15.4372, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_20")
end

function shot21()
	teleport_to_slate_pos("CS_luz", 0.294642, 0.0, 14.9993, "slate_airport_runway")
	play_custom_action_do("CS_luz", "lc10_scene03_luz_21")
	teleport_to_slate_pos("#PLAYER#", 5.87579, 0.0, -5.14371, "slate_airport_runway")
	play_custom_action_do("#PLAYER#", "lc10_scene03_player_21")
	teleport_to_slate_pos("CS_dex", 3.70619, 0.0, -4.82006, "slate_airport_runway")
	play_custom_action_do("CS_dex", "lc10_scene03_dex_21")
	teleport_to_slate_pos("CS_dcar", 4.12654, -0.303201, -4.13546, "slate_airport_runway")
	play_custom_action_do("CS_dcar", "lc10_scene03_dcar_21")
	teleport_to_slate_pos("CS_lcar", 0.666161, -0.311524, 14.8352, "slate_airport_runway")
	play_custom_action_do("CS_lcar", "lc10_scene03_lcar_21")
	teleport_to_slate_pos("CS_bag", 0.55996, 0.0, 15.4372, "slate_airport_runway")
	play_custom_action_do("CS_bag", "lc10_scene03_bag_21")
	fade_out(0.0)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_luz")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_dcar")
	stop_custom_actions("CS_lcar")
	stop_custom_actions("CS_bag")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end