-- Global Variables------

lc09_church_reached = false
lc09_phone_added = false
lc09_Angelo_flee = false

LC09_DOOR1 = "lpz_backdoorMM01"
LC09_DOOR2 = "lpz_backdoorMM02"
LC09_DOOR3 = "lpz_backdoorMM06"
LC09_DOOR4 = "lpz_backdoorMM07"


LC09_PLAYERDOOR1 = "lpz_frntdoorMM04"
LC09_PLAYERDOOR2 = "lpz_frntdoorMM05"
LC09_PLAYERDOOR3 = "lpz_frntdoorMM02"
LC09_PLAYERDOOR4 = "lpz_frntdoorMM06"

LC09_LOCKED1 = "lpz_frntdoorMM01"
LC09_LOCKED2 = "lpz_frntdoorMM07"
LC09_LOCKED3 = "lpz_frntdoorMM08"
LC09_LOCKED4 = "lpz_doorMM08"
LC09_LOCKED5 = "lpz_doorMM09"

-- FUNCTIONS ----------------------------

-- Global Variables------

lc09_VALID_WEAPONS = {"tec9","mac10"}

lc09_MAX_VEHICLE_SPEED = 90
lc09_DESIRED_FOLLOW_DISTANCE = 40
lc09_DISTANCE_FOR_MAX_SPEED = 80

lc09_follow_thread = -1
lc09_player_pathfind = -1

lc09_had_weapon = false
lc09_mission_succeeded = false
lc09_waiting_for_player = true
lc09_damage_playing = false

lc09_audio_table = 
{
	{.9, "DEX_LC9_CARDAMAGE_2", false},
	{.75, "DEX_LC9_CARDAMAGE_1", false},
	{.6, "DEX_LC9_CARDAMAGE_3", false},
	{.4, "DEX_LC9_CARDAMAGE_4", false},
	{.3, "DEX_LC9_CARDAMAGE_5", false},
	{.2, "DEX_LC9_CARDAMAGE_6", false},
}

lc09_b = false
lc09_chatter_thread = -1

lc09_angelo_thread = -1
-- ----Mission lc09------------------------

function lc09_b_cleanup()
	damage_indicator_off()
	if (is_player_in_vehicle()) then
		vehicle_stop( "lc09_PlayerCar", true )
	end
	ammo_infinite( false )
	
	on_take_damage("", "lc09_AngeloCar")
	remove_marker_vehicle( "lc09_AngeloCar" )
	
	on_trigger( "", "lc09_turret_done" )
	trigger_disable( "lc09_turret_done" )
	
	on_damage( "", "lc09_PlayerCar", 0 )
	
	if (not lc09_mission_succeeded) then
		turret_stop()

		thread_kill( lc09_follow_thread )
		thread_kill( lc09_player_pathfind )
	end
	
	release_to_world( "lc09_PlayerCar" )
	release_to_world( "lc09_ChaseCars" )
	
	--gang_force_spawn( "Los Carnales", false )
	
	--if (not lc09_had_weapon) then
	--	inv_item_remove( lc09_VALID_WEAPONS[1] )
	--end
end

function lc09_b_start()
	lc09_b = true
	
	set_mission_author("Russell Aasland")
	debug_validate_lane( "lc09_spline_path1", "lc09_spline_path_end" )
	lc09_had_weapon = false
	lc09_mission_succeeded = false
	lc09_waiting_for_player = true
	lc09_damage_playing = false
	
	persona_override_remove_all()

	party_dismiss_all()
	--on_damage( "lc09_car_failure", "lc09_PlayerCar", .23 )
	on_vehicle_destroyed("lc09_car_failure", "lc09_PlayerCar")
	on_take_damage( "lc09_car_damage_chatter", "lc09_PlayerCar" )
	on_take_damage( "lc09_angelo_damage_chatter", "lc09_AngeloCar" )
	
	cutscene_in("lc09_scene02")
	
	character_hide( "lc09_Angelo" )
	character_hide( "lc09_Dex" )
	
	cutscene_play("lc09_scene02", "lc09_ChaseCars")
	damage_indicator_on("lc09_PlayerCar", 0.15, "lc09_dex_car")
	vehicle_show( "lc09_AngeloCar" )
	vehicle_show( "lc09_PlayerCar" )
	
	vehicle_prevent_explosion_fling( "lc09_AngeloCar", true )
	vehicle_prevent_explosion_fling( "lc09_PlayerCar", true )
	vehicle_infinite_mass("lc09_AngeloCar", true)
	vehicle_infinite_mass("lc09_PlayerCar", true)
	character_show( "lc09_Angelo" )
	character_show( "lc09_Dex" )

	on_trigger( "lc09_b_turret_end", "lc09_turret_done" )
	trigger_enable( "lc09_turret_done" )
	
	if( is_dead("lc09_Angelo") ) then
		npc_revive( "lc09_Angelo" )
	end

	turn_invulnerable( "lc09_Angelo" )
	character_add_vehicle( "lc09_Angelo", "lc09_AngeloCar", 0 )
	set_ignore_ai_flag( "lc09_Angelo", true )
	
	vehicle_speed_override( "lc09_AngeloCar", 80 )
	vehicle_should_obey_traffic( "lc09_AngeloCar", false )
	vehicle_should_obey_traffic( "lc09_PlayerCar", false )
	--add_marker_vehicle( "lc09_AngeloCar", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	
	turn_invulnerable( "lc09_Dex" )
	character_add_vehicle( "lc09_Dex", "lc09_PlayerCar", 0 )
	set_ignore_ai_flag( "lc09_Dex", true )
	
	character_add_vehicle( "#PLAYER#", "lc09_PlayerCar", 1 )
	
	turret_start()
	
	--for x=1,sizeof_table( lc09_VALID_WEAPONS ), 1 do
	--	if (inv_have_item( lc09_VALID_WEAPONS[x] ) ) then
	--		inv_item_equip( lc09_VALID_WEAPONS[x] )
		
	--		lc09_had_weapon = true
	--		break
	--	end
	--end
	
	--if (not lc09_had_weapon) then
	--	inv_item_add( lc09_VALID_WEAPONS[1] )
	--	inv_item_equip( lc09_VALID_WEAPONS[1] )
	--end
	
	ammo_infinite( true )
	
	--vehicle_chase( "lc09_PlayerCar", "lc09_Angelo", false, false )
	mission_help_table( "lc09_protect_car" )
	
	notoriety_set_max( "los_carnales", 4 )
	notoriety_set_min( "los_carnales", 4 )
	
	lc09_follow_thread = thread_new( "lc09_b_following" )
	vehicle_chase("lc09_PlayerCar", "lc09_Angelo", false, false, true)
	
	thread_new("lc09_player_monitor")
	
	vehicle_speed_override( "lc09_PlayerCar", 85 )
	vehicle_speed_override( "lc09_AngeloCar", 80 )
	vehicle_turret_base_to( "lc09_AngeloCar", "lc09_spline_path1", "lc09_spline_path_end", false)
	
	thread_new("lc09_final_path")
	
	while( get_dist_char_to_char("#PLAYER#", "lc09_Angelo") > 60 ) do
		thread_yield()
	end
	
	cutscene_in("lc09_scene03")
	lc09_mission_succeeded = true
	turret_stop()
	if (is_player_in_vehicle()) then
		character_remove_vehicle("lc09_Dex")
		character_remove_vehicle("#PLAYER#")
	end
	vehicle_hide("lc09_AngeloCar")
	cutscene_play("lc09_scene03", true)
	
	teleport( "#PLAYER#", "lc09_player_port" ) -- temp because animatic puts player in bad place
	teleport_vehicle("lc09_PlayerCar", "lc09_player_port2")
	--character_add_vehicle("#PLAYER#", "lc09_PlayerCar", 0)
	
	mission_end_success("lc09")
end

function lc09_turret_to_end()
	lc09_b_player_pathfind_wrap()
end

function lc09_player_monitor()
	local chasing = true
	local in_chunk = false
	local turret_thread = -1
	while (lc09_waiting_for_player) do
		in_chunk = vehicle_in_loaded_chunk("lc09_AngeloCar")
		if (chasing and not in_chunk) then
			turret_thread = thread_new("lc09_b_player_pathfind_wrap")
			chasing = false
		elseif (not chasing and in_chunk) then
			thread_kill(turret_thread)
			vehicle_chase("lc09_PlayerCar", "lc09_Angelo", false, false, true)
			chasing = true
		end
		thread_yield()
	end
end

function lc09_final_path()
	vehicle_pathfind_to( "lc09_AngeloCar", "lc09_total_pathing_end", true)

	vehicle_speed_cancel( "lc09_AngeloCar" )
	vehicle_stop( "lc09_AngeloCar" )
end

function lc09_car_failure()
	mission_end_failure( "lc09", "lc09_fail_car" )
end

function lc09_b_player_pathfind_wrap()
	vehicle_turret_base_to("lc09_PlayerCar", "lc09_spline_path_end", false)
end

function lc09_b_turret_end()

	thread_kill( lc09_follow_thread )
	thread_kill( lc09_player_pathfind )

	lc09_waiting_for_player = false
	
	lc09_follow_thread = -1
	lc09_player_pathfind = -1
end

function lc09_b_following()
	--lc09_player_pathfind = thread_new("vehicle_pathfind_to", "lc09_PlayerCar", "lc09_spline_path_end", false)
	--lc09_player_pathfind = thread_new( "lc09_b_player_pathfind_wrap" )
	
	while ( true ) do
		local distance = get_dist_char_to_vehicle( "#PLAYER#", "lc09_AngeloCar" )
		local speed = get_vehicle_speed( "lc09_AngeloCar" )
		
		local desired_speed = 0

		if ( distance >= lc09_DISTANCE_FOR_MAX_SPEED ) then
			desired_speed = lc09_MAX_VEHICLE_SPEED
			vehicle_speed_override( "lc09_AngeloCar", 60)
		elseif ( distance >= lc09_DESIRED_FOLLOW_DISTANCE ) then
				--calc a percentage from [0:1] to control speed based on distance
				--the percentage should map lc09_DISTANCE_FOR_MAX_SPEED -> lc09_MAX_VEHICLE_SPEED
				--						&	lc09_DESIRED_FOLLOW_DISTANCE -> speed
			local distance_percent = 1 - ( (lc09_DISTANCE_FOR_MAX_SPEED-distance) /
										   (lc09_DISTANCE_FOR_MAX_SPEED-lc09_DESIRED_FOLLOW_DISTANCE) )

			desired_speed = distance_percent*(lc09_MAX_VEHICLE_SPEED - speed) + speed
			vehicle_speed_override( "lc09_AngeloCar", 70)
		else
				--calc a percentage from [0:1] to control speed based on distance
				--the percentage should map lc09_DESIRED_FOLLOW_DISTANCE -> speed
				--						&	0 -> 0
			local distance_percent = 1 - ( (lc09_DESIRED_FOLLOW_DISTANCE-distance) /
										   (lc09_DESIRED_FOLLOW_DISTANCE) )

			 desired_speed = distance_percent*speed
			 vehicle_speed_override( "lc09_AngeloCar", 80)
		end
		
		vehicle_speed_override( "lc09_PlayerCar", desired_speed )
		
		mission_debug( "dis: "..distance, 0, 0 )
		mission_debug( "as : "..speed, 0, 1 )
		mission_debug( "ds : "..desired_speed, 0, 2 )
		mission_debug( "ps : "..get_vehicle_speed("lc09_PlayerCar"), 0, 3 )
	
		thread_yield()
	end
end

function lc09_car_damage_chatter(vehicle, target, vehicle_health)
	if (target ~= "#PLAYER#") then
		return
	end
	
	if (lc09_damage_playing) then
		return
	end
	
	lc09_damage_playing = true
	
	local table_size = sizeof_table( lc09_audio_table )
	
	for x=1, table_size, 1 do
	
		if (vehicle_health <= lc09_audio_table[x][1] and not lc09_audio_table[x][3]) then
			audio_play_for_character( lc09_audio_table[x][2], "lc09_Dex", "voice", false, true )
			lc09_audio_table[x][3] = true
			break
		end
	end
	
	delay(5)
	lc09_damage_playing = false
end

function lc09_angelo_damage_chatter(vehicle, target, vehicle_health)
	if (lc09_damage_playing) then
		return
	end
	
	lc09_damage_playing = true
	
	audio_play_for_character( "DEX_LC9_CHASE", "lc09_Dex", "voice", false, true )
	
	delay(5)
	lc09_damage_playing = false
end


lc09_skipA = false
function lc09_debuggingb()
	lc09_skipA = not lc09_skipA
end

function lc09_cleanup()
	notoriety_reset( "los_carnales" )
	door_lock(LC09_DOOR1, false)
	door_lock(LC09_DOOR2, false)
	
	door_lock(LC09_LOCKED1, false)
	door_lock(LC09_LOCKED2, false)
	door_lock(LC09_LOCKED3, false)
	door_lock(LC09_LOCKED4, false)
	door_lock(LC09_LOCKED5, false)
	
	door_lock(LC09_PLAYERDOOR1, false)
	door_lock(LC09_PLAYERDOOR2, false)
	door_lock(LC09_PLAYERDOOR3, false)
	door_lock(LC09_PLAYERDOOR4, false)
	
	party_dismiss("lc09_Dex")
	
	on_damage( "", "lc09_Angelo", .3 )

	on_death( "", "lc09_Dex" )
	on_dismiss( "", "lc09_Dex" )
	never_die( "lc09_Dex", false )
	set_ignore_ai_flag( "lc09_Dex", false )
	
	group_destroy( "lc09_DexGroup" )
	release_to_world( "lc09_Mansion" )
	group_destroy( "lc09_AngeloGroup" )
	
	on_trigger( "", "lc09_church" )
	on_trigger( "", "lc09_mansion")
	on_trigger( "", "lc09_bedroom_entrance" )

	trigger_disable( "lc09_church" )
	trigger_disable( "lc09_mansion" )
	trigger_disable( "lc09_bedroom_entrance" )

	minimap_icon_remove_navpoint( "lc09_mansion" )
	minimap_icon_remove_navpoint( "lc09_church" )
	remove_marker_npc( "lc09_Angelo" )
	minimap_icon_remove_navpoint( "lc09_Angelo" )

	damage_indicator_off()

	if (lc09_b) then
		lc09_b_cleanup()
	end
end

function lc09_success()
	message("You're the winner!")
	hood_set_owner( "lc_barrio01", "Playas" )
	mission_set_next_props_req( "los_carnales", LC10_REQUIRED_PROPS )
end

function lc09_start()
	lc09_b = false
	lc09_angelo_thread = -1
	
	set_mission_author("Russell Aasland")
	
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "mission_start_lc09")
		fade_in( 0.5 )
	end
	
	door_lock(LC09_PLAYERDOOR1, false)
	door_lock(LC09_PLAYERDOOR2, false)
	door_lock(LC09_PLAYERDOOR3, false)
	door_lock(LC09_PLAYERDOOR4, false)
	
	door_lock(LC09_DOOR3, false)
	door_lock(LC09_DOOR4, false)
	
	door_lock(LC09_LOCKED1, true)
	door_lock(LC09_LOCKED2, true)
	door_lock(LC09_LOCKED3, true)
	
	door_lock(LC09_LOCKED4, true)
	door_lock(LC09_LOCKED5, true)
	
	
	if (lc09_skipA) then
		create_group( "lc09_DexGroup", true )
		lc09_Angelo_flee = true
		
		never_die( "lc09_Dex", true )
		
		party_dismiss_all()
		party_add( "lc09_Dex" )
		
		teleport( "#PLAYER#", "lc09_debug_start" )
		teleport( "lc09_Dex", "lc09_debug_dex" )
		
		create_group( "lc09_AngeloGroup", true )
		
		lc09_b_start()
		return
	end
	
	lc09_church_reached = false
	persona_override_persona_start( "HM_LC1", "threat - alert (group attack)", "HMLC1_LC9_ATTACK", 4 )
	persona_override_persona_start( "HM_LC2", "threat - alert (group attack)", "HMLC2_LC9_ATTACK", 4 )
	persona_override_persona_start( "HM_LC3", "threat - alert (group attack)", "HMLC3_LC9_ATTACK", 4 )
	persona_override_persona_start( "WM_LC1", "threat - alert (group attack)", "WMLC1_LC9_ATTACK", 4 )
	persona_override_persona_start( "WM_LC2", "threat - alert (group attack)", "WMLC2_LC9_ATTACK", 4 )
	persona_override_persona_start( "WM_LC3", "threat - alert (group attack)", "WMLC3_LC9_ATTACK", 4 )

	persona_override_persona_start( "HF_LC1", "threat - alert (group attack)", "HMLC1_LC9_ATTACK", 4 )
	persona_override_persona_start( "HF_LC2", "threat - alert (group attack)", "HMLC2_LC9_ATTACK", 4 )
	persona_override_persona_start( "HF_LC3", "threat - alert (group attack)", "HMLC3_LC9_ATTACK", 4 )
	persona_override_persona_start( "WF_LC1", "threat - alert (group attack)", "WMLC1_LC9_ATTACK", 4 )
	persona_override_persona_start( "WF_LC2", "threat - alert (group attack)", "WMLC2_LC9_ATTACK", 4 )
	persona_override_persona_start( "WF_LC3", "threat - alert (group attack)", "WMLC3_LC9_ATTACK", 4 )
	
	
	on_trigger( "lc09_angelo_fight", "lc09_angelo_start" )
	
	on_trigger( "lc09_bedroom_arrival", "lc09_bedroom_entrance" )
	on_trigger( "lc09_mansion_arrival", "lc09_mansion" )
	
	lc09_Angelo_flee = false
	create_group( "lc09_DexGroup", true )
	
	persona_override_human_start( "lc09_Dex", "threat - damage received (firearm)", "DEX_LC9_DAMAGE" )
	persona_override_human_start( "lc09_Dex", "threat - alert (group attack)", "DEX_LC9_ATTACK" )
	
	party_dismiss("#FOLLOWER3#")
	party_add( "lc09_Dex" )
	
	on_death( "lc09_dex_failure", "lc09_Dex" )
	on_dismiss( "lc09_abandon_dex_failure", "lc09_Dex" )
	
	while (get_dist_char_to_char("#PLAYER#", "lc09_Dex") > 10) do
		thread_yield()
	end
	
	audio_play_for_character( "DEX_LC9_ENTER_1", "lc09_Dex", "voice", false, true )
	
	mission_waypoint_add("lc09_mansion_gps")
	
	persona_override_human_start( "lc09_Dex", "escort - stripper reacts to hitting human", "DEX_LC9_RUNOVER" )
	
	lc09_chatter_thread = thread_new( "lc09_travel_voice" )
	
	trigger_enable( "lc09_mansion" )
	trigger_enable( "lc09_angelo_start" )
	
	minimap_icon_add_navpoint( "lc09_mansion", MINIMAP_ICON_LOCATION )
	
	mission_help_table( "lc09_goto_mansion" )

	create_group( "lc09_Mansion", true )
	create_group( "lc09_AngeloGroup", true )
	
	never_die( "lc09_Angelo", true )
	npc_prevent_flinching("lc09_Angelo", true)
	npc_prevent_explosion_fling("lc09_Angelo", true)
	
	persona_override_human_start( "lc09_Angelo", "threat - damage received (firearm)", "ANGELO_LC9_DAMAGE" )
	
	wander_start( "lc09_front1" )
	wander_start( "lc09_front2" )
	wander_start( "lc09_front3" )
	wander_start( "lc09_back1" )
	wander_start( "lc09_back2" )
	wander_start( "lc09_pool1" )
	wander_start( "lc09_pool3" )

	while( not lc09_Angelo_flee ) do
		thread_yield()
	end
	
	persona_override_human_start( "lc09_Dex", "threat - alert (group attack)", "DEX_LC9_ATTACK" )
	
	door_lock(LC09_PLAYERDOOR1, false)
	door_lock(LC09_PLAYERDOOR2, false)
	door_lock(LC09_PLAYERDOOR3, false)
	door_lock(LC09_PLAYERDOOR4, false)
	
	trigger_enable( "lc09_bedroom_entrance" )
end

function lc09_move()
	move_to("lc09_Angelo", "lc09_angelo_dest", 2)
end

function lc09_angelo_fight()
	add_marker_npc("lc09_Angelo", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	trigger_disable("lc09_angelo_start")
	turn_invulnerable("lc09_Angelo")
	audio_play_for_character("ANGELO_LC9_ATTACK", "lc09_Angelo", "voice", false, true, 4, 2)
	
	lc09_Angelo_flee = true
	
	door_open(LC09_DOOR1)
	door_open(LC09_DOOR2)
	delay(7)
	
	audio_play_for_character( "ANGELO_LC9_DEFEATED_1", "lc09_Angelo", "voice", false, true )
	set_ignore_ai_flag("lc09_Angelo", true)
	lc09_angelo_thread = thread_new("lc09_move")
end

function lc09_dex_failure()
	mission_end_failure( "lc09", "lc09_fail_dex" )
end

function lc09_abandon_dex_failure()
	mission_end_failure( "lc09", "lc09_abandon_dex" )
end

function lc09_church_arrival()
	lc09_church_reached = true
end

-- Mansion Functions -------------------------

function lc09_wait_for_mansion()
	while (get_dist_char_to_nav("#PLAYER#", "lc09_mansion") > 150) do
		thread_yield()
	end
	
	audio_play_for_character( "DEX_LC9_CHAT_4", "lc09_Dex", "voice", false, true )
end

function lc09_travel_voice()
	delay( rand_float(5, 10) )
	
	audio_play_for_character( "DEX_LC9_CAR_1", "lc09_Dex", "voice", false, true )
	delay(10)
	audio_play_for_character( "DEX_LC9_CHAT_1", "lc09_Dex", "voice", false, true )
	delay(10)
	audio_play_for_character( "DEX_LC9_CHAT_2", "lc09_Dex", "voice", false, true )
	delay(10)
	audio_play_for_character( "DEX_LC9_CHAT_3", "lc09_Dex", "voice", false, true )
	
	thread_new("lc09_wait_for_mansion")
	
	delay(240)
	
	audio_play_for_character( "DEX_LC9_TIMEOUT_1", "lc09_Dex", "voice", false, true )
	
	delay(20)
	
	audio_play_for_character( "DEX_LC9_TIMEOUT_2", "lc09_Dex", "voice", false, true )
	
	delay(20)
	
	audio_play_for_character( "DEX_LC9_TIMEOUT_3", "lc09_Dex", "voice", false, true )
end

function lc09_mansion_arrival()
	trigger_disable( "lc09_mansion" )
	minimap_icon_remove_navpoint( "lc09_mansion" )
	mission_waypoint_remove()
	
	mission_help_table( "lc09_kill_angelo" )

	--minimap_icon_add_navpoint( "lc09_Angelo", MINIMAP_ICON_LOCATION )
	if lc09_chatter_thread ~= -1 then
		thread_kill(lc09_chatter_thread)
	end
	notoriety_set_min( "los_carnales", 1 )
	notoriety_set_max( "los_carnales", 2 )
	audio_play_for_character( "DEX_LC9_ARRIVE_1", "lc09_Dex", "voice", false )
end

function lc09_bedroom_arrival()
	trigger_disable( "lc09_bedroom_entrance" )
	remove_marker_npc("lc09_Angelo")
	thread_kill(lc09_angelo_thread)
	destroy_group( "lc09_Mansion" )
	lc09_b_start()

	--thread_new("lc09_angelo_chatter")
end