
-- Globals --


LC02_FOLLOW_DISTANCE = 100

lc02_Factory_reached = false
lc02_truck_occupied = false
lc02_hijack_done = false

lc02_Pathing_thread = -1
lc02_notoriety_thread = -1

function lc02_success()
	mission_unlock("factory_sh_steel")
	mission_set_next_props_req( "los_carnales", LC03_REQUIRED_PROPS )
end

function lc02_cleanup()
	set_traffic_density(1) 

	damage_indicator_off()
	mission_waypoint_remove()
	
	lc02_notoriety_thread = -1
	on_vehicle_destroyed("", "lc02_truck" )
	on_vehicle_enter( "", "lc02_truck" )
	on_vehicle_exit( "", "lc02_truck" )
	
	set_ignore_ai_flag( "lc02_Troy", false )

	on_vehicle_destroyed( "", "lc02_ambush1_car1" )
	on_vehicle_destroyed( "", "lc02_ambush1_car2" )
	
	on_death( "", "lc02_ambush1_guy1" )
	on_death( "", "lc02_ambush1_guy3" )
	
	on_dismiss( "", "lc02_Troy" )
	party_dismiss( "lc02_Troy" )
	set_ignore_ai_flag( "lc02_Troy", false )

	remove_marker_vehicle("lc02_truck")
	minimap_icon_remove_navpoint("lc02_truck")
	minimap_icon_remove_navpoint("lc02_safe_house")
	ingame_effect_remove_navpoint("lc02_safe_house")
	
	trigger_disable("lc02_safe_house")
	trigger_disable("lc02_factory")
	trigger_disable("lc02_factory_defenders")
	trigger_disable( "lc02_ambush1_create" )
	trigger_disable( "lc02_ambush1_chase" )
	trigger_disable( "lc02_ambush2_trigger" )
	
	on_tailing_good( "" )
	on_tailing_too_far( "" )
	distance_display_off()
	
	on_trigger( "", "lc02_factory" )
	on_trigger( "", "lc02_safe_house" )
	on_trigger( "", "lc02_factory_defenders" )
	on_trigger( "", "lc02_ambush1_create" )
	on_trigger( "", "lc02_ambush1_chase" )
	on_trigger( "", "lc02_ambush2_trigger" )

	for x=1,12,1 do
		local defender_name = "lc02_departure"..x
		on_take_damage( "", defender_name )
	end

	release_to_world( "lc02_hotwire_car1")
	release_to_world( "lc02_hotwire_car2")
	release_to_world( "lc02_hotwire_driver1")
	release_to_world( "lc02_hotwire_driver2")
	release_to_world( "lc02_hotwire_passenger2")
	group_destroy( "lc02_Group" )
	release_to_world( "lc02_truck_group" )
	release_to_world( "lc02_departure" )
	release_to_world( "lc02_ambush1" )
	release_to_world( "lc02_ambush2" )
	release_to_world( "lc02_attackers" )
	--group_destroy( "lc02_arrival" )
	
	thread_kill(lc02_Pathing_thread)

	notoriety_reset( "los_carnales" )
	notoriety_reset_vehicle_count("Los Carnales")
	
	persona_override_remove_all("HM_LC1")
	persona_override_remove_all("HM_LC2")
	persona_override_remove_all("HM_LC3")
	persona_override_remove_all("WM_LC1")
	persona_override_remove_all("WM_LC2")
	persona_override_remove_all("WM_LC3")
	persona_override_remove_all("HF_LC1")
	persona_override_remove_all("HF_LC2")
	persona_override_remove_all("HF_LC3")
	persona_override_remove_all("WF_LC1")
	persona_override_remove_all("WF_LC2")
	persona_override_remove_all("WF_LC3")
end

function lc02_start()
	set_mission_author("Russell Aasland")
	
	debug_validate_lane( "lc02_path01", "lc02_path02" )
	debug_validate_lane( "lc02_hijack_path1", "lc02_hijack_path2", "lc02_hijack_path3", "lc02_hijack_path4" )

	on_trigger( "lc02_factory_arrival", "lc02_factory" )
	on_trigger( "lc02_hijack_truck", "lc02_factory_defenders" )
	
	notoriety_set_max( "los_carnales", 2 )
	
	lc02_Factory_reached = false
	lc02_truck_occupied = false
	lc02_hijack_done = false

	on_vehicle_destroyed("lc02_mission_failure", "lc02_truck" )
	on_vehicle_enter( "lc02_enter_truck", "lc02_truck" )
	--on_vehicle_exit( "lc02_exit_truck", "lc02_truck" )
		
	cutscene_in("lc02_scene01")
	cutscene_play("lc02_scene01", "lc02_Group")
	teleport("#PLAYER#", "mission_start_lc02")
	
	character_show( "lc02_Troy" )
	party_dismiss( "#FOLLOWER3#" )
	party_add( "lc02_Troy" )
	
	on_dismiss( "lc02_dismiss", "lc02_Troy" )
	on_death( "lc02_death", "lc02_Troy" )
	
	group_create("lc02_truck_group")
	set_unjackable_flag( "lc02_truck", true )
	trigger_enable( "lc02_factory" )
	
	persona_override_human_start( "lc02_Troy", "escort - stripper reacts to hitting human", "TROY_LC2_RUNOVER", 2 )
	persona_override_human_start( "lc02_Troy", "escort - stripper reacts to hitting vehicle", "TROY_LC2_HITOBJECT", 2 )
	
	minimap_icon_add_navpoint("lc02_truck", MINIMAP_ICON_PROTECT_ACQUIRE)
	mission_waypoint_add("lc02_gps")
	
	group_create( "lc02_departure", true )
	for x=1,12,1 do
		local defender_name = "lc02_departure"..x
		npc_unholster_best_weapon( defender_name )
	end
	
	pause_menu_objective_add( "lc02_goto_warehouse" )
	audio_play_for_character( "TROY_LC2_START_1", "lc02_Troy", "voice", false, true )
	mission_help_table_nag( "lc02_goto_warehouse" )
	
	thread_new( "lc02_drive_chatter" )
	
	while( not lc02_Factory_reached ) do
		thread_yield()
	end
	
	vehicle_never_flatten_tires("lc02_truck", true)
	
	persona_override_persona_start("HM_LC1", "threat - alert (solo attack)", "HMLC1_LC2_ATTACK")
	persona_override_persona_start("HM_LC1", "threat - alert (group attack)", "HMLC1_LC2_ATTACK")
	persona_override_persona_start("HM_LC2", "threat - alert (solo attack)", "HMLC2_LC2_ATTACK")
	persona_override_persona_start("HM_LC2", "threat - alert (group attack)", "HMLC2_LC2_ATTACK")
	persona_override_persona_start("HM_LC3", "threat - alert (solo attack)", "HMLC3_LC2_ATTACK")
	persona_override_persona_start("HM_LC3", "threat - alert (group attack)", "HMLC3_LC2_ATTACK")
	
	persona_override_persona_start("WM_LC1", "threat - alert (solo attack)", "WMLC1_LC2_ATTACK")
	persona_override_persona_start("WM_LC1", "threat - alert (group attack)", "WMLC1_LC2_ATTACK")
	persona_override_persona_start("WM_LC2", "threat - alert (solo attack)", "WMLC2_LC2_ATTACK")
	persona_override_persona_start("WM_LC2", "threat - alert (group attack)", "WMLC2_LC2_ATTACK")
	persona_override_persona_start("WM_LC3", "threat - alert (solo attack)", "WMLC3_LC2_ATTACK")
	persona_override_persona_start("WM_LC3", "threat - alert (group attack)", "WMLC3_LC2_ATTACK")
	
	persona_override_persona_start("HF_LC1", "threat - alert (solo attack)", "HFLC1_LC2_ATTACK")
	persona_override_persona_start("HF_LC1", "threat - alert (group attack)", "HFLC1_LC2_ATTACK")
	persona_override_persona_start("HF_LC2", "threat - alert (solo attack)", "HFLC2_LC2_ATTACK")
	persona_override_persona_start("HF_LC2", "threat - alert (group attack)", "HFLC2_LC2_ATTACK")
	persona_override_persona_start("HF_LC3", "threat - alert (solo attack)", "HFLC3_LC2_ATTACK")
	persona_override_persona_start("HF_LC3", "threat - alert (group attack)", "HFLC3_LC2_ATTACK")
	
	persona_override_persona_start("WF_LC1", "threat - alert (solo attack)", "WFLC1_LC2_ATTACK")
	persona_override_persona_start("WF_LC1", "threat - alert (group attack)", "WFLC1_LC2_ATTACK")
	persona_override_persona_start("WF_LC2", "threat - alert (solo attack)", "WFLC2_LC2_ATTACK")
	persona_override_persona_start("WF_LC2", "threat - alert (group attack)", "WFLC2_LC2_ATTACK")
	persona_override_persona_start("WF_LC3", "threat - alert (solo attack)", "WFLC3_LC2_ATTACK")
	persona_override_persona_start("WF_LC3", "threat - alert (group attack)", "WFLC3_LC2_ATTACK")
	
	while( not lc02_hijack_done ) do
		thread_yield()
	end
	
	set_traffic_density(0.2) 

	--remove_marker_vehicle("lc02_truck")
	minimap_icon_add_navpoint("lc02_safe_house", MINIMAP_ICON_LOCATION )
	mission_help_table( "lc02_evade" )
	
	mission_debug( "truck hijacked", 5 )
	on_take_damage( "", "lc02_truck" )
	
	thread_new( "lc02_hijack_path" )
	
	on_trigger( "lc02_ambush1_create", "lc02_ambush1_create" )
	trigger_enable( "lc02_ambush1_create" )
	on_trigger( "lc02_ambush2_start", "lc02_ambush2_trigger" )
	trigger_enable( "lc02_ambush2_trigger" )
	
	while (get_current_hood_owner_by_position( "#PLAYER#" )~="Playas") do
		thread_yield()
	end
	
	mission_debug( "entered home turf", 5 )
	
	notoriety_reset( "los_carnales" )
	thread_kill(lc02_notoriety_thread)
	
	while (notoriety_spawn_count("Los Carnales", "Vehicle") > 0) do
		thread_yield()
	end
	
	mission_help_table( "lc02_goto_garage" )
	mission_debug( "lost all notoriety spawns", 5 )
end

function lc02_drive_chatter()
	while (not is_player_in_vehicle() ) do
		thread_yield()
	end

	delay( 5 )
	audio_play_for_character( "TROY_LC2_GETTRUCK_1", "lc02_Troy", "voice", false, true )
	delay( rand_float( 15, 20 ) )
	audio_play_for_character( "TROY_LC2_TRUCKCHAT_1", "lc02_Troy", "voice", false, true )
	delay( rand_float( 8, 12 ) )
	audio_play_for_character( "TROY_LC2_TRUCKCHAT_2", "lc02_Troy", "voice", false, true )
end

function lc02_factory_arrival()
	lc02_Factory_reached = true
	trigger_disable( "lc02_factory" )

	trigger_enable( "lc02_factory_defenders" )

	minimap_icon_remove_navpoint("lc02_truck")
	
	add_marker_vehicle("lc02_truck", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
end

function lc02_hijack_truck()
	trigger_disable("lc02_factory_defenders")
	mission_waypoint_remove()
	
	persona_override_human_stop_all( "lc02_Troy" )
	
	if (is_player_in_vehicle()) then
		player_controls_disable()
		vehicle_stop("#PLAYER#")	
	end
	
	npc_revive("lc02_Troy")
	turn_invulnerable("lc02_Troy", false)
	
	audio_play_for_character( "TROY_LC2_SEETRUCK_1", "lc02_Troy", "voice", false, true )
	mission_help_table( "lc02_hijack_truck" )

	
	follower_make_independent( "lc02_Troy" )
	
	while (not human_is_ready("lc02_Troy")) do
		thread_yield()
	end

	if (is_player_in_vehicle()) then
		vehicle_exit( "lc02_Troy" )
	end
	
	player_controls_enable()
	
	vehicle_disable_flee("lc02_truck", true)
	vehicle_disable_chase("lc02_truck", true)
	--turn_invulnerable("lc02_Troy", false)
	damage_indicator_on("lc02_truck", 0.0, "lc02_truck")
	
	vehicle_supress_engine_audio("lc02_truck", true)
	
	while (get_char_in_vehicle("lc02_truck", 0) ~= "lc02_Troy" ) do
		set_unjackable_flag( "lc02_truck", false )
		vehicle_enter( "lc02_Troy", "lc02_truck", 0 )
		set_unjackable_flag( "lc02_truck", true )
		thread_yield()
	end
	
	notoriety_set_min( "los_carnales", 2 )
	
	set_ignore_ai_flag( "lc02_Troy", true )
		
	for x=1, 12, 1 do
		local dude_name = "lc02_departure"..x
		
		attack_safe( dude_name )
	end
	
	thread_new("lc02_betsy_attack")

	audio_play_for_character( "TROY_LC2_ENTERTRUCK_1", "lc02_Troy", "voice", false, true )
	
	audio_play_for_character( "TROY_LC2_HOTWIRE_1", "lc02_Troy", "voice", false, true )
	audio_play_for_navpoint( "SFX_TRUCK_HOTWIRE_1", "lc02_sfx", "foley" )
	delay(2)
	audio_play_for_character( "TROY_LC2_HOTWIRE_2", "lc02_Troy", "voice", false, true )
	audio_play_for_navpoint( "SFX_TRUCK_HOTWIRE_2", "lc02_sfx", "foley" )
	delay(4)
	audio_play_for_character( "TROY_LC2_HOTWIRE_3", "lc02_Troy", "voice", false, true )
	audio_play_for_navpoint( "SFX_TRUCK_HOTWIRE_3", "lc02_sfx", "foley" )
	delay(1)
	vehicle_supress_engine_audio("lc02_truck", false)
	delay(1)
	audio_play_for_character( "TROY_LC2_TRUCKRUNNING_1", "lc02_Troy", "voice", false, true )
	
	notoriety_set_max( "los_carnales", 2 )
	
	lc02_hijack_done = true
end

function lc02_betsy_attack()
	create_group("lc02_attackers", true)
	character_add_vehicle("lc02_hotwire_driver1", "lc02_hotwire_car1", 0)
	character_add_vehicle("lc02_hotwire_driver2", "lc02_hotwire_car2", 0)
	character_add_vehicle("lc02_hotwire_passenger2", "lc02_hotwire_car2", 1)
	vehicle_chase("lc02_hotwire_car1", "#PLAYER#")
	delay(5)
	vehicle_chase("lc02_hotwire_car2", "#PLAYER#")
end

function lc02_notoriety_cars(x)
	local car = "lc02_notoriety_car"..x
	local driver = "lc02_notoriety_driver"..x
	local passenger = "lc02_notoriety_passenger"..x
	
	vehicle_show(car)
	character_show(driver)
	character_show(passenger)
	character_add_vehicle(driver, car, 0)
	character_add_vehicle(passenger, car, 1)
	while (not teleport_vehicle_notoriety_pos(car)) do
		delay(2)
	end
	
	vehicle_chase(car, "lc02_Troy", false, false, true)
	
	notoriety_set_desired_vehicle_count( "Los Carnales", 0 )
	
	while (get_dist_char_to_vehicle("#PLAYER#", car) < 200) do
		if (is_vehicle_destroyed(car)) then
			break
		end
		
		if (is_dead(driver)) then
			break
		end
		
		delay(1)
	end
	
	notoriety_set_desired_vehicle_count( "Los Carnales", -1 )
end

function lc02_notoriety()
	lc02_notoriety_cars(1)
	delay(45)
	lc02_notoriety_cars(2)
	delay(56)
	lc02_notoriety_cars(3)
end

function lc02_hijack_path()

	set_ignore_ai_flag( "lc02_Troy", true )
	vehicle_should_obey_traffic( "lc02_truck", false )
	
	distance_display_on( "lc02_Troy", 0, LC02_FOLLOW_DISTANCE, 0, LC02_FOLLOW_DISTANCE )
	on_tailing_good( "lc02_follow_good" )
	on_tailing_too_far( "lc02_follow_far" )
	
	while (not vehicle_turret_base_to("lc02_truck","lc02_hijack_path1", false )) do
		mission_debug( "pathing 1 failed", 0, 0 )
		thread_yield()
	end
	
	lc02_notoriety_thread = thread_new("lc02_notoriety")
	
	while (not vehicle_pathfind_to( "lc02_truck", "lc02_hijack_mid2", "lc02_hijack_path2", true, false )) do
		mission_debug( "off-road pathing 1 failed", 0, 0 )
		thread_yield()
	end

	while (not vehicle_turret_base_to("lc02_truck","lc02_hijack_path3","lc02_hijack_path4", false )) do
		mission_debug( "pathing to", 0, 0 )
		thread_yield()
	end
	
	while (not vehicle_pathfind_to( "lc02_truck", "lc02_hijack_path5", true, true )) do
		mission_debug( "pathing 1 failed", 0, 0 )
		thread_yield()
	end
	
	while (get_dist_char_to_char("#PLAYER#", "lc02_Troy") > 30) do
		thread_yield()
	end
	
	audio_play_for_character( "TROY_LC2_WIN_1", "lc02_Troy", "voice", false, true )
	
	cutscene_in("lc02_scene02")
	vehicle_hide("lc02_truck")
	cutscene_play( "lc02_scene02", true )

	mission_end_success("lc02")

end

function lc02_enter_truck()
	--[[remove_marker_vehicle("lc02_truck")
	minimap_icon_add_navpoint("lc02_safe_house", MINIMAP_ICON_LOCATION )
	mission_help_table( "lc02_evade" )]]

	vehicle_exit( "#PLAYER#" )
end

function lc02_exit_truck()
	minimap_icon_remove_navpoint( "lc02_safe_house" )
	add_marker_vehicle("lc02_truck", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	mission_help_table( "lc02_reenter_truck" )
end

function lc02_follow_far()
	vehicle_speed_override( "lc02_truck", 0 )
	mission_help_table_nag("lc02_truck_stop")
end

function lc02_follow_good()
	vehicle_speed_cancel( "lc02_truck" )
	mission_debug( "good" )
end

function lc02_dismiss()
	mission_end_failure("lc02", "lc02_abandon")
end

function lc02_death()
	mission_end_failure("lc02", "lc07_fail_troy")
end

function lc02_mission_failure()
	mission_end_failure("lc02", "lc02_fail_truck")
end

LC02_TOTAL_AMBUSH1_COUNT = 2
lc02_ambush_count = 0
function lc02_ambush1_create(triggerer)
	if (triggerer~="#PLAYER#" and triggerer~="lc02_Troy" ) then
		return
	end
	
	lc02_ambush_count = 0

	trigger_disable( "lc02_ambush1_create" )
	notoriety_set_desired_vehicle_count( "Los Carnales", 0 )
	
	group_create( "lc02_ambush1", true )
	
	character_add_vehicle( "lc02_ambush1_guy1", "lc02_ambush1_car1", 0 )
	character_add_vehicle( "lc02_ambush1_guy2", "lc02_ambush1_car1", 1 )
	character_add_vehicle( "lc02_ambush1_guy3", "lc02_ambush1_car2", 0 )
	character_add_vehicle( "lc02_ambush1_guy4", "lc02_ambush1_car2", 1 )
	
	on_vehicle_destroyed( "lc02_ambush_car_died", "lc02_ambush1_car1" )
	on_vehicle_destroyed( "lc02_ambush_car_died", "lc02_ambush1_car2" )

	on_death( "lc02_ambush_car_died", "lc02_ambush1_guy1" )
	on_death( "lc02_ambush_car_died", "lc02_ambush1_guy3" )

	on_trigger( "lc02_ambush1_start", "lc02_ambush1_chase" )
	trigger_enable( "lc02_ambush1_chase" )
end

function lc02_ambush1_start(triggerer)
	if (triggerer~="#PLAYER#" and triggerer~="lc02_Troy" ) then
		return
	end
	
	vehicle_chase( "lc02_ambush1_car1", "lc02_Troy", false, false, true )
	vehicle_chase( "lc02_ambush1_car2", "lc02_Troy", false, false, true )
end

function lc02_ambush_car_died( name )
	lc02_ambush_count = lc02_ambush_count + 1
	
		--remove callback from whoever died
	
		--remove callback from the matching driver or vehicle
	if (name == "lc02_ambush1_guy1" ) then
		on_death( "", name )
		on_vehicle_destroyed( "", "lc02_ambush1_car1" )
	elseif (name == "lc02_ambush1_guy3" ) then
		on_death( "", name )
		on_vehicle_destroyed( "", "lc02_ambush1_car2" )
	elseif (name == "lc02_ambush1_car1" ) then
		on_vehicle_destroyed( "", name )
		on_death( "", "lc02_ambush1_guy1" )
	elseif (name == "lc02_ambush1_car2" ) then
		on_vehicle_destroyed( "", name )
		on_death( "", "lc02_ambush1_guy3" )
	end
end

function lc02_ambush2_start(triggerer)
	if (triggerer~="#PLAYER#" and triggerer~="lc02_Troy" ) then
		return
	end

	trigger_disable( "lc02_ambush2_trigger" )
	mission_debug( "ambush2 start", 10 )
	
	notoriety_set_desired_vehicle_count( "Los Carnales", 0 )
	group_create( "lc02_ambush2", true )
	
	for x=1, 4, 1 do
		local dude_name = "lc02_ambush2_guy"..x
	
		set_attack_enemies_flag( dude_name, true )
		npc_unholster_best_weapon( dude_name )
	end
	
	local troy_dist = get_dist_char_to_nav( "lc02_Troy", "lc02_ambush2_trigger" )
	local player_dist = get_dist_char_to_nav( "#PLAYER#", "lc02_ambush2_trigger" )
	
		--wait for them to get close to the roadblock
	while ((troy_dist > 75) and (player_dist > 75)) do
		thread_yield()

		troy_dist = get_dist_char_to_nav( "lc02_Troy", "lc02_ambush2_trigger" )
		player_dist = get_dist_char_to_nav( "#PLAYER#", "lc02_ambush2_trigger" )
	end

		--wait to get away from the roadblock before re-enabling the notoriety vehicles
	while ((troy_dist <= 75) or (player_dist <= 75)) do
		thread_yield()

		troy_dist = get_dist_char_to_nav( "lc02_Troy", "lc02_ambush2_trigger" )
		player_dist = get_dist_char_to_nav( "#PLAYER#", "lc02_ambush2_trigger" )
	end
	
	mission_debug( "ambush2 end", 10 )
	
	while (lc02_ambush_count < LC02_TOTAL_AMBUSH1_COUNT) do
		thread_yield()
	end
	
	notoriety_set_desired_vehicle_count( "Los Carnales", -1 )
end