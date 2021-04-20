-- vk08.lua
-- script for VK Mission 8
-- created 1/25/05

-- GLOBAL VARIABLES ---------------------

vk08_HIDEOUT1_GROUP = {"vk08_hide1-01", "vk08_hide1-02", "vk08_hide1-03"}
vk08_HIDEOUT2_GROUP = {"vk08_hide2-01", "vk08_hide2-02", "vk08_hide2-03"}
vk08_HIDEOUT3_GROUP = {"vk08_hide3-01", "vk08_hide3-02", "vk08_hide3-03"}

vk08_HIDEOUT_LOCATIONS = {"vk08_hideout1", "vk08_hideout3", "vk08_hideout2"}
vk08_HIDEOUT_GROUPS = {"vk08_Hideout1","vk08_Hideout3","vk08_Hideout2"}
vk08_HIDEOUT_TABLES = {vk08_HIDEOUT1_GROUP, vk08_HIDEOUT3_GROUP, vk08_HIDEOUT2_GROUP}

vk08_HELP_TEXT={	"The first hideout is on the north side of the VK 'burbs.",
					"The next hideout is downtown.",
					"The last hideout is in museum."}

vk08_KING_START_LINES = {"KING_VK8_START_1", "KING_VK8_START_3", "KING_VK8_START_4"}
vk08_KING_COP_LINES = {"KING_VK8_COPS_1", "KING_VK8_COPS_3", "KING_VK8_COPS_4"}
vk08_KING_PUTZ_LINES = {"KING_VK8_CAR_1", "KING_VK8_CAR_2", "KING_VK8_CAR_3"}


vk08_hideout_eliminated = {false, false, false}
vk08_current_hideout = 1
vk08_done_once = false
vk08_done_twice = false
vk08_police_arrival = false
vk08_cutscene_playing = false


-- FUNCTIONS ----------------------------

function vk08_success()
	message("You're the Winner!")
	hood_set_owner("vk_downtown04","Playas")
	radio_post_event("NEWS_PRES_MONROE_2", false)
end

function vk08_cleanup()
	mission_waypoint_remove()
	--confessionals_enable(true)
	notoriety_reset("police")
	notoriety_reset("vice_kings")
	spawn_override_set_category("")
	distance_display_off()
	persona_override_remove_all("SP_KING")
	for x=1, sizeof_table(vk08_HIDEOUT_LOCATIONS), 1 do
		trigger_disable( vk08_HIDEOUT_LOCATIONS[x] )
		
		minimap_icon_remove_navpoint( vk08_HIDEOUT_LOCATIONS[ vk08_current_hideout ] )
		
		on_death( "", vk08_HIDEOUT_GROUPS[ x ].."_car1" )
		on_death( "", vk08_HIDEOUT_GROUPS[ x ].."_car2" )
		
		on_take_damage( "", vk08_HIDEOUT_GROUPS[ x ].."_car1" )
		on_take_damage( "", vk08_HIDEOUT_GROUPS[ x ].."_car2" )
		
		on_vehicle_destroyed( "", vk08_HIDEOUT_GROUPS[ x ].."_chase_car" )
		on_take_damage( "", vk08_HIDEOUT_GROUPS[ x ].."_chase_car" )
		remove_marker_vehicle( vk08_HIDEOUT_GROUPS[ x ].."_chase_car" )
		
		remove_marker_npc( vk08_HIDEOUT_GROUPS[ x ].."_car1" )
		remove_marker_npc( vk08_HIDEOUT_GROUPS[ x ].."_car2" )
		release_to_world( vk08_HIDEOUT_GROUPS[x] )
		release_to_world( vk08_HIDEOUT_GROUPS[x].."_chase")
	end
	
	for x=1, sizeof_table(vk08_HIDEOUT_TABLES), 1 do
		for y=1, sizeof_table(vk08_HIDEOUT_TABLES[x]), 1 do
			--on_death( "", vk08_HIDEOUT_TABLES[x][y])
			on_take_damage( "", vk08_HIDEOUT_TABLES[x][y] )
			--on_detection( "", vk08_HIDEOUT_TABLES[x][y] )
			remove_marker_npc(vk08_HIDEOUT_TABLES[x][y])
		end
	end

	release_to_world( "vk08_Police" )
	destroy_group( "vk08_Group" )
	
	remove_marker_navpoint( "vk08_police_station" )

	trigger_disable("vk08_police_station")
end

function vk08_create_police()
	create_group( "vk08_Police", true )
	for x=1,8,1 do
		turn_invulnerable( "vk08_Police_0"..x, false )
		set_ignore_ai_flag( "vk08_Police_0"..x, true )
	end
	for x=1,4,1 do
		set_unjackable_flag( "vk08_Police_car"..x, true )
	end
end

function vk08_julius_conv()
	delay(9)
	for i=1,10,1 do
		voice_block("vk08_BenjaminKing")
		audio_play_for_character("KING_VK8_CHATTER_"..i, "vk08_BenjaminKing", "voice", false, true)
		if (i==2) or (i==4) or (i==6) or (i==8) then
			delay(0.5)
		else
			delay(rand_int(3,4))
		end
	end
end

function vk08_start()
	--set_mission_author("Russell Aasland")
	vk08_cutscene_playing = false
	set_mission_author("Sandeep Shekar")
	--confessionals_enable(false)
	persona_override_persona_start("SP_KING", "threat - damage received (firearm)", "KING_VK8_CAR_4", 1)
	persona_override_persona_start("SP_KING", "threat - damage received (firearm)", "KING_VK8_CAR_5", 1)
	persona_override_persona_start("SP_KING", "threat - damage received (firearm)", "KING_VK8_DAMAGE", 5)
	
	persona_override_persona_start("SP_KING", "combat - congratulate player", "KING_VK8_GRATPC", 5)
	
	persona_override_persona_start("SP_KING", "escort - stripper reacts to hitting human", "KING_VK8_RUNOVERPED", 5)
	persona_override_persona_start("SP_KING", "escort - stripper reacts to hitting vehicle", "KING_VK8_HITOBJECT", 5)

	notoriety_set_max("police", 0)
	--notoriety_set_max("vice_kings", 1)
	--spawn_override_set_category("VK08 Spawn")
	for x=1, sizeof_table(vk08_HIDEOUT_LOCATIONS), 1 do
		on_trigger( "vk08_hideout_arrival", vk08_HIDEOUT_LOCATIONS[x] )
	end

	on_trigger("vk08_arrive_police","vk08_police_station")
	
	for x=1, sizeof_table(vk08_HIDEOUT_TABLES), 1 do
		for y=1, sizeof_table(vk08_HIDEOUT_TABLES[x]), 1 do
			--on_death("vk08_killed", vk08_HIDEOUT_TABLES[x][y])
			on_take_damage( "vk08_damaged", vk08_HIDEOUT_TABLES[x][y] )
			on_detection( "vk08_damaged", vk08_HIDEOUT_TABLES[x][y] )
		end
		
		on_take_damage( "vk08_damaged", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1" )
		on_take_damage( "vk08_damaged", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2" )
		on_take_damage( "vk08_damaged", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car" )
		
		vk08_hideout_eliminated[x] = false
	end

	cutscene_in("vk08_scene01")
	cutscene_play("vk08_scene01", "vk08_Group")
	
	character_show( "vk08_BenjaminKing" )
	
	party_dismiss( "#FOLLOWER3#" );
	party_add( "vk08_BenjaminKing" )
	
	on_death( "vk08_king_killed", "vk08_BenjaminKing" )
	on_dismiss( "vk08_king_abandoned", "vk08_BenjaminKing" )
	never_die( "vk08_BenjaminKing", true )
	teleport("#PLAYER#", "mission_start_vk08")
	cutscene_out()
	
	delay(2)
	mission_help_table( "vk08_find_car" )

	while( not is_player_in_vehicle( ) ) do
		thread_yield()
	end
	
	local chase_running = false
	local conv_thread = -1
	
	for x = 1, sizeof_table(vk08_HIDEOUT_GROUPS), 1 do
		delay(5)
		vk08_current_hideout = x
		mission_debug(vk08_current_hideout,0,0)
		mission_debug(vk08_HIDEOUT_LOCATIONS[vk08_current_hideout],0,1)
		combat_enable( "vk08_BenjaminKing" )

		
		audio_play_for_character(vk08_KING_START_LINES[ vk08_current_hideout ], "vk08_BenjaminKing", "voice", false, true)
		mission_help_table( "vk08_locate_hideout" )
		minimap_icon_add_navpoint( vk08_HIDEOUT_LOCATIONS[ vk08_current_hideout ], MINIMAP_ICON_LOCATION )
		trigger_enable( vk08_HIDEOUT_LOCATIONS[ vk08_current_hideout ] )
		
		if (vk08_current_hideout == 2) then
			mission_waypoint_add("vk08_hideout3_gps")
		elseif (vk08_current_hideout == 3) then
			mission_waypoint_add("vk08_hideout2_gps")
		else
			mission_waypoint_add("vk08_hideout1_gps")
			conv_thread = thread_new("vk08_julius_conv")
		end
		
		create_group( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ], true )
		create_group(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase",true)
		
		turn_invulnerable(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1", false)
		turn_invulnerable(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2", false)
	
		while (not vk08_hideout_eliminated[ vk08_current_hideout ]) do
			thread_yield()
		end
		
		mission_waypoint_add("vk08_police_gps")
		
		if (conv_thread ~= -1) then
			thread_kill(conv_thread)
			conv_thread = -1
		end
		
		notoriety_set_min("vice_kings", x)
		
		chase_running = true
		
		vk08_police_arrival = false
		add_marker_trigger( "vk08_police_station", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
		trigger_enable( "vk08_police_station" )
		
		distance_display_on(get_char_in_vehicle(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car",0), 0, 300, 75, 75) 
		
		while (not vk08_police_arrival) do
			if (chase_running and (get_dist_char_to_vehicle("#PLAYER#", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car") > 75.0)) then
				trigger_disable( "vk08_police_station" )
				mission_help_table_nag("vk08_lost_them")
				vehicle_stop(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car")
				chase_running = false
			end
			
			if (not chase_running and (get_dist_char_to_vehicle("#PLAYER#", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car") < 75.0)) then
				notoriety_set_min("vice_kings", x)
				trigger_enable( "vk08_police_station" )
				mission_help_table_nag( "vk08_bring_to_police" )
				vehicle_chase( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car", "#PLAYER#", false)
				chase_running = true
			end
			
			thread_yield()
		end
		
		while (vk08_cutscene_playing) do
			thread_yield()
		end
		
		distance_display_off()
	end
	notoriety_reset("vice_kings")

	player_controls_disable()
	if (is_player_in_vehicle()) then
		vehicle_stop("#PLAYER#")
	end
	audio_play_for_character("KING_VK8_CAR_6", "vk08_BenjaminKing", "voice", false, true)
	if (is_player_in_vehicle()) then
		vehicle_exit_do("vk08_BenjaminKing")
	end
	delay(1)
	player_controls_enable()
	mission_end_success("vk08")
end

function vk08_hideout_arrival()
	mission_debug("arrived",5)
	trigger_disable( vk08_HIDEOUT_LOCATIONS[ vk08_current_hideout ] )
	
	mission_help_table( "vk08_attention" )
	
	local chase_carname = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car"
	local chase_guy1 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1"
	local chase_guy2 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2"
	
	minimap_icon_remove_navpoint( vk08_HIDEOUT_LOCATIONS[ vk08_current_hideout ] )
	
	add_marker_vehicle(chase_carname, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	add_marker_npc(chase_guy1, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
	add_marker_npc(chase_guy2, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
	
	--make invulnerable except to the player
	turn_invulnerable( chase_guy1, false )
	turn_invulnerable( chase_guy2, false )
	turn_invulnerable( chase_carname, false )
	set_unjackable_flag( chase_carname, true )

	on_vehicle_destroyed( "vk08_car_destroyed", chase_carname )
	on_death( "vk08_driver_killed", chase_guy1 )
	on_death( "vk08_driver_killed", chase_guy2 )
	vk08_done_once = false
	vk08_done_twice = false
end

function vk08_entercar()
	local chase_carname = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car"
	local chase_guy2 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2"

	vehicle_enter( chase_guy2, chase_carname, 1 )
end

vk08_putz_line = false

function vk08_dumbass(target, attacker)
	if (attacker ~= "#PLAYER#") or (vk08_putz_line) then
		return
	end
	
	vk08_putz_line = true
	
	local chase_carname = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car"
	local chase_guy1 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1"
	local chase_guy2 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2"
	
	on_take_damage( "", chase_guy1 )
	on_take_damage( "", chase_guy2 )
	on_take_damage( "", chase_carname )

	voice_block("vk08_BenjaminKing")
	
	audio_play_for_character(vk08_KING_PUTZ_LINES[ vk08_current_hideout ], "vk08_BenjaminKing", "voice", false, true)		
	vk08_putz_line = false
end

function vk08_damaged()
	if (vk08_done_once) then
		return
	end
	vk08_done_once = true
	audio_play_for_character(vk08_KING_COP_LINES[ vk08_current_hideout ], "vk08_BenjaminKing", "voice", false, false)

	local current_table = vk08_HIDEOUT_TABLES[ vk08_current_hideout ]
	local chase_carname = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car"
	local chase_guy1 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1"
	local chase_guy2 = vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2"
	
	for y=1, sizeof_table(vk08_HIDEOUT_TABLES[vk08_current_hideout]), 1 do
		--on_death("vk08_killed", vk08_HIDEOUT_TABLES[x][y])
		on_take_damage( "", vk08_HIDEOUT_TABLES[vk08_current_hideout][y] )
		on_detection( "", vk08_HIDEOUT_TABLES[vk08_current_hideout][y] )
	end
		

	on_take_damage( "", chase_guy1 )
	on_take_damage( "", chase_guy2 )
	on_take_damage( "", chase_carname )

	for x=1, sizeof_table(current_table), 1 do
		set_ignore_ai_flag( current_table[x], false )
		on_take_damage( "", current_table[x] )
	end

	--thread_new( "vk08_vehicle_enter_wrap", chase_guy1, chase_carname, 0 )
	--thread_new( "vk08_vehicle_enter_wrap", chase_guy2, chase_carname, 1 )

	set_unjackable_flag( chase_carname, false )
	
	npc_go_idle(chase_guy1)
	npc_go_idle(chase_guy2)
	
	set_ignore_ai_flag( chase_guy2, true )
	set_ignore_ai_flag( chase_guy1, true )
	
	--thread_new("vk08_entercar")	
	vehicle_enter_group( chase_guy1, chase_guy2, chase_carname )
	
	while (get_char_in_vehicle(chase_carname, 0) == nil) do
		vehicle_enter_group( chase_guy1, chase_guy2, chase_carname )
		thread_yield()
	end
	
	remove_marker_npc(chase_guy1)
	remove_marker_npc(chase_guy2)
	--add_marker_vehicle(chase_carname, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	
	set_ignore_ai_flag( chase_guy2, false )
	set_ignore_ai_flag( chase_guy1, false )
	
	set_attack_player_flag( chase_guy2, true )
	set_attack_player_flag( chase_guy1, true )
	
	set_unjackable_flag( chase_carname, true )
	
	vehicle_supress_npc_exit( chase_carname, true )
	vehicle_chase( chase_carname, "#PLAYER#", false)
	attack( chase_guy2, "#PLAYER#" )

	combat_disable( "vk08_BenjaminKing" )

	vk08_hideout_eliminated[ vk08_current_hideout ] = true
	
	
	mission_help_table( "vk08_bring_to_police" )
	thread_new("vk08_create_police")
	delay(7)
	mission_help_table_nag("vk08_keep_them_near")
	on_take_damage( "vk08_dumbass", chase_guy1 )
	on_take_damage( "vk08_dumbass", chase_guy2 )
	on_take_damage( "vk08_dumbass", chase_carname )
end

function vk08_vehicle_enter_wrap( name, car, seat )
	vehicle_enter( name, car, seat )
	set_ignore_ai_flag( name, true )
end

function vk08_killed()
	--[[local current_table = vk08_HIDEOUT_TABLES[ vk08_current_hideout ]
	
	for x=1, sizeof_table(current_table), 1 do
		if (not is_dead(current_table[x])) then
			return
		end
	end

	vk08_hideout_eliminated[ vk08_current_hideout ] = true]]
end

vk08_car_thread = -1

function vk08_arrive_police()
	trigger_disable("vk08_police_station")
	remove_marker_navpoint( "vk08_police_station" )
	remove_marker_vehicle( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car" )
	remove_marker_npc( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1" )
	remove_marker_npc( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2" )
	vk08_police_arrival = true
	vk08_cutscene_playing = true
	
	vk08_car_thread = -1
	
	cutscene_in()
	radio_off()
	scripted_cutscene_play("vk08_arrive_cutscene", "vk08_arrive_cutscene_end")
	--thread_new_block("vk08_arrive_cutscene")
	--destroy_group( "vk08_Police" )
	thread_kill(vk08_car_thread)
	release_to_world( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase" )
	radio_on()
	
	vk08_cutscene_playing = false
	fade_in(0.8)
	
	while (get_dist_char_to_char("#PLAYER#", "vk08_Police_01") < 400.0) do
		thread_yield()
	end
	
	group_destroy("vk08_Police")
end

function vk08_car_stuff(car)
	vehicle_speed_override(car, 55)
	vehicle_pathfind_to(car, "vk08_chase_path1", "vk08_chase_path2", true, true)
	vehicle_stop( car )
	vk08_car_thread = -1
end

function vk08_arrive_cutscene()
	modal_begin()
	camera_look_through("vk08_camera1")
	
	if (is_player_in_vehicle()) then
		teleport_vehicle("#PLAYER#","vk08_player_teleport")
	else
		teleport("#PLAYER#","vk08_player_teleport")
	end
	
	fade_in(2)
	
	vk08_car_thread = thread_new("vk08_car_stuff", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car")
	--teleport_vehicle( vk08_HIDEOUT_GROUPS[vk08_current_hideout].."_chase_car", "vk08_police_station")
	
	for x=1,8,1 do
		thread_new( "vk08_cop_thread", "vk08_Police_0"..x )
	end
	
	fade_in_block(2)
	
	turn_vulnerable( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1" )
	turn_vulnerable( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2" )
	turn_vulnerable( vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car" )

	on_death( "", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1" )
	on_death( "", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car2" )
	on_vehicle_destroyed( "", vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car" )
	
	delay(3)
	vehicle_detonate( vk08_HIDEOUT_GROUPS[vk08_current_hideout].."_chase_car")
	delay(1)
	
	for x=1,8,1 do
		set_ignore_ai_flag( "vk08_Police_0"..x, true )
	end
	

	fade_out(2)
	delay(2)
	modal_end()
end

function vk08_arrive_cutscene_end()
	camera_end_script()
	player_controls_enable()
	if not is_vehicle_destroyed(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car") then
		vehicle_hide(vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_chase_car")
	end
end

function vk08_cop_thread( name )
	set_ignore_ai_flag(name, false)
	npc_unholster_best_weapon( name )
	attack( name, vk08_HIDEOUT_GROUPS[ vk08_current_hideout ].."_car1" )
end

function vk08_car_destroyed()
	mission_end_failure( "vk08", "vk08_fail_vk_car" )
end

function vk08_driver_killed()
	mission_end_failure( "vk08", "vk08_fail_vk_driver" )
end

function vk08_king_killed()
	mission_end_failure( "vk08", "vk08_fail_king_death" )
end

function vk08_king_abandoned()
	mission_end_failure( "vk08", "vk08_king_abandoned" )
end