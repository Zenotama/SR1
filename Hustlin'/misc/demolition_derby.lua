---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: demolition_derby
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk09_arena", true )
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
end

function shot1()
	local excluded_lights_1 = {"BB FreeSpot11", "BB FreeSpot12", "BB FreeSpot13", "BB FreeSpot14", "BB FreeSpot15", "BB FreeSpot16", "BB FreeSpot01"}
	light_set_lights(excluded_lights_1, 7, false)

	local included_lights_1 = {"BB FreeSpot09", "BB FreeSpot10", "BB FreeSpot17", "BB FreeSpot18", "BB FreeSpot19", "BB Omni01"}
	light_set_lights(included_lights_1, 6, true)

	fade_in(0.5)
	select_slate("slate_arena")
	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", 5.51, -3.471, -4.195, "slate_arena")
	play_custom_action_do("#PLAYER#", "demoderby_player_1")
	teleport_to_slate_pos("CS_larry", -0.48, 0.0, 0.206, "slate_arena")
	play_custom_action_do("CS_larry", "demoderby_larry_1")
	teleport_to_slate_pos("CS_garry", 33.487, 0.0, -12.673, "slate_arena")
	play_custom_action_do("CS_garry", "demoderby_garry_1")
	teleport_to_slate_pos("CS_bDerby1a01", 22.976, -3.005, -19.445, "slate_arena")
	play_custom_action_do("CS_bDerby1a01", "demoderby_dDerby1a01_1")
	teleport_to_slate_pos("CS_bDerby2a01", 12.668, 0.007, -41.525, "slate_arena")
	play_custom_action_do("CS_bDerby2a01", "demoderby_dDerby2a01_1")
	teleport_to_slate_pos("CS_bDerby2b01", 6.878, -2.17, 11.143, "slate_arena")
	play_custom_action_do("CS_bDerby2b01", "demoderby_dDerby2b01_1")
	teleport_to_slate_pos("CS_garrycar", 33.555, -3.678, -12.227, "slate_arena")
	play_custom_action_do("CS_garrycar", "demoderby_garrycar_1")
	teleport_to_slate_pos("CS_larrycar", -0.289, 0.0, -9.536, "slate_arena")
	play_custom_action_do("CS_larrycar", "demoderby_larrycar_1")
end

function shot2()
	local excluded_lights_2 = {"BB FreeSpot09", "BB FreeSpot10", "BB FreeSpot11", "BB FreeSpot12", "BB FreeSpot13", "BB FreeSpot14", "BB FreeSpot15", "BB FreeSpot16", "BB FreeSpot17", "BB FreeSpot01", "BB Omni01"}
	light_set_lights(excluded_lights_2, 11, false)

	local included_lights_2 = {"BB FreeSpot18", "BB FreeSpot19"}
	light_set_lights(included_lights_2, 2, true)

	teleport_to_slate_pos("#PLAYER#", 5.295, -3.471, -3.816, "slate_arena")
	play_custom_action_do("#PLAYER#", "demoderby_player_2")
	teleport_to_slate_pos("CS_larry", 13.222, 0.0, -3.887, "slate_arena")
	play_custom_action_do("CS_larry", "demoderby_larry_2")
	teleport_to_slate_pos("CS_garry", 6.339, 0.0, -3.134, "slate_arena")
	play_custom_action_do("CS_garry", "demoderby_garry_2")
	teleport_to_slate_pos("CS_bDerby1a01", -13.585, -3.544, 17.843, "slate_arena")
	play_custom_action_do("CS_bDerby1a01", "demoderby_dDerby1a01_2")
	teleport_to_slate_pos("CS_bDerby2a01", 6.723, -3.464, 12.238, "slate_arena")
	play_custom_action_do("CS_bDerby2a01", "demoderby_dDerby2a01_2")
	teleport_to_slate_pos("CS_bDerby2b01", 19.307, -6.098, 31.067, "slate_arena")
	play_custom_action_do("CS_bDerby2b01", "demoderby_dDerby2b01_2")
	teleport_to_slate_pos("CS_garrycar", 6.355, -3.488, -2.703, "slate_arena")
	play_custom_action_do("CS_garrycar", "demoderby_garrycar_2")
	teleport_to_slate_pos("CS_larrycar", 12.054, -0.264, -2.889, "slate_arena")
	play_custom_action_do("CS_larrycar", "demoderby_larrycar_2")
	delay(10.8667)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_larry")
	stop_custom_actions("CS_garry")
	stop_custom_actions("CS_bDerby1a01")
	stop_custom_actions("CS_bDerby2a01")
	stop_custom_actions("CS_bDerby2b01")
	stop_custom_actions("CS_garrycar")
	stop_custom_actions("CS_larrycar")
	letterbox_fade_out(true)
	fade_out(0.5)
end