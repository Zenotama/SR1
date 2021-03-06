-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc04_scene01\lc04_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02_mec__interiors.cts
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
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_dex", 4.28432, 0.00551572, 5.24275, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_1")
	teleport_to_slate_pos("CS_troy", 2.07669, 0.00294156, 0.16342, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_1")
	teleport_to_slate_pos("#PLAYER#", -7.81235, -0.0117915, 0.60442, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_1")
end

function shot2()
	teleport_to_slate_pos("CS_dex", 4.63792, 0.00413027, 2.90837, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_2")
	teleport_to_slate_pos("CS_troy", 1.03795, 0.00338189, 0.397815, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_2")
	teleport_to_slate_pos("#PLAYER#", -1.94721, -0.00902999, 0.0441997, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_2")
end

function shot3()
	teleport_to_slate_pos("CS_dex", 4.001, 0.00585328, 2.14856, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_3")
	teleport_to_slate_pos("CS_troy", 1.02548, 0.00973834, 0.422043, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_3")
	teleport_to_slate_pos("#PLAYER#", -1.85923, 0.00348061, -0.0878972, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_3")
end

function shot4()
	teleport_to_slate_pos("CS_dex", 2.90796, 0.00549473, 2.38413, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_4")
	teleport_to_slate_pos("CS_troy", 1.1672, 0.00298922, 0.325421, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_4")
	teleport_to_slate_pos("#PLAYER#", -1.84757, 0.00479801, -0.0520659, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_4")
end

function shot5()
	teleport_to_slate_pos("CS_dex", 2.90211, 0.00547184, 2.38685, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_5")
	teleport_to_slate_pos("CS_troy", 1.13194, 0.00308122, 0.391442, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_5")
	teleport_to_slate_pos("#PLAYER#", -1.83125, 0.00445803, -0.0826499, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_5")
end

function shot6()
	teleport_to_slate_pos("CS_dex", 2.20978, 0.00446115, -1.24144, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_6")
	teleport_to_slate_pos("CS_troy", 1.16653, 0.0132479, 0.406284, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_6")
	teleport_to_slate_pos("#PLAYER#", -1.86605, 0.00503709, -0.0826864, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_6")
end

function shot7()
	teleport_to_slate_pos("CS_dex", 2.20691, 0.00433484, -1.24259, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_7")
	teleport_to_slate_pos("CS_troy", 1.23593, 0.00292436, 0.440105, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_7")
	teleport_to_slate_pos("#PLAYER#", -1.85574, 0.00614358, -0.0499678, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_7")
end

function shot8()
	teleport_to_slate_pos("CS_dex", 2.21154, 0.00445626, -1.24223, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_8")
	teleport_to_slate_pos("CS_troy", 1.24745, 0.0028725, 0.426907, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_8")
	teleport_to_slate_pos("#PLAYER#", -1.86256, 0.00513101, -0.073179, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_8")
end

function shot9()
	teleport_to_slate_pos("CS_dex", 2.21157, 0.00456946, -1.24382, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_9")
	teleport_to_slate_pos("CS_troy", 1.2839, 0.00285216, 0.436819, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_9")
	teleport_to_slate_pos("#PLAYER#", -1.87715, 0.00440576, -0.094828, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_9")
end

function shot10()
	teleport_to_slate_pos("CS_dex", 2.21687, 0.00468791, -1.2476, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_10")
	teleport_to_slate_pos("CS_troy", 1.2885, 0.00290831, 0.456679, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_10")
	teleport_to_slate_pos("#PLAYER#", -1.85394, 0.00367054, -0.0922692, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_10")
end

function shot11()
	teleport_to_slate_pos("CS_dex", 2.22222, 0.00491423, -1.24614, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_11")
	teleport_to_slate_pos("CS_troy", 1.28177, 0.00286403, 0.463079, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_11")
	teleport_to_slate_pos("#PLAYER#", -1.83967, 0.00496288, -0.0544211, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_11")
end

function shot12()
	teleport_to_slate_pos("CS_dex", 2.21907, 0.00492499, -1.25118, "slate_samsons_garage")
	play_custom_action_do("CS_dex", "lc04_scene01_dex_12")
	teleport_to_slate_pos("CS_troy", 1.2866, 0.00284829, 0.455773, "slate_samsons_garage")
	play_custom_action_do("CS_troy", "lc04_scene01_troy_12")
	teleport_to_slate_pos("#PLAYER#", -1.85779, 0.00494847, -0.0837145, "slate_samsons_garage")
	play_custom_action_do("#PLAYER#", "lc04_scene01_player_12")
	fade_out(0.133333)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_troy")
	stop_custom_actions("#PLAYER#")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
