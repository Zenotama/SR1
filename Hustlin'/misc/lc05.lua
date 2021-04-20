-- Global Variables------

LC05_TIME_TO_DEAL_START = 5 * 60 * 1000
LC05_TRANSACTION_TIME = 3 * 60 * 1000
LC05_REQUIRED_HITS = 3
LC05_NUM_COLUMBIANS = 5

LC05_HIT_GROUP = {  "lc05_columbian1","lc05_columbian2","lc05_columbian3","lc05_columbian4","lc05_columbian5",
					"lc05_sniper01", "lc05_sniper02", "lc05_sniper03",
					"lc05_escort1_driver","lc05_escort1_pass","lc05_escort2_driver","lc05_escort2_pass",
					"lc05_escort3_driver","lc05_escort3_pass","lc05_Hector","lc05_lieutenant1","lc05_lieutenant2" }

LC05_SNIPERS = {"lc05_escort1_driver","lc05_escort1_pass","lc05_escort2_driver","lc05_escort2_pass",
					"lc05_escort3_driver","lc05_escort3_pass"}
					
lc05_dude_out_threads = {}
lc05_vehicle_threads = {}
lc05_snipers_dead = 0

lc05_total_hits = 0
lc05_deal = false
lc05_started = false

lc05_sniper_threads = {}
-- FUNCTIONS ----------------------------

function lc05_cleanup()
	ambient_cop_spawn_enable()
	hud_timer_stop()
	if (human_check_resource_loaded("lc05_Hector")) then
		remove_marker_npc( "lc05_Hector" )
		character_hide( "lc05_Hector" )
	end
	notoriety_reset("los_carnales")
	objective_text_clear()

	local table_size = sizeof_table( LC05_HIT_GROUP )
	for i=1,table_size,1 do
		on_death( "", LC05_HIT_GROUP[i] )
		on_detection( "", LC05_HIT_GROUP[i] )
		on_entered_water("", LC05_HIT_GROUP[i] )
		remove_marker_npc(LC05_HIT_GROUP[i])
	end

	trigger_disable( "lc05_building_entrance" )
	on_trigger( "", "lc05_building_entrance" )
	remove_marker_trigger( "lc05_building_entrance" )

	trigger_disable( "lc05_mission_end" )
	on_trigger( "", "lc05_mission_end" )
	remove_marker_trigger( "lc05_mission_end" )

	trigger_disable( "lc05_hitman_perch" )
	on_trigger( "", "lc05_hitman_perch" )
	remove_marker_navpoint( "lc05_hitman_perch" )

	trigger_disable( "lc05_detection" )
	on_trigger( "", "lc05_detection" )

	release_to_world( "lc05_hit_group" )
	
	on_trigger("", "lc05_leave_roof")
	
	--gang_force_spawn( "Los Carnales", false )
	notoriety_reset( "los_carnales" )
	
	trigger_disable( "lc05_landing1" )
	on_trigger( "", "lc05_landing1" )
	remove_marker_trigger( "lc05_landing1" )
	
	trigger_disable( "lc05_landing2" )
	on_trigger( "", "lc05_landing2" )
	remove_marker_trigger( "lc05_landing2" )
end

function lc05_success()
	--message("You're the winner!")
	mission_unlock("factory_sh_oil")
	hood_set_owner( "lc_docks01", "Playas" )
	mission_set_next_props_req( "los_carnales", LC06_REQUIRED_PROPS )
	radio_post_event("NEWS_PRES_MONROE_1", false)
end

function lc05_start()
	set_mission_author("Russell Aasland")
	lc05_total_hits = 0
	lc05_deal = false
	lc05_started = false
	lc05_snipers_dead = 0
	
	local table_size = sizeof_table( LC05_HIT_GROUP )
	
	LC05_REQUIRED_HITS = table_size - LC05_NUM_COLUMBIANS
	
	for i=1,table_size,1 do
		on_death( "lc05_required_kill", LC05_HIT_GROUP[i] )
		on_entered_water("lc05_required_kill", LC05_HIT_GROUP[i] )
		on_detection( "lc05_deal_interrupted", LC05_HIT_GROUP[i] )
	end
	
	for i=1, LC05_NUM_COLUMBIANS, 1 do
		on_death( "lc05_deal_interrupted", "lc05_columbian"..i )
	end

	local table_size = sizeof_table( LC05_HIT_GROUP )
	for i=1, table_size , 1 do
		lc05_dude_out_threads[ LC05_HIT_GROUP[i] ] = -1
	end
	
	lc05_vehicle_threads[ 1 ] = -1
	lc05_vehicle_threads[ 2 ] = -1
	lc05_vehicle_threads[ 3 ] = -1
	
	cutscene_in("lc05_scene01")
	set_time_of_day(3,0)
	door_open("shops_sr_city_sr_gun_door0")
	ambient_cop_spawn_disable()
	cutscene_play( "lc05_scene01" )
	inv_item_add( "sniper_rifle", 24 )
	
	if (not is_player_in_vehicle()) then
		inv_item_equip( "sniper_rifle" )
	end
	
	hud_timer_set( LC05_TIME_TO_DEAL_START, "lc05_deal_timer_expire" )
	
	if (is_demo_execution()) then
		teleport("#PLAYER#", "lc05_gps")
	else
		mission_waypoint_add("lc05_gps")
	end
	
	trigger_enable( "lc05_building_entrance" )
	on_trigger( "lc05_building_arrival", "lc05_building_entrance" )
	add_marker_trigger( "lc05_building_entrance", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	delay(2)
	mission_help_table( "lc05_goto_docks" )
	
	while( lc05_total_hits < LC05_REQUIRED_HITS ) do
		--for i,char in pairs(LC05_HIT_GROUP) do
		--	if (get_dist_char_to_nav(char, "lc05_flee_point1") > 75) then
				--thread_new("lc05_required_kill", char)
		--		set_current_hit_points(char, 0) 
		--	end
		--end
		thread_yield()
	end

	--gang_force_spawn( "Los Carnales", true )
	--notoriety_set_min( "los_carnales", 3 )

	--trigger_enable( "lc05_mission_end" )
	--on_trigger( "lc05_church", "lc05_mission_end" )
	--add_marker_trigger( "lc05_mission_end", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )

	delay(5)
	objective_text_clear()
	lc05_church()
	--mission_help_table( "lc05_evade" )
	--mission_help_table( "lc05_goto_church" )
	
	--while( get_current_hood_owner_by_position( "#PLAYER#" ) ~= "Playas" ) do
	--	thread_yield()
	--end
	
	--while( notoriety_spawn_count("Los Carnales","Vehicle") > 0 ) do
	--	thread_yield()
	--end

end

-- CALLBACKS ---------------------------------------------------------------------------

function lc05_landing1()
	trigger_disable( "lc05_landing1" )
	on_trigger( "", "lc05_landing1" )
	remove_marker_trigger( "lc05_landing1" )
	
	
	trigger_enable( "lc05_landing2" )
	on_trigger( "lc05_landing2", "lc05_landing2" )
	add_marker_trigger( "lc05_landing2", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION )
end

function lc05_landing2()
	trigger_disable( "lc05_landing2" )
	on_trigger( "", "lc05_landing2" )
	remove_marker_trigger( "lc05_landing2" )
	
	add_marker_trigger( "lc05_hitman_perch", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION )
end

function lc05_building_arrival()
	trigger_disable( "lc05_building_entrance" )
	on_trigger( "", "lc05_building_entrance" )
	remove_marker_trigger( "lc05_building_entrance" )
	
	mission_help_table("lc05_get_to_roof")
	
	trigger_enable( "lc05_hitman_perch" )
	on_trigger( "lc05_hitman_loc", "lc05_hitman_perch" )
	
	trigger_enable( "lc05_landing1" )
	on_trigger( "lc05_landing1", "lc05_landing1" )
	add_marker_trigger( "lc05_landing1", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION )
	
	mission_waypoint_remove()
	--group_create( "lc05_building_enter", true )
end

function lc05_church()
	cutscene_in("lc05_scene02")
	cutscene_play( "lc05_scene02", true )
	
	mission_end_success( "lc05" )
end

function lc05_required_kill( name )
	on_death("", name)
	on_entered_water("", name)
	for i,sniper in pairs(LC05_SNIPERS) do
		if (name == sniper) then
			lc05_snipers_dead = lc05_snipers_dead + 1
		end
	end
	
	lc05_total_hits = lc05_total_hits + 1
	objective_text( "lc05_objective", LC05_REQUIRED_HITS-lc05_total_hits, LC05_REQUIRED_HITS )
	remove_marker_npc( name )
	lc05_deal_interrupted()
end

function lc05_normal_behavior()
	trigger_disable("lc05_leave_roof")
	notoriety_reset("los_carnales")
	for i, thread in pairs(lc05_sniper_threads) do
		thread_kill(thread)
	end
	
	for i, char in pairs(LC05_HIT_GROUP) do
		aim_at_point(char, "")
		combat_enable(char)
		crouch_stop(char)
		set_perfect_aim(char, false)	
		set_ignore_ai_flag(char, false)
		attack(char)
	end
	
	
end

function lc05_start_dealing()
	if (lc05_started) then
		return
	end
	
	notoriety_set_max("los_carnales", 1)
	
	lc05_started = true
	mission_debug( "deal started", 5 )
	
	lc05_snipers_dead = 0
	
	group_create( "lc05_hit_group", true )
	mission_help_table( "lc05_eliminate" )
	
	on_trigger("lc05_normal_behavior", "lc05_leave_roof")
	trigger_enable("lc05_leave_roof")
	
	character_add_vehicle( "lc05_Hector", "lc05_escort2", 2 )
	character_add_vehicle( "lc05_lieutenant1", "lc05_escort1", 2 )
	character_add_vehicle( "lc05_lieutenant2", "lc05_escort3", 2 )
	lc05_vehicle_threads[1] = thread_new( "lc05_escort_thread", 1 )
	lc05_vehicle_threads[2] = thread_new( "lc05_escort_thread", 2 )
	lc05_vehicle_threads[3] = thread_new( "lc05_escort_thread", 3 )
	
	local table_size = sizeof_table( LC05_HIT_GROUP )
	
	for i=1, LC05_NUM_COLUMBIANS, 1 do
		turn_invulnerable( "lc05_columbian"..i, true )
	end

	for i=LC05_NUM_COLUMBIANS+1, table_size, 1 do
		add_marker_npc( LC05_HIT_GROUP[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
		turn_invulnerable( LC05_HIT_GROUP[i], true )
	end
	
	hud_timer_set( LC05_TRANSACTION_TIME, "lc05_deal_timer_expire" )
	
	lc05_dude_out_threads["lc05_columbian1"] = thread_new( "lc05_dude_move", "lc05_columbian1" )
	lc05_dude_out_threads["lc05_columbian2"] = thread_new( "lc05_dude_move", "lc05_columbian2" )
	lc05_dude_out_threads["lc05_columbian3"] = thread_new( "lc05_dude_move", "lc05_columbian3" )
	lc05_dude_out_threads["lc05_columbian4"] = thread_new( "lc05_dude_move", "lc05_columbian4" )
	lc05_dude_out_threads["lc05_columbian5"] = thread_new( "lc05_dude_move", "lc05_columbian5" )
	
	combat_disable("lc05_columbian1")
	combat_disable("lc05_columbian2")
	combat_disable("lc05_columbian3")
	combat_disable("lc05_columbian4")
	combat_disable("lc05_columbian5")
	
	lc05_dude_out_threads["lc05_sniper01"] = thread_new( "lc05_dude_move", "lc05_sniper01" )
	lc05_dude_out_threads["lc05_sniper02"] = thread_new( "lc05_dude_move", "lc05_sniper02" )
	lc05_dude_out_threads["lc05_sniper03"] = thread_new( "lc05_dude_move", "lc05_sniper03" )

	npc_unholster_best_weapon( "lc05_columbian2" )
	npc_unholster_best_weapon( "lc05_columbian3" )
	npc_unholster_best_weapon( "lc05_columbian4" )
	npc_unholster_best_weapon( "lc05_columbian5" )
	
	npc_unholster_best_weapon( "lc05_sniper01" )
	npc_unholster_best_weapon( "lc05_sniper02" )
	npc_unholster_best_weapon( "lc05_sniper03" )

	trigger_enable( "lc05_detection" )
	on_trigger( "lc05_deal_interrupted", "lc05_detection" )
	
	objective_text( "lc05_objective", LC05_REQUIRED_HITS-lc05_total_hits, LC05_REQUIRED_HITS )
end

function lc05_escort_thread( car_number )
	local car_name = "lc05_escort"..car_number
	
	character_add_vehicle( car_name.."_driver", car_name, 0 )
	character_add_vehicle( car_name.."_pass", car_name, 1 )
	
	vehicle_speed_override( car_name, 20 )
	
	if( vehicle_pathfind_to( car_name, "lc05_obstacle1", "lc05_obstacle2", car_name.."_path", true ) ) then
		vehicle_speed_cancel( car_name )
		
		thread_new( "lc05_dude_out_thread", car_name.."_driver" )
		thread_new( "lc05_dude_out_thread", car_name.."_pass" )
		
		lc05_dude_out_threads[LC05_HIT_GROUP[car_number+14]] = thread_new( "lc05_dude_out_thread", LC05_HIT_GROUP[car_number+14] )
	end
	delay(2)
	lc05_vehicle_threads[car_number] = -1
end

function lc05_dude_out_thread( name )
	vehicle_exit( name )

	if( not lc05_deal ) then
		if (name ~= "lc05_Hector" and name ~= "lc05_lieutenant1" and name ~= "lc05_lieutenant2" and not is_dead(name) ) then
			npc_unholster_best_weapon( name )
		end
	
		move_to( name, name.."_path", 1 )
		turn_to_orient( name, name.."_path" )
	elseif( name == "lc05_Hector" ) then
		thread_new( "lc05_move_wrap", "lc05_Hector", "lc05_flee_point1" )
	elseif( name == "lc05_lieutenant1" ) then
		thread_new( "lc05_move_wrap", "lc05_lieutenant1", "lc05_flee_point2" )
	elseif( name == "lc05_lieutenant2" ) then
		thread_new( "lc05_move_wrap", "lc05_lieutenant2", "lc05_flee_point3" )
	end
	
	lc05_dude_out_threads[name] = -1
end

function lc05_dude_move( name )
	move_to( name, name.."_path", 1 )
	turn_to_orient( name, name.."_path" )
end

function lc05_deal_interrupted()
	if (lc05_deal) then
		return
	end

	mission_debug( "deal interrupted" )
	
	notoriety_set_min("los_carnales", 1)

	lc05_deal = true
	trigger_disable( "lc05_detection" )
	on_trigger( "", "lc05_detection" )

	trigger_disable( "lc05_hitman_perch" )
	remove_marker_navpoint( "lc05_hitman_perch" )

	remove_marker_trigger( "lc05_building_entrance" )

	hud_timer_stop()
	
	local table_size = sizeof_table( LC05_HIT_GROUP )

	for i=1, table_size, 1 do
		if( not is_dead( LC05_HIT_GROUP[i] ) ) then
			thread_kill( lc05_dude_out_threads[ LC05_HIT_GROUP[i] ] )
			--set_attack_enemies_flag( LC05_HIT_GROUP[i], true )
		end
	end
	
	local deal_cancelled = false
	
	for x=1, 3, 1 do
		if (lc05_vehicle_threads[x] ~= -1) then
			thread_kill( lc05_vehicle_threads[x] )
			vehicle_speed_cancel( "lc05_escort"..x )
			vehicle_flee( "lc05_escort"..x )
			deal_cancelled = true
		end
	end
	
	if (deal_cancelled) then
		delay(3)
		mission_end_failure("lc05", "lc05_no_deal")
		return
	end

	if( not is_dead( "lc05_Hector" ) and get_char_in_vehicle( "lc05_escort2", 2 ) == nil) then
		thread_kill( lc05_dude_out_threads["lc05_Hector"] )
		lc05_sniper_threads["lc05_Hector"] = thread_new( "lc05_move_wrap", "lc05_Hector", "lc05_flee_point1" )
	end
	
	if( not is_dead( "lc05_lieutenant1" ) and get_char_in_vehicle( "lc05_escort1", 2 ) == nil) then
		thread_kill( lc05_dude_out_threads["lc05_lieutenant1"] )
		lc05_sniper_threads["lc05_lieutenant1"] = thread_new( "lc05_move_wrap", "lc05_lieutenant1", "lc05_flee_point2" )
	end
	
	if( not is_dead( "lc05_lieutenant2" ) and get_char_in_vehicle( "lc05_escort3", 2 ) == nil) then
		thread_kill( lc05_dude_out_threads["lc05_lieutenant2"] )
		lc05_sniper_threads["lc05_lieutenant2"] = thread_new( "lc05_move_wrap", "lc05_lieutenant2", "lc05_flee_point3" )
	end
	
	for i,sniper in pairs(LC05_SNIPERS) do
		lc05_sniper_threads[sniper] = thread_new("lc05_sniper", i, sniper)
	end

		
	for i=1, LC05_NUM_COLUMBIANS, 1 do
		thread_kill( lc05_dude_out_threads["lc05_columbian"..i] )
		thread_new( "lc05_flee_wrap", "lc05_columbian"..i, "lc05_columbian"..i.."_flee" )
		turn_invulnerable( "lc05_columbian"..i, true )
	end

	npc_unholster_best_weapon("lc05_sniper01")
	npc_unholster_best_weapon("lc05_sniper02")
	npc_unholster_best_weapon("lc05_sniper03")
	
	delay(2)
	force_fire_target("lc05_sniper01", "#PLAYER#", true)
	delay(1)
	force_fire_target("lc05_sniper02", "#PLAYER#", true)
	delay(2)
	force_fire_target("lc05_sniper03", "#PLAYER#", true)
	
	lc05_sniper_threads["rockets"] = thread_new("lc05_rockets")
	--lc05_sniper_threads["sniper"] = thread_new("lc05_sniper_loop")
end

function lc05_rockets()
	while (true) do
		delay(2)
		aim_at_point("lc05_sniper01", "")
		force_fire_target("lc05_sniper01", "#PLAYER#", true)
		aim_at_point("lc05_sniper01", "lc05_snipertarget")
		delay(1)
		aim_at_point("lc05_sniper02", "")
		force_fire_target("lc05_sniper02", "#PLAYER#", true)
		aim_at_point("lc05_sniper02", "lc05_snipertarget")
		delay(2)
		aim_at_point("lc05_sniper03", "")
		force_fire_target("lc05_sniper03", "#PLAYER#", true)
		aim_at_point("lc05_sniper03", "lc05_snipertarget")
		delay(4)
	end
end

function lc05_sniper(i, sniper)
	vehicle_exit(sniper)
	combat_disable(sniper)
	npc_go_idle(sniper)
	move_to(sniper, "lc05_sniperhome"..i, 2, true, false)
	turn_to_nav(sniper, "lc05_snipertarget")
	crouch_start(sniper)
	aim_at_point(sniper, "lc05_snipertarget")
	
	while (not is_dead(sniper)) do
		local delaytime = 6-lc05_snipers_dead
		delay(rand_int(delaytime,delaytime+4))
		aim_at_point(sniper, "")
		crouch_stop(sniper)
		move_to(sniper, "lc05_sniper"..i, 2, true, false)
		turn_to_nav(sniper, "lc05_snipertarget")
		delay(1.2)
		combat_enable(sniper)
		set_perfect_aim(sniper, true)
		npc_unholster_best_weapon(sniper)
		force_fire_target(sniper, "#PLAYER#", true)
		combat_disable(sniper)
		set_perfect_aim(sniper, false)
		move_to(sniper, "lc05_sniperhome"..i, 2, true, false)
		crouch_start(sniper)
		aim_at_point(sniper, "lc05_snipertarget")
	end
end

function lc05_move_wrap(name, nav)
	set_ignore_ai_flag( name, true )
	move_to( name, nav, 2 )
	crouch_start(name)
	--set_ignore_ai_flag( name, false )
	--flee( name, "#PLAYER#", false, true )
end

function lc05_flee_wrap(name, nav)
	set_ignore_ai_flag( name, true )
	move_to( name, nav, 2 )
	--flee_to_navpoint(name, nav, "#PLAYER#", false)
	crouch_start(name)
	set_ignore_ai_flag( name, false )
	character_hide(name)
	--flee( name, "#PLAYER#", false, true )
end

function lc05_hitman_loc()
	trigger_disable( "lc05_landing1" )
	on_trigger( "", "lc05_landing1" )
	remove_marker_trigger( "lc05_landing1" )
	
	trigger_disable( "lc05_landing2" )
	on_trigger( "", "lc05_landing2" )
	remove_marker_trigger( "lc05_landing2" )
	
	trigger_disable( "lc05_hitman_perch" )
	on_trigger( "", "lc05_hitman_perch" )
	remove_marker_navpoint( "lc05_hitman_perch" )

	lc05_start_dealing()
end

-- FAILURE CALLBACKS -------------------------------------------------------------------

function lc05_deal_timer_expire()
	mission_end_failure( "lc05", "lc05_deal_done" )
end