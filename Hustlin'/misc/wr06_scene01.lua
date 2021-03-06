---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: wr06_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk02_church", true )
	load_chunks("sr_chunk02", "sr_chunk09_ph")
	load_chunks("sr_chunk09_ph", "sr_chunk02")
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
	fade_in(0.5)
	fat_bones_enable("#PLAYER#", false) 
	set_force_time_of_day_lights("false")
	select_slate("slate_church_main")
	character_show("#PLAYER#")
	teleport_to_slate_pos("CS_julius", -0.698, 0.0, -2.273, "slate_church_main")
	play_custom_action_do("CS_julius", "wr06_scene01_julius_1")
	teleport_to_slate_pos("#PLAYER#", -0.217, 0.0, -0.001, "slate_church_main")
	play_custom_action_do("#PLAYER#", "wr06_scene01_player_1")
	teleport_to_slate_pos("CS_pccell", 0.0, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_pccell", "wr06_scene01_pccell_1")
	set_level_lights(false)
end

function shot2()
	teleport_to_slate_pos("CS_julius", -0.956, 0.0, 0.6, "slate_church_main")
	play_custom_action_do("CS_julius", "wr06_scene01_julius_2")
	teleport_to_slate_pos("#PLAYER#", -0.218, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("#PLAYER#", "wr06_scene01_player_2")
	teleport_to_slate_pos("CS_pccell", 0.0, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_pccell", "wr06_scene01_pccell_2")
end

function shot3()
	teleport_to_slate_pos("CS_julius", -0.684, 0.0, 1.222, "slate_church_main")
	play_custom_action_do("CS_julius", "wr06_scene01_julius_3")
	teleport_to_slate_pos("#PLAYER#", -0.218, 0.0, -0.002, "slate_church_main")
	play_custom_action_do("#PLAYER#", "wr06_scene01_player_3")
	teleport_to_slate_pos("CS_pccell", 0.0, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_pccell", "wr06_scene01_pccell_3")
end

function shot4()
	teleport_to_slate_pos("CS_julius", -0.691, 0.0, 1.219, "slate_church_main")
	play_custom_action_do("CS_julius", "wr06_scene01_julius_4")
	teleport_to_slate_pos("#PLAYER#", -0.219, 0.0, -0.001, "slate_church_main")
	play_custom_action_do("#PLAYER#", "wr06_scene01_player_4")
	teleport_to_slate_pos("CS_pccell", 0.0, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_pccell", "wr06_scene01_pccell_4")
end

function shot5()
	teleport_to_slate_pos("CS_julius", -0.69, 0.0, 1.224, "slate_church_main")
	play_custom_action_do("CS_julius", "wr06_scene01_julius_5")
	teleport_to_slate_pos("#PLAYER#", -0.218, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("#PLAYER#", "wr06_scene01_player_5")
	teleport_to_slate_pos("CS_pccell", 0.0, 0.0, 0.0, "slate_church_main")
	play_custom_action_do("CS_pccell", "wr06_scene01_pccell_5")
end

function shot6()
	select_slate("slate_wr_poolhall_room")
	character_hide("#PLAYER#")
	teleport_to_slate_pos("CS_lin", 100.45, 0.0, 0.232, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_6")
	teleport_to_slate_pos("CS_cell", 100.243, 0.0, 0.315, "slate_wr_poolhall_room")
	play_custom_action_do("CS_cell", "wr06_scene01_cell02_6")
	teleport_to_slate_pos("CS_lin", 100.45, 0.0, 0.232, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_6")
	teleport_to_slate_pos("CS_sharp", 99.629, 0.0, 0.294, "slate_wr_poolhall_room")
	play_custom_action_do("CS_sharp", "wr06_scene01_sharp_6")
end

function shot7()
	teleport_to_slate_pos("CS_lin", 100.458, 0.0, 0.23, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_7")
	teleport_to_slate_pos("CS_cell", 99.834, 0.0, 0.445, "slate_wr_poolhall_room")
	play_custom_action_do("CS_cell", "wr06_scene01_cell02_7")
	teleport_to_slate_pos("CS_lin", 100.458, 0.0, 0.23, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_7")
	teleport_to_slate_pos("CS_sharp", 99.6, 0.0, 0.223, "slate_wr_poolhall_room")
	play_custom_action_do("CS_sharp", "wr06_scene01_sharp_7")
end

function shot8()
	teleport_to_slate_pos("CS_lin", 100.496, 0.0, 0.222, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_8")
	teleport_to_slate_pos("CS_cell", 99.532, 0.0, 0.418, "slate_wr_poolhall_room")
	play_custom_action_do("CS_cell", "wr06_scene01_cell02_8")
	teleport_to_slate_pos("CS_lin", 100.496, 0.0, 0.222, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_8")
	teleport_to_slate_pos("CS_sharp", 99.552, 0.0, 0.127, "slate_wr_poolhall_room")
	play_custom_action_do("CS_sharp", "wr06_scene01_sharp_8")
end

function shot9()
	teleport_to_slate_pos("CS_lin", 100.49, 0.0, 0.223, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_9")
	teleport_to_slate_pos("CS_cell", 99.682, 0.0, 0.574, "slate_wr_poolhall_room")
	play_custom_action_do("CS_cell", "wr06_scene01_cell02_9")
	teleport_to_slate_pos("CS_lin", 100.49, 0.0, 0.223, "slate_wr_poolhall_room")
	play_custom_action_do("CS_lin", "wr06_scene01_lin_9")
	teleport_to_slate_pos("CS_sharp", 99.605, 0.0, 0.355, "slate_wr_poolhall_room")
	play_custom_action_do("CS_sharp", "wr06_scene01_sharp_9")
	delay(3.4)
	fade_out(0.5)
end

function cutscene_abort()
	set_force_time_of_day_lights("disabled")
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	fat_bones_enable("#PLAYER#", true) 
end

function cutscene_end()
	set_force_time_of_day_lights("disabled")
	fat_bones_enable("#PLAYER#", true) 
	character_show("#PLAYER#")
	stop_custom_actions("CS_julius")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_lin")
	stop_custom_actions("CS_pccell")
	stop_custom_actions("CS_cell")
	stop_custom_actions("CS_lin")
	stop_custom_actions("CS_sharp")
	letterbox_fade_out(true)
	fade_out(0.5)
end
