-- Global Variables------


LC06_STRIP_CLUB_TIME_LIMIT = 5 * 60 * 1000
LC06_VICTOR_DELAY = 5
LC06_VICTOR_RESPONSE_DELAY = 6

lc06_stakeout_arrived = false
lc06_victor_released = false

-- FUNCTIONS ----------------------------

function lc06_cleanup()
	audio_starve_off()
	mission_waypoint_remove()
	
	hud_timer_stop()

	trigger_disable( "lc06_church" )
	trigger_disable( "lc06_stakeout" )
	
	on_trigger( "", "lc06_stakeout" )
	
	minimap_icon_remove_navpoint( "lc06_church" )
	ingame_effect_remove_trigger( "lc06_church" )
	
	remove_marker_vehicle("lc06_VictorCar")
	
	remove_marker_trigger( "lc06_stakeout" )
	
	--gang_force_spawn( "Los Carnales", false )
	notoriety_reset( "los_carnales" )
	notoriety_reset_vehicle_count( "Los Carnales" )

	on_dismiss( "", "lc06_Dex" )
	party_dismiss("lc06_Dex")
	--party_set_recruitable( true )
	--party_set_dismissable( true )

	set_unjackable_flag( "lc06_VictorCar", false )

	--turn_vulnerable( "lc06_Dex" )
	group_destroy( "lc06_DexGroup" )
	group_destroy( "lc06_VictorGroup" )
	
	party_allow_vehicle_combat( false )
end

function lc06_success()
	mission_set_next_props_req( "los_carnales", LC07_REQUIRED_PROPS )
end

function lc06_dex_dead()
	mission_end_failure("lc06", "lc06_dex_dead")
end

function lc06_dex_chatter2()
	while (not is_player_in_vehicle()) do
		delay(2)
	end
	delay(4)
	audio_play_for_character( "DEX_LC6_CHATTER_1", "lc06_Dex", "voice", false, true )
	delay(10)
	audio_play_for_character( "DEX_LC6_CHATTER_2", "lc06_Dex", "voice", false, true )
	delay(12)
	audio_play_for_character( "DEX_LC6_CHATTER_3", "lc06_Dex", "voice", false, true )
end

function lc06_start()
	set_mission_author("Russell Aasland")

	on_dismiss( "lc06_abandon_dex_failure", "lc06_Dex" )

	lc06_stakeout_arrived = false
	lc06_victor_released = false

	cutscene_in("lc06_scene01")
	cutscene_play( "lc06_scene01", "lc06_DexGroup" )
	teleport("#PLAYER#", "mission_start_lc06")
	character_show( "lc06_Dex" )

	party_dismiss( "#FOLLOWER3#" ) --make room for one follower
	party_add( "lc06_Dex" )
	
	on_death("lc06_dex_dead", "lc06_Dex")
	
	set_seatbelt_flag( "lc06_Dex", true )

	on_trigger( "lc06_stakeout_arrival", "lc06_stakeout" )
	trigger_enable( "lc06_stakeout" )
	add_marker_trigger( "lc06_stakeout", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	mission_waypoint_add("lc06_club_gps")
	
	mission_debug("enroute",10)
	
	--hud_timer_set( LC06_STRIP_CLUB_TIME_LIMIT, "lc06_timer_failure" )
	
	pause_menu_objective_add( "lc06_goto_club" )
	delay(6)
	audio_play_for_character( "DEX_LC6_START_1", "lc06_Dex", "voice", false, true )
	mission_help_table_nag( "lc06_goto_club" )
	
	local dex_chatter_thread = thread_new("lc06_dex_chatter2")

	while( not	lc06_stakeout_arrived ) do
		thread_yield()
	end
	
	thread_kill(dex_chatter_thread)
	
	if (is_player_in_vehicle()) then
		vehicle_stop("#PLAYER#")
	end
	mission_waypoint_remove()
	player_controls_disable()
	audio_play_for_character( "DEX_LC6_PARK_1", "lc06_Dex", "voice", false, true )
	
	audio_starve_on()
	if ( not is_dead("#PLAYER#") ) then
		fade_out(0.25)
		fade_out_block()
	end

	set_time_of_day(0,0)
	radio_off()
	group_create( "lc06_VictorGroup", true )
	character_add_vehicle( "lc06_Victor", "lc06_VictorCar", 0 )
	vehicle_lights_off("lc06_VictorCar", true)
	vehicle_set_torque_multiplier("lc06_VictorCar", 2)
	set_unjackable_flag( "lc06_VictorCar", true )
	vehicle_supress_npc_exit( "lc06_VictorCar", true )
	
	if (is_player_in_vehicle()) then
		teleport_vehicle("#PLAYER#", "lc06_car_port")
		vehicle_stop("#PLAYER#")
	else
		teleport("#PLAYER#", "lc06_car_port")
	end
	--thread_new_block("lc06_cutscene")
	scripted_cutscene_play("lc06_cutscene", "lc06_cutscene_end")
	
	vehicle_lights_off("lc06_VictorCar", false)
	camera_end_script()
	radio_on()
	player_controls_enable()
	fade_in(0)
	
	--TODO: Scripter cutscene of Victor pulling up

	vehicle_chase( "lc06_VictorCar", "#PLAYER#", false, true )
	attack( "lc06_Victor" )

	--gang_force_spawn( "Los Carnales", true )
	--notoriety_set_desired_vehicle_count( "Los Carnales", 2 )
	notoriety_set_min( "los_carnales", 3 )
	
	npc_unholster_best_weapon("lc06_Dex")
	party_allow_vehicle_combat( true )
	
	add_marker_vehicle("lc06_VictorCar", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	
	mission_debug("evasion", 10)
	minimap_icon_add_navpoint( "lc06_church", MINIMAP_ICON_LOCATION )
	on_trigger( "lc06_church_return", "lc06_church" )
	trigger_enable( "lc06_church" )
	
	mission_help_table( "lc06_evade" )
	mission_waypoint_add( "lc06_church_gps" )
	audio_play_for_character( "DEX_LC6_SPOT_1", "lc06_Dex", "voice", false, true )
	persona_override_human_start( "lc06_Dex", "threat - damage received (firearm)", "DEX_LC6_DAMAGE" )
	mission_debug( "dex audio finished", 5 )
	
	thread_new( "lc06_victor_chatter" )
	local dex_chatter = thread_new("lc06_dex_chatter")
	
	while( get_dist_char_to_nav("#PLAYER#", "lc06_church_gps") > 500 ) do
		if (dex_chatter ~= -1 and is_vehicle_destroyed("lc06_VictorCar")) then
			thread_kill(dex_chatter)
			dex_chatter = -1
		end
		thread_yield()
	end
	
	mission_debug( "home_turf", 10 )
	
	--gang_force_spawn( "Los Carnales", false )
	--notoriety_reset( "los_carnales" )
	--notoriety_reset_vehicle_count( "Los Carnales" )
	
	if (get_dist_char_to_char("#PLAYER#", "lc06_Victor") < 200) then
		mission_help_table("lc06_lose_victor")
	end
	
	while (get_dist_char_to_char("#PLAYER#", "lc06_Victor") < 200) do
		thread_yield()
	end
		
	thread_kill(dex_chatter)
	remove_marker_vehicle("lc06_VictorCar")
	vehicle_flee( "lc06_VictorCar" )
	vehicle_speed_override( "lc06_VictorCar", 60 )
		
	mission_help_table( "lc06_goto_church" )
	
	while (get_dist_char_to_nav("#PLAYER#", "lc06_church") > 500) do
		thread_yield()
	end
	
	notoriety_set_desired_vehicle_count( "Los Carnales", 0 )
	
	ingame_effect_add_trigger( "lc06_church", INGAME_EFFECT_VEHICLE_LOCATION )
end

function lc06_cutscene_end()
	camera_end_script()
	player_controls_enable()
end

function lc06_cutscene()
	modal_begin()
	
	camera_look_through("lc06_camera1")

	fade_in(0.25)
	fade_in_block()
	audio_starve_off()
	delay(0.2)
	vehicle_lights_off("lc06_VictorCar", false)
	vehicle_lights_on("lc06_VictorCar", true)
	audio_play_for_character( "VICTOR_LC6_ATTACK", "lc06_Victor", "voice", false, true, 4, 3 )

	camera_look_through("lc06_camera2")
	
	vehicle_chase( "lc06_VictorCar", "#PLAYER#", false, true )
	attack( "lc06_Victor" )
	delay(1)
	
	modal_end()
end

function lc06_stakeout_arrival()
	trigger_disable( "lc06_stakeout" )
	lc06_stakeout_arrived = true
	
	hud_timer_stop( )

	remove_marker_navpoint( "lc06_stakeout" )
end

function lc06_church_return()
	if (notoriety_spawn_count("Los Carnales", "NPC" ) > 0 ) then
		mission_help_table( "lc06_pursuers" )
		return
	end
	
	audio_play_for_character( "DEX_LC6_WIN_1", "lc06_Dex", "voice", false, true )

	mission_end_success( "lc06" )
end

function lc06_timer_failure()
	mission_end_failure( "lc06", "lc06_fail_timer" )
end

function lc06_abandon_dex_failure()
	mission_end_failure( "lc06", "lc06_abandon_dex" )
end

function lc06_dex_chatter()
local play_table = {}
	
	for x=1, 9, 1 do
		play_table[x] = false
	end
	
	while( not play_table[9] ) do
	
		delay( rand_float( 1, 1.5) * 20 )
	
		local rand = rand_int( 1, 8 )
		while( play_table[ rand ] ) do
			rand = rand_int( 1, 8 )
		end
		play_table[rand] = true
	
		play_table[9] = true
		for x=1, 8, 1 do
			play_table[9] = play_table[9] and play_table[x]
		end
		
		while (get_dist_char_to_char("lc06_Dex", "lc06_Victor") > 100) do
			thread_yield()
		end
		
		audio_play_for_character( "DEX_LC6_CHASED", "lc06_Dex", "voice", false, true, rand-1, 2 )
	end
end

function lc06_victor_chatter()
	local play_table = {}
	
	for x=1, 8, 1 do
		play_table[x] = false
	end
	
	while( not play_table[8] ) do
	
		delay( rand_float( 1, 1.5) * 20 )
	
		local rand = rand_int( 1, 7 )
		while( play_table[ rand ] ) do
			rand = rand_int( 1, 7 )
		end
		play_table[rand] = true
	
		play_table[8] = true
		for x=1, 7, 1 do
			play_table[8] = play_table[8] and play_table[x]
		end
		
		while (get_dist_char_to_char("lc06_Dex", "lc06_Victor") > 100) do
			thread_yield()
		end

		audio_play_for_character( "VICTOR_LC6_ATTACK", "lc06_Victor", "voice", false, true, rand-1, 2 )
	end
end
