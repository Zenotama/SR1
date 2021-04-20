--TODO 2/15/05: killing guys in car will cause them to "withdraw"

VK05_EVADE_DISTANCE = 130
VK05_ERRAND1_TIMER = 80 * 1000
VK05_ERRAND2_TIMER = 80 * 1000

vk05_Studio_reached = false
vk05_Player_returned = false
vk05_Player_in_disguise = false
vk05_Loc_one_reached = false
vk05_Loc_two_reached = false
vk05_Condo_reached = false
vk05_Condo_entrance = false
vk05_Green_dead = false
Vk05_tanya_detected = false
vk05_complaint_number = 2

vk05_AMBUSH_GROUP = {"vk05_ambush_car01","vk05_ambush_car02","vk05_ambush_car03",
					 "vk05_ambush_car01_driver","vk05_ambush_car01_pass",
					 "vk05_ambush_car02_driver","vk05_ambush_car02_pass",
					 "vk05_ambush_car03_driver","vk05_ambush_car03_pass" }
vk05_withdraw_count = 0
vk05_Distance_threads={}

vk05_CONDO_GROUP = {"vk05_Condo_front_door","vk05_Condo_Anthony","vk05_Condo_balcony01","vk05_Condo_balcony02",
					"vk05_Condo_living01","vk05_Condo_living02","vk05_Condo_kit01","vk05_Condo_kit02","vk05_Condo_table_left",
					"vk05_Condo_table_right"}
		
vk05_front_door_thread = -1

vk05_tanya_visual = -1
vk05_tanya_pathing = -1
vk05_Limo_pathing = -1
vk05_limo_help = -1

vk05_car_chatter_thread1 = -1
vk05_abandon_thread = -1
vk05_territory_thread = -1
vk05_traffic_thread = -1
	
vk05_traffic_paused = false

function vk05_cleanup()
	party_set_recruitable(true)
	mission_waypoint_remove()
	ambient_gang_spawn_enable()
	hud_timer_stop()
	notoriety_reset( "vice_kings" )
	
	remove_marker_trigger("vk05_record_studio")
	minimap_icon_remove_navpoint("vk05_greens_condo")

	remove_marker_navpoint("vk05_limo")
	remove_marker_trigger("vk05_location_one")
	remove_marker_trigger("vk05_location_two")
	remove_marker_trigger("vk05_greens_condo")
	remove_marker_trigger("vk05_player_returned")

	remove_marker_vehicle( "vk05_ambush_car01" )
	remove_marker_vehicle( "vk05_ambush_car02" )
	remove_marker_vehicle( "vk05_ambush_car03" )
	remove_marker_vehicle( "vk05_limo" )
	
	persona_override_remove_all("SP_GREEN")
	persona_override_remove_all("SP_TANYA")
	
	remove_marker_npc( "vk05_limo_driver" )
	remove_marker_npc("vk05_tanya")

	on_take_damage( "", "#PLAYER#" )
	
	on_damage("","vk05_ambush_car01",0)
	on_damage("","vk05_ambush_car02",0)
	on_damage("","vk05_ambush_car03",0)
	on_death("","vk05_Condo_Anthony")

	on_take_damage( "", "vk05_tanya" )
	on_take_damage( "", "vk05_limo" )
	
	for x=4, sizeof_table(vk05_AMBUSH_GROUP), 1 do
		on_death("",vk05_AMBUSH_GROUP[x])
		on_damage("",vk05_AMBUSH_GROUP[x],0)
		remove_marker_npc(vk05_AMBUSH_GROUP[x])
	end
	
	on_trigger("","vk05_player_returned")
	on_trigger("","vk05_record_studio")
	on_trigger("","vk05_location_one")
	on_trigger("","vk05_location_two")
	on_trigger("","vk05_greens_condo")
	on_trigger("","vk05_Condo_entrance")
	on_trigger("","vk05_condo_door")
	on_trigger("","vk05_condo_bedroom01")
	on_trigger("","vk05_condo_bedroom02")
	
	trigger_disable("vk05_player_returned")
	trigger_disable("vk05_record_studio")
	trigger_disable("vk05_location_one")
	trigger_disable("vk05_location_two")
	trigger_disable("vk05_greens_condo")
	trigger_disable("vk05_Condo_entrance")
	trigger_disable("vk05_condo_door")
	trigger_disable("vk05_condo_bedroom01")
	trigger_disable("vk05_condo_bedroom02")

	release_to_world( "vk05_limo" )

	destroy_group("vk05_Tanya_Group")
	release_to_world("vk05_Ambush")
	destroy_group("vk05_Condo")
end

function vk05_success()
	hood_set_owner("vk_highend01","Playas")
	trigger_enable("vksuburb_$t-green-save")
end

function vk05_test()
	teleport("#PLAYER#", "vk05_record_studio")
	delay(0.1)
	create_group("vk05_Tanya_Group", true)
	delay(0.1)
	character_add_vehicle("vk05_tanya", "vk05_limo", 2)
	delay(0.1)
	player_vehicle_enter("vk05_limo", true)
	delay(3)
	teleport_vehicle("vk05_limo", "vk05_location_two")
	delay(0.1)
	
	vk05_ambush_stage()
end

function vk05_start()
	--set_mission_author("Russell Aasland")
	set_mission_author("Sandeep Shekar")
	music_studio_set_state(2)
	on_trigger("vk05_limo_return","vk05_player_returned")
	on_trigger("vk05_record_vk05_Studio_reached","vk05_record_studio")
	on_trigger("vk05_location_one_reached","vk05_location_one")
	on_trigger("vk05_location_two_reached","vk05_location_two")
	on_trigger("vk05_greens_condo_reached","vk05_greens_condo")
	on_trigger("vk05_condo_entrance","vk05_Condo_entrance")
	on_trigger("vk05_condo_door","vk05_condo_door")
	on_trigger("vk05_bedroom","vk05_condo_bedroom01")
	on_trigger("vk05_bedroom","vk05_condo_bedroom02")
	ambient_gang_spawn_disable()
	vk05_Studio_reached = false
	vk05_Player_returned = false
	vk05_Player_in_disguise = false
	vk05_Loc_one_reached = false
	vk05_Loc_two_reached = false
	vk05_Condo_reached = false
	vk05_Condo_entrance = false
	vk05_Green_dead = false
	Vk05_tanya_detected = false
	
	vk05_withdraw_count = 0
	vk05_complaint_number = 2

	vk05_tanya_damage_playing = false
	vk05_gat_damage_playing = false
	
	vk05_intro_stage()
end

function vk05_intro_stage()
	cutscene_in("vk05_scene01")
	party_dismiss_all()
	party_set_recruitable(false)

	cutscene_play( "vk05_scene01" )
	set_time_of_day(10,0)
	teleport("#PLAYER#", "mission_start_vk05")
	cutscene_out()
	
	trigger_enable("vk05_record_studio")
	add_marker_trigger("vk05_record_studio",MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	mission_waypoint_add("vk05_studio_gps")
	delay(2)
	mission_help_table( "vk05_goto_studio" )
	
	while (not vk05_Studio_reached) do
		thread_yield()
	end
	if (is_player_in_vehicle()) then
		vehicle_stop("#PLAYER#")
	end
	minimap_icon_remove_navpoint("vk05_record_studio")

	vk05_limo_stage()
end

function vk05_limo_stage()
	cutscene_in("vk05_scene02")
	cutscene_play("vk05_scene02", "vk05_Tanya_Group")
	character_show("vk05_limo_driver")
	character_show("vk05_tanya")
	set_dont_attack_me_on_sight_flag( "vk05_tanya", true )
	vehicle_show("vk05_limo")
	character_add_vehicle("vk05_limo_driver","vk05_limo",0)
	vehicle_stop( "vk05_limo" )
	vehicle_set_bulletproof_glass( "vk05_limo", true )
	on_detection("vk05_tanya_detect","vk05_tanya")
	on_death("vk05_tanya_death","vk05_tanya")
	mission_waypoint_remove()
	
	vk05_initial_hitpoints = get_current_hit_points( "vk05_limo" )
	
	on_take_damage( "vk05_tanya_damage", "vk05_tanya" )
	on_vehicle_destroyed("vk05_limo_destroyed","vk05_limo")
	notoriety_reset( "vice_kings" )
	notoriety_set_max( "vice_kings", 0 )
	mesh_mover_reset_to_action_end("vk05_studio_door1", "start1")
	mesh_mover_reset_to_action_end("vk05_studio_door2", "start1")
	cutscene_out()
	
	add_marker_npc( "vk05_limo_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	on_death("vk05_driver_death","vk05_limo_driver")
	
	vk05_tanya_pathing = thread_new("vk05_tanya_path")
	vk05_Limo_pathing = thread_new("vk05_limo_path")
	vk05_limo_help = thread_new("vk05_driver_help")
	
	vk05_tanya_visual = thread_new("vk05_tanya_los")
	
	while( (not vk05_Player_returned) ) do
		mesh_mover_reset_to_action_end("vk05_studio_door1", "start1")
		mesh_mover_reset_to_action_end("vk05_studio_door2", "start1")
		delay(1)
		thread_yield()
	end
	
	add_marker_npc("vk05_tanya", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
	
	while( vk05_tanya_pathing ~= -1 ) do
		mesh_mover_reset_to_action_end("vk05_studio_door1", "start1")
		mesh_mover_reset_to_action_end("vk05_studio_door2", "start1")
		delay(1)
		thread_yield()
	end
	
	
	vk05_shopping_stage()
end

function vk05_shopping_stage()
	
	persona_override_persona_start( "SP_TANYA", "escort - stripper reacts to hitting human", "TANYA_VK5_HITPED" )
	persona_override_persona_start( "SP_TANYA", "escort - stripper reacts to hitting vehicle", "TANYA_VK5_HITCAR" )

	audio_play_for_character( "TANYA_VK5_CAR_1", "vk05_tanya", "voice", false, true)
	hud_timer_set( VK05_ERRAND1_TIMER, "vk05_timer" )
	
	set_ignore_ai_flag( "vk05_tanya", false )
	
	vehicle_enter("vk05_tanya", "vk05_limo", 2)
	
	while (get_char_in_vehicle("vk05_limo", 2) ~= "vk05_tanya") do
		vehicle_enter("vk05_tanya", "vk05_limo", 2)
		delay(1)
	end
	
	mission_debug( "vehicle_enter finished", 5 )
	set_ignore_ai_flag( "vk05_tanya", true )
	
	mission_help_table("vk05_store1")
	
	vk05_car_chatter_thread1 = thread_new("vk05_chatter1")
	vk05_abandon_thread = thread_new( "vk05_tanya_dist" )
	vk05_territory_thread = thread_new( "vk05_territory_containment" )
	vk05_traffic_thread = thread_new( "vk05_traffic_voice" )
	
	mission_waypoint_add("vk05_store1_gps")
	add_marker_trigger( "vk05_location_one", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	trigger_enable("vk05_location_one")
	while ((not vk05_Loc_one_reached) or (get_vehicle_speed("vk05_limo")>0) ) do
		thread_yield()
	end
	
	thread_kill(vk05_car_chatter_thread1)
	
	vk05_traffic_paused = true
	audio_play_for_character( "TANYA_VK5_CAR_2", "vk05_tanya", "voice", false, true )
	
	player_controls_disable()
	vehicle_stop("vk05_limo")
	fade_out(0.5)
	vehicle_exit("vk05_tanya")
	fade_out_block()
	--delay(2)
	
	fade_in(0.5)
	player_controls_enable()
	
	hud_timer_set( VK05_ERRAND2_TIMER, "vk05_timer" )
	
	while (get_char_in_vehicle("vk05_limo", 2) ~= "vk05_tanya") do
		vehicle_enter("vk05_tanya", "vk05_limo", 2)
		delay(1)
	end
	
	vk05_traffic_paused = false
	
	audio_play_for_character( "TANYA_VK5_CAR_3", "vk05_tanya", "voice", false, true )
	
	vk05_car_chatter_thread1 = thread_new("vk05_chatter1")
	
	mission_help_table("vk05_store2")
	mission_waypoint_add("vk05_store2_gps")
	add_marker_trigger( "vk05_location_two", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	trigger_enable("vk05_location_two")
	while ((not vk05_Loc_two_reached)) do
		thread_yield()
	end
	
	player_controls_disable()
	vehicle_stop( "vk05_limo" )
	
	vk05_traffic_paused = true
	
	thread_kill(vk05_car_chatter_thread1)
	
	audio_play_for_character( "TANYA_VK5_CAR_4", "vk05_tanya", "voice", false, true )
	
	vehicle_exit("vk05_tanya")
	player_controls_enable()
	set_ignore_ai_flag( "vk05_tanya", true )
	move_to("vk05_tanya","vk05_location_two_entrance", 2)
	set_ignore_ai_flag( "vk05_tanya", false )
	
	thread_new_block("vk05_julius_phone_call")
	inv_item_add("ak47", 1, "vk05_tanya")
	inv_item_equip("ak47", "vk05_tanya")
	npc_unholster_best_weapon("vk05_tanya")
	local door_thread = thread_new("vk05_doors")
	while (get_char_in_vehicle("vk05_limo", 2) ~= "vk05_tanya") do
		vehicle_enter("vk05_tanya", "vk05_limo", 2)
		delay(1)
	end
	thread_kill(door_thread)
	inv_item_remove("ak47", 1, "vk05_tanya")
	
	set_ignore_ai_flag( "vk05_tanya", true )
	
	vk05_ambush_stage()
end

function vk05_doors()
	while (true) do
		door_open("GSMeshMover01")
		door_open("GSMeshMover02")	
		delay(1)
	end
end

function vk05_ambush_stage()
	--on_damage("vk05_car_withdraw","vk05_ambush_car01",.8)
	--on_damage("vk05_car_withdraw","vk05_ambush_car02",.8)
	--on_damage("vk05_car_withdraw","vk05_ambush_car03",.8)
	
	for x=4, sizeof_table(vk05_AMBUSH_GROUP), 1 do
		on_death( "vk05_ambush_failure", vk05_AMBUSH_GROUP[x])
		on_damage( "vk05_ambush_kill_danger", vk05_AMBUSH_GROUP[x], .5)
	end

	audio_play_for_character( "TANYA_VK5_CAR_5", "vk05_tanya", "voice", false, true )

	minimap_icon_add_navpoint("vk05_greens_condo",MINIMAP_ICON_LOCATION)

	create_group("vk05_Ambush",true)
	local car_name
	for x=1, 3, 1 do
		car_name = "vk05_ambush_car0"..x
		character_hide(car_name.."_driver")
		character_hide(car_name.."_pass")
		vehicle_hide(car_name)
	end
	
	vk05_traffic_paused = false
	
	for x=1, 3, 1 do
		car_name = "vk05_ambush_car0"..x
		
		vehicle_degrade_control(car_name, 2.0, 2.0, 2.0)
	
		while not (teleport_vehicle_notoriety_pos(car_name)) do
			delay(1)
		end
		
		character_show(car_name.."_driver")
		character_show(car_name.."_pass")
		vehicle_show(car_name)
		
		character_add_vehicle(car_name.."_driver", car_name, 0)
		character_add_vehicle(car_name.."_pass", car_name, 1)
		turn_invulnerable( car_name, true )
		turn_invulnerable( car_name.."_driver", true )
		turn_invulnerable( car_name.."_pass", true )
		
		attack(car_name.."_driver", "vk05_tanya")
		attack(car_name.."_pass", "vk05_tanya")
		vehicle_set_torque_multiplier(car_name, 1.5)
		
		vehicle_disable_flee(car_name, true)
		vehicle_disable_chase(car_name, true)
		
		add_marker_npc( car_name.."_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
		
		vk05_Distance_threads[car_name] = thread_new("vk05_evade_car", car_name)
		vehicle_chase(car_name,"vk05_tanya",false, false, false)
			
		if (x == 1) then
			audio_play_for_character( "TANYA_VK5_NOTICE_1", "vk05_tanya", "voice", false, true )
			delay(3)
			mission_help_table( "vk05_ambush_response" )
		end
	end
	
	for x=4,sizeof_table(vk05_AMBUSH_GROUP),1 do
		--car_combat(vk05_AMBUSH_GROUP[x])
		forced_target_set(vk05_AMBUSH_GROUP[x], "#PLAYER#") 
	end

	delay(20)
	
	for x=1, 3, 1 do
		local car_name = "vk05_ambush_car0"..x
		vehicle_set_torque_multiplier(car_name, 0.5)
		vehicle_speed_override(car_name, 75)
	end
	
	while (vk05_withdraw_count < 3) do
		thread_yield()
	end
	
	mission_waypoint_add("vk05_condo_gps")

	audio_play_for_character( "TANYA_VK5_CAR_21", "vk05_tanya", "voice", false, true )

	vk05_condo_stage()
end

function vk05_condo_stage()
	on_death("vk05_green_died","vk05_Condo_Anthony")
	
	mission_help_table( "vk05_goto_condo" )
	minimap_icon_remove_navpoint("vk05_greens_condo")
	add_marker_trigger("vk05_greens_condo", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	trigger_enable("vk05_greens_condo")
	while (not vk05_Condo_reached) do
		thread_yield()
	end
	remove_marker_vehicle( "vk05_limo")
	remove_marker_npc("vk05_tanya")
	remove_marker_trigger("vk05_greens_condo")
	mission_waypoint_remove()
	
	thread_kill( vk05_abandon_thread )
	thread_kill( vk05_territory_thread )
	thread_kill( vk05_traffic_thread )

	audio_play_for_character( "TANYA_VK5_CAR_22", "vk05_tanya", "voice", false, true )

	cutscene_in("vk05_scene04")
	character_hide("vk05_tanya")
	character_remove_vehicle("#PLAYER#")
	cutscene_play( "vk05_scene04", "vk05_Condo")
	teleport( "#PLAYER#", "vk05_cutscene_endpoint" )
	door_lock("g_02grns_meshmver01", false)
	door_lock("g_03grns_meshmver02", false)
	cutscene_out()
	
	mission_help_table( "vk05_rescue_johnny" )
	trigger_enable("vk05_Condo_entrance")

	while (not vk05_Condo_entrance) do
		thread_yield()
	end

	for x=2,sizeof_table(vk05_CONDO_GROUP),1 do
		character_show(vk05_CONDO_GROUP[x])
		set_ignore_ai_flag(vk05_CONDO_GROUP[x],true)
	end
	
	character_show("vk05_Condo_Gat")
	human_disallow_ragdoll("vk05_Condo_Gat") 
	vk05_front_door_thread = thread_new("move_to","vk05_Condo_front_door","vk05_smoking_nav",2)
	local gat_thread2 = thread_new( "vk05_gat_sit")
	local gat_thread = thread_new( "vk05_gat_los" )

	persona_override_human_start( "vk05_Condo_Gat", "taunt - friendly fire warning", "GAT_VK5_COMBAT_2" )
	persona_override_human_start( "vk05_Condo_Gat", "threat - damage received (firearm)", "GAT_VK5_COMBAT_3" )
	
	npc_prevent_flinching( "vk05_Condo_Gat", true )
	npc_prevent_kneecapping( "vk05_Condo_Gat", true )
	add_marker_npc("vk05_Condo_Anthony", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

	while (not vk05_Green_dead) do
		thread_yield()
	end
	delay(5)
	thread_kill(gat_thread)
	thread_kill(gat_thread2)
	
	cutscene_in("vk05_scene05")
	remove_marker_npc("vk05_Condo_Anthony")
	group_destroy("vk05_Condo")
	cutscene_play( "vk05_scene05", true )
	
	mission_end_success("vk05")
end

function vk05_gat_sit()
	while (not vk05_Green_dead) do
		play_custom_action("vk05_Condo_Gat", "Johnny_TiedUp.animx") 
		--thread_yield()
	end
end

function vk05_tanya_path()
	local tanya_path = {"vk05_tanya_path01","vk05_tanya_path02","vk05_tanya_path03","vk05_tanya_path04","vk05_tanya_path05","vk05_tanya_path06"}

	move_to("vk05_tanya", tanya_path, 1)
	
	while( (not vk05_Player_returned) ) do
		thread_yield()
	end
	
	while( get_vehicle_speed("vk05_limo") > 0 ) do
		thread_yield()
	end
	
	on_detection("","vk05_tanya")

	vk05_tanya_pathing = -1
end

function vk05_driver_help()
	mission_help_table( "vk05_eliminate_driver" )
	
	while (get_dist_char_to_char("vk05_limo_driver", "vk05_tanya") < 50.0) do
		thread_yield()
	end
	
	mission_help_table( "vk05_eliminate_driver2" )
	vk05_limo_help = -1
end

function vk05_limo_path()
	persona_override_human_start("vk05_limo_driver", "taunt - vehicle hijacked", "LIMO_VK5_DAMAGE_1", 1)
	persona_override_human_start("vk05_limo_driver", "threat - vehicle hijacked", "LIMO_VK5_DAMAGE_1", 1)
	
	if (not vehicle_pathfind_to("vk05_limo", "vk05_$nav000", false )) then
		return
	end
	
	if (not vehicle_pathfind_to("vk05_limo", "vk05_$nav001", true )) then
		return
	end

	vehicle_stop("vk05_limo")

	vehicle_exit("vk05_limo_driver")
	move_to("vk05_limo_driver", "vk05_$nav002", 1 )
	delay(4)
	vehicle_enter("vk05_limo_driver", "vk05_limo", 1 )

	if (not vehicle_pathfind_to("vk05_limo", "vk05_$nav004", true )) then
		--vehicle_pathfind_to("vk05_limo", "vk05_$nav006", "vk05_$nav007", "vk05_$nav008", "vk05_limo", false )
		return
	end

	if (vehicle_pathfind_to("vk05_limo", "vk05_$nav006", "vk05_limo", false ) ) then
		mission_end_failure( "vk05", "vk05_fail_driver_survives" )
	end

	vk05_Limo_pathing = -1
end

function vk05_tanya_los()
	while (not vk05_Player_in_disguise) do
	
		if (not is_player_in_vehicle() and fov_check("vk05_tanya", "#PLAYER#") >= 0 ) then
			if ( (get_dist_char_to_char("#PLAYER#", "vk05_tanya") < 30) and los_check("vk05_tanya", "#PLAYER#") ) then
				mission_debug("seen by tanya")
				vk05_tanya_detect()
				return
			end
		end
	
		delay(2)
	end
	
	vk05_tanya_visual = -1
end

function vk05_driver_death()
	trigger_enable("vk05_player_returned")

	add_marker_trigger("vk05_player_returned", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	remove_marker_npc( "vk05_limo_driver" )

	vk05_Player_in_disguise = true
	notoriety_reset( "vice_kings" )
	notoriety_set_max( "vice_kings", 0 )
	
	if (get_char_in_vehicle("vk05_limo", 0) ~= "#PLAYER#") then
		mission_help_table( "vk05_eliminate_driver3" )
		add_marker_vehicle( "vk05_limo", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	end
	
	while (get_char_in_vehicle("vk05_limo", 0) ~= "#PLAYER#") do
		thread_yield()
	end
	
	mission_help_table( "vk05_pickup_tanya" )
	mission_waypoint_add( "vk05_studio2_gps" )
	thread_kill( vk05_Limo_pathing )
	vk05_Limo_pathing = -1
	thread_kill( vk05_limo_help )
	vk05_limo_help = -1
end

function vk05_cutscene2()

	modal_begin()
	fade_in(2)
	delay(2)

	audio_play_for_character("VOC_WMCnst_VK5Cutscene2_1","#PLAYER#","voice")
	--subtitle("Hello Miss Winters.", 1)
	delay(1.5)

	audio_play_for_character("VOC_Tanya_VK5Cutscene2_1","#PLAYER#","voice")
	--subtitle("Is Warren here?", 1)
	delay(1.5)
	
	audio_play_for_character("VOC_WMCnst_VK5Cutscene2_2","#PLAYER#","voice")
	--subtitle("He’s in the back", 1)
	delay(1.5)
	
	audio_play_for_character("VOC_Tanya_VK5Cutscene2_2","#PLAYER#","voice")
	--subtitle("Keep the car running, knowing Warren I should be back shortly.", 3.5)
	delay(4)
	
	fade_out(2)
	delay(2)
	modal_end()
end

function vk05_cutscene_tanyaKO()
	modal_begin()
	fade_in(2)
	delay(2)
	
	subtitle("[Player knocks Tanya unconscious.]",5)
	delay(6)
	
	fade_out(2)
	delay(2)
	modal_end()
end

function vk05_record_vk05_Studio_reached()
	trigger_disable("vk05_record_studio")
	vk05_Studio_reached = true
	mission_debug("Record Studio",10)
end

function vk05_limo_return()
	if (get_char_in_vehicle("vk05_limo",0)~="#PLAYER#") then
		return
	end
	
	trigger_disable("vk05_player_returned")
	remove_marker_trigger( "vk05_player_returned" )
	vk05_Player_returned = true
	if (is_player_in_vehicle()) then
		vehicle_stop( "#PLAYER#" )
	end
	mission_debug("Player returned",10)
end

function vk05_location_one_reached()
	if (get_char_in_vehicle("vk05_limo",0)~="#PLAYER#") then
		return
	end
	vehicle_stop( "#PLAYER#" )
	hud_timer_stop()
	trigger_disable( "vk05_location_one" )
	
	remove_marker_trigger("vk05_location_one")
	
	door_open("CS_C37_MeshMover01")
	door_open("CS_C37_MeshMover02")
	
	vk05_Loc_one_reached = true
	mission_debug("Location One",10)
end

function vk05_location_two_reached()
	if (get_char_in_vehicle("vk05_limo",0)~="#PLAYER#") then
		return
	end
	
	door_open("GSMeshMover01")
	door_open("GSMeshMover02")
	
	vk05_Loc_two_reached = true
	mission_debug("Location Two",10)
	
	remove_marker_trigger("vk05_location_two")
	trigger_disable( "vk05_location_two" )
	hud_timer_stop()
end

function vk05_greens_condo_reached()
	if (get_char_in_vehicle("vk05_limo",0)~="#PLAYER#") then
		return
	end

	trigger_disable("vk05_greens_condo")
	vk05_Condo_reached = true
	vehicle_stop( "#PLAYER#" )
	mission_debug("Greens Condo",10)
end

function vk05_condo_entrance()
	trigger_disable("vk05_Condo_entrance")
	trigger_enable("vk05_condo_door")
	vk05_Condo_entrance = true
	mission_debug("Condo Entrance")
end

function vk05_green_died()
	on_death("","vk05_Condo_Anthony")
	vk05_Green_dead = true
end

function vk05_gat_los()
	while (true) do
		if ((fov_check("vk05_Condo_Gat", "#PLAYER#") >= 0) and los_check("vk05_Condo_Gat", "#PLAYER#")) then
			audio_play_for_character( "GAT_VK5_COMBAT_1", "vk05_Condo_Gat", "voice", false, false, -1, 2 )
			on_take_damage( "vk05_gat_damage", "#PLAYER#" )
			return
		end
	
		thread_yield()
	end
end

function vk05_car_withdraw(car_name)
	if (vk05_Distance_threads[car_name] ~= -1) then
		mission_debug(car_name.." has withdrawn",0)
		on_damage("",car_name,0)

		remove_marker_npc( car_name.."_driver" )

		set_ignore_ai_flag( car_name.."_driver", true )
		set_ignore_ai_flag( car_name.."_pass", true )

		--character_hide(car_name.."_driver")
		--character_hide(car_name.."_pass")
		--vehicle_hide(car_name)
		vehicle_flee(car_name)

		vk05_withdraw_count = vk05_withdraw_count + 1
	end
end

function vk05_evade_car(car_name)
	local handle = mission_debug("Car: "..get_dist_char_to_vehicle("#PLAYER#",car_name),0)
	delay(25)
	while (true) do
		mission_debug("Car: "..get_dist_char_to_vehicle("#PLAYER#",car_name),0, handle)
		
		if (get_dist_char_to_char("#PLAYER#",car_name.."_driver") >= VK05_EVADE_DISTANCE) then
			vk05_car_withdraw(car_name)
			vk05_Distance_threads[car_name] = -1
			return
		else
			attack(car_name.."_driver", "vk05_tanya")
			attack(car_name.."_pass", "vk05_tanya")
			delay(5)
		end

		thread_yield()
	end
end

function vk05_tanya_dist()
	while (true) do
		if (get_dist_char_to_char("#PLAYER#", "vk05_tanya") > 100.0) then 
			vk05_tanya_abandoned()
			return
		end
		delay(5)
	end
end

function vk05_condo_door()
	trigger_disable("vk05_condo_door")
	trigger_enable("vk05_condo_bedroom01")
	trigger_enable("vk05_condo_bedroom02")
	
	thread_kill(vk05_front_door_thread)
	vk05_front_door_thread = -1

	for x=2,sizeof_table(vk05_CONDO_GROUP),1 do
		set_ignore_ai_flag(vk05_CONDO_GROUP[x],false)
	end
end

function vk05_bedroom()
	trigger_disable("vk05_condo_bedroom01")
	trigger_disable("vk05_condo_bedroom02")
	
	persona_override_persona_start("SP_GREEN", "threat - alert (solo attack)", "GREEN_VK5_ATTACK")
	persona_override_persona_start("SP_GREEN", "threat - alert (group attack)", "GREEN_VK5_ATTACK") 
	persona_override_persona_start("SP_GREEN", "threat - damage received (firearm)", "GREEN_VK5_DAMAGE", 1) 
	
	attack( "vk05_Condo_Anthony" )
	
end

function vk05_julius_phone_call()
	audio_play("SYS_CELL_RING","foley")
	delay(1)
	audio_play_for_character("JULIUS_VK5_PHONE_1","#PLAYER#","voice",false,true)
end

vk05_tanya_audio_table = 
{
	{.9, "TANYA_VK5_NOTICE_2", false},
	{.7, "TANYA_VK5_NOTICE_3", false},
	{.4, "TANYA_VK5_NOTICE_4", false},
	{.3, "TANYA_VK5_CAR_19", false},
	{.2, "TANYA_VK5_CAR_20", false},
}
vk05_tanya_damage_playing = false

vk05_initial_hitpoints = 10000

function vk05_tanya_damage(target, attacker )
	if (attacker == "#PLAYER#") then
		vk05_tanya_detect()
		return
	end
	
	if (not vk05_Loc_two_reached) then
		return
	end
	
	if (vk05_tanya_damage_playing) then
		return
	end
	
	local health = get_current_hit_points( "vk05_limo" ) / vk05_initial_hitpoints
	
	mission_debug( health, 6 )
	
	vk05_tanya_damage_playing = true
	
	local table_size = sizeof_table( vk05_tanya_audio_table )
	
	for x=1, table_size, 1 do
		if (health <= vk05_tanya_audio_table[x][1] and not vk05_tanya_audio_table[x][3]) then
			audio_play_for_character( vk05_tanya_audio_table[x][2], "vk05_tanya", "voice", false, true )
			vk05_tanya_audio_table[x][3] = true
			break
		end
	end
	
	vk05_tanya_damage_playing = false
end

vk05_gat_audio_table = 
{
	{.8, "GAT_VK5_COMBAT_5", false},
	{.4, "GAT_VK5_COMBAT_6", false},
}
vk05_gat_damage_playing = false
function vk05_gat_damage( human, attacker, health )
	if (vk05_gat_damage_playing or (attacker ~= "vk05_Condo_Anthony") ) then
		return
	end
	
	mission_debug( health, 6 )
	
	vk05_gat_damage_playing = true
	
	local table_size = sizeof_table( vk05_gat_audio_table )

	for x=1, table_size, 1 do
		if (health <= vk05_gat_audio_table[x][1] and not vk05_gat_audio_table[x][3]) then
			audio_play_for_character( vk05_gat_audio_table[x][2], "vk05_Condo_Gat", "voice", false, true )
			vk05_gat_audio_table[x][3] = true
			break
		end
	end
	
	vk05_gat_damage_playing = false
end

function vk05_territory_containment()

	local vk_territory = false
	local voice_thread = -1

	while (true) do
		local hood = get_current_hood_by_position( "#PLAYER#" )
	
		vk_territory = ((hood == "vk_downtown01") or (hood == "vk_downtown02") or (hood == "vk_downtown03") or (hood == "vk_downtown04") or (hood == "vk_downtown05") or (hood == "vk_highend01") or (hood == "vk_highend02") or (hood == "vk_museum01") or (hood == "vk_museum02") or (hood == "wr_suburb03")  )
		
		if ( (not vk_territory) and (voice_thread == -1) ) then
			voice_thread = thread_new( "vk05_territory_voice" )
			mission_debug( "voice started", 6 )
		elseif( vk_territory and (voice_thread ~= -1) ) then
			thread_kill( voice_thread )
			voice_thread = -1
			mission_debug( "voice ended", 6 )
		end

		delay(2)

	end
end

function vk05_territory_voice()
	audio_play_for_character( "TANYA_VK5_CAR_16", "vk05_tanya", "voice", false, true )
	delay( rand_float( 1.5, 4 ) * 60 )
	audio_play_for_character( "TANYA_VK5_CAR_17", "vk05_tanya", "voice", false, true )
end

function vk05_chatter1()
	while (vk05_complaint_number < 10) do
		delay( rand_float(4.5,7.5) )
		while (human_voice_is_playing("vk05_tanya")) do
			thread_yield()
		end
		delay(1)
		audio_play_for_character( "TANYA_VK5_BITCH_"..vk05_complaint_number, "vk05_tanya", "voice", false, true )
		vk05_complaint_number = vk05_complaint_number + 1
	end
end

function vk05_traffic_voice()

	vk05_traffic_paused = false
	
	local low_speed_time = 0
	local high_speed_time = 0
	
	local handle = mission_debug( low_speed_time.." "..high_speed_time, 0 )

	while (true) do
	
		if (not vk05_traffic_paused) then
		
			if (get_vehicle_speed("vk05_limo") <= 5) then
				low_speed_time = low_speed_time + delay_do()

				if (low_speed_time >= 15) then
					if (rand_float(0,1) > .55) then
						audio_play_for_character( "TANYA_VK5_COMPLAIN_"..rand_int(1,10), "vk05_tanya", "voice", false, true )
					end
					low_speed_time = 0
				end

				high_speed_time = 0
				
			elseif (low_speed_time > 0) then
				high_speed_time = high_speed_time + delay_do()
				
				if (high_speed_time > 20) then
					low_speed_time = 0
					high_speed_time = 0
				end
			end
			
			mission_debug( low_speed_time.." "..high_speed_time, 0, handle )
		else
			mission_debug( "traffic paused", 0, handle )
		end
		
		thread_yield()
	
	end

end

function vk05_ambush_kill_danger()
	mission_help_table_nag( "vk05_damage_warning" )
end

-- MISSION FAILURE CALLBACKS ----------------------------------------------------------------
function vk05_ambush_failure()
	mission_debug("killed a saint", 10)
	mission_end_failure( "vk05", "vk05_fail_saint_death" )
end

function vk05_tanya_detect()
	if (Vk05_tanya_detected) then
		return
	end
	
	mission_debug("tanya detection")
	Vk05_tanya_detected = true
	audio_play_for_character( "TANYA_VK5_NOTICE_1", "vk05_tanya", "voice", false, true, -1, 3 )
	delay(1)
	if (is_vehicle_destroyed("vk05_limo")) then
		mission_end_failure( "vk05", "vk05_fail_limo_destroyed" )
	elseif is_dead("vk05_tanya") then
		mission_end_failure( "vk05", "vk05_fail_tanya_death" )
	else
		mission_end_failure( "vk05", "vk05_fail_tanya_detect" )
	end
end

function vk05_tanya_death()
	delay(3)
	mission_end_failure( "vk05", "vk05_fail_tanya_death" )
end

function vk05_limo_destroyed()
	delay(3)
	mission_end_failure( "vk05", "vk05_fail_limo_destroyed" )
end

function vk05_timer()
	mission_end_failure( "vk05", "vk05_fail_timer" )
end

function vk05_tanya_abandoned()
	mission_end_failure("vk05", "vk05_fail_tanya_abandoned")
end