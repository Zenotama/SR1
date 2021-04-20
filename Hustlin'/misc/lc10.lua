-- Global Variables------


LC10_TRAVEL_TIMER = 2.5 * 60 * 1000

lc10_hanger_reached = false
lc10_start_final_takeoff = false
lc10_plane_destroyed = false

lc10_had_ak = true

lc10_rocketgroup = { "lc10_rocketeer1", "lc10_rocketeer2", "lc10_rocketeer3" }
lc10_defendergroup = { "lc10_defender1", "lc10_defender2", "lc10_defender3", "lc10_defender4", "lc10_defender5" }
lc10_roofgroup = { "lc10_roof1", "lc10_roof2", "lc10_roof3" }
lc10_runupgroup = { "lc10_runup1", "lc10_runup2", "lc10_runup3" }

lc10_threads = {}

lc10_weapon_table = {}
lc10_ammo_table = {}

lc10_turret_started = false
lc10_failed = false

-- FUNCTIONS ----------------------------

function lc10_cleanup()
	lc10_failed = false
	if (lc10_turret_started) then
		inv_item_remove_all("#PLAYER#")
		inv_item_add(lc10_weapon_table, lc10_ammo_table, "#PLAYER#")
	end
	
	hud_timer_stop()
	
	on_take_damage("", "sr_city_lc10_LearJet")
	
	for i,char in pairs(lc10_rocketgroup) do
		remove_marker_npc(char)
		on_death("", char)
	end
	
	for i,char in pairs(lc10_defendergroup) do
		remove_marker_npc(char)
		on_death("", char)
	end
	
	for i,char in pairs(lc10_roofgroup) do
		remove_marker_npc(char)
		on_death("", char)
	end
	
	for i,char in pairs(lc10_runupgroup) do
		remove_marker_npc(char)
		on_death("", char)
	end
	
	notoriety_reset_vehicle_count("Los Carnales")
	notoriety_reset( "los_carnales" )
	mission_waypoint_remove()
	
	on_trigger( "", "lc10_hanger" )
	on_trigger( "", "lc10_near_plane" )
	
	trigger_disable( "lc10_hanger" )
	trigger_disable( "lc10_near_plane" )
	
	turret_stop()
	ammo_infinite( false )
	damage_indicator_off()
	

	remove_marker_trigger( "lc10_hanger" )
	remove_marker_vehicle( "lc10_turret_car" )
	
	remove_marker_npc( "lc10_attack1_driver" )
	remove_marker_npc( "lc10_attack2_driver" )
	remove_marker_npc( "lc10_attack3_driver" )
	
	on_death( "", "lc10_attack1_driver" )
	on_death( "", "lc10_attack2_driver" )
	on_death( "", "lc10_attack3_driver" )
	
	on_vehicle_destroyed( "", "lc10_turret_car" )
	on_mover_destroyed( "", "sr_city_lc10_LearJet" )
	
	on_trigger("", "lc10_rocket1")
	on_trigger("", "lc10_rocket2")
	on_trigger("", "lc10_rocket3")
	on_trigger("", "lc10_rocket4")
	
	trigger_disable("lc10_rocket1")
	trigger_disable("lc10_rocket2")
	trigger_disable("lc10_rocket3")
	trigger_disable("lc10_rocket4")
	
	trigger_disable("lc10_ambush_start")
	on_trigger( "", "lc10_ambush_start" )
	
	on_dismiss( "", "lc10_Dex" )
	
	on_vehicle_enter("", "lc10_turret_car")
	on_vehicle_exit("", "lc10_turret_car")

	set_unjackable_flag( "lc10_turret_car", false)
	party_dismiss( "lc10_Dex" )
	release_to_world( "lc10_turret_car" )
	
	group_destroy( "lc10_Group" )
	release_to_world("lc10_Ambush")

	release_to_world( "lc10_Plane" )
	release_to_world( "lc10_Courtesy" )
	if (not lc10_plane_destroyed) then
		mesh_mover_reset( "sr_city_lc10_LearJet" )
	end
end

function lc10_success()
	unlockable_unlock("lc10")
	unlockable_unlock("lc10_2")
	unlockable_unlock("lc10_3")
	trigger_enable("barrio_$crib_save000")
	hood_set_owner( "lc_airport01", "Playas" )
	radio_post_event("NEWS_LC_LOPEZPLANEEXPL", false)
end

function lc10_car_enter()
	trigger_enable("lc10_hanger")
	mission_help_table_nag( "lc10_goto_airport" )
end

function lc10_car_exit()
	trigger_disable("lc10_hanger")
	mission_help_table_nag( "lc10_use_car" )
end

lc10_rocket_line_playing = false

function lc10_rocket_fired(attacker)
	debug_message(attacker)
	--on_weapon_fired( "lc10_rocket_fired", "lc10_rocketeer1")
	--on_weapon_fired( "lc10_rocket_fired", "lc10_defender4")
	--on_weapon_fired( "lc10_rocket_fired", "lc10_roof1")
	--on_weapon_fired( "lc10_rocket_fired", "lc10_rocketeer2")
	
	if ((attacker == "lc10_rocketeer1") or (attacker == "lc10_defender4") or (attacker == "lc10_roof1") or (attacker == "lc10_rocketeer2")) then
		set_perfect_aim(attacker, true)
	end
	
	if (lc10_rocket_line_playing) then
		return
	end
	
	lc10_rocket_line_playing = true
	
	voice_block("lc10_Dex")
	audio_play_for_character("DEX_LC10_SEERPG", "lc10_Dex", "voice", false, false)
	
	delay(18)
	lc10_rocket_line_playing = false
end

function lc10_rocket1()
	trigger_disable("lc10_rocket1")
	set_perfect_aim("lc10_rocketeer1", true)
	combat_enable("lc10_rocketeer1")
	mission_debug("force fire 1")
	force_fire("lc10_rocketeer1", "lc10_target1", true)
	delay(7)
	attack("lc10_rocketeer1")
	forced_target_set("lc10_rocketeer1", "#PLAYER#")
end

function lc10_rocket2()
	trigger_disable("lc10_rocket2")
	set_perfect_aim("lc10_rocketeer2", true)
	combat_enable("lc10_rocketeer2")
	mission_debug("force fire 2")
	force_fire("lc10_rocketeer2", "lc10_target2", true)
	delay(7)
	attack("lc10_rocketeer2")
	forced_target_set("lc10_rocketeer2", "#PLAYER#")
end

function lc10_rocket3()
	trigger_disable("lc10_rocket3")
	combat_enable("lc10_defender4")
	set_perfect_aim("lc10_defender4", true)
	mission_debug("force fire 3")
	force_fire("lc10_defender4", "lc10_target3", true)
	delay(8)
	attack("lc10_defender4")
	forced_target_set("lc10_defender4", "#PLAYER#")
end

function lc10_rocket4()
	trigger_disable("lc10_rocket4")
	combat_enable("lc10_roof1")
	set_perfect_aim("lc10_roof1", true)
	mission_debug("force fire 4")
	force_fire("lc10_roof1", "lc10_target4", true)
	delay(8)
	attack("lc10_roof1")
	forced_target_set("lc10_roof1", "#PLAYER#")
end

function lc10_plane_loop()
	local plane_line = 1
end

function lc10_start()
	set_mission_author("Russell Aasland")
	lc10_rocket_line_playing = false

	lc10_hanger_reached = false
	lc10_start_final_takeoff = false
	lc10_plane_destroyed = false
	lc10_had_ak = true
	lc10_turret_started = false
	lc10_failed = false
	
	cutscene_in("lc10_scene01")
	cutscene_play("lc10_scene01", "lc10_Group")

	character_show( "lc10_Dex" )
	teleport("#PLAYER#", "lc10_player_post_cut")
	vehicle_show( "lc10_turret_car" )
	character_add_vehicle("#PLAYER#", "lc10_turret_car", 0)
	character_add_vehicle("lc10_Dex", "lc10_turret_car", 1)
	
	persona_override_persona_start("SP_DEX", "escort - stripper reacts to hitting vehicle", "DEX_LC10_CARDAMAGE")

	add_marker_vehicle( "lc10_turret_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )
	on_vehicle_destroyed( "lc10_fail_vehicle", "lc10_turret_car" )

	party_dismiss_all()
	party_add( "lc10_Dex" )
	on_death( "lc10_dex_failure", "lc10_Dex" )
	on_dismiss( "lc10_abandon_dex_failure", "lc10_Dex" )
	
	--teleport( "#PLAYER#", "lc10_player_post_cut" )

	hud_timer_set( LC10_TRAVEL_TIMER, "lc10_timer_failure" )

	--pause_menu_objective_add( "lc10_use_car" )
	audio_play_for_character( "DEX_LC10_START_1", "lc10_Dex", "voice", false, true )
	--mission_help_table_nag( "lc10_use_car" )
	
	while( get_char_in_vehicle("lc10_turret_car", 0) ~= "#PLAYER#" ) do
		thread_yield()
	end
	
	on_vehicle_enter("lc10_car_enter", "lc10_turret_car")
	on_vehicle_exit("lc10_car_exit", "lc10_turret_car")

	if (is_demo_execution()) then
	--if true then
		fade_out(0.5)
		fade_out_block()
		teleport_vehicle("lc10_turret_car", "lc10_hanger")
		delay(3)
		fade_in(0.5)
		fade_in_block()
		trigger_disable( "lc10_hanger" )
		remove_marker_trigger( "lc10_hanger" )
		hud_timer_stop()
		lc10_hanger_reached = true
	
		on_trigger( "lc10_start_plane_takeoff", "lc10_near_plane" )
	else
		mission_help_table( "lc10_goto_airport" )
		add_marker_trigger( "lc10_hanger", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
		mission_waypoint_add( "lc10_hanger")
	
		on_trigger( "lc10_hanger_arrival", "lc10_hanger" )
		trigger_enable( "lc10_hanger" )

		local audio_played = false
		while( not lc10_hanger_reached ) do		
			if( (hud_timer_get_remainder() <= LC10_TRAVEL_TIMER/3) and (not audio_played)) then
				audio_play_for_character( "DEX_LC10_TIMELOW_1", "lc10_Dex", "voice", false )
				audio_played = true
			end

			thread_yield()
		end
	end
	
	mission_debug("2")
		
	on_vehicle_enter("", "lc10_turret_car")
	on_vehicle_exit("", "lc10_turret_car")
	player_controls_disable()
	vehicle_speed_cancel("lc10_turret_car")
	vehicle_stop("lc10_turret_car")
	vehicle_go_idle("lc10_turret_car")
	--audio_play_for_character( "DEX_LC10_AIRPORT_1", "lc10_Dex", "voice", false, true )
	delay(0.5)
	audio_play_for_character( "DEX_LC10_AK47_1", "lc10_Dex", "voice", false, true )
	mission_debug("3")
	
	cutscene_in("lc10_scene02")
	mesh_mover_reset( "sr_city_lc10_LearJet" )
	lc10_weapon_table, lc10_ammo_table = inv_item_get_all("#PLAYER#")
	lc10_turret_started = true
	mission_waypoint_remove()
	character_remove_vehicle( "lc10_Dex" )
	character_remove_vehicle( "#PLAYER#" )
	character_hide( "lc10_Dex" )
	vehicle_hide("lc10_turret_car")
	player_controls_enable()
	mission_debug("4")
	
	cutscene_play("lc10_scene02", "lc10_Plane")
	group_create("lc10_Courtesy")
	party_dismiss_all()
	--notoriety_set_desired_vehicle_count("Los Carnales", 0)
	notoriety_set_max( "los_carnales", 2 )

	character_show( "lc10_Dex" )
	vehicle_show("lc10_turret_car")
	vehicle_prevent_explosion_fling("lc10_turret_car", true)
	character_show("lc10_guard")
	character_show( "lc10_attack1_driver" )
	character_show( "lc10_attack1_passenger" )
	character_show( "lc10_attack2_driver" )
	character_show( "lc10_attack2_passenger" )
	character_show( "lc10_attack3_driver" )
	character_show( "lc10_attack3_passenger" )
	lc10_show_group( lc10_runupgroup )
	lc10_show_group( lc10_rocketgroup )
	
	vehicle_show("lc10_attack_car1")
	vehicle_show("lc10_attack_car2")
	vehicle_show("lc10_attack_car3")
	--vehicle_show("lc10_$v000")
	--vehicle_show("lc10_$v001")

	character_remove_vehicle( "lc10_Dex" )
	
	character_add_vehicle( "lc10_Dex", "lc10_turret_car", 0 )
	character_add_vehicle( "#PLAYER#", "lc10_turret_car", 1 )
	
	teleport_vehicle( "lc10_turret_car", "lc10_post_cut2" )
	
	vehicle_disable_flee( "lc10_turret_car", true )
	vehicle_disable_chase( "lc10_turret_car", true )
	mission_debug("5")
	
	
	on_weapon_fired( "lc10_rocket_fired", "lc10_rocketeer1")
	on_weapon_fired( "lc10_rocket_fired", "lc10_defender4")
	on_weapon_fired( "lc10_rocket_fired", "lc10_roof1")
	on_weapon_fired( "lc10_rocket_fired", "lc10_rocketeer2")
	
	combat_disable("lc10_rocketeer1")
	combat_disable("lc10_defender4")
	combat_disable("lc10_roof1")
	combat_disable("lc10_rocketeer2")
	
	--trigger_enable("lc10_$n005")
	--trigger_enable("lc10_$n010")
	--trigger_enable("lc10_$n011")
	--trigger_enable("lc10_$n012")
	--trigger_enable("lc10_$n013")
	--trigger_enable("lc10_$n015")
	
	on_trigger("lc10_rocket1", "lc10_rocket1")
	on_trigger("lc10_rocket2", "lc10_rocket2")
	on_trigger("lc10_rocket3", "lc10_rocket3")
	on_trigger("lc10_rocket4", "lc10_rocket4")
	
	trigger_enable("lc10_rocket1")
	trigger_enable("lc10_rocket2")
	trigger_enable("lc10_rocket3")
	trigger_enable("lc10_rocket4")
	
	debug_message("triggers enabled")
	
	trigger_enable("lc10_ambush_start")
	on_trigger( "lc10_ambush_execute", "lc10_ambush_start" )

	if( not inv_have_item( "ak47" ) and not inv_have_item( "m16" )) then
		lc10_had_ak = false
		inv_item_add( "ak47" )
	end
	
	if (inv_have_item("m16")) then
		inv_item_equip( "m16" )
	else
		inv_item_equip( "ak47" )
	end
	
	inv_item_add( "rpg_launcher" )
	
	ammo_infinite( true )

	turret_start()
	turn_invulnerable( "lc10_Dex" )
	set_unjackable_flag("lc10_turret_car", true)
	set_ignore_ai_flag( "lc10_Dex", true)
	vehicle_speed_override( "lc10_turret_car", 45 )
	vehicle_ignore_repulsors("lc10_turret_car", true)
	radio_off()
	
	on_mover_destroyed( "lc10_plane_destruction", "sr_city_lc10_LearJet" )
	
	damage_indicator_on( "sr_city_lc10_LearJet", 0, "lc10_plane")
	
	character_add_vehicle( "lc10_attack1_driver", "lc10_attack_car1", 0 )
	character_add_vehicle( "lc10_attack1_passenger", "lc10_attack_car1", 1 )
	character_add_vehicle( "lc10_attack2_driver", "lc10_attack_car2", 0 )
	character_add_vehicle( "lc10_attack2_passenger", "lc10_attack_car2", 1 )
	character_add_vehicle( "lc10_attack3_driver", "lc10_attack_car3", 0 )
	character_add_vehicle( "lc10_attack3_passenger", "lc10_attack_car3", 1 )
	
	on_death( "lc10_guy_dead", "lc10_attack1_driver" )
	on_death( "lc10_guy_dead", "lc10_attack2_driver" )
	on_death( "lc10_guy_dead", "lc10_attack3_driver" )
	
	vehicle_supress_npc_exit( "lc10_turret_car", true )
	lc10_threads[2] = thread_new( "lc10_attackers" )
	lc10_threads[3] = thread_new( "lc10_turret_path" )
	lc10_threads[4] = -1

	mission_help_table( "lc10_destroy_plane" )
	
	while( not lc10_plane_destroyed ) do
		thread_yield()
	end
	
	
	audio_play_for_character( "DEX_LC10_PLANEDIE_1", "lc10_Dex", "voice", false, true )
	
	if (lc10_threads[4] ~= -1) then
		thread_kill(lc10_threads[4])
	end
	
	thread_kill(lc10_threads[2])
	thread_kill(lc10_threads[3])
	
	vehicle_speed_cancel("lc10_turret_car")
	vehicle_stop( "lc10_turret_car" )
	vehicle_go_idle("lc10_turret_car")
	
	cutscene_in("lc10_scene03")
	--vehicle_stop( "lc10_turret_car" )
	
	turret_stop()
	
	for i,thread in pairs(lc10_threads) do
		thread_kill(thread)
	end
	
	vehicle_hide( "lc10_turret_car" )
	character_remove_vehicle("lc10_Dex")
	character_hide( "lc10_Dex" )
	group_destroy( "lc10_Plane" )
	group_destroy("lc10_Ambush")		

	cutscene_play("lc10_scene03")
	character_remove_vehicle("#PLAYER#")
	teleport("#PLAYER#", "lc10_player_port")
	vehicle_mark_as_players( "lc10_$v000" )
	mission_end_success( "lc10" )
end

function lc10_show_group(group)
	for i,char in pairs(group) do
		character_show(char)
		--add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		--on_death("lc10_guy_dead", char)
	end
end

function lc10_attackers()
	vehicle_chase( "lc10_attack_car1", "#PLAYER#", false, false )
	--add_marker_npc( "lc10_attack1_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )

	delay(6)
	vehicle_set_torque_multiplier("lc10_attack_car3", 2.0)
	vehicle_speed_override( "lc10_attack_car3", 65 )
	vehicle_ignore_repulsors( "lc10_attack_car3", true )
	
	vehicle_supress_npc_exit( "lc10_attack_car3", true )
	vehicle_supress_npc_exit( "lc10_attack_car1", true )
	vehicle_supress_npc_exit( "lc10_attack_car2", true )

	vehicle_disable_flee( "lc10_attack_car3", true )
	vehicle_disable_flee( "lc10_attack_car1", true )
	vehicle_disable_flee( "lc10_attack_car2", true )
	
	vehicle_disable_chase( "lc10_attack_car3", true )
	vehicle_disable_chase( "lc10_attack_car1", true )
	vehicle_disable_chase( "lc10_attack_car2", true )
	
	
	--vehicle_pathfind_to( "lc10_attack_car3", "lc10_jump_point", true, false )
	delay(3)
	vehicle_ignore_repulsors( "lc10_attack_car3", false )
	vehicle_speed_cancel( "lc10_attack_car3" )
	--add_marker_npc( "lc10_attack3_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	vehicle_chase( "lc10_attack_car3", "#PLAYER#", false, false )
	
	--vehicle_chase( "lc10_attack_car2", "#PLAYER#", false, false )
end

function lc10_guy_dead(guy)
	on_death("", guy)
	remove_marker_npc(guy)
end

function lc10_all_dead()
	for i,char in pairs(lc10_runupgroup) do
		if not is_dead(char) then
			return false
		end
	end
	
	for i,char in pairs(lc10_rocketgroup) do
		if not is_dead(char) then
			return false
		end
	end
	
	for i,char in pairs(lc10_defendergroup) do
		if not is_dead(char) then
			return false
		end
	end
	
	for i,char in pairs(lc10_roofgroup) do
		if not is_dead(char) then
			return false
		end
	end
	
	return true
end

lc10_dex_speaking = false

lc10_planedam_line = 1
lc10_audio_loop = -1

function lc10_audio_thread()
	while( not lc10_start_final_takeoff ) do
		lc10_audio_loop = audio_play_for_mover("SFX_JET_STAGE1_LOOP", "sr_city_lc10_LearJet", "foley", true, false)
		thread_yield()
	end
	lc10_audio_loop = -1
end

function lc10_planedam()
	if (lc10_dex_speaking) then
		return
	end
	
	if (lc10_planedam_line > 13) then
		return
	end
	
	lc10_dex_speaking = true
	voice_block("lc10_Dex")
	audio_play_for_character( "DEX_LC10_PLANEDAM_"..lc10_planedam_line, "lc10_Dex", "voice", false, true )
	delay(7)
	lc10_planedam_line = lc10_planedam_line + 1
	lc10_dex_speaking = false
end

function lc10_mesh_pathing()
	on_take_damage("lc10_planedam", "sr_city_lc10_LearJet")

		--taxi to runway
	mesh_mover_play_action( "sr_city_lc10_LearJet", "start1" )
	while( not mesh_mover_action_is_done("sr_city_lc10_LearJet") ) do
		thread_yield()
	end
	
	
	local lc10_audio = thread_new("lc10_audio_thread")
	
		--wait for the player
	while( not lc10_start_final_takeoff ) do
		thread_yield()
	end
	
	thread_kill(lc10_audio)
	if (lc10_audio_loop ~= -1) then
		audio_stop(lc10_audio_loop)
	end
	
	--animate down runway
	mesh_mover_play_action( "sr_city_lc10_LearJet", "start2" )
	while( not lc10_failed ) do
		thread_yield()
	end

	delay(3)
	thread_kill(lc10_threads[4])
	vehicle_speed_cancel("lc10_turret_car")
	vehicle_stop( "lc10_turret_car", true )
	vehicle_go_idle("lc10_turret_car")
	--mission_end_success( "lc10" )
	
	delay(1)
	on_take_damage("", "sr_city_lc10_LearJet")
	if not lc10_plane_destroyed then
		mission_end_failure( "lc10", "lc10_fail_takeoff" )
	end
end

function lc10_ramp_car()
	vehicle_ignore_repulsors( "lc10_turret_car", true )
	vehicle_speed_override( "lc10_turret_car", 45 )
	delay(8)
	vehicle_chase( "lc10_attack_car2", "#PLAYER#", false, false )
	--add_marker_npc( "lc10_attack2_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
end

function lc10_turret_path()
	local nav_table1 = {"lc10_$n000", "lc10_$n001", "lc10_$n002", "lc10_$n003", "lc10_$n004", "lc10_$n015", "lc10_$n005",
						"lc10_$n010", "lc10_$n011", "lc10_$n012", "lc10_$n013", "lc10_$n014"  }
	local nav_table2 = { "lc10_$n006", "lc10_$n007", "lc10_$n008", "lc10_$n009" }
	
	local nav_table3 = { "lc10_$n016", "lc10_$n017", "lc10_$n018", "lc10_$n019", "lc10_$n020",
								"lc10_$n021", "lc10_$n022", "lc10_$n023", "lc10_$n024", "lc10_$n025",
								"lc10_$n026", "lc10_$n027", "lc10_$n028", "lc10_$n029", "lc10_$n030",
								"lc10_$n031", "lc10_$n032", "lc10_$n033", "lc10_$n034", "lc10_$n035", 
								"lc10_$n036", "lc10_$n037", "lc10_$n038"}

	local loop_table1 = { "lc10_$nloop000", "lc10_$nloop001", "lc10_$nloop002", "lc10_$nloop003" }
	local loop_end1 = { "lc10_$nloop004", "lc10_$nloop005", "lc10_$nloop006" }
	local loop_table2 = { "lc10_$nloop007", "lc10_$nloop008", "lc10_$nloop009", "lc10_$nloop010", "lc10_$nloop011" }
	local loop_end2 = { "lc10_$nloop012", "lc10_$nloop013", "lc10_$nloop014" }
	local loop_table3 = { "lc10_$nloop015", "lc10_$nloop016", "lc10_$nloop017", "lc10_$nloop018", "lc10_$nloop019" }

	vehicle_infinite_mass("lc10_turret_car", true)
	vehicle_pathfind_to( "lc10_turret_car", nav_table1, true, false )
	
	thread_new("lc10_ramp_car")
	
	vehicle_speed_cancel( "lc10_turret_car" )
	vehicle_ignore_repulsors( "lc10_turret_car", false )
	
	lc10_show_group(lc10_defendergroup)

	vehicle_pathfind_to( "lc10_turret_car", loop_table1, true, false )
	lc10_threads[1] = thread_new( "lc10_mesh_pathing" )
	vehicle_speed_override( "lc10_turret_car", 32)
	vehicle_pathfind_to( "lc10_turret_car", loop_end1, true, false )
	delay(2.5)
	vehicle_chase("lc10_attack_car1", "#PLAYER#", false, false)
	vehicle_chase("lc10_attack_car2", "#PLAYER#", false, false)
	vehicle_chase("lc10_attack_car3", "#PLAYER#", false, false)
	
	lc10_show_group(lc10_roofgroup)
	
	vehicle_speed_override( "lc10_turret_car", 35)
	vehicle_pathfind_to( "lc10_turret_car", loop_table2, true, false )
	vehicle_speed_override( "lc10_turret_car", 75)
	vehicle_pathfind_to( "lc10_turret_car", loop_end2, true, false )
	delay(4)
	vehicle_chase("lc10_attack_car1", "#PLAYER#", false, false)
	vehicle_chase("lc10_attack_car2", "#PLAYER#", false, false)
	vehicle_chase("lc10_attack_car3", "#PLAYER#", false, false)
		
	vehicle_speed_override( "lc10_turret_car", 35)
	
	trigger_enable( "lc10_near_plane" )
	
	vehicle_pathfind_to( "lc10_turret_car", loop_table3, true, false )
	
	--while (not ((is_dead("lc10_attack1_driver") or is_vehicle_destroyed("lc10_attack_car1")) and (is_dead("lc10_attack2_driver") or is_vehicle_destroyed("lc10_attack_car2")) and (is_dead("lc10_attack3_driver") or is_vehicle_destroyed("lc10_attack_car3")) ) ) do
--		vehicle_pathfind_to( "lc10_turret_car", loop_table1, true, false )
--		vehicle_pathfind_to( "lc10_turret_car", loop_table2, true, false )
--		vehicle_pathfind_to( "lc10_turret_car", loop_table3, true, false )
--	end

	
	vehicle_pathfind_to( "lc10_turret_car", nav_table2, true, false )
		
	lc10_threads[4] = thread_new("lc10_speed_monitor")
	vehicle_pathfind_to( "lc10_turret_car", nav_table3, true, true )
	
	--vehicle_chase( "lc10_turret_car", "lc10_plane_thug", false, false )
	--vehicle_chase_mover( "lc10_turret_car", "sr_city_lc10_LearJet", true)
end

function lc10_takeoff_line1()
	voice_block("lc10_Dex")
	audio_play_for_character( "DEX_LC10_TAKEOFF_1", "lc10_Dex", "voice", false, false )
end

function lc10_takeoff_line2()
	voice_block("lc10_Dex")
	audio_play_for_character( "DEX_LC10_TAKEOFF_2", "lc10_Dex", "voice", false, false )
	lc10_failed = true
end

function lc10_speed_monitor()
	local played_warning_line = false
	local played_final_line = false
	while (true) do
		delay(1.0)
		
		if (lc10_plane_destroyed) then
			return
		end
		
		local plane_dist = get_dist_mover_to_nav("sr_city_lc10_LearJet", "lc10_runway_end")
		local car_dist = get_dist_vehicle_to_nav("lc10_turret_car", "lc10_runway_end")
		
		if (not played_warning_line and plane_dist < 100) then
			played_warning_line = true	
			thread_new("lc10_takeoff_line1")
		end
		
		if (not played_final_line and plane_dist < 40) then
			played_final_line = true
			lc10_takeoff_line2()
		end
		
		if (not played_final_line) and (played_warning_line) and (plane_dist > 200) then
			played_final_line = true
			lc10_takeoff_line2()
		end
		
		local dist = get_dist_vehicle_to_mover("lc10_turret_car", "sr_city_lc10_LearJet")
		if (dist > 80) then
			if (car_dist > plane_dist) then
				vehicle_speed_cancel("lc10_turret_car")
			else
				vehicle_speed_override("lc10_turret_car", 1)
			end
		else
			if (car_dist > plane_dist) then
				vehicle_speed_override("lc10_turret_car", dist)
			else
				vehicle_speed_override("lc10_turret_car", 1)
			end
		end		
	end
end

-- TRIGGERS --------------------------------------------------

function lc10_hanger_arrival()
	if( get_char_in_vehicle("lc10_turret_car", 0) ~= "#PLAYER#" ) then
		return
	end

	trigger_disable( "lc10_hanger" )
	remove_marker_trigger( "lc10_hanger" )
	hud_timer_stop()
	lc10_hanger_reached = true
	
	on_trigger( "lc10_start_plane_takeoff", "lc10_near_plane" )
end

function lc10_start_plane_takeoff()
	trigger_disable( "lc10_near_plane" )
	
	lc10_start_final_takeoff = true
end

function lc10_plane_destruction()
	on_take_damage("", "sr_city_lc10_LearJet")
	mesh_mover_stop_action( "sr_city_lc10_LearJet" )
	damage_indicator_off()

	lc10_plane_destroyed = true
end

function lc10_ambush_execute()
	if (not lc10_plane_destroyed) then
		group_create( "lc10_Ambush", true )
	end
	
	if (not lc10_plane_destroyed) then
		character_add_vehicle( "lc10_attack4_driver", "lc10_attack_car4", 0 )
		character_add_vehicle( "lc10_attack4_passenger", "lc10_attack_car4", 1 )
		
		vehicle_chase( "lc10_attack_car4", "#PLAYER#", false, false )
	end
end

-- FAILURE CALLBACKS -----------------------------------------------

function lc10_timer_failure()

	audio_play_for_character( "DEX_LC10_TIMEOUT_1", "lc10_Dex", "voice", false, true )

	mission_end_failure( "lc10", "lc10_fail_timer" )
end

function lc10_fail_vehicle()
	delay(5)
	mission_end_failure( "lc10", "lc10_fail_vehicle" )
end

function lc10_dex_failure()
	mission_end_failure( "lc10", "lc10_fail_dex" )
end

function lc10_abandon_dex_failure()
	mission_end_failure( "lc10", "lc10_abandon_dex" )
end

-- CUTSCENES ---------------------------------------------------