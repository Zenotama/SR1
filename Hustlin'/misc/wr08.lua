-- Global Variables------
WR08_TRAVEL_TIMER = 30 * 1000

-- Rewards
Wr08_hood_reward = ""

Wr08_convoy_waypoints_left = {
	"wr08_$n_convoy01L",	"wr08_$n_convoy02L",	"wr08_$n_convoy03L",	"wr08_$n_convoy04L",	"wr08_$n_convoy05L",	
	"wr08_$n_convoy06L",	"wr08_$n_convoy07L",	"wr08_$n_convoy08L",	"wr08_$n_convoy09L",	"wr08_$n_convoy10L",	
	"wr08_$n_convoy11L",	"wr08_$n_convoy12L",	"wr08_$n_convoy13L",	"wr08_$n_convoy14L",	"wr08_$n_convoy15L",	
	"wr08_$n_convoy16L",	"wr08_$n_convoy17L",	"wr08_$n_convoy18L",	"wr08_$n_convoy19L",	"wr08_$n_convoy20L",	
	"wr08_$n_convoy21L",	"wr08_$n_convoy22L",	"wr08_$n_convoy23L",	"wr08_$n_convoy24L",	"wr08_$n_convoy25L",	
	"wr08_$n_convoy26L",	"wr08_$n_convoy27L",	"wr08_$n_convoy28L",	"wr08_$n_convoy29L",	"wr08_$n_convoy30L",	
	"wr08_$n_convoy31L",	"wr08_$n_convoy32L",	"wr08_$n_convoy33L",	"wr08_$n_convoy34",		"wr08_$n_convoy_destination"
}

Wr08_convoy_waypoints_right = {
	"wr08_$n_convoy01L",	"wr08_$n_convoy02L",	"wr08_$n_convoy03R",	"wr08_$n_convoy04R",	"wr08_$n_convoy05R",	
	"wr08_$n_convoy06R",	"wr08_$n_convoy07L",	"wr08_$n_convoy08L",	"wr08_$n_convoy09L",	"wr08_$n_convoy10L",	
	"wr08_$n_convoy11R",	"wr08_$n_convoy12R",	"wr08_$n_convoy13R",	"wr08_$n_convoy14R",	"wr08_$n_convoy15R",	
	"wr08_$n_convoy16R",	"wr08_$n_convoy17L",	"wr08_$n_convoy18R",	"wr08_$n_convoy19L",	"wr08_$n_convoy20L",	
	"wr08_$n_convoy21R",	"wr08_$n_convoy22R",	"wr08_$n_convoy23R",	"wr08_$n_convoy24R",	"wr08_$n_convoy25R",	
	"wr08_$n_convoy26R",	"wr08_$n_convoy27R",	"wr08_$n_convoy28R",	"wr08_$n_convoy29R",	"wr08_$n_convoy30R",	
	"wr08_$n_convoy31R",	"wr08_$n_convoy32R",	"wr08_$n_convoy33R",	"wr08_$n_convoy34",		"wr08_$n_convoy_destination"
}

Wr08_convoy_data = {
	{
		vehicle_name = "wr08_$v_roller1",
		waypoints = Wr08_convoy_waypoints_left,
		waypoint_start_index = 10,
		occupants = {"wr08_$c_roller_1_0", "wr08_$c_roller_1_1"}
	},
	{
		vehicle_name = "wr08_$v_roller2",
		waypoints = Wr08_convoy_waypoints_right,
		waypoint_start_index = 10,
		occupants = {"wr08_$c_roller_2_0", "wr08_$c_roller_2_1"}
	},
	{
		vehicle_name = "wr08_$v_roller3",
		waypoints = Wr08_convoy_waypoints_left,
		waypoint_start_index = 11,
		occupants = {"wr08_$c_roller_3_0", "wr08_$c_roller_3_1"}
	},
	{
		vehicle_name = "wr08_$v_roller4",
		waypoints = Wr08_convoy_waypoints_right,
		waypoint_start_index = 11,
		occupants = {"wr08_$c_roller_4_0", "wr08_$c_roller_4_1"}
	},
	{
		vehicle_name = "wr08_$v_roller5",
		waypoints = Wr08_convoy_waypoints_left,
		waypoint_start_index = 12,
		occupants = {"wr08_$c_roller_5_0", "wr08_$c_roller_5_1"}
	},
	{
		vehicle_name = "wr08_$v_roller6",
		waypoints = Wr08_convoy_waypoints_right,
		waypoint_start_index = 12,
		occupants = {"wr08_$c_roller_6_0", "wr08_$c_roller_6_1"}
	},
	{
		vehicle_name = "wr08_$v_roller7",
		waypoints = Wr08_convoy_waypoints_right,
		waypoint_start_index = 12,
		occupants = {"wr08_$c_roller_7_0", "wr08_$c_roller_7_1"}
	},
	{
		vehicle_name = "wr08_$v_roller8",
		waypoints = Wr08_convoy_waypoints_left,
		waypoint_start_index = 13,
		occupants = {"wr08_$c_roller_8_0", "wr08_$c_roller_8_1"}
	},
	{
		vehicle_name = "wr08_$v_roller9",
		waypoints = Wr08_convoy_waypoints_right,
		waypoint_start_index = 13,
		occupants = {"wr08_$c_roller_9_0", "wr08_$c_roller_9_1"}
	},
	{
		vehicle_name = "wr08_$v_roller10",
		waypoints = Wr08_convoy_waypoints_left,
		waypoint_start_index = 15,
		occupants = {"wr08_$c_roller_10_0", "wr08_$c_roller_10_1"}
	},
	{
		vehicle_name = "wr08_$v_roller11",
		waypoints = Wr08_convoy_waypoints_right,
		waypoint_start_index = 15,
		occupants = {"wr08_$c_roller_11_0", "wr08_$c_roller_11_1"}
	}
}

Wr08_rollers_destroyed = {}

Wr08_threads = {}

Wr08_vehicle_lookup = {}

Wr08_attacked_vehicles = {}

Wr08_target_vehicle = ""

Wr08_orig_weapons = {}

Wr08_rollers_remain = 0

Wr08_total_rollers = 0


-- FUNCTIONS ----------------------------

function wr08_cleanup()
	ammo_infinite(false)
	mission_waypoint_remove()
	camera_end_script()
	hud_timer_stop()
	objective_text_clear()
	trigger_disable("wr08_$t_convoy_start")
	damage_indicator_off()
	on_trigger("", "wr08_$t_convoy_start")
	on_death("", "wr08_$c_julius")
	on_dismiss("", "wr08_$c_julius")
	
	for index, value in Wr08_convoy_data do
		remove_marker_vehicle(value.vehicle_name)
	end
	
	remove_marker_vehicle("wr08_$v_julius_car")
	release_to_world("wr08_$g_convoy")
	vehicle_infinite_mass("wr08_$v_julius_car", false)
	release_to_world("wr08_$v_julius_car")
	destroy_group("wr08_$g_julius")
	notoriety_set_max("rollers", 5)

	-- switch back to the mac10 if that's what the player had before
	if Wr08_orig_weapons["mac10"] == true then
		inv_item_add("mac10", 1, "#PLAYER#") 
	end
	
	-- remove the player's rpg gift
	if Wr08_orig_weapons["rpg_launcher"] == nil then
		inv_item_remove("rpg_launcher", 1, "#PLAYER#")
	end
	
	Wr08_orig_weapons = {}
	
	for index, value in Wr08_threads do
		thread_kill(value)
	end
	
	Wr08_threads = {}
end

-- Called by mission trigger
function wr08_start()
	--persona_override_persona_start("SP_JULIUS", "escort - stripper reacts to hitting human", "JULIUS_3SS2_HITPED")
	persona_override_persona_start("SP_JULIUS", "escort - stripper reacts to hitting vehicle", "JULIUS_3SS2_HITOBJ")
	radio_post_event("NEWS_WR_BODYOFLIN", true)
	set_mission_author("Sean Rose")
	Wr08_orig_weapons = {}
	cutscene_in("wr08_scene01")
	cutscene_play("wr08_scene01", "wr08_$g_julius")
	vehicle_show("wr08_$v_julius_car")
	character_show("wr08_$c_julius")
	
	party_dismiss("#FOLLOWER3#")
	party_add("wr08_$c_julius")
	on_dismiss("wr08_mission_fail_dismiss", "wr08_$c_julius")
	
	character_add_vehicle("#PLAYER#", "wr08_$v_julius_car", 0)
	character_add_vehicle("wr08_$c_julius", "wr08_$v_julius_car", 1)
	vehicle_supress_npc_exit("wr08_$v_julius_car", true)
	
	
	on_vehicle_destroyed("wr08_mission_fail2", "wr08_$v_julius_car")
	on_death("wr08_mission_fail", "wr08_$c_julius")
	
	local hp = get_max_hit_points("wr08_$v_julius_car") * 2
	set_max_hit_points("wr08_$v_julius_car", hp)
	set_current_hit_points("wr08_$v_julius_car", hp)
	
	on_trigger("wr08_begin_turret_mode", "wr08_$t_convoy_start")
	trigger_enable("wr08_$t_convoy_start")
	add_marker_trigger("wr08_$t_convoy_start", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	mission_waypoint_add("wr08_convoy_gps")
	
	Wr08_threads["wr08_monitor_player"] = thread_new("wr08_monitor_player")
	
	
	delay(2)
	mission_help_table("wr08_meet_convoy")
	
	audio_play_for_character("JULIUS_WR8_OPEN_1", "wr08_$c_julius", "voice", false, true)
	delay(10)
	audio_play_for_character("JULIUS_WR8_CAR_1", "wr08_$c_julius", "voice", false, true)
end

function wr08_success()
	mission_unlock("wrsuburb_stronghold_price")
	mission_set_next_props_req("rollers", Wr09_min_respect_required)
	if Wr08_hood_reward ~= "" then
		hood_set_owner(Wr08_hood_reward, "Playas")
	end
end

function wr08_monitor_player()
	while true do
		if get_char_in_vehicle("wr08_$v_julius_car", 0) ~= "#PLAYER#" then
			mission_help_table_nag("wr08_get_in_car")
			hud_timer_set(60 * 1000, "wr08_get_in_vehicle_timer_elapse")
			add_marker_vehicle("wr08_$v_julius_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
			
			while get_char_in_vehicle("wr08_$v_julius_car", 0) ~= "#PLAYER#" do
				delay(0.1)
			end
			
			remove_marker_vehicle("wr08_$v_julius_car")
			mission_help_table_nag("wr08_meet_convoy")
			hud_timer_stop()
		end
		
		delay(0.1)
	end
end

function wr08_get_in_vehicle_timer_elapse()
	mission_end_failure("wr08", "wr08_left_car_too_long")
end

function wr08_begin_turret_mode()
	if (get_char_in_vehicle("wr08_$v_julius_car", 0) ~= "#PLAYER#") then
		mission_help_table_nag("wr08_get_in_car")
		return
	end
	ammo_infinite(true)
	mission_waypoint_remove()
	thread_kill(Wr08_threads["wr08_monitor_player"])
	Wr08_threads["wr08_monitor_player"] = nil
	on_trigger("", "wr08_$t_convoy_start")
	trigger_disable("wr08_$t_convoy_start")
	remove_marker_trigger("wr08_$t_convoy_start")
	combat_disable("wr08_$c_julius")
	wr08_scripted_cutscene_1()
	Wr08_threads["wr08_turret_mode"] = thread_new("wr08_turret_mode")
end

function wr08_setup_turret_mode()
	local num_occ
	local thread_id

	Wr08_total_rollers = 0
	Wr08_attacked_vehicles = {}
	Wr08_rollers_destroyed = {}
	
	-- mark price as destroyed so we don't chase him
	
	-- init run time data
	for veh_index, vehicle in Wr08_convoy_data do
		num_occ = sizeof_table(vehicle.occupants)
		for i = 1, num_occ do
			character_add_vehicle(vehicle.occupants[i], vehicle.vehicle_name, i - 1)
			Wr08_vehicle_lookup[vehicle.occupants[i]] = veh_index
			on_take_damage("wr08_roller_attacked", vehicle.occupants[i])
		end
		
		Wr08_total_rollers = Wr08_total_rollers + 1
		set_ignore_ai_flag(vehicle.occupants[1], true)
		vehicle_supress_npc_exit(vehicle.vehicle_name, true)
		vehicle_speed_override(vehicle.vehicle_name, 50)
		
		--vehicle_infinite_mass(vehicle.vehicle_name, true)
		vehicle_prevent_explosion_fling(vehicle.vehicle_name, true)
		vehicle_disable_flee(vehicle.vehicle_name, true)
		vehicle_disable_chase(vehicle.vehicle_name, true)
	
		add_marker_vehicle(vehicle.vehicle_name, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		on_death("wr08_driver_killed", vehicle.occupants[1])
		on_vehicle_destroyed("wr08_vehicle_destroyed", vehicle.vehicle_name)
	
		Wr08_threads["wr08_behavior_"..vehicle.vehicle_name] = thread_new("wr08_behavior", vehicle, vehicle.waypoints)
	end
	
	Wr08_rollers_remain = Wr08_total_rollers
	
	turret_start()
	notoriety_set_max("rollers", 1)

	damage_indicator_on("wr08_$v_julius_car", 0.15, "wr08_car_name")
	wr08_target_roller(wr08_get_closest_roller())
end

function wr08_turret_mode()
	local julius_accelerate = false
	local dist_to_target
	local smoke, fire
	local rollerz_close_warning = false
	
	while Wr08_target_vehicle ~= "" do
		dist_to_target = get_dist_char_to_char("wr08_$c_julius", Wr08_target_vehicle.occupants[1])
		
		-- check to see if target is too far
		if dist_to_target > 70 then
			wr08_target_roller(wr08_get_closest_roller())
			
			if Wr08_target_vehicle == "" then
				break
			end
		end
		
		-- check to see if julius should accelerate
		if julius_accelerate == false and dist_to_target > 30 then
			vehicle_speed_override("wr08_$v_julius_car", 70)
mission_debug("Accelerating to catch up", -1, 6)
			julius_accelerate = true
		-- check to see if julius should decelerate
		elseif julius_accelerate == true and dist_to_target < 20 then
			vehicle_speed_cancel("wr08_$v_julius_car")
mission_debug("Matching speed to target", -1, 6)
			julius_accelerate = false
		end

		-- check to see if the target is dead
		smoke, fire = vehicle_get_smoke_and_fire_state(Wr08_target_vehicle.vehicle_name)
		if is_dead(Wr08_target_vehicle.occupants[1]) == true or
			 is_vehicle_destroyed(Wr08_target_vehicle.vehicle_name) == true or fire == true then
			
			wr08_target_roller(wr08_get_closest_roller())
		end
		
		-- check for about to lose warning
		for i, car in pairs(Wr08_convoy_data) do
			if rollerz_close_warning == false then
				if get_dist_vehicle_to_nav(car.vehicle_name, "wr08_$n_convoy28R") < 40 then
					mission_help_table_nag("wr08_rollerz_near_row")
					hud_timer_set( WR08_TRAVEL_TIMER, "wr08_timer_failure" )
					rollerz_close_warning = true
				end
			end
		end
			
		delay(0.2)
	end

	objective_text_clear()
	
	--misson_end_failure("wr08")
end

function wr08_timer_failure()
	mission_end_failure("wr08", "wr08_reached")
end

function wr08_roller_eliminated(veh)
	Wr08_rollers_destroyed[veh.vehicle_name] = true
	
	on_death("", veh.occupants[1])
	on_vehicle_destroyed("", veh.vehicle_name)
	Wr08_rollers_remain = Wr08_rollers_remain - 1
	
	if (Wr08_rollers_remain == 10) then
		audio_play_for_character("JULIUS_WR8_ATTACK", "wr08_$c_julius", "voice", false, false, 0)
	end
	
	if (Wr08_rollers_remain == 9) then
		audio_play_for_character("JULIUS_WR8_CONVOYDAMAGED_1", "wr08_$c_julius", "voice", false, false)
	end
	
	if (Wr08_rollers_remain == 7) then
		audio_play_for_character("JULIUS_WR8_ATTACK", "wr08_$c_julius", "voice", false, false, 1)
	end
	
	if (Wr08_rollers_remain == 6) then
		audio_play_for_character("JULIUS_WR8_CONVOYDAMAGED_2", "wr08_$c_julius", "voice", false, false)
	end
	
	if (Wr08_rollers_remain == 4) then
		audio_play_for_character("JULIUS_WR8_ATTACK", "wr08_$c_julius", "voice", false, false, 2)
	end
	
	if (Wr08_rollers_remain == 3) then
		audio_play_for_character("JULIUS_WR8_CONVOYDAMAGED_3", "wr08_$c_julius", "voice", false, false)
	end
	
	if (Wr08_rollers_remain == 2) then
		audio_play_for_character("JULIUS_WR8_ATTACK", "wr08_$c_julius", "voice", false, false, 3)
	end
	
	if (Wr08_rollers_remain == 0) then
		hud_timer_stop()
		vehicle_speed_override("wr08_$v_julius_car", 25)
		audio_play_for_character("JULIUS_WR8_WIN_1", "wr08_$c_julius", "voice", false, true)
		delay(1)
		cutscene_in("wr08_scene02")
		vehicle_hide("wr08_$v_julius_car")
		vehicle_stop("wr08_$v_julius_car")
		for x=1,11,1 do
			vehicle_hide("wr08_$v_roller"..x)
		end
		
		cutscene_play("wr08_scene02", true)
		vehicle_show("wr08_$v_julius_car")
		character_remove_vehicle("wr08_$c_julius")
		character_remove_vehicle("#PLAYER#")
		character_add_vehicle("#PLAYER#", "wr08_$v_julius_car", 0)
		mission_end_success("wr08")
		return
	end
	
	objective_text("wr08_objective", Wr08_rollers_remain, Wr08_total_rollers)
	remove_marker_vehicle(veh.vehicle_name)
end

function wr08_driver_killed(driver)
	local veh = Wr08_convoy_data[Wr08_vehicle_lookup[driver]]
	if Wr08_rollers_destroyed[veh.vehicle_name] == nil then
		wr08_roller_eliminated(veh)
	end
end

function wr08_vehicle_destroyed(name)
	for veh_index, veh in Wr08_convoy_data do
		if veh.vehicle_name == name then
			if Wr08_rollers_destroyed[veh.vehicle_name] == nil then
				wr08_roller_eliminated(veh)
			end
			
			break
		end
	end
end

function wr08_target_roller(target_veh)
--	if Wr08_target_vehicle ~= "" then
--		remove_marker_vehicle(Wr08_target_vehicle.vehicle_name)
--	end
	
	
	if target_veh ~= nil then
		if (target_veh == Wr08_target_vehicle) then
			return
		end
	
		vehicle_chase("wr08_$v_julius_car", target_veh.occupants[1], false, false)
		attack("wr08_$c_julius", target_veh.occupants[1], false)
--		add_marker_vehicle(target_veh.vehicle_name, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		Wr08_target_vehicle = target_veh
	else
		Wr08_target_vehicle = ""
	end
end

function wr08_get_closest_roller()
	local closest_d = 50000
	local target_veh = nil
	local d
	
	for veh_index, veh in Wr08_convoy_data do
		if Wr08_rollers_destroyed[veh.vehicle_name] == nil and is_dead(veh.occupants[1]) == false then
			d = get_dist_char_to_char("wr08_$c_julius", veh.occupants[1])
			if d < closest_d then
				closest_d = d
				target_veh = veh
			end
		end
	end
	
	return target_veh
end

function wr08_mission_fail()
	mission_end_failure("wr08", "wr08_dead")
end

function wr08_mission_fail2()
	mission_end_failure("wr08", "wr08_car_dead")
end

function wr08_mission_fail_dismiss()
	mission_end_failure("wr08", "wr08_dismiss")
end

function wr08_roller_attacked(attacked, attacker)
	if attacker == "#PLAYER#" then
		local veh = Wr08_convoy_data[Wr08_vehicle_lookup[attacked]]
		Wr08_attacked_vehicles[veh.vehicle_name] = true
		mission_debug("setting "..veh.vehicle_name.." as attacked", 90, 5)
		for i, j in veh.occupants do
			if i > 1 then
				attack(j, "#PLAYER#")
				on_take_damage("", j)
			end
		end
	end
end

function wr08_behavior(veh, waypoints)
	local next_waypoint = veh.waypoint_start_index
	local num_waypoints = sizeof_table(waypoints)
	local pf_thread = veh.vehicle_name.."_pf"
	local fleeing = false
	local new_pf = false
	
	pf_thread = thread_new("wr08_pf", veh.vehicle_name, waypoints[next_waypoint], fleeing, false)
	
	while next_waypoint < num_waypoints do
		if fleeing == false and Wr08_attacked_vehicles[veh.vehicle_name] == true then
			fleeing = true
			new_pf = true
		end
		
		if get_dist_vehicle_to_nav(veh.vehicle_name, waypoints[next_waypoint]) < 5 then
			next_waypoint = next_waypoint + 1
			new_pf = true
		end
		
		if new_pf == true and next_waypoint <= num_waypoints then
			if Wr08_threads[pf_thread] ~= nil then
				thread_kill(Wr08_threads[pf_thread])
			end

			Wr08_threads[pf_thread] = thread_new("wr08_pf", veh.vehicle_name, waypoints[next_waypoint], fleeing, false)
			new_pf = false
		end
		
		--if not vehicle_continuing_along_highway(veh.vehicle_name) then
		--	wr08_vehicle_destroyed(veh.vehicle_name)
		--	return
		--end
		delay(0.2)
	end
end

function wr08_pf(veh_name, waypoint, nav_mesh, stop)
	if (nav_mesh) then
		vehicle_turret_base_to(veh_name, waypoint, stop)
	else
		vehicle_pathfind_to(veh_name, waypoint, false, stop)
	end
end

function wr08_scripted_cutscene_1()
	-- give the player a rpg_launcher
	if inv_have_item("rpg_launcher", "#PLAYER#") == true then
		Wr08_orig_weapons["rpg_launcher"] = true
	else
		inv_item_add("rpg_launcher", 1, "#PLAYER#")
	end
	
	turn_invulnerable("wr08_$c_julius")
	turn_invulnerable("#PLAYER#")
	player_controls_disable()
	vehicle_stop("#PLAYER#")
	fade_out(0.5)
	fade_out_block()
	teleport_vehicle("wr08_$v_julius_car", "wr08_$n_attack_pos")
	character_remove_vehicle("#PLAYER#")
	character_remove_vehicle("wr08_$c_julius")
	teleport("wr08_$c_julius", "wr08_$n_cut1_julius_stop_1")
	inv_item_equip("rpg_launcher", "#PLAYER#")
	character_add_vehicle("#PLAYER#", "wr08_$v_julius_car", 1)
	
	letterbox_fade_in(true)
	create_group("wr08_$g_convoy", true)
	thread_new_block("wr08_scripted_cutscene_1_modal")
	letterbox_fade_out(true)
	fade_in(0.5)
	fade_in_block()
	camera_end_script()
	
	persona_override_persona_stop_all("SP_JULIUS")
	--persona_override_persona_start("SP_JULIUS", "threat - alert (group attack)", "JULIUS_WR8_ATTACK") 
	persona_override_persona_start("SP_JULIUS", "combat - congratulate player", "JULIUS_WR8_GRATPC") 
	persona_override_persona_start("SP_JULIUS", "threat - damage received (firearm)", "JULIUS_WR8_DAMAGE") 
	
	if (get_char_in_vehicle("wr08_$v_julius_car", 0) ~= "wr08_$c_julius") then
		character_add_vehicle("wr08_$c_julius", "wr08_$v_julius_car", 0)
	end
	
	vehicle_supress_npc_exit("wr08_$v_julius_car", true)
	vehicle_infinite_mass("wr08_$v_julius_car", true)
	vehicle_prevent_explosion_fling("wr08_$v_julius_car", true)
	turn_vulnerable("#PLAYER#")
	player_controls_enable()
	wr08_setup_turret_mode()
	fade_in(0.75)
end

function wr08_scripted_cutscene_1_modal()
	modal_begin()
	fade_in(1.0)
	delay(1.0)
	audio_play_for_character("JULIUS_WR8_SPOT_1", "wr08_$c_julius", "voice", false, true)
	vehicle_enter("wr08_$c_julius", "wr08_$v_julius_car", 0)
	modal_end()
end