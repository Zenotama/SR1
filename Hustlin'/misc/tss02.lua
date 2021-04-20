
-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------
Tss02_leaders_killed = 0
Tss02_conversation_point = 0
Tss02_conversation_thread = 0
Tss02_bought_gun = false
Tss02_got_gun_call = false
Tss02_got_stronghold_call = false
Tss02_second_group_spawned = false
Tss02_stronghold_reached = false
Tss02_bought_liquor = false

-- FUNCTIONS ----------------------------

Tss02_peoples = {"tss02_wr1", "tss02_wr2", "tss02_wr3", "tss02_wrleader", "tss02_lc1", "tss02_wrleader2", "tss02_wr4", 
						"tss02_wr5", "tss02_wr6", "tss02_wr7", "tss02_wr8", "tss02_wr9", "tss02_wr10", "tss02_wr11", 
						"tss02_lc2", "tss02_lc3", "tss02_lc4", "tss02_lc5", "tss02_lc6", "tss02_lc7", "tss02_lc8", 
						"tss02_lc9", "tss02_lc10", "tss02_lcleader", "tss02_vk1", "tss02_vk2", "tss02_vk3", 
						"tss02_vkleader", "tss02_wrrocket", "tss02_vk4", "tss02_ts1", "tss02_ts2" }
Tss02_vehicles = {"tss02_car_wr1", "tss02_car_wr2", "tss02_car_wr3", "tss02_car_lc1", "tss02_car_lc2", "tss02_car_vk2", "tss02_car_vk3" }

function tss02_gun_call()
	Tss02_got_gun_call = true
end

function tss02_stronghold_call()
	Tss02_got_stronghold_call = true
end

function tss02_buy_gun(store_type)
	if (store_type == "weapon") then
		on_purchase("")
		create_group("tss01_gun_rob", true)
		move_to("tss01_robber", "tss01_robber_dest", 1)
		attack("tss01_robber")
		delay(10)
		Tss02_bought_gun = true
	end
end

function tss02_cleanup()
	mesh_mover_play_action("sr_city_LotGateMover0", "start1")
	
	mission_waypoint_remove()
	
	notoriety_reset_vehicle_count( "police" )
	
	party_dismiss("tss02_troy")
	party_dismiss("tss02_julius")
	
	notoriety_reset("vice_kings")
	notoriety_reset("rollers")
	notoriety_reset("los_carnales")
	notoriety_reset("police")
	
	-- unregister functions
	trigger_disable("tss02_enter_docks")
	trigger_disable("tss02_lcstart")
	trigger_disable("tss02_cardrive")
	trigger_disable("tss02_rocketcar")
	trigger_disable("tss02_run_over")
	trigger_disable("tss02_pickup")
	on_trigger("", "tss02_pickup")
	on_trigger("", "tss02_enter_docks")
	on_trigger("", "tss02_lcstart")
	on_trigger("", "tss02_cardrive")
	on_trigger("", "tss02_rocketcar")
	on_trigger("", "tss02_run_over")
	on_trigger("", "tss02_lcattack")
	on_death("", "tss02_wrleader2")
	on_death("", "tss02_lcleader")
	on_death("", "tss02_vkleader")
	on_dismiss("", "tss02_troy")
	on_dismiss("", "tss02_julius")
	on_death("", "tss02_troy")
	on_death("", "tss02_julius")
	on_purchase("")
	
	-- minimap icons
	remove_marker_trigger("tss02_enter_docks")
	minimap_icon_remove_npc("tss02_wrleader2")
	minimap_icon_remove_npc("tss02_lcleader")
	minimap_icon_remove_npc("tss02_vkleader")
	ingame_effect_remove_npc("tss02_wrleader2")
	ingame_effect_remove_npc("tss02_lcleader")
	ingame_effect_remove_npc("tss02_vkleader")
	remove_marker_npc("tss02_troy")
	remove_marker_npc("tss02_julius")
	remove_marker_trigger("shops_sr_city_$sr_liquor001")
	
	group_destroy("tss02_allies")
	release_to_world("tss02_badguys")
	--release_to_world("tss02_badguys2")
end

function tss02_success()
	hood_set_owner("ts_saintsrow02", "Playas")
	--mission_unlock("tss02a")
	radio_post_event("NEWS_PRES_MONROE_3", false)
	tss02a_success()
end

function tss02_fail()
	mission_end_failure("tss02", "tss03_fail1")
end

function tss02_maybe_win()
	if (Tss02_leaders_killed > 2) then
		npc_revive("tss02_julius")
		audio_play_for_character("JULIUS_3SS2_CONGRAT_1", "tss02_julius", "voice", false, true, 1, 3)
		mesh_mover_play_action("sr_city_LotGateMover0", "start1")
		notoriety_set_max("police", 3)
		notoriety_set("police", 2.5)
		notoriety_set_min("police", 2)
		notoriety_set_desired_vehicle_count("police", 0)
		character_show("tss02_cop")
		vehicle_show("tss02_cop_car")
		character_add_vehicle("tss02_cop", "tss02_cop_car", 0)
		set_unjackable_flag("tss02_cop_car", true)
		--vehicle_supress_npc_exit("tss02_cop_car", true)
		vehicle_disable_flee("tss02_cop_car", true)
		vehicle_disable_chase("tss02_cop_car", true)
		
		vehicle_degrade_control("tss02_cop_car", 2.0, 2.0, 2.0) 
		

		--tutorial_start("notoriety_police", 500)
		
		vehicle_chase("tss02_cop_car", "#PLAYER#", true, true, true)
		
		local counter = 0
		
		while (get_dist_char_to_char("tss02_cop", "#PLAYER#") > 50.0) do
			counter = counter + 1
			delay(1)
			if (counter > 20) then
				break
			end
		end
		
		set_unjackable_flag("tss02_cop_car", false)
		audio_play_for_character("TROY_3SS2_DAMAGE_1", "tss02_troy", "voice", false, true, 5, 3)
		
		if (not is_player_in_vehicle() or (vehicle_get_num_seats("#PLAYER#") < 4)) then
			mission_help_table("tss02_find_car")
		end
		
		delay(1)
		
		audio_play_for_character("TROY_3SS2_COPS_1", "tss02_troy", "voice", false, true, -1, 3)
		mission_help_table("tss02_lose_tail")
		
		delay(10)
		character_show("tss02_cop2")
		vehicle_show("tss02_cop_car2")
		character_add_vehicle("tss02_cop2", "tss02_cop_car2", 0)
		vehicle_degrade_control("tss02_cop_car2", 2.0, 2.0, 2.0)
		--vehicle_supress_npc_exit("tss02_cop_car2", true)
		
		counter = 0
		while (not teleport_vehicle_notoriety_pos("tss02_cop_car2")) do
			counter = counter + 1
			delay(2)
			if (counter > 10) then
				break
			end
		end
		
		--teleport_vehicle_notoriety_pos("tss02_cop_car2")
		
		vehicle_chase("tss02_cop_car2", "#PLAYER#", true, true, true)
		
		notoriety_set_min("police", 0)
		
		local cop1_gone = false
		local cop2_gone = false
		
		while (true) do
			if (not cop1_gone) then
				if (is_dead("tss02_cop") or is_vehicle_destroyed("tss02_cop_car")) then
					cop1_gone = true
				end
				
				if (get_dist_char_to_char("#PLAYER#", "tss02_cop") > 150.0) then
					character_hide("tss02_cop")
					if (get_char_in_vehicle("tss02_cop_car", 0) ~= "#PLAYER#") then
						vehicle_hide("tss02_cop_car")
					end
					cop1_gone = true
				end
			end
			
			
			if (not cop2_gone) then
				if (is_dead("tss02_cop2") or is_vehicle_destroyed("tss02_cop_car2")) then
					cop2_gone = true
				end
				
				if (get_dist_char_to_char("#PLAYER#", "tss02_cop2") > 150.0) then
					character_hide("tss02_cop2")
					if (get_char_in_vehicle("tss02_cop_car2", 0) ~= "#PLAYER#") then
						vehicle_hide("tss02_cop_car2")
					end
					cop2_gone = true
				end
			end
			
			if (notoriety_get("police") < 1) then
				notoriety_set_max("police", 0)
				
				vehicle_flee("tss02_cop_car")
				vehicle_flee("tss02_cop_car2")
				
				release_to_world("tss02_cop")
				release_to_world("tss02_cop2")
				
				release_to_world("tss02_cop_car")
				release_to_world("tss02_cop_car2")
				break
			end
			
			if (cop1_gone and cop2_gone) then
				notoriety_set_max("police", 0)
				break
			end
			
			thread_yield()
		end
		
		delay(5)
		audio_play_for_character("TROY_3SS2_COPSLOST_1", "tss02_troy", "voice", false, true, 0, 3)
		mission_waypoint_add("saintsrow_church1_gps")
		mission_help_table("tss02_drop_off")
		on_trigger("tss02_drop_off", "tss02_pickup")
	
		add_marker_trigger("tss02_pickup", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
		trigger_enable("tss02_pickup")
		--
	end
end

function tss02_drop_off()
	trigger_disable("tss02_pickup")
	remove_marker_trigger("tss02_pickup")
	if (is_player_in_vehicle()) then
		vehicle_stop( "#PLAYER#" )
	end
	player_controls_disable()
	audio_play_for_character("JULIUS_3SS2_MISSIONEND_1", "tss02_troy", "voice", false, true)
	party_dismiss_all()
	thread_new("tss02_julius_exit")
	thread_new("tss02_troy_exit")
	delay(0.5)
	cutscene_in("tss_main_story_intro")
	player_controls_enable()

	if (is_demo_execution()) then
		cutscene_play("tss_main_story_intro")
		demo_completed() -- makes the game display the upsell screen.
		game_quit_to_main_menu() -- fade out, close everything down and quit to main menu.
	else 
		cutscene_play("tss_main_story_intro", true)
		mission_end_success("tss02")
	end
end

function tss02_julius_exit()
	vehicle_exit("tss02_julius")
end

function tss02_troy_exit()
	delay(0.13)
	vehicle_exit("tss02_troy")
end

function tss02_wrleader_killed()
	Tss02_leaders_killed = Tss02_leaders_killed + 1
	minimap_icon_remove_npc("tss02_wrleader2")
	ingame_effect_remove_npc("tss02_wrleader2")
	tss02_maybe_win()
end

function tss02_lcleader_killed()
	Tss02_leaders_killed = Tss02_leaders_killed + 1
	minimap_icon_remove_npc("tss02_lcleader")
	ingame_effect_remove_npc("tss02_lcleader")
	tss02_maybe_win()
end

function tss02_vkleader_killed()
	Tss02_leaders_killed = Tss02_leaders_killed + 1
	minimap_icon_remove_npc("tss02_vkleader")
	ingame_effect_remove_npc("tss02_vkleader")
	tss02_maybe_win()
end

function tss02_fight_cutscene()
	modal_begin()
	
	camera_look_through("tss02_fightcam6")
	
	fade_in(0.1)
	delay(1.5)
	set_current_hit_points("tss02_vkdead", 0)
	delay(1)
	fade_out(0.1)
	delay(0.1)
	
	
	camera_look_through("tss02_fightcam4")
	thread_new("tss02_pf1")
	
	fade_in(0.1)
	delay(2.5)
	fade_out(0.1)
	delay(0.1)
	modal_end()
end

function tss02_pf1()
	move_to("tss02_lc2", "tss02_lcdest", 2, false, true)
end

function tss02_start_lcattack()
	on_trigger("", "tss02_lcattack")
	attack("tss02_lc9", "tss02_vk2")
end

function tss02_start_fight()
	trigger_disable("tss02_enter_docks")
	remove_marker_trigger("tss02_enter_docks")
	mission_waypoint_remove()
	
	trigger_enable("tss02_lcstart")
	trigger_enable("tss02_cardrive")
	trigger_enable("tss02_rocketcar")
	trigger_enable("tss02_run_over")
	on_trigger("tss02_start_lcfight", "tss02_lcstart")
	on_trigger("tss02_start_cardrive", "tss02_cardrive")
	on_trigger("tss02_start_rocketcar", "tss02_rocketcar")
	on_trigger("tss02_start_camper", "tss02_run_over")
	trigger_enable("tss02_lcattack")
	on_trigger("tss02_start_lcattack", "tss02_lcattack")
	
	
	if (not (Tss02_conversation_thread == 0)) then
		thread_kill(Tss02_conversation_thread)
		Tss02_conversation_thread = 0
	end
	--if (is_player_in_vehicle()) then
	--	vehicle_stop("#PLAYER#")
	--	teleport_vehicle("#PLAYER#", "tss02_$execute lua script000")
	--else
--		teleport("#PLAYER#", "tss02_$execute lua script000")	
--	end
	
	
--	player_controls_disable()
--	fade_out(0.75)
--	delay(0.8)
--	load_chunk("sr_chunk03")
	for i,char in pairs(Tss02_peoples) do
		character_show(char)
		if (char ~= "tss02_ts1" and char ~= "tss02_ts2") then
			turn_invulnerable(char, true)
		end
	end
	
	for i,v in pairs(Tss02_vehicles) do
		vehicle_show(v)
	end
	
	turn_invulnerable("tss02_car_wr3", true)
	
	
	attack("tss02_vkleader", "tss02_wrrocket")
	attack("tss02_vk3", "tss02_wrrocket")
	
	--letterbox_fade_in()	
	--thread_new_block("tss02_fight_cutscene")
	--letterbox_fade_out()
	
	audio_play_for_character("JULIUS_3SS2_CHATTER_2", "tss02_julius", "voice", false, false)
	
	persona_override_remove_all("SP_JULIUS")
	persona_override_remove_all("SP_TROY")
	persona_override_persona_start("SP_JULIUS", "combat - congratulate player", "JULIUS_3SS2_CONGRAT", 5)
	persona_override_persona_start("SP_JULIUS", "threat - alert (group attack)", "JULIUS_3SS2_ATTACK", 5)
	persona_override_persona_start("SP_JULIUS", "threat - damage received (firearm)", "JULIUS_3SS2_DAMAGE", 5)
	persona_override_persona_start("SP_TROY", "combat - congratulate player", "TROY_3SS2_GRATPC", 5)
	persona_override_persona_start("SP_TROY", "threat - alert (group attack)", "TROY_3SS2_ATTACK", 5)
	persona_override_persona_start("SP_TROY", "threat - damage received (firearm)", "TROY_3SS2_DAMAGE", 5)
	
	
	combat_enable("tss02_ts1")
	combat_enable("tss02_ts2")
	
	attack("tss02_ts1", "tss02_wr1")
	attack("tss02_ts2", "tss02_wr1")
	
	attack("tss02_wr1", "tss02_ts1")
	attack("tss02_lc2", "tss02_wr3")
	
	mission_help_table("tss02_kill")
	minimap_icon_add_npc("tss02_wrleader2", MINIMAP_ICON_KILL)
	minimap_icon_add_npc("tss02_lcleader", MINIMAP_ICON_KILL)
	minimap_icon_add_npc("tss02_vkleader", MINIMAP_ICON_KILL)
	ingame_effect_add_npc("tss02_wrleader2", INGAME_EFFECT_KILL)
	ingame_effect_add_npc("tss02_lcleader", INGAME_EFFECT_KILL)
	ingame_effect_add_npc("tss02_vkleader", INGAME_EFFECT_KILL)
		
	on_death("tss02_wrleader_killed", "tss02_wrleader2")
	on_death("tss02_vkleader_killed", "tss02_vkleader")
	on_death("tss02_lcleader_killed", "tss02_lcleader")
	
	
	--vehicle_lights_on("tss02_car_lc1")
	--vehicle_lights_on("tss02_car_lc2")
	--vehicle_lights_on("tss02_car_wr1")
	--vehicle_lights_on("tss02_car_wr2")
	--vehicle_lights_on("tss02_car_wr3")
	--vehicle_lights_on("tss02_car_vk2")
	--vehicle_lights_on("tss02_car_vk3")
end

function tss02_start_lcfight()
	attack("tss02_lc3", "#PLAYER#")
end

function tss02_start_cardrive()
	while (not Tss02_second_group_spawned) do
		thread_yield()
	end
	
	set_ignore_ai_flag("tss02_lc8", false)
	vehicle_set_smoke_and_fire_state("tss02_car_vk3", true, true)
	set_unjackable_flag("tss02_car_vk3", true)
	on_death("tss02_car_hit", "tss02_wrrocket")
	vehicle_ignore_repulsors("tss02_car_lc1", true)
	vehicle_chase("tss02_car_lc1", "#PLAYER#", true, false, false)
	vehicle_disable_chase("tss02_car_lc1", false)
	
	--car_combat("tss02_lc8")
	attack("tss02_vk2", "tss02_lc9")
end

function tss02_car_hit()
	vehicle_detonate("tss02_car_vk3")
	vehicle_set_torque_multiplier("tss02_car_wr3", 1)
	delay(5)
	vehicle_speed_cancel("tss02_car_wr3")
	combat_enable("tss02_wrrocket")
	vehicle_exit("tss02_wrrocket")
end

function tss02_start_rocketcar()
	while (not Tss02_second_group_spawned) do
		thread_yield()
	end
	attack("tss02_vkleader")
	turn_vulnerable("tss02_car_wr3")
	
	delay(0.1)
	vehicle_set_smoke_and_fire_state("tss02_car_vk3", true, true)
	
	vehicle_set_torque_multiplier("tss02_car_wr3", 2)
	vehicle_speed_override("tss02_car_wr3", 80)
	on_collision("tss02_car_hit", "tss02_car_wr3")
end

function tss02_start_camper()
	while (not Tss02_second_group_spawned) do
		thread_yield()
	end
	set_ignore_ai_flag("tss02_camper", false)
	move_to("tss02_camper", "tss02_camper_dest", 2)
	if (Tss02_leaders_killed <= 2) then
		hearing_enable("tss02_camper")
		force_fire("tss02_camper", "tss02_$vehicle006", true)
		while (Tss02_leaders_killed <= 2) do
			delay(1)
		end
		set_ignore_ai_flag("tss02_camper", true)		
	else
		set_ignore_ai_flag("tss02_camper", true)
	end
end

function tss02_conversation()
	Tss02_conversation_point = 0
	
	while (not is_player_in_vehicle()) do
		thread_yield()
	end
	
	delay(1)
	audio_play_for_character("JULIUS_3SS2_CAR_1", "tss02_julius", "voice", false, true)
	delay(5)
	audio_play_for_character("TROY_3SS2_CARCHAT_1", "tss02_troy", "voice", false, true)
	audio_play_for_character("TROY_3SS2_CARCHAT_2", "tss02_troy", "voice", false, true)
	audio_play_for_character("JULIUS_3SS2_CHATTER_1", "tss02_julius", "voice", false, true)
	delay(55)
	
	audio_play_for_character("JULIUS_3SS2_CARIDLE_1", "tss02_julius", "voice", false, true)
	Tss02_conversation_thread = 0
end

function tss02_troy_abandoned()
	mission_end_failure("tss02", "tss02_abandon_troy")
end

function tss02_julius_abandoned()
	mission_end_failure("tss02", "tss02_abandon_julius")
end

function tss02_troy_dead()
	mission_end_failure("tss02", "tss02_troy_dead")
end

function tss02_julius_dead()
	mission_end_failure("tss02", "tss02_julius_dead")
end

function tss02_pathfind1()
	delay(1)
	move_to("tss02_troy", "tss02_troy_dest", 2)
end

function tss02_pathfind2()
	move_to("tss02_julius", "tss02_julius_dest", 2)
end

function tss02_purchase(purchase_type)
	if (purchase_type == "drug") then
		Tss02_bought_liquor = true
	end
end

function tss02_pickup_cutscene()
	modal_begin()

	group_create_preload( "tss02_allies" )
	party_add("tss02_troy")
	party_add("tss02_julius")
	
	camera_look_through("tss02_camera1")

	fade_in(1)
	delay(1)
	
	delay(2)

	fade_out(0.75)
	delay(0.8)
	modal_end()
end

function tss02_pickup_end()
end

function tss02_create_badguys()
	create_group("tss02_badguys", true)
	
	combat_disable("tss02_ts1")
	combat_disable("tss02_ts2")
	
	character_add_vehicle("tss02_lc8", "tss02_car_lc1", 0)
	vehicle_disable_chase("tss02_car_lc1", true)
	vehicle_disable_flee("tss02_car_lc1", true)
	
	
	character_add_vehicle("tss02_wrrocket", "tss02_car_wr3", 0)
	combat_disable("tss02_wrrocket")
	set_unjackable_flag("tss02_car_wr3", true)
	vehicle_disable_chase("tss02_car_wr3", true)
	vehicle_disable_flee("tss02_car_wr3", true)
	
	for i, char in pairs(Tss02_peoples) do
		character_hide(char)
	end
	
	for i, v in pairs(Tss02_vehicles) do
		vehicle_hide(v)
	end
	
	vehicle_hide("tss02_cop_car")
	vehicle_hide("tss02_cop_car2")
	character_hide("tss02_cop")
	character_hide("tss02_cop2")
	
	character_show("tss02_lc2")
	character_show("tss02_wr3")
	character_show("tss02_wr2")
	character_show("tss02_ts1")
	character_show("tss02_ts2")
	
	Tss02_second_group_spawned = true
end

function tss02_start_pickup()
	Tss02_stronghold_reached = true
	--vehicle_stop( "#PLAYER#" )
	party_dismiss("#FOLLOWER3#")
	party_dismiss("#FOLLOWER2#")
	-- minimap icons
	--remove_marker_trigger("tss02_pickup")
	--trigger_disable("tss02_pickup")
	--mission_waypoint_remove()
				
	-- register functions
	--player_controls_disable()
	--fade_out(0.75)
	--fade_out_block()
	--teleport_vehicle("#PLAYER#", "tss02_car_port")
	
	--letterbox_fade_in()	
	--scripted_cutscene_play("tss02_pickup_cutscene", "tss02_pickup_end")
	--letterbox_fade_out()
	mission_help_table("tss02_wait")
	group_create( "tss02_allies", true )
	on_death("tss02_troy_dead", "tss02_troy")
	on_death("tss02_julius_dead", "tss02_julius")
	--party_add("tss02_troy")
	move_to_do("tss02_julius", "tss02_julius_dest", 2, false, false)
	delay(0.5)
	move_to_do("tss02_troy", "tss02_troy_dest", 2, false, false)
	
	delay(6.5)
	if (not is_in_party("tss02_troy")) then
		party_add("tss02_troy")
	end
	
	if (not is_in_party("tss02_julius")) then
		party_add("tss02_julius")
	end
	
	
	on_dismiss("tss02_troy_abandoned", "tss02_troy")
	on_dismiss("tss02_julius_abandoned", "tss02_julius")
	
	--camera_end_script()
	--player_controls_enable()
	--fade_in(1)
	
	delay(1)
	audio_play_for_character("TROY_3SS2_CAR_1", "tss02_troy", "voice", false, true)
	
	persona_override_persona_start("SP_JULIUS", "escort - stripper reacts to hitting human", "JULIUS_3SS2_HITPED")
	persona_override_persona_start("SP_JULIUS", "escort - stripper reacts to hitting vehicle", "JULIUS_3SS2_HITOBJ")
	
	persona_override_persona_start("SP_TROY", "escort - stripper reacts to hitting human", "TROY_3SS2_HITOBJECT")
	persona_override_persona_start("SP_TROY", "escort - stripper reacts to hitting vehicle", "TROY_3SS2_RUNOVER")

	Tss02_conversation_thread = thread_new("tss02_conversation")
	
	while (not Tss02_second_group_spawned) do
		thread_yield()
	end
	
	trigger_enable("tss02_enter_docks")
	on_trigger("tss02_start_fight", "tss02_enter_docks")
	add_marker_trigger("tss02_enter_docks", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	
	mission_help_table("tss02_goto_docks")
	mission_waypoint_add("tss02_docks_gps")
end

function tss02_start()
	set_mission_author("Sandeep Shekar")
	cellphone_remove("JULIUS_3SS2_PHONE_1")
	mesh_mover_reset_to_action_start("sr_city_LotGateMover0", "start1")
	mission_waypoint_remove()
	-- init globals
	
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "mission_start_tss02")
		fade_in( 0.5 )
	end
	
	notoriety_set_max("vice_kings", 0)
	notoriety_set_max("rollers", 0)
	notoriety_set_max("los_carnales", 0)
	
	ambient_cop_spawn_disable()
	
	Tss02_leaders_killed = 0
	Tss02_conversation_thread = 0
	Tss02_second_group_spawned = false
	Tss02_stronghold_reached = false
	Tss02_bought_liquor = false
	
	local Tss02_in_car = false
	
	thread_new("tss02_create_badguys")
	
	--if (not is_player_in_vehicle()) then
	--	mission_help_table("tss02_find_car")
	--elseif (vehicle_get_num_seats("#PLAYER#") < 3) then
	--	mission_help_table("tss02_find_car")
	--else
	thread_new("tss02_start_pickup")
end


function tss02_warp()
	teleport("#PLAYER#", "tss02_$execute lua script000")
end

