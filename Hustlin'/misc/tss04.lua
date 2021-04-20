
-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------
Tss04_cops_dead = 0
Tss04_thread_handle = 0
Tss04_fight_started = 0

-- FUNCTIONS ----------------------------

function tss04_cleanup()
	mission_waypoint_remove()
	notoriety_reset_vehicle_count("police")
	--remove_marker_navpoint("tss04_fnf_gps")
	party_dismiss("tss04_dex")
	
	group_destroy("tss04_gat")
	group_destroy("tss04_dex")
	
	notoriety_reset("police")
	ammo_infinite(false)
	
	objective_text_clear()
	
	-- unregister functions
	on_trigger("", "tss04_start_convoy")
	
	for x=1,6,1 do
		on_take_damage("", "tss04_escort"..x)
		on_vehicle_destroyed("", "tss04_escort"..x)
		remove_marker_vehicle("tss04_escort"..x)
	end
	
	release_to_world("tss04_convoy")
	
	on_death("", "tss04_dex")
	on_dismiss("", "tss04_dex")
	--on_random_vehicle_killed("", "tss04")
	
	-- minimap icons
	remove_marker_trigger("tss04_start_convoy")
end

function tss04_success()
	--unlockable_unlock("tss04_1")
	radio_post_event("NEWS_WINSLOW_FUNERAL", true)
end

function tss04_fail()
	mission_end_failure("tss04")
end

function tss04_start_fight()
	--if (not (Tss04_thread_handle == 0)) then
	--	thread_kill(Tss04_thread_handle)
	--	Tss04_thread_handle = 0
	--end
	if (Tss04_fight_started == 0) then
		Tss04_fight_started = 1
		
		objective_text("tss04_objective", 6-Tss04_cops_dead, 6)
		
		
		set_ignore_ai_flag("tss04_gat", false)
		notoriety_set("police", 5)
		notoriety_set_desired_vehicle_count("police", 0)
		
		
		-- flee("tss04_hearsedriver", "tss04_gat")
		minimap_icon_remove_vehicle("tss04_hearse")
		
		for x=1,6,1 do
			add_marker_vehicle("tss04_escort"..x, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
			vehicle_stop("tss04_escort"..x)
		end
		
		
		
		attack("tss04_escort1-1", "tss04_gat")
		attack("tss04_escort2-1", "#PLAYER#")
		attack("tss04_escort3-1", "tss04_gat")
		attack("tss04_escort4-1", "#PLAYER#")
		attack("tss04_escort5-1", "tss04_gat")
		attack("tss04_escort6-1", "#PLAYER#")
			
		vehicle_set_sirens("tss04_escort1", true)
		vehicle_set_sirens("tss04_escort2", true)
		vehicle_set_sirens("tss04_escort3", true)
		vehicle_set_sirens("tss04_escort4", true)
		vehicle_set_sirens("tss04_escort5", true)
		vehicle_set_sirens("tss04_escort6", true)
		delay(0.3)
		audio_play_for_character("GAT_TSS4_CHEER", "tss04_dex", "voice", false, true, -1, 2) 
		delay(0.5)
		audio_play_for_character("DEX_TSS4_GATSTARTS", "tss04_dex", "voice", false, true, -1, 2) 
		mission_help_table("tss04_kill_all_cars")
	end	
end

function tss04_convoy()
	create_group("tss04_convoy", true)
	
	for x=1,6,1 do
		on_vehicle_destroyed("tss04_vehicle_killed", "tss04_escort"..x)
		set_unjackable_flag("tss04_escort"..x, true)
		vehicle_set_sirenlights("tss04_escort"..x, true)
	end
		
	minimap_icon_add_vehicle("tss04_hearse", MINIMAP_ICON_KILL)
	character_add_vehicle("tss04_escort1-1", "tss04_escort1", 0)
	character_add_vehicle("tss04_escort1-2", "tss04_escort1", 1)
	vehicle_speed_override("tss04_escort1", 15)
	
	character_add_vehicle("tss04_hearsedriver", "tss04_hearse", 0)
	vehicle_chase("tss04_hearse", "tss04_escort1-1", false, false, false)
	
	character_add_vehicle("tss04_escort2-1", "tss04_escort2", 0)
	character_add_vehicle("tss04_escort2-2", "tss04_escort2", 1)
	vehicle_chase("tss04_escort2", "tss04_hearsedriver", false, false, false, true)
	
	character_add_vehicle("tss04_escort3-1", "tss04_escort3", 0)
	character_add_vehicle("tss04_escort3-2", "tss04_escort3", 1)
	vehicle_chase("tss04_escort3", "tss04_escort2-1", false, false, false, true)
	
	character_add_vehicle("tss04_escort4-1", "tss04_escort4", 0)
	character_add_vehicle("tss04_escort4-2", "tss04_escort4", 1)
	vehicle_chase("tss04_escort4", "tss04_escort3-1", false, false, false, true)
	
	character_add_vehicle("tss04_escort5-1", "tss04_escort5", 0)
	character_add_vehicle("tss04_escort5-2", "tss04_escort5", 1)
	vehicle_chase("tss04_escort5", "tss04_escort4-1", false, false, false, true)
	
	character_add_vehicle("tss04_escort6-1", "tss04_escort6", 0)
	character_add_vehicle("tss04_escort6-2", "tss04_escort6", 1)
	vehicle_chase("tss04_escort6", "tss04_escort5-1", false, false, false, true)
	
	vehicle_pathfind_to("tss04_escort1", "tss04_$n_001", "tss04_$n_003", "tss04_$n_004", false)
end

function tss04_explain_thread()
	npc_revive("tss04_dex")
	audio_play_for_character("DEX_3SS4_SNIPER_1", "tss04_dex", "voice", false, false, -1, 2) 
	delay(1)
	--inv_item_add("rpg_launcher", 1) 
	inv_item_add("sniper_rifle", 1) 
	inv_item_equip("sniper_rifle")
	--ammo_infinite(true)
	--on_random_vehicle_killed("tss04_cop_dead", "tss04")
	thread_new("tss04_convoy")

	while (get_dist_char_to_nav("tss04_escort1-1", "tss04_$execute lua script000") > 90) do
		debug_message(get_dist_char_to_char("tss04_escort1-1", "#PLAYER#"))
		delay(1)
	end
	voice_block("tss04_dex")
	npc_revive("tss04_dex")
	audio_play_for_character("DEX_3SS4_SNIPER_2", "tss04_dex", "voice", false, true, -1, 2) 
	
	while (get_dist_char_to_char("tss04_gat", "tss04_escort1-1") > 75) do
		delay(0.5)
	end
	debug_message("gat fire")
	set_ignore_ai_flag("tss04_gat", false)
	delay(0.01)
	attack("tss04_gat", "tss04_escort1-1")
	Tss04_thread_handle = 0
end

function tss04_start_sequence()
	
	mission_waypoint_remove()
	trigger_disable("tss04_start_convoy")
	remove_marker_trigger("tss04_start_convoy")
	ingame_effect_remove_navpoint("tss04_$execute lua script000")
	
	--create_group("tss04_gat", true)
	
		
	on_take_damage("tss04_start_fight", "tss04_escort1")
	on_take_damage("tss04_start_fight", "tss04_escort2")
	on_take_damage("tss04_start_fight", "tss04_escort3")
	on_take_damage("tss04_start_fight", "tss04_escort4")
	on_take_damage("tss04_start_fight", "tss04_escort5")
	on_take_damage("tss04_start_fight", "tss04_escort6")
	on_take_damage("tss04_start_fight", "tss04_hearse")
	
	npc_revive("tss04_dex")
	audio_play_for_character("DEX_3SS4_ARRIVE_1", "tss04_dex", "voice", false, true, -1, 2) 
	--mission_help_table("tss04_wait_for_convoy")
	
	Tss04_thread_handle = thread_new("tss04_explain_thread")
end

function tss04_vehicle_killed(vehicle, killer)
	Tss04_cops_dead = Tss04_cops_dead + 1
	objective_text("tss04_objective", 6-Tss04_cops_dead, 6)
	remove_marker_vehicle(vehicle)
	
	if (Tss04_cops_dead >= 6) then
		npc_revive("tss04_dex")
		notoriety_reset_vehicle_count("police")
		audio_play_for_character("DEX_TSS4_4GIVEN4GET", "tss04_dex", "voice", false, true, -1, 2) 
		objective_text_clear()
		mission_help_table("tss04_get_to_fnf")
		mission_waypoint_add("tss04_fnf_gps")
		--add_marker_trigger("tss04_fnf_gps", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
		
		while (notoriety_get("police") >= 1) do
			thread_yield()
		end
		
		remove_marker_navpoint("tss04_fnf_gps")
		delay(3)
		audio_play_for_character("DEX_3SS4_MISSIONEND_1", "tss04_dex", "voice", false, true) 
		mission_end_success("tss04")
	end
end


function tss04_dex_dead()
	mission_end_failure("tss04", "tss04_dex_dead")
end

function tss04_dex_abandon()
	mission_end_failure("tss04", "tss04_dex_abandoned")
end

function tss04_create_gat()
	create_group("tss04_gat", true)
	set_perfect_aim("tss04_gat", true)
	set_ignore_ai_flag("tss04_gat", true)
end

function tss04_start()
	set_mission_author("Sandeep Shekar")	
	cutscene_in("tss04_scene01")
	party_dismiss("#FOLLOWER3#")
	cutscene_play( "tss04_scene01", "tss04_dex" )
	teleport("#PLAYER#", "mission_start_tss03")
	character_show("tss04_dex")
	party_add("tss04_dex")
	on_death("tss04_dex_dead", "tss04_dex")
	on_dismiss("tss04_dex_abandon", "tss04_dex")
	
	-- minimap icons
	mission_waypoint_add("tss04_gps")
	add_marker_trigger("tss04_start_convoy", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	
	-- register functions
	trigger_enable("tss04_start_convoy")
	on_trigger("tss04_start_sequence", "tss04_start_convoy")
	cutscene_out()
	
	-- init globals
	Tss04_cops_dead = 0
	Tss04_thread_handle = 0
	Tss04_fight_started = 0
	
	thread_new("tss04_create_gat")
	
	delay(3)
	audio_play_for_character("DEX_3SS4_MISSIONSTART_1", "tss04_dex", "voice", false, true) 
	
	mission_help_table("tss04_goto_roof")
	
	while (not is_player_in_vehicle()) do
		delay(2)
	end
	delay(4)
	audio_play_for_character("DEX_3SS4_CAR_1", "tss04_dex", "voice", false, true) 
end

function tss04_warp()
	teleport("#PLAYER#", "tss04_$navf000")
end
