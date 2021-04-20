
-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------

Tss01a_troy_arrived = true

-- FUNCTIONS ----------------------------

function tss01a_cleanup()
	-- unregister functions
	mission_waypoint_remove()
	
	notoriety_reset_vehicle_count( "Vice Lords" )

	shop_set_open_at_night("Saint's Row Gun", false)

	tutorial_unlock("notoriety_gang") -- allow gang tut to play again.

	on_purchase("")
	on_trigger("", "tss01a_leave_clothing")
	trigger_disable("tss01a_leave_clothing")
	on_trigger("", "tss01a_leave_gun")
	trigger_disable("tss01a_leave_gun")
	on_trigger("", "tss01a_gun_store")
	trigger_disable("tss01a_gun_store")
	on_trigger("", "tss01a_leave_gun2")
	trigger_disable("tss01a_leave_gun2")
	on_trigger("", "tss01a_clothing_store")
	trigger_disable("tss01a_clothing_store")
	
	ambient_gang_spawn_enable()
	ambient_cop_spawn_enable()
	
	on_dismiss("", "tss01a_troy")
	on_death("", "tss01a_troy")
	on_death("", "tss01a_vk1")
	on_death("", "tss01a_vk2")
	on_death("", "tss01a_vk3")
	on_death("", "tss01a_vk4")
	on_death("", "tss01a_vk5")
	on_death("", "tss01a_vk6")
	on_trigger("", "tss01a_freckle_bitches")
	trigger_disable("tss01a_freckle_bitches")
	
	notoriety_reset("vice_kings")
		
	remove_marker_navpoint("tss01a_leave_gun")
	remove_marker_navpoint("tss01a_leave_clothing")
	remove_marker_npc("tss01a_vk1")
	remove_marker_npc("tss01a_vk2")
	remove_marker_npc("tss01a_vk3")
	remove_marker_npc("tss01a_vk4")
	remove_marker_npc("tss01a_vk5")
	remove_marker_npc("tss01a_vk6")
	
	remove_marker_trigger("saintsrow_$sr_faf_000")
	remove_marker_trigger("tss01a_freckle_bitches")
	remove_marker_vehicle("tss01a_vk_car")
		
	party_dismiss("tss01a_troy")
	release_to_world("tss01a_troycar")
	destroy_group("tss01a_troy")
	release_to_world("tss01a_vks")
	
	on_death("", "shops_sr_city_$sr_lowcloth_clerk")
	on_death("", "shops_sr_city_sr_gun_clerk")
	
	confessionals_allow_free_one(false)
end

function tss01a_success()
	--mission_set_next_props_req( "saints", 300 )
	shop_set_open_at_night("Saint's Row Low Clothing", false)
	unlockable_unlock("tss01a")
	if (not is_demo_execution()) then
		trigger_enable("saintsrow_$crib_save000")
	end
	--tutorial_start("save", 1000, true)
	theft_unlock()
	mission_unlock("saintsrow_stronghold")
end

function tss01a_abandon()
	mission_end_failure("tss01a", "tss02_abandon_troy")
end

function tss01a_dead()
	mission_end_failure("tss01a", "lc07_fail_troy")
end

function tss01a_fail_clerk()
	mission_end_failure("tss01a", "tss01a_clerk_died")
end

function tss01a_start()
	--confessionals_enable(false)
	mission_force_notoriety("vk")
	notoriety_set_max("vice_kings", 1)
	ambient_gang_spawn_disable()
	ambient_cop_spawn_disable()
	mission_waypoint_remove()
	on_death("tss01a_vkdead", "tss01a_vk1")
	on_death("tss01a_vkdead", "tss01a_vk2")
	on_death("tss01a_vkdead", "tss01a_vk5")
	on_death("tss01a_vkdead", "tss01a_vk6")
	on_death("tss01a_vkdead", "tss01a_vk3")
	on_death("tss01a_vkdead", "tss01a_vk4")
	
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "mission_start_tss01a")
		fade_in( 0.5 )
	end

	shop_set_open_at_night("Saint's Row Gun", true) -- let the player shop at the gun store during this mission

	tutorial_lock("notoriety_gang") -- lock the gang tut so it doesn't play during this mission.

	set_mission_author("Sandeep Shekar")
	--audio_play("JULIUS_BUYCLOTH_1", "voice", false, true)
	
	create_group("tss01a_troy", true)
	vehicle_hide("tss01a_troycar")
	party_dismiss("#FOLLOWER3#")
	party_add("tss01a_troy")
	on_dismiss("tss01a_abandon", "tss01a_troy")
	on_death("tss01a_dead", "tss01a_troy")
	
	local group_created = false
	--move_to("tss01a_troy", "tss01a_troy_walk", 2)
	delay(2.5)
	if (is_compressed_prologue()) then
		inv_item_add("beretta", 100)
		audio_play_for_character("TROY_TESTGUN_1", "tss01a_troy", "voice", false, false, -1, 2)
		
		create_group("tss01a_vks", true)
		add_marker_npc("tss01a_vk1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk5", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk6", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		mission_help_table("tss01a_kill_vks")
		mission_waypoint_add("tss01a_vk1_gps")
		
	else
		if (inv_have_item("beretta") or inv_have_item("glock") or inv_have_item("desert eagle") or inv_have_item("magnum") or inv_have_item("tec9") or inv_have_item("mac10")
			or inv_have_item("m16") or inv_have_item("ak47") or inv_have_item("rpg_launcher") or inv_have_item("pump_action_shotgun")
			 or inv_have_item("spas12") or inv_have_item("sniper_rifle") or inv_have_item("twelve_gauge")) then
			mission_help_table_nag("tss01_help_sprint")
			create_group("tss01a_vks", true)
			group_created = true
			--audio_play_for_character("TROY_DRIVING_1", "tss01a_troy", "voice", false, true, -1, 2)
			delay(1)
		else
			audio_play_for_character("TROY_BUYGUN_1", "tss01a_troy", "voice", false, true, -1, 3)
			mission_waypoint_add("tss01a_gun_gps")
	
			persona_override_persona_start("SP_TROY", "escort - stripper reacts to hitting human", "TROY_HITPEDTUTORIAL", 3)
			persona_override_persona_start("SP_TROY", "escort - stripper reacts to hitting vehicle", "TROY_HITOBJTUTORIAL", 3)

			add_marker_navpoint("tss01a_leave_gun", MINIMAP_ICON_LOCATION, "")
			mission_help_table("tss01a_buy_gun")
			trigger_enable("tss01a_gun_store")
			on_trigger("tss01a_gun_store", "tss01a_gun_store")
			shop_unlock("Saint's Row Gun")
	
			on_death("tss01a_fail_clerk", "shops_sr_city_sr_gun_clerk")
			delay(7.5)
			mission_help_table_nag("tss01_help_sprint")
		end
		
		while not (inv_have_item("beretta") or inv_have_item("glock") or inv_have_item("desert eagle") or inv_have_item("magnum") or inv_have_item("tec9") or inv_have_item("mac10")
			or inv_have_item("m16") or inv_have_item("ak47") or inv_have_item("rpg_launcher") or inv_have_item("pump_action_shotgun")
			 or inv_have_item("spas12") or inv_have_item("sniper_rifle") or inv_have_item("twelve_gauge")) do
			thread_yield()
		end
		
		trigger_disable("tss01a_gun_store")
		remove_marker_navpoint("tss01a_leave_gun")
		on_death("", "shops_sr_city_sr_gun_clerk")
		mission_waypoint_remove()

		while (is_store_interface_open()) do
			thread_yield()
		end
		
		if not group_created then
			create_group("tss01a_vks", true)
			delay(1)
		end
		voice_block("tss01a_troy")
		audio_play_for_character("TROY_TESTGUN_1", "tss01a_troy", "voice", false, true, -1, 2)
		add_marker_npc("tss01a_vk1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk5", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01a_vk6", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		mission_help_table("tss01a_kill_vks")
		mission_waypoint_add("tss01a_vk1_gps")
		delay(7)
		mission_help_table_nag("tss01_help_weapons") 
	end
end

function tss01a_gun_store()
	trigger_disable("tss01a_gun_store")
	--mission_help_table("tss01a_buy_gun")
	--on_purchase("tss01a_buy_gun")
	--delay(5)
	--audio_play_for_character("TROY_DRIVING_1", "tss01a_troy", "voice", false, false, -1, 2)
end

function tss01a_notoriety_cap()
	while (notoriety_spawn_count("All", "All") < 1) do
		delay(1)
	end
	
	while (notoriety_spawn_count("All", "All") > 0) do
		delay(1)
	end
		
	notoriety_set_desired_vehicle_count( "Vice Lords", 0 )
end

function tss01a_drive_thread()
	if (not is_player_in_vehicle()) then
		mission_help_table("tss01a_get_car")
		add_marker_vehicle("tss01a_vk_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	end
	
	while (not is_player_in_vehicle()) do
		thread_yield()
	end
	
	display_vehicle_help_message()
	remove_marker_vehicle("tss01a_vk_car")
	
	delay(7)
	
	--confessionals_enable(true)
	mission_waypoint_add("tss01a_fnf_gps")
	add_marker_trigger("saintsrow_$sr_faf_000", MINIMAP_ICON_LOCATION, "")
	mission_help_table("tss01a_go_to_ff")
end

function tss01a_vkdead(dead_person)
	remove_marker_npc(dead_person)
	on_death("", dead_person)
	notoriety_set_min("vice_kings", 1)
	
	if (is_dead("tss01a_vk1") and is_dead("tss01a_vk2") and is_dead("tss01a_vk3") and 
			is_dead("tss01a_vk4") and is_dead("tss01a_vk5") and is_dead("tss01a_vk6")) then
		notoriety_set_max("vice_kings", 2)
		notoriety_set_min("vice_kings", 2)
		tutorial_start("notoriety_gang", 1000, true);
		delay(1.1)
		
		mission_waypoint_remove()
		
		audio_play_for_character("TROY_FORGIVE_1", "tss01a_troy", "voice", false, true, -1, 2)
		confessionals_allow_free_one(true)
		thread_new("tss01a_notoriety_cap")
		
		local drive_thread = thread_new("tss01a_drive_thread")
		--tutorial_unlock("hud_notoriety")
		--tutorial_start_delayed("hud_notoriety", 5000)
		while (notoriety_get("vice_kings") > 0) do
			thread_yield()
		end
		
		confessionals_allow_free_one(false)
		thread_kill(drive_thread)
		
		remove_marker_vehicle("tss01a_vk_car")
		remove_marker_trigger("saintsrow_$sr_faf_000")
		mission_waypoint_remove()
		delay(6)
		audio_play_for_character("TROY_FRECKLEBITCH_1", "tss01a_troy", "voice", false, true, -1, 2)
		mission_help_table("tss01a_drop_off")
		mission_waypoint_add("tss01a_fb_gps")
		add_marker_trigger("tss01a_freckle_bitches", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
		trigger_enable("tss01a_freckle_bitches")
		on_trigger("tss01a_end", "tss01a_freckle_bitches")
	else
		local nextgroup = 1
		if (is_dead("tss01a_vk1") and is_dead("tss01a_vk2")) then
			nextgroup = 2
			if (is_dead("tss01a_vk3") and is_dead("tss01a_vk4")) then
				nextgroup = 3
			end
		end
		
		if ((dead_person == "tss01a_vk1") or (dead_person == "tss01a_vk2")) and (nextgroup ~= 1) then
			mission_waypoint_remove()
			mission_waypoint_add("tss01a_vk"..nextgroup.."_gps")					
		end
		
		if ((dead_person == "tss01a_vk3") or (dead_person == "tss01a_vk4")) and (nextgroup ~= 2) then
			mission_waypoint_remove()
			mission_waypoint_add("tss01a_vk"..nextgroup.."_gps")					
		end
		
		if ((dead_person == "tss01a_vk5") or (dead_person == "tss01a_vk6")) and (nextgroup ~= 3) then
			mission_waypoint_remove()
			mission_waypoint_add("tss01a_vk"..nextgroup.."_gps")					
		end
	end
end

function tss01a_end()
	while (get_dist_char_to_nav("tss01a_troy", "tss01a_freckle_bitches") > 8) do
		thread_yield()
	end

	on_trigger("", "tss01a_freckle_bitches")
	trigger_disable("tss01a_freckle_bitches")
	
	remove_marker_trigger("tss01a_freckle_bitches")
	if (is_player_in_vehicle()) then 
		vehicle_stop("#PLAYER#")
	end
	player_controls_disable()
	party_dismiss("tss01a_troy")
	--pause_menu_objective_force_show()
	--audio_play_for_character("TROY_ACTIVITIES_1", "tss01a_troy", "voice", false, true, -1, 3)
	vehicle_exit("tss01a_troy")
	delay(1)
	player_controls_enable()
	mission_end_success("tss01a")
end