-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\insurance_chinatown\insurance_chinatown.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk12_lo__interiors.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_seth", -5.39553, 0.0684315, -1.30286, "slate_ins_china")
	play_custom_action_do("CS_seth", "insurance_chinatown_seth_1")
	teleport_to_slate_pos("#PLAYER#", -3.35863, 0.0642285, -0.994753, "slate_ins_china")
	play_custom_action_do("#PLAYER#", "insurance_chinatown_player_1")
	teleport_to_slate_pos("CS_chair", -5.1524, 0.0, -0.678011, "slate_ins_china")
	play_custom_action_do("CS_chair", "insurance_chinatown_chair_1")
end

function shot2()
	teleport_to_slate_pos("CS_seth", -4.95368, 0.083025, -1.42752, "slate_ins_china")
	play_custom_action_do("CS_seth", "insurance_chinatown_seth_2")
	teleport_to_slate_pos("#PLAYER#", -3.34144, 0.0675886, -0.971554, "slate_ins_china")
	play_custom_action_do("#PLAYER#", "insurance_chinatown_player_2")
	teleport_to_slate_pos("CS_chair", -5.1524, 0.0, -0.678011, "slate_ins_china")
	play_custom_action_do("CS_chair", "insurance_chinatown_chair_2")
end

function shot3()
	teleport_to_slate_pos("CS_seth", -5.01616, 0.0954212, -0.751776, "slate_ins_china")
	play_custom_action_do("CS_seth", "insurance_chinatown_seth_3")
	teleport_to_slate_pos("#PLAYER#", -3.28336, 0.062823, -1.0107, "slate_ins_china")
	play_custom_action_do("#PLAYER#", "insurance_chinatown_player_3")
	teleport_to_slate_pos("CS_chair", -5.1524, 0.0, -0.678011, "slate_ins_china")
	play_custom_action_do("CS_chair", "insurance_chinatown_chair_3")
end

function shot4()
	teleport_to_slate_pos("CS_seth", -4.98653, 0.37094, -0.779232, "slate_ins_china")
	play_custom_action_do("CS_seth", "insurance_chinatown_seth_4")
	teleport_to_slate_pos("#PLAYER#", -3.08219, 0.0659645, -0.956452, "slate_ins_china")
	play_custom_action_do("#PLAYER#", "insurance_chinatown_player_4")
	teleport_to_slate_pos("CS_chair", -5.1524, 0.0, -0.678011, "slate_ins_china")
	play_custom_action_do("CS_chair", "insurance_chinatown_chair_4")
	delay(8.56667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_seth")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_chair")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end