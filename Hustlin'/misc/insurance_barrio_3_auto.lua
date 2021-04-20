-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\insurance_barrio\insurance_barrio.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk16__interiors.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", 0.69054, 0.0, 0.214534, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_1")
	teleport_to_slate_pos("CS_raymond", -0.360369, 0.0, -2.23721, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_1")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_1")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 0.753157, 0.0, -0.376242, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_2")
	teleport_to_slate_pos("CS_raymond", 0.117658, 0.0, -1.67256, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_2")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_2")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", -0.854341, 0.0, -0.821517, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_3")
	teleport_to_slate_pos("CS_raymond", -0.970895, 0.0, -2.23787, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_3")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_3")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", -1.31129, 0.0, -0.261189, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_4")
	teleport_to_slate_pos("CS_raymond", -1.34938, 0.0, -2.52386, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_4")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_4")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", -1.31129, 0.0, -0.261189, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_5")
	teleport_to_slate_pos("CS_raymond", -1.54828, 0.0, -2.70941, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_5")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_5")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", -1.31129, 0.0, -0.261189, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_6")
	teleport_to_slate_pos("CS_raymond", -1.54828, 0.0, -2.70941, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_6")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_6")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", -1.31129, 0.0, -0.261189, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_7")
	teleport_to_slate_pos("CS_raymond", -1.54828, 0.0, -2.70941, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_7")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_7")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_7")
end

function shot8()
	teleport_to_slate_pos("#PLAYER#", -1.31129, 0.0, -0.261189, "slate_lawoffice_barrio")
	play_custom_action_do("#PLAYER#", "insurance_barrio_player_8")
	teleport_to_slate_pos("CS_raymond", -1.54828, 0.0, -2.70941, "slate_lawoffice_barrio")
	play_custom_action_do("CS_raymond", "insurance_barrio_doctor_8")
	teleport_to_slate_pos("CS_ChairA", -1.76749, 0.0, -2.72948, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairA", "insurance_barrio_ChairA_8")
	teleport_to_slate_pos("CS_ChairB", -1.70226, 0.0, 0.171895, "slate_lawoffice_barrio")
	play_custom_action_do("CS_ChairB", "insurance_barrio_ChairB_8")
	delay(0.266667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_raymond")
	stop_custom_actions("CS_ChairA")
	stop_custom_actions("CS_ChairB")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end