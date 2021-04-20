-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk05_scene02\vk05_scene02.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk32_ms__interiors.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
end

function shot1()
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("CS_tanya", 27.5945, -0.755804, -18.5447, "slate_record_outside01")
	play_custom_action_do("CS_tanya", "vk05_scene02_tanya_1")
	teleport_to_slate_pos("CS_worker", 21.9773, -0.873491, -14.5327, "slate_record_outside01")
	play_custom_action_do("CS_worker", "vk05_scene02_worker_1")
	teleport_to_slate_pos("CS_driver", 31.1887, -0.977323, -20.1358, "slate_record_outside01")
	play_custom_action_do("CS_driver", "vk05_scene02_driver_1")
	teleport_to_slate_pos("CS_limo", 30.0871, -0.991197, -11.5636, "slate_record_outside01")
	play_custom_action_do("CS_limo", "vk05_scene02_csLimo_1")
end

function shot2()
	teleport_to_slate_pos("CS_tanya", 27.5983, -0.755607, -19.2943, "slate_record_outside01")
	play_custom_action_do("CS_tanya", "vk05_scene02_tanya_2")
	teleport_to_slate_pos("CS_worker", 21.9835, -1.02418, -14.5403, "slate_record_outside01")
	play_custom_action_do("CS_worker", "vk05_scene02_worker_2")
	teleport_to_slate_pos("CS_driver", 31.9475, -0.982738, -20.8566, "slate_record_outside01")
	play_custom_action_do("CS_driver", "vk05_scene02_driver_2")
	teleport_to_slate_pos("CS_limo", 26.1469, -0.991197, -16.1648, "slate_record_outside01")
	play_custom_action_do("CS_limo", "vk05_scene02_csLimo_2")
end

function shot3()
	teleport_to_slate_pos("CS_tanya", 27.3747, -0.765041, -13.065, "slate_record_outside01")
	play_custom_action_do("CS_tanya", "vk05_scene02_tanya_3")
	teleport_to_slate_pos("CS_worker", 22.4603, -1.02156, -13.5662, "slate_record_outside01")
	play_custom_action_do("CS_worker", "vk05_scene02_worker_3")
	teleport_to_slate_pos("CS_driver", 25.6808, -0.980279, -14.0527, "slate_record_outside01")
	play_custom_action_do("CS_driver", "vk05_scene02_driver_3")
	teleport_to_slate_pos("CS_limo", 26.1469, -0.991197, -16.1648, "slate_record_outside01")
	play_custom_action_do("CS_limo", "vk05_scene02_csLimo_3")
	delay(6.5)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_tanya")
	stop_custom_actions("CS_worker")
	stop_custom_actions("CS_driver")
	stop_custom_actions("CS_limo")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
