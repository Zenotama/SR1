-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\hijacking_highend\hijacking_highend.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk30b__interiors.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
end

function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_sam", -0.834487, 0.0, -1.03808, "slate_hijacking")
	play_custom_action_do("CS_sam", "hijacking_highend_sam_1")
	teleport_to_slate_pos("#PLAYER#", 2.23813, 0.0, 0.757436, "slate_hijacking")
	play_custom_action_do("#PLAYER#", "hijacking_highend_player_1")
	teleport_to_slate_pos("CS_bottle", 3.51672, 0.0, 1.19048, "slate_hijacking")
	play_custom_action_do("CS_bottle", "hijacking_highend_bottle_1")
end

function shot2()
	teleport_to_slate_pos("CS_sam", -0.837637, 0.0, -1.04393, "slate_hijacking")
	play_custom_action_do("CS_sam", "hijacking_highend_sam_2")
	teleport_to_slate_pos("#PLAYER#", -0.539576, 0.0, -0.0681633, "slate_hijacking")
	play_custom_action_do("#PLAYER#", "hijacking_highend_player_2")
	teleport_to_slate_pos("CS_bottle", 3.51672, 0.0, 1.19048, "slate_hijacking")
	play_custom_action_do("CS_bottle", "hijacking_highend_bottle_2")
end

function shot3()
	teleport_to_slate_pos("CS_sam", -0.772992, 0.0, -1.01908, "slate_hijacking")
	play_custom_action_do("CS_sam", "hijacking_highend_sam_3")
	teleport_to_slate_pos("#PLAYER#", -0.936551, 0.0, 0.092968, "slate_hijacking")
	play_custom_action_do("#PLAYER#", "hijacking_highend_player_3")
	teleport_to_slate_pos("CS_bottle", 3.51672, 0.0, 1.19048, "slate_hijacking")
	play_custom_action_do("CS_bottle", "hijacking_highend_bottle_3")
end

function shot4()
	teleport_to_slate_pos("CS_sam", -0.96946, 0.0, -1.00494, "slate_hijacking")
	play_custom_action_do("CS_sam", "hijacking_highend_sam_4")
	teleport_to_slate_pos("#PLAYER#", -0.921097, 0.0, 0.0452438, "slate_hijacking")
	play_custom_action_do("#PLAYER#", "hijacking_highend_player_4")
	teleport_to_slate_pos("CS_bottle", 3.51672, 0.0, 1.19048, "slate_hijacking")
	play_custom_action_do("CS_bottle", "hijacking_highend_bottle_4")
end

function shot5()
	teleport_to_slate_pos("CS_sam", -0.908022, 0.0, -1.0228, "slate_hijacking")
	play_custom_action_do("CS_sam", "hijacking_highend_sam_5")
	teleport_to_slate_pos("#PLAYER#", -1.05403, 0.0, 0.0938609, "slate_hijacking")
	play_custom_action_do("#PLAYER#", "hijacking_highend_player_5")
	teleport_to_slate_pos("CS_bottle", 3.51672, 0.0, 1.19048, "slate_hijacking")
	play_custom_action_do("CS_bottle", "hijacking_highend_bottle_5")
	delay(4.66667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
end

function cutscene_end()
	stop_custom_actions("CS_sam")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_bottle")
	letterbox_fade_out(true)
	fade_out(0.5)
end
