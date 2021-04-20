-- Global Variables------

LC08_TRAVEL_TIMER = 1.75 * 60 * 1000
LC08_DEFENSE_TIMER = 3 * 60 * 1000
LC08_LEFT_PERIMETER_TIMER = 10 * 1000
LC08_VEHICLE_DAMAGE = .75

lc08_garage_reached = false
lc08_evidence_reached = false
lc08_defense_successful = false
lc08_remainder_time = LC08_DEFENSE_TIMER
lc08_outside_perimeter = false

-- FUNCTIONS ----------------------------

function lc08_cleanup()
	mission_waypoint_remove()

	trigger_disable( "lc08_garage" )
	trigger_disable( "lc08_police_station" )
	trigger_disable( "lc08_defense_perimeter" )
	trigger_disable("lc08_open_garage")
	
	on_trigger("", "lc08_open_garage")
	on_trigger_exit("", "lc08_open_garage")
	
	on_trigger( "", "lc08_garage" )
	on_trigger( "", "lc08_police_station" )
	on_trigger( "", "lc08_defense_perimeter" )
	on_trigger_exit( "", "lc08_defense_perimeter" )

	remove_marker_trigger( "lc08_garage" )
	remove_marker_trigger( "lc08_police_station" )
	remove_marker_vehicle( "lc08_det_car" )
	
	party_dismiss("lc08_truck_driver")
	
	remove_marker_vehicle( "lc08_truck" )
	
	release_to_world( "lc08_Group" )
	release_to_world( "lc08_truck" )
	release_to_world( "lc08_Truck" )
	
	notoriety_reset( "police" )
	
	damage_indicator_off()
	on_damage("","lc08_det_car",0)
	on_vehicle_destroyed( "", "lc08_det_car" )
	on_vehicle_enter( "", "lc08_det_car" )
	on_vehicle_exit( "", "lc08_det_car" )
	on_vehicle_enter( "", "lc08_truck" )
	on_vehicle_exit( "", "lc08_truck" )
	on_vehicle_destroyed( "", "lc08_truck" )
	
	hud_timer_stop()
end

function lc08_success()
	message("You're the winner!")
	props_add( "los_carnales", LC08_PROPS_REWARD )
	mission_unlock("docks_stronghold_ware")
	hood_set_owner( "lc_barrio02", "Playas" )
	mission_set_next_props_req( "los_carnales", LC09_REQUIRED_PROPS )
	radio_post_event("NEWS_LC_DRUGTHEFTCOPS", false)
end

function lc08_garage_open()
	mesh_mover_play_action("lc08_garage_door", "start1")
end

function lc08_garage_close()
	mesh_mover_play_action("lc08_garage_door", "start2")
end

function lc08_garage_cutscene()
	modal_begin()
	camera_look_through("lc08_garage_cam")
	fade_in(0.5)
	lc08_garage_close()
	
	delay(2)
	audio_play_for_character("SFX_CAR_MODIFY", "#PLAYER#", "foley", false, true)
	audio_play_for_character("SAMSON_VK2_BOMB_1", "#PLAYER#", "voice", false, true)
	delay(1)

	lc08_garage_open()

	fade_out(0.5)
	fade_out_block()
	
	--vk02_garage_open()
	--camera_end_script()
	modal_end()
end

function lc08_garage_cutscene_end()
	camera_end_script()
	player_controls_enable()
	lc08_garage_open()
end


function lc08_start()
	mesh_show("lc08_fakewall")
	set_mission_author("Russell Aasland")
	lc08_garage_reached = false
	lc08_evidence_reached = false
	lc08_defense_successful = false
	lc08_remainder_time = LC08_DEFENSE_TIMER

	cutscene_in("lc08_scene01")
	cutscene_play( "lc08_scene01", "lc08_Group" )
	teleport("#PLAYER#", "mission_start_vk02")
	vehicle_show( "lc08_det_car" )

	add_marker_vehicle( "lc08_det_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )
	on_vehicle_destroyed( "lc08_vehicle_damage", "lc08_det_car" )
	delay(2)
	mission_help_table( "lc08_use_car" )
	
	while( get_char_in_vehicle("lc08_det_car",0) ~= "#PLAYER#" ) do
		thread_yield()
	end

	remove_marker_vehicle( "lc08_det_car" )
	mission_waypoint_add("lc08_garage_gps")
	trigger_enable("lc08_open_garage")
	on_trigger("lc08_garage_open", "lc08_open_garage")
	on_trigger_exit("lc08_garage_close", "lc08_open_garage")
	
	on_trigger("lc08_garage_arrival", "lc08_garage" )
	trigger_enable( "lc08_garage" )

	add_marker_trigger( "lc08_garage", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	mission_help_table( "lc08_goto_garage" )
	
	on_vehicle_exit( "lc08_det_car_exit", "lc08_det_car" )
	on_vehicle_enter( "lc08_det_car_enter", "lc08_det_car" )
	
	while( not lc08_garage_reached ) do
		thread_yield()
	end
	
	player_controls_disable()
	vehicle_stop("#PLAYER#")
	cutscene_in()
	player_controls_enable()
	vehicle_repair( "lc08_det_car", 1 )
	scripted_cutscene_play("lc08_garage_cutscene", "lc08_garage_cutscene_end")

	damage_indicator_on("lc08_det_car", LC08_VEHICLE_DAMAGE, "lc08_carbomb")
	on_damage("lc08_vehicle_damage","lc08_det_car",LC08_VEHICLE_DAMAGE)

	hud_timer_set( LC08_TRAVEL_TIMER, "lc08_timer_expired" )
	add_marker_trigger( "lc08_police_station", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	mission_waypoint_add("lc08_station_gps")
	on_trigger("lc08_evidence_arrival", "lc08_police_station" )
	on_trigger_exit("lc08_evidence_leave", "lc08_police_station" )
	trigger_enable( "lc08_police_station" )

	on_trigger("lc08_station_arrival", "lc08_defense_perimeter" )
	trigger_enable( "lc08_defense_perimeter" )
	
	--hud_timer_pause( true )
	fade_in(0.5)
	delay(2)
	mission_help_table( "lc08_goto_station" )

	while (get_dist_vehicle_to_nav("lc08_det_car", "lc08_police_station") > 5.0) do
		if (lc08_evidence_reached) then
			break
		end
		thread_yield()
	end
	
	on_vehicle_exit( "", "lc08_det_car" )
	
	if (get_dist_char_to_vehicle("#PLAYER#", "lc08_det_car") < 10) then
		mission_help_table("lc08_run")
	end
	
	while ( not lc08_evidence_reached ) or (get_dist_char_to_vehicle("#PLAYER#", "lc08_det_car") < 10) do
		thread_yield()
		if (is_vehicle_destroyed("lc08_det_car")) then
			break
		end
	end
	
	damage_indicator_off()
	on_damage("","lc08_det_car",0)
	on_vehicle_destroyed( "", "lc08_det_car" )
	on_vehicle_exit( "", "lc08_det_car" )
	on_vehicle_enter( "", "lc08_det_car" )
	
	if (not is_vehicle_destroyed("lc08_det_car")) then
		if (not lc08_blowup_car()) then
			mission_end_failure("lc08", "lc08_fail_timer")
			return
		end
	end
	
	mission_waypoint_remove()
	
	delay(2)
	
	cutscene_in("lc08_policestation")
	group_destroy( "lc08_Group" )
	
	npc_revive("#FOLLOWER1#")
	npc_revive("#FOLLOWER2#")
	npc_revive("#FOLLOWER3#")
	
	cutscene_play("lc08_policestation", "lc08_Truck")

	--thread_yield()
	vehicle_infinite_mass("lc08_truck", true)
	set_unjackable_flag("lc08_truck", true)
	teleport( "#PLAYER#", "lc08_player_post_cut" )
	
	vehicle_show( "lc08_truck" )
	character_show( "lc08_truck_driver" )
	
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.25, "LC8 Police Phone Call", "Dex", false, "", "")

	--character_add_vehicle( "lc08_truck_driver", "lc08_truck", 0 )
	
	--damage_indicator_on( "lc08_truck", 0 )
	turn_invulnerable( "lc08_truck", true )
	add_marker_vehicle( "lc08_truck", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

	party_add_optional( "lc08_truck_driver" )

	trigger_enable( "lc08_defense_perimeter" )
	hud_timer_set( lc08_remainder_time, "lc08_defense_timer" )
	lc08_outside_perimeter = false

	--notoriety_set_min( "police", 4 )
	thread_new( "lc08_notoriety_thread" )
	
	on_vehicle_enter( "lc08_truck_enter", "lc08_truck" )
	on_vehicle_destroyed( "lc08_truck_destroyed", "lc08_truck" )
	
	mission_help_table( "lc08_defend" )

	while( not lc08_defense_successful ) do
		thread_yield()
	end
	set_unjackable_flag("lc08_truck", false)
	vehicle_infinite_mass("lc08_truck", false)

	on_vehicle_enter( "lc08_truck_enter2", "lc08_truck" )
	on_vehicle_exit( "lc08_truck_exit", "lc08_truck" )
	on_trigger("lc08_garage_finish", "lc08_garage" )

	trigger_disable( "lc08_defense_perimeter" )
	turn_vulnerable( "lc08_truck" )
	
	mission_waypoint_add("lc08_garage_gps")
	add_marker_trigger( "lc08_garage", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	lc08_garage_reached = false
	cellphone_remove("LC8 Police Phone Call")
	mission_help_table( "lc08_return" )

	while( not lc08_garage_reached ) do
		thread_yield()
	end

	cutscene_in("lc08_scene02")
	cutscene_play( "lc08_scene02", true )
	group_destroy( "lc08_Truck" )
	teleport("#PLAYER#", "lc08_player_port")

	mission_end_success("lc08")
end

function lc08_garage_arrival()
	if (get_char_in_vehicle("lc08_det_car",0) ~= "#PLAYER#") then
		mission_help_table_nag( "lc08_goto_garage" )
		return
	end
	
	trigger_disable( "lc08_garage" )
	on_trigger("", "lc08_garage" )
	remove_marker_trigger( "lc08_garage" )
	lc08_garage_reached = true
end


function lc08_garage_finish()
	if (get_char_in_vehicle("lc08_truck",0) ~= "#PLAYER#") then
		mission_debug( "no vehicle", 5 )
		return
	end
	
	trigger_disable( "lc08_garage" )
	on_trigger("", "lc08_garage" )
	remove_marker_trigger( "lc08_garage" )
	lc08_garage_reached = true
end

function lc08_station_arrival()
	if( lc08_evidence_reached ) then --reentering the trigger during defense
		hud_timer_set( lc08_remainder_time, "lc08_defense_timer" )
		lc08_outside_perimeter = false
	else --entering for the first time
		trigger_disable( "lc08_defense_perimeter" )
		mission_help_table( "lc08_park_car" )
	end
	
	on_trigger_exit( "lc08_perimeter_exit", "lc08_defense_perimeter" )
	on_trigger( "", "lc08_defense_perimeter" )
end

function lc08_notoriety_thread()
	local min_level = 2
	local time = LC08_DEFENSE_TIMER

	while( time > 0 ) do
		if (not lc08_outside_perimeter) then
			time = time - delay_do() * 1000
			mission_debug( time, 0, 4 )
			
			local notoriety = 5 - (time / LC08_DEFENSE_TIMER) * (5 - min_level)

			notoriety_set( "police", notoriety )
		end
	
		thread_yield()
	end
	
	notoriety_set_min( "police", 5 )
end

function lc08_perimeter_exit()
	lc08_remainder_time = hud_timer_get_remainder()
	
	on_trigger_exit( "", "lc08_defense_perimeter" )
	on_trigger( "lc08_station_arrival", "lc08_defense_perimeter" )
	
	hud_timer_set( LC08_LEFT_PERIMETER_TIMER, "lc08_perimeter_failure" )
	mission_help_table( "lc08_abandoning" )
	lc08_outside_perimeter = true
end

function lc08_evidence_arrival()
	if (get_char_in_vehicle("lc08_det_car",0) ~= "#PLAYER#") then
		mission_debug( "no vehicle", 5 )
		return
	end
	
	hud_timer_stop()
	vehicle_stop("#PLAYER#")
	set_unjackable_flag("lc08_det_car", true)
	vehicle_exit("#PLAYER#")
	trigger_disable( "lc08_police_station" )
	lc08_evidence_reached = true
end

function lc08_evidence_leave()
	if (get_char_in_vehicle("lc08_det_car",0) ~= "#PLAYER#") then
		mission_debug( "no vehicle", 5 )
		return
	end
	
	trigger_enable( "lc08_police_station" )
	lc08_evidence_reached = false
end

function lc08_defense_timer()
	hud_timer_stop()
	lc08_defense_successful = true
end

function lc08_truck_enter()
	mission_debug( "cant enter vehicle" )
	mission_help_table_nag( "lc08_too_soon" )
	vehicle_exit( "#PLAYER#" )
end

function lc08_truck_enter2()
	remove_marker_vehicle( "lc08_truck" )
	trigger_enable( "lc08_garage" )
end

function lc08_truck_exit()
	add_marker_vehicle( "lc08_truck", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )
	trigger_disable( "lc08_garage" )
end

function lc08_det_car_exit()
	add_marker_vehicle( "lc08_det_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )
	
	if( lc08_garage_reached ) then
		mission_help_table_nag( "lc08_use_car" )
		trigger_disable( "lc08_police_station" )
	else
		mission_help_table_nag( "lc08_use_car" )
		trigger_disable( "lc08_garage" )
	end
	
end

function lc08_det_car_enter()
	remove_marker_vehicle( "lc08_det_car" )
	
	if( lc08_garage_reached ) then
		mission_help_table_nag("lc08_goto_station")
		trigger_enable( "lc08_police_station" )
	else
		mission_help_table_nag("lc08_goto_garage")
		trigger_enable( "lc08_garage" )
	end
end

function lc08_timer_expired()
	if (not lc08_blowup_car()) then
		delay(3)
		mission_end_failure( "lc08", "lc08_fail_timer" )
	end
end

function lc08_blowup_car()
	hud_timer_stop()
	vehicle_detonate("lc08_det_car")
	
	-- no bombs in the car, mission fails
	if (not lc08_garage_reached) then
		return false
	end
	
	-- not close enough to police station, mission fails
	if (get_dist_vehicle_to_nav("lc08_det_car", "lc08_police_station") > 10.0) then
		return false	
	else
		delay(0.3)
		lc08_evidence_reached = true
		mesh_hide("lc08_fakewall")
		--mesh_show("lc08_rubble")
		return true
	end
end

function lc08_vehicle_damage()
	damage_indicator_off()
	if (not lc08_blowup_car()) then
		delay(3)
		if (lc08_garage_reached) then
			mission_end_failure( "lc08", "lc08_fail_damage" )
		else
			mission_end_failure( "lc08", "lc08_fail_no_explosives" )
		end
	end
end

function lc08_defense_failure()
	on_vehicle_destroyed( "", "lc08_truck" )
	vehicle_detonate( "lc08_truck" )
	mission_end_failure( "lc08", "lc08_fail_defense" )
end

function lc08_perimeter_failure()
	on_vehicle_destroyed( "", "lc08_truck" )
	vehicle_detonate( "lc08_truck" )
	mission_end_failure( "lc08", "lc08_fail_abandon" )
end

function lc08_truck_destroyed()
	mission_end_failure( "lc08", "lc08_fail_truck" )
end