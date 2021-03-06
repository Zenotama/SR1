-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\chopshop_chinatown\chopshop_chinatown.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk12_chop__interiors.cts
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
	teleport_to_slate_pos("#PLAYER#", 0.342186, -0.076024, -5.58803, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_1")
	teleport_to_slate_pos("CS_dennis", -3.55275, -0.00126454, -3.35646, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 0.380375, -0.0731784, -6.21233, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_2")
	teleport_to_slate_pos("CS_dennis", -3.47719, -0.000219689, -4.03043, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 0.342361, -0.0758523, -5.59009, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_3")
	teleport_to_slate_pos("CS_dennis", -2.3593, 0.00678137, -4.98294, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", 0.343342, -0.0760146, -5.58823, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_4")
	teleport_to_slate_pos("CS_dennis", -2.46125, 0.000105294, -3.80045, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", 0.343553, -0.0758984, -5.58768, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_5")
	teleport_to_slate_pos("CS_dennis", -2.47794, -3.32694e-005, -3.81243, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", 0.394869, -0.0571704, -5.26144, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_6")
	teleport_to_slate_pos("CS_dennis", -2.10071, 0.0086959, -4.03436, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", -0.912295, -0.0667286, -4.45769, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_7")
	teleport_to_slate_pos("CS_dennis", -1.54516, 0.00846599, -4.09255, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_7")
end

function shot8()
	teleport_to_slate_pos("#PLAYER#", -0.909706, -0.066794, -4.45683, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_8")
	teleport_to_slate_pos("CS_dennis", -1.55837, 0.00861648, -4.07924, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_8")
end

function shot9()
	teleport_to_slate_pos("#PLAYER#", -0.907991, -0.0671175, -4.4597, "slate_chpshp_ct_01")
	play_custom_action_do("#PLAYER#", "chopshop_chinatown_player_9")
	teleport_to_slate_pos("CS_dennis", -1.55416, 0.00866605, -4.0818, "slate_chpshp_ct_01")
	play_custom_action_do("CS_dennis", "chopshop_chinatown_dennis_9")
	delay(3.9)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_dennis")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
