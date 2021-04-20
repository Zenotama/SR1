


	-- Westside Rollers Mission 1 - Truckload of Cars --

-- Globals --


WR01_caravan_vehicles		= {"wr01_$v_semi", "wr01_$v_escort_1"}
WR01_caravan_drivers			= {"wr01_$c_truck_driver", "wr01_$c_escort_driver_1"}
WR01_caravan_passengers		= {"wr01_$c_escort_passenger_1"}
WR01_caravan_curr_navpoint	= 0
WR01_caravan_loaded			= false
Wr01_in_exit = false

Wr01_threads = {}
Wr01_flee_waypoints = {
	"wr01_$n_flee01", "wr01_$n_flee02", "wr01_$n_flee03", "wr01_$n_flee04", "wr01_$n_flee05",
	"wr01_$n_flee06", "wr01_$n_flee07", "wr01_$n_flee08", "wr01_$n_flee09", "wr01_$n_flee10",
	"wr01_$n_flee11",	"wr01_$n_flee12", "wr01_$n_flee13", "wr01_$n_flee14", "wr01_$n_flee15",
	"wr01_$n_flee16",	"wr01_$n_flee17", "wr01_$n_flee18", "wr01_$n_flee19", "wr01_$n_flee20",
	"wr01_$n_flee21",	"wr01_$n_flee22", "wr01_$n_flee23", "wr01_$n_flee24", "wr01_$n_flee25",
	"wr01_$n_flee26",	"wr01_$n_flee27",	"wr01_$n_flee28",	"wr01_$n_flee29",
}

Wr01_spawn_triggers = {"wr01_$t_spawn1", "wr01_$t_spawn2", "wr01_$t_spawn3", "wr01_$t_spawn4" }

Wr01_obstacle_ignore_handles = {}
Wr01_mission_won = false

function wr01_setup()
	-- setup the mission
end

function wr01_success()
	radio_post_event("NEWS_WR_TRUCKHIJACK", false)
end

function wr01_start()
	set_mission_author("Sandeep Shekar")
	Wr01_mission_won = false
	cellphone_remove("LIN_WR1_PHONE1_1")

	cutscene_in("wr01_scene01")
	-- TODO: cut scene
	cutscene_play("wr01_scene01", "wr01_courtesy")
	vehicle_show("wr01_courtesy_car")
	teleport("#PLAYER#", "mission_start_wr01")
	-- inform player and wait until he is in range of the intercept site to spawn
	WR01_caravan_loaded = false
	Wr01_obstacle_ignore_handles = {}
	wr01_spawn_caravan()
	set_unjackable_flag("wr01_$v_semi", true)
	mission_waypoint_add("wr01_truck2_gps")
	--mission_waypoint_add("wr01_$v_semi")

	notoriety_set_max("rollers", 1)
	damage_indicator_on("wr01_$v_semi", 0.96, "wr01_truck")
	
	delay(2)
	mission_help_table("wr01_intercept_truck")
	
	while (not WR01_caravan_loaded) do
		thread_yield()
	end
	
	local caravan_thread = thread_new("wr01_caravan_lead")
	
	vehicle_chase("wr01_$v_escort_1", "wr01_$c_truck_driver", false, false, false)
	--vehicle_chase("wr01_$v_escort_2", "wr01_$c_escort_driver_1", false, false, false)
	vehicle_speed_override("wr01_$v_semi", 10)
	
	while (get_dist_char_to_char("#PLAYER#", "wr01_$c_truck_driver") > 100) do
		delay(0.25)
	end
	
	mission_waypoint_remove()

	thread_new("wr01_monitor_player")
	
	vehicle_speed_override("wr01_$v_semi", 27)

	while (get_dist_char_to_char("#PLAYER#", "wr01_$c_truck_driver") > 50) do
		delay(0.25)
	end
	
	
	mission_help_table("wr01_truck_spotted")
			
	delay(7)
	
	mission_help_table("wr01_take_truck")
	
	delay(7)
	
	mission_help_table_nag("wr01_damage")
	
	-- wait until player is in semi
	while get_char_in_vehicle("wr01_$v_semi", 0) ~= "#PLAYER#" do
		thread_yield()
	end
	
	release_to_world("wr01_$c_escort_driver_1")
	release_to_world("wr01_$c_escort_passenger_1")
	
	--release_to_world("wr01_$c_escort_driver_2")
	--release_to_world("wr01_$c_escort_passenger_2")

	release_to_world("wr01_$v_escort_1")
	--release_to_world("wr01_$v_escort_2")

	vehicle_infinite_mass("wr01_$v_semi", true)
	vehicle_infinite_mass("wr01_$v_carrier", true)
	thread_kill(caravan_thread)
	
	notoriety_set_max("rollers", 5)
	notoriety_set_min("rollers", 0)
	notoriety_set_min("rollers", 3)
	notoriety_set_max("rollers", 3)
	mission_help_table("wr01_get_home")
	
	--thread_new("truck_gps")
	Wr01_in_exit = false
	on_trigger("wr01_trigger_mission_end", "wr01_$t_mission_end")
	on_trigger_exit("wr01_trigger_mission_end_exit", "wr01_$t_mission_end")
	trigger_enable("wr01_$t_mission_end")
	add_marker_trigger("wr01_end_marker", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	trigger_enable("wr01_end_marker")
	--remove_marker_vehicle("wr01_$v_semi")
	
	mission_waypoint_add("wr01_samson_gps")
	
	while (get_dist_char_to_nav("#PLAYER#", "wr01_$execute lua script000") > 300) do
		thread_yield()
	end
	
	notoriety_set_desired_vehicle_count("Rollerz", 0)
	notoriety_set_desired_vehicle_count("Police", 0)
	
		-- TODO: make sure player isn't being followed and
	-- escorts have been eliminated
	
	while (true) do
		if (Wr01_in_exit and (get_char_in_vehicle("wr01_$v_semi", 0) == "#PLAYER#")) then
			player_controls_disable()
			fade_out(0.5)
			fade_out_block()
			vehicle_stop("wr01_$v_semi")
			vehicle_exit("#PLAYER#")
			
			for index in Wr01_obstacle_ignore_handles do
				vehicle_remove_ignore_obstacle_handle("wr01_$v_semi", index)
			end
	
			Wr01_obstacle_ignore_handles = {}
			
			--group_destroy("wr01_$g_caravan")
			character_remove_vehicle("#PLAYER#")
			teleport("#PLAYER#", "wr01_truck_warp")
			player_controls_enable()
			fade_in(0)
			mission_end_success("wr01")
			break
		end
		thread_yield()
	end
end

function wr01_cleanup()
	release_to_world("wr01_courtesy")
	mission_waypoint_remove()
	notoriety_reset_vehicle_count("Rollerz")
	notoriety_reset_vehicle_count("Police")
	
	on_death("", "wr01_$c_escort_driver_1")
	--on_death("", "wr01_$c_escort_driver_2")
	on_death("", "wr01_$c_escort_passenger_1")
	--on_death("", "wr01_$c_escort_passenger_2")
	
	damage_indicator_off()
	
	for index in Wr01_obstacle_ignore_handles do
		vehicle_remove_ignore_obstacle_handle("wr01_$v_semi", index)
	end
	
	Wr01_obstacle_ignore_handles = {}
	
	vehicle_infinite_mass("wr01_$v_semi", false)
	vehicle_infinite_mass("wr01_$v_carrier", false)

	notoriety_reset("rollers")
	notoriety_reset("police")
	remove_marker_vehicle("wr01_$v_semi")
	remove_marker_trigger("wr01_end_marker")
	on_vehicle_destroyed("", "wr01_$v_semi")
	on_vehicle_destroyed("", "wr01_$v_carrier")
	release_to_world("wr01_$g_caravan")
	on_trigger("", "wr01_$t_mission_end")
	on_trigger_exit("", "wr01_$t_mission_end")
	
	trigger_disable("wr01_end_marker")
	trigger_disable("wr01_$t_mission_end")
end

function wr01_enable_triggers()
	for index, value in Wr01_spawn_triggers do
		trigger_enable(value)
		on_trigger("", value)
	end
end

function wr01_disable_triggers()
	for index, value in Wr01_spawn_triggers do
		trigger_disable(value)
		on_trigger("", value)
	end
end

function wr01_caravan_lead()
	-- get the caravan leader moving - the others will follow
	mission_debug("pf")
	Wr01_threads["wr01_$v_semi_pf"] = thread_new("wr01_truck_pf")
	
	while get_dist_vehicle_to_nav("wr01_$v_semi", "wr01_$n_flee29") > 20 do
		delay(0.1)
	end

	-- if caravan reaches destination, mission has failed
	mission_end_failure("wr01", "wr01_truck_reached_destination")
end

function wr01_truck_pf()
	vehicle_pathfind_to("wr01_$v_semi", "wr01_$n_flee29", false)
end

function wr01_truck_evade()
	local threshold_hp = get_max_hit_points("wr01_$v_semi") * 0.96
	
	while is_dead("wr01_$c_truck_driver") == false and get_char_in_vehicle("wr01_$v_semi", 0) == "wr01_$c_truck_driver" do
		if get_current_hit_points("wr01_$v_semi") < threshold_hp then
			if Wr01_threads["wr01_$v_semi_pf"] ~= nil then
				thread_kill(Wr01_threads["wr01_$v_semi_pf"])
				Wr01_threads["wr01_$v_semi_pf"] = nil
			end
			vehicle_speed_cancel("wr01_$v_semi")	
			vehicle_stop("wr01_$v_semi")
			delay(1)
			vehicle_exit("wr01_$c_truck_driver")
			delay(1)
			break
		end

mission_debug("semi health: "..get_current_hit_points("wr01_$v_semi").." / "..threshold_hp, -1, 4)

		delay(0.2)
	end
	
	damage_indicator_off()
	set_unjackable_flag("wr01_$v_semi", false)
	
	mission_help_table("wr01_get_in_truck")
	
	-- if truck reaches destination, mission has failed
	if (not is_dead("wr01_$c_truck_driver")) then
		flee("wr01_$c_truck_driver")
	end
end

function wr01_spawn_caravan()
	group_create("wr01_$g_caravan", true)
	
	character_hide("wr01_samson")
	
	vehicle_never_flatten_tires("wr01_$v_semi", true)
	vehicle_never_flatten_tires("wr01_$v_carrier", true)
	
	local new_hp = get_max_hit_points("wr01_$v_semi") * 1.5
	set_max_hit_points("wr01_$v_semi", new_hp)
	set_current_hit_points("wr01_$v_semi", new_hp)
	
	new_hp = get_max_hit_points("wr01_$v_carrier") * 10.0
	set_max_hit_points("wr01_$v_carrier", new_hp)
	set_current_hit_points("wr01_$v_carrier", new_hp)

	character_add_vehicle("wr01_$c_escort_driver_1", "wr01_$v_escort_1", 0)
	character_add_vehicle("wr01_$c_escort_passenger_1", "wr01_$v_escort_1", 1)
	
	--character_add_vehicle("wr01_$c_escort_driver_2", "wr01_$v_escort_2", 0)
	--character_add_vehicle("wr01_$c_escort_passenger_2", "wr01_$v_escort_2", 1)

	vehicle_attach_trailer("wr01_$v_semi", "wr01_$v_carrier")
	character_add_vehicle("wr01_$c_truck_driver", "wr01_$v_semi", 0)
	
	vehicle_attach_to_carrier("wr01_$v_racer1", "wr01_$v_carrier", 1)
	vehicle_attach_to_carrier("wr01_$v_racer2", "wr01_$v_carrier", 2)
	vehicle_attach_to_carrier("wr01_$v_racer3", "wr01_$v_carrier", 3)
	
	turn_invulnerable("wr01_$v_racer1", false)
	turn_invulnerable("wr01_$v_racer2", false)
	turn_invulnerable("wr01_$v_racer3", false)
	
	on_take_damage("wr01_caravan_attacked", "wr01_$v_escort_1")
	on_take_damage("wr01_caravan_attacked", "wr01_$v_semi")
	--on_take_damage("wr01_caravan_attacked", "wr01_$v_escort_2")
	
	on_vehicle_destroyed("wr01_carrier_destroyed", "wr01_$v_semi")
	on_vehicle_destroyed("wr01_carrier_destroyed", "wr01_$v_carrier")
	
	vehicle_disable_chase("wr01_$v_semi", true)
	vehicle_disable_flee("wr01_$v_semi", true)
	
	add_marker_vehicle("wr01_$v_semi", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	
	WR01_caravan_loaded = true
end

function wr01_monitor_player()
	local player_in_vehicle = false
	
	while true do
		if is_player_in_vehicle() == true then
			if player_in_vehicle == false then	
				local h = vehicle_get_handle("#PLAYER#")
				if Wr01_obstacle_ignore_handles[h] == nil then
					vehicle_add_ignore_obstacle_handle("wr01_$v_semi", h)
					Wr01_obstacle_ignore_handles[h] = true
					player_in_vehicle = true
mission_debug("vehicle ignored: "..h, -1, 4)
				end
			end
		else
			player_in_vehicle = false
		end
		
		thread_yield( )
	end
end

function wr01_caravan_attacked(name, attacker)
	if attacker == "#PLAYER#" then
		on_take_damage("", "wr01_$v_escort_1")
		on_take_damage("", "wr01_$v_semi")
		--on_take_damage("", "wr01_$v_escort_2")
		
		if Wr01_threads["wr01_$v_caravan_lead"] ~= nil then
			thread_kill(Wr01_threads["wr01_$v_caravan_lead"])
			Wr01_threads["wr01_$v_caravan_lead"] = nil
		end
		
		vehicle_speed_override("wr01_$v_semi", 40)

		vehicle_speed_cancel("wr01_$v_escort_1")
		--vehicle_speed_cancel("wr01_$v_escort_2")

		notoriety_set_min("rollers", 1)
		vehicle_chase(WR01_caravan_vehicles[2], "#PLAYER#", true, true)
		--vehicle_chase(WR01_caravan_vehicles[3], "#PLAYER#", true, true)
		attack("wr01_$c_escort_driver_1")
		--attack("wr01_$c_escort_driver_2")
		attack("wr01_$c_escort_passenger_1")
		--attack("wr01_$c_escort_passenger_2")
		
		Wr01_threads["truck_evade"] = thread_new("wr01_truck_evade")
	end
end

function wr01_trigger_mission_end()
	Wr01_in_exit = true
end

function wr01_trigger_mission_end_exit()
	Wr01_in_exit = false
end

function wr01_carrier_destroyed()
	delay(4)
	mission_end_failure("wr01", "wr01_truck_destroyed")
end