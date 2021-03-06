-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\chopshop_seaport\chopshop_seaport.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk19_CHS__interiors.cts
-------------------------------------


function cutscene_main()
	load_chunk("sr_chunk19", true )
	load_chunks("sr_chunk19_CHS", "sr_chunk19")
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
	thread_new_cutscene_shot("shot8", 8)
end

function shot1()
	select_slate("slate_chopshop_seaport")
	audio_play("CS Chop Shop Seaport", "voice", true)
	set_level_lights(false)
	fade_in(1)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", -3.44195, 0.0, 2.96099, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_1")
	teleport_to_slate_pos("CS_miguel", 1.30775, 0.0, 5.14697, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_1")
	teleport_to_slate_pos("CS_jenny", 3.06845, 0.0, 8.72207, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", -1.81514, 0.0, -0.250996, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_2")
	teleport_to_slate_pos("CS_miguel", 1.35761, 0.0, 1.1381, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_2")
	teleport_to_slate_pos("CS_jenny", 3.06845, 0.0, 8.72207, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", -1.81968, 0.0, -0.264202, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_3")
	teleport_to_slate_pos("CS_miguel", 1.18046, 0.0, 0.8264, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_3")
	teleport_to_slate_pos("CS_jenny", 3.06845, 0.0, 8.72207, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", -1.82191, 0.0, -0.246541, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_4")
	teleport_to_slate_pos("CS_miguel", 1.18182, 0.0, 0.827617, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_4")
	teleport_to_slate_pos("CS_jenny", 0.400545, 0.0, 4.26211, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", -1.82087, 0.0, -0.267179, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_5")
	teleport_to_slate_pos("CS_miguel", 1.1868, 0.0, 0.832069, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_5")
	teleport_to_slate_pos("CS_jenny", 1.05509, 0.0, 1.34592, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", -1.58343, 0.0, -0.212923, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_6")
	teleport_to_slate_pos("CS_miguel", 1.19306, 0.0, 0.837675, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_6")
	teleport_to_slate_pos("CS_jenny", 1.11522, 0.0, 1.2847, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", -1.63904, 0.0, -0.180181, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_7")
	teleport_to_slate_pos("CS_miguel", -2.17001, 0.0, -2.40586, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_7")
	teleport_to_slate_pos("CS_jenny", 1.49936, 0.0, 0.528517, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_7")
end

function shot8()
	teleport_to_slate_pos("#PLAYER#", -1.6001, 0.0, -0.190897, "slate_chopshop_seaport")
	play_custom_action_do("#PLAYER#", "chopshop_seaport_p_8")
	teleport_to_slate_pos("CS_miguel", -2.17001, 0.0, -2.40586, "slate_chopshop_seaport")
	play_custom_action_do("CS_miguel", "chopshop_seaport_m_8")
	teleport_to_slate_pos("CS_jenny", 1.50419, 0.0, 0.52375, "slate_chopshop_seaport")
	play_custom_action_do("CS_jenny", "chopshop_seaport_j_8")
	delay(3.93333)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_miguel")
	stop_custom_actions("CS_jenny")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
