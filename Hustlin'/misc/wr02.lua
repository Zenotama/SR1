-- Global Variables------

-- Respect level required to unlock mission

-- Mission success rewards

-- number of opponents - extracted from race data
Wr02_num_race_opponents = 0

-- number of surviving opponents
Wr02_num_race_opponents_remaining = 0

-- name of opponent vehicles
Wr02_race_opponents = {}
Wr02_racer_names = {}

-- thread that monitors race status
Wr02_threads = {}

-- the name of the opponent that is nitroed
Wr02_racer_nitroed = ""

-- mission help ids to be displayed when each opponent is destroyed
WR02_race_messages = {"wr02_get_to_garage", "wr02_opponent_blowedup2", "wr02_opponent_blowedup1"}

Wr02_help_timer_elapsed = true
Wr02_help_timer_thread = -1

Wr02_mission_timer = 0

Wr02_next_voice_time = 0

Wr02_voice_banks = {
	["roller1"] = {
		race_start = {chance = 1, lines = {"AMWR1_WR2_RACE_1"} },
		roller_pass_player = {chance = 0.75, lines = {"AMWR1_WR2_PASS_1", "AMWR1_WR2_PASS_2"} },
		player_pass_roller = {chance = 0.75, lines = {"AMWR1_WR2_PASSED_1", "AMWR1_WR2_PASSED_2"} },
		nitro_pass_player = {chance = 1, lines = {"AMWR1_WR2_DIE_1"} },
	},

	["roller2"] = {
		race_start = {chance = 1, lines = {"WMWR1_WR2_RACE_1"} },
		roller_pass_player = {chance = 0.75, lines = {"WMWR1_WR2_PASS_1", "WMWR1_WR2_PASS_2"} },
		player_pass_roller = {chance = 0.75, lines = {"WMWR1_WR2_PASSED_2", "WMWR1_WR2_PASSED_1"} },
		nitro_pass_player = {chance = 1, lines = {"WMWR1_WR2_DIE_1"} },
	},
	
	["roller3"] = {
		race_start = {chance = 1, lines = {"WMWR3_WR2_RACE_1" } },
		roller_pass_player = {chance = 0.75, lines = {"WMWR3_WR2_PASS_1", "WMWR3_WR2_PASS_2"} },
		player_pass_roller = {chance = 0.75, lines = {"WMWR3_WR2_PASSED_1", "WMWR3_WR2_PASSED_2"} },
		nitro_pass_player = {chance = 1, lines = {"WMWR3_WR2_DIE_1"} },
	},
	
	["troy"] = {
		taunt = {chance = 1, lines = {
			"TROY_WR2_TAUNT_1",  "TROY_WR2_TAUNT_2",  "TROY_WR2_TAUNT_3",  "TROY_WR2_TAUNT_5",
			"TROY_WR2_TAUNT_6",  "TROY_WR2_TAUNT_7",  "TROY_WR2_TAUNT_8",  "TROY_WR2_TAUNT_9",  "TROY_WR2_TAUNT_10",
			"TROY_WR2_TAUNT_11", "TROY_WR2_TAUNT_12", "TROY_WR2_TAUNT_13", "TROY_WR2_TAUNT_14", "TROY_WR2_TAUNT_15",
			"TROY_WR2_TAUNT_16", "TROY_WR2_TAUNT_17", "TROY_WR2_TAUNT_18", "TROY_WR2_TAUNT_19", "TROY_WR2_TAUNT_20"
		} },
		closer = {chance = 1, lines = {
			"TROY_WR2_CLOSER_1", "TROY_WR2_CLOSER_2", "TROY_WR2_CLOSER_3"
		} },
		dead = {chance = 1, lines = {
			"TROY_WR2_CARBLOWUP_1", "TROY_WR2_CARBLOWUP_2", "TROY_WR2_CARBLOWUP_3"
		} },
		escape = {chance = 1, lines = {
			"TROY_WR2_ESCAPE_1", "TROY_WR2_ESCAPE_2", "TROY_WR2_ESCAPE_3", 
			"TROY_WR2_ESCAPE_4", "TROY_WR2_ESCAPE_5", "TROY_WR2_ESCAPE_6" 
		} },
	}
}


-- FUNCTIONS ----------------------------


function wr02_success()
	--AM 5/28/06: stronghold order changed
	--mission_unlock("truckyard_stronghold")
	mission_unlock("racetrack_stronghold_store")
	hood_set_owner("wr_chinatown01", "Playas")
	mission_set_next_props_req("rollers", Wr03_min_respect_required)
end

function wr02_cleanup()
	objective_text_clear()
	
	for index in Wr02_threads do
		thread_kill(Wr02_threads[index])
		Wr02_threads[index] = nil
	end

	persona_override_remove_all("SP_TROY")
	notoriety_reset("rollers")
	notoriety_reset_vehicle_count("Rollerz")

	on_take_damage("", "wr02_$v000")
	on_take_damage("", "wr02_$v001")
	on_take_damage("", "wr02_$v002")
	
	on_take_damage("", "wr02_$c000")
	on_take_damage("", "wr02_$c000 (1)")
	on_take_damage("", "wr02_$c000 (0)")
	on_detection("", "wr02_$c000")
	on_detection("", "wr02_$c000 (0)")
	on_detection("", "wr02_$c000 (1)")
		
	distance_display_off()
	remove_marker_trigger("wr02_trigger_start_phase2")
	remove_marker_trigger("wr02_trigger_sr_garage")
	trigger_disable("wr02_trigger_start_phase2")
	trigger_disable("wr02_trigger_sr_garage")
	on_trigger("", "wr02_trigger_start_phase2")
	on_trigger("", "wr02_trigger_sr_garage")
	on_death("","#PLAYER#")
	on_death("", "wr02_$c_troy")
	on_dismiss("", "wr02_$c_troy")
	release_to_world("wr02_$G_cutscene1")
	group_destroy("wr02_$g_troy")
	party_set_dismissable(true)
	party_set_recruitable(true)
	mission_waypoint_remove("")
end

-- Sets up phase 1
-- Called by mission trigger
function wr02_start()
	set_mission_author("Sean Rose")
	notoriety_set_max("rollers", 0)

	cutscene_in("wr02_scene01")
	cutscene_play("wr02_scene01", "wr02_$g_troy")
	teleport("#PLAYER#", "mission_start_wr02")
	vehicle_show("wr02_$v_troys_car")
	character_show("wr02_$c_troy")
	character_add_vehicle("wr02_$c_troy", "wr02_$v_troys_car", 0)
	Wr02_mission_timer = 0
	Wr02_racer_nitroed = ""
	Wr02_threads["mission_timer"] = thread_new("wr02_mission_timer")
	wr02_init_voice_banks()

	on_trigger("wr02_trigger_phase2", "wr02_trigger_start_phase2")
	on_trigger("wr02_enter_sr_garage", "wr02_trigger_sr_garage")
	
	-- enter troy
	vehicle_pathfind_to("wr02_$v_troys_car", "wr02_troy_dest", true, true)
	vehicle_exit("wr02_$c_troy")
	release_to_world("wr02_$v_troys_car")
	party_dismiss_all()
	party_add("wr02_$c_troy")
	party_set_dismissable(false)
	party_set_recruitable(false)
	on_dismiss("wr02_troy_dismissed", "wr02_$c_troy")
	on_death("wr02_troy_dismissed", "wr02_$c_troy")
	
	while (get_dist_char_to_char("#PLAYER#", "wr02_$c_troy") > 7.0) do
		thread_yield()
	end
	
	delay (1.5)
	
	audio_play_for_character("TROY_WR2_INTRO_1", "wr02_$c_troy", "voice", false, true)
	
	persona_override_persona_start("SP_TROY", "escort - stripper reacts to hitting human", "TROY_WR2_RUNOVER")
	persona_override_persona_start("SP_TROY", "escort - stripper reacts to hitting vehicle", "TROY_WR2_HITOBJECT", 3)
	
	mission_help_table("wr02_start")
	trigger_enable("wr02_trigger_start_phase2")
	add_marker_trigger("wr02_trigger_start_phase2", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	
	while (not is_player_in_vehicle()) do
		thread_yield()
	end
	
	mission_waypoint_add("wr02_race_gps")
	thread_new("wr02_create_group")
	
	delay(5)
	
	audio_play_for_character("TROY_CARCHAT_1", "wr02_$c_troy", "voice", false, true)
	
end

function wr02_create_group()
	create_group("wr02_$G_cutscene1", true)
	set_unjackable_flag("wr02_$v000", true)
	set_unjackable_flag("wr02_$v001", true)
	set_unjackable_flag("wr02_$v002", true)
	
	set_unjackable_flag("wr02_$v000", true)
	set_unjackable_flag("wr02_$v001", true)
	set_unjackable_flag("wr02_$v002", true)
	
	on_take_damage("wr02_fail_enemy", "wr02_$v000")
	on_take_damage("wr02_fail_enemy", "wr02_$v001")
	on_take_damage("wr02_fail_enemy", "wr02_$v002")
	
	on_take_damage("wr02_fail_enemy", "wr02_$c000")
	on_take_damage("wr02_fail_enemy", "wr02_$c000 (1)")
	on_take_damage("wr02_fail_enemy", "wr02_$c000 (0)")
	on_detection("wr02_fail_enemy2", "wr02_$c000")
	on_detection("wr02_fail_enemy2", "wr02_$c000 (0)")
	on_detection("wr02_fail_enemy2", "wr02_$c000 (1)")
end

function wr02_fail_enemy2()
	wr02_fail_enemy("blah", "#PLAYER#")
end

function wr02_fail_enemy(attacked, attacker)
	if (attacker == "#PLAYER#") then
		on_take_damage("", "wr02_$v000")
		on_take_damage("", "wr02_$v001")
		on_take_damage("", "wr02_$v002")
	
		on_take_damage("", "wr02_$c000")
		on_take_damage("", "wr02_$c000 (1)")
		on_take_damage("", "wr02_$c000 (0)")
		on_detection("", "wr02_$c000")
		on_detection("", "wr02_$c000 (0)")
		on_detection("", "wr02_$c000 (1)")
		release_to_world("wr02_$G_cutscene1")
		delay(1)
		mission_end_failure("wr02", "wr02_fail_driver")
	end
end

function wr02_init_voice_banks()
	Wr02_next_voice_time = 0
	for bank_index, bank_value in Wr02_voice_banks do
		for event_index, event_value in bank_value do
			event_value.lines_used = {}
		end
	end
end

function wr02_mission_timer()
	while true do
		Wr02_mission_timer = Wr02_mission_timer + get_frame_time()
		thread_yield()
	end
end

function wr02_play_voice_line(voice_event, override_timer, character)
	local audio_handle = -1
	local play_time = 0
	
	if Wr02_next_voice_time < Wr02_mission_timer or override_timer == true then
		if rand_float(0.0, 1.0) <= voice_event.chance then
			local total_lines = sizeof_table(voice_event.lines)
			local num_lines_used = sizeof_table(voice_event.lines_used)
			
			if num_lines_used >= total_lines then
				voice_event.lines_used = {}
				num_lines_used = 0
			end
			
			local r = rand_int(1, total_lines - num_lines_used)

			for index, value in voice_event.lines do
				if voice_event.lines_used[value] ~= true then
					if r == 1 then
						audio_handle, play_time = audio_play_for_character(value, character, "voice", false, true)
						voice_event.lines_used[value] = true
						Wr02_next_voice_time = Wr02_mission_timer + 3.0		-- global cooldown of 3 seconds
					end
					
					r = r - 1
				end
			end
		end
	end
	
	return audio_handle, play_time
end

function wr02_troy_dismissed()
	mission_end_failure("wr02", "wr02_troy_dismissed")
end

-- Phase 2 script

-- Called by trigger "wr02_trigger_start_phase2" in Chinatown
function wr02_trigger_phase2()
	if is_player_in_vehicle() then
		mission_waypoint_remove()
		player_controls_disable()
		vehicle_stop("#PLAYER#")
		remove_marker_trigger("wr02_trigger_start_phase2")
		trigger_disable("wr02_trigger_start_phase2")

		persona_override_remove_all("SP_TROY")

		audio_play_for_character("TROY_CARCHAT_2", "wr02_$c_troy", "voice", false, true)
		wr02_begin_phase2()
	end
end


-- Sets up phase 2
function wr02_begin_phase2()
	fade_out(2)
	delay(2)
	group_destroy("wr02_$G_cutscene1")
	
	if not activity_start("Racing", "wr02_race01") then
		cutscene_out()
		
		while not activity_start("Racing", "wr02_race01") do
			mission_debug("Get in a car.", 0.5)
			delay(0.5)
		end
	end

	-- Load our race.
	race_load("wr_racing01", "wr_racing01_race007")

	on_racing_start("wr02_race_start", "wr_racing01_race007")
end

-- called when race has started
function wr02_race_start()
	Wr02_num_race_opponents = racing_get_num_opponents()
	Wr02_num_race_opponents_remaining = Wr02_num_race_opponents
	local vehicle_name
	local driver_name
	local vehicle_data
	local max_hp
	
	Wr02_race_opponents = {}

	for i = 1, Wr02_num_race_opponents, 1 do
		Wr02_racer_names[i] = vehicle_name
		vehicle_name = racing_get_opponent_vehicle_name(i - 1)
		driver_name = racing_get_opponent_driver_name(i - 1)
		Wr02_race_opponents[vehicle_name] = {}
		vehicle_data = Wr02_race_opponents[vehicle_name]
		vehicle_data.driver_name = driver_name
		vehicle_data.blowed_up = false
		vehicle_data.taunt_level = 0
		vehicle_data.taunt_timer = 0
		vehicle_data.racer_index = i
		vehicle_data.vehicle = vehicle_name
		vehicle_data.ahead = true
		vehicle_data.nitro = false
		
		vehicle_set_torque_multiplier(vehicle_name, 2.0 - (i*.3))
		ingame_effect_add_vehicle(vehicle_name, INGAME_EFFECT_KILL)
	end
	player_controls_enable()

	fade_in(2)
	
	on_racing_end("wr02_race_won_or_lost", "wr_racing01_race007")
	
	delay(9)
	
	objective_text( "wr02_enemies_left", Wr02_num_race_opponents_remaining, 3 )
	
	local r = rand_int(1, 3)
	local driver
	
	for index, value in Wr02_race_opponents do
		if r == value.racer_index then
			driver = value
			break
		end
	end
	
	wr02_play_voice_line(Wr02_voice_banks["roller"..r].race_start, true, driver.driver_name)	

	delay(4)

	mission_help_table("wr02_taunt")
	Wr02_threads["race_monitor"] = thread_new("wr02_race_monitor")
end

-- times taunt help messages
function wr02_help_timer()
	while true do
		delay(15)
		Wr02_help_timer_elapsed = true
	end
end

function wr02_play_taunt()
	play_action("wr02_$c_troy", "passenger angry")
end

-- called after the race has been set up
function wr02_race_monitor()
	local closest
	local taunting_data
	local taunt_success = false
	local taunting = nil
	local dist_disp_on = false
	local dist_to_taunt = 20
	local dist_display_veh = ""
	local first_opponent_name
	local audio_handle = -1
	local play_time
	local closer_timer = 0.0
	
	for index in Wr02_race_opponents do
		first_opponent_name = index
		break
	end
	
	Wr02_help_timer_elapsed = true

	Wr02_threads["help_timer"] = thread_new("wr02_help_timer")
	
	on_racing_player_passed_opponent("wr02_player_passed_opponent", "wr_racing01_race007")	
	on_racing_opponent_passed_player("wr02_opponent_passed_player", "wr_racing01_race007")

	while Wr02_num_race_opponents_remaining > 0 do
		local old_taunting = taunting
		taunting = wr02_get_closest_opponent(dist_to_taunt * 4)
		if taunting ~= old_taunting then
			if old_taunting ~= nil then
				ingame_effect_remove_vehicle(old_taunting)
				minimap_icon_remove_vehicle(old_taunting)
				ingame_effect_add_vehicle(old_taunting, INGAME_EFFECT_KILL)
				distance_display_off(old_taunting)
			end
			
			if taunting ~= nil then
				distance_display_on(Wr02_race_opponents[taunting].driver_name, 0, dist_to_taunt, 0, dist_to_taunt)
				remove_marker_vehicle(taunting)
				add_marker_vehicle(taunting, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
			end
		end
				
		for index, value in Wr02_race_opponents do
			if value.blowed_up == false and is_vehicle_destroyed(index) == true then
				wr02_report_opponent_destroyed(value)
				
					--don't allow any more local data to get proccessed because this script
					--may have gotten unloaded
				if is_mission_complete("wr02") then
					return
				end
			end
		end

		if taunting ~= nil then
			taunting_data = Wr02_race_opponents[taunting]
			
			mission_debug("taunting: "..taunting, -1, 2)
			hud_bar_set_range(0,5)
			hud_bar_on("Taunt")
			hud_bar_set_value(taunting_data.taunt_timer/3 + (taunting_data.taunt_level))
		 
			-- do the taunt thing
			if is_vehicle_destroyed(taunting) == false and audio_is_playing(audio_handle) == false then
				-- the player must be in the same or later lap than the target
				if get_dist_char_to_vehicle("#PLAYER#", taunting) < dist_to_taunt then
					if taunting_data.taunt_timer >= 3 then
						taunting_data.taunt_level = taunting_data.taunt_level + 1
						thread_new("wr02_play_taunt")
						audio_handle, play_time = wr02_play_voice_line(Wr02_voice_banks["troy"].taunt, true, "wr02_$c_troy")
						if (taunting_data.taunt_level == 3) then
							wr02_play_voice_line(Wr02_voice_banks["roller"..taunting_data.racer_index].roller_pass_player, true, taunting_data.driver_name)
						end
						taunt_success = true
						taunting_data.taunt_timer = 0
					
						-- has the player taunted this guy enough?
						if taunting_data.taunt_level >= 5 then
							Wr02_threads[taunting_data.racer_index] = thread_new("wr02_destroy_opponent", taunting, taunting_data)
							taunting_data.blowed_up = true
							remove_marker_vehicle(taunting)
							taunting = nil
							distance_display_off()
							dist_disp_on = false
						end
					else
						taunting_data.taunt_timer = taunting_data.taunt_timer + 0.2
					end
				else
					if (closer_timer <= 0.0) then
						if (get_dist_char_to_vehicle("#PLAYER#", Wr02_race_opponents[wr02_get_closest_opponent(dist_to_taunt * 4)].vehicle) < (dist_to_taunt * 4)) then
							wr02_play_voice_line(Wr02_voice_banks["troy"].closer, false, "wr02_$c_troy")
							closer_timer = 10.0
						end
					end
				end
			end
		else
			hud_bar_off()
		end
		
		closer_timer = closer_timer - 0.1
	
		if (taunting ~= nil) and (is_vehicle_destroyed(taunting)) then
			distance_display_off(taunting)
			remove_marker_vehicle(taunting)
			taunting = nil
		end
		
		if Wr02_help_timer_elapsed == true then
			if taunt_success == false then
				mission_help_table("wr02_taunt_now")
			end
			
			taunt_success = false
			Wr02_help_timer_elapsed = false
		end
		
		for i, vehicle in pairs(Wr02_race_opponents) do
			
			if (vehicle.ahead and (get_dist_char_to_vehicle("#PLAYER#", vehicle.vehicle) > 80.0)) then
				if (not vehicle.blowed_up) then 
					vehicle_speed_override(vehicle.vehicle, 25)
				end
			else
				if (vehicle.ahead and (get_dist_char_to_vehicle("#PLAYER#", vehicle.vehicle) > 40.0)) then
					if (not vehicle.blowed_up) then 
						vehicle_speed_override(vehicle.vehicle, 35)
					end
				else
					if (not vehicle.blowed_up) then 
						vehicle_speed_override(vehicle.vehicle, 65+(vehicle.racer_index*5) )
					end
				end
			end
		end
		
		delay(0.1)
	end
	
	distance_display_off()
	thread_kill(Wr02_threads["help_timer"])
	Wr02_threads["help_timer"] = nil
end

function wr02_race_won_or_lost()
	thread_kill(Wr02_threads["race_monitor"])
	mission_end_failure("wr02", "wr02_lost_race")
end

function wr02_destroy_opponent(name, data)
	Wr02_racer_nitroed = name
	
	wr02_play_voice_line(Wr02_voice_banks["roller"..data.racer_index].nitro_pass_player, true, data.driver_name)
	
	if not is_vehicle_destroyed(name) then
		vehicle_speed_override(name, 100)
		
		--while get_vehicle_speed(name) < 40 do
		--	delay(0.1)
		--end

		data.blowed_up = true
		vehicle_set_torque_multiplier(name, 2.0)
		vehicle_max_speed(name, 130)
		vehicle_set_nitro_state(name, true)
		vehicle_set_smoke_and_fire_state(name, true, false)
	end
	
	delay(4)
	
	Wr02_racer_nitroed = ""
	
	if not is_vehicle_destroyed(name) then
		turn_vulnerable(name)
		vehicle_detonate(name)
		wr02_report_opponent_destroyed(data)
	end
end

function wr02_player_passed_opponent(passed)
	if is_vehicle_destroyed(passed) == false then
		-- find the vehicle passed and if the driver is still driving, taunt
		local driver = nil
		for index, value in Wr02_race_opponents do
			if index == passed then
				if get_char_in_vehicle(index, 0) == value.driver_name then
					wr02_play_voice_line(Wr02_voice_banks["roller"..value.racer_index].player_pass_roller, false, value.driver_name)
					value.ahead = false
				end
			end
		end
	end
end

function wr02_opponent_passed_player(passer)
	if is_vehicle_destroyed(passer) == false then
		-- find the vehicle passed and if the driver is still driving, taunt
		local driver = nil
		for index, value in Wr02_race_opponents do
			if index == passer then
				if get_char_in_vehicle(index, 0) == value.driver_name then
					if Wr02_racer_nitroed == passer then
						--
					else
						wr02_play_voice_line(Wr02_voice_banks["roller"..value.racer_index].roller_pass_player, false, value.driver_name)
					end
					value.ahead = true
				end
			end
		end
	end
end

function wr02_get_closest_opponent(min_dist)
	local dist = min_dist
	local closest = nil
	local temp_dist
	
	if not is_dead("#PLAYER#") then
		for index, value in Wr02_race_opponents do
			if not value.blowed_up and not is_vehicle_destroyed(index) then
				temp_dist = get_dist_char_to_vehicle("#PLAYER#", index)
				if temp_dist < dist then
					dist = temp_dist
					closest = index
				end
			end
		end
	end
	
	return closest
end

-- called by script when a vehicle has been destroyed
function wr02_report_opponent_destroyed(opp)
	opp.blowed_up = true
	wr02_play_voice_line(Wr02_voice_banks["troy"].dead, true, "wr02_$c_troy")
	Wr02_num_race_opponents_remaining = Wr02_num_race_opponents_remaining - 1
	
	objective_text( "wr02_enemies_left", Wr02_num_race_opponents_remaining, 3 )
	
	if Wr02_num_race_opponents_remaining == 0 then
		activity_cancel()
		delay(5)
		mission_end_success("wr02")
	end
end

-- Start phase 3, after the race has been completed
function wr02_begin_phase3()
	trigger_enable("wr02_trigger_sr_garage")
	turn_vulnerable("wr02_$c_troy")
	add_marker_trigger("wr02_trigger_sr_garage", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	notoriety_set("rollers", 3.5)
	thread_kill(Wr02_threads["race_monitor"])
	
	thread_kill(Wr02_threads[1])
	thread_kill(Wr02_threads[2])
	thread_kill(Wr02_threads[3])
	Wr02_num_race_opponents_remaining = 0
	activity_cancel()
	while (get_dist_char_to_nav("#PLAYER#", "wr02_$execute lua script001") > 250.0) do
		thread_yield()
	end
	notoriety_set_desired_vehicle_count("Rollerz", 0)
end

-- player enters garage, maybe mission success
function wr02_enter_sr_garage()
	if notoriety_spawn_count("All") > 0 then
		mission_help_table("wr02_being_chased")
	else
		mission_end_success("wr02")
	end
end

-- mission failed for some reason - prolly player died
function wr02_mission_failed()
	mission_end_failure("wr02")
end
