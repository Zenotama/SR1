--[[---------------------------------------------

vk01.lua
script for VK Mission 1
created 1/29/05

-----------------------------------------------]]--

-- CONSTANTS ----------------------------
VK1_tailing_time_allowance_secs = 30
VK1_parking_navs = {"vk01_$n_parking000", "vk01_$n_parking001", "vk01_$n_parking002"}
VK1_perp_runs_inside = {"vk01_$n_perp_run001", "vk01_$n_perp_run002"}
VK1_hos = {	"vk01_$c_hostage1", "vk01_$c_hostage2", "vk01_$c_ho_in_car" }

VK1_warehouse_guards = { "vk01_$c_guard01", "vk01_$c_guard02", "vk01_$c_guard03", "vk01_$c_guard04" }
VK1_warehouse_pushback = { "vk01_$c_pushback01", "vk01_$c_pushback02", "vk01_$c_pushback03", "vk01_$c_pushback04" }
VK1_exit_attack_enemies = { "vk01_$c_attack_driver", "vk01_$c_attack_passenger" }

VK1_LOCKED_DOOR_NAME = "WH_MeshMover02"

VK1_path = {}

-- GLOBAL VARIABLES ---------------------
VK1_perp_car_drive_handle = -1
VK1_pushback_triggered = false
VK1_num_rescued_hos = 0
VK1_second_group_created = false
VK1_drop_off_active = false
VK1_has_key = false
VK1_script_car_entered = ""

--$Mover:		"vk01_locked_door"
--$Object Name:	"WH_MeshMover02"
--$Chunk:		"sr_chunk07"

-- FUNCTIONS ----------------------------

function test_anim()
	play_custom_action( "vk01_test_dude", "GML1_BS_SD_Unlock.animx" )
end

function vk01_cleanup()
	mission_debug("vk01_cleanup", 5)

	mission_waypoint_remove()
	
	party_allow_max_followers(false)
	
	notoriety_reset("vice_kings")

	--recruit_set_mode("friendly gang")

	-- de-ho yourself
	for i, ho in pairs(VK1_hos) do
		remove_marker_npc(ho)
		-- clear registered functions for hos and kick them out your group
		on_death("", ho)
		on_recruit("", ho)
		on_dismiss("", ho)
		party_dismiss(ho)
	end
	
	-- disable any triggers
	trigger_disable("vk01_$t_warehouse_enter")
	trigger_disable("vk01_$t_exit_warehouse")
	trigger_disable("vk01_$t_ho_drop_off")
	trigger_disable("vk01_$t_start_chase")
	trigger_disable("vk01_$t_locked_door")
	trigger_disable("vk01_$t_keyed_door")

	set_unjackable_flag( "vk01_$v_car_kidnapper", false )
		
	-- kill hud stuff
	distance_display_off()
	hud_timer_stop()
	remove_marker_navpoint("vk01_$n_car_kidnapper")
	remove_marker_trigger("vk01_$t_ho_drop_off")
	remove_marker_vehicle("vk01_$v_car_kidnapper")
	remove_marker_npc( "vk01_$c_keyman" )
	remove_marker_trigger( "vk01_$t_locked_door" )
	
	remove_marker_npc("vk01_$c_hostage1")
	remove_marker_npc("vk01_$c_hostage2")
	remove_marker_npc("vk01_$c_ho_in_car")
	
	-- deregister functions
	on_trigger("", "vk01_$t_start_chase")
	on_trigger("", "vk01_$t_warehouse_enter")
	on_trigger("", "vk01_$t_exit_warehouse")
	on_trigger("", "vk01_$t_ho_drop_off")
	on_trigger("", "vk01_$t_locked_door")
	on_trigger("", "vk01_$t_keyed_door")
	on_vehicle_destroyed("", "vk01_$v_car_kidnapper" )
	on_take_damage("", "vk01_$v_car_kidnapper" )
	on_take_damage("", "vk01_$c_kidnapper")
	on_death("", "vk01_$c_kidnapper")
	on_take_damage("", "vk01_$c_ho_in_car")
	on_death("", "vk01_$c_ho_in_car")
	on_tailing_close("")
	on_tailing_far("")
	on_tailing_good("")
	on_tailing_too_close("")
	on_detection("", "vk01_$c_kidnapper")
	on_death("", "vk01_$c_kidnapper")
	for i, guard in pairs(VK1_warehouse_guards)  do
		on_detection("", guard) 
	end
	for i, guard in pairs(VK1_warehouse_pushback)  do
		on_detection("", guard) 
	end
	for i, guard in pairs(VK1_exit_attack_enemies)  do
		on_detection("", guard) 
	end
	
	on_death( "", "vk01_$c_keyman" )
	set_mission_item_callback( "" )
	on_door_opened( "", "WH_MeshMover01" )
	
	if (VK1_script_car_entered ~= "") then
		release_to_world( VK1_script_car_entered )
	end

	-- release any groups to world (currently the groups that are a mix are still being released to world)
	release_to_world("vk01_$G_warehouse_hos")
	release_to_world("vk01_$G_warehouse_guards")
	
	release_to_world("vk01_$v_car_kidnapper")
	release_to_world("vk01_$c_kidnapper")
	
	group_destroy("vk01_$G_kidnapper")
	release_to_world("vk01_$G_warehouse_pushback")
	release_to_world("vk01_$G_warehouse_exit_attack")
	release_to_world("vk01_$G_keyman")
end

function vk01_success()
	hood_set_owner("vk_redlight01","Playas")
	mission_set_next_props_req( "vice_kings", VK02_REQUIRED_PROPS )
end

function vk01_start()
	--set_mission_author("David Cobb")
	--set_mission_author("Russell Aasland")
	--set_mission_author("David Cobb")
	set_mission_author("Russell Aasland")
	
	-- init globals
	VK1_perp_car_drive_handle = 0
	VK1_pushback_triggered = false
	VK1_num_rescued_hos = 0
	VK1_second_group_created = false
	VK1_drop_off_active = false
	VK1_has_key = false
	
	cellphone_remove("VK intro phone call")
	
	for x=1,9,1 do
		VK1_path[x] = "vk01_$npath00"..x
	end

	for x=10,48,1 do
		VK1_path[x] = "vk01_$npath0"..x
	end

	-- cutscene
	cutscene_in("VK01_scene01")
	on_death("vk01_kidnapper_died", "vk01_$c_kidnapper")
	on_vehicle_destroyed("vk01_kidnapper_vehicle_destroyed", "vk01_$v_car_kidnapper" )
	on_take_damage("vk01_kidnapper_died2", "vk01_$c_kidnapper")
	on_death("vk01_kidnapper_died", "vk01_$c_ho_in_car")
	cutscene_play( "VK01_scene01", "vk01_$G_kidnapper" )

	-- mission setup --
	--recruit_set_mode("marked civilians")
	trigger_enable("vk01_$t_start_chase")

	teleport( "#PLAYER#", "vk01_$n_post_cut_warp" )
	
	-- hook up triggers
	on_trigger("vk01_start_chase", "vk01_$t_start_chase")
	on_trigger("vk01_on_warehouse_enter", "vk01_$t_warehouse_enter")
	on_trigger("vk01_on_warehouse_exit", "vk01_$t_exit_warehouse")
	on_trigger("vk01_drop_off_hos", "vk01_$t_ho_drop_off")
	on_trigger("vk01_locked_door", "vk01_$t_locked_door")
	on_trigger("vk01_door_opened", "vk01_$t_keyed_door")
	on_trigger("vk01_kidnapper_warehouse_arrival", "vk01_failsafe")
	trigger_enable("vk01_failsafe")
	
	on_vehicle_enter( "vk01_car_entry", "vk01_$v_car_kidnapper" )
	
	-- mission init --
	mission_waypoint_add("vk01_car_gps")
	add_marker_navpoint("vk01_$n_car_kidnapper", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
	
	-- mission prompt --

	delay(2)
	mission_help_table( "vk01_follow" )

	mission_debug( "Safe to warp, captain.", 5.0 )
end

function vk01_start_chase()
	mission_waypoint_remove()
	mission_debug("vk01_start_chase", 5)

	-- cap player's notoriety to control agression
	notoriety_set_max("vice_kings", 1)
	
	trigger_disable("vk01_$t_start_chase")
	remove_marker_navpoint("vk01_$n_car_kidnapper")
	
	character_show( "vk01_$c_kidnapper" )
	character_show( "vk01_$c_ho_in_car" )
	vehicle_show( "vk01_$v_car_kidnapper" )

	character_add_vehicle("vk01_$c_kidnapper", "vk01_$v_car_kidnapper", 0)
	character_add_vehicle("vk01_$c_ho_in_car", "vk01_$v_car_kidnapper", 1)
	set_ignore_ai_flag("vk01_$c_kidnapper", true)
	set_ignore_ai_flag("vk01_$c_ho_in_car", true)

	-- unjackable car and occupants invulnerable except to player as per feedback
	set_unjackable_flag( "vk01_$v_car_kidnapper", true )
	turn_invulnerable( "vk01_$c_kidnapper", true )
	turn_invulnerable( "vk01_$c_ho_in_car", true )
	turn_invulnerable( "vk01_$v_car_kidnapper", true )

	-- set vehicle speed and traffic obeyyance
	vehicle_should_obey_traffic( "vk01_$v_car_kidnapper", false )
	vehicle_disable_flee("vk01_$v_car_kidnapper", true )
	vehicle_disable_chase("vk01_$v_car_kidnapper", true )
	set_unjackable_flag("vk01_$v_car_kidnapper", true )
	vehicle_speed_override( "vk01_$v_car_kidnapper", 45 )
	
	-- start threads --
	VK1_perp_car_drive_handle = thread_new("vk01_perp_drive_to_warehouse")
	
	-- enable the distance display
	distance_display_on("vk01_$c_kidnapper", 10, 10000, 25, 75)
	mission_help_table( "vk01_follow2" )
	on_tailing_close("vk01_tailing_close")
	on_tailing_far("vk01_tailing_far")
	on_tailing_good("vk01_tailing_good")
	on_tailing_too_close("vk01_tailing_spotted")
	
	-- set up the failure condition of kidnapper death and destructification
	mission_debug("start chase done!", 3.0)
end


function vk01_tailing_close()
	mission_debug("vk01_tailing_close")
	mission_help_table_nag( "vk01_close" )
	hud_timer_set(1000 * VK1_tailing_time_allowance_secs, "vk01_tailing_spotted")
end


function vk01_tailing_far()
	vehicle_speed_override( "vk01_$v_car_kidnapper", 30 )
	mission_debug("vk01_tailing_far")
	mission_help_table_nag( "vk01_far" )
	hud_timer_set(1000 * VK1_tailing_time_allowance_secs, "vk01_tailing_lost_him")
end


function vk01_tailing_good()
	vehicle_speed_override( "vk01_$v_car_kidnapper", 45 )
	mission_debug("vk01_tailing_good")
	hud_timer_stop()
	mission_help_table_nag( "vk01_good" )
end


function vk01_tailing_spotted()
	hud_timer_stop()
	distance_display_off()
	mission_end_failure("vk01", "vk01_fail_too_close")
end


function vk01_tailing_lost_him()
	hud_timer_stop()
	distance_display_off()
	mission_end_failure("vk01", "vk01_fail_too_far")
end


function vk01_kidnapper_died()
	mission_debug("kidnapper death failure condition", 8.0)
	delay(3)
	distance_display_off()
	hud_timer_stop()
	mission_end_failure("vk01", "vk01_fail_kidnapper_death")
end

function vk01_kidnapper_died2(target, attacker)
	if (attacker == "#PLAYER#") or (attacker == "#FOLLOWER#") then
		vk01_kidnapper_died()
	end
end


function vk01_kidnapper_vehicle_destroyed()
	mission_debug("kidnapper vehicle boom failure condition", 8.0)
	distance_display_off()
	hud_timer_stop()
	mission_end_failure( "vk01", "vk01_fail_kcar_death" )
end


function vk01_perp_drive_to_warehouse()
	mission_debug("vk01_perp_drive_to_warehouse", 5.0)
	add_marker_vehicle("vk01_$v_car_kidnapper", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)

	-- drive to the warehouse
	mission_debug("Pathfind to the parking lot", 3.0)
	if (not vehicle_pathfind_to("vk01_$v_car_kidnapper", VK1_path, true, false) ) then
		mission_debug("Initial pathfind failed.", 3.0)
		return
	end
	
	mission_debug("Switching to navmesh.", 3.0)
	vehicle_pathfind_to("vk01_$v_car_kidnapper", "vk01_$n_parking000", "vk01_$n_parking001",true, false)
	mission_debug("Navmesh pathfind done.", 3.0)

	thread_new("vk01_kidnapper_warehouse_arrival")
end

function vk01_kidnapper_warehouse_arrival()
	trigger_disable("vk01_failsafe")
	thread_kill(VK1_perp_car_drive_handle)
	mission_debug("vk01_kidnapper_warehouse_arrival", 5)
	-- cancel all en route conditions 
	hud_timer_stop()
	on_tailing_close("")
	on_tailing_far("")
	on_tailing_good("")
	on_tailing_too_close("")
	on_death("", "vk01_$c_kidnapper")
	on_vehicle_destroyed("", "vk01_$v_car_kidnapper" )
	vehicle_speed_cancel("vk01_$v_car_kidnapper")

	-- kidnapper arrival cutscene
	cutscene_in("vk01_kidnapper")
	
	distance_display_off()
	remove_marker_vehicle("vk01_$v_car_kidnapper")

	character_hide( "vk01_$c_kidnapper" )
	character_hide( "vk01_$c_ho_in_car" )
	vehicle_hide( "vk01_$v_car_kidnapper" )
	
	teleport_clear_clutter()
	
	if (is_player_in_vehicle) then
		teleport_vehicle( "#PLAYER#", "vk01_$n_parking000" )
	else
		teleport_player( "#PLAYER#", "vk01_$n_parking000" )
	end
	
	on_take_damage("", "vk01_$v_car_kidnapper" )
	on_take_damage("", "vk01_$c_kidnapper")
	on_death("", "vk01_$c_kidnapper")
	on_take_damage("", "vk01_$c_ho_in_car")
	on_death("", "vk01_$c_ho_in_car")
	for i, ho in pairs(VK1_hos) do
		-- hook up functions, yo		
		on_death("vk01_ho_dies", ho)
	end
	

	cutscene_play("vk01_kidnapper")

	character_show( "vk01_$c_kidnapper" )
	character_show( "vk01_$c_ho_in_car" )
	vehicle_show( "vk01_$v_car_kidnapper" )
	mission_waypoint_add( "vk01_brothel_gps" )
	
	character_remove_vehicle( "vk01_$c_kidnapper" )
	character_remove_vehicle( "vk01_$c_ho_in_car" )
	teleport("vk01_$c_kidnapper", VK1_perp_runs_inside[2])
	teleport("vk01_$c_ho_in_car", "vk01_$car_ho_warp")
	teleport_vehicle( "vk01_$v_car_kidnapper", "vk01_$n_parking002" )

	set_cower_flee_mode( "vk01_$c_ho_in_car", "always cower when attacked" )

	mission_help_table( "vk01_rescue_girls" )

	-- enable the warehouse trigger and mark it
	trigger_enable("vk01_$t_warehouse_enter")
	
	trigger_enable( "vk01_$t_locked_door" )
	add_marker_trigger( "vk01_$t_locked_door", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION )

	-- restore the car and peeps to be killarble
	set_unjackable_flag( "vk01_$v_car_kidnapper", false )
	turn_vulnerable( "vk01_$c_kidnapper" )
	turn_vulnerable( "vk01_$c_ho_in_car" )
	turn_vulnerable( "vk01_$v_car_kidnapper" )

	set_ignore_ai_flag("vk01_$c_kidnapper", false)
end

function vk01_on_warehouse_enter()
	mission_debug("vk01_on_warehouse_enter", 5)
	mission_waypoint_remove()

	trigger_disable("vk01_$t_warehouse_enter")
	group_create("vk01_$G_warehouse_guards", true)
	
	on_door_opened( "vk01_warehouse_door", "WH_MeshMover01" )

	persona_override_persona_start( "BF_VK1", "threat - damage received (firearm)", "BFVK1_VK1_ATTACK" )
	persona_override_persona_start( "BF_VK2", "threat - damage received (firearm)", "BFVK2_VK1_ATTACK" )
	persona_override_persona_start( "BF_VK3", "threat - damage received (firearm)", "BFVK3_VK1_ATTACK" )

	persona_override_persona_start( "WF_VK1", "threat - damage received (firearm)", "WFVK1_VK1_ATTACK" )
	persona_override_persona_start( "WF_VK2", "threat - damage received (firearm)", "WFVK2_VK1_ATTACK" )
	persona_override_persona_start( "WF_VK3", "threat - damage received (firearm)", "WFVK3_VK1_ATTACK" )

	persona_override_persona_start( "BM_VK1", "threat - damage received (firearm)", "BMVK1_VK1_ATTACK" )
	persona_override_persona_start( "BM_VK2", "threat - damage received (firearm)", "BMVK2_VK1_ATTACK" )
	persona_override_persona_start( "BM_VK3", "threat - damage received (firearm)", "BMVK3_VK1_ATTACK" )

	persona_override_persona_start( "WM_VK1", "threat - damage received (firearm)", "WMVK1_VK1_ATTACK" )
	persona_override_persona_start( "WM_VK2", "threat - damage received (firearm)", "WMVK2_VK1_ATTACK" )
	persona_override_persona_start( "WM_VK3", "threat - damage received (firearm)", "WMVK3_VK1_ATTACK" )	

	persona_override_persona_start( "BF_VK1", "threat - alert (group attack)", "BFVK1_VK1_ATTACK" )
	persona_override_persona_start( "BF_VK2", "threat - alert (group attack)", "BFVK2_VK1_ATTACK" )
	persona_override_persona_start( "BF_VK3", "threat - alert (group attack)", "BFVK3_VK1_ATTACK" )

	persona_override_persona_start( "WF_VK1", "threat - alert (group attack)", "WFVK1_VK1_ATTACK" )
	persona_override_persona_start( "WF_VK2", "threat - alert (group attack)", "WFVK2_VK1_ATTACK" )
	persona_override_persona_start( "WF_VK3", "threat - alert (group attack)", "WFVK3_VK1_ATTACK" )

	persona_override_persona_start( "BM_VK1", "threat - alert (group attack)", "BMVK1_VK1_ATTACK" )
	persona_override_persona_start( "BM_VK2", "threat - alert (group attack)", "BMVK2_VK1_ATTACK" )
	persona_override_persona_start( "BM_VK3", "threat - alert (group attack)", "BMVK3_VK1_ATTACK" )

	persona_override_persona_start( "WM_VK1", "threat - alert (group attack)", "WMVK1_VK1_ATTACK" )
	persona_override_persona_start( "WM_VK2", "threat - alert (group attack)", "WMVK2_VK1_ATTACK" )
	persona_override_persona_start( "WM_VK3", "threat - alert (group attack)", "WMVK3_VK1_ATTACK" )	
end

function vk01_warehouse_door()
	on_door_opened( "", "WH_MeshMover01" )
	attack( "vk01_$c_guard01" )
end

function vk01_locked_door()
	trigger_disable( "vk01_$t_locked_door" )

	remove_marker_trigger( "vk01_$t_locked_door" )
	
	audio_play_for_character( "BFHO1_VK1_SPOT_1", "#PLAYER#", "voice", false, true )
	
	group_create( "vk01_$G_keyman", true )
	mission_help_table( "vk01_kill_keyman" )
	add_marker_npc( "vk01_$c_keyman", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	mission_waypoint_add( "vk01_club_gps" )
	on_death( "vk01_keyman_death", "vk01_$c_keyman" )
	patrol( "vk01_keyman_patrol", "vk01_$c_keyman" )
end

function vk01_keyman_patrol()
	local path_success = true
	
	while( not is_dead( "vk01_$c_keyman" ) and path_success ) do
		path_success = move_to( "vk01_$c_keyman", "vk01_$n_keyman_path02", "vk01_$n_keyman_path03", "vk01_$n_keyman_path04", "vk01_$n_keyman_path01", 1 )
	end	
end

function vk01_key_pickup()
	mission_debug( "got key", 5 )
	on_trigger("vk01_door_opened", "vk01_$t_keyed_door")

	VK1_has_key = true
	mission_help_table( "vk01_release_hos" )
	group_create("vk01_$G_warehouse_hos", true)
	trigger_enable( "vk01_$t_keyed_door" )
	
	mission_waypoint_add( "vk01_brothel_gps" )
	
	for i, ho in pairs(VK1_hos) do
		add_marker_npc(ho, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
		
		-- set flags and such for hos
		set_dont_attack_me_on_sight_flag(ho, true)
		set_ignore_ai_flag(ho, false)
		
		-- hook up functions, yo		
		on_death("vk01_ho_dies", ho)
		on_recruit("vk01_ho_recruited", ho)
		on_dismiss("vk01_ho_dismissed", ho)
	end
	
end

function vk01_keyman_death()
	remove_marker_npc( "vk01_$c_keyman" )
	set_mission_item_callback( "vk01_key_pickup" )
	
	mission_help_table( "vk01_get_key" )
end

function vk01_door_opened()
	trigger_disable( "vk01_$t_keyed_door" )
	
	player_controls_disable()
	--camera_look_through("vk01_unlock_look")
	holster()
	turn_to_orient( "#PLAYER#", "vk01_face_door" )
	--move_to( "#PLAYER#", "vk01_unlock_start", 1 )
	--turn_to_orient( "#PLAYER#", "vk01_unlock_start" )
	play_custom_action( "#PLAYER#", "GML1_BS_SD_Unlock.animx" )
	unholster()
	mesh_mover_play_action( "vk01_locked_door", "start1" )
	
	while( not mesh_mover_action_is_done( "vk01_locked_door" )) do
		thread_yield()
	end
	
	mission_help_table_nag("vk01_recruit")
	party_allow_max_followers(true)

	--camera_end_script()
	player_controls_enable()

	for i, ho in pairs(VK1_hos) do
		-- set flags and such for hos
		set_dont_attack_me_on_sight_flag(ho, true)

		set_team( ho, "Playas" )
		
		-- hook up functions, yo
		on_death("vk01_ho_dies", ho)
		on_recruit("vk01_ho_recruited", ho)
		on_dismiss("vk01_ho_dismissed", ho)
	end
	
	persona_override_remove_all()

	persona_override_persona_start( "AF_HO1", "group - dismiss confirm", "AFHO1_VK1_DISMISS_1" )
	persona_override_persona_start( "AF_HO2", "group - dismiss confirm", "AFHO2_VK1_DISMISS_1" )
	persona_override_persona_start( "BF_HO1", "group - dismiss confirm", "BFHO1_VK1_DISMISS_1" )
	persona_override_persona_start( "BF_HO2", "group - dismiss confirm", "BFHO2_VK1_DISMISS_1" )
	persona_override_persona_start( "HF_HO1", "group - dismiss confirm", "HFHO1_VK1_DISMISS_1" )
	persona_override_persona_start( "HF_HO2", "group - dismiss confirm", "HFHO2_VK1_DISMISS_1" )
	
	persona_override_persona_start( "AF_HO1", "group - recruit confirmed attempt", "AFHO1_VK1_RECRUIT" )
	persona_override_persona_start( "AF_HO2", "group - recruit confirmed attempt", "AFHO2_VK1_RECRUIT" )
	persona_override_persona_start( "BF_HO2", "group - recruit confirmed attempt", "BFHO2_VK1_RECRUIT" )
	persona_override_persona_start( "HF_HO1", "group - recruit confirmed attempt", "HFHO1_VK1_RECRUIT" )
	persona_override_persona_start( "HF_HO2", "group - recruit confirmed attempt", "HFHO2_VK1_RECRUIT" )
	
	notoriety_set_max("vice_kings", 2)
end

function vk01_ho_recruited(name)
	mission_help_table( "vk01_return_to_sr" )
	
	mission_waypoint_add( "vk01_church_gps" )

	remove_marker_npc( name )
	--set_team( name, "Playas" )
	set_dont_attack_me_on_sight_flag(name, false)
	set_cower_flee_mode( name, "never cower or flee" )

	-- make sure the drop off trigger is enabled and marked
	if (not VK1_drop_off_active) then
		VK1_drop_off_active = true
		trigger_enable("vk01_$t_ho_drop_off")
		add_marker_trigger("vk01_$t_ho_drop_off", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	end

	-- only set up the pushback when the first group of hos is recruited from the warehouse
	if( not VK1_pushback_triggered ) then
		VK1_pushback_triggered = true
		group_create("vk01_$G_warehouse_pushback", true)
		trigger_enable("vk01_$t_exit_warehouse")
		for i, thug in pairs( VK1_warehouse_pushback )  do
			attack(thug)
		end
		notoriety_set_max("vice_kings", 2)
		--notoriety_set("vice_kings", 2)
	end
end

function vk01_ho_dismissed(name)
	add_marker_npc(name, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
	--set_team( name, "Civilian" )
	set_dont_attack_me_on_sight_flag(name, true)
	set_cower_flee_mode( name, "always cower when attacked" )

	-- if there are no more hos in player's party, disable the drop off trigger
	local num_hos_in_party = 0
	for i, ho in pairs(VK1_hos) do
		if ( is_in_party(ho) ) then
			num_hos_in_party = num_hos_in_party + 1
		end
	end
	
	if ( num_hos_in_party == 0 ) then
		VK1_drop_off_active = false
		trigger_disable("vk01_$t_ho_drop_off")
		remove_marker_trigger("vk01_$t_ho_drop_off")
	end	
end

function vk01_on_warehouse_exit()
	mission_debug("vk01_on_warehouse_exit", 5.0)
	
	trigger_disable("vk01_$t_exit_warehouse")
	
	-- set up the exit attack
	group_create( "vk01_$G_warehouse_exit_attack", true )
	character_add_vehicle( VK1_exit_attack_enemies[1], "vk01_$v_attack_car", 0 )
	character_add_vehicle( VK1_exit_attack_enemies[2], "vk01_$v_attack_car", 1 )
	vehicle_chase( "vk01_$v_attack_car" )
	car_combat(VK1_exit_attack_enemies[1])
end


function vk01_drop_off_hos()
	mission_debug( "vk01_drop_off_hos", 5 )
	
	if ( is_player_in_vehicle() ) then
		vehicle_stop("#PLAYER#")
		local thread_handles={-1,-1,-1}
	
		for i, ho in pairs(VK1_hos) do	
			if ( is_in_party(ho) and (not is_follower_unconscious(ho))) then
				on_dismiss("", ho)
				thread_handles[i] = thread_new("vehicle_exit", ho)
			end
		end
		
		local done = false;
		while( not done ) do
			done = thread_check_done( thread_handles[1] ) and
					thread_check_done( thread_handles[2] ) and
					thread_check_done( thread_handles[3] )
			thread_yield()
		end
	end

	-- if there are any hos in party, dismiss them
	local total_num_hos = 0
	for i, ho in pairs(VK1_hos) do
		if ( is_in_party(ho) and (not is_follower_unconscious(ho))) then
			vk01_remove_ho_from_party(ho)
			VK1_num_rescued_hos = VK1_num_rescued_hos + 1
		end
		total_num_hos = total_num_hos + 1
	end

	
	mission_debug( "Rescued = " .. VK1_num_rescued_hos .. "/" .. total_num_hos , 5 )

	-- check for a victory condition, playa
	if ( VK1_num_rescued_hos == total_num_hos ) then
		mission_end_success("vk01")
	end
end


function vk01_remove_ho_from_party(ho)
	recruit_set_marked_flag(ho, false )
	on_recruit("", ho)
	on_dismiss("", ho)
	party_dismiss(ho)
-- AL 12/16/05: move_to_do has bogus parameters below, please fix
	set_team( ho, "Civilian" )
	set_ignore_ai_flag( ho, true )
	if (ho ~= "vk01_$c_ho_in_car") then
		release_to_world(ho)
	end
end

function vk01_ho_dies()
	mission_debug( "vk01_ho_dies", 10 )
	mission_end_failure("vk01", "vk01_fail_ho_death")
end

function vk01_car_entry( car_name )
	VK1_script_car_entered = car_name
end

-- DEBUG FUNCTIONS ----------------------------------------

function vk01_skip_chase()
	trigger_disable("vk01_$t_start_chase")
	remove_marker_navpoint("vk01_$n_car_kidnapper")

	character_add_vehicle("vk01_$c_kidnapper", "vk01_$v_car_kidnapper", 0)
	character_add_vehicle("vk01_$c_ho_in_car", "vk01_$v_car_kidnapper", 1)
	teleport_vehicle( "vk01_$v_car_kidnapper", "vk01_$n_parking002")

	if (is_player_in_vehicle()) then
		teleport_vehicle( "#PLAYER#", "vk01_$n_parking001" )
	else
		teleport( "#PLAYER#", "vk01_$n_parking001" )
	end

	mission_help_table( "vk01_rescue_girls" )

	-- enable the warehouse trigger and mark it
	trigger_enable("vk01_$t_warehouse_enter")
	
	trigger_enable("vk01_$t_locked_door")
	add_marker_trigger( "vk01_$t_locked_door", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION )

	character_remove_vehicle( "vk01_$c_kidnapper" )
	character_remove_vehicle( "vk01_$c_ho_in_car" )
	teleport("vk01_$c_kidnapper", VK1_perp_runs_inside[2])
	teleport("vk01_$c_ho_in_car", "vk01_$car_ho_warp")
	
	set_cower_flee_mode( "vk01_$c_ho_in_car", "always cower when attacked" )
end

function vk01_reset_door()
	
	for i, ho in pairs(VK1_hos) do
		remove_marker_npc(ho)
	end
	
	group_destroy("vk01_$G_warehouse_hos", true)
	
	mesh_mover_reset_to_action_start( "vk01_locked_door", "start1" )
end

-- PROBATIONARY LIBRARY FUNCTIONS -------------------------
function is_player_detected_by_vehicle(char_name, range)
	if ( (get_dist_char_to_char("#PLAYER#", char_name) <= range) and los_check("#PLAYER#", char_name) ) then
		return true
	else
		return false
	end
end
