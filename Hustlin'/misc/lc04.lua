-- Global Variables------


LC04_REQUIRED_KILLS = { "lc04_interior1","lc04_interior2","lc04_interior3","lc04_interior4","lc04_interior5",
						"lc04_interior6","lc04_interior7","lc04_interior8"}
LC04_MAX_FORWARD_PROGRESS = 3

lc04_factory_reached = false
lc04_truck_parked = false
lc04_interior_swept = false

lc04_kill_count = 0
lc04_next_move_location = -1
lc04_leader_name = "No Name"

lc04_leader_movement_thread = -1

-- FUNCTIONS ----------------------------

function lc04_cleanup()
	party_allow_max_followers(false)
	notoriety_reset( "los_carnales" )
	
	on_vehicle_destroyed( "", "lc04_trojan_truck" )
	on_vehicle_enter("", "lc04_trojan_truck" )
	on_vehicle_exit("", "lc04_trojan_truck")
	
	on_trigger( "", "lc04_factory_entrance" )
	on_trigger( "", "lc04_truck_parking" )
	on_trigger( "", "lc04_factory_load" )
	on_trigger( "", "lc04_exterior_continued" )
	on_trigger( "", "lc04_gate_entrance" )
	on_trigger( "", "lc04_location1" )
	on_trigger( "", "lc04_location2" )

	trigger_disable( "lc04_factory_entrance" )
	trigger_disable( "lc04_truck_parking" )
	trigger_disable( "lc04_factory_load" )
	trigger_disable( "lc04_exterior_continued" )
	trigger_disable( "lc04_gate_entrance" )
	trigger_disable( "lc04_location1" )
	trigger_disable( "lc04_location2" )
	
	minimap_icon_remove_navpoint( "lc04_factory_entrance" )
	minimap_icon_remove_navpoint( "lc04_factory_door" )
	
	remove_marker_trigger( "lc04_truck_parking" )
	remove_marker_vehicle( "lc04_trojan_truck" )
	
	for i=1,7,1 do
		if( not is_dead( "lc04_saint0"..i ) ) then
			npc_stop_following( "lc04_saint0"..i )
		end

		on_recruit( "", "lc04_saint0"..i )
		on_dismiss( "", "lc04_saint0"..i )
		on_death( "", "lc04_saint0"..i )
	end
	
	
	for i=1,sizeof_table(LC04_REQUIRED_KILLS),1 do
		on_death( "", LC04_REQUIRED_KILLS[i] )
		remove_marker_npc( LC04_REQUIRED_KILLS[i] )
	end
	
	release_to_world( "lc04_Group" )
	release_to_world( "lc04_Saints" )
	release_to_world( "lc04_Interior" )
	release_to_world( "lc04_Exterior" )
	release_to_world( "lc04_Exterior_Extra" )
end

function lc04_success()
	mission_unlock("docks_sh_peninsula")
	hood_set_owner( "lc_factory04", "Playas" )
	mission_set_next_props_req( "los_carnales", LC05_REQUIRED_PROPS )
end

function lc04_enter_truck()
	add_marker_trigger( "lc04_truck_parking", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	mission_help_table_nag( "lc04_goto_factory" )
end

function lc04_exit_truck()
	remove_marker_trigger( "lc04_truck_parking" )
	mission_help_table_nag( "lc04_use_truck" )
end

function lc04_chatter()
	delay(10)
	audio_play_for_character("AM3SS3_LC04_TRUCK", "#PLAYER#", "voice", false, true)
	delay(15)
	audio_play_for_character("BM3SS1_LC04_TRUCK", "#PLAYER#", "voice", false, true)
	delay(13)
	audio_play_for_character("HM3SS1_LC04_TRUCK", "#PLAYER#", "voice", false, true)
end

function lc04_start()
	set_mission_author("Russell Aasland")
	lc04_factory_reached = false
	lc04_truck_parked = false
	lc04_interior_swept = false
	lc04_kill_count = 0
	
	on_vehicle_destroyed( "lc04_truck_destroyed", "lc04_trojan_truck" )
	
	on_trigger( "lc04_location", "lc04_location1" )
	on_trigger( "lc04_location", "lc04_location2" )
	
	for i=1,7,1 do
		on_recruit( "lc04_recruited", "lc04_saint0"..i )
		on_dismiss( "lc04_dismissed", "lc04_saint0"..i )
	end
	
	for i=1,sizeof_table(LC04_REQUIRED_KILLS),1 do
		on_death( "lc04_required_kill_callback", LC04_REQUIRED_KILLS[i] )
	end

	persona_override_persona_start( "HM_LC1", "threat - alert (group attack)", "HMLC1_LC4_SPOT" )
	persona_override_persona_start( "HM_LC2", "threat - alert (group attack)", "HMLC2_LC4_SPOT" )
	persona_override_persona_start( "HM_LC3", "threat - alert (group attack)", "HMLC3_LC4_SPOT" )
	persona_override_persona_start( "WM_LC1", "threat - alert (group attack)", "WMLC1_LC4_SPOT" )
	persona_override_persona_start( "WM_LC2", "threat - alert (group attack)", "WMLC2_LC4_SPOT" )
	persona_override_persona_start( "WM_LC3", "threat - alert (group attack)", "WMLC3_LC4_SPOT" )

	persona_override_persona_start( "HF_LC1", "threat - alert (group attack)", "HMLC1_LC4_SPOT" )
	persona_override_persona_start( "HF_LC2", "threat - alert (group attack)", "HMLC2_LC4_SPOT" )
	persona_override_persona_start( "HF_LC3", "threat - alert (group attack)", "HMLC3_LC4_SPOT" )
	persona_override_persona_start( "WF_LC1", "threat - alert (group attack)", "WMLC1_LC4_SPOT" )
	persona_override_persona_start( "WF_LC2", "threat - alert (group attack)", "WMLC2_LC4_SPOT" )
	persona_override_persona_start( "WF_LC3", "threat - alert (group attack)", "WMLC3_LC4_SPOT" )

	persona_override_persona_start( "HM_LC1", "threat - damage received (firearm)", "HMLC1_LC4_ATTACK" )
	persona_override_persona_start( "HM_LC2", "threat - damage received (firearm)", "HMLC2_LC4_ATTACK" )
	persona_override_persona_start( "HM_LC3", "threat - damage received (firearm)", "HMLC3_LC4_ATTACK" )
	persona_override_persona_start( "WM_LC1", "threat - damage received (firearm)", "WMLC1_LC4_ATTACK" )
	persona_override_persona_start( "WM_LC2", "threat - damage received (firearm)", "WMLC2_LC4_ATTACK" )
	persona_override_persona_start( "WM_LC3", "threat - damage received (firearm)", "WMLC3_LC4_ATTACK" )

	persona_override_persona_start( "HF_LC1", "threat - damage received (firearm)", "HMLC1_LC4_ATTACK" )
	persona_override_persona_start( "HF_LC2", "threat - damage received (firearm)", "HMLC2_LC4_ATTACK" )
	persona_override_persona_start( "HF_LC3", "threat - damage received (firearm)", "HMLC3_LC4_ATTACK" )
	persona_override_persona_start( "WF_LC1", "threat - damage received (firearm)", "WMLC1_LC4_ATTACK" )
	persona_override_persona_start( "WF_LC2", "threat - damage received (firearm)", "WMLC2_LC4_ATTACK" )
	persona_override_persona_start( "WF_LC3", "threat - damage received (firearm)", "WMLC3_LC4_ATTACK" )

	cutscene_in("lc04_scene01")
	mesh_mover_reset_to_action_end("lc04_start_door", "start1")
	cutscene_play( "lc04_scene01", "lc04_Group" )
	mesh_mover_reset_to_action_end("lc04_start_door", "start1")
	vehicle_show( "lc04_trojan_truck" )
	add_marker_vehicle( "lc04_trojan_truck", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )
	
	teleport( "#PLAYER#", "lc04_player_post_cut" )
	
	delay(2)
	mission_help_table( "lc04_use_truck" )
	
	while (get_char_in_vehicle( "lc04_trojan_truck", 0 ) ~= "#PLAYER#" ) do
		thread_yield()
	end
	player_controls_disable()
	cutscene_in("lc04_tload")
	player_controls_enable()
	cutscene_play("lc04_tload")
	on_vehicle_enter("lc04_enter_truck", "lc04_trojan_truck" )
	on_vehicle_exit("lc04_exit_truck", "lc04_trojan_truck")
	notoriety_set_max( "los_carnales", 0 )
	notoriety_set_min( "los_carnales", 0 )
	teleport_vehicle("lc04_trojan_truck", "lc04_truck_post_cut")
	if (get_char_in_vehicle("lc04_trojan_truck", 0) ~= "#PLAYER#") then
		character_add_vehicle("#PLAYER#", "lc04_trojan_truck", 0)
	end
	
	mission_waypoint_add( "lc04_gps" )
	trigger_enable( "lc04_truck_parking" )
	add_marker_trigger( "lc04_truck_parking", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	on_trigger( "lc04_factory_gate", "lc04_factory_entrance" )
	trigger_enable( "lc04_factory_entrance" )
	mission_help_table( "lc04_goto_factory" )
	thread_new("lc04_chatter")
	while (not lc04_factory_reached) do
		thread_yield()
	end
	
	mission_help_table( "lc04_park_truck" )
	on_trigger( "lc04_truck_park", "lc04_truck_parking" )
	
	
	while (not lc04_truck_parked) do
		thread_yield()
	end
	
	on_vehicle_enter("", "lc04_trojan_truck" )
	on_vehicle_exit("", "lc04_trojan_truck")
	
	remove_marker_vehicle("lc04_trojan_truck")
	player_controls_disable()
	vehicle_stop("#PLAYER#")
	
	mission_waypoint_remove()
	
	cutscene_in("lc04_tunload")
	player_controls_enable()
	on_vehicle_destroyed( "", "lc04_trojan_truck" )
	character_remove_vehicle( "#PLAYER#" )
	
	cutscene_play("lc04_tunload", "lc04_Saints")
	notoriety_set_max( "los_carnales", 1 )
	notoriety_set_min( "los_carnales", 1 )
	teleport( "#PLAYER#", "lc04_unload_end" )
	
	for x = 1,7,1 do
		character_show("lc04_saint0"..x)
	end
	
	party_allow_max_followers(true)
	
	for x = 0, 2-party_get_count(), 1 do
		party_add( "lc04_saint0"..(x+1) )
	end
	
	lc04_next_move_location = 1
	
	lc04_leader_removed()
	
	trigger_enable( "lc04_location1" )
	mission_help_table( "lc04_eliminate" )
	on_trigger( "lc04_warehouse_door", "lc04_factory_load" )
	trigger_enable( "lc04_factory_load" )
	minimap_icon_add_navpoint( "lc04_factory_door", MINIMAP_ICON_LOCATION )
	
	while( not lc04_interior_swept ) do
		thread_yield()
	end
	
	delay(2)

	cutscene_in("lc04_scene02")
	
	for x = 0, 2, 1 do
		party_dismiss( "lc04_saint0"..(x+1) )
	end

	cutscene_play( "lc04_scene02", true )
	teleport( "#PLAYER#", "lc04_unload_end" )
	mission_end_success("lc04")
end

-- CALLBACKS --------------------------------------------------

function lc04_factory_gate()
	if (get_char_in_vehicle( "lc04_trojan_truck", 0 ) ~= "#PLAYER#" ) then
		return
	end

	trigger_disable( "lc04_factory_entrance" )
	lc04_factory_reached = true
		
	trigger_enable( "lc04_exterior_continued" )
	on_trigger( "lc04_exterior_extra", "lc04_exterior_continued" )

	group_create( "lc04_Exterior", true )
	
	patrol( "lc04_patroling", "lc04_exterior1" )
	patrol( "lc04_patroling", "lc04_exterior2" )
	patrol( "lc04_patroling", "lc04_exterior3" )
	patrol( "lc04_patroling", "lc04_exterior4" )
	patrol( "lc04_patroling", "lc04_exterior5" )
	patrol( "lc04_patroling", "lc04_exterior6" )
	patrol( "lc04_patroling", "lc04_exterior21" )
	patrol( "lc04_patroling", "lc04_exterior23" )
end

function lc04_patroling( char_name )
	npc_unholster_best_weapon( char_name )
	
	while ( true ) do
		move_to( char_name, char_name.."_path1", 1 )
		delay( rand_float( 1, 5 ) )
		move_to( char_name, char_name.."_path2", 1 )
		delay( rand_float( 1, 5 ) )
	end
end

function lc04_truck_park()
	if (get_char_in_vehicle( "lc04_trojan_truck", 0 ) ~= "#PLAYER#" ) then
		mission_help_table_nag( "lc04_use_truck" )
		return
	end
	
	on_vehicle_destroyed( "", "lc04_trojan_truck" )
	trigger_disable( "lc04_truck_parking" )
	
	lc04_truck_parked = true
	--trigger_enable( "lc04_gate_entrance" )
	--on_trigger( "lc04_gate", "lc04_gate_entrance" )
end

function lc04_warehouse_door()
	trigger_disable( "lc04_factory_load" )
	minimap_icon_remove_navpoint( "lc04_factory_door" )
	
	group_create( "lc04_Interior", true )
	
	mesh_mover_play_action("lc04_door", "start1")
	
	for i=1,sizeof_table(LC04_REQUIRED_KILLS),1 do
		add_marker_npc( LC04_REQUIRED_KILLS[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	end
end

function lc04_exterior_extra()
	trigger_disable( "lc04_exterior_continued" )
	group_create( "lc04_Exterior_Extra", true )
	
	attack( "lc04_exterior_extra01" )
	attack( "lc04_exterior_extra02" )
	attack( "lc04_exterior_extra03" )
	attack( "lc04_exterior_extra04" )
end

function lc04_gate()
	trigger_disable( "lc04_gate_entrance" )

	attack( "lc04_exterior19" )
	attack( "lc04_exterior20" )
end

function lc04_required_kill_callback( name )
	lc04_kill_count = lc04_kill_count + 1
	
	remove_marker_npc( name )
	
	if (lc04_kill_count == sizeof_table(LC04_REQUIRED_KILLS) ) then
		lc04_interior_swept = true
	end
end

function lc04_lead()
	local location_name = "lc04_location"..lc04_next_move_location
	
	if( not is_dead( lc04_leader_name ) ) then
		npc_unholster_best_weapon( lc04_leader_name )

		move_to( lc04_leader_name, location_name.."_mid", location_name, 2, true, true )
		lc04_leader_movement_thread = -1
	end
end

function lc04_location()
	trigger_disable( "lc04_location"..lc04_next_move_location )
	lc04_next_move_location = lc04_next_move_location + 1
	
	if ( lc04_next_move_location < LC04_MAX_FORWARD_PROGRESS ) then
		trigger_enable( "lc04_location"..lc04_next_move_location )
	end

	if (lc04_leader_name ~= "No Leader" ) then
		thread_kill( lc04_leader_movement_thread )
		lc04_leader_movement_thread = thread_new( "lc04_lead" )
	end
end

function lc04_leader_removed()
	
	mission_debug( "leader removed", 5 )

	local first_available = nil
	
	for i=1,7,1 do
		if( (not is_dead( "lc04_saint0"..i )) and (not is_in_party("lc04_saint0"..i )) ) then
			first_available = i
			break
		end
	end

		--there is no one left in the group of dudes
	if( first_available == nil ) then
		lc04_leader_name = "No Leader"
		return
	end

	lc04_leader_name = "lc04_saint0"..first_available
	
		--just in case the new leader hasn't realized his leader is no longer appropriate
	npc_stop_following( lc04_leader_name )
	
	on_death( "lc04_leader_removed", lc04_leader_name )
	
	for i=first_available+1,7,1 do
		if( (not is_dead( "lc04_saint0"..i )) and (not is_in_party("lc04_saint0"..i )) ) then
			npc_stop_following( "lc04_saint0"..i )
			npc_follow_npc( "lc04_saint0"..i, lc04_leader_name )
		end
	end
	
	thread_kill( lc04_leader_movement_thread )
	lc04_leader_movement_thread = thread_new( "lc04_lead" )
end

function lc04_recruited( name, leader )
	mission_debug( name.." was recruited by "..leader, 5 )
	
	if( leader ~= "#PLAYER#" ) then
		return
	end
	
	if( name == lc04_leader_name ) then
		lc04_leader_removed()
	end
end

function lc04_dismissed( name, leader )
	mission_debug( name.." was dimissed from "..leader, 5 )
	
	if( leader ~= "#PLAYER#" ) then
		return
	end
	
	if( (name == "lc04_saints01") or
		(name == "lc04_saints02") or
		(name == "lc04_saints03") or
		(name == "lc04_saints04") or
		(name == "lc04_saints05") or
		(name == "lc04_saints06") or
		(name == "lc04_saints07") ) then
		
		lc04_leader_removed()
	end
end

-- FAILURE CALLBACKS ------------------------------------------

function lc04_truck_destroyed()
	mission_end_failure( "lc04", "lc04_fail_truck" )
end