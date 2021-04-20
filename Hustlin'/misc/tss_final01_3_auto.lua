-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss_final01\tss_final01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_finalcutscene_1__church.cts
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
end

function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", 0.300648, 0.0, -0.944405, "slate_fin1_church")
	play_custom_action_do("#PLAYER#", "tss_final01_pc_1")
end

function shot2()
	teleport_to_slate_pos("CS_jul", 453.762, -4.03014, -232.302, "slate_fin1_street")
	play_custom_action_do("CS_jul", "tss_final01_jul_2")
	teleport_to_slate_pos("CS_car", 453.718, -4.03739, -231.756, "slate_fin1_street")
	play_custom_action_do("CS_car", "tss_final01_car_2")
end

function shot3()
	teleport_to_slate_pos("CS_aish", 352.467, 0.0, -0.869363, "slate_fin1_greenscondo")
	play_custom_action_do("CS_aish", "tss_final01_aish_3")
	teleport_to_slate_pos("CS_jnny", 354.223, 0.0, -0.716436, "slate_fin1_greenscondo")
	play_custom_action_do("CS_jnny", "tss_final01_jnny_3")
end

function shot4()
	teleport_to_slate_pos("CS_aish", 352.868, 0.0, -0.687827, "slate_fin1_greenscondo")
	play_custom_action_do("CS_aish", "tss_final01_aish_4")
	teleport_to_slate_pos("CS_jnny", 354.226, 0.0, -0.720811, "slate_fin1_greenscondo")
	play_custom_action_do("CS_jnny", "tss_final01_jnny_4")
end

function shot5()
	teleport_to_slate_pos("CS_don", 443.909, 0.0, -1.3195, "slate_fin1_chopshop")
	play_custom_action_do("CS_don", "tss_final01_don_5")
end

function shot6()
	teleport_to_slate_pos("CS_don", 443.909, 0.0, -1.31936, "slate_fin1_chopshop")
	play_custom_action_do("CS_don", "tss_final01_don_6")
end

function shot7()
	teleport_to_slate_pos("CS_king", 655.311, 0.0, -10.0965, "slate_fin1_airport")
	play_custom_action_do("CS_king", "tss_final01_king_7")
end

function shot8()
	teleport_to_slate_pos("CS_king", 655.229, 0.0, -10.1033, "slate_fin1_airport")
	play_custom_action_do("CS_king", "tss_final01_king_8")
end

function shot9()
	teleport_to_slate_pos("CS_luz", 883.801, 0.0, -1.04124, "slate_fin1_luzbar")
	play_custom_action_do("CS_luz", "tss_final01_luz_9")
	teleport_to_slate_pos("CS_man", 882.894, 0.0, -1.21544, "slate_fin1_luzbar")
	play_custom_action_do("CS_man", "tss_final01_man_9")
end

function shot10()
	teleport_to_slate_pos("CS_luz", 883.801, 0.0, -1.04076, "slate_fin1_luzbar")
	play_custom_action_do("CS_luz", "tss_final01_luz_10")
	teleport_to_slate_pos("CS_man", 883.182, 0.0, -0.940193, "slate_fin1_luzbar")
	play_custom_action_do("CS_man", "tss_final01_man_10")
end

function shot11()
	teleport_to_slate_pos("CS_dex", 1000.43, -0.61257, 17.1664, "slate_fin1_strip")
	play_custom_action_do("CS_dex", "tss_final01_dex_11")
end

function shot12()
	teleport_to_slate_pos("CS_dex", 1000.44, -0.61257, 17.1607, "slate_fin1_strip")
	play_custom_action_do("CS_dex", "tss_final01_dex_12")
end

function shot13()
	teleport_to_slate_pos("CS_troy", 1201.69, 0.0, -0.41598, "slate_fin1_troybar")
	play_custom_action_do("CS_troy", "tss_final01_troy_13")
end

function shot14()
	teleport_to_slate_pos("#PLAYER#", 0.311915, 0.0, -0.90286, "slate_fin1_church")
	play_custom_action_do("#PLAYER#", "tss_final01_pc_14")
end

function shot15()
	teleport_to_slate_pos("CS_jul", 364.216, -4.03014, -219.07, "slate_fin1_street")
	play_custom_action_do("CS_jul", "tss_final01_jul_15")
	teleport_to_slate_pos("CS_car", 364.101, -4.03739, -218.532, "slate_fin1_street")
	play_custom_action_do("CS_car", "tss_final01_car_15")
end

function shot16()
	teleport_to_slate_pos("#PLAYER#", 0.301438, 0.0, -0.968087, "slate_fin1_church")
	play_custom_action_do("#PLAYER#", "tss_final01_pc_16")
	teleport_to_slate_pos("CS_snt1", -1.0971, 0.0, -0.364279, "slate_fin1_church")
	play_custom_action_do("CS_snt1", "tss_final01_snt1_16")
	teleport_to_slate_pos("CS_snt2", -0.235066, 0.0, 0.972918, "slate_fin1_church")
	play_custom_action_do("CS_snt2", "tss_final01_snt2_16")
	teleport_to_slate_pos("CS_snt3", -1.11926, 0.0, 0.553985, "slate_fin1_church")
	play_custom_action_do("CS_snt3", "tss_final01_snt3_16")
	teleport_to_slate_pos("CS_snt4", -0.255971, 0.0, 0.176211, "slate_fin1_church")
	play_custom_action_do("CS_snt4", "tss_final01_snt4_16")
	teleport_to_slate_pos("CS_snt5", -0.702033, 0.0, -1.03504, "slate_fin1_church")
	play_custom_action_do("CS_snt5", "tss_final01_snt5_16")
	teleport_to_slate_pos("CS_snt6", -1.31838, 0.0, -0.793265, "slate_fin1_church")
	play_custom_action_do("CS_snt6", "tss_final01_snt6_16")
	teleport_to_slate_pos("CS_snt7", -1.60011, 0.0, 0.323948, "slate_fin1_church")
	play_custom_action_do("CS_snt7", "tss_final01_snt7_16")
end

function shot17()
	teleport_to_slate_pos("#PLAYER#", 0.301621, 0.0, -0.965286, "slate_fin1_church")
	play_custom_action_do("#PLAYER#", "tss_final01_pc_17")
	delay(3)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
end

function cutscene_end()
	stop_custom_actions("CS_aish")
	stop_custom_actions("CS_jnny")
	stop_custom_actions("CS_king")
	stop_custom_actions("CS_luz")
	stop_custom_actions("CS_don")
	stop_custom_actions("CS_troy")
	stop_custom_actions("CS_man")
	stop_custom_actions("CS_dex")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_jul")
	stop_custom_actions("CS_car")
	stop_custom_actions("CS_snt1")
	stop_custom_actions("CS_snt2")
	stop_custom_actions("CS_snt3")
	stop_custom_actions("CS_snt4")
	stop_custom_actions("CS_snt5")
	stop_custom_actions("CS_snt6")
	stop_custom_actions("CS_snt7")
	letterbox_fade_out(true)
	fade_out(0.5)
end
