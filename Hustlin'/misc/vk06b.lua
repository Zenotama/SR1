-- vk06b.lua
-- script for VK Mission 6b
-- created 2/18/05

-- CONSTANTS ---------------------

VK6b_cop_cars_destroyed_target = 3

VK6b_player_group = "vk06b_$G_joyride"
VK6b_chauffer = "vk06b_driver"
VK6b_chariot = "vk06b_$v_chariot"

VK6b_A_group = "vk06b_$G_A"
VK6b_A_cops = { "vk06b_$c_A_cop1", "vk06b_$c_A_cop2" }
VK6b_A_gangstas = { "vk06b_$c_A_vk1", "vk06b_$c_A_vk2" }
VK6b_A_cop_cars = {"vk06b_$v_A_cop1"}
VK6b_A_gang_cars = {"vk06b_$v_A_vk1"}

VK6b_B_group = "vk06b_$G_B"
VK6b_B_cops = { "vk06b_$c_B_cop1", "vk06b_$c_B_cop2" }
VK6b_B_gangstas = { "vk06b_$c_B_vk1", "vk06b_$c_B_vk2" }
VK6b_B_cop_cars = {"vk06b_$v_B_cop1"}
VK6b_B_gang_cars = {"vk06b_$v_B_vk1"}

VK6b_C_group = "vk06b_$G_C"
VK6b_C_cops = { "vk06b_$c_C_cop1", "vk06b_$c_C_cop2" }
VK6b_C_gangstas = { "vk06b_$c_C_vk1", "vk06b_$c_C_vk2" }
VK6b_C_cop_cars = {"vk06b_$v_C_cop1"}
VK6b_C_gang_cars = {"vk06b_$v_C_vk1"}

VK6b_D_group = "vk06b_$G_D"
VK6b_D_cops = { "vk06b_$c_D_cop1", "vk06b_$c_D_cop2" }
VK6b_D_gangstas = { "vk06b_$c_D_vk1", "vk06b_$c_D_vk2" , "vk06b_$c_D_vk3" }
VK6b_D_cop_cars = {"vk06b_$v_D_cop1"}
VK6b_D_gang_cars = {"vk06b_$v_D_vk1"}

VK6b_E_group = "vk06b_$G_E"
VK6b_E_cops = { "vk06b_$c_E_cop1", "vk06b_$c_E_cop2" }
VK6b_E_gangstas = { "vk06b_$c_E_vk1", "vk06b_$c_E_vk2" }
VK6b_E_cop_cars = {"vk06b_$v_E_cop1"}
VK6b_E_gang_cars = {"vk06b_$v_E_vk1"}


VK6b_CREATE_FUNCTION = 1
VK6b_CREATE_TRIGGER = 2
VK6b_ENCOUNTER = 3
VK6b_triggers = { {"vk06b_encounter_a_create()", "vk06b_$t_A", "A"},
						{"vk06b_encounter_b_create()", "vk06b_$t_B", "B"},
						{"vk06b_encounter_c_create()", "vk06b_$t_C", "C"},
						{"vk06b_encounter_d_create()", "vk06b_$t_D", "D"},
						{"vk06b_encounter_e_create()", "vk06b_$t_E", "E"} }

-- these are my different paths
VK6b_path_start = {	{"vk06b_$n_start_to_spline000", "vk06b_$n_start_to_spline001"},
							{"vk06b_$n_start_finish"} }
VK6b_path_A = {	{"vk06b_$n_A_charge_in000", "vk06b_$n_A_charge_in001", "vk06b_$n_A_charge_in002"},
						{"vk06b_$n_A_charge_in003"},
						{"vk06b_$n_A_blow_to_spline"} }
VK6b_path_B = {	{"vk06b_$n_b_spline_to_station"},
						{"vk06b_$n_b_drive_by"},
						{"vk06b_$n_b_drive_by2", "vk06b_$n_b_drive_by3", "vk06b_$n_b_spliny_escape"} }
VK6b_path_C = {	{"vk06b_$n_c_spline_to_courtyard"},
						{"vk06b_$n_c_bust_em_up000", "vk06b_$n_c_bust_em_up001" },
						{"vk06b_$n_c_bust_em_up002", "vk06b_$n_c_bust_em_up003", "vk06b_$n_c_bust_em_up004" } }
VK6b_path_D = {	{"vk06b_$n_d_to_spline000", "vk06b_$n_d_to_spline001", "vk06b_$n_d_to_spline002", "vk06b_$n_d_to_spline003", "vk06b_$n_d_to_spline004", "vk06b_$n_d_to_spline005", "vk06b_$n_d_to_spline006", "vk06b_$n_d_to_spline007" },
						{"vk06b_$n_d_spline_to_park"},
						{"vk06b_$n_d_tear_through_park000", "vk06b_$n_d_tear_through_park001", "vk06b_$n_d_tear_through_park002", "vk06b_$n_d_tear_through_park003", "vk06b_$n_d_tear_through_park004", "vk06b_$n_d_tear_through_park005" } }
VK6b_path_E = {	{"vk06b_$n_e_over_the_bump000", "vk06b_$n_e_over_the_bump001" },
						{"vk06b_$n_e_to_spline000", "vk06b_$n_e_to_spline001" },
						{"vk06b_$n_e_get_the_fuck_out"},
						{"vk06b_$n_e_fnf1", "vk06b_$n_e_fnf2" } }
VK6b_path_finale = {	{"vk06b_$n_f_line_me_up000", "vk06b_$n_f_line_me_up001", "vk06b_$n_f_line_me_up002" } }



-- GLOBAL VARIABLES ---------------------
VK6b_has_enough_props = false
VK6b_had_rockets = false
VK6b_had_ak = false
VK6b_current_encounter = "NONE"
VK6b_weapon_table = {}
VK6b_ammo_table = {}

function vk06b_reset_globals()
	VK6b_had_rockets = false
	VK6b_had_ak = false
	VK6b_current_encounter = "NONE"
end


-- FUNCTIONS ----------------------------

function vk06b_cleanup()
	--vehicle_set_explosion_damage_multiplier(VK6b_chariot, 1.0)
	
	damage_indicator_off()
	notoriety_reset( "vice_kings" )
	notoriety_reset( "police" )
	
	set_cops_shooting_from_vehicles(false)
	
	vk06b_reset_globals()
	set_traffic_density(1)

	turret_stop()
	release_to_world(VK6b_chariot)
	destroy_group(VK6b_player_group)
	release_to_world(VK6b_A_group)
	release_to_world(VK6b_B_group)
	release_to_world(VK6b_C_group)
	release_to_world(VK6b_D_group)
	release_to_world(VK6b_E_group)
	release_to_world("vk06b_random1")
	release_to_world("vk06b_roadblock")
	release_to_world("vk06b_ambush1")
	
	inv_item_remove_all("#PLAYER#")
	inv_item_add(VK6b_weapon_table, VK6b_ammo_table, "#PLAYER#")
	
	ammo_infinite(false)

	vk06b_on_encounter_interruption("", VK6b_A_gang_cars, VK6b_A_cop_cars, VK6b_A_gangstas, VK6b_A_cops)
	vk06b_on_encounter_interruption("", VK6b_B_gang_cars, VK6b_B_cop_cars, VK6b_B_gangstas, VK6b_B_cops)
	vk06b_on_encounter_interruption("", VK6b_C_gang_cars, VK6b_C_cop_cars, VK6b_C_gangstas, VK6b_C_cops)
	vk06b_on_encounter_interruption("", VK6b_D_gang_cars, VK6b_D_cop_cars, VK6b_D_gangstas, VK6b_D_cops)
	vk06b_on_encounter_interruption("", VK6b_E_gang_cars, VK6b_E_cop_cars, VK6b_E_gangstas, VK6b_E_cops)
	
	-- clear automatic failure conditions
	on_vehicle_destroyed("", VK6b_chariot)
	on_death("", VK6b_chauffer)
	
	minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_a")
	minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_b")
	minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_c")
	minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_d")
	minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_e")
	minimap_icon_remove_navpoint("vk06b_$n_e_get_the_fuck_out")
	
	for i,char in pairs(VK6b_A_gangstas) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_B_gangstas) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_C_gangstas) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_D_gangstas) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_E_gangstas) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_A_cops) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_B_cops) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_C_cops) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_D_cops) do
		remove_marker_npc(char)
	end
	
	for i,char in pairs(VK6b_E_cops) do
		remove_marker_npc(char)
	end
	
end

function vk06b_success()
	hood_set_owner("vk_museum01","Playas")
	radio_post_event("NEWS_VK_2NDKCEXPLO", false)
end

function vk06b_start()
	--set_mission_author("David Cobb")
	--set_mission_author("Russell Aasland")
	set_mission_author("David Cobb")

	-- init globals 
	VK6b_weapon_table, VK6b_ammo_table = inv_item_get_all("#PLAYER#")
	vk06b_reset_globals()

	-- cutscene
	cutscene_in("vk06b_scene01")	
	party_dismiss_all()
	cutscene_play("vk06b_scene01", VK6b_player_group)
	
	vehicle_show(VK6b_chariot)
	character_show(VK6b_chauffer)
	character_add_vehicle("#PLAYER#", VK6b_chariot, 1)
	vehicle_infinite_mass(VK6b_chariot, true)
--	vehicle_ignore_repulsors(VK6b_chariot, true)
	
	-- mission prompt --

	-- mission setup
	ammo_infinite(true)
	if inv_have_item("ak47") or inv_have_item("m16") then
		mission_debug("Has ak Already", 3.0)
		VK6b_had_ak = true
	else	
		mission_debug("Doesn't Have ak Already", 3.0)
		inv_item_add("ak47")
	end

	if inv_have_item("rpg_launcher") then
		mission_debug("Has Rockets Already", 3.0)
		VK6b_had_rockets = true
	else	
		mission_debug("Doesn't Have Rockets Already", 3.0)
		inv_item_add("rpg_launcher")
	end

	-- setup automatic failure conditions
	on_vehicle_destroyed("vk06b_car_destroyed", VK6b_chariot)
	on_death("vk06b_gat_death", VK6b_chauffer)
	turn_invulnerable(VK6b_chauffer)
	-- start main flow thread
	if (inv_have_item("ak47")) then
		unholster("ak47")
	elseif (inv_have_item("m16")) then
		unholster("m16")
	end
	--
	
	set_traffic_density(0.25)
	character_add_vehicle(VK6b_chauffer, VK6b_chariot, 0)
	vehicle_disable_chase(VK6b_chariot, true)
	vehicle_disable_flee(VK6b_chariot, true)
	vehicle_set_explosion_damage_multiplier(VK6b_chariot, 0.6)
	turret_start()
	--vehicle_enter(VK6b_chauffer, VK6b_chariot, 0)
	--player_vehicle_enter(VK6b_chariot, true)
	cutscene_out()
	thread_new("vk06b_flow")
	delay(2)
	mission_help_table("vk06b_defend_self3")
end

function vk06b_gat_monologue()
	delay(18)
	audio_play_for_character("GAT_VK6B_MONOLOGUE_1", "vk06b_driver", "voice", false, false)
	persona_override_persona_start("SP_GAT", "combat - congratulate player", "GAT_VK6B_GRATPC") 
	persona_override_persona_start("SP_GAT", "threat - damage received (firearm)", "GAT_VK6B_DAMAGE") 
	persona_override_persona_start("SP_GAT", "escort - stripper reacts to hitting human", "GAT_VK6B_RUNOVER") 
	persona_override_persona_start("SP_GAT", "escort - stripper reacts to hitting vehicle", "GAT_VK6B_HITOBJECT") 
end

function vk06b_flow()
	damage_indicator_on( VK6b_chariot, 0.15, "vk06b_car" )
	vehicle_should_obey_traffic( VK6b_chariot, false )
	combat_disable( VK6b_chauffer )
	set_ignore_ai_flag( VK6b_chauffer, true )
	
	minimap_icon_add_navpoint("vk06b_$n_cop_meeting_a", MINIMAP_ICON_LOCATION)
	
	-- get to the start on splines
	
	vehicle_pathfind_to(VK6b_chariot, VK6b_path_start[1], true, false)
	vehicle_speed_override(VK6b_chariot, 60)
	
	thread_new("vk06b_gat_monologue")
	
	vehicle_turret_base_to(VK6b_chariot, VK6b_path_start[2], false)
	
	notoriety_set_min( "vice_kings", 1 )
	notoriety_set_max( "vice_kings", 1 )
	set_cops_shooting_from_vehicles(true)

	-- do each of the 5 encounters
	for i = 1, 5 do
		--trigger_enable(VK6b_triggers[i][VK6b_CREATE_TRIGGER])
		--on_trigger(VK6b_triggers[i][VK6b_CREATE_FUNCTION], VK6b_triggers[i][VK6b_CREATE_TRIGGER])

		-- if this doesn't work delete this line and uncomment the above two lines, the trigger_disable below and place those triggers
		if i == 1 then
			thread_new("vk06b_encounter_a_create")
			VK6b_current_encounter = "A"
		elseif i == 2 then
			thread_new("vk06b_encounter_b_create")
			VK6b_current_encounter = "B"
		elseif i == 3 then
			thread_new("vk06b_encounter_c_create")
			VK6b_current_encounter = "C"
		elseif i == 4 then
			thread_new("vk06b_encounter_d_create")
			VK6b_current_encounter = "D"
		elseif i == 5 then
			thread_new("vk06b_encounter_e_create")
			VK6b_current_encounter = "E"
		end		
		--eval(VK6b_triggers[i][VK6b_CREATE_FUNCTION])
		
		-- get to the encounter
		mission_debug("pre_encounter "..i, 5 )
		vk06b_pre_encounter_path(i)
		-- wait until we've interrupted this encounter
		
		if (VK6b_current_encounter ~= "NONE") then
			mission_help_table("vk06b_destroy_police")
		end
		
		wait_until_current_encounter_done()
		if i == 1 then
			notoriety_set_max( "police", 1 )
			notoriety_set_min( "police", 1 )
			minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_a")
			minimap_icon_add_navpoint("vk06b_$n_cop_meeting_b", MINIMAP_ICON_LOCATION)
			group_create("vk06b_ambush1", false)
		elseif i == 2 then
			notoriety_set_max( "vice_kings", 2 )
			notoriety_set_min( "vice_kings", 2 )
			notoriety_set_max( "police", 2 )
			notoriety_set_min( "police", 2 )
			minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_b")
			minimap_icon_add_navpoint("vk06b_$n_cop_meeting_c", MINIMAP_ICON_LOCATION)
		elseif i == 3 then
			notoriety_set_max( "vice_kings", 3 )
			notoriety_set_min( "vice_kings", 3 )
			release_to_world("vk06b_ambush1")
			minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_c")
			minimap_icon_add_navpoint("vk06b_$n_cop_meeting_d", MINIMAP_ICON_LOCATION)
		elseif i == 4 then
			notoriety_set_max( "vice_kings", 4 )
			notoriety_set_min( "vice_kings", 4 )
			minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_d")
			minimap_icon_add_navpoint("vk06b_$n_cop_meeting_e", MINIMAP_ICON_LOCATION)
		elseif i == 5 then
			notoriety_set_max( "police", 3 )
			notoriety_set_min( "police", 3 )
			minimap_icon_remove_navpoint("vk06b_$n_cop_meeting_e")
			group_create("vk06b_roadblock", false)
			minimap_icon_add_navpoint("vk06b_$n_e_get_the_fuck_out", MINIMAP_ICON_LOCATION)
		end		
		
		--minimap_icon_remove_npc(VK6b_
		--trigger_disable(VK6b_triggers[i][VK6b_ENCOUNTER])
		if (5-i > 0) then
			--message("Daaaaamn, boyee! There are " .. 5 - i .. " meetings left!", 3.0)
		end
		-- chase, run off, whatever in there
		vk06b_post_encounter_path(i)
		mission_debug("post_encounter "..i, 5 )
		-- and loop
	end
	-- we're done!
	--vehicle_speed_override(VK6b_chariot, 5)
	--vehicle_pathfind_to(VK6b_chariot, VK6b_path_finale[1], true, false)
	-- ramp over draw bridge mother fucker!
	--vehicle_speed_override(VK6b_chariot, 45)
	if ((get_dist_vehicle_to_nav(VK6b_chariot, "vk06b_$n_e_fnf2") < 15) and not is_vehicle_destroyed(VK6b_chariot)) then
		cutscene_in("vk06b_scene02")
		damage_indicator_off()
		destroy_group(VK6b_player_group)
		cutscene_play("vk06b_scene02")
		fade_out( 0 )
		music_studio_set_state(1)
		cutscene_prime_audio( "vk06b_scene03" )
		delay(1)
		cutscene_play("vk06b_scene03", true)
		teleport("#PLAYER#", "vk06b_end")
	
		mission_end_success( "vk06b" )		
	end
end


function vk06b_encounter_a_create()
	group_create(VK6b_A_group, true)
	
	for i,char in pairs(VK6b_A_gangstas) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	for i,char in pairs(VK6b_A_cops) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	-- you do any shit and this function gets called
	vk06b_on_encounter_interruption("vk06b_encounter_interruption", VK6b_A_gang_cars, VK6b_A_cop_cars, VK6b_A_gangstas, VK6b_A_cops)
	VK6b_current_encounter = "A"
end


function vk06b_encounter_b_create()
	group_create(VK6b_B_group, true)
	
	for i,char in pairs(VK6b_B_gangstas) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	for i,char in pairs(VK6b_B_cops) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	-- you do any shit and this function gets called
	vk06b_on_encounter_interruption("vk06b_encounter_interruption", VK6b_B_gang_cars, VK6b_B_cop_cars, VK6b_B_gangstas, VK6b_B_cops)
	VK6b_current_encounter = "B"
end


function vk06b_encounter_c_create()
	group_create(VK6b_C_group, true)
	
	for i,char in pairs(VK6b_C_gangstas) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	for i,char in pairs(VK6b_C_cops) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	-- you do any shit and this function gets called
	vk06b_on_encounter_interruption("vk06b_encounter_interruption", VK6b_C_gang_cars, VK6b_C_cop_cars, VK6b_C_gangstas, VK6b_C_cops)
	VK6b_current_encounter = "C"
end


function vk06b_maids()
	group_create("vk06b_random1", true)
	character_add_vehicle("vk06b_maid1", "vk06b_maidcar1", 0)
	character_add_vehicle("vk06b_maid2", "vk06b_maidcar2", 0)
	vehicle_chase("vk06b_maidcar1", VK6b_chauffer, false, true)
	vehicle_chase("vk06b_maidcar2", VK6b_chauffer, false, true)	
	delay(60)
	release_to_world("vk06b_random1")
end

function vk06b_encounter_d_create()
	thread_new("vk06b_maids")
	group_create(VK6b_D_group, true)
	
	for i,char in pairs(VK6b_D_gangstas) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	for i,char in pairs(VK6b_D_cops) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	-- you do any shit and this function gets called
	vk06b_on_encounter_interruption("vk06b_encounter_interruption", VK6b_D_gang_cars, VK6b_D_cop_cars, VK6b_D_gangstas, VK6b_D_cops)
	VK6b_current_encounter = "D"
end


function vk06b_encounter_e_create()
	group_create(VK6b_E_group, true)
	
	for i,char in pairs(VK6b_E_gangstas) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	for i,char in pairs(VK6b_E_cops) do
		add_marker_npc(char, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	-- you do any shit and this function gets called
	vk06b_on_encounter_interruption("vk06b_encounter_interruption", VK6b_E_gang_cars, VK6b_E_cop_cars, VK6b_E_gangstas, VK6b_E_cops)
	VK6b_current_encounter = "E"
end

function vk06b_gat_line_delay(time, line)
	delay(time)
	audio_play_for_character(line, "vk06b_driver", "voice", false, false)
end

function vk06b_encounter_interruption()
	-- don't care how or why, just react to it and then release them as we're done with them
	if VK6b_current_encounter == "A" then
		
		for i,char in pairs(VK6b_A_gangstas) do
			remove_marker_npc(char)
		end
	
		for i,char in pairs(VK6b_A_cops) do
			remove_marker_npc(char)
		end
	
		mission_help_table("vk06b_defend_self")
		vk06b_on_encounter_interruption("", VK6b_A_gang_cars, VK6b_A_cop_cars, VK6b_A_gangstas, VK6b_A_cops)
		thread_new("vk06b_mount_and_attack",VK6b_A_gangstas, VK6b_A_gang_cars[1], VK6b_A_group)
		thread_new("vk06b_mount_and_attack",VK6b_A_cops, VK6b_A_cop_cars[1], VK6b_A_group)
		thread_new("vk06b_gat_line_delay", 2, "GAT_VK6B_CAR_3")
	elseif VK6b_current_encounter == "B" then
		
		for i,char in pairs(VK6b_B_gangstas) do
			remove_marker_npc(char)
		end
	
		for i,char in pairs(VK6b_B_cops) do
			remove_marker_npc(char)
		end
		
		mission_help_table("vk06b_defend_self")
		vk06b_on_encounter_interruption("", VK6b_B_gang_cars, VK6b_B_cop_cars, VK6b_B_gangstas, VK6b_B_cops)
		thread_new("vk06b_mount_and_attack",VK6b_B_gangstas, VK6b_B_gang_cars[1], VK6b_B_group)
		thread_new("vk06b_mount_and_attack",VK6b_B_cops, VK6b_B_cop_cars[1], VK6b_B_group)
		thread_new("vk06b_gat_line_delay", 1.5, "GAT_VK6B_CAR_4")
		--release_to_world(VK6b_B_group)
	elseif VK6b_current_encounter == "C" then
	
		for i,char in pairs(VK6b_C_gangstas) do
			remove_marker_npc(char)
		end
	
		for i,char in pairs(VK6b_C_cops) do
			remove_marker_npc(char)
		end
		
		mission_help_table("vk06b_defend_self")
		vk06b_on_encounter_interruption("", VK6b_C_gang_cars, VK6b_C_cop_cars, VK6b_C_gangstas, VK6b_C_cops)
		thread_new("vk06b_mount_and_attack",VK6b_C_gangstas, VK6b_C_gang_cars[1], VK6b_C_group)
		thread_new("vk06b_mount_and_attack",VK6b_C_cops, VK6b_C_cop_cars[1], VK6b_C_group)
		thread_new("vk06b_gat_line_delay", 1.5, "GAT_VK6B_CAR_5")
		--release_to_world(VK6b_C_group)
	elseif VK6b_current_encounter == "D" then
	
		for i,char in pairs(VK6b_D_gangstas) do
			remove_marker_npc(char)
		end
	
		for i,char in pairs(VK6b_D_cops) do
			remove_marker_npc(char)
		end
		
		mission_help_table("vk06b_defend_self")
		vk06b_on_encounter_interruption("", VK6b_D_gang_cars, VK6b_D_cop_cars, VK6b_D_gangstas, VK6b_D_cops)
		thread_new("vk06b_mount_and_attack",VK6b_D_gangstas, VK6b_D_gang_cars[1], VK6b_D_group)
		thread_new("vk06b_mount_and_attack",VK6b_D_cops, VK6b_D_cop_cars[1], VK6b_D_group)
		thread_new("vk06b_gat_line_delay", 1.5, "GAT_VK6B_CAR_6")
		--release_to_world(VK6b_D_group)
	elseif VK6b_current_encounter == "E" then
	
		for i,char in pairs(VK6b_E_gangstas) do
			remove_marker_npc(char)
		end
	
		for i,char in pairs(VK6b_E_cops) do
			remove_marker_npc(char)
		end
		
		mission_help_table("vk06b_defend_self2")
		vk06b_on_encounter_interruption("", VK6b_E_gang_cars, VK6b_E_cop_cars, VK6b_E_gangstas, VK6b_E_cops)
		thread_new("vk06b_mount_and_attack",VK6b_E_gangstas, VK6b_E_gang_cars[1], VK6b_E_group)
		thread_new("vk06b_mount_and_attack",VK6b_E_cops, VK6b_E_cop_cars[1], VK6b_E_group)
		thread_new("vk06b_gat_line_delay", 1.5, "GAT_VK6B_CAR_7")
		--release_to_world(VK6b_E_group)
	end
	VK6b_current_encounter = "NONE"
end

function vk06b_gat_dialog(i)
	while (get_dist_char_to_nav("#PLAYER#", "vk06b_$trigger"..i) > 20) do
		thread_yield()
	end
		
	if (i==1) then
		audio_play_for_character("GAT_VK6B_BREAKUP_1", "vk06b_driver", "voice", false, true)
		if (VK6b_current_encounter ~= "NONE") then 
			mission_help_table("vk06b_destroy_police")
		end
		delay(3)
		audio_play_for_character("GAT_VK6B_BREAKUP_2", "vk06b_driver", "voice", false, true)
	elseif (i==2) then
		audio_play_for_character("GAT_VK6B_BREAKUP_3", "vk06b_driver", "voice", false, true)
		if (VK6b_current_encounter ~= "NONE") then 
			mission_help_table("vk06b_destroy_police")
		end
		
		delay(5)
		audio_play_for_character("GAT_VK6B_BREAKUP_4", "vk06b_driver", "voice", false, true)
	elseif (i==3) then
		audio_play_for_character("GAT_VK6B_BREAKUP_8", "vk06b_driver", "voice", false, true)
		if (VK6b_current_encounter ~= "NONE") then 
			mission_help_table("vk06b_destroy_police")
		end
		
--		audio_play_for_character("GAT_VK6B_BREAKUP_11", "vk06b_driver", "voice", false, true)
	elseif (i==4) then
		audio_play_for_character("GAT_VK6B_BREAKUP_19", "vk06b_driver", "voice", false, true)
		if (VK6b_current_encounter ~= "NONE") then 
			mission_help_table("vk06b_destroy_police")
		end
		
		delay(1)
		audio_play_for_character("GAT_VK6B_BREAKUP_20", "vk06b_driver", "voice", false, true)
	elseif (i==5) then
		audio_play_for_character("GAT_VK6B_BREAKUP_17", "vk06b_driver", "voice", false, true)
		if (VK6b_current_encounter ~= "NONE") then 
			mission_help_table("vk06b_destroy_police")
		end
		
		delay(1)
		audio_play_for_character("GAT_VK6B_BREAKUP_7", "vk06b_driver", "voice", false, true)
	end
end

function vk06b_pre_encounter_path(i)
	thread_new("vk06b_gat_dialog", i)
	if i == 1 then
		vehicle_speed_override(VK6b_chariot, 30)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_A[1], true, false)
		vehicle_speed_override(VK6b_chariot, 50)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_A[2], true)
		vehicle_speed_cancel(VK6b_chariot)
	elseif i == 2 then
		vehicle_speed_override(VK6b_chariot, 70)
		vehicle_turret_base_to(VK6b_chariot, VK6b_path_B[1], false)
		vehicle_speed_override(VK6b_chariot, 35)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_B[2], true, true)
		vehicle_speed_cancel(VK6b_chariot)
	elseif i == 3 then
		vehicle_speed_override(VK6b_chariot, 50)
		vehicle_turret_base_to(VK6b_chariot, VK6b_path_C[1], false)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_C[2], true, true)
		vehicle_speed_cancel(VK6b_chariot)
	elseif i == 4 then
		set_traffic_density(0.01)
		vehicle_ignore_repulsors(VK6b_chariot, true)
		vehicle_speed_override(VK6b_chariot, 50)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_D[1], true, false)
		--vehicle_pathfind_to(VK6b_chariot, VK6b_path_D[2], false, true)
		vehicle_turret_base_to(VK6b_chariot, VK6b_path_D[2], true)
		vehicle_speed_cancel(VK6b_chariot)
	elseif i == 5 then
		vehicle_speed_override(VK6b_chariot, 60)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_E[1], true, true)
		vehicle_speed_cancel(VK6b_chariot)
	end
end


function vk06b_post_encounter_path(i)
	if i == 1 then
		vehicle_speed_override(VK6b_chariot, 45)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_A[3], true, false)
	elseif i == 2 then
		vehicle_speed_override(VK6b_chariot, 45)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_B[3], true, false)
		--vehicle_turret_base_to(VK6b_chariot, VK6b_path_B[4], false)
		audio_play_for_character("GAT_VK6B_CAR_1", "vk06b_driver", "voice", false, false)
	elseif i == 3 then
		vehicle_speed_override(VK6b_chariot, 45)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_C[3], true, false)
	elseif i == 4 then
		vehicle_speed_override(VK6b_chariot, 45)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_D[3], true, false)
		audio_play_for_character("GAT_VK6B_CAR_2", "vk06b_driver", "voice", false, false)
	elseif i == 5 then
		set_traffic_density(0.25)
		vehicle_ignore_repulsors(VK6b_chariot, false)
		vehicle_speed_override(VK6b_chariot, 45)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_E[2], true, false)
		--vehicle_pathfind_to(VK6b_chariot, VK6b_path_E[3], false, false)
		audio_play_for_character("GAT_VK6A_4GIVEN4GET", "vk06b_driver", "voice", false, false)
		vehicle_turret_base_to(VK6b_chariot, VK6b_path_E[3], true)
		vehicle_pathfind_to(VK6b_chariot, VK6b_path_E[4], true, true)
	end
end

-- HELPER FUNCTIONS -------------

function vk06b_on_encounter_interruption(function_name, gang_cars, cop_cars, gangstas, cops)
	for i,gangcar in pairs(gang_cars) do
		on_vehicle_destroyed(function_name, gangcar)
	end
	for i,copcar in pairs(cop_cars) do
		on_vehicle_destroyed(function_name, copcar)
	end
	for i,cop in pairs(cops) do
		on_death(function_name, cop)
	end
	for i,gangsta in pairs(gangstas) do
		on_death(function_name, gangsta)
	end
	
	if (function_name ~= "") then
		for i,cop in pairs(cops) do
			if (is_dead(cop)) then
				thread_new(function_name)
				return
			end
		end
		for i,gangsta in pairs(gangstas) do
			if (is_dead(gangsta)) then
				thread_new(function_name)
				return
			end
		end
	end
end


function vk06b_mount_and_attack(chars, car, group)
	vk06b_characters_enter_car(chars, car)
	if ((not is_dead(chars[1]))) then
	   attack(chars[1], "#PLAYER#")
	end
	delay(20)
	for i,char in pairs(chars) do
		release_to_world(char)
	end
	release_to_world(car)
end

function vk06b_gat_death()
	delay(3)
	mission_end_failure( "vk06b", "vk06b_fail_gat_death" )
end

function vk06b_car_destroyed()
	delay(5)
	mission_end_failure( "vk06b", "vk06b_fail_car_destroyed" )
end

-- PROBATIONARY LIBRARY AND DEBUGGING FUNCTIONS -----------------------

function vk06b_characters_enter_car(characters, car)
	for i, char in pairs(characters) do
		set_ignore_ai_flag(char, true)
	end
	if (sizeof_table(characters) == 2) then
		vehicle_enter_group(characters[1], characters[2], car)
	elseif (sizeof_table(characters) == 3) then
		vehicle_enter_group(characters[1], characters[2], characters[3], car)
	end
	for i, char in pairs(characters) do
		set_ignore_ai_flag(char, false)
	end
end

function run_test_path(car, path)
	-- teleport to first navpoint in path
	teleport_vehicle(car, path[1])
	-- start rolling
	vehicle_speed_override(car, 100)
	-- pathfind through
	vehicle_pathfind_to(car, path, true, false)
	mission_debug("Stopping car...", 5.0)
	-- stop the car
	vehicle_speed_cancel(car)
end

function vk06b_prep()
	-- teleport the player to the nav
	teleport("#PLAYER#", "vk06b_$n_observe")
	-- create the group
	group_destroy(VK6b_player_group)
	group_create(VK6b_player_group, true)
	-- put chauffer and player in car
	character_add_vehicle(VK6b_chauffer, VK6b_chariot, 0)
	character_add_vehicle("#PLAYER#", VK6b_chariot, 1)
end

function wait_until_current_encounter_done()
	while (VK6b_current_encounter ~= "NONE") do
		thread_yield()
	end
end

HELVIG = false
function vk06b_helvig()
	HELVIG = true
end