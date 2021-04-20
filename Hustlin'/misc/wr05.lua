-- Global Variables------

-- Rewards
Wr05_hood_reward = ""

-- Respect level required to unlock mission

Wr05_jackers = {
	{	-- wave 1
		{	-- jacker 1
			group_name = "wr05_$g_jacker_1_1", driver_name = "wr05_$c_driver_1_1", jacker_name = "wr05_$c_jacker_1_1",
			vehicle = "wr05_$v_rollers_1_1"
		},
		{	-- jacker 2
			group_name = "wr05_$g_jacker_1_2", driver_name = "wr05_$c_driver_1_2", jacker_name = "wr05_$c_jacker_1_2",
			vehicle = "wr05_$v_rollers_1_2"
		},
	},
	{	-- wave 2
		{	-- jacker 1
			group_name = "wr05_$g_jacker_2_1", driver_name = "wr05_$c_driver_2_1", jacker_name = "wr05_$c_jacker_2_1",
			vehicle = "wr05_$v_rollers_2_1"
		},
		{	-- jacker 2
			group_name = "wr05_$g_jacker_2_2", driver_name = "wr05_$c_driver_2_2", jacker_name = "wr05_$c_jacker_2_2",
			vehicle = "wr05_$v_rollers_2_2"
		},
	},
	{	-- wave 3
		{	-- jacker 1
			group_name = "wr05_$g_jacker_3_1", driver_name = "wr05_$c_driver_3_1", jacker_name = "wr05_$c_jacker_3_1",
			vehicle = "wr05_$v_rollers_3_1"
		},
		{	-- jacker 2
			group_name = "wr05_$g_jacker_3_2", driver_name = "wr05_$c_driver_3_2", jacker_name = "wr05_$c_jacker_3_2",
			vehicle = "wr05_$v_rollers_3_2"
		},
	},
}

Wr05_targets = {
	{	-- wave 1
		{	-- target 1
			group_name = "wr05_$g_target_1_1", vehicle = "wr05_$v_target_1_1", stop_point = "wr05_$n_target_stop_point_1_1",
			entry = "wr05_$n_target_entry_1_1",	escape_path = 1
		},
		{	-- target 2
			group_name = "wr05_$g_target_1_2", vehicle = "wr05_$v_target_1_2", stop_point = "wr05_$n_target_stop_point_1_2",
			entry = "wr05_$n_target_entry_1_2",	escape_path = 32
		},
	},
	{	-- wave 2
		{	-- target 1
			group_name = "wr05_$g_target_2_1", vehicle = "wr05_$v_target_2_1", stop_point = "wr05_$n_target_stop_point_2_1",
			entry = "wr05_$n_target_entry_2_1",	escape_path = 50
		},
		{	-- target 2
			group_name = "wr05_$g_target_2_2", vehicle = "wr05_$v_target_2_2", stop_point = "wr05_$n_target_stop_point_2_2",
			entry = "wr05_$n_target_entry_2_2",	escape_path = 60
		},
	},
	{	-- wave 3
		{	-- target 1
			group_name = "wr05_$g_target_3_1", vehicle = "wr05_$v_target_3_1", stop_point = "wr05_$n_target_stop_point_3_1",
			entry = "wr05_$n_target_entry_3_1",	escape_path = 100
		},
		{	-- target 2
			group_name = "wr05_$g_target_3_2", vehicle = "wr05_$v_target_3_2", stop_point = "wr05_$n_target_stop_point_3_2",
			entry = "wr05_$n_target_entry_3_2",	escape_path = 112
		},
	},
}

Wr05_messages_used = {}

Wr05_threads = {}

Wr05_groups_spawned = {}

Wr05_on_take_damage = {}
Wr05_on_death = {}

Wr05_num_vehicles_remaining = 0
Wr05_num_vehicles_to_destroy = 0

Wr05_instances_won = 0
Wr05_instances_lost = 0
Wr05_instance_count = 1

Wr05_jacker_hunting = {}

Wr05_target_count = 0

Wr05_jacked_car_max_range = 90

Wr05_player_target = ""

Wr05_marked_npcs = {}
Wr05_marked_vehicles = {}
Wr05_jacked_targets = {}
Wr05_target_lost = true



-- FUNCTIONS ----------------------------

function wr05_cleanup()
	mission_waypoint_remove()
	distance_display_off()
	
	cellphone_remove( "LIN_WR5_PHONE1_1" )
	
	wr05_kill_all_threads()
	
	for index in Wr05_on_take_damage do
		on_take_damage("", index)
	end
	
	Wr05_on_take_damage = {}
	
	for index in Wr05_marked_vehicles do
		remove_marker_vehicle(index)
	end
	
	Wr05_marked_vehicles = {}
	
	for index in Wr05_on_death do
		on_death("", index)
	end
	
	Wr05_on_death = {}
		
	Wr05_jacker_hunting = {}

	wr05_despawn_all_groups()
	
	on_death("", "#PLAYER#")
	
	hud_timer_stop()
	wr05_reset_notoriety()
	objective_text_clear()
	Wr05_messages_used = {}
	Wr05_jacked_targets = {}
end

function wr05_success()
	--AM 5/28/06: stronghold order changed
	--mission_unlock("racetrack_stronghold_store")
	mission_unlock("wrsuburb_stronghold_apart")
	mission_set_next_props_req("rollers", Wr06_min_respect_required)
	if Wr05_hood_reward ~= "" then
		hood_set_owner(Wr05_hood_reward, "Playas")
	end
end

function wr05_reset_notoriety()
	notoriety_set_min("police", 0)
	notoriety_set_max("police", 5) 
	notoriety_set_min("rollers", 0)
	notoriety_set_max("rollers", 5)
end

function wr05_kill_all_threads()
	for index, thread in Wr05_threads do
		thread_kill(thread)
	end
	
	Wr05_threads = {}
end

function wr05_despawn_all_groups()
	for index in Wr05_groups_spawned do
		release_to_world(index)
	end
	
	release_to_world("wr05_$g_target")
	
	Wr05_groups_spawned = {}
end

-- Called by mission trigger
function wr05_start()
	set_mission_author("Sean Rose")
	cutscene_in("wr05_scene01")

	cutscene_play("wr05_scene01", "wr05_$g_target")
	teleport("#PLAYER#", "mission_start_wr05")
	for wave_index = 1, 3 do
		local targets = Wr05_targets[wave_index]
		for target = 1, 2 do
			vehicle_show(targets[target].vehicle)
			turn_invulnerable(targets[target].vehicle)
			set_unjackable_flag(targets[target].vehicle, true)
		end
	end

	on_death("wr05_player_died", "#PLAYER#")
	Wr05_instances_won = 0
	Wr05_instances_lost = 0
	Wr05_messages_used = {}
	Wr05_jacker_hunting = {}
	Wr05_jacked_targets = {}
	Wr05_marked_npcs = {}
	Wr05_marked_vehicles = {}
	Wr05_on_death = {}
	
	Wr05_messages_used.start_msg_remaining = 6
	Wr05_messages_used.won_msg_remaining = 3
	Wr05_messages_used.lose_msg_remaining = 2
	
	Wr05_messages_used.start_msg_total = 6
	Wr05_messages_used.won_msg_total = 3
	Wr05_messages_used.lose_msg_total = 2
	Wr05_target_count = 0
	Wr05_instance_count = 0
	Wr05_player_target = ""
	wr05_phone_played = false
	
	cellphone_register("wr05_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "LIN_WR5_PHONE1_1", "Lin", true, "", "wr05_cellphone")
	
	while (not wr05_phone_played) do
		thread_yield()
	end

	objective_text("wr05_objectives_text", 4-Wr05_instances_won, 4)
	mission_help_table("wr05_mission_start")
	delay(3)
	
	local instances_done = {{false, false}, {false, false}, {false, false}}
	
	for wave = 1, 6 do
		local min_dist = 0.0
		local wave_index = 0
		local spawn_index = 0
		for wi = 1, 3 do
			for si = 1, 2 do
				if (not instances_done[wi][si]) and (get_dist_char_to_nav("#PLAYER#", Wr05_targets[wi][si].stop_point) > min_dist) then
					min_dist = get_dist_char_to_nav("#PLAYER#", Wr05_targets[wi][si].stop_point)
					wave_index = wi
					spawn_index = si
				end
			end
		end
	
		instances_done[wave_index][spawn_index] = true
		
		local target = Wr05_targets[wave_index][spawn_index]
		local jacker = Wr05_jackers[wave_index][spawn_index]
		
		local spawn_timer = 0
		Wr05_target_count = Wr05_target_count + 1

		Wr05_instance_count = Wr05_instance_count + 1	
		Wr05_threads[target.group_name] = thread_new("wr05_start_instance", target, jacker)
			
		while true do			
			spawn_timer = 0	
			-- check for mission end	
			if Wr05_instances_won > 3 then
				wr05_kill_all_threads()
				delay(2)
				cutscene_in("wr05_scene02")
				cutscene_play("wr05_scene02", true)
				mission_end_success("wr05")
				return
			elseif Wr05_instances_lost > 2 then
				wr05_kill_all_threads()
				mission_end_failure("wr05", "wr05_mission_fail")
				return
			end
			
			if Wr05_target_count == 0 then
				break
			end
			
			-- only increment timer if there is a vehicle currently jacked
			if sizeof_table(Wr05_jacked_targets) > 0 then
				spawn_timer = spawn_timer + 0.1
			end
			
			delay(0.1)
		end
	end

end

function wr05_start_instance(target, jacker)
	-- set up
	turn_vulnerable(target.vehicle)
	set_unjackable_flag(target.vehicle, false)
	group_create(jacker.group_name, true)

	Wr05_groups_spawned[jacker.group_name] = true
	
	combat_disable(jacker.driver_name)
	combat_disable(jacker.jacker_name)
	
	vehicle_disable_flee(jacker.vehicle, true)
	vehicle_disable_chase(jacker.vehicle, true)
	
	vehicle_disable_flee(target.vehicle, true)
	vehicle_disable_chase(target.vehicle, true)
	
	add_marker_vehicle(target.vehicle, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	Wr05_marked_vehicles[target.vehicle] = true
	
	--add_marker_npc(jacker.jacker_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	--Wr05_marked_npcs[jacker.jacker_name] = true
	
	character_add_vehicle(jacker.driver_name, jacker.vehicle, 0)
	character_add_vehicle(jacker.jacker_name, jacker.vehicle, 1)
	
	on_take_damage("wr05_on_roller_damaged", jacker.driver_name)
	on_take_damage("wr05_on_roller_damaged", jacker.jacker_name)
	
	Wr05_on_take_damage[jacker.driver_name] = true
	Wr05_on_take_damage[jacker.jacker_name] = true
	
	on_death("wr05_driver_death", jacker.driver_name)
	on_death("wr05_jacker_death", jacker.jacker_name)
	
	Wr05_on_death[jacker.driver_name] = true
	Wr05_on_death[jacker.jacker_name] = true

	Wr05_threads[jacker.driver_name] = thread_new("wr05_driver_behavior", target, jacker)
	Wr05_threads[jacker.jacker_name] = thread_new("wr05_jacker_behavior", target, jacker)
	
	wr05_generate_start_msg()
	mission_waypoint_add(target.stop_point)
	
	local jacker_marked = true
	local in_range = false
	Wr05_target_lost = false
	
	-- monitor
	while true do
		if is_vehicle_destroyed(target.vehicle) == true then
			-- instance success
			Wr05_instances_won = Wr05_instances_won + 1
			wr05_generate_win_msg()
			mission_waypoint_remove()
			break
		elseif get_char_in_vehicle(target.vehicle, 0) == jacker.jacker_name then

			mission_waypoint_remove()
			-- check to see if player is too far... iow jacker escapes
			if get_dist_char_to_vehicle("#PLAYER#", target.vehicle) > Wr05_jacked_car_max_range then
				
				if in_range == true then
					mission_help_table_nag("wr05_out_of_range")
					hud_timer_set(10 * 1000, "wr05_jacker_escaped")
					in_range = false
				end

				if Wr05_target_lost == true then
					-- instance failure
					Wr05_instances_lost = Wr05_instances_lost + 1

					if Wr05_instances_lost < 3 then
						mission_help_table_nag("wr05_instance_lost"..Wr05_instances_lost)
						delay(7)
					end

					break
				end
			else
				in_range = true
				hud_timer_stop()
			end
		else
			Wr05_jacked_targets[target.vehicle] = nil
		end
		
		delay(0.1)
	end

	-- clean up
	mission_waypoint_remove()
	remove_marker_vehicle(target.vehicle)
	distance_display_off()
	mission_debug("DISTANCE DISPLAY OFF")
			
	Wr05_marked_vehicles[target.vehicle] = nil
	
	on_take_damage("", jacker.driver_name)
	on_take_damage("", jacker.jacker_name)
	
	Wr05_on_take_damage[jacker.driver_name] = nil
	Wr05_on_take_damage[jacker.jacker_name] = nil

	on_death("", jacker.driver_name)
	on_death("", jacker.jacker_name)
	
	Wr05_on_death[jacker.driver_name] = nil
	Wr05_on_death[jacker.jacker_name] = nil

	if Wr05_threads[jacker.driver_name] ~= nil then
		thread_kill(Wr05_threads[jacker.driver_name])
	end
	
	if Wr05_threads[jacker.jacker_name] ~= nil then
		thread_kill(Wr05_threads[jacker.jacker_name])
	end
	
	if Wr05_threads[jacker.driver_name.."_pf"] ~= nil then
		thread_kill(Wr05_threads[jacker.driver_name.."_pf"])
	end
	
	Wr05_threads[jacker.driver_name] = nil
	Wr05_threads[jacker.jacker_name] = nil
	Wr05_jacked_targets[target.vehicle] = nil
	
	vehicle_disable_flee(jacker.vehicle, false)
	vehicle_disable_chase(jacker.vehicle, false)
	
	vehicle_disable_flee(target.vehicle, false)
	vehicle_disable_chase(target.vehicle, false)

	Wr05_target_count = Wr05_target_count - 1
	
	objective_text("wr05_objectives_text", 4-Wr05_instances_won, 4)
	
	combat_enable(jacker.driver_name)
	combat_enable(jacker.jacker_name)
	
	if is_vehicle_destroyed(jacker.vehicle) == false then
		vehicle_chase(jacker.vehicle, "#PLAYER#", true, false, true)
	end
	
	if is_dead(jacker.jacker_name) == false then
		attack(jacker.jacker_name, "#PLAYER#")
	end

	if is_dead(jacker.driver_name) == false then
		attack(jacker.driver_name, "#PLAYER#")
	end
	
	on_death("", jacker.driver_name)
	Wr05_on_death[jacker.driver_name] = nil
	
	on_death("", jacker.jacker_name)
	Wr05_on_death[jacker.jacker_name] = nil
	
	on_take_damage("", jacker.driver_name)
	on_take_damage("", jacker.jacker_name)

	release_to_world(jacker.group_name)
	--destroy_group(jacker.group_name)
	Wr05_groups_spawned[jacker.group_name] = nil
end

function wr05_driver_death(name)
	local jacker = wr05_get_jacker_data(name)
	
	if jacker ~= nil then
		if Wr05_threads[jacker.jacker_name] ~= nil then
			thread_kill(Wr05_threads[jacker.jacker_name])
		end
		
		attack(jacker.jacker_name, "#PLAYER#")
	end

	on_death("", name)
	Wr05_on_death[name] = nil
end

function wr05_jacker_death(name)
	local jacker = wr05_get_jacker_data(name)
	
	if jacker ~= nil then
		if Wr05_threads[jacker.driver_name.."_pf"] ~= nil then
			thread_kill(Wr05_threads[jacker.driver_name.."_pf"])
		end
		
		if Wr05_threads[jacker.driver_name] ~= nil then
			thread_kill(Wr05_threads[jacker.driver_name])
		end
		
		if (human_check_resource_loaded(jacker.driver_name)) then
			attack(jacker.driver_name, "#PLAYER#")
			vehicle_chase(jacker.vehicle, "#PLAYER#", true, true, true)
		end
	end
	
	on_death("", name)
	Wr05_on_death[name] = nil
end

function wr05_jacker_escaped()
	Wr05_target_lost = true
	distance_display_off()
	hud_timer_stop()
end

function wr05_generate_start_msg()
	local tag = "wr05_instance_start"..Wr05_instance_count
	delay(2)
	mission_help_table(tag)
end

function wr05_generate_win_msg()
end

function wr05_jacker_behavior(target, jacker)
	-- wait until escort vehicle has reached end point and has stopped
	while get_dist_vehicle_to_nav(jacker.vehicle, target.stop_point) > 5 or
		get_vehicle_speed(jacker.vehicle) > 5 do

		delay(0.1)
	end
	
	on_death("", jacker.driver_name)
	Wr05_on_death[jacker.driver_name] = nil

	vehicle_exit(jacker.jacker_name)
	
	--move_to(jacker.jacker_name, target.entry, 2)
	
	vehicle_enter(jacker.jacker_name, target.vehicle, 0)
	
	
	while (get_char_in_vehicle(target.vehicle, 0) ~= jacker.jacker_name) do
		delay(1.0)
		local smoke, fire = vehicle_get_smoke_and_fire_state(target.vehicle)
		if ((fire == true) or (is_dead(jacker.jacker_name)) or (is_vehicle_destroyed(target.vehicle))) then
			return
		end
		vehicle_enter(jacker.jacker_name, target.vehicle, 0)
	end
	
	distance_display_off()
	distance_display_on(jacker.jacker_name, 0, Wr05_jacked_car_max_range * 3, 0, Wr05_jacked_car_max_range)
			
	vehicle_flee(target.vehicle, "#PLAYER#")
	
	-- now pick random micro routes to 'flee' on
	local current_path = target.escape_path
	local nav_list
	
	while get_char_in_vehicle(target.vehicle, 0) == jacker.jacker_name do
		local smoke, fire = vehicle_get_smoke_and_fire_state(target.vehicle)
		if fire == true then
			vehicle_exit(jacker.jacker_name)
			attack(jacker.jacker_name)
			break
		end
		vehicle_flee(target.vehicle, "#PLAYER#")
		delay(1.0)
	end	
end

function wr05_driver_behavior(target, jacker)
	Wr05_jacker_hunting[jacker.vehicle] = target.stop_point
	Wr05_threads[jacker.driver_name.."_pf"] = thread_new("wr05_pf", jacker.vehicle, target.stop_point, false)
	
	while get_dist_vehicle_to_nav(jacker.vehicle, target.stop_point) > 5 do
		delay(0.1)
	end
	
	Wr05_jacker_hunting[jacker.vehicle] = nil
	
	-- wait until target vehicle has been jacked
	while get_char_in_vehicle(target.vehicle, 0) ~= jacker.jacker_name do
		delay(0.1)
	end
	
	delay(3)
	
	if (human_check_resource_loaded(jacker.jacker_name)) then
		vehicle_chase(jacker.vehicle, jacker.jacker_name, false, false, false)
	end
end

function wr05_pf(vehicle, dest, obey_law)
	if obey_law == true then
		vehicle_pathfind_to(vehicle, dest, false, true)
	else
		vehicle_speed_override(vehicle, 45)
		vehicle_turret_base_to(vehicle, dest, true)
		vehicle_speed_cancel(vehicle)
	end
end

function wr05_get_jacker_data(char_name)
	for wave_index, wave_data in Wr05_jackers do
		for jacker_index, jacker_data in wave_data do
			if jacker_data.driver_name == char_name or jacker_data.jacker_name == char_name then
				return jacker_data
			end
		end
	end
	
	return nil
end

function wr05_on_roller_damaged(name, attacker)
	if attacker == "#PLAYER#" and is_dead(name) == false then
		attack(name, "#PLAYER#")
		on_take_damage("", name)
		Wr05_on_take_damage[name] = nil

		local jacker = wr05_get_jacker_data(name)
		if jacker ~= nil then
			if	Wr05_jacker_hunting[jacker.vehicle] ~= nil then
				if Wr05_threads[jacker.driver_name.."_pf"] ~= nil then
					thread_kill(Wr05_threads[jacker.driver_name.."_pf"])
				end
				Wr05_threads[jacker.driver_name.."_pf"] = thread_new("wr05_pf", jacker.vehicle, Wr05_jacker_hunting[jacker.vehicle], false)
			end
		else
			vehicle_flee(jacker.vehicle)
		end
	end
end

function wr05_player_died()
	mission_end_failure("wr05")
end

function wr05_cutscene1()
	fade_out(2)
	delay(2)
	letterbox_fade_in(true)
	thread_new_block("wr05_cutscene1_modal")
	letterbox_fade_out(true)
	fade_in(2)
	delay(2)
end

function wr05_cutscene1_modal()
	modal_begin()
	fade_in(2)
--[[
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_1","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Price_WR05_Cutscene_1_1","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_2","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Price_WR05_Cutscene_1_2","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_3","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Donnie_WR05_Cutscene_1_1","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_4","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Donnie_WR05_Cutscene_1_2","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Price_WR05_Cutscene_1_3","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_5","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Lin_WR05_Cutscene_1_1","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_6","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Lin_WR05_Cutscene_1_2","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_7","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Lin_WR05_Cutscene_1_3","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Donnie_WR05_Cutscene_1_3","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_8","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Lin_WR05_Cutscene_1_4","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_9","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Lin_WR05_Cutscene_1_5","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_10","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Lin_WR05_Cutscene_1_6","#PLAYER#", "voice", true, true)
	
	audio_play_for_character("VOC_Sharp_WR05_Cutscene_1_11","#PLAYER#", "voice", true, true)
	]]--
	fade_out(2)
	delay(2)
	modal_end()
end

function wr05_cutscene2()
	fade_out(2)
	delay(2)
	letterbox_fade_in(true)
	wr05_despawn_all_groups()
	thread_new_block("wr05_cutscene2_modal")
	letterbox_fade_out(true)
	fade_in(2)
	delay(2)
end

function wr05_cutscene2_modal()
	modal_begin()
	fade_in(2)

--[[
	audio_play_for_character("VOC_Price_WR05_Cutscene_2_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_1","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_2","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_3","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_4","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_5","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_7","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_6","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_8","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_7","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Price_WR05_Cutscene_2_9","#PLAYER#", "voice", true, true)

	audio_play_for_character("VOC_Sharp_WR05_Cutscene_2_8","#PLAYER#", "voice", true, true)
]]--
	fade_out(2)
	delay(2)
	modal_end()
end