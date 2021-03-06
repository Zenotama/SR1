-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\racing_airport\racing_airport.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk24__airground.cts
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
	teleport_to_slate_pos("#PLAYER#", -0.258954, 0.0, 0.709908, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_1")
	teleport_to_slate_pos("CS_lorenzo", -0.315802, 0.120087, -1.46042, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_1")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", -0.254923, 0.0, 0.707296, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_2")
	teleport_to_slate_pos("CS_lorenzo", -0.348849, 0.120323, -1.41277, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_2")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", -0.235299, 0.0, 0.706516, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_3")
	teleport_to_slate_pos("CS_lorenzo", -0.433791, 0.120312, -1.07722, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_3")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", -0.207363, 0.0, 0.676091, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_4")
	teleport_to_slate_pos("CS_lorenzo", -0.409519, 0.120244, -1.1248, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_4")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", -0.233523, 0.0, 0.696883, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_5")
	teleport_to_slate_pos("CS_lorenzo", -1.87579, 0.12057, -0.971474, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_5")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_5")
end

function shot6()
	teleport_to_slate_pos("#PLAYER#", -0.249865, 0.0, 0.720683, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_6")
	teleport_to_slate_pos("CS_lorenzo", -1.84154, 0.122633, -0.974154, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_6")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_6")
end

function shot7()
	teleport_to_slate_pos("#PLAYER#", -0.230535, 0.0, 0.695891, "slate_racing_airport")
	play_custom_action_do("#PLAYER#", "racing_airport_player_7")
	teleport_to_slate_pos("CS_lorenzo", -1.94866, 0.12058, -0.957404, "slate_racing_airport")
	play_custom_action_do("CS_lorenzo", "racing_airport_lorenzo_7")
	teleport_to_slate_pos("CS_porn", 0.0, 0.0, 0.0, "slate_racing_airport")
	play_custom_action_do("CS_porn", "racing_airport_porn_7")
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_lorenzo")
	stop_custom_actions("CS_porn")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
