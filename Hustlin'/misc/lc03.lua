-- Global Variables------

lc03_MAX_RAND_PATH_POINTS = 24
lc03_NUM_VANS = 3
lc03_NUM_CARS = 5
lc03_AREA_TIMER = 20 * 1000
LC03_TOTAL_TARGETS = (lc03_NUM_CARS*2) + (lc03_NUM_VANS*2)

lc03_pathing_threads={}
lc03_car_done={}
lc03_targets_killed = 0
lc03_last_script_car = "No Car"

-- FUNCTIONS ----------------------------

function lc03_cleanup()
	spawn_set_gang_clash_team("") 
	special_spawns_enable(true)
	for x=1,lc03_NUM_CARS,1 do
		local car_name = "lc03_car0"..x
		
		remove_marker_npc( car_name.."_driver")
		remove_marker_npc( car_name.."_passenger")
		
		on_death( "", car_name.."_driver" )
		on_death( "", car_name.."_passenger" )
		on_vehicle_destroyed("", car_name)
		
		on_vehicle_enter( "", car_name )
		on_damage( "", car_name, 0 )
	end

	for x=1,lc03_NUM_VANS,1 do
		local car_name = "lc03_van0"..x
		
		remove_marker_npc( car_name.."_driver" )
		remove_marker_npc( car_name.."_pass01" )
		--remove_marker_npc( car_name.."_pass02" )
		--remove_marker_npc( car_name.."_pass03" )
		
		on_death( "", car_name.."_driver" )
		on_death( "", car_name.."_pass01" )
		--on_death( "", car_name.."_pass02" )
		--on_death( "", car_name.."_pass03" )
		--on_vehicle_destroyed("", car_name)
		
		--on_vehicle_enter( "", car_name )
		--on_damage( "", car_name, 0 )
	end

	hud_timer_stop()
	objective_text_clear()
	notoriety_reset( "los_carnales" )
	
	release_to_world("lc03_carnales")
end

function lc03_success()
	mission_set_next_props_req( "los_carnales", LC04_REQUIRED_PROPS )
end

function lc03_chase(car_name, saint_prefix, x)
	while (get_dist_char_to_vehicle("#PLAYER#", car_name) > 150) do
		thread_yield()
	end
	
	character_show(saint_prefix.."_1")
	character_show(saint_prefix.."_2")
	character_show(car_name.."_driver")
	character_show(car_name.."_passenger")
	vehicle_show(saint_prefix.."_car")
	vehicle_show(car_name)
			
	
	vehicle_disable_flee(saint_prefix.."_car", false)
	vehicle_disable_chase(saint_prefix.."_car", false)
	set_ignore_ai_flag(saint_prefix.."_1", false)
	set_ignore_ai_flag(saint_prefix.."_2", false)
	vehicle_disable_flee(car_name, false)
	vehicle_disable_chase(car_name, false)
	set_ignore_ai_flag(car_name.."_driver", false)
	set_ignore_ai_flag(car_name.."_passenger", false)
	
	
	vehicle_speed_override(car_name, 35)
	--vehicle_flee(car_name, car_name.."_driver")
	vehicle_chase(saint_prefix.."_car", car_name.."_driver", true, false, true)
	
	local pathing = true
	local current = -1
	
	while (pathing) do
		
		local random = current;
		while (random == current) do
			random = rand_int(0,lc03_MAX_RAND_PATH_POINTS)
		end
		
		pathing = vehicle_turret_base_to( car_name, lc03_nav_name(random), false)
		
	end
end

function lc03_standoff(car_name, saint_prefix, x)
	turn_invulnerable(car_name.."_driver", true)
	turn_invulnerable(car_name.."_passenger", true)
	
	while (get_dist_char_to_vehicle("#PLAYER#", car_name) > 150) do
		thread_yield()
	end
	
	character_show(car_name.."_driver")
	character_show(car_name.."_passenger")
			
	set_ignore_ai_flag(car_name.."_driver", false)
	set_ignore_ai_flag(car_name.."_passenger", false)
	
	if (x~=2) then
		character_show(saint_prefix.."_1")
		character_show(saint_prefix.."_2")
		set_ignore_ai_flag(saint_prefix.."_1", false)
		set_ignore_ai_flag(saint_prefix.."_2", false)
				
		attack(saint_prefix.."_1", car_name.."_driver")
		attack(saint_prefix.."_2", car_name.."_passenger")
	end
	
	lc03_pathing_threads[x] = -1
end

function lc03_van_standoff(car_name, x)
	character_hide(car_name.."_driver")
	character_hide(car_name.."_pass01")
	set_ignore_ai_flag(car_name.."_driver", true)
	set_ignore_ai_flag(car_name.."_pass01", true)
	turn_invulnerable(car_name.."_driver", true)
	turn_invulnerable(car_name.."_pass01", true)
	
	if (x == 3) then
		character_hide(car_name.."_target1")
		character_hide(car_name.."_target2")
		character_hide(car_name.."_target3")
		character_hide(car_name.."_target4")
		
		character_hide("lc03_car02_passenger")
		character_hide("lc03_car02_driver")
		
		set_ignore_ai_flag(car_name.."_target1", true)
		set_ignore_ai_flag(car_name.."_target2", true)
		set_ignore_ai_flag(car_name.."_target3", true)
		set_ignore_ai_flag(car_name.."_target4", true)
		turn_invulnerable(car_name.."_target1", true)
	else
		if (x~=1) then
			character_hide(car_name.."_target")
			set_ignore_ai_flag(car_name.."_target", true)
			turn_invulnerable(car_name.."_target", true)
		end
	end
	
	while (get_dist_char_to_char("#PLAYER#", car_name.."_driver") > 150) do
		thread_yield()
	end
	
	mission_debug("start standoff!")
		
	if (x == 3) then
		character_show(car_name.."_target1")
		character_show(car_name.."_target2")
		character_show(car_name.."_target3")
		character_show(car_name.."_target4")
		
		set_ignore_ai_flag(car_name.."_target1", false)
		set_ignore_ai_flag(car_name.."_target2", false)
		set_ignore_ai_flag(car_name.."_target3", false)
		set_ignore_ai_flag(car_name.."_target4", false)
	else
		if (x~=1) then
			character_show(car_name.."_target")

			set_ignore_ai_flag(car_name.."_target", false)
		end
	end
	
	character_show(car_name.."_pass01")		
	set_ignore_ai_flag(car_name.."_pass01", false)
		
	if (x==3) then
		attack(car_name.."_pass01", car_name.."_target1")
		character_show("lc03_car02_passenger")
		character_show("lc03_car02_driver")
		attack("lc03_car02_passenger", car_name.."_target1")
		attack("lc03_car02_driver", car_name.."_target1")
	else
		if (x~=1) then
			attack(car_name.."_pass01", car_name.."_target")
		else
			attack(car_name.."_pass01", "lc03_van02_target")
		end
	end
	
	character_show(car_name.."_driver")
	
	while (get_dist_char_to_char("#PLAYER#", car_name.."_driver") > 50) do
		thread_yield()
	end
	
	mission_debug("start standoff pt 2!")
	
	set_ignore_ai_flag(car_name.."_driver", false)
	if (x==3) then
		turn_vulnerable(car_name.."_target1")
		mission_debug("force throw!")
		while (not is_dead(car_name.."_driver")) do
			force_throw(car_name.."_driver", "lc03_molotov_target"..rand_int(1,4), 30, rand_int(6,8))
			delay(1)
		end
		--attack(car_name.."_driver", car_name.."_target1")
	else
		if (x~=1) then
			turn_vulnerable(car_name.."_target")
			force_fire(car_name.."_driver", car_name.."_target", true)
			attack(car_name.."_driver", car_name.."_target")
		end
	end
end	

function lc03_setup_car_pf(x)
	local car_name = "lc03_car0"..x
	local saint_prefix = "lc03_saint0"..x
	
	character_show( car_name.."_driver" )
	character_show( car_name.."_passenger" )
	vehicle_show( car_name )
	
	on_death( "lc03_dude_died", car_name.."_driver" )
	on_death( "lc03_dude_died", car_name.."_passenger" )
	
	add_marker_npc( car_name.."_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc( car_name.."_passenger", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	
	set_attack_peds_flag( car_name.."_driver", true)
	set_attack_peds_flag( car_name.."_passenger", true)
	
	if (x ~= 2) then
		on_vehicle_destroyed(car_name.."_death", car_name)
		character_add_vehicle(car_name.."_driver", car_name, 0)
		character_add_vehicle(car_name.."_passenger", car_name, 1)
		vehicle_supress_npc_exit( car_name, true )
		on_vehicle_enter( "lc03_car_jacked", car_name )
		on_take_damage( "lc03_car_damaged", car_name )
	
		vehicle_should_obey_traffic( car_name, false )
		on_damage( "lc03_on_fire", car_name, .25 )
		
		
		vehicle_disable_flee(car_name, true)
		vehicle_disable_chase(car_name, true)
			
		if (x~=4) then
			if (x==3) then
				lc03_pathing_threads[3] = thread_new("lc03_pathing",car_name,x)
			
				-- vehicle 1 actually is in a convoy with vehicle 3
				vehicle_speed_override(car_name, 30)
				vehicle_chase("lc03_car01", car_name.."_driver", false, false, false)
			elseif (x==5) then
				lc03_pathing_threads[5] = thread_new("lc03_pathing",car_name,x)
			else
				lc03_pathing_threads[x] = -1
			end
		else
			vehicle_disable_flee(saint_prefix.."_car", true)
			vehicle_disable_chase(saint_prefix.."_car", true)
			
			character_add_vehicle(saint_prefix.."_1", saint_prefix.."_car", 0)
			character_add_vehicle(saint_prefix.."_2", saint_prefix.."_car", 1)
			vehicle_supress_npc_exit( saint_prefix.."_car", true )
			set_ignore_ai_flag(saint_prefix.."_1", true)
			set_ignore_ai_flag(saint_prefix.."_2", true)
			
			set_ignore_ai_flag(car_name.."_driver", true)
			set_ignore_ai_flag(car_name.."_passenger", true)
			
			character_hide(saint_prefix.."_1")
			character_hide(saint_prefix.."_2")
			character_hide(car_name.."_driver")
			character_hide(car_name.."_passenger")
			vehicle_hide(saint_prefix.."_car")
			vehicle_hide(car_name)
		
			lc03_pathing_threads[4] = thread_new("lc03_chase",car_name,saint_prefix,x)
		end
	else
		set_ignore_ai_flag(car_name.."_driver", true)
		set_ignore_ai_flag(car_name.."_passenger", true)
		
		lc03_pathing_threads[x] = thread_new("lc03_standoff", car_name,saint_prefix,x)
	end
	
	lc03_car_done[x] = false
end

function lc03_setup_van(x)
	local car_name = "lc03_van0"..x
	
	character_show( car_name.."_driver" )
	character_show( car_name.."_pass01" )
	
	on_death( "lc03_dude_died", car_name.."_driver" )
	on_death( "lc03_dude_died", car_name.."_pass01" )
		
	add_marker_npc( car_name.."_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc( car_name.."_pass01", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		
	set_attack_peds_flag( car_name.."_driver", true)
	set_attack_peds_flag( car_name.."_pass01", true)
	
	thread_new("lc03_van_standoff", car_name,x)
end

function lc03_start()
	spawn_set_gang_clash_team("Los Carnales") 
	set_mission_author("Russell Aasland")

		--validation test for the path points.
		--used minimap_icon_remove_navpoint since 
	for i=0, lc03_MAX_RAND_PATH_POINTS, 1 do
		debug_validate_lane( lc03_nav_name(i) )
	end
	
	--hood_set_owner("ts_saintsrow01", "Playas")
	--hood_set_owner("ts_saintsrow02", "Playas")
	--hood_set_owner("ts_saintsrow03", "Playas")
	
	persona_override_persona_start( "HM_LC1", "threat - alert (group attack)", "HMLC1_LC3_ATTACK" )
	persona_override_persona_start( "HM_LC2", "threat - alert (group attack)", "HMLC2_LC3_ATTACK" )
	persona_override_persona_start( "HM_LC3", "threat - alert (group attack)", "HMLC3_LC3_ATTACK" )
	persona_override_persona_start( "WM_LC1", "threat - alert (group attack)", "WMLC1_LC3_ATTACK" )
	persona_override_persona_start( "WM_LC2", "threat - alert (group attack)", "WMLC2_LC3_ATTACK" )
	persona_override_persona_start( "WM_LC3", "threat - alert (group attack)", "WMLC3_LC3_ATTACK" )
	
	persona_override_persona_start( "HF_LC1", "threat - alert (group attack)", "HMLC1_LC3_ATTACK" )
	persona_override_persona_start( "HF_LC2", "threat - alert (group attack)", "HMLC2_LC3_ATTACK" )
	persona_override_persona_start( "HF_LC3", "threat - alert (group attack)", "HMLC3_LC3_ATTACK" )
	persona_override_persona_start( "WF_LC1", "threat - alert (group attack)", "WMLC1_LC3_ATTACK" )
	persona_override_persona_start( "WF_LC2", "threat - alert (group attack)", "WMLC2_LC3_ATTACK" )
	persona_override_persona_start( "WF_LC3", "threat - alert (group attack)", "WMLC3_LC3_ATTACK" )

	persona_override_persona_start( "HM_LC1", "threat - damage received (firearm)", "HMLC1_LC3_DAMAGE" )
	persona_override_persona_start( "HM_LC2", "threat - damage received (firearm)", "HMLC2_LC3_DAMAGE" )
	persona_override_persona_start( "HM_LC3", "threat - damage received (firearm)", "HMLC3_LC3_DAMAGE" )
	persona_override_persona_start( "WM_LC1", "threat - damage received (firearm)", "WMLC1_LC3_DAMAGE" )
	persona_override_persona_start( "WM_LC2", "threat - damage received (firearm)", "WMLC2_LC3_DAMAGE" )
	persona_override_persona_start( "WM_LC3", "threat - damage received (firearm)", "WMLC3_LC3_DAMAGE" )

	persona_override_persona_start( "HF_LC1", "threat - damage received (firearm)", "HMLC1_LC3_DAMAGE" )
	persona_override_persona_start( "HF_LC2", "threat - damage received (firearm)", "HMLC2_LC3_DAMAGE" )
	persona_override_persona_start( "HF_LC3", "threat - damage received (firearm)", "HMLC3_LC3_DAMAGE" )
	persona_override_persona_start( "WF_LC1", "threat - damage received (firearm)", "WMLC1_LC3_DAMAGE" )
	persona_override_persona_start( "WF_LC2", "threat - damage received (firearm)", "WMLC2_LC3_DAMAGE" )
	persona_override_persona_start( "WF_LC3", "threat - damage received (firearm)", "WMLC3_LC3_DAMAGE" )

	cutscene_in("lc03_scene01")
	radio_post_event("NEWS_LC_WARNINGSTAY", true)
	special_spawns_enable(false)
	cutscene_play( "lc03_scene01", "lc03_carnales" )
	teleport("#PLAYER#", "lc03_post_cut_warp" )
	notoriety_set_max( "los_carnales", 1 )
	
	lc03_targets_killed = 0
	objective_text( "lc03_objective", LC03_TOTAL_TARGETS-lc03_targets_killed, LC03_TOTAL_TARGETS )
	
	thread_new("lc03_stay_in_row")
	thread_new("lc03_notoriety_check")

	-- odds just patrol
	for x=1,lc03_NUM_CARS,1 do
		lc03_setup_car_pf(x)
	end

	for x=1,lc03_NUM_VANS,1 do
		lc03_setup_van(x)
	end

	delay(2)
	--subtitle( "Destroy all the Los Carnales invaders.", 5 )
	mission_help_table( "lc03_destroy" )
end

function lc03_notoriety_check()
	local notoriety = 0;
	
	while (notoriety < 1) do
		thread_yield()
		notoriety = notoriety_get("los_carnales")
	end
	
	notoriety_set_min( "los_carnales", 1 )
end

function lc03_car_jacked( car_name )
	set_attack_player_flag( car_name.."_driver", true )
	set_attack_player_flag( car_name.."_passenger", true )
	
	lc03_last_script_car = car_name
end

function lc03_van_jacked( van_name )
	set_attack_player_flag( van_name.."_driver", true )
	set_attack_player_flag( van_name.."_pass01", true )
	--set_attack_player_flag( van_name.."_pass02", true )
	--set_attack_player_flag( van_name.."_pass03", true )

	lc03_last_script_car = van_name
end

function lc03_car_damaged( car_name, attacker )
	if (attacker ~= "#PLAYER#") then
		return
	end
	vehicle_speed_cancel(car_name)
	vehicle_supress_npc_exit( car_name, false )
	vehicle_chase( car_name, "#PLAYER#" )
	set_attack_player_flag( car_name.."_driver", true )
	set_attack_player_flag( car_name.."_passenger", true )
end

function lc03_van_damaged( car_name, attacker )
	if (attacker ~= "#PLAYER#") then
		return
	end
	
	vehicle_supress_npc_exit( car_name, false )
	vehicle_chase( car_name, "#PLAYER#" )
	set_attack_player_flag( car_name.."_driver", true )
	set_attack_player_flag( car_name.."_pass01", true )
end

function lc03_on_fire( car_name )
	vehicle_supress_npc_exit( car_name, false )
end

function lc03_pathing(car_name,number)
	local current = -1
	local pathing = true

	while (pathing) do
		
		local random = current;
		while (random == current) do
			random = rand_int(0,lc03_MAX_RAND_PATH_POINTS)
		end
		
		pathing = vehicle_turret_base_to( car_name, lc03_nav_name(random), false)
		
	end
	
	mission_debug( car_name.." stopped pathing", 5 )
	
	lc03_pathing_threads[number] = -1
end

function lc03_nav_name(val)
	local base_name = "lc03_$n_"
	
	if (val<10) then
		return base_name.."00"..val
	elseif (val<100) then
		return base_name.."0"..val
	else
		return base_name..val
	end
end

function lc03_dude_died( name )
	remove_marker_npc( name )

	lc03_targets_killed = lc03_targets_killed + 1
	
	objective_text( "lc03_objective", LC03_TOTAL_TARGETS-lc03_targets_killed, LC03_TOTAL_TARGETS )
	
	if (lc03_targets_killed == LC03_TOTAL_TARGETS) then
		delay(4)
		mission_end_success( "lc03" )
	end
end

function lc03_car01_death()
	thread_kill(lc03_pathing_threads[1])
	lc03_pathing_threads[1] = -1
end

function lc03_car02_death()
	thread_kill(lc03_pathing_threads[2])
	lc03_pathing_threads[2] = -1
end

function lc03_car03_death()
	thread_kill(lc03_pathing_threads[3])
	lc03_pathing_threads[3] = -1
end

function lc03_car04_death()
	thread_kill(lc03_pathing_threads[4])
	lc03_pathing_threads[4] = -1
end

function lc03_car05_death()
	thread_kill(lc03_pathing_threads[5])
	lc03_pathing_threads[5] = -1
end

function lc03_van01_death()
	thread_kill(lc03_pathing_threads[lc03_NUM_CARS + 1])
	lc03_pathing_threads[lc03_NUM_CARS + 1] = -1
end

function lc03_van02_death()
	thread_kill(lc03_pathing_threads[lc03_NUM_CARS + 2])
	lc03_pathing_threads[lc03_NUM_CARS + 2] = -1
end

function lc03_van03_death()
	thread_kill(lc03_pathing_threads[lc03_NUM_CARS + 3])
	lc03_pathing_threads[lc03_NUM_CARS + 3] = -1
end

function lc03_stay_in_row()

	local timer_active = false
	local in_row = true

	while (true) do
		in_row = is_player_in_hood("ts_saintsrow01") or is_player_in_hood("ts_saintsrow02") or is_player_in_hood("ts_saintsrow03")

		if (timer_active and in_row) then
			hud_timer_stop()
			timer_active = false
		elseif ( not timer_active and not in_row) then
			mission_help_table( "lc03_left_sr" )
			hud_timer_set( lc03_AREA_TIMER, "lc03_protection_failed" )
			timer_active = true
		end
	
		thread_yield()
	
	end
end

function lc03_protection_failed()
	mission_end_failure( "lc03", "lc03_fail_protection" )
end