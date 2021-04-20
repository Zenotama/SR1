-- Global Variables------

-- Rewards
Wr07_hood_reward = ""

Wr07_limo_attacked = false

Wr07_limo_destroyed = false

Wr07_limo_route = {
	"wr07_$n_limo1",  "wr07_$n_limo2",  "wr07_$n_limo3",  "wr07_$n_limo4",  "wr07_$n_limo5",
	"wr07_$n_limo6",  "wr07_$n_limo7",  "wr07_$n_limo8",  "wr07_$n_limo9",  "wr07_$n_limo10",
	"wr07_$n_limo11", "wr07_$n_limo12", "wr07_$n_limo13",	"wr07_$n_limo14", "wr07_$n_limo15",
	"wr07_$n_limo16",
}

Wr07_limo_patrol_thread = -1

Wr07_notoriety_bump_thread = -1

Wr07_warning_done = true

Wr07_dist_warning = 90

Wr07_dist_attack = 15

Wr07_dist_got_away = 100

Wr07_current_notoriety = 0

Wr07_next_waypoint = 1

Wr07_chatter_thread = -1

Wr07_flee_route = {
	"wr07__$nsr000", "wr07__$nsr001", "wr07__$nsr002", "wr07__$nsr003", "wr07__$nsr004", "wr07__$nsr005", "wr07__$nsr006", "wr07__$nsr007", "wr07__$nsr008", "wr07__$nsr009", 
	"wr07__$nsr010", "wr07__$nsr011", "wr07__$nsr012", "wr07__$nsr013", "wr07__$nsr014", "wr07__$nsr015", "wr07__$nsr016", "wr07__$nsr017", "wr07__$nsr018", "wr07__$nsr019", 
	"wr07__$nsr020", "wr07__$nsr021", "wr07__$nsr022", "wr07__$nsr023", "wr07__$nsr024", "wr07__$nsr025", "wr07__$nsr026", "wr07__$nsr027", "wr07__$nsr028", "wr07__$nsr029", 
	"wr07__$nsr030", "wr07__$nsr031", "wr07__$nsr032", "wr07__$nsr033", "wr07__$nsr034", "wr07__$nsr035", "wr07__$nsr036", "wr07__$nsr037", "wr07__$nsr038", "wr07__$nsr039", 
	"wr07__$nsr040", "wr07__$nsr041"
}

-- FUNCTIONS ----------------------------

function wr07_cleanup()
	mission_waypoint_remove()
	damage_indicator_off()
	hud_timer_stop()
	remove_marker_npc("wr07_$c_sharp")
	remove_marker_vehicle("wr07_$v_limo")
	on_take_damage("", "wr07_$v_limo") 
	on_vehicle_destroyed("", "wr07_$v_limo")
	set_unjackable_flag("wr07_$v_limo", false)
	release_to_world("wr07_$v_limo")
	release_to_world("wr07_$c_roller1")
	release_to_world("wr07_$c_roller2")
	release_to_world("wr07_$c_roller3")
	group_destroy("wr07_$g_sharps_crew")
	on_death("", "#PLAYER#")
	thread_kill(Wr07_limo_patrol_thread)
	thread_kill(Wr07_notoriety_bump_thread)
	notoriety_set_min("rollers", 0)
	distance_display_off()
	
	persona_override_remove_all("SP_SHARP")
	
	release_to_world("wr07_$g_temp")
end

function wr07_success()
	props_add("rollers", Wr07_respect_reward)
	cash_add(Wr07_cash_reward)
	--AM 5/28/06: stronghold order changed
	--mission_unlock("wrsuburb_stronghold_apart")
	mission_unlock("truckyard_stronghold")
	mission_set_next_props_req("rollers", Wr08_min_respect_required)
	if Wr07_hood_reward ~= "" then
		hood_set_owner(Wr07_hood_reward, "Playas")
	end
	radio_post_event("NEWS_WR_BODYOFSHARPE", false)
end

function wr07_located()
	while (get_dist_char_to_char("#PLAYER#", "wr07_$c_sharp") > 100) do
		thread_yield()
	end
		
	while (get_dist_char_to_char("#PLAYER#", "wr07_$c_sharp") > 20) do
		thread_yield()
	end
	
	Wr07_chatter_thread = -1
	thread_new("wr07_on_limo_damage", "wr07_$v_limo", "#PLAYER#")
end

function wr07_flee_lines()
	audio_play_for_character("SHARP_WR7_FLEELIMO_1", "wr07_$c_sharp", "voice", false, true)
	audio_play_for_character("SHARP_WR7_FLEELIMO_2", "wr07_$c_sharp", "voice", false, true)
	audio_play_for_character("SHARP_WR7_FLEELIMO_3", "wr07_$c_sharp", "voice", false, true)
end

-- Called by mission trigger
function wr07_start()
	set_mission_author("Sean Rose")
	cutscene_in("wr07_scene01")
	party_dismiss_all()
	
	Wr07_current_notoriety = 0
	
	cutscene_play("wr07_scene01")
	teleport("#PLAYER#", "mission_start_wr07")
	
	on_death("wr07_player_died", "#PLAYER#")
	
	local player_hps = get_max_hit_points("#PLAYER#") * 0.05
	set_current_hit_points("#PLAYER#", player_hps)

	group_create("wr07_$g_temp", true)
	group_create("wr07_$g_sharps_crew", true)
	
	local limo_hps = get_max_hit_points("wr07_$v_limo") * 2.0
	set_max_hit_points("wr07_$v_limo", limo_hps)
	set_current_hit_points("wr07_$v_limo", limo_hps)
	
	add_marker_vehicle("wr07_$v_limo", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	
	character_add_vehicle("wr07_$c_roller1", "wr07_$v_limo", 0)
	character_add_vehicle("wr07_$c_roller2", "wr07_$v_limo", 1)
	character_add_vehicle("wr07_$c_roller3", "wr07_$v_limo", 2)
	character_add_vehicle("wr07_$c_sharp", "wr07_$v_limo", 3)
	vehicle_supress_npc_exit("wr07_$v_limo", true)
	set_unjackable_flag("wr07_$v_limo", true)
	vehicle_set_bulletproof_glass("wr07_$v_limo", true)
	vehicle_never_flatten_tires("wr07_$v_limo", true)

	Wr07_limo_attacked = false
	on_take_damage("wr07_on_limo_damage", "wr07_$v_limo")
	
	Wr07_next_waypoint = 1
	hud_timer_set(2 * 60 * 1000, "wr07_times_up")
	mission_waypoint_add("wr07_sp_limo01#000")
	delay(2)
	mission_help_table("wr07_intro")
	
	while get_dist_char_to_vehicle("#PLAYER#", "wr07_$v_limo") > 100 do
		delay(0.1)
	end
	
	mission_waypoint_remove()
	Wr07_limo_patrol_thread = thread_new("wr07_limo_patrol")
	
	while get_dist_char_to_vehicle("#PLAYER#", "wr07_$v_limo") > 70 do
		delay(0.1)
	end
	
	hud_timer_stop()
	damage_indicator_on("wr07_$v_limo", 0.15, "wr07_limo")
	on_vehicle_destroyed("wr07_on_limo_destroyed", "wr07_$v_limo")
	Wr07_limo_destroyed = false
	
	mission_help_table("wr07_found_sharp")
	Wr07_warning_done = false
	
	Wr07_notoriety_bump_thread = thread_new("wr07_notoriety_bump")
	distance_display_on("wr07_$c_sharp", 0, 500, 0, Wr07_dist_got_away)
	
	Wr07_chatter_thread = thread_new("wr07_located")

	local fire, smoke
	while true do
		if is_vehicle_destroyed("wr07_$v_limo") == true then
			damage_indicator_off()
			remove_marker_vehicle("wr07_$v_limo")
			add_marker_npc("wr07_$c_sharp", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			turn_vulnerable("wr07_$c_sharp")
			persona_override_remove_all("SP_SHARP")
			persona_override_persona_start("SP_SHARP", "threat - alert (solo attack)", "SHARP_WR7_ATTKFOOT") 
			persona_override_persona_start("SP_SHARP", "threat - alert (group attack)", "SHARP_WR7_ATTKFOOT") 
			persona_override_persona_start("SP_SHARP", "threat - damage received (firearm)", "SHARP_WR7_DAMFOOT") 
			delay(2)
			thread_kill(Wr07_limo_patrol_thread)
			thread_kill(Wr07_chatter_thread)
			flee("wr07_$c_sharp", "#PLAYER#")
			attack("wr07_$c_roller1", "#PLAYER#")
			attack("wr07_$c_roller2", "#PLAYER#")
			attack("wr07_$c_roller3", "#PLAYER#")
			thread_new("wr07_flee_lines")
			break
		end

		local d = get_dist_char_to_vehicle("#PLAYER#", "wr07_$v_limo")
		if d > Wr07_dist_got_away then
			if not Wr07_warning_done then
				vehicle_speed_override("wr07_$v_limo", 45)
				mission_help_table_nag("wr07_too_far")
				hud_timer_set(30 * 1000, "wr07_losing")
				Wr07_warning_done = true
			end
		else
			vehicle_speed_override("wr07_$v_limo", 65)
			Wr07_warning_done = false
			hud_timer_stop()
		end
		
		smoke, fire = vehicle_get_smoke_and_fire_state("wr07_$v_limo")

		if fire == true or is_dead("wr07_$c_roller1") or get_char_in_vehicle("wr07_$v_limo", 0) == nil or
				get_char_in_vehicle("wr07_$v_limo", 3) == nil then
			damage_indicator_off()

			turn_vulnerable("wr07_$c_sharp")
			vehicle_supress_npc_exit("wr07_$v_limo", false)
			vehicle_exit("wr07_$c_sharp")
			vehicle_exit("wr07_$c_roller1")
			vehicle_exit("wr07_$c_roller2")
			vehicle_exit("wr07_$c_roller3")
			thread_kill(Wr07_limo_patrol_thread)
			thread_kill(Wr07_chatter_thread)
			set_unjackable_flag("wr07_$v_limo", false)
			
			remove_marker_vehicle("wr07_$v_limo")
			add_marker_npc("wr07_$c_sharp", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	
			persona_override_remove_all("SP_SHARP")
			persona_override_persona_start("SP_SHARP", "threat - alert (solo attack)", "SHARP_WR7_ATTKFOOT") 
			persona_override_persona_start("SP_SHARP", "threat - alert (group attack)", "SHARP_WR7_ATTKFOOT") 
			persona_override_persona_start("SP_SHARP", "threat - damage received (firearm)", "SHARP_WR7_DAMFOOT") 
			delay(2)
			flee("wr07_$c_sharp", "#PLAYER#")
			attack("wr07_$c_roller1", "#PLAYER#")
			attack("wr07_$c_roller2", "#PLAYER#")
			attack("wr07_$c_roller3", "#PLAYER#")
			thread_new("wr07_flee_lines")
			break
		end

		thread_yield()
	end
	
	Wr07_warning_done = false

	while true do
		if is_dead("wr07_$c_sharp") then
			remove_marker_npc("wr07_$c_sharp")
			turn_invulnerable("#PLAYER#")
			delay(3)
			turn_vulnerable("#PLAYER#")
			mission_end_success("wr07")
			break
		end

		local d = get_dist_char_to_char("#PLAYER#", "wr07_$c_sharp")
		if d > Wr07_dist_got_away then
			if not Wr07_warning_done then
				mission_help_table_nag("wr07_too_far")
				hud_timer_set(30 * 1000, "wr07_losing")
				Wr07_warning_done = true
			end
		else
			Wr07_warning_done = false
			hud_timer_stop()
		end
		
		thread_yield()
	end
end

function wr07_losing()
	mission_end_failure("wr07", "wr07_lost_em")
end

function wr07_notoriety_bump()
	Wr07_current_notoriety = notoriety_get("rollers")
	while true do
		delay(45)
		if (Wr07_current_notoriety < 3) then
			Wr07_current_notoriety = notoriety_get("rollers") + 1
			notoriety_set_min("rollers", Wr07_current_notoriety)
		end
	end
end

function wr07_on_limo_destroyed()
	Wr07_limo_destroyed = true;
	on_vehicle_destroyed("", "wr07_$v_limo")
end

function wr07_times_up()
	mission_end_failure("wr07", "wr07_lost_em")
end

function wr07_limo_patrol()
	local num_waypoints = sizeof_table(Wr07_limo_route)
	
	vehicle_pathfind_to("wr07_$v_limo", Wr07_limo_route[Wr07_next_waypoint], Wr07_limo_attacked, false)
	
	while is_vehicle_destroyed("wr07_$v_limo") == false and get_char_in_vehicle("wr07_$v_limo", 0) ~= nil do
				
		if get_dist_vehicle_to_nav("wr07_$v_limo", Wr07_limo_route[Wr07_next_waypoint]) < 5 then
			Wr07_next_waypoint = Wr07_next_waypoint + 1
			if Wr07_next_waypoint > num_waypoints then
				Wr07_next_waypoint = 1
			end
			
			vehicle_pathfind_to("wr07_$v_limo", Wr07_limo_route[Wr07_next_waypoint], Wr07_limo_attacked, false)
		end
		
		delay(0.1)
	end
	
	Wr07_limo_patrol_thread = -1
end

function wr07_limo_flee()
	local current_path = 57
	local nav_list
	
	vehicle_speed_override("wr07_$v_limo", 65)
	vehicle_set_torque_multiplier("wr07_$v_limo", 1.7)
	vehicle_turret_base_to("wr07_$v_limo", "wr07__$nsr000", false)
	
	vehicle_pathfind_to("wr07_$v_limo", Wr07_flee_route, true, false)
	while (true) do
		vehicle_flee("wr07_$v_limo", "#PLAYER#")
		delay(4)		
	end
end

function wr07_sharp_taunt()
	local taunt_count = 0
	delay(rand_int(24,36))
	while ((get_char_in_vehicle("wr07_$v_limo", 3) == "wr07_$c_sharp") and not is_dead("wr07_$c_sharp")) do
		if (taunt_count > 2) then
			audio_play_for_character("SHARP_WR7_ATTACK", "wr07_$c_sharp", "voice", false, false, taunt_count) 
		elseif (taunt_count > 5) then
			break
		else
			audio_play_for_character("SHARP_WR7_DAMAGE", "wr07_$c_sharp", "voice", false, false, taunt_count-3) 
		end
		taunt_count = taunt_count + 1
		delay(rand_int(24,36))
	end
end

function wr07_on_limo_damage(attacked, attacker)
	if (Wr07_chatter_thread ~= -1) then 
		thread_kill(Wr07_chatter_thread)
	end
	
	if attacker == "#PLAYER#" then
		Wr07_limo_attacked = true
		on_take_damage("", "wr07_$v_limo")
		attack("wr07_$c_roller1", "#PLAYER#")
		attack("wr07_$c_roller2", "#PLAYER#")
		attack("wr07_$c_roller3", "#PLAYER#")
		
		thread_kill(Wr07_limo_patrol_thread)
		Wr07_limo_patrol_thread = thread_new("wr07_limo_flee")
		audio_play_for_character("SHARP_WR7_SPOT_1", "wr07_$c_sharp", "voice", false, true)
		
		thread_new("wr07_sharp_taunt")
		
		--persona_override_persona_start("SP_SHARP", "threat - damage received (firearm)", "SHARP_WR7_DAMAGE", 3) 
	end
end

function wr07_player_died()
	mission_end_failure("wr07")
end