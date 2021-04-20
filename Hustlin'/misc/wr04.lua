-- Global Variables------

-- Rewards
Wr04_hood_reward = ""

WR04_scene_descriptions =
{
	{		-- scene 1
		help = {preamble = "wr04_preamble_1", start = "wr04_start_1", success = "wr04_success_1"},
		start = {time = 2 * 60 * 1000, navpoint = "wr04_$vehicle000", distance = 120},
		delivery = {name = "wr04_$c_delivery_driver_1", vehicle = "wr04_$v_delivery_1",
			thread = -1, pf_thread = -1, group = "wr04_$g_delivery_1",
			finish = "wr04_$n_delivery_path_1_11",
			navpoints = {
				{name = "wr04_$n_delivery_path_1_4", obey_law = true},
				{name = "wr04_$n_delivery_path_1_5", obey_law = true},
				{name = "wr04_$n_delivery_path_1_6", obey_law = true},
				{name = "wr04_$n_delivery_path_1_7", obey_law = true},
				{name = "wr04_$n_delivery_path_1_8", obey_law = true},
				{name = "wr04_$n_delivery_path_1_9", obey_law = true},
				{name = "wr04_$n_delivery_path_1_10", obey_law = true},
				{name = "wr04_$n_delivery_path_1_11", obey_law = true},
			}
		},
		waves = {
			{
				navpoint = "wr04_$n_spawn_wave_1_1", navpoint2 = "wr04_$vehicle001", trigger_help = nil,
				enemy_group = "wr04_$g_hijack_1",
				enemies = {
					{
						name = "wr04_$c_hijacker_driver_1_1", vehicle = "wr04_$v_hijacker_1_1",
						seat = 0, attack_player = true, driver = "wr04_$c_hijacker_driver_1_1"
					},
					{
						name = "wr04_$c_hijacker_passenger_1_1", vehicle = "wr04_$v_hijacker_1_1",
						seat = 1, attack_player = true, driver = "wr04_$c_hijacker_driver_1_1"
					},
					{
						name = "wr04_$c_hijacker_driver_1_2", vehicle = "wr04_$v_hijacker_1_2",
						seat = 0, attack_player = false, driver = "wr04_$c_hijacker_driver_1_2"
					},
				}
			},
		}
	},
	{		-- scene 2
		help = {preamble = "wr04_preamble_2", start = "wr04_start_2", success = "wr04_success_2"},
		start = {time = 3 * 60 * 1000, navpoint = "wr04_$vehicle003", distance = 120},
		delivery = {name = "wr04_$c_delivery_driver_2", vehicle = "wr04_$v_delivery_2",
			thread = -1, pf_thread = -1, group = "wr04_$g_delivery_2",
			finish = "wr04_$n_delivery_path_2_10",
			navpoints = {
				{name = "wr04_$n_delivery_path_2_1", obey_law = true},
				{name = "wr04_$n_delivery_path_2_2", obey_law = true},
				{name = "wr04_$n_delivery_path_2_3", obey_law = true},
				{name = "wr04_$n_delivery_path_2_4", obey_law = true},
				{name = "wr04_$n_delivery_path_2_5", obey_law = true},
				{name = "wr04_$n_delivery_path_2_6", obey_law = true},
				{name = "wr04_$n_delivery_path_2_7", obey_law = true},
				{name = "wr04_$n_delivery_path_2_8", obey_law = true},
				{name = "wr04_$n_delivery_path_2_9", obey_law = true},
				{name = "wr04_$n_delivery_path_2_10", obey_law = false},
			}
		},
		waves = {
			{
				navpoint = "wr04_$n_delivery_path_2_1", navpoint2 = "wr04_$vehicle004", trigger_help = nil,
				enemy_group = "wr04_$g_hijack_2_1",
				enemies = {
					{
						name = "wr04_$c_hijacker_2_1", vehicle = "wr04_$v_hijacker_2_1",
						seat = 0, attack_player = true, driver = "wr04_$c_hijacker_2_1"
					},
					{
						name = "wr04_$c_hijacker_2_2", vehicle = "wr04_$v_hijacker_2_1",
						seat = 1, attack_player = false, driver = "wr04_$c_hijacker_2_1"
					},
				}
			},
			{
				navpoint = "wr04_$n_delivery_path_2_4", navpoint2 = "wr04_$vehicle006", trigger_help = nil,
				enemy_group = "wr04_$g_hijack_2_2",
				enemies = {
					{
						name = "wr04_$c_hijacker_2_4", vehicle = "wr04_$v_hijacker_2_3",
						seat = 0, attack_player = false, driver = "wr04_$c_hijacker_2_4"
					},
					{
						name = "wr04_$c_hijacker_2_5", vehicle = "wr04_$v_hijacker_2_4",
						seat = 0, attack_player = false, driver =  "wr04_$c_hijacker_2_4"
					},
					{
						name = "wr04_$c_hijacker_2_6", vehicle = "wr04_$v_hijacker_2_4",
						seat = 1, attack_player = true, driver = "wr04_$c_hijacker_2_5"
					},
				}
			},
		}
	},
	{		-- scene 3
		help = {preamble = "wr04_preamble_3", start = "wr04_start_3", success = nil},
		start = {time = 3 * 60 * 1000, navpoint = "wr04_$vehicle009", distance = 240},
		delivery = {name = "wr04_$c_delivery_driver_3", vehicle = "wr04_$v_delivery_3",
			thread = -1, pf_thread = -1, group = "wr04_$g_delivery_3",
			finish = "wr04_$n_delivery_path_3_17",
			navpoints = {
				{name = "wr04_$n_delivery_path_3_1", obey_law = false},
				{name = "wr04_$n_delivery_path_3_2", obey_law = true},
				{name = "wr04_$n_delivery_path_3_3", obey_law = true},
				{name = "wr04_$n_delivery_path_3_4", obey_law = true},
				{name = "wr04_$n_delivery_path_3_5", obey_law = true},
			}
		},
		waves = {
			{
				navpoint = "wr04_$vehicle009", navpoint2 = "wr04_$vehicle010", trigger_help = nil,
				enemy_group = "wr04_$g_hijackers_3_3",
				enemies = {
					{
						name = "wr04_$c_hijacker_3_9", vehicle = "wr04_$v_hijacker_3_6",
						seat = 0, attack_player = false, driver = "wr04_$c_hijacker_3_9"
					},
					{
						name = "wr04_$c_hijacker_3_10", vehicle = "wr04_$v_hijacker_3_6",
						seat = 1, attack_player = false, driver = "wr04_$c_hijacker_3_9"
					},
					{
						name = "wr04_$c_hijacker_3_1", vehicle = "wr04_$v_hijacker_3_1",
						seat = 0, attack_player = false, driver = "wr04_$c_hijacker_3_1"
					},
					{
						name = "wr04_$c_hijacker_3_3", vehicle = "wr04_$v_hijacker_3_2",
						seat = 0, attack_player = false, driver = "wr04_$c_hijacker_3_3"
					},
					{
						name = "wr04_$c_hijacker_3_4", vehicle = "wr04_$v_hijacker_3_2",
						seat = 1, attack_player = true, driver = "wr04_$c_hijacker_3_3"
					},
				}
			},
		}
	},
}

WR04_current_scene = 0
WR04_num_enemies = 0

WR04_delivery_driver_afraid_of_rollers = false
WR04_delivery_driver_panic = false
Wr04_player_attacked_rollers = false
WR04_last_attacker = {}
WR04_threads = {}

-- FUNCTIONS ----------------------------



function wr04_cleanup()
	mission_waypoint_remove()
	on_death("", "#PLAYER#")
	hud_timer_stop()
	notoriety_force_no_spawn("rollerz", false)
	damage_indicator_off()
	
	wr04_cleanup_scene(WR04_current_scene)
	WR04_current_scene = 0
	
	persona_override_remove_all("AM_WR1")
	persona_override_remove_all("AM_WR2")
	persona_override_remove_all("AM_WR3")
	persona_override_remove_all("WM_WR1")
	persona_override_remove_all("WM_WR2")
	persona_override_remove_all("WM_WR3")
	persona_override_remove_all("AF_WR1")
	persona_override_remove_all("AF_WR2")
	persona_override_remove_all("AF_WR3")
	persona_override_remove_all("WF_WR1")
	persona_override_remove_all("WF_WR2")
	persona_override_remove_all("WF_WR3")
	
end

function wr04_success()
	mission_set_next_props_req("rollers", Wr05_min_respect_required)
	if Wr04_hood_reward ~= "" then
		hood_set_owner(Wr04_hood_reward, "Playas")
	end
end

function wr04_fail(help_text)
	delay(3)
	mission_end_failure("wr04", help_text)
end

-- Sets up phase 1
-- Called by mission trigger
function wr04_start()
	local all_dead
	local scene_complete

	set_mission_author("Sean Rose")
	
	persona_override_persona_start("AM_WR1", "threat - alert (solo attack)", "AMWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("AM_WR1", "threat - alert (group attack)", "AMWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("AM_WR2", "threat - alert (solo attack)", "AMWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("AM_WR2", "threat - alert (group attack)", "AMWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("AM_WR3", "threat - alert (solo attack)", "AMWR3_WR4_SPOT_1", 1) 
	persona_override_persona_start("AM_WR3", "threat - alert (group attack)", "AMWR3_WR4_SPOT_1", 1) 
	persona_override_persona_start("WM_WR1", "threat - alert (solo attack)", "WMWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("WM_WR1", "threat - alert (group attack)", "WMWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("WM_WR2", "threat - alert (solo attack)", "WMWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("WM_WR2", "threat - alert (group attack)", "WMWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("WM_WR3", "threat - alert (solo attack)", "WMWR3_WR4_SPOT_1", 1) 
	persona_override_persona_start("WM_WR3", "threat - alert (group attack)", "WMWR3_WR4_SPOT_1", 1) 
	
	persona_override_persona_start("AF_WR1", "threat - alert (solo attack)", "AFWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("AF_WR1", "threat - alert (group attack)", "AFWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("AF_WR2", "threat - alert (solo attack)", "AFWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("AF_WR2", "threat - alert (group attack)", "AFWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("AF_WR3", "threat - alert (solo attack)", "AFWR3_WR4_SPOT_1", 1) 
	persona_override_persona_start("AF_WR3", "threat - alert (group attack)", "AFWR3_WR4_SPOT_1", 1) 
	persona_override_persona_start("WF_WR1", "threat - alert (solo attack)", "WFWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("WF_WR1", "threat - alert (group attack)", "WFWR1_WR4_SPOT_1", 1) 
	persona_override_persona_start("WF_WR2", "threat - alert (solo attack)", "WFWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("WF_WR2", "threat - alert (group attack)", "WFWR2_WR4_SPOT_1", 1) 
	persona_override_persona_start("WF_WR3", "threat - alert (solo attack)", "WFWR3_WR4_SPOT_1", 1) 
	persona_override_persona_start("WF_WR3", "threat - alert (group attack)", "WFWR3_WR4_SPOT_1", 1) 
	
	persona_override_persona_start("AM_WR1", "threat - damage received (firearm)", "AMWR1_WR4_DAMAGE", 1) 
	persona_override_persona_start("AM_WR2", "threat - damage received (firearm)", "AMWR2_WR4_DAMAGE", 1) 
	persona_override_persona_start("AM_WR3", "threat - damage received (firearm)", "AMWR3_WR4_DAMAGE", 1) 
	persona_override_persona_start("WM_WR1", "threat - damage received (firearm)", "WMWR1_WR4_DAMAGE", 1) 
	persona_override_persona_start("WM_WR2", "threat - damage received (firearm)", "WMWR2_WR4_DAMAGE", 1) 
	persona_override_persona_start("WM_WR3", "threat - damage received (firearm)", "WMWR3_WR4_DAMAGE", 1) 
	
	persona_override_persona_start("AF_WR1", "threat - damage received (firearm)", "AFWR1_WR4_DAMAGE", 1) 
	persona_override_persona_start("AF_WR2", "threat - damage received (firearm)", "AFWR2_WR4_DAMAGE", 1) 
	persona_override_persona_start("AF_WR3", "threat - damage received (firearm)", "AFWR3_WR4_DAMAGE", 1) 
	persona_override_persona_start("WF_WR1", "threat - damage received (firearm)", "WFWR1_WR4_DAMAGE", 1) 
	persona_override_persona_start("WF_WR2", "threat - damage received (firearm)", "WFWR2_WR4_DAMAGE", 1) 
	persona_override_persona_start("WF_WR3", "threat - damage received (firearm)", "WFWR3_WR4_DAMAGE", 1) 
	
	
log_clear("wr04.txt")
	cutscene_in("wr04_scene01")
	cutscene_play("wr04_scene01")
	teleport("#PLAYER#", "mission_start_wr04")
	delay(2)
	mission_help_table("wr04_preamble")
	delay(7)
	for scene_idx, scene in WR04_scene_descriptions do
		WR04_current_scene = scene

		WR04_delivery_driver_afraid_of_rollers = false
		WR04_delivery_driver_panic = false
		Wr04_player_attacked_rollers = false
		
		WR04_num_enemies = 0
		
		local cur_wave = 1
		local num_waves = sizeof_table(scene.waves)
		local panic_time = 0
		
		for index, wave in scene.waves do
			WR04_num_enemies = WR04_num_enemies + sizeof_table(wave.enemies)
		end
		
		if scene.help.preamble ~= nil then
			mission_help_table(scene.help.preamble)
		end
		mission_waypoint_add("wr04_truck"..scene_idx.."_gps")
		add_marker_navpoint(scene.start.navpoint, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_LOCATION)
		hud_timer_set(scene.start.time, "wr04_hijack_timeout")
		
		while get_dist_char_to_nav("#PLAYER#", scene.start.navpoint) > scene.start.distance do
			delay(0.5)
			if WR04_current_scene == 0 then
				return
			end
		end
		
		wr04_spawn_delivery(scene, scene_idx)
		--if (scene_idx ~= 1) then
			--mission_waypoint_add(scene.delivery.vehicle)
		--end
					
		notoriety_force_no_spawn("rollerz", true)
		remove_marker_navpoint(scene.start.navpoint)
		hud_timer_stop()
		
		if scene.help.start ~= nil then
			mission_help_table_nag(scene.help.start)
		end
		
		if (scene_idx ~= 3) then
			mission_waypoint_remove()
		end
log_append("wr04.txt", "\nStarting wave "..cur_wave.."\n")
		
		while true do
		
			if cur_wave <= num_waves then
				if (get_dist_vehicle_to_nav(scene.delivery.vehicle, scene.waves[cur_wave].navpoint) < 10) or (get_dist_char_to_nav("#PLAYER#", scene.waves[cur_wave].navpoint2) < 150) then
					wr04_spawn_hijackers(scene, scene.waves[cur_wave])
					cur_wave = cur_wave + 1
log_append("wr04.txt", "\nStarting wave "..cur_wave.."\n")
				end
			end
		
			if is_dead(scene.delivery.name) then
				wr04_end_scene_threads(scene)
				wr04_fail("wr04_lose_2")
				return
			end
			
			if is_vehicle_destroyed(scene.delivery.vehicle) then
				wr04_end_scene_threads(scene)
				wr04_fail("wr04_lose_3")
				return
			end
			
			if ((get_current_hit_points(scene.delivery.vehicle)/get_max_hit_points(scene.delivery.vehicle)) < 0.5) then
				vehicle_exit(scene.delivery.name)
				delay(2)
				wr04_end_scene_threads(scene)
				wr04_fail("wr04_lose_1")
				return
			end

			local h = get_char_in_vehicle(scene.delivery.vehicle, 0)
			if h ~= nil then
				if ((get_team(h) == "Rollerz") and (get_dist_char_to_vehicle("#PLAYER#", scene.delivery.vehicle) > 80)) then
					wr04_end_scene_threads(scene)
					wr04_fail("wr04_lose_1")
					return
				end
				
				if (h == "#PLAYER#") then
					wr04_end_scene_threads(scene)
					wr04_fail("wr04_lose_5")
					return
				end
			end

			if WR04_num_enemies == 0 then
				break
			end
			
			delay(0.5)
		end
		
		if scene.help.success ~= nil then
			mission_help_table(scene.help.success)
		end
		
		damage_indicator_off()
		thread_new("wr04_cleanup_scene", scene)
		
		delay(5)
		notoriety_force_no_spawn("rollerz", false)
		
		if WR04_current_scene == 0 then
			return
		end

	end
	cutscene_in("wr04_scene02")
	cutscene_play("wr04_scene02", true)
	
	mission_end_success("wr04")
	
end

function wr04_debug()
	WR04_num_enemies = 0
end


function wr04_player_died()
	mission_end_failure("wr04")
end

function wr04_cleanup_scene(scene)
	if scene == 0 then
		return
	end
	
	remove_marker_navpoint(scene.start.navpoint)
	remove_marker_vehicle(scene.delivery.vehicle)
	
	wr04_end_scene_threads(scene)
	
	on_take_damage("", scene.delivery.name)
	on_damage("", scene.delivery.name, 1)
	on_damage("", scene.delivery.vehicle, 1)
	on_death("", scene.delivery.name)
	WR04_last_attacker = {}
	
	for index, value in scene.waves do
		for index2, enemy in value.enemies do
			on_death("", enemy.name)
			on_take_damage("", enemy.name)
			remove_marker_npc(enemy.name)
		end
		release_to_world(value.enemy_group)
	end

	release_to_world(scene.delivery.group)
end

function wr04_hijack_timeout()
	mission_end_failure("wr04", "wr04_time_out_1")
end

function wr04_end_scene_threads(scene)
	for index, value in WR04_threads do
		thread_kill(value)
	end
	
	WR04_threads = {}
end

function wr04_spawn_delivery(scene, scene_idx)
	group_create(scene.delivery.group, true)
	character_add_vehicle(scene.delivery.name, scene.delivery.vehicle, 0)
	vehicle_never_flatten_tires(scene.delivery.vehicle, true)
	on_take_damage("wr04_delivery_driver_attacked", scene.delivery.vehicle)
	add_marker_vehicle(scene.delivery.vehicle, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	
	vehicle_disable_flee(scene.delivery.vehicle, true)
	vehicle_disable_chase(scene.delivery.vehicle, true)
	
	set_unjackable_flag(scene.delivery.vehicle, true)
	turn_invulnerable(scene.delivery.name)
	damage_indicator_on(scene.delivery.vehicle, 0.5, "wr02_truck")
	vehicle_supress_npc_exit(scene.delivery.vehicle, true)
	
	if (scene_idx ~= 3) then
		WR04_threads[scene.delivery.name] = thread_new("wr04_delivery_driver_behavior", scene)
	end
	
	local new_hp = get_max_hit_points(scene.delivery.vehicle) * 1.0
	set_max_hit_points(scene.delivery.vehicle, new_hp)
	set_current_hit_points(scene.delivery.vehicle, new_hp)
	
	new_hp = get_max_hit_points(scene.delivery.name) * 1.0
	set_max_hit_points(scene.delivery.name, new_hp)
	set_current_hit_points(scene.delivery.name, new_hp)
end

function wr04_enemy_behavior(scene, enemy)
	local target = scene.delivery.name
	local target_changed = false
	local prev_player_attack_state = false
	
	attack(enemy.name, scene.delivery.name)
	
	if enemy.seat == 0 then
		vehicle_chase(enemy.vehicle, scene.delivery.name, false, false, true)
	end
	
	while not (is_dead(enemy.name)) do 
		local dist_to_check = 400
		if (get_char_in_vehicle(enemy.vehicle, enemy.seat) ~= enemy.name) then
			dist_to_check = 100
		end
		
		if ((get_dist_char_to_char("#PLAYER#", enemy.name) > dist_to_check) and (get_dist_char_to_vehicle(enemy.name, scene.delivery.vehicle) > dist_to_check)) then
			wr04_roller_died(enemy.name)
			character_hide(enemy.name)
			return
		end
		
		if ((get_dist_char_to_char("#PLAYER#", enemy.name) > 40) and (get_dist_char_to_vehicle(enemy.name, scene.delivery.vehicle) > 40)) then
			attack(enemy.name, scene.delivery.name)
	
			if enemy.seat == 0 then
				vehicle_chase(enemy.vehicle, scene.delivery.name, false, false, true)
			end
		end
		
		if Wr04_player_attacked_rollers ~= prev_player_attack_state and enemy.attack_player == true then
			target = "#PLAYER#"
			target_changed = true
			prev_player_attack_state = Wr04_player_attacked_rollers
		end
		
		if target_changed == true then		
			if get_char_in_vehicle(enemy.vehicle, enemy.seat) == enemy.name then
				if enemy.seat == 0 then
					vehicle_chase(enemy.vehicle, target, false, false, true)
				end
			end
			
			attack(enemy.name, target)
			target_changed = false
		end
		
		delay(0.2)
	end
end

function wr04_spawn_hijackers(scene, wave)
	group_create(wave.enemy_group, true)
	for idx, enemy in wave.enemies do
		character_add_vehicle(enemy.name, enemy.vehicle, enemy.seat)
		thread_new("wr04_enemy_behavior", scene, enemy)
		on_take_damage("wr04_roller_attacked", enemy.name)
		on_death("wr04_roller_died", enemy.name)
		add_marker_npc(enemy.name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

		if enemy.attack_player == false then
			vehicle_disable_flee(enemy.vehicle, true)
			vehicle_disable_chase(enemy.vehicle, true)
			forced_target_set(enemy.name, scene.delivery.name)
		end
	end
end

function wr04_roller_died(name)
	remove_marker_npc(name)
	on_death("", name)
	if WR04_num_enemies > 0 then
		WR04_num_enemies = WR04_num_enemies - 1
	end
end

function wr04_roller_attacked(attacked, attacker)
	-- this huge snot ball checks if the attacker is on the player's team, finds the data
	-- for the enemy, clears his forced target, if he is the driver then clears the
	-- chase disable state for his vehicle if it hasn't been destroyed
	if attacker ~= nil then
		WR04_last_attacker[attacked] = attacker
		if get_team(attacker) == "Playas" then
			forced_target_clear(attacked)
			WR04_delivery_driver_afraid_of_rollers = true
			if (WR04_current_scene.delivery.vehicle ~= "wr04_$v_delivery_3") then
				vehicle_speed_override(WR04_current_scene.delivery.vehicle, 45)
			end
			mission_debug("roller attacked by player: "..attacked, -1, 5)
			
			for wave_index, wave in WR04_current_scene.waves do
				for enemy_index, enemy in wave.enemies do
					if enemy.name == attacked then
						if enemy.seat == 0 then
							if is_vehicle_destroyed(enemy.vehicle) == false then
								vehicle_disable_chase(enemy.vehicle, false)
								mission_debug("vehicle chase enabled: "..enemy.vehicle, -1, 6)
							end
						end
						on_take_damage("", enemy.name)
						
						return
					end
				end
			end
		end
	end
end

function wr04_char_enter_vehicle(char_name, veh_name, seat)
	set_ignore_ai_flag(char_name, false)
	
	vehicle_enter(char_name, veh_name, seat)
	
	while get_char_in_vehicle(veh_name, seat) == nil and not is_dead(char_name) do
		delay(0.25)
	end
	
	set_ignore_ai_flag(char_name, true)
	return (get_char_in_vehicle(veh_name, seat) == char_name)
end

function wr04_char_exit_vehicle(char_name, veh_name, seat)
	set_ignore_ai_flag(char_name, false)
	
	vehicle_exit(char_name)
	
	while get_char_in_vehicle(veh_name, seat) == char_name and not is_dead(char_name) do
		delay(0.25)
	end
	
	set_ignore_ai_flag(char_name, true)
end

function wr04_delivery_driver_behavior(scene)
	local cur_nav = 1
	local num_navs = sizeof_table(scene.delivery.navpoints)
	local pf_again = true
	local pf_thread_name = scene.delivery.name.."_pf"
	
	vehicle_speed_override(scene.delivery.vehicle, 35)
	combat_disable(scene.delivery.name) 

	while get_char_in_vehicle(scene.delivery.vehicle, 0) ~= scene.delivery.name do
		delay(0.1)
	end
	
	WR04_threads[pf_thread_name] = thread_new("wr04_delivery_driver_pf", scene, cur_nav, false)
	
	while is_dead(scene.delivery.name) == false do
		if (get_char_in_vehicle(scene.delivery.vehicle, 0) == "#PLAYER#") then
			break
		end
		
		if is_vehicle_destroyed(scene.delivery.vehicle) == false then
			if cur_nav < num_navs then
				if get_dist_vehicle_to_nav(scene.delivery.vehicle, scene.delivery.navpoints[cur_nav].name) < 5 then
					cur_nav = cur_nav + 1
					pf_again = true
				end
			end
		
			local h = get_char_in_vehicle(scene.delivery.vehicle, 0)
			if h ~= scene.delivery.name then
				local smoke, fire = vehicle_get_smoke_and_fire_state(scene.delivery.vehicle)
				if fire == false then
					delay(2)
					vehicle_enter(scene.delivery.name, scene.delivery.vehicle, 0)
					pf_again = true
				end
			end
		end
		
		if pf_again == true and get_char_in_vehicle(scene.delivery.vehicle, 0) == scene.delivery.name then
			if cur_nav > num_navs then
				thread_kill(WR04_threads[pf_thread_name])
				vehicle_flee(scene.delivery.vehicle, "#PLAYER#")
			else
				thread_kill(WR04_threads[pf_thread_name])
				local nav = scene.delivery.navpoints[cur_nav]
				--local obey_law = WR04_delivery_driver_afraid_of_rollers == false and nav.obey_law
				local obey_law = false
				WR04_threads[pf_thread_name] = thread_new("wr04_delivery_driver_pf", scene.delivery.vehicle, nav.name, obey_law)
			end
			
			pf_again = false
		end
		
		delay(0.2)
	end
end

function wr04_delivery_driver_pf(vehicle, nav, obey_law)
	vehicle_pathfind_to(vehicle, nav, not obey_law, false)
end

function wr04_delivery_driver_attacked(attacked, attacker)
	if attacker ~= nil then
		WR04_last_attacker[attacked] = attacker
		if get_team(attacker) == "Rollerz" then
			WR04_delivery_driver_afraid_of_rollers = true
			if (WR04_current_scene.delivery.vehicle ~= "wr04_$v_delivery_3") then
				vehicle_speed_override(WR04_current_scene.delivery.vehicle, 45)
			end
			if WR04_current_scene ~= 0 then
				on_take_damage("", WR04_current_scene.delivery.name)
			end
		end
	end
end

function wr04_delivery_driver_panic()
	on_damage("", WR04_current_scene.delivery.name, 0.3)
	on_damage("", WR04_current_scene.delivery.vehicle, 0.3)
	WR04_delivery_driver_panic = true
end

function wr04_cutscene1()
	fade_out(2)
	delay(2)
	letterbox_fade_in(true)
	thread_new_block("wr04_cutscene1_modal")
	letterbox_fade_out(true)
	fade_in(2)
	delay(2)
end

function wr04_cutscene1_modal()
	modal_begin()
	fade_in(2)
--[[
	audio_play_for_character("VOC_Price_WR04_Cutscene_1_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_1_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_1_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_1_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_1_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_1_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_7","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_1_8","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_7","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_1_8","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_1_7","#PLAYER#", "voice", true, true)
]]--
	fade_out(2)
	delay(2)
	modal_end()
end

function wr04_cutscene2()
	fade_out(2)
	delay(2)
	letterbox_fade_in(true)
	thread_new_block("wr04_cutscene2_modal")
	letterbox_fade_out(true)
	fade_in(2)
	delay(2)
end

function wr04_cutscene2_modal()
	modal_begin()
	fade_in(2)
--[[
	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_2_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_2_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_2_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_2_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_2_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_2_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_2_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_2_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_2_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_2_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR04_Cutscene_2_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_7","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_2_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Donnie_WR04_Cutscene_2_8","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR04_Cutscene_2_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Lin_WR04_Cutscene_2_4","#PLAYER#", "voice", true, true)
]]--
	fade_out(2)
	delay(2)
	modal_end()
end