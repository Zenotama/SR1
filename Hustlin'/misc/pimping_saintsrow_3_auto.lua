-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\pimping_saintsrow\pimping_saintsrow.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk05__buildings.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", 1.27982, 0.0186336, 1.16892, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_1")
	teleport_to_slate_pos("CS_will", -1.05698, 0.0165781, -2.1652, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_1")
	teleport_to_slate_pos("CS_joint", -1.05698, 0.0165781, -2.1652, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_1")
	teleport_to_slate_pos("CS_fugly", 1.2465, 0.0485671, -1.44434, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 0.309795, 0.00523962, -0.268645, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_2")
	teleport_to_slate_pos("CS_will", -0.395305, 0.0245098, -1.48883, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_2")
	teleport_to_slate_pos("CS_joint", -0.472579, 0.0156761, -1.42104, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_2")
	teleport_to_slate_pos("CS_fugly", 1.36114, 0.0500249, -1.30351, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 0.303734, 0.00028607, -0.248818, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_3")
	teleport_to_slate_pos("CS_will", -0.434472, 0.0178322, -1.28545, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_3")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_3")
	teleport_to_slate_pos("CS_fugly", 1.31431, 0.0517279, -1.46274, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", 0.326862, 0.00268188, -0.282323, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_4")
	teleport_to_slate_pos("CS_will", -0.43785, 0.0186765, -1.30788, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_4")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_4")
	teleport_to_slate_pos("CS_fugly", 1.29028, 0.044322, -1.48635, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", 0.321408, 0.00483194, -0.266753, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_5")
	teleport_to_slate_pos("CS_will", -0.339916, 0.0166965, -1.40524, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_5")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_5")
	teleport_to_slate_pos("CS_fugly", 1.4304, 0.05104, -1.52312, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", 0.316945, 0.00476174, -0.261988, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_6")
	teleport_to_slate_pos("CS_will", -0.442298, 0.0180132, -1.34147, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_6")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_6")
	teleport_to_slate_pos("CS_fugly", 1.51624, 0.0648529, -0.976567, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", 0.306857, 0.00435217, -0.254677, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_7")
	teleport_to_slate_pos("CS_will", -0.371929, 0.0173956, -1.40913, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_7")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_7")
	teleport_to_slate_pos("CS_fugly", 1.07599, 0.0485084, 1.47441, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_7")
end

function shot8()
	teleport_to_slate_pos("#PLAYER#", 0.296806, 0.00513774, -0.246947, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_8")
	teleport_to_slate_pos("CS_will", -0.399961, 0.0187075, -1.36997, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_8")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_8")
	teleport_to_slate_pos("CS_fugly", 1.07206, 0.0513407, 1.44624, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_8")
end

function shot9()
	teleport_to_slate_pos("#PLAYER#", 0.304554, 0.00435495, -0.233449, "slate_pimping_saintsrow")
	play_custom_action_do("#PLAYER#", "pimping_saintsrow_player_9")
	teleport_to_slate_pos("CS_will", -0.317012, 0.0198663, -1.463, "slate_pimping_saintsrow")
	play_custom_action_do("CS_will", "pimping_saintsrow_will_9")
	teleport_to_slate_pos("CS_joint", -0.40646, 0.015574, -1.33685, "slate_pimping_saintsrow")
	play_custom_action_do("CS_joint", "pimping_saintsrow_joint_9")
	teleport_to_slate_pos("CS_fugly", 1.0936, 0.0498184, 1.47094, "slate_pimping_saintsrow")
	play_custom_action_do("CS_fugly", "pimping_saintsrow_fatgirl_9")
	delay(0.0666667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_will")
	stop_custom_actions("CS_joint")
	stop_custom_actions("CS_fugly")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end