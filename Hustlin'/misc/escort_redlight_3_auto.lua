-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\escort_redlight\escort_redlight.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk06__RLDinteriors.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_bruno", -1.35674, -0.0647402, -0.29143, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_1")
end

function shot2()
	teleport_to_slate_pos("CS_bruno", -1.3687, -0.0647402, -0.293117, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_2")
end

function shot3()
	teleport_to_slate_pos("CS_bruno", -1.37129, -0.0647402, -0.290513, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_3")
end

function shot4()
	teleport_to_slate_pos("CS_bruno", -1.35879, -0.0647402, -0.305271, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_4")
end

function shot5()
	teleport_to_slate_pos("CS_bruno", -1.51771, -0.0647402, -0.620886, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_5")
end

function shot6()
	teleport_to_slate_pos("CS_bruno", -1.14845, -0.0647402, -0.405904, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_6")
end

function shot7()
	teleport_to_slate_pos("CS_bruno", -0.708639, -0.0647402, -0.621159, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_7")
end

function shot8()
	teleport_to_slate_pos("CS_bruno", -0.255854, -0.0647402, -1.34285, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_8")
end

function shot9()
	teleport_to_slate_pos("CS_bruno", -0.355557, -0.0647402, -1.41077, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_9")
end

function shot10()
	teleport_to_slate_pos("CS_bruno", -0.411107, -0.0647402, -1.41255, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_10")
end

function shot11()
	teleport_to_slate_pos("CS_bruno", -0.593068, -0.0647402, -1.70686, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_11")
end

function shot12()
	teleport_to_slate_pos("CS_bruno", -1.15978, -0.0647402, -2.49039, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_12")
end

function shot13()
	teleport_to_slate_pos("CS_bruno", -1.18063, -0.0647402, -1.97929, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_13")
end

function shot14()
	teleport_to_slate_pos("CS_bruno", -0.999238, -0.0647402, -1.58467, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_14")
end

function shot15()
	teleport_to_slate_pos("CS_bruno", -0.754311, -0.0647402, -1.34613, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_15")
end

function shot16()
	teleport_to_slate_pos("CS_bruno", -0.72527, -0.0647402, -1.79933, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_16")
end

function shot17()
	teleport_to_slate_pos("CS_bruno", -0.650639, -0.0647402, -1.9526, "slate_escort_redlight")
	play_custom_action_do("CS_bruno", "escort_redlight_b01_17")
end

function shot18()
end

function shot19()
end

function shot20()
	fade_out(0.0)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_bruno")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
