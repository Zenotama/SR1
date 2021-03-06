---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: wr03_scene01
-- Exported By: Ev.religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk12_tea", true)
	time_of_day_lights_enable(false)
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
end

function shot1()
	fade_in(0.5)
	character_show("#PLAYER#")
	select_slate("slate_tea_chinatown")
	teleport_to_slate_pos("#PLAYER#", 8.719, 0.0, -0.847, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "wr03_scene01_player_1")
	teleport_to_slate_pos("CS_lin", 12.1, 0.0, -1.406, "slate_tea_chinatown")
	play_custom_action_do("CS_lin", "wr03_scene01_lin_1")
	teleport_to_slate_pos("CS_pot", 12.959, 0.0, -1.187, "slate_tea_chinatown")
	play_custom_action_do("CS_pot", "wr03_scene01_pot_1")
	teleport_to_slate_pos("CS_cup", 12.638, 0.0, -1.479, "slate_tea_chinatown")
	play_custom_action_do("CS_cup", "wr03_scene01_cup_1")
	teleport_to_slate_pos("CS_man", 12.055, 0.0, -2.026, "slate_tea_chinatown")
	play_custom_action_do("CS_man", "wr03_scene01_man_1")
	teleport_to_slate_pos("CS_lighter", 12.611, 0.0, -2.076, "slate_tea_chinatown")
	play_custom_action_do("CS_lighter", "wr03_scene01_lighter_1")
	teleport_to_slate_pos("CS_cig", 12.524, 0.0, -1.393, "slate_tea_chinatown")
	play_custom_action_do("CS_cig", "wr03_scene01_cig_1")
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	thread_new("scripted_event4", 4)
	thread_new("scripted_event5", 5)
	thread_new("scripted_event6", 6)
	thread_new("scripted_event7", 7)
	thread_new("scripted_event8", 8)
	thread_new("scripted_event9", 9)
	character_hide("CS_bar03")
	set_level_lights(false)
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", 9.679, 0.0, -1.977, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "wr03_scene01_player_2")
	teleport_to_slate_pos("CS_lin", 12.1, 0.0, -1.413, "slate_tea_chinatown")
	play_custom_action_do("CS_lin", "wr03_scene01_lin_2")
	teleport_to_slate_pos("CS_pot", 12.959, 0.0, -1.187, "slate_tea_chinatown")
	play_custom_action_do("CS_pot", "wr03_scene01_pot_2")
	teleport_to_slate_pos("CS_cup", 12.638, 0.0, -1.479, "slate_tea_chinatown")
	play_custom_action_do("CS_cup", "wr03_scene01_cup_2")
	teleport_to_slate_pos("CS_man", 12.057, 0.0, -2.005, "slate_tea_chinatown")
	play_custom_action_do("CS_man", "wr03_scene01_man_2")
	teleport_to_slate_pos("CS_lighter", 9.245, 0.0, -1.196, "slate_tea_chinatown")
	play_custom_action_do("CS_lighter", "wr03_scene01_lighter_2")
	teleport_to_slate_pos("CS_cig", 12.51, 0.0, -1.648, "slate_tea_chinatown")
	play_custom_action_do("CS_cig", "wr03_scene01_cig_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", 11.188, 0.0, -2.241, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "wr03_scene01_player_3")
	teleport_to_slate_pos("CS_lin", 12.103, 0.0, -1.413, "slate_tea_chinatown")
	play_custom_action_do("CS_lin", "wr03_scene01_lin_3")
	teleport_to_slate_pos("CS_pot", 12.959, 0.0, -1.187, "slate_tea_chinatown")
	play_custom_action_do("CS_pot", "wr03_scene01_pot_3")
	teleport_to_slate_pos("CS_cup", 12.638, 0.0, -1.479, "slate_tea_chinatown")
	play_custom_action_do("CS_cup", "wr03_scene01_cup_3")
	teleport_to_slate_pos("CS_man", 11.128, 0.0, -1.422, "slate_tea_chinatown")
	play_custom_action_do("CS_man", "wr03_scene01_man_3")
	teleport_to_slate_pos("CS_lighter", 9.245, 0.0, -1.196, "slate_tea_chinatown")
	play_custom_action_do("CS_lighter", "wr03_scene01_lighter_3")
	teleport_to_slate_pos("CS_cig", 12.544, 0.0, -1.453, "slate_tea_chinatown")
	play_custom_action_do("CS_cig", "wr03_scene01_cig_3")

end

function shot4()
	character_hide("CS_walk01")
	teleport_to_slate_pos("#PLAYER#", 11.2, 0.0, -2.252, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "wr03_scene01_player_4")
	teleport_to_slate_pos("CS_lin", 12.101, 0.0, -1.412, "slate_tea_chinatown")
	play_custom_action_do("CS_lin", "wr03_scene01_lin_4")
	teleport_to_slate_pos("CS_pot", 12.959, 0.0, -1.187, "slate_tea_chinatown")
	play_custom_action_do("CS_pot", "wr03_scene01_pot_4")
	teleport_to_slate_pos("CS_cup", 12.638, 0.0, -1.479, "slate_tea_chinatown")
	play_custom_action_do("CS_cup", "wr03_scene01_cup_4")
	teleport_to_slate_pos("CS_man", 10.804, 0.0, -1.039, "slate_tea_chinatown")
	play_custom_action_do("CS_man", "wr03_scene01_man_4")
	teleport_to_slate_pos("CS_lighter", 9.245, 0.0, -1.196, "slate_tea_chinatown")
	play_custom_action_do("CS_lighter", "wr03_scene01_lighter_4")
	teleport_to_slate_pos("CS_cig", 12.516, 0.0, -1.472, "slate_tea_chinatown")
	play_custom_action_do("CS_cig", "wr03_scene01_cig_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", 12.09, 0.0, -2.152, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "wr03_scene01_player_5")
	teleport_to_slate_pos("CS_lin", 12.099, 0.0, -1.415, "slate_tea_chinatown")
	play_custom_action_do("CS_lin", "wr03_scene01_lin_5")
	teleport_to_slate_pos("CS_pot", 12.959, 0.0, -1.187, "slate_tea_chinatown")
	play_custom_action_do("CS_pot", "wr03_scene01_pot_5")
	teleport_to_slate_pos("CS_cup", 12.638, 0.0, -1.479, "slate_tea_chinatown")
	play_custom_action_do("CS_cup", "wr03_scene01_cup_5")
	teleport_to_slate_pos("CS_man", 9.552, 0.0, 1.293, "slate_tea_chinatown")
	play_custom_action_do("CS_man", "wr03_scene01_man_5")
	teleport_to_slate_pos("CS_lighter", 9.245, 0.0, -1.196, "slate_tea_chinatown")
	play_custom_action_do("CS_lighter", "wr03_scene01_lighter_5")
	teleport_to_slate_pos("CS_cig", 12.607, 0.0, -1.497, "slate_tea_chinatown")
	play_custom_action_do("CS_cig", "wr03_scene01_cig_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", 12.018, 0.0, -2.056, "slate_tea_chinatown")
	play_custom_action_do("#PLAYER#", "wr03_scene01_player_6")
	teleport_to_slate_pos("CS_lin", 12.099, 0.0, -1.419, "slate_tea_chinatown")
	play_custom_action_do("CS_lin", "wr03_scene01_lin_6")
	teleport_to_slate_pos("CS_pot", 12.959, 0.0, -1.187, "slate_tea_chinatown")
	play_custom_action_do("CS_pot", "wr03_scene01_pot_6")
	teleport_to_slate_pos("CS_cup", 12.638, 0.0, -1.479, "slate_tea_chinatown")
	play_custom_action_do("CS_cup", "wr03_scene01_cup_6")
	teleport_to_slate_pos("CS_man", 9.552, 0.0, 1.293, "slate_tea_chinatown")
	play_custom_action_do("CS_man", "wr03_scene01_man_6")
	teleport_to_slate_pos("CS_lighter", 9.245, 0.0, -1.196, "slate_tea_chinatown")
	play_custom_action_do("CS_lighter", "wr03_scene01_lighter_6")
	teleport_to_slate_pos("CS_cig", 12.545, 0.0, -1.554, "slate_tea_chinatown")
	play_custom_action_do("CS_cig", "wr03_scene01_cig_6")
	delay(10.7333)
	fade_out(0.5)
end

function cutscene_abort()
	time_of_day_lights_enable(true)
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
end

function cutscene_end()
	time_of_day_lights_enable(true)
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_lin")
	stop_custom_actions("CS_pot")
	stop_custom_actions("CS_cup")
	stop_custom_actions("CS_man")
	stop_custom_actions("CS_lighter")
	stop_custom_actions("CS_cig")
	letterbox_fade_out(true)
	fade_out(0.5)
end

function scripted_event1()
	teleport("CS_bar01", "CS_CharNav_bar01_1")
	play_action_sequence("CS_bar01", "sitting")
end

function scripted_event2()
	teleport("CS_bar02", "CS_CharNav_bar02_1")
	play_action_sequence("CS_bar02", "sitting")
end

function scripted_event3()
	teleport("CS_bar03", "CS_CharNav_bar03_1")
	play_action_sequence("CS_bar03", "sitting")
end

function scripted_event4()
	teleport("CS_booth01", "CS_CharNav_booth01_1")
	play_action_sequence("CS_booth01", "sitting")
end

function scripted_event5()
	teleport("CS_booth02", "CS_CharNav_booth02_1")
	play_action_sequence("CS_booth02", "sitting")
end

function scripted_event6()
	teleport("CS_booth03", "CS_CharNav_booth03_1")
	play_action_sequence("CS_booth03", "sitting")
end

function scripted_event7()
	teleport("CS_stand01", "CS_CharNav_stand01_1")
	play_action_sequence("CS_stand01", "drunk stand")
end

function scripted_event8()
	teleport("CS_stand02", "CS_CharNav_stand02_1")
	play_action_sequence("CS_stand02", "drunk stand")
end

function scripted_event9()
	teleport("CS_walk01", "CS_CharNav_walk01_1")
	local walk01_Nav01 = {"CS_PathNav_walk01_01_1"}
	move_to("CS_walk01", walk01_Nav01, 1)
end
