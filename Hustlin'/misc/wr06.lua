-- Global Variables------

-- Respect level required to unlock mission

Wr06_wave_data = {
	{"wr06_$c_roller_1_1", "wr06_$c_roller_1_2", "wr06_$c_roller_1_3",},
	{"wr06_$c_roller_2_1", "wr06_$c_roller_2_2", "wr06_$c_roller_2_3", "wr06_$c_roller_2_4", "wr06_$c_roller_2_5", "wr06_$c_roller_2_6",},
	{"wr06_$c_roller_3_1", "wr06_$c_roller_3_2", "wr06_$c_roller_3_3",},
	{"wr06_$c_roller_4_1", "wr06_$c_roller_4_2", "wr06_$c_roller_4_3", "wr06_$c_roller_4_4", "wr06_$c_roller_4_5",},
	{"wr06_$c_roller_5_1", "wr06_$c_roller_5_2",}
}

Wr06_wave_lookup = {}

Wr06_groups_spawned = {}

Wr06_num_rollers = 0

Wr06_required_kills = 7

-- FUNCTIONS ----------------------------

function wr06_success()
	hood_set_owner("wr_arena01", "Playas")
	mission_start("wr07")
	fade_out( 0 )
end


function wr06_cleanup()
	mission_waypoint_remove()
	
	special_spawns_enable(true)
	
	for i in Wr06_wave_lookup do
		on_take_damage("", i)
		on_death("", i)
	end
	
	Wr06_wave_lookup = {}

	for i in Wr06_groups_spawned do
		release_to_world(i)
	end
	
	Wr06_groups_spawned = {}

	on_death("", "#PLAYER#")
	remove_marker_navpoint("wr06_$n_lin")

	trigger_disable("wr06_$t_entrance")
	trigger_disable("wr06_$t_stairs")
	trigger_disable("wr06_$t_lin")
	trigger_disable("wr06_$t_hallway")
	on_trigger("", "wr06_$t_entrance")
	on_trigger("", "wr06_$t_stairs")
	on_trigger("", "wr06_$t_lin")
	on_trigger("", "wr06_$t_hallway")
	
	persona_override_remove_all("AM_WR1")
	persona_override_remove_all("AM_WR2")
	persona_override_remove_all("AM_WR3")
	persona_override_remove_all("WM_WR1")
	persona_override_remove_all("WM_WR2")
	persona_override_remove_all("WM_WR3")
	persona_override_remove_all("AF_WR1")
	persona_override_remove_all("AF_WR2")
	persona_override_remove_all("AF_WR3")
	persona_override_remove_all("WF_WR1")
	persona_override_remove_all("WF_WR2")
	persona_override_remove_all("WF_WR3")
end

-- Called by mission trigger
function wr06_start()
	special_spawns_enable(false)
	
	door_lock("PHMeshMover02", true)
	set_mission_author("Sean Rose")
	log_clear("wr06.txt")

	on_death("wr06_player_died", "#PLAYER#")

	cutscene_in("wr06_scene01")
	cutscene_play("wr06_scene01")
	teleport("#PLAYER#", "mission_start_wr06")
	
	add_marker_navpoint("wr06_$n_lin", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	mission_waypoint_add("wr06_pool_gps")
	trigger_enable("wr06_$t_lin")

	delay(2)
	
	mission_help_table("wr06_get_to_pool_hall")
	
	Wr06_num_rollers = 0
	for index, value in Wr06_wave_data do
		for i, j in value do
			Wr06_wave_lookup[j] = index
			Wr06_num_rollers = Wr06_num_rollers + 1
		end
	end
	
	while get_dist_char_to_nav("#PLAYER#", "wr06_$execute lua script000") > 80 do
		delay(0.5)
	end
	
	Wr06_required_kills = 5
	
	group_create("wr06_$g_wave_1", true)
	character_add_vehicle("wr06_ram_driver", "wr06_ram_car", 0)
	Wr06_groups_spawned["wr06_$g_wave_1"] = true
	wr06_init_wave(Wr06_wave_data[1])

	on_trigger("wr06_entrance_trigger", "wr06_$t_entrance")
	on_trigger("wr06_stairs_trigger", "wr06_$t_stairs")
	on_trigger("wr06_lin_trigger", "wr06_$t_lin")
	on_trigger("wr06_hallway_trigger", "wr06_$t_hallway")
	trigger_enable("wr06_$t_entrance")
	trigger_enable("wr06_$t_stairs")
	trigger_enable("wr06_$t_hallway")
end

function wr06_player_died()
	mission_end_failure("wr06")
end

function wr06_init_wave(wave)
	for index, value in wave do
		on_take_damage("wr06_take_damage", value)
		on_death("wr06_roller_died", value)
	end
end

function wr06_attack_wave(wave)
	for index, value in wave do
		if not is_dead(value) then
			attack(value, "#PLAYER#", false)
			on_take_damage("", value)
		end
	end
end

function wr06_take_damage(name)
	local wave_index = Wr06_wave_lookup[name]
	
	wr06_attack_wave(Wr06_wave_data[wave_index])
end


-- Called by entrance trigger
function wr06_entrance_trigger()
	persona_override_persona_start("AM_WR1", "threat - alert (solo attack)", "AMWR1_WR6_ATTACK") 
	persona_override_persona_start("AM_WR1", "threat - alert (group attack)", "AMWR1_WR6_ATTACK") 
	persona_override_persona_start("AM_WR2", "threat - alert (solo attack)", "AMWR2_WR6_ATTACK") 
	persona_override_persona_start("AM_WR2", "threat - alert (group attack)", "AMWR2_WR6_ATTACK") 
	persona_override_persona_start("AM_WR3", "threat - alert (solo attack)", "AMWR3_WR6_ATTACK") 
	persona_override_persona_start("AM_WR3", "threat - alert (group attack)", "AMWR3_WR6_ATTACK") 
	persona_override_persona_start("WM_WR1", "threat - alert (solo attack)", "WMWR1_WR6_ATTACK") 
	persona_override_persona_start("WM_WR1", "threat - alert (group attack)", "WMWR1_WR6_ATTACK") 
	persona_override_persona_start("WM_WR2", "threat - alert (solo attack)", "WMWR2_WR6_ATTACK") 
	persona_override_persona_start("WM_WR2", "threat - alert (group attack)", "WMWR2_WR6_ATTACK") 
	persona_override_persona_start("WM_WR3", "threat - alert (solo attack)", "WMWR3_WR6_ATTACK") 
	persona_override_persona_start("WM_WR3", "threat - alert (group attack)", "WMWR3_WR6_ATTACK") 
	
	persona_override_persona_start("AF_WR1", "threat - alert (solo attack)", "AFWR1_WR6_ATTACK") 
	persona_override_persona_start("AF_WR1", "threat - alert (group attack)", "AFWR1_WR6_ATTACK") 
	persona_override_persona_start("AF_WR2", "threat - alert (solo attack)", "AFWR2_WR6_ATTACK") 
	persona_override_persona_start("AF_WR2", "threat - alert (group attack)", "AFWR2_WR6_ATTACK") 
	persona_override_persona_start("AF_WR3", "threat - alert (solo attack)", "AFWR3_WR6_ATTACK") 
	persona_override_persona_start("AF_WR3", "threat - alert (group attack)", "AFWR3_WR6_ATTACK") 
	persona_override_persona_start("WF_WR1", "threat - alert (solo attack)", "WFWR1_WR6_ATTACK") 
	persona_override_persona_start("WF_WR1", "threat - alert (group attack)", "WFWR1_WR6_ATTACK") 
	persona_override_persona_start("WF_WR2", "threat - alert (solo attack)", "WFWR2_WR6_ATTACK") 
	persona_override_persona_start("WF_WR2", "threat - alert (group attack)", "WFWR2_WR6_ATTACK") 
	persona_override_persona_start("WF_WR3", "threat - alert (solo attack)", "WFWR3_WR6_ATTACK") 
	persona_override_persona_start("WF_WR3", "threat - alert (group attack)", "WFWR3_WR6_ATTACK") 
	
	mission_waypoint_remove()
	
	trigger_disable("wr06_$t_entrance")
	--wr06_attack_wave(Wr06_wave_data[1])
	vehicle_set_torque_multiplier("wr06_ram_car", 2.0)
	vehicle_speed_override("wr06_ram_car", 80)
	vehicle_pathfind_to("wr06_ram_car", "wr06_ram_dest", true, false)
	vehicle_speed_cancel("wr06_ram_car")
	notoriety_set_min("rollers", 1)
	mission_help_table("wr06_ambush")
	delay(3)
end

function wr06_hallway_trigger()
	trigger_disable("wr06_$t_hallway")
	if Wr06_groups_spawned["wr06_$g_wave_2"] == nil then
		group_create("wr06_$g_wave_2", true)
		Wr06_groups_spawned["wr06_$g_wave_2"] = true
		wr06_init_wave(Wr06_wave_data[2])
		wr06_attack_wave(Wr06_wave_data[2])
	end
end

-- Called by stairs trigger
function wr06_stairs_trigger()
	trigger_disable("wr06_$t_stairs")
	if Wr06_groups_spawned["wr06_$g_wave_4"] == nil then
		group_create("wr06_$g_wave_4", true)
		Wr06_groups_spawned["wr06_$g_wave_4"] = true
		wr06_init_wave(Wr06_wave_data[4])
		wr06_attack_wave(Wr06_wave_data[4])
	end	
end

function wr06_wave6_attack()
	if Wr06_groups_spawned["wr06_$g_wave_5"] == nil then
		door_open("PHMeshMover02")
		--mesh_mover_play_action("wr06_back_door", "start1")
		group_create("wr06_$g_wave_5")
		Wr06_groups_spawned["wr06_$g_wave_5"] = true
		wr06_init_wave(Wr06_wave_data[5])
		wr06_attack_wave(Wr06_wave_data[5])
	end
end

function wr06_lin_trigger()
	cutscene_in("wr06_scene02")
	trigger_disable("wr06_$t_lin")
	cutscene_play("wr06_scene02", true)
	mission_unlock("wr07")
	mission_end_success("wr06")
end

-- Called when roller dies
function wr06_roller_died(name)
	Wr06_num_rollers = Wr06_num_rollers - 1
	mission_debug("num_rollers: "..Wr06_num_rollers, -1, 4)
	
	if Wr06_num_rollers == 12 then
		Wr06_required_kills = Wr06_required_kills - 3
		--group_create("wr06_$g_wave_3", true)
		--Wr06_groups_spawned["wr06_$g_wave_3"] = true
		--wr06_init_wave(Wr06_wave_data[3])
		--wr06_attack_wave(Wr06_wave_data[3])
		--vehicle_pathfind_to("wr06_ram_car", "wr06_ram_dest2", true, false)
	end
	
	if Wr06_wave_lookup[name] == 4 or Wr06_wave_lookup[name] == 5 then
		Wr06_required_kills = Wr06_required_kills - 1
		
		if Wr06_required_kills < 3 then
			wr06_wave6_attack()
		end
	end
end

function wr06_cutscene1()
	fade_out(2)
	delay(2)
	letterbox_fade_in(true)
	thread_new_block("wr06_cutscene1_modal")
	letterbox_fade_out(true)
	fade_in(2)
	delay(2)
end

function wr06_cutscene1_modal()
	modal_begin()
	fade_in(2)

--	audio_play_for_character("VOC_Julius_WR06_Cutscene_1_1","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Julius_WR06_Cutscene_1_2","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Julius_WR06_Cutscene_1_3","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Lin_WR06_Cutscene_1_1","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Julius_WR06_Cutscene_1_4","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Sharp_WR06_Cutscene_1_1","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Lin_WR06_Cutscene_1_2","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Sharp_WR06_Cutscene_1_2","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Sharp_WR06_Cutscene_1_3","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Sharp_WR06_Cutscene_1_4","#PLAYER#", "voice", true, true)

	fade_out(2)
	delay(2)
	modal_end()
end

function wr06_cutscene2()
	fade_out(2)
	delay(2)
	letterbox_fade_in(true)
	thread_new_block("wr06_cutscene2_modal")
	letterbox_fade_out(true)
	fade_in(2)
	delay(2)
end

function wr06_cutscene2_modal()
	modal_begin()
	fade_in(2)

--	audio_play_for_character("VOC_Roller_WR06_Cutscene_2_1","#PLAYER#", "voice", true, true)

--	audio_play_for_character("VOC_Sharp_WR06_Cutscene_2_1","#PLAYER#", "voice", true, true)

	fade_out(2)
	delay(2)
	modal_end()
end
