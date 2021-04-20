-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk02_stalker\vk02_stalker.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__ground.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
end

function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", -10.293, 0.0, -7.302, "slate_samsons_street")
	play_custom_action_do("#PLAYER#", "vk02_stalker_pc_1")
	teleport_to_slate_pos("CS_aish", -10.218, 0.0, -6.491, "slate_samsons_street")
	play_custom_action_do("CS_aish", "vk02_stalker_aish_1")
	teleport_to_slate_pos("CS_stlk", -0.22471, 0.0, 13.1351, "slate_samsons_street")
	play_custom_action_do("CS_stlk", "vk02_stalker_stlk_1")
	teleport_to_slate_pos("CS_caraish", -10.1422, -0.32086, -6.89414, "slate_samsons_street")
	play_custom_action_do("CS_caraish", "vk02_stalker_caraish_1")
	teleport_to_slate_pos("CS_van", -0.7647, -0.266184, 13.7052, "slate_samsons_street")
	play_custom_action_do("CS_van", "vk02_stalker_van_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 0.917125, 0.0, -4.01634, "slate_samsons_street")
	play_custom_action_do("#PLAYER#", "vk02_stalker_pc_2")
	teleport_to_slate_pos("CS_aish", 0.103891, 0.0, -3.96976, "slate_samsons_street")
	play_custom_action_do("CS_aish", "vk02_stalker_aish_2")
	teleport_to_slate_pos("CS_stlk", -0.22471, 0.0, 13.1351, "slate_samsons_street")
	play_custom_action_do("CS_stlk", "vk02_stalker_stlk_2")
	teleport_to_slate_pos("CS_caraish", 0.50425, -0.272385, -3.87988, "slate_samsons_street")
	play_custom_action_do("CS_caraish", "vk02_stalker_caraish_2")
	teleport_to_slate_pos("CS_van", -0.7647, -0.266184, 13.7052, "slate_samsons_street")
	play_custom_action_do("CS_van", "vk02_stalker_van_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 0.917125, 0.0, -4.01634, "slate_samsons_street")
	play_custom_action_do("#PLAYER#", "vk02_stalker_pc_3")
	teleport_to_slate_pos("CS_aish", 0.103782, 0.0, -3.96983, "slate_samsons_street")
	play_custom_action_do("CS_aish", "vk02_stalker_aish_3")
	teleport_to_slate_pos("CS_stlk", -0.22471, 0.0, 13.1351, "slate_samsons_street")
	play_custom_action_do("CS_stlk", "vk02_stalker_stlk_3")
	teleport_to_slate_pos("CS_caraish", 0.50425, -0.272385, -3.87988, "slate_samsons_street")
	play_custom_action_do("CS_caraish", "vk02_stalker_caraish_3")
	teleport_to_slate_pos("CS_van", -0.7647, -0.266184, 13.7052, "slate_samsons_street")
	play_custom_action_do("CS_van", "vk02_stalker_van_3")
	delay(3)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_aish")
	stop_custom_actions("CS_stlk")
	stop_custom_actions("CS_caraish")
	stop_custom_actions("CS_van")
	letterbox_fade_out(true)
	fade_out(0.5)
end