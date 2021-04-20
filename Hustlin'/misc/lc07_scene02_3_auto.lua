-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc07_scene02\lc07_scene02.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02_church__interiors.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_dex", 0.420254, -0.32249, -2.23256, "slate_church_main")
	play_custom_action_do("CS_dex", "lc07_scene02_dex_1")
	teleport_to_slate_pos("CS_dedvic", 1.20141, -0.323267, -3.47369, "slate_church_main")
	play_custom_action_do("CS_dedvic", "lc07_scene02_corpse_1")
	teleport_to_slate_pos("CS_troy", -0.643357, -0.352644, -2.93177, "slate_church_main")
	play_custom_action_do("CS_troy", "lc07_scene02_troy_1")
end

function shot2()
	teleport_to_slate_pos("CS_pistol", -54.2429, 0.0, -0.574148, "slate_angelo_bedroom")
	play_custom_action_do("CS_pistol", "lc07_scene02_pistol_2")
	teleport_to_slate_pos("CS_luz", -52.9181, -0.966506, -0.408224, "slate_angelo_bedroom")
	play_custom_action_do("CS_luz", "lc07_scene02_luz_2")
	teleport_to_slate_pos("CS_angelo", -54.2519, -1.01436, -0.262738, "slate_angelo_bedroom")
	play_custom_action_do("CS_angelo", "lc07_scene02_angelo_2")
end

function shot3()
	teleport_to_slate_pos("CS_pistol", -55.1264, 0.0, -0.0820229, "slate_angelo_bedroom")
	play_custom_action_do("CS_pistol", "lc07_scene02_pistol_3")
	teleport_to_slate_pos("CS_luz", -52.9174, -0.966506, -0.175499, "slate_angelo_bedroom")
	play_custom_action_do("CS_luz", "lc07_scene02_luz_3")
	teleport_to_slate_pos("CS_angelo", -54.2449, -1.01436, -0.268661, "slate_angelo_bedroom")
	play_custom_action_do("CS_angelo", "lc07_scene02_angelo_3")
end

function shot4()
	teleport_to_slate_pos("CS_pistol", -55.1264, 0.0, -0.0820229, "slate_angelo_bedroom")
	play_custom_action_do("CS_pistol", "lc07_scene02_pistol_4")
	teleport_to_slate_pos("CS_luz", -52.9208, -0.966506, -0.254412, "slate_angelo_bedroom")
	play_custom_action_do("CS_luz", "lc07_scene02_luz_4")
	teleport_to_slate_pos("CS_angelo", -54.2195, -1.01436, -0.03961, "slate_angelo_bedroom")
	play_custom_action_do("CS_angelo", "lc07_scene02_angelo_4")
end

function shot5()
	teleport_to_slate_pos("CS_pistol", -55.1264, 0.0, -0.0820229, "slate_angelo_bedroom")
	play_custom_action_do("CS_pistol", "lc07_scene02_pistol_5")
	teleport_to_slate_pos("CS_luz", -53.6017, -0.966506, 0.984008, "slate_angelo_bedroom")
	play_custom_action_do("CS_luz", "lc07_scene02_luz_5")
	teleport_to_slate_pos("CS_angelo", -54.1813, -1.01436, 0.244438, "slate_angelo_bedroom")
	play_custom_action_do("CS_angelo", "lc07_scene02_angelo_5")
end

function shot6()
	teleport_to_slate_pos("CS_pistol", -55.1264, 0.0, -0.0820229, "slate_angelo_bedroom")
	play_custom_action_do("CS_pistol", "lc07_scene02_pistol_6")
	teleport_to_slate_pos("CS_luz", -53.4544, -0.966506, 1.02695, "slate_angelo_bedroom")
	play_custom_action_do("CS_luz", "lc07_scene02_luz_6")
	teleport_to_slate_pos("CS_angelo", -53.9789, -1.01436, 0.564736, "slate_angelo_bedroom")
	play_custom_action_do("CS_angelo", "lc07_scene02_angelo_6")
end

function shot7()
	teleport_to_slate_pos("CS_pistol", -55.1264, 0.0, -0.0820229, "slate_angelo_bedroom")
	play_custom_action_do("CS_pistol", "lc07_scene02_pistol_7")
	teleport_to_slate_pos("CS_luz", -53.4533, -0.966506, 1.02631, "slate_angelo_bedroom")
	play_custom_action_do("CS_luz", "lc07_scene02_luz_7")
	teleport_to_slate_pos("CS_angelo", -53.988, -1.01436, 0.687743, "slate_angelo_bedroom")
	play_custom_action_do("CS_angelo", "lc07_scene02_angelo_7")
	delay(4)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_pistol")
	stop_custom_actions("CS_dedvic")
	stop_custom_actions("CS_luz")
	stop_custom_actions("CS_angelo")
	stop_custom_actions("CS_troy")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end