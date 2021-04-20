-- vk07.lua
-- script for VK Mission 7
-- created 2/17/05



-- GLOBAL VARIABLES ---------------------
vk07_drivers_dead = 0
vk07_warren_path_old = {"vk07_warren_path1", "vk07_warren_path2", "vk07_warren_path3", 
							"vk07_warren_path4", "vk07_warren_path6", "vk07_warren_path7", 
							"vk07_warren_path8", "vk07_warren_path9", "vk07_warren_path10", 
							"vk07_warren_path11", "vk07_warren_path12", "vk07_warren_path13", 
							"vk07_warren_path14", "vk07_warren_path15", "vk07_warren_path16" }
							
vk07_warren_path = { "vk07_wpath000", "vk07_wpath001", "vk07_wpath002", "vk07_wpath003",
							"vk07_wpath004", "vk07_wpath005", "vk07_wpath006", "vk07_wpath007",
							"vk07_wpath008", "vk07_wpath009", "vk07_wpath010", "vk07_wpath011",
							"vk07_wpath012", "vk07_wpath013", "vk07_wpath014", "vk07_wpath015",
							"vk07_wpath016", "vk07_wpath017", "vk07_wpath018", "vk07_wpath019",
							"vk07_wpath020", "vk07_wpath021", "vk07_wpath022", "vk07_wpath023", 
							"vk07_wpath024", "vk07_wpath025", "vk07_wpath025" }

vk07_warren_patrol = { "vk07_wpatrol000", "vk07_wpatrol001", "vk07_wpatrol002", "vk07_wpatrol003",
							"vk07_wpatrol004", "vk07_wpatrol005" }
							
vk07_patrol_thread = -1
vk07_warren_thread = -1

Vk07_king_health = 300
Vk07_king_timer_thread = -1

vk07_force_fires = { "vk07_attacker13", 
							"vk07_attacker17", 
							"vk07_attacker16", 
							"vk07_attacker3", 
							"vk07_attacker5", 
							"vk07_attacker6",
							}

Vk07_threads = {}

Vk07_warren_dead = false

vk07_created_warren = false

-- FUNCTIONS ----------------------------


function vk07_fail_mission()
	mission_end_failure("vk07", "vk07_fail_king_death")
end

function vk07_fail_mission2()
	mission_end_failure("vk07", "vk07_fail_timeout")
end

function vk07_fail_mission3()
	mission_end_failure("vk07", "vk07_car_dead")
end

function vk07_fail_mission4()
	mission_end_failure("vk07", "vk07_fail_king_dismiss")
end

function vk07_abandoned_car()
	mission_end_failure("vk07", "vk07_abandoned_car")
end

function vk07_enter_car2()
	remove_marker_vehicle("vk07_car_king")
	
	if (Vk07_warren_dead) then
		trigger_enable("vk07_king_drop_off")
		mission_help_table_nag( "vk07_return_to_sr" )
		add_marker_trigger("vk07_king_drop_off", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
		mission_waypoint_add("vk07_church_gps")
	end
	
	hud_timer_stop()
end

function vk07_leave_car()
	add_marker_vehicle("vk07_car_king", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE) 
	mission_help_table_nag("vk07_get_in_car")
	hud_timer_set(30 * 1000, "vk07_abandoned_car")
	
	if (Vk07_warren_dead) then
		trigger_disable("vk07_king_drop_off")
		remove_marker_trigger("vk07_king_drop_off")
		mission_waypoint_remove()
	end
	
end

function vk07_maybe_end_mission()
	if ((get_char_in_vehicle("vk07_car_king", 0) == "#PLAYER#") and (get_dist_char_to_char("#PLAYER#", "vk07_BenKing") < 20.0)) then
		hud_timer_stop()
		on_vehicle_enter("", "vk07_car_king")
		on_vehicle_exit("", "vk07_car_king")
	
		trigger_disable("vk07_king_drop_off")
		vehicle_stop("#PLAYER#")
		cutscene_in("vk07_scene02")
		cutscene_play("vk07_scene02", true)
		player_controls_enable()
		mission_end_success("vk07")
	end
end

function vk07_warren_dead()
	on_vehicle_destroyed("", "vk07_car_warren")
	on_damage("", "vk07_car_warren", 0.1)
	damage_indicator_off()
	thread_kill(vk07_warren_thread)
	if (not is_vehicle_destroyed("vk07_car_warren")) then
		set_current_hit_points("vk07_car_warren", 10000) 
		vehicle_set_smoke_and_fire_state("vk07_car_warren", true, true) 
		turn_invulnerable("vk07_car_warren", false)
		vehicle_disable_flee("vk07_car_warren", true)
		vehicle_disable_chase("vk07_car_warren", true)
		vehicle_stop("vk07_car_warren")
	end
	
	set_ignore_ai_flag("vk07_warren", true)	
	set_traffic_density(1)
	distance_display_off()
	remove_marker_npc("vk07_warren")
	remove_marker_vehicle("vk07_car_warren")
	
	Vk07_warren_dead = true
	delay(2)
	audio_play_for_character("KING_VK7_CAR_6", "vk07_BenKing", "voice")
	mission_help_table( "vk07_return_to_sr" )
	notoriety_reset("vice_kings")
	notoriety_set("vice_kings", 4)
	trigger_enable("vk07_king_drop_off")
	add_marker_trigger("vk07_king_drop_off", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	mission_waypoint_add("vk07_church_gps")
end

function vk07_vehicle_drive()
	vehicle_speed_override("vk07_car_warren", 48)
	vehicle_turret_base_to("vk07_car_warren", "vk07_start_flee", false)
	vehicle_pathfind_to("vk07_car_warren", vk07_warren_path, true, false)
	vehicle_flee("vk07_car_warren", "#PLAYER#", false)
	--vehicle_infinite_mass("vk07_car_warren", false)
	attack("vk07_warren")
	while (not Vk07_warren_dead) do
		delay(10)
		vehicle_flee("vk07_car_warren", "#PLAYER#", false)
	end
end

function vk07_patrol()
	while vehicle_pathfind_to("vk07_car_warren", vk07_warren_patrol, false, false) do
		thread_yield()
	end
end

function vk07_timer_end()
	mission_end_failure("vk07", "vk07_fell_behind")
end

function vk07_check_dist()
	local timer_on = false
	while not Vk07_warren_dead do
		if (get_dist_char_to_char("#PLAYER#", "vk07_warren") > 125.0) then
			if not timer_on then
				mission_help_table("vk07_falling_behind")
				hud_timer_set(1000 * 30, "vk07_timer_end")
				timer_on = true
			end
		else
			if timer_on then
				hud_timer_stop()
				timer_on = false
			end
		end
		
		thread_yield()
	end
end

function vk07_taunts()
	while (get_dist_char_to_char("#PLAYER#", "vk07_warren") > 30.0) do
		thread_yield()
	end
	
	damage_indicator_on("vk07_car_warren", 0.1, "vk07_warren_car")
	vehicle_infinite_mass("vk07_car_warren", false)
	vehicle_prevent_explosion_fling("vk07_car_warren", false)
	
	
	audio_play_for_character("WARREN_VK7_ATTACK_1", "vk07_warren", "voice", false, true)
	audio_play_for_character("KING_VK7_CAR_3", "vk07_BenKing", "voice")
	
	turn_vulnerable("vk07_car_warren")
	turn_vulnerable("vk07_warren")
	set_ignore_ai_flag("vk07_warren", false)
	attack("vk07_warren", "vk07_BenKing", false)
	attack("vk07_BenKing", "vk07_warren", false)
	distance_display_on("vk07_warren", 200, 0, 00, 125) 
	thread_kill(vk07_patrol_thread)
	vk07_warren_thread = thread_new("vk07_vehicle_drive")
	thread_new("vk07_check_dist")
	
	delay(7)
	
	if Vk07_warren_dead then
		return
	end
	
	audio_play_for_character("WARREN_VK7_ATTACK_2", "vk07_warren", "voice")
	
	while ((get_dist_char_to_char("#PLAYER#", "vk07_warren") > 40.0)) do
		thread_yield()
	end
	
	delay(5)
	
	if Vk07_warren_dead then
		
	end
	
	delay(6)
	
	audio_play_for_character("WARREN_VK7_ATTACK_3", "vk07_warren", "voice")
	
	while ((get_dist_char_to_char("#PLAYER#", "vk07_warren") > 40.0)) do
		thread_yield()		
	end
	
	delay(8)
	
	if Vk07_warren_dead then
		return
	end
	
	audio_play_for_character("WARREN_VK7_ATTACK_4", "vk07_warren", "voice")
	
	while ((get_dist_char_to_char("#PLAYER#", "vk07_warren") > 40.0)) do
		thread_yield()
	end
	
	delay(5)
	
	if Vk07_warren_dead then
		return
	end
	
	audio_play_for_character("KING_VK7_CAR_5", "vk07_BenKing", "voice")
	
	while ((get_dist_char_to_char("#PLAYER#", "vk07_warren") > 40.0)) do
		thread_yield()
	end
	
	delay(7)
	
	while ((get_dist_char_to_char("#PLAYER#", "vk07_warren") > 40.0)) do
		thread_yield()
	end
	
	delay(7)
	
	if Vk07_warren_dead then
		return
	end
	
	audio_play_for_character("WARREN_VK7_DAMAGE_1", "vk07_warren", "voice")
end

function vk07_driver_dead(character_name)
	debug_message("One dead")
	vk07_drivers_dead = vk07_drivers_dead + 1
	
	if (is_dead("vk07_driver1")) then
		remove_marker_npc("vk07_driver1")
	end
	
	if (is_dead("vk07_driver2")) then
		remove_marker_npc("vk07_driver2")
	end
	
	if (is_dead("vk07_driver3")) then
		remove_marker_npc("vk07_driver3")
	end
	
	if (is_dead("vk07_driver4")) then
		remove_marker_npc("vk07_driver4")
	end
	
	if (vk07_drivers_dead == 2) then 
	end
	
	if (vk07_drivers_dead == 4) then
		delay(3)
		mission_help_table( "vk07_defeat_warren" )
		
		audio_play_for_character("KING_VK7_CAR_2", "vk07_BenKing", "voice")
	
		add_marker_npc("vk07_warren", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)		
		thread_new("vk07_taunts")
		
		-- car_combat("vk07_warren")
	end
end

function vk07_start_chase1()
	delay(0)
	teleport("#PLAYER#", "vk07_wpatrol005")
	delay(1)
	--vk07_create_ben_king()
	create_group("vk07_king_car_group", true)
	party_add("vk07_BenKing")
	hearing_enable("vk07_BenKing")
	set_ignore_ai_flag("vk07_BenKing", false)
	character_add_vehicle("#PLAYER#", "vk07_car_king", 0)
	character_add_vehicle("vk07_BenKing", "vk07_car_king", 1)
end

function vk07_start_chase2()
	message("warping...")
	on_vehicle_enter("", "vk07_car_king") 
	delay(0)
	teleport("#PLAYER#", "vk07_wpatrol005")
	delay(1)
	--vk07_create_ben_king()
	create_group("vk07_king_car_group", true)
	party_add("vk07_BenKing")
	hearing_enable("vk07_BenKing")
	set_ignore_ai_flag("vk07_BenKing", false)
	character_add_vehicle("#PLAYER#", "vk07_car_king", 0)
	character_add_vehicle("vk07_BenKing", "vk07_car_king", 1)
	vk07_create_warren()
	vk07_drivers_dead = 3
	vk07_driver_dead("")	
end

function vk07_leave_trigger()
	remove_marker_vehicle("vk07_car_king") 
	trigger_disable("vk07_leave_trigger")
	trigger_disable("vk07_leave_trigger2")
	on_vehicle_enter("", "vk07_car_king") 
	remove_marker_npc("vk07_BenKing")
	
	on_vehicle_enter("vk07_enter_car2", "vk07_car_king")
	on_vehicle_exit("vk07_leave_car", "vk07_car_king")
	
	while ( (get_char_in_vehicle("vk07_car_king",0) ~= "#PLAYER#") and 
			(get_char_in_vehicle("vk07_car_king",1) ~= "vk07_BenKing") ) do
		thread_yield()
	end
	
	create_group("vk07_car_attack", true)
	create_group("vk07_car_attack2", true)
	
	mission_help_table("vk07_defeat_vk")
	add_marker_npc("vk07_driver1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL) 
	add_marker_npc("vk07_driver2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL) 
	character_add_vehicle("vk07_driver1", "vk07_car_attack1", 0)
	character_add_vehicle("vk07_passenger1", "vk07_car_attack1", 1)
	character_add_vehicle("vk07_driver2", "vk07_car_attack2", 0)
	character_add_vehicle("vk07_driver3", "vk07_car_attack3", 0)
	character_add_vehicle("vk07_passenger3", "vk07_car_attack3", 1)
	character_add_vehicle("vk07_driver4", "vk07_car_attack4", 0)
	vehicle_disable_flee("vk07_car_attack3", true)
	vehicle_disable_flee("vk07_car_attack4", true)
	vehicle_disable_chase("vk07_car_attack3", true)
	vehicle_disable_chase("vk07_car_attack4", true)
	vehicle_disable_flee("vk07_car_attack1", true)
	vehicle_disable_flee("vk07_car_attack2", true)
	vehicle_disable_chase("vk07_car_attack1", true)
	vehicle_disable_chase("vk07_car_attack2", true)
	
	set_ignore_ai_flag("vk07_driver2", true)
	set_ignore_ai_flag("vk07_driver3", true)
	set_ignore_ai_flag("vk07_driver4", true)
	vehicle_chase("vk07_car_attack1", "#PLAYER#", false)
	delay(6)
	set_ignore_ai_flag("vk07_driver2", false)
	vehicle_chase("vk07_car_attack2", "#PLAYER#", false)
	delay(8)
	add_marker_npc("vk07_driver3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL) 
	add_marker_npc("vk07_driver4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL) 
	
	set_ignore_ai_flag("vk07_driver3", false)
	vehicle_chase("vk07_car_attack3", "#PLAYER#", false)
	delay(6)
	set_ignore_ai_flag("vk07_driver4", false)
	vehicle_chase("vk07_car_attack4", "#PLAYER#", false)
end

function vk07_enter_car()
	move_to("vk07_BenKing", "vk07_$execute lua script001", 2)
	vehicle_enter("vk07_BenKing", "vk07_car_king", 1)
end
	
function vk07_create_warren()
	if (vk07_created_warren) then
		return
	end
	vk07_created_warren = true
	create_group("vk07_warren_group", true)
	character_add_vehicle("vk07_warren", "vk07_car_warren", 0)
	
	on_damage("vk07_warren_dead", "vk07_car_warren", 0.1)
	on_vehicle_destroyed("vk07_warren_dead", "vk07_car_warren")
	
	vehicle_disable_flee("vk07_car_warren", true)
	vehicle_disable_chase("vk07_car_warren", true)
	
	vehicle_supress_npc_exit("vk07_car_warren", true)
	set_unjackable_flag("vk07_car_warren", true)
	
	human_disallow_ragdoll("vk07_warren")
	vehicle_infinite_mass("vk07_car_warren", true)
	vehicle_prevent_explosion_fling("vk07_car_warren", true)
	set_ignore_ai_flag("vk07_warren", true)
	vehicle_speed_override("vk07_car_warren", 85)
	turn_invulnerable("vk07_car_warren")
	turn_invulnerable("vk07_warren")
	vk07_patrol_thread = thread_new("vk07_patrol")
end
		
function vk07_king_trigger()
	while (get_dist_char_to_char("#PLAYER#", "vk07_BenKing") > 12) do
		thread_yield()
	end
	
	Vk07_king_found = true
	
	forced_target_clear("vk07_BenKing") 

	if (Vk07_king_timer_thread ~= -1) then
		thread_kill(Vk07_king_timer_thread)
	end
	
	mission_waypoint_remove()
	
	for i,guy in pairs(vk07_force_fires) do
		thread_kill(Vk07_threads[guy])
		on_detection("vk07_detection", guy)
	end
	
	local hit_points = (Vk07_king_health / 300) * get_max_hit_points("vk07_BenKing")
	set_current_hit_points("vk07_BenKing", hit_points)
	hud_bar_off()
	
	set_traffic_density(0.4)
	audio_play_for_character("KING_VK7_CAR_1", "vk07_BenKing", "voice")
	mission_help_table("vk07_defend_king")
	trigger_enable("vk07_leave_trigger")
	trigger_enable("vk07_leave_trigger2")
	create_group("vk07_attackers2", true)
	npc_unholster_best_weapon("vk07_attacker2-1");
	npc_unholster_best_weapon("vk07_attacker2-2");
	npc_unholster_best_weapon("vk07_attacker2-3");
	npc_unholster_best_weapon("vk07_attacker2-4");
	npc_unholster_best_weapon("vk07_attacker2-5");
	npc_unholster_best_weapon("vk07_attacker2-6");
	npc_unholster_best_weapon("vk07_attacker2-7");
	npc_unholster_best_weapon("vk07_attacker2-8");
	party_dismiss("#FOLLOWER3#")
	remove_marker_npc("vk07_BenKing")
	party_add("vk07_BenKing")
	hearing_enable("vk07_BenKing")
	turn_vulnerable("vk07_BenKing")
	set_ignore_ai_flag("vk07_BenKing", false)
	party_set_dismissable(false)
	thread_new("vk07_create_warren")
	create_group("vk07_king_car_group", true)
	on_vehicle_destroyed("vk07_fail_mission3", "vk07_car_king")
	add_marker_vehicle("vk07_car_king", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE) 
	-- thread_new("vk07_enter_car")
	delay(5)
	attack("vk07_attacker1", "vk07_BenKing")
	attack("vk07_attacker3", "vk07_BenKing")
	attack("vk07_attacker5", "vk07_BenKing")
	attack("vk07_attacker14", "vk07_BenKing")
	attack("vk07_attacker2-1", "vk07_BenKing")
	delay(5)
	attack("vk07_attacker7", "vk07_BenKing")
	attack("vk07_attacker11", "vk07_BenKing")
	attack("vk07_attacker13", "vk07_BenKing")
	attack("vk07_attacker16", "vk07_BenKing")
	attack("vk07_attacker2-5", "vk07_BenKing")
	--audio_play_for_character("VOC_BMVK_VK7Attack_1", "vk07_attacker2-5", "voice")
	delay(5)
	attack("vk07_attacker2-2", "vk07_BenKing")
	attack("vk07_attacker2-4", "vk07_BenKing")
	attack("vk07_attacker2-8", "vk07_BenKing")
	delay(5)
	attack("vk07_attacker2-3", "vk07_BenKing")
	attack("vk07_attacker2-6", "vk07_BenKing")
	attack("vk07_attacker2-7", "vk07_BenKing")
end

function vk07_cleanup()
	mission_waypoint_remove()
	distance_display_off()
	set_traffic_density(1)
	damage_indicator_off()
	
	for i,guy in pairs(vk07_force_fires) do
		thread_kill(Vk07_threads[guy])
		on_detection("vk07_detection", guy)
	end
	
	on_vehicle_enter("", "vk07_car_king")
	on_vehicle_exit("", "vk07_car_king")
	
	on_trigger("", "vk07_king_drop_off")
	on_death("", "vk07_driver1")
	on_death("", "vk07_driver2")
	on_death("", "vk07_driver3")
	on_death("", "vk07_driver4")
	on_death("", "vk07_BenKing")
	on_dismiss("", "vk07_BenKing")
	on_damage("", "vk07_car_warren", 0.1)
	
	remove_marker_npc("vk07_warren")
	remove_marker_npc("vk07_BenKing")
	remove_marker_npc("vk07_driver1")
	remove_marker_npc("vk07_driver2")
	remove_marker_npc("vk07_driver3")
	remove_marker_npc("vk07_driver4")
	remove_marker_vehicle("vk07_car_king") 
	remove_marker_trigger("vk07_king_drop_off")
	
	trigger_disable("vk07_leave_trigger")
	trigger_disable("vk07_leave_trigger2")
	trigger_disable("vk07_king_drop_off")
	
	notoriety_reset("vice_kings")
	party_dismiss("vk07_BenKing")
	party_set_dismissable(true)
	
	release_to_world("vk07_attackers")
	release_to_world("vk07_attackers2")
	group_destroy("vk07_benking")
	release_to_world("vk07_car_attack")
	release_to_world("vk07_car_attack2")
	group_destroy("vk07_warren_group")
	release_to_world("vk07_king_car_group")
	
	hud_bar_off()
end

function vk07_success()
	mission_unlock("redlight_sh_rooftop")
	hood_set_owner("vk_museum02","Playas")
end

function vk07_create_ben_king()
	create_group("vk07_benking", true)
	--set_ignore_ai_flag("vk07_BenKing", true)
	turn_invulnerable("vk07_BenKing", false)
	add_marker_npc("vk07_BenKing", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
end


function vk07_king_timer()
	Vk07_king_health = 400
	while (Vk07_king_health > 0) do
		hud_bar_set_value(Vk07_king_health)
		Vk07_king_health = Vk07_king_health - 2
		delay(1)
	end
	
	Vk07_king_timer_thread = -1
	mission_end_failure("vk07", "vk07_fail_timeout")
end

function vk07_start()
	set_mission_author("Sandeep Shekar")
	--set_mission_author("Russell Aasland")
	--set_mission_author("David Cobb")
	vk07_created_warren = false

	vk07_patrol_thread = -1
	vk07_warren_thread = -1
	
	Vk07_king_found = false
	Vk07_warren_dead = false
	
	-- on_trigger("vk07_leave_trigger", "vk07_leave_trigger") 
	-- on_trigger("vk07_leave_trigger", "vk07_leave_trigger2")
	on_vehicle_enter("vk07_leave_trigger", "vk07_car_king") 
	on_trigger("vk07_maybe_end_mission", "vk07_king_drop_off")
	on_death("vk07_driver_dead", "vk07_driver1")
	on_death("vk07_driver_dead", "vk07_driver2")
	on_death("vk07_driver_dead", "vk07_driver3")
	on_death("vk07_driver_dead", "vk07_driver4")
	on_death("vk07_fail_mission", "vk07_BenKing")
	on_dismiss("vk07_fail_mission4", "vk07_BenKing")
	
	notoriety_set_max("vice_kings", 1)
	
	vk07_drivers_dead = 0
	
	for i,guy in pairs(vk07_force_fires) do
		Vk07_threads[guy] = -1
	end
	
	cutscene_in("vk07_scene01")
	set_time_of_day(22,30)
	cutscene_play("vk07_scene01")
	teleport("#PLAYER#", "mission_start_vk07")
	cutscene_out()
	
	--hud_timer_set(1000 * 60 * 5, "vk07_fail_mission2")
	hud_bar_set_range(0,400)
	hud_bar_on("Health", "vk07_king_health", 200)
	hud_bar_set_value(400)
	
	Vk07_king_timer_thread = thread_new("vk07_king_timer")
	delay(2)
	mission_help_table( "vk07_goto_museum" )
	
	mission_waypoint_add("vk07_king_gps")
	delay(7)
	mission_help_table_nag("vk07_king_timer")
	thread_new("vk07_create_ben_king")
	
	create_group("vk07_attackers", true)
	npc_unholster_best_weapon("vk07_attacker1");
	npc_unholster_best_weapon("vk07_attacker2");
	npc_unholster_best_weapon("vk07_attacker3");
	npc_unholster_best_weapon("vk07_attacker4");
	npc_unholster_best_weapon("vk07_attacker5");
	npc_unholster_best_weapon("vk07_attacker6");
	npc_unholster_best_weapon("vk07_attacker7");
	npc_unholster_best_weapon("vk07_attacker8");
	npc_unholster_best_weapon("vk07_attacker9");	
	npc_unholster_best_weapon("vk07_attacker10");
	npc_unholster_best_weapon("vk07_attacker11");
	npc_unholster_best_weapon("vk07_attacker13");
	npc_unholster_best_weapon("vk07_attacker14");
	npc_unholster_best_weapon("vk07_attacker15");
	npc_unholster_best_weapon("vk07_attacker16");
	npc_unholster_best_weapon("vk07_attacker17");
	
	for i,guy in pairs(vk07_force_fires) do
		Vk07_threads[guy] = thread_new("vk07_fire", guy)
	end
	
	while get_dist_char_to_char("#PLAYER#", "vk07_BenKing") > 100 do
		thread_yield()
	end
	
	thread_new("vk07_king_trigger")
	
	while (not Vk07_king_found) do
		local num = rand_int(1,3)
		forced_target_set("vk07_BenKing", vk07_force_fires[num]) 
		attack("vk07_BenKing", vk07_force_fires[num])
		delay(5)
	end
end

function vk07_detection(guy)
	mission_debug("detection!")
	on_detection("", guy)
	on_take_damage("", guy)
	thread_kill(Vk07_threads[guy])
	Vk07_threads[guy] = -1
end

function vk07_fire(guy)
	mission_debug("fire "..guy)
	on_detection("vk07_detection", guy)
	on_take_damage("vk07_detection", guy)
	
	while (true) do
		if (is_dead(guy)) then
			return
		end
		
		delay(rand_int(2,5))
		
		force_fire(guy, "vk07_king_target", true)
		if (rand_int(0,99)<60) then
			force_fire(guy, "vk07_king_target", true)
		
			if (rand_int(0,99)<30) then
				force_fire(guy, "vk07_king_target", true)
			end
		end
	end
end