-- milestoneone_V9.lua
-- scripts for Mission VK9
-- created 1/17/05

-- Global Variables------


VK09_PARKING_LOT_TRIGGERS = 1

vk09_Penthouse_reached = false
vk09_Elevator_reached = false
vk09_Boardroom_reached = false
vk09_Tanya_dead = false
vk09_Parking_lot_once = false

vk09_interrogration_done = false

vk09_destination = "none"

vk09_Lobby_body_count = 0
vk09_LOBBY_GROUP = {"vk09_lobby_reception","vk09_lobby_lw_stairs","vk09_lobby_lw_fore","vk09_lobby_lw_center","vk09_lobby_lw_rear", "vk09_lobby_rw_stairs","vk09_lobby_rw_fore","vk09_lobby_rw_center","vk09_lobby_rw_rear"}
vk09_ELEVATOR_GROUP = {"vk09_lobby_elevator1","vk09_lobby_elevator2","vk09_lobby_elevator3"}
vk09_LOBBY_TOTAL = sizeof_table(vk09_LOBBY_GROUP)
-- + sizeof_table(vk09_ELEVATOR_GROUP)

vk09_Penthouse_body_count = 0
vk09_RECEPTION_GROUP = {"vk09_penthouse_reception_center", "vk09_penthouse_near_office1","vk09_penthouse_near_office2","vk09_penthouse_near_office3","vk09_penthouse_near_office4"}
vk09_RECROOM_GROUP = {"vk09_penthouse_recroom1","vk09_penthouse_recroom2","vk09_penthouse_shotgun1","vk09_penthouse_shotgun2","vk09_penthouse_recroom_uw","vk09_penthouse_upper_recroom"}
vk09_FAR_OFFICE_GROUP = {"vk09_penthouse_faroffice1","vk09_penthouse_faroffice2","vk09_penthouse_faroffice3","vk09_penthouse_faroffice4","vk09_penthouse_faroffice5"}
vk09_PENTHOUSE_TOTAL = sizeof_table(vk09_RECEPTION_GROUP)+sizeof_table(vk09_RECROOM_GROUP)+sizeof_table(vk09_FAR_OFFICE_GROUP)

vk09_BAR_GROUP = {"vk09_bar01","vk09_bar02","vk09_bar03","vk09_bar04"}
vk09_UPPER_REC_GROUP = {"vk09_upper_rec01","vk09_upper_rec02","vk09_upper_rec03","vk09_upper_rec04","vk09_bedroom_male","vk09_bedroom_female"}

vk09_BOSS_HOES = {"vk09_boss_ho1","vk09_boss_ho2","vk09_boss_ho3","vk09_boss_ho4","vk09_boss_ho5","vk09_boss_ho6"}

Vk09_interrogating = false

-- FUNCTIONS ----------------------------


function vk09_test_lobby_door()
	mesh_mover_play_action( "vk09_lobby_door", "start1" )
end
function vk09_test_penthouse_door()
	mesh_mover_play_action( "vk09_penthouse_door", "start1" )
end

-- ----Mission VK09------------------------

function vk09_cleanup( was_theater )
	spawning_on()
	camera_end_script()
	player_controls_enable()
	
	mission_waypoint_remove()
	
	if (Vk09_interrogating) then
		vehicle_interrogation_end("vk09_BenjaminKing")
	end

	on_dismiss("","vk09_BenjaminKing")
	on_death("","vk09_BenjaminKing")
	
	on_death("","vk09_JohnnyGat")
	on_dismiss("","vk09_JohnnyGat")
	
	on_ragdoll_collision("", "vk09_Stephan")
	
	on_death("","vk09_Tanya_boss")
	
	on_vehicle_destroyed( "", "vk09_BenjaminCar" )
	on_entered_water("", "vk09_BenjaminCar" )
	on_vehicle_enter( "", "vk09_BenjaminCar" )
	on_vehicle_exit( "", "vk09_BenjaminCar" )

	party_dismiss( "vk09_BenjaminKing" )
	party_dismiss( "vk09_JohnnyGat" )
	
	party_set_recruitable(true)

	for x=1, sizeof_table( vk09_LOBBY_GROUP ), 1 do
		on_death( "", vk09_LOBBY_GROUP[x] )
		remove_marker_npc( vk09_LOBBY_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_ELEVATOR_GROUP ), 1 do
		on_death( "", vk09_ELEVATOR_GROUP[x] )
		remove_marker_npc( vk09_ELEVATOR_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_RECEPTION_GROUP ), 1 do
		on_death( "", vk09_RECEPTION_GROUP[x] )
		remove_marker_npc( vk09_RECEPTION_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_RECROOM_GROUP ), 1 do
		on_death( "", vk09_RECROOM_GROUP[x] )
		remove_marker_npc( vk09_RECROOM_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_FAR_OFFICE_GROUP ), 1 do
		on_death( "", vk09_FAR_OFFICE_GROUP[x] )
		remove_marker_npc( vk09_FAR_OFFICE_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_BAR_GROUP ), 1 do
		on_death( "", vk09_BAR_GROUP[x] )
		remove_marker_npc( vk09_BAR_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_UPPER_REC_GROUP ), 1 do
		on_death( "", vk09_UPPER_REC_GROUP[x] )
		remove_marker_npc( vk09_UPPER_REC_GROUP[x] )
	end

	if (not is_demo_execution() or not vk09_Tanya_dead) then
		remove_marker_vehicle( "vk09_BenjaminCar" )
		release_to_world( "vk09_BenjaminCar" )
		group_destroy("vk09_Group")
		group_destroy( "vk09_stephan_group", true )
		release_to_world("vk09_penthouse_reception")
		release_to_world("vk09_penthouse_recroom")
		release_to_world("vk09_penthouse_faroffice")
		release_to_world("vk09_upper_bar")
		release_to_world("vk09_upper_rec_billards")
	end

	group_destroy("vk09_boss_fight")
	release_to_world("vk09_lobby")
	release_to_world("vk09_lobby_elevator_group")
	
	for x=1, VK09_PARKING_LOT_TRIGGERS, 1 do
		on_trigger( "", "vk09_parking_lot"..x )
		on_trigger_exit( "", "vk09_parking_lot"..x )
		trigger_disable( "vk09_parking_lot"..x )
	end
	
	hud_bar_set_current_bar(1)
	hud_bar_off()
	hud_bar_set_value( 0 )
	hud_bar_set_current_bar(0)
	hud_bar_off()
	hud_bar_set_value( 0 )
	
	on_trigger("","vk09_penthouse_entrance")
	on_trigger("","vk09_penthouse_exit")
	on_trigger("","vk09_elevator_entrance")
	on_trigger("","vk09_failsafe")
	on_trigger("","vk09_boardroom_entrance")
	on_trigger("","vk09_boss_group_load_trigger")
	on_trigger("","vk09_recroom_entrance")
	on_trigger("","vk09_bar_exit")
	on_trigger("","vk09_spiral_staircase")
	on_trigger("","vk09_penthouse_street" )
	on_trigger("","vk09_impressions")
	on_trigger("", "vk09_elevator_open")
	
	trigger_disable("vk09_bar_exit")
	trigger_disable("vk09_boardroom_entrance")
	trigger_disable("vk09_boss_group_load_trigger")
	trigger_disable("vk09_elevator_entrance")
	trigger_disable("vk09_penthouse_entrance")
	trigger_disable("vk09_penthouse_exit")
	trigger_disable("vk09_recroom_entrance")
	trigger_disable("vk09_spiral_staircase")
	trigger_disable( "vk09_penthouse_street" )
	trigger_disable("vk09_impressions")
	trigger_disable("vk09_elevator_open")
	trigger_disable("vk09_failsafe")
	remove_marker_vehicle("vk09_BenjaminCar")
	remove_marker_trigger("vk09_elevator_entrance")
	remove_marker_npc( "vk09_Tanya_boss" )
	remove_marker_trigger("vk09_parking_lot1")
	remove_marker_trigger("vk09_impressions")

	minimap_icon_remove_navpoint("vk09_boardroom_entrance")
	
	if (vk09_Elevator_reached and not vk09_Tanya_dead) then
		teleport( "#PLAYER#", "vk09_end_mission_nav" )
		teleport( "#FOLLOWER1#", "vk09_end_mission_follower" )
	end
	
	if (was_theater) then
		trigger_enable("downtown_$crib_warp_penthouse")
		trigger_enable("downtown_$crib_warp_garage")
		trigger_enable("downtown_$crib_warp_front")
	end
end

function vk09_success()
	unlockable_unlock("vk09")
	unlockable_unlock("vk09_2")
	unlockable_unlock("vk09_3")
	trigger_enable("downtown_$crib_save000")
	trigger_enable("downtown_$crib_warp_penthouse")
	ingame_effect_add_trigger("downtown_$crib_warp_penthouse", INGAME_EFFECT_LOCATION)
	trigger_enable("downtown_$crib_warp_garage")
	ingame_effect_add_trigger("downtown_$crib_warp_garage", INGAME_EFFECT_LOCATION)
	trigger_enable("downtown_$crib_warp_front")
	ingame_effect_add_trigger("downtown_$crib_warp_front", INGAME_EFFECT_LOCATION)
	
	hood_set_owner("vk_downtown03","Playas")
	
	mesh_mover_reset_to_action_end( "vk09_office_door1", "start1" )
	mesh_mover_reset_to_action_end( "vk09_office_door2", "start1" )
	mesh_mover_reset_to_action_end( "vk09_office_door3", "start1" )
	mesh_mover_reset_to_action_end( "vk09_office_door4", "start1" )
end

function audio_test()
	audio_play_for_character( "KING_VK9_START_1", "vk09_BenjaminKing", "voice", false, true )
end

function vk09_start()
	set_mission_author("Russell Aasland")
	Vk09_interrogating = false
	vk09_trigger_count = 0
	for x=1, VK09_PARKING_LOT_TRIGGERS, 1 do
		on_trigger( "vk09_parking_enter", "vk09_parking_lot"..x )
		on_trigger_exit( "vk09_parking_exit", "vk09_parking_lot"..x )
	end
	
	for x=1, sizeof_table( vk09_LOBBY_GROUP ), 1 do
		on_death( "vk09_lobby_death", vk09_LOBBY_GROUP[x] )
	end

	for x=1, sizeof_table( vk09_ELEVATOR_GROUP ), 1 do
		on_death( "vk09_elevator_death", vk09_ELEVATOR_GROUP[x] )
		vk09_handles[x] = -1
	end
	
	for x=1, sizeof_table( vk09_RECEPTION_GROUP ), 1 do
		on_death( "vk09_penthouse_death", vk09_RECEPTION_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_RECROOM_GROUP ), 1 do
		on_death( "vk09_penthouse_death", vk09_RECROOM_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_FAR_OFFICE_GROUP ), 1 do
		on_death( "vk09_penthouse_death", vk09_FAR_OFFICE_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_BAR_GROUP ), 1 do
		on_death( "vk09_penthouse_death", vk09_BAR_GROUP[x] )
	end
	for x=1, sizeof_table( vk09_UPPER_REC_GROUP ), 1 do
		on_death( "vk09_penthouse_death", vk09_UPPER_REC_GROUP[x] )
	end

	trigger_disable("downtown_$crib_warp_penthouse")
	trigger_disable("downtown_$crib_warp_garage")
	trigger_disable("downtown_$crib_warp_front")

	on_trigger("vk09_penthouse_entered","vk09_penthouse_entrance")
	on_trigger("vk09_penthouse_exit","vk09_penthouse_exit")
	on_trigger("vk09_elevator_entered","vk09_elevator_entrance")
	on_trigger("vk09_elevator_entered","vk09_failsafe")
	on_trigger("vk09_boardroom_entered","vk09_boardroom_entrance")
	on_trigger("vk09_boss_group_load","vk09_boss_group_load_trigger")
	on_trigger("vk09_recroom_load","vk09_recroom_entrance")
	on_trigger("vk09_bar","vk09_bar_exit")
	on_trigger("vk09_staircase","vk09_spiral_staircase")
	on_trigger("vk09_interrogation_start", "vk09_impressions")
	on_trigger("vk09_open_elevator", "vk09_elevator_open")

	--make sure that flags are set properly
	vk09_Penthouse_reached = false
	vk09_Elevator_reached = false
	vk09_Boardroom_reached = false
	vk09_Tanya_dead = false
	vk09_Parking_lot_once = false
	vk09_Lobby_body_count = 0
	vk09_Penthouse_body_count = 0
	vk09_interrogration_done = false

	on_death("vk09_tanya_death","vk09_Tanya_boss")
	vk09_destination = "none"
	
	persona_override_persona_start("SP_KING", "escort - stripper reacts to hitting human", "KING_VK8_RUNOVERPED")
	persona_override_persona_start("SP_KING", "escort - stripper reacts to hitting vehicle", "KING_VK8_HITOBJECT")
	
	--do intro cutscene
	if (not is_demo_execution()) then
		cutscene_in("vk09_scene01")
		cutscene_play( "vk09_scene01", "vk09_Group" )

		teleport_clear_clutter()
		
		--party_dismiss( "#FOLLOWER3#", "#FOLLOWER2#" )
		party_dismiss_all()
		party_set_recruitable(false)
		
		teleport( "#PLAYER#", "vk09_player_teleport" )
		
		character_show( "vk09_BenjaminKing" )
		character_show( "vk09_JohnnyGat" )

		vehicle_show( "vk09_BenjaminCar" )
		vehicle_set_torque_multiplier("vk09_BenjaminCar", 1.5)
		
		never_die("vk09_BenjaminKing",true)
		never_die("vk09_JohnnyGat",true)
		
		--create the two scripted followers
		on_death("vk09_follower_death","vk09_BenjaminKing")
		on_death("vk09_follower_death","vk09_JohnnyGat")
		on_dismiss("vk09_follower_abandoned","vk09_BenjaminKing")
		on_dismiss("vk09_follower_abandoned","vk09_JohnnyGat")
		on_vehicle_destroyed( "vk09_follower_death", "vk09_BenjaminCar" )
		on_entered_water( "vk09_follower_death", "vk09_BenjaminCar" )
		
		if (is_demo_execution()) then
			turn_invulnerable("vk09_BenjaminKing")
			turn_invulnerable("vk09_JohnnyGat")
		end
		
		party_add("vk09_JohnnyGat", "vk09_BenjaminKing")
		character_add_vehicle("vk09_BenjaminKing", "vk09_BenjaminCar", 2)
		follower_remain_in_car( "vk09_BenjaminKing", true )
			
		thread_new( "vk09_vehicle_wrap", "#FOLLOWER1#", 3 )
		thread_new( "vk09_vehicle_wrap", "vk09_JohnnyGat", 1 )
		
		set_seatbelt_flag( "vk09_BenjaminKing", true )
		
		--create location icons for the two points the player should go to
		add_marker_vehicle("vk09_BenjaminCar", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
		delay(2)
		mission_help_table( "vk09_kings_car" )
		vk09_destination = "vk09_impressions"

		--until they get in a car or walk to the penthouse, don't do anything
		while ( get_char_in_vehicle("vk09_BenjaminCar",0) ~= "#PLAYER#" ) do
			thread_yield()
		end
		
		mission_help_table( "vk09_goto_impressions" )
		
		vehicle_supress_npc_exit( "vk09_BenjaminCar", true )
		--follower_make_independent( "vk09_BenjaminKing" )

		follower_remain_in_car( "vk09_BenjaminKing", true )
		follower_remain_in_car( "vk09_JohnnyGat", false )
		follower_remain_in_car( "#FOLLOWER1#", false )

		if (vk09_destination ~= "none") then
			trigger_enable( vk09_destination )
			add_marker_trigger(vk09_destination, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
		end
		
		mission_waypoint_add("vk09_impressions_gps")

		on_vehicle_enter( "vk09_vehicle_enter", "vk09_BenjaminCar" )
		on_vehicle_exit( "vk09_vehicle_exit", "vk09_BenjaminCar" )
		remove_marker_vehicle("vk09_BenjaminCar")

		thread_new( "vk09_car_chatter" )
		
		while (not vk09_interrogration_done) do
			thread_yield()
		end
		
		follower_remain_in_car( "vk09_BenjaminKing", false )

		
		vk09_destination = "vk09_parking_lot1"
		add_marker_trigger("vk09_parking_lot1", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
		
		mission_waypoint_add("vk09_penthouse_gps")

		--turn on first level the triggers
		vk09_parking_lot_enable()

		mission_help_table( "vk09_goto_penthouse" )
		
		persona_override_human_start( "vk09_JohnnyGat", "threat - damage received (firearm)", "GAT_VK9_DAMAGE" )
		persona_override_human_start( "vk09_BenjaminKing", "threat - damage received (firearm)", "KING_VK9_DAMAGE" )
		persona_override_human_start( "vk09_JohnnyGat", "combat - congratulate self", "GAT_VK9_ATTACK" )
		persona_override_human_start( "vk09_BenjaminKing", "combat - congratulate self", "KING_VK9_ATTACK" )

		persona_override_persona_start( "BF_VK1", "threat - alert (group attack)", "BFVK1_VK9_SPOT" )
		persona_override_persona_start( "BF_VK2", "threat - alert (group attack)", "BFVK2_VK9_SPOT" )
		persona_override_persona_start( "BF_VK3", "threat - alert (group attack)", "BFVK3_VK9_SPOT" )

		persona_override_persona_start( "WF_VK1", "threat - alert (group attack)", "WFVK1_VK9_SPOT" )
		persona_override_persona_start( "WF_VK2", "threat - alert (group attack)", "WFVK2_VK9_SPOT" )
		persona_override_persona_start( "WF_VK3", "threat - alert (group attack)", "WFVK3_VK9_SPOT" )

		persona_override_persona_start( "BM_VK1", "threat - alert (group attack)", "BMVK1_VK9_SPOT" )
		persona_override_persona_start( "BM_VK2", "threat - alert (group attack)", "BMVK2_VK9_SPOT" )
		persona_override_persona_start( "BM_VK3", "threat - alert (group attack)", "BMVK3_VK9_SPOT" )

		persona_override_persona_start( "WM_VK1", "threat - alert (group attack)", "WMVK1_VK9_SPOT" )
		persona_override_persona_start( "WM_VK2", "threat - alert (group attack)", "WMVK2_VK9_SPOT" )
		persona_override_persona_start( "WM_VK3", "threat - alert (group attack)", "WMVK3_VK9_SPOT" )

		persona_override_persona_start( "BF_VK1", "threat - damage received (firearm)", "BFVK1_VK9_ATTACK" )
		persona_override_persona_start( "BF_VK2", "threat - damage received (firearm)", "BFVK2_VK9_ATTACK" )
		persona_override_persona_start( "BF_VK3", "threat - damage received (firearm)", "BFVK3_VK9_ATTACK" )

		persona_override_persona_start( "WF_VK1", "threat - damage received (firearm)", "WFVK1_VK9_ATTACK" )
		persona_override_persona_start( "WF_VK2", "threat - damage received (firearm)", "WFVK2_VK9_ATTACK" )
		persona_override_persona_start( "WF_VK3", "threat - damage received (firearm)", "WFVK3_VK9_ATTACK" )

		persona_override_persona_start( "BM_VK1", "threat - damage received (firearm)", "BMVK1_VK9_ATTACK" )
		persona_override_persona_start( "BM_VK2", "threat - damage received (firearm)", "BMVK2_VK9_ATTACK" )
		persona_override_persona_start( "BM_VK3", "threat - damage received (firearm)", "BMVK3_VK9_ATTACK" )

		persona_override_persona_start( "WM_VK1", "threat - damage received (firearm)", "WMVK1_VK9_ATTACK" )
		persona_override_persona_start( "WM_VK2", "threat - damage received (firearm)", "WMVK2_VK9_ATTACK" )
		persona_override_persona_start( "WM_VK3", "threat - damage received (firearm)", "WMVK3_VK9_ATTACK" )

		--wait until they get to the penthouse
		while (not vk09_Penthouse_reached) do
			thread_yield()
		end
		
		on_vehicle_enter( "", "vk09_BenjaminCar" )
		on_vehicle_exit( "", "vk09_BenjaminCar" )
	else
		-- demo teleport to the penthouse
		teleport( "#PLAYER#", "vk09_parking_lot" )
		vk09_parking_enter()
	end
	
	mission_waypoint_remove()
	
	for x=1, sizeof_table( vk09_LOBBY_GROUP ), 1 do
		set_ignore_ai_flag( vk09_LOBBY_GROUP[x], false )
	end
	
	attack( "vk09_lobby_rw_center" )
	attack( "vk09_lobby_lw_center" )

	mission_help_table( "vk09_goto_elevator" )

	--wait until they get to the elevator
	while (not vk09_Elevator_reached) do
		thread_yield()
	end
	
	if (is_demo_execution()) then
		mission_end_success("vk09")
	end

	cutscene_in("vk09_scene02")

	--get rid of that icon
	remove_marker_trigger("vk09_elevator_entrance")

	--play the elevator lift cutscene
	
	character_hide( "vk09_BenjaminKing" )
	character_hide( "vk09_JohnnyGat" )
	
	for x=1,sizeof_table(vk09_ELEVATOR_GROUP),1 do
		thread_kill(vk09_handles[x])
	end
	
	group_destroy("vk09_lobby")
	group_destroy("vk09_lobby_elevator_group")
	
	cutscene_play("vk09_scene02", "vk09_penthouse_reception")

	group_create("vk09_penthouse_recroom")

	character_show( "vk09_BenjaminKing" )
	character_show( "vk09_JohnnyGat" )
	
	for x=1, sizeof_table(vk09_RECEPTION_GROUP), 1 do
		character_show( vk09_RECEPTION_GROUP[x] )
	end

	--move the characters to the penthouse
	teleport( "#PLAYER#", "vk09_elevator_top_player")
	teleport( "vk09_BenjaminKing", "vk09_elevator_top_ben")
	teleport( "vk09_JohnnyGat", "vk09_elevator_top_gat")
	teleport( "#FOLLOWER1#", "vk09_elevator_top_follower")

	--turn on all second level triggers
	--trigger_enable("vk09_boardroom_entrance")
	trigger_enable("vk09_boss_group_load_trigger")
	trigger_enable("vk09_recroom_entrance")
	trigger_enable("vk09_spiral_staircase")

	mesh_mover_reset_to_action_end( "vk09_penthouse_door", "start1" )

	for x=1,sizeof_table(vk09_RECEPTION_GROUP),1 do
		attack(vk09_RECEPTION_GROUP[x],"#PLAYER#")
	end

	for x=1,sizeof_table(vk09_RECROOM_GROUP),1 do
		set_ignore_ai_flag(vk09_RECROOM_GROUP[x],true)
	end

	subtitle("Johnny - Time to find Tanya",3)
	
	if (is_demo_execution()) then
		mission_help_table( "vk09_demo_boardroom" )
	else
		mission_help_table( "vk09_find_tanya" )
	end

	--wait until they get to the penthouse

	local trigger_enabled = false
	
	while( not vk09_Boardroom_reached ) do
		if (is_dead("vk09_JohnnyGat") or is_dead("vk09_BenjaminKing")) then
			if (trigger_enabled) then
				remove_marker_trigger( "vk09_boardroom_entrance" )
				trigger_disable( "vk09_boardroom_entrance" )
				trigger_enabled = false
			end
		elseif ((not trigger_enabled)) then
			trigger_enable( "vk09_boardroom_entrance" )
			add_marker_trigger("vk09_boardroom_entrance", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
			trigger_enabled = true
		end
		
		delay(.5)
	end
	
	if (is_demo_execution()) then
		vk09_Tanya_dead = true
		mission_end_success("vk09")
		thread_new("vk09_demo_execution")
		return
	end

	cutscene_in("vk09_scene05")

	remove_marker_trigger( "vk09_boardroom_entrance" )

	--play Tanya's intro cutscene
	
	character_hide( "vk09_BenjaminKing" )
	character_hide( "vk09_JohnnyGat" )
	
	group_destroy("vk09_penthouse_reception")
	group_destroy("vk09_penthouse_recroom")
	group_destroy("vk09_penthouse_faroffice")
	group_destroy("vk09_upper_bar")
	group_destroy("vk09_upper_rec_billards")
	
	on_dismiss("","vk09_BenjaminKing")
	on_dismiss("","vk09_JohnnyGat")

	character_hide( "vk09_BenjaminKing" )
	character_hide( "vk09_JohnnyGat" )
	
	vehicle_hide("vk09_BenjaminCar")
	
	cutscene_play("vk09_scene05", true)
	
	party_dismiss( "vk09_BenjaminKing" )
	party_dismiss( "vk09_JohnnyGat" )

	group_destroy("vk09_Group")
	
	teleport("#PLAYER#","vk09_end_mission_nav")
	teleport("#FOLLOWER1#","vk09_end_mission_follower")

	mission_end_success("vk09")
end

vk09_elevator_open = false

function vk09_open_elevator()
	if (vk09_elevator_open) then
		return
	end
	
	vk09_elevator_open = true
	vk09_elevator_group_load()
end


function vk09_lobby_death(name)
	if (vk09_elevator_open) then
		return
	end
	
	vk09_Lobby_body_count = vk09_Lobby_body_count + 1
	
	if (vk09_Lobby_body_count == vk09_LOBBY_TOTAL) then
		vk09_elevator_open = true
		vk09_elevator_group_load()
	end
end

function vk09_penthouse_death(name)
	vk09_Penthouse_body_count = vk09_Penthouse_body_count + 1
end

function vk09_elevator_death(name)
	vk09_Lobby_body_count = vk09_Lobby_body_count + 1
	remove_marker_npc( name )
	
	if (vk09_Lobby_body_count == sizeof_table(vk09_ELEVATOR_GROUP)) then
		local trigger_enabled = true
		add_marker_trigger("vk09_elevator_entrance", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
		trigger_enable("vk09_elevator_entrance")
		trigger_enable("vk09_failsafe")
		mesh_mover_play_action( "vk09_elevator1", "start2" )
		mesh_mover_play_action( "vk09_elevator2", "start2" )
		
		while( not vk09_Elevator_reached ) do
		
			if (is_dead("vk09_JohnnyGat") or is_dead("vk09_BenjaminKing")) then
				if (trigger_enabled) then
					remove_marker_trigger( "vk09_elevator_entrance" )
					trigger_enabled = false
				end
			elseif (not trigger_enabled) then
				add_marker_trigger("vk09_elevator_entrance", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
				trigger_enabled = true
			end
			
			delay(.5)
		end
	end
end

function vk09_vehicle_wrap( name, seat )
	vehicle_enter( name, "vk09_BenjaminCar", seat )
end

function vk09_penthouse_entered()
	vk09_Penthouse_reached = true
	vk09_parking_lot_disable()
end

function vk09_penthouse_exit()
end

function vk09_elevator_entered()
	if (is_dead("vk09_JohnnyGat") or is_dead("vk09_BenjaminKing")) then
		--some help text
		return
	end

	trigger_disable("vk09_failsafe")
	trigger_disable("vk09_elevator_entrance")
	
	vk09_Elevator_reached = true
end

function vk09_boardroom_entered()
	if (is_dead("vk09_JohnnyGat") or is_dead("vk09_BenjaminKing")) then
		--some help text
		return
	end

	vk09_Boardroom_reached = true
end

function vk09_elevator_group_load()
	trigger_disable("vk09_elevator_open")
	
	vk09_Lobby_body_count = 0
	
	group_create("vk09_lobby_elevator_group",true)
	
	--cutscene_out()
	
	vk09_elevator_internal()

end

function vk09_elevator_cut()
	camera_look_through( "vk09_elevator_cam" )

	modal_begin()
	fade_in(.5)
	letterbox_fade_in(true)

	local handle = thread_new( "vk09_elevator_internal" )
	while (not thread_check_done(handle)) do
		thread_yield()
	end

	fade_out(.5)
	fade_out_block()
	modal_end()
end

vk09_handles = {-1,-1,-1}
function vk09_elevator_internal()
	for x=1,sizeof_table(vk09_ELEVATOR_GROUP),1 do
		npc_unholster_best_weapon( vk09_ELEVATOR_GROUP[x] )
	end

	--mesh_mover_play_action( "vk09_lobby_door", "start1" )
	mesh_mover_play_action( "vk09_elevator1", "start1" )
	mesh_mover_play_action( "vk09_elevator2", "start1" )
	while( not mesh_mover_action_is_done( "vk09_elevator1" ) ) do
		thread_yield()
	end

	for x=1,sizeof_table(vk09_ELEVATOR_GROUP),1 do
		vk09_handles[x] = thread_new("vk09_elevator_dude_action", vk09_ELEVATOR_GROUP[x])
		delay(.25*x)
	end
	
	--while( not thread_check_done(vk09_handles[1]) and not thread_check_done(vk09_handles[2]) and not thread_check_done(vk09_handles[3]) ) do
	--	thread_yield()
	--end
end

function vk09_elevator_dude_action( dude )
	move_to(dude, dude.."_path", 2 )
	attack(dude,"#PLAYER#")
end

function vk09_boss_group_load()
	trigger_disable("vk09_boss_group_load_trigger")

	for x=1,sizeof_table(vk09_FAR_OFFICE_GROUP),1 do
		set_ignore_ai_flag(vk09_FAR_OFFICE_GROUP[x],false)
		attack(vk09_FAR_OFFICE_GROUP[x],"#PLAYER#")
	end

end

function vk09_recroom_load()
	trigger_disable("vk09_recroom_entrance")

	for x=1,sizeof_table(vk09_RECROOM_GROUP),1 do
		set_ignore_ai_flag(vk09_RECROOM_GROUP[x],false)
		attack(vk09_RECROOM_GROUP[x],"#PLAYER#")
	end

	group_create("vk09_penthouse_faroffice", true)
	for x=1,sizeof_table(vk09_FAR_OFFICE_GROUP),1 do
		set_ignore_ai_flag(vk09_FAR_OFFICE_GROUP[x],true)
	end
end

function vk09_staircase()
	trigger_disable("vk09_spiral_staircase")
	
	trigger_enable("vk09_bar_exit")

	group_create("vk09_upper_bar", true)
	
	vk09_PENTHOUSE_TOTAL = vk09_PENTHOUSE_TOTAL + sizeof_table( vk09_BAR_GROUP )	
end

function vk09_bar()
	trigger_disable("vk09_bar_exit")
	
	group_create("vk09_upper_rec_billards", true)
	
	vk09_PENTHOUSE_TOTAL = vk09_PENTHOUSE_TOTAL + sizeof_table( vk09_UPPER_REC_GROUP )
end

function vk09_tanya_death()
	vk09_Tanya_dead = true;
	remove_marker_npc( "vk09_Tanya_boss" )
end

vk09_talk_continue = false

function audio_play_for_character2(audio, char, type, bool1, bool2)
	combat_disable(char)
	audio_play_for_character(audio, char, type, bool1, bool2)
	combat_enable(char)
end

function vk09_car_chatter()
	vk09_talk_continue = false
	
	on_trigger( "vk09_car_chatter_2nd", "vk09_penthouse_street" )

	while( not is_player_in_vehicle() ) do
		thread_yield()
	end
	
	delay(7)
	mission_debug( "conversation start" )
	audio_play_for_character2( "KING_VK9_START_2", "vk09_BenjaminKing", "voice", false, true )
	audio_play_for_character2( "GAT_VK9_START_1", "vk09_JohnnyGat", "voice", false, true )
	audio_play_for_character2( "KING_VK9_START_3", "vk09_BenjaminKing", "voice", false, true )
	audio_play_for_character2( "GAT_VK9_START_2", "vk09_JohnnyGat", "voice", false, true )
	audio_play_for_character2( "KING_VK9_START_4", "vk09_BenjaminKing", "voice", false, true )
	audio_play_for_character2( "GAT_VK9_START_3", "vk09_JohnnyGat", "voice", false, true )

	while (not vk09_interrogration_done) do
		thread_yield()
	end

	trigger_enable( "vk09_penthouse_street" )
	delay(5)

	if (not vk09_talk_continue) then
		audio_play_for_character2( "KING_VK9_CAR_1", "vk09_BenjaminKing", "voice", false, true )
		audio_play_for_character2( "GAT_VK9_CAR_1", "vk09_JohnnyGat", "voice", false, true )
		audio_play_for_character2( "KING_VK9_CAR_2", "vk09_BenjaminKing", "voice", false, true )
		audio_play_for_character2( "GAT_VK9_CAR_2", "vk09_JohnnyGat", "voice", false, true )
		audio_play_for_character2( "KING_VK9_CAR_3", "vk09_BenjaminKing", "voice", false, true )
		audio_play_for_character2( "GAT_VK9_CAR_3", "vk09_JohnnyGat", "voice", false, true )

		--wait til they "see" the penthouse	
		while( not vk09_talk_continue ) do
			thread_yield()
		end
	end

	if (not vk09_Parking_lot_once) then
		audio_play_for_character2( "KING_VK9_CAR_4", "vk09_BenjaminKing", "voice", false, true )
		audio_play_for_character2( "GAT_VK9_CAR_4", "vk09_JohnnyGat", "voice", false, true )
		audio_play_for_character2( "KING_VK9_CAR_5", "vk09_BenjaminKing", "voice", false, true )
		audio_play_for_character2( "GAT_VK9_CAR_5", "vk09_JohnnyGat", "voice", false, true )
	end
end

function vk09_car_chatter_2nd()
	vk09_talk_continue = true
end

time_accum = 0
vk09_damage_delay = 0

function vk09_stefan_damage()
	if (not Vk09_interrogating) then
		return
	end
	
	local cur_hps = get_current_hit_points("vk09_Stephan")
	
	if (cur_hps < 0 or is_dead("vk09_Stephan")) then
		cur_hps = 0
	end
	
	hud_bar_set_current_bar(1)
	hud_bar_set_value(cur_hps)
	hud_bar_set_current_bar(0)
end

function vk09_hit(speed)
	if (not Vk09_interrogating) then
		return
	end
	
	
	local damage = 0
	if (speed ~= nil) then
		damage = speed * 0.3
	end
	
	if (damage < 0) then
		damage = -damage
	end
	
	if (vk09_damage_delay <= 0) then
		audio_play_persona_line("vk09_Stephan", "voice - pain shout")
		vk09_damage_delay = 1.0
	end
	
	if (damage > 10) then
		damage = 10
	end
	
	local cur_hps = get_current_hit_points("vk09_Stephan")
	cur_hps = cur_hps - damage
	if ((cur_hps < 0) or is_dead("vk09_Stephan")) then
		cur_hps = 0
	end
	set_current_hit_points("vk09_Stephan", cur_hps)
	
	hud_bar_set_current_bar(1)
	hud_bar_set_value(cur_hps)
	hud_bar_set_current_bar(0)
end

function vk09_ragdoll_hit(target, force)
	if (not Vk09_interrogating) then
		return
	end
	
	
	if (force == nil) then
		return
	end
	if (force < 10) then
		return
	end
	mission_debug(target..force)
	force = force * 0.1
	vk09_hit(force)
end

function vk09_audio_pair(audio_stage)
	if (audio_stage == 10) then
		return
	end
	if (audio_stage > 1) then 
		if (audio_stage == 6) then
			audio_play_for_character( "STEFAN_VK9_DANGLING_10", "vk09_Stephan", "voice", false, true )
		else
			audio_play_for_character( "STEFAN_VK9_DANGLING_"..audio_stage-1, "vk09_Stephan", "voice", false, true )
		end
	end
	
	audio_play_for_character( "KING_VK9_INTERRO_"..audio_stage, "vk09_BenjaminKing", "voice", false, true )
	if (audio_stage > 8) then 
		audio_play_for_character( "STEFAN_VK9_DANGLING_9", "vk09_Stephan", "voice", false, true )
		audio_play_for_character( "STEFAN_VK9_DANGLING_5", "vk09_Stephan", "voice", false, true )
		audio_play_for_character( "STEFAN_VK9_DANGLING_11", "vk09_Stephan", "voice", false, true )
	end
end

function vk09_interrogation_fail()
	hud_bar_set_current_bar(1)
	hud_bar_set_value(0)
	hud_bar_set_current_bar(0)
	on_ragdoll_collision("", "vk09_Stephan")
	on_take_damage("", "vk09_Stephan")
	on_collision("", "vk09_BenjaminCar") 
	
	vehicle_interrogation_end("vk09_BenjaminKing")
	Vk09_interrogating = false
	set_ignore_ai_flag("vk09_BenjaminKing", false)
	
	npc_revive( "vk09_Stephan" )
	npc_ragdoll( "vk09_Stephan", -1 )
	--party_dismiss("vk09_Stephan")
	
	delay( .25 )
	audio_play_for_character( "STEFAN_VK9_SCREAMS_1", "vk09_Stephan", "voice", false, false )
	delay(2.0)
	set_current_hit_points("vk09_Stephan", 0)
	hud_bar_set_current_bar(1)
	hud_bar_set_value(0)
	hud_bar_set_current_bar(0)
	mission_end_failure("vk09", "vk09_fail_interrogation")
end

function vk09_instructions()
	mission_help_table("vk09_instructions")
	delay(8)	
	mission_help_table_nag("vk09_dont_kill")
end

function vk09_gat_move_to()
	move_to("vk09_gat2", "vk09_gat_port", 1)
end

function vk09_stefan_cutscene()
	trigger_disable("shops_sr_city_$high_cloth_000")
	
	modal_begin()
	group_create_preload( "vk09_stephan_group" )
	character_hide("vk09_Stephan")
	load_chunk("sr_chunk37b_cs", true)
	set_ignore_ai_flag("vk09_Stephan2", true)
	set_ignore_ai_flag("vk09_gat2", true)
	
	npc_unholster_best_weapon("vk09_gat2")
	camera_look_through("vk09_gat_camera")
	fade_in(.5)
	delay(0.2)
	move_to("vk09_gat2", "vk09_gat_port", "vk09_gat_dest", 1)
	turn_to_char("vk09_gat2", "vk09_Stephan2")
	
	audio_play_for_character( "STEFAN_VK9_CUT5_1", "vk09_Stephan2", "voice", false, true, -1, 3 )
	audio_play_for_character( "GAT_VK9_ENTER_1", "vk09_gat2", "voice", false, true, -1, 3 )
	audio_play_for_character( "STEFAN_VK9_CUT5_2", "vk09_Stephan2", "voice", false, true, -1, 3 )
	audio_play_for_character( "GAT_VK9_ROUGH_1", "vk09_gat2", "voice", false, true, -1, 3 )
	camera_look_through("vk09_gat_camera2")
	teleport("vk09_Stephan2", "vk09_stefan_port")
	audio_play_for_character("IMP_WOOD_HIT_FLESH", "vk09_gat2", "foley", false, true, 3, 3 )
	audio_play_persona_line("vk09_Stephan2", "voice - pain shout")
	set_ignore_ai_flag("vk09_Stephan2", false)
	flee_to_navpoint("vk09_Stephan2", "vk09_stefan_flee", "vk09_gat2", true)
	delay(0.8)
	thread_new("vk09_gat_move_to")
	delay(1.7)
	fade_out(0.5)
	fade_out_block()
	character_hide("vk09_Stephan2")

	camera_end_script()
	modal_end()
end

function vk09_stefan_cutscene_end()
	fade_out(.75)
	fade_out_block()
	trigger_enable("shops_sr_city_$high_cloth_000")
	character_show("vk09_Stephan")
	set_ignore_ai_flag("vk09_Stephan", true)
	set_ignore_ai_flag("vk09_gat2", true)
	character_hide("vk09_Stephan2")
	character_hide("vk09_gat2")
	camera_end_script()
	set_unjackable_flag("vk09_BenjaminCar", false)
	if (get_char_in_vehicle("vk09_BenjaminCar", 0) ~= "#PLAYER#") then
		character_add_vehicle("#PLAYER#", "vk09_BenjaminCar", 0)
	end
	
	if (get_char_in_vehicle("vk09_BenjaminCar", 1) ~= "vk09_JohnnyGat") then
		character_add_vehicle("vk09_JohnnyGat", "vk09_BenjaminCar", 1)
	end
end


function vk09_interrogation_start()
	if (get_char_in_vehicle("vk09_BenjaminCar", 0) ~= "#PLAYER#") then
		return
	end

	local TOTAL_TIME = 0.2 * 60
	
	local LEAD_STATE = 0
	local UP_STATE = 1
	local DOWN_STATE = 2
	local KING_STATE = 3
	local STEFAN_STATE = 4
	
	persona_override_persona_stop("SP_KING", "escort - stripper reacts to hitting human")
	persona_override_persona_stop("SP_KING", "escort - stripper reacts to hitting vehicle")
	
	mission_waypoint_remove()
	vk09_destination = "none"
	
	trigger_disable( "vk09_impressions" )
	vehicle_door_stay_open( "vk09_BenjaminCar", 2, true )
	vehicle_stop("#PLAYER#")
	radio_off()
	player_controls_disable()
	fade_out(.5)
	fade_out_block()
	
	
	set_ignore_ai_flag("vk09_BenjaminKing", true)
	follower_remain_in_car( "vk09_BenjaminKing", true )
	
	--party_add("vk09_Stephan")
	
	cutscene_in()
	--load_chunk("sr_chunk37b_CS.bbchunkx", true)
	
	door_open("CS_C37_MeshMover01")
	door_open("CS_C37_MeshMover02")
	set_unjackable_flag("vk09_BenjaminCar", true)
	scripted_cutscene_play("vk09_stefan_cutscene", "vk09_stefan_cutscene_end")
	set_ignore_ai_flag("vk09_Stephan", true)
	
	on_death("vk09_interrogation_fail", "vk09_Stephan")
	human_dont_regenerate("vk09_Stephan", true)
	character_hide("vk09_gat2")
	notoriety_set_min("police", 1)
	Vk09_interrogating = true
	
	--load_chunk("sr_chunk37b.bbchunkx", true)
	delay(0.1)
	--character_remove_vehicle( "vk09_BenjaminKing" )
	--character_remove_vehicle( "#PLAYER#" )
	--character_remove_vehicle( "vk09_JohnnyGat" )
	
	
	
	vehicle_interrogation_start( "vk09_BenjaminKing", "vk09_Stephan" )
	delay(1.0)
	--turn_invulnerable("vk09_Stephan", false)
	hud_bar_set_range( 0, TOTAL_TIME )
	hud_bar_on("Fear", "vk09_fear")
	
	hud_bar_set_current_bar(1)
	hud_bar_set_range( 0, get_max_hit_points("vk09_Stephan") )
	hud_bar_on("Health", "vk09_health")
	hud_bar_set_value(get_max_hit_points("vk09_Stephan"))
	hud_bar_set_current_bar(0)
	
	player_controls_enable()
	
	fade_in(.5)
	radio_on()
	fade_in_block()
	
	thread_new("vk09_instructions")
	
	time_accum = 0
	
	on_collision("vk09_hit", "vk09_BenjaminCar") 
	--human_set_painful_ragdoll("vk09_Stephan")
	on_ragdoll_collision("vk09_ragdoll_hit", "vk09_Stephan")
	on_take_damage("vk09_stefan_damage", "vk09_Stephan")
	
	local state_timer = 0
	hud_bar_set_value( time_accum )
	
	local state = LEAD_STATE
	mission_debug( "Lead state", 1, 0 )
	
	local audio_stage = 2
	
	thread_new("vk09_audio_pair", 1)
	vk09_damage_delay = 0
	
	local note = 1.0
		
	while (time_accum < TOTAL_TIME) do
		local frame_time = .1
		delay(0.1)
		
		note = notoriety_get_decimal( "police" )
		
		if (note >= 3.5) then
			note = 3.5
		else
			note = note + 0.02
		end
		
		--notoriety_set_min("police", note)
		notoriety_set("police", note)
		
		if (vk09_damage_delay > 0) then
			vk09_damage_delay = vk09_damage_delay - .1
		end
		
		--mission_debug( get_vehicle_speed("vk09_BenjaminCar"), 0, 0 )
		
		if (get_vehicle_speed("vk09_BenjaminCar") >= 50) then
			time_accum = time_accum + frame_time
			hud_bar_set_value( time_accum)
			
			if ((time_accum/TOTAL_TIME) > audio_stage/10) then
				vk09_audio_pair(audio_stage)
				audio_stage = audio_stage + 1
			end

			state_timer = state_timer - frame_time
		end
		
		local should_switch = (state_timer <= 0)
		
		if should_switch then
			mission_debug( "true", 0, 2 )
		else
			mission_debug( "false", 0, 2 )
		end
								
		if (should_switch) then
			if (state == UP_STATE) then
				vehicle_interrogation_lower("vk09_BenjaminKing")
				vk09_hit()
				state = DOWN_STATE;
			else
				state = UP_STATE
				vehicle_interrogation_raise("vk09_BenjaminKing")
			end
			
			state_timer = 3
		end
	end
	Vk09_interrogating = false
	on_take_damage("", "vk09_Stephan")
	turn_invulnerable("vk09_Stephan")
	on_collision("", "vk09_BenjaminCar") 
	on_ragdoll_collision("", "vk09_Stephan")
	
	hud_bar_set_current_bar(1)
	hud_bar_off()
	hud_bar_set_current_bar(0)
	hud_bar_off()
	

	audio_play_for_character( "STEFAN_VK9_BREAKS_1", "vk09_Stephan", "voice", false, true )
	audio_play_for_character( "KING_VK9_INTERRO_10", "vk09_BenjaminKing", "voice", false, true )
	
	persona_override_persona_start("SP_KING", "escort - stripper reacts to hitting human", "KING_VK8_RUNOVERPED")
	persona_override_persona_start("SP_KING", "escort - stripper reacts to hitting vehicle", "KING_VK8_HITOBJECT")
	
	if (not vk09_interrogration_done) then
		vehicle_interrogation_end("vk09_BenjaminKing")
		npc_ragdoll( "vk09_Stephan", -1 )
		--party_dismiss("vk09_Stephan")
	end
	on_death("", "vk09_Stephan")
	turn_vulnerable("vk09_Stephan")
	set_ignore_ai_flag("vk09_BenjaminKing", false)
	follower_remain_in_car( "vk09_BenjaminKing", false )
	
	vk09_interrogration_done = true
	notoriety_set_min("police", 0)
	delay( .25 )
	audio_play_for_character( "STEFAN_VK9_SCREAMS_1", "vk09_Stephan", "voice", false )
end

function vk09_vehicle_enter()
	vk09_parking_lot_enable()

	--once in a car, remove the icon
	remove_marker_vehicle("vk09_BenjaminCar")
	if (vk09_destination ~= "none") then
		add_marker_trigger(vk09_destination,MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	end
	if (vk09_destination == "vk09_impressions") then
		mission_help_table_nag( "vk09_goto_impressions" )
	elseif (vk09_destination == "vk09_parking_lot1") then
		mission_help_table_nag( "vk09_goto_penthouse" )
	end
end

function vk09_vehicle_exit()
	mission_help_table_nag( "vk09_leaves_car" )
	
	vk09_parking_lot_disable()
	--once in a car, remove the icon
	add_marker_vehicle("vk09_BenjaminCar", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	if (vk09_destination ~= "none") then
		remove_marker_trigger(vk09_destination)
	end
end

function vk09_combat_chatter(name, ... )
	local play_table = {}
	
	for x=1, arg.n+1, 1 do
		play_table[x] = false
	end
	
	while( true ) do
		delay( rand_float( 1, 2) * 60 )
	
		local rand = rand_int( 1, arg.n )
		while( play_table[ rand ] ) do
			rand = rand_int( 1, arg.n )
		end
		play_table[rand] = true
	
		play_table[arg.n+1] = true
		for x=1, arg.n, 1 do
			play_table[arg.n+1] = play_table[arg.n+1] and play_table[x]
		end

		audio_play_for_character( arg[rand], name, "voice", false, true )

			--play them all again
		if (play_table[arg.n+1]) then
			for x=1, arg.n+1, 1 do
				play_table[x] = false
			end
		end
	end
end

vk09_trigger_count = 0
function vk09_parking_enter()
	if (get_char_in_vehicle("vk09_BenjaminCar", 0) ~= "#PLAYER#") then
		--mission_help_table_nag("vk09_leaves_car")
		return
	end

	vehicle_stop("vk09_BenjaminCar")
	
	mission_debug( vk09_trigger_count, 5 )
	
	remove_marker_trigger("vk09_parking_lot1")
	
	mesh_mover_play_action("vk09_ph_door", "start1")
	mesh_mover_play_action("vk09_ph_door2", "start1")

	--turn on first level the triggers
	trigger_enable("vk09_penthouse_entrance")
	trigger_enable("vk09_penthouse_exit")
	
	--on_vehicle_destroyed( "", "vk09_BenjaminCar" )

	on_vehicle_enter( "", "vk09_BenjaminCar" )
	on_vehicle_exit( "", "vk09_BenjaminCar" )
	
	if (not vk09_Parking_lot_once) then

		group_create("vk09_lobby", true)
		vk09_Parking_lot_once = true
		trigger_enable("vk09_elevator_open")
	end
	
	if (not vk09_Penthouse_reached) then
		for x=1, sizeof_table(vk09_LOBBY_GROUP), 1 do
			character_show( vk09_LOBBY_GROUP[x] )
		end
	end
end

function vk09_parking_exit()
	if (not is_player_in_vehicle()) then
		return
	end
	
	while (not vk09_Parking_lot_once) do
		thread_yield()
	end

	add_marker_trigger("vk09_parking_lot1", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	--turn on first level the triggers
	trigger_disable("vk09_penthouse_entrance")
	trigger_disable("vk09_penthouse_exit")

	mesh_mover_reset_to_action_start("vk09_ph_door", "start1")
	mesh_mover_reset_to_action_start("vk09_ph_door2", "start1")
		
	on_vehicle_enter( "vk09_vehicle_enter", "vk09_BenjaminCar" )
	on_vehicle_exit( "vk09_vehicle_exit", "vk09_BenjaminCar" )

	--on_vehicle_destroyed( "vk09_follower_death", "vk09_BenjaminCar" )
		
	if (not vk09_Penthouse_reached) then
		for x=1, sizeof_table(vk09_LOBBY_GROUP), 1 do
			character_hide( vk09_LOBBY_GROUP[x] )
		end
	end
end

function vk09_parking_lot_enable()
	for x=1, VK09_PARKING_LOT_TRIGGERS, 1 do
		trigger_enable( "vk09_parking_lot"..x )
	end
end

function vk09_parking_lot_disable()
	for x=1, VK09_PARKING_LOT_TRIGGERS, 1 do
		trigger_disable( "vk09_parking_lot"..x )
	end
end

function vk09_demo_execution()
	delay( 3.5 )

	fade_out(.5)
	fade_out_block()

	on_dismiss("","vk09_BenjaminKing")
	on_dismiss("","vk09_JohnnyGat")
	party_dismiss( "vk09_BenjaminKing" )
	party_dismiss( "vk09_JohnnyGat" )
	
	group_destroy("vk09_Group")
	group_destroy("vk09_penthouse_reception")
	group_destroy("vk09_penthouse_recroom")
	group_destroy("vk09_penthouse_faroffice")
	group_destroy("vk09_upper_bar")
	group_destroy("vk09_upper_rec_billards")
	
	teleport( "#PLAYER#", "vk09_end_mission_nav" )
	teleport( "#FOLLOWER1#", "vk09_end_mission_follower" )
	
	fade_in(.5)
end

-- MISSION FAILURE CALLBACKS ----------------------------------------------------
function vk09_follower_death( name )
	delay(4)
	local help_tag = "Error"
	
	if( name == "vk09_BenjaminKing" ) then
		help_tag = "vk09_fail_king_death"
		trigger_disable( "vk09_elevator_entrance" )
		mission_end_failure("vk09", help_tag)
	elseif( name == "vk09_JohnnyGat" ) then
		help_tag = "vk09_fail_gat_death"
		trigger_disable( "vk09_elevator_entrance" )
		mission_end_failure("vk09", help_tag)
	elseif( name == "vk09_BenjaminCar" ) then
		help_tag = "vk09_fail_car_death"
		trigger_disable( "vk09_elevator_entrance" )
		mission_end_failure("vk09", help_tag)
	end
end

function vk09_follower_abandoned( name )
	local help_tag = "Error"
	
	if( name == "vk09_BenjaminKing" ) then
		help_tag = "vk09_king_abandoned"
		trigger_disable( "vk09_elevator_entrance" )
		mission_end_failure("vk09", help_tag)
	elseif( name == "vk09_JohnnyGat" ) then
		help_tag = "vk09_gat_abandoned"
		trigger_disable( "vk09_elevator_entrance" )
		mission_end_failure("vk09", help_tag)
	end
end