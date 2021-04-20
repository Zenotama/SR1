-- vk06a.lua
-- script for VK Mission 6a
-- created 2/18/05

-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------
VK6a_Props_reached = false
VK6a_accumulated_rampage = 0
VK6a_hud_bar_display_thread = -1
VK6a_lines_played = 0
VK6a_in_hood = false

Vk06a_van_thread = -1
Vk06a_van_following = false
Vk06a_stage = 1
Vk06a_stores_killed = 0
Vk06a_pins_moved = false
Vk06a_statue_moved = false

-- FUNCTIONS ----------------------------

function vk06a_success()
	mission_unlock("vksuburb_sh_grocery")
	hood_set_owner("vk_highend02", "Playas")
	radio_post_event("NEWS_VK_HERD_02", false)
	radio_post_event("CMP_HUGHES_RADIO1_7", false)
end

function vk06a_cleanup()
	trigger_type_enable("crib clothing", true)
	trigger_type_enable("clothing store", true)
	hud_bar_off()
	
	mission_waypoint_remove()
	notoriety_reset("police")
	notoriety_reset( "vice_kings" )
	
	on_death("", "vk06a_gat")
	on_dismiss("", "vk06a_gat")
	
	on_vehicle_destroyed("", "vk06a_bulldozer")
	
	on_death("", "vk06a_store1")
	on_death("", "vk06a_store2")
	
	party_set_recruitable(true)

	set_team( "#PLAYER#", "Playas" )
	
	remove_marker_vehicle("vk06a_bulldozer")
	remove_marker_npc( "vk06a_store1")
	remove_marker_npc( "vk06a_store2")
	remove_marker_trigger( "vk06a_bowling_trigger" )
	remove_marker_trigger( "vk06a_statue_trigger" )
	remove_marker_navpoint("vk06a_pin_marker")
	remove_marker_navpoint("vk06a_statue_marker")
	
	for x=1,4,1 do
		remove_marker_navpoint("vk06a_ramp"..x)
	end
	
	trigger_disable("vk06a_bowling_trigger")
	trigger_disable("vk06a_statue_trigger")
	on_trigger("", "vk06a_bowling_trigger")
	on_trigger("", "vk06a_statue_trigger")
	
	on_mover_dislodged("", "vk06a_pin1", 5.0)
	on_mover_dislodged("", "vk06a_pin2", 5.0)
	on_mover_dislodged("", "vk06a_pin3", 5.0)
	on_mover_dislodged("", "vk06a_pin4", 5.0)
	
	on_mover_dislodged("", "sr_city_statue", 10.0)
	on_mover_destroyed("", "sr_city_statue")
	
	wear_customization_item_revert()

	release_to_world("vk06a_bulldozer")
	release_to_world("vk06a_vans")
	release_to_world("vk06a_stores")
	destroy_group("vk06a_group")
end

function vk06a_store_killed(store_dude)
	remove_marker_npc(store_dude)
	Vk06a_stores_killed = Vk06a_stores_killed + 1
end

function vk06a_bowling_cutscene()
	modal_begin()
	
	camera_look_through("vk06a_camera2", 0.0)
	delay(0.2)
	camera_look_through("vk06a_bowling_camera", 2.0)
	delay(2)

	modal_end()
end

function vk06a_ramp_lights()
	local indicator = 1
	while (not Vk06a_pins_moved) do
		if (indicator == 4) then
			ingame_effect_add_navpoint("vk06a_ramp"..indicator, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
		else
			ingame_effect_add_navpoint("vk06a_ramp"..indicator, INGAME_EFFECT_PROTECT_ACQUIRE)
		end
		delay(0.5)
		remove_marker_navpoint("vk06a_ramp"..indicator)
		indicator = indicator+1
		if (indicator > 4) then
			indicator = 1
		end
	end
end

function vk06a_bowling_moved()
	on_mover_dislodged("", "vk06a_pin1", 5.0)
	on_mover_dislodged("", "vk06a_pin2", 5.0)
	on_mover_dislodged("", "vk06a_pin3", 5.0)
	on_mover_dislodged("", "vk06a_pin4", 5.0)
	remove_marker_navpoint("vk06a_pin_marker")
	Vk06a_pins_moved = true
end

function vk06a_bowling_start()
	Vk06a_stage = 3
	trigger_disable("vk06a_bowling_trigger")
	remove_marker_trigger("vk06a_bowling_trigger")
	add_marker_navpoint("vk06a_pin_marker", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	
	thread_new("vk06a_ramp_lights")
--	player_controls_disable()
--	letterbox_fade_in()	
--	thread_new_block("vk06a_bowling_cutscene")
--	letterbox_fade_out()
--	camera_end_script()
--	player_controls_enable()
	

	on_mover_dislodged("vk06a_bowling_moved", "vk06a_pin1", 5.0)
	on_mover_dislodged("vk06a_bowling_moved", "vk06a_pin2", 5.0)
	on_mover_dislodged("vk06a_bowling_moved", "vk06a_pin3", 5.0)
	on_mover_dislodged("vk06a_bowling_moved", "vk06a_pin4", 5.0)
	
	audio_play_for_character("GAT_VK6A_PINS", "vk06a_gat", "voice", false, true, -1, 3)
	
	mission_help_table("vk06a_destroy_pins")
end

function vk06a_statue_moved()
	on_mover_dislodged("", "sr_city_statue", 10.0)
	on_mover_destroyed("", "sr_city_statue")
	remove_marker_navpoint("vk06a_statue_marker")
	Vk06a_statue_moved = true
end

function vk06a_statue()
	if (get_char_in_vehicle("vk06a_bulldozer", 0) ~= "#PLAYER#") then
		mission_help_table("vk06a_get_bulldozer")
		return
	end
	
	remove_marker_trigger("vk06a_statue_trigger")
	trigger_disable("vk06a_statue_trigger")
	
	add_marker_navpoint("vk06a_statue_marker", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	
	if (not Vk06a_statue_moved) then
		mission_help_table("vk06a_knock_statue")
	end
	
	Vk06a_stage = 6
end

function vk06a_van(x)
	local van = "vk06a_van"..x
	local driver = van.."_driver"
	vehicle_show(van)
	character_show(driver)
	character_add_vehicle(driver,van,0)
	while (not is_dead(driver) and not is_vehicle_destroyed(van)) do
		if (get_dist_char_to_vehicle("#PLAYER#", van) > 150) then
			while not (teleport_vehicle_notoriety_pos(van)) do
				delay(2)
			end
			vehicle_chase(van, "#PLAYER#", false, false, false)
			delay(15)
		end
		delay(5)
	end
end

function vk06a_start()
	mesh_show("sr_city_statue")
	mesh_show("sr_city_globe")
	--set_mission_author("David Cobb")
	--set_mission_author("Russell Aasland")
	notoriety_set_max( "vice_kings", 0 )
	
	set_mission_author("Sandeep Shekar")
	
	on_death("vk06a_gat_dead_failure", "vk06a_gat")
	on_dismiss("vk06a_gat_dismiss_failure", "vk06a_gat")
	on_vehicle_destroyed("vk06a_bulldozer_failure", "vk06a_bulldozer")
	
	on_death("vk06a_store_killed", "vk06a_store1")
	on_death("vk06a_store_killed", "vk06a_store2")
	
	on_mover_dislodged("vk06a_statue_moved", "sr_city_statue", 10.0)
	on_mover_destroyed("vk06a_statue_moved", "sr_city_statue")
	Vk06a_statue_moved = false
	
	VK6a_Props_reached = false
	VK6a_accumulated_rampage = 0
	VK6a_hud_bar_display_thread = -1
	VK6a_lines_played = 0
	VK6a_in_hood = false
	Vk06a_van_thread = -1
	Vk06a_van_following = false
	Vk06a_stage = 1
	Vk06a_stores_killed = 0
	Vk06a_pins_moved = false
	
	-- cutscene
	cutscene_in("vk06a_scene01")	
	cutscene_play("vk06a_scene01", "vk06a_group")
	create_group("vk06a_stores")
	wear_customization_item_do("hoodies", "cCoat_hoody_NOD.cmeshx", "torso_yellow arms_yellow hoodup_yellow hooddown_yellow")
	wear_customization_item_do("t-shirts", "cUndS_tShirt_Cl.cmeshx", "tshirt_yellow")
	
	trigger_type_enable("crib clothing", false)
	trigger_type_enable("clothing store", false)
	
	teleport("#PLAYER#", "mission_start_vk06a")
	--wardrobe_force_wear_option(125, 424, 394)
	
	-- setup the mission
	-- TODO: change their clothes to Vice King shiz
	party_dismiss_all()
	
	set_team( "#PLAYER#", "Vice Lords" )
	character_show("vk06a_gat")
	
	party_add("vk06a_gat")
	
	party_set_recruitable(false)

	hud_bar_on("Media")
	hud_bar_set_range( 0, 100 )
	hud_bar_set_value(0)
	
	-- mission prompt --
	delay(1)
	audio_play_for_character("GAT_VK6A_START_1", "vk06a_gat", "voice", false, true, -1, 3)
	mission_help_table( "vk06a_get_notoriety" )
	
	persona_override_persona_start("SP_GAT", "threat - alert (group attack)", "GAT_VK6A_ATTACK")
	persona_override_persona_start("SP_GAT", "threat - alert (solo attack)", "GAT_VK6A_ATTACK")
	persona_override_persona_start("SP_GAT", "threat - damage received (firearm)", "GAT_VK6A_DAMAGE")
	
	persona_override_persona_start("SP_GAT", "escort - stripper reacts to hitting human", "GAT_VK6A_RUNOVER")
	persona_override_persona_start("SP_GAT", "escort - stripper reacts to hitting vehicle", "GAT_VK6A_HITOBJECT")

	while (notoriety_get("police") < 2) do
		thread_yield()
	end
	
	notoriety_set_min("police", 2)
	
	hud_bar_set_value(10)
	
	thread_new("vk06a_van", 1)
	
	delay(1)
	audio_play_for_character("GAT_VK6A_ATTACK", "vk06a_gat", "voice", false, true, -1, 3)
	delay(2)
	audio_play_for_character("GAT_VK6A_NEWLOC_1", "vk06a_gat", "voice", false, true, -1, 3)
	
	mission_waypoint_add("vk06a_stores_gps")
	
	mission_help_table( "vk06a_run_amuck" )
	if (not is_dead("vk06a_store1")) then
		add_marker_npc( "vk06a_store1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	if (not is_dead("vk06a_store2")) then
		add_marker_npc( "vk06a_store2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	while (Vk06a_stores_killed < 1) do
		thread_yield()
	end
	
	hud_bar_set_value(20)
	radio_post_event("NEWS_VK_HERD_01", true)
	
	notoriety_set_min("police", 2)
	
	while (Vk06a_stores_killed < 2) do
		thread_yield()
	end
	
	thread_new("vk06a_van", 2)
	
	delay(1)
	audio_play_for_character("GAT_VK6A_ATTACK", "vk06a_gat", "voice", false, true, -1, 3)
	hud_bar_set_value(40)
	
	notoriety_set_min("police", 3)
	
	delay(2)
	audio_play_for_character("GAT_VK6A_NEWLOC_2", "vk06a_gat", "voice", false, true, -1, 3)
	
	Vk06a_stage = 2
	mission_help_table("vk06a_head_pins")
	on_trigger("vk06a_bowling_start", "vk06a_bowling_trigger")
	
	mission_waypoint_add("vk06a_bowling_gps")
	add_marker_trigger("vk06a_bowling_trigger", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	trigger_enable("vk06a_bowling_trigger")
	
	while (not Vk06a_pins_moved) do
		thread_yield()
	end
	
	vehicle_show("vk06a_bulldozer")
	vehicle_show("vk06a_backhoe")
	
	thread_new("vk06a_van", 3)
	
	hud_bar_set_value(60)
	
	delay(1)
	audio_play_for_character("GAT_VK6A_ATTACK", "vk06a_gat", "voice", false, true, -1, 3)
	
	delay(2)
	audio_play_for_character("GAT_VK6A_DOZER", "vk06a_gat", "voice", false, true, -1, 3)

	notoriety_set_min("police", 4)
	mission_waypoint_add("vk06a_bulldozer_gps")
	
	Vk06a_stage = 4
	mission_help_table("vk06a_get_bulldozer")
	add_marker_vehicle("vk06a_bulldozer", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	
	while (get_char_in_vehicle("vk06a_bulldozer", 0) ~= "#PLAYER#") do
		thread_yield()
	end
	
	audio_play_for_character("GAT_VK6A_NEWLOC_3", "vk06a_gat", "voice", false, true, -1, 3)
	
	local in_bulldozer = true
	
	mission_waypoint_add("vk06a_statue_gps")
	
	hud_bar_set_value(80)
	
	create_group("vk06a_vans", false)
	
	on_dismiss("", "vk06a_gat")
	npc_revive( "vk06a_gat" ) 

	turn_invulnerable("vk06a_gat", false)
	party_dismiss("vk06a_gat")
	thread_new("vk06a_gat_thread")
	
	Vk06a_stage = 5
	mission_help_table("vk06a_head_statue")
	on_trigger("vk06a_statue", "vk06a_statue_trigger")
	
	trigger_enable("vk06a_statue_trigger")
	add_marker_trigger("vk06a_statue_trigger", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	
	while ((not Vk06a_statue_moved)) do
		if (in_bulldozer) and (get_char_in_vehicle("vk06a_bulldozer", 0) ~= "#PLAYER#") then
			in_bulldozer = false
			mission_help_table_nag("vk06a_get_bulldozer")
		elseif (not in_bulldozer) and (get_char_in_vehicle("vk06a_bulldozer", 0) == "#PLAYER#") then
			in_bulldozer = true
			if (Vk06a_stage == 5) then
				mission_help_table_nag("vk06a_head_statue")
			else
				mission_help_table_nag("vk06a_knock_statue")
			end
		end
		thread_yield()
	end
	
	hud_bar_set_value(100)
	
	delay(7)
	cutscene_in("vk06a_scene02")
	cutscene_play("vk06a_scene02", true)
	mesh_hide("sr_city_statue")
	mesh_hide("sr_city_globe")
	mission_end_success("vk06a")
end

function vk06a_gat_thread()
	vehicle_enter("vk06a_gat", "vk06a_backhoe", 0)
	vehicle_supress_npc_exit( "vk06a_backhoe", true )
	vehicle_disable_flee("vk06a_backhoe", true)
	vehicle_disable_chase("vk06a_backhoe", true)
	set_unjackable_flag("vk06a_backhoe", true)
	vehicle_chase("vk06a_backhoe", "#PLAYER#", false, false, false)
end

function vk06a_failure()
	mission_end_failure("vk06a")
end

function vk06a_gat_dead_failure()
	mission_end_failure("vk06a", "vk06a_gat_dead")
end

function vk06a_gat_dismiss_failure()
	mission_end_failure("vk06a", "vk06a_gat_dismiss")
end

function vk06a_bulldozer_failure()
	mission_end_failure("vk06a", "vk06a_bulldozer_dead")
end