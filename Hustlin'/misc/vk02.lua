
--[[---------------------------------------------

vk02.lua
script for VK Mission 2

-----------------------------------------------]]--

-- CONSTANTS ----------------------------
VK2_bomb_timer_min = 5.0
vk02_MAX_EFFECTIVE_RANGE = 5.150033

vk02_Garage_reached = false
vk02_Time_elapsed = false

vk02_chasers_withdrawn = false
Vk02_cutscene_played = false

vk02_distance_thread = -1
vk02_stalker_created = false
vk02_damage_thread = -1
vk02_stalker_thread = -1
Vk02_stalker_create_thread = -1


VK02_debug = false


function vk02_set_debug()
	VK02_debug = true
end

function vk02_cleanup()
	party_set_recruitable(true)
	mission_waypoint_remove()

	damage_indicator_off()

	trigger_disable("vk02_garage")
	trigger_disable("vk02_record_studio")

	remove_marker_navpoint("vk02_det_car")
	remove_marker_trigger("vk02_garage")
	remove_marker_trigger("vk02_record_studio")
	remove_marker_vehicle("vk02_chase_van")
	remove_marker_vehicle("vk02_det_car")
	remove_marker_npc("vk02_van_driver")

	release_to_world("vk02_det_car")
	destroy_group("vk02_Group")
	release_to_world("vk02_chasers")
	
	hud_timer_stop()
	on_death("","#PLAYER#")
	on_damage("","vk02_det_car",0)
	on_vehicle_destroyed( "", "vk02_det_car" )
	on_death("","vk02_rap_artist")
	on_dismiss("","vk02_rap_artist")
	on_vehicle_exit("", "vk02_det_car")
	
	trigger_disable("vk02_garage_open")
	on_trigger("", "vk02_garage_open")
	on_trigger_exit("", "vk02_garage_open")
	
	--party_set_dismissable(true)
	--party_set_recruitable(true)
end

function vk02_success()
	mission_unlock("projects_sh_loft")
	hood_set_owner("vk_downtown02","Playas")
	radio_post_event("NEWS_VK_KCEXPLO_01", true)
end

function vk02_speed()
	while (get_vehicle_speed("vk02_det_car") < 40) do
		thread_yield()
	end
	
	audio_play_for_character("AISHA_VK2_CAR_2", "vk02_rap_artist", "voice", false, false)
end

function vk02_bomb_timer()
	delay(30)
	local speed_thread = thread_new("vk02_speed")
	delay(200)
	thread_kill(speed_thread)
	voice_block("vk02_rap_artist")
	audio_play_for_character("AISHA_VK2_CAR_3", "vk02_rap_artist", "voice", false, false)
	delay(10)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_TIMEWARN_1", "vk02_rap_artist", "voice", false, false)
	delay(10)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_TIMEWARN_2", "vk02_rap_artist", "voice", false, false)
	delay(10)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_TIMEWARN_3", "vk02_rap_artist", "voice", false, false)
	delay(10)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_TIMEWARN_4", "vk02_rap_artist", "voice", false, false)
	delay(10)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_TIMEWARN_5", "vk02_rap_artist", "voice", false, false)
end

vk02_stalker_line_array = 
	{{"STALKER_VK2_DAMAGE_1", 0.9},
	{"STALKER_VK2_DAMAGE_2", 0.75},
	{"STALKER_VK2_DAMAGE_3", 0.60},
	{"STALKER_VK2_FIRE_1", 0.2}}

function vk02_stalker_lines()
	local max_hits = get_max_hit_points("vk02_chase_van")
	
	for linenum in vk02_stalker_line_array do
		while ((get_current_hit_points("vk02_chase_van") / max_hits) > vk02_stalker_line_array[linenum][2]) do
			delay(1)
		end
		
		audio_play_for_character(vk02_stalker_line_array[linenum][1], "vk02_van_driver", "voice", false, true)
	end
	
	while (not is_dead("vk02_van_driver")) do
		delay(1)
		thread_yield()
	end
	
	audio_play_for_character("STALKER_VK2_DIE_1", "#PLAYER#", "voice", false, true)
	
	voice_block("vk02_rap_artist")
	audio_play_for_character("AISHA_VK2_STALKERDIES_1", "vk02_rap_artist", "voice", false, false)
end

vk02_damage_line_array =
	{{"STALKER_VK2_ATTACK_1", "AISHA_VK2_DAMAGE_1", 0.95},
	 {"", "AISHA_VK2_CARDAMAGE_1", 0.93},
	 {"STALKER_VK2_ATTACK_2", "AISHA_VK2_DAMAGE_2", 0.9},
	 {"", "AISHA_VK2_CARDAMAGE_2", 0.88},
	 {"", "AISHA_VK2_CARDAMAGE_3", 0.85},
	 {"", "AISHA_VK2_CARDAMAGE_4", 0.81},
	 {"", "AISHA_VK2_CARDAMAGE_5", 0.79},
	 {"", "AISHA_VK2_DAMAGE_3", 0.77}}
	
function vk02_damage_lines()
	local max_hits = get_max_hit_points("vk02_det_car")
	
	for linenum in vk02_damage_line_array do
		while ((get_current_hit_points("vk02_det_car") / max_hits) > vk02_damage_line_array[linenum][3]) do
			delay(1)
		end
		
		if (vk02_damage_line_array[linenum][1] ~= "") then
			audio_play_for_character(vk02_damage_line_array[linenum][1], "vk02_van_driver", "voice", false, true)
		end
		
		voice_block("vk02_rap_artist")
		audio_play_for_character(vk02_damage_line_array[linenum][2], "vk02_rap_artist", "voice", false, true)
	end
	
	vk02_damage_thread = -1
end
	
function vk02_conversation()
	delay(4)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_CONVO_1", "vk02_rap_artist", "voice", false, true)
	delay(8)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_CONVO_2", "vk02_rap_artist", "voice", false, true)
	delay(8)
	voice_block("vk02_rap_artist")
	audio_play_for_character("AISHA_VK2_CAR_1", "vk02_rap_artist", "voice", false, false)
	delay(7)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_CONVO_3", "vk02_rap_artist", "voice", false, true)
	delay(9)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_CONVO_4", "vk02_rap_artist", "voice", false, true)
	delay(12)
	voice_block("vk02_rap_artist")
	audio_play_for_character("VOC_AISHA_VK2_CONVO_5", "vk02_rap_artist", "voice", false, true)
end	

vk02_exit_line_count = 1

function vk02_leave_car()
	mission_help_table_nag("vk02_exits_car")
	if (Vk02_cutscene_played) then
		voice_block("vk02_rap_artist")
		audio_play_for_character("AISHA_VK2_PLAYEREXIT_"..vk02_exit_line_count, "vk02_rap_artist", "voice", false, false)
		vk02_exit_line_count = vk02_exit_line_count + 1
		if (vk02_exit_line_count > 5) then
			vk02_exit_line_count = 1
		end
	end
end

function vk02_garage_open()
	mesh_mover_play_action("vk02_garage_door", "start1")
end

function vk02_garage_close()
	mesh_mover_play_action("vk02_garage_door", "start2")
end

cutscene_audio_primed = false
function vk02_garage_cutscene()
	cutscene_audio_primed = false

	modal_begin()
	camera_look_through("vk02_garage_cam")
	fade_in(0.5)
	vk02_garage_close()
	
	delay(2)
	audio_play_for_character("SFX_CAR_MODIFY", "#PLAYER#", "foley", false, true)
	audio_play_for_character("SAMSON_VK2_BOMB_1", "#PLAYER#", "voice", false, true)
	delay(1)

	vk02_garage_open()

	fade_out(0.5)
	cutscene_prime_audio("vk02_stalker")
	fade_out_block()
	cutscene_audio_primed = true
	
	--vk02_garage_open()
	--camera_end_script()
	modal_end()
end

function vk02_garage_cutscene_end()
	fade_out(0)
	thread_yield()
	camera_end_script()
	player_controls_enable()
	vk02_garage_open()
end

function vk02_start()
	--set_mission_author("Russell Aasland")
	--set_mission_author("David Cobb")
	set_mission_author("Sandeep Shekar")
	
	-- setup
	vk02_Garage_reached = false
	vk02_Time_elapsed = false

	vk02_chasers_withdrawn = false
	Vk02_cutscene_played = false

	vk02_distance_thread = -1
	vk02_stalker_created = false
	vk02_damage_thread = -1
	vk02_stalker_thread = -1
	Vk02_stalker_create_thread = -1
	
	-- opening cut scene
	--fade_out(2)
	--delay(2)
	--letterbox_fade_in(true)
	cutscene_in("VK02_scene01")
	party_dismiss_all()
	party_set_recruitable(false)
	cutscene_play( "VK02_scene01", "vk02_Group" )
	
	teleport("#PLAYER#", "mission_start_vk02")
	character_show( "vk02_rap_artist" )
	
	vehicle_show( "vk02_det_car" )
	--party_dismiss_all()
	party_add("vk02_rap_artist")
	-- set up rapper and car
	on_death("vk02_rap_artist_death","vk02_rap_artist")
	on_dismiss("vk02_rap_artist_abandoned","vk02_rap_artist")
	on_vehicle_destroyed( "vk02_vehicle_damage_threshold", "vk02_det_car" )
	
	if VK02_debug then
		never_die("vk02_rap_artist", true)
	end
	
	add_marker_vehicle( "vk02_det_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )
	
	delay(2)
	mission_help_table( "vk02_use_car" )
	
	-- wait for player to get into car
	while get_char_in_vehicle("vk02_det_car",0) ~= "#PLAYER#" do
		thread_yield()
	end
	
	on_vehicle_exit("vk02_leave_car", "vk02_det_car")
	
	while (get_char_in_vehicle("vk02_det_car", 1) ~= "vk02_rap_artist") and (get_char_in_vehicle("vk02_det_car", 2) ~= "vk02_rap_artist") and (get_char_in_vehicle("vk02_det_car", 3) ~= "vk02_rap_artist") do
		thread_yield()	
	end
	
	mission_waypoint_add( "vk02_samson_gps" )
	
	follower_remain_in_car("vk02_rap_artist", true)
	vehicle_supress_npc_exit( "vk02_det_car", true )

	mission_help_table( "vk02_goto_garage" )
	add_marker_trigger( "vk02_garage", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	
	on_trigger("vk02_vk02_Garage_reached","vk02_garage")
	trigger_enable("vk02_garage")

	-- play intro line
	while (get_char_in_vehicle("vk02_det_car", 1) ~= "vk02_rap_artist") and (get_char_in_vehicle("vk02_det_car", 2) ~= "vk02_rap_artist") and (get_char_in_vehicle("vk02_det_car", 3) ~= "vk02_rap_artist") do
		thread_yield()	
	end
	
	local chatter_thread = thread_new("vk02_conversation")
	
	trigger_enable("vk02_garage_open")
	on_trigger("vk02_garage_open", "vk02_garage_open")
	on_trigger_exit("vk02_garage_close", "vk02_garage_open")
		
	-- wait for player to arrive at garage
	while (not vk02_Garage_reached) do
		thread_yield()
	end
	
	trigger_disable("vk02_garage_open")
	remove_marker_trigger("vk02_garage")
	
	-- set up vehicle for 'splosion
	vehicle_repair( "vk02_det_car", 1 )
	on_damage("vk02_vehicle_damage_threshold","vk02_det_car",.75)
	
	--mission_help_table( "vk02_go_fast" )
	
	--close garage and then play the lines
	thread_kill(chatter_thread)
	player_controls_disable()
	vehicle_stop("#PLAYER#")
	cutscene_in()
	player_controls_enable()
	scripted_cutscene_play("vk02_garage_cutscene", "vk02_garage_cutscene_end")
	
	if (not cutscene_audio_primed) then
		cutscene_prime_audio("vk02_stalker")
		delay(1.0)
	end

	cutscene_play("vk02_stalker","vk02_chasers")
	npc_revive("vk02_rap_artist")
	character_show("vk02_van_driver")
	vehicle_show("vk02_chase_van")
	
	character_show("vk02_$c000")
	character_show("vk02_$c001")
	character_show("vk02_$c002")
	vehicle_show("vk02_$v000")
	vehicle_show("vk02_$v001")
	vehicle_show("vk02_$v002")
	vehicle_show("vk02_$v003")
	
	vehicle_attach_trailer("vk02_$v001", "vk02_$v000")
	--vehicle_infinite_mass("vk02_$v001", true)
	--vehicle_infinite_mass("vk02_$v000", true)
	--vehicle_infinite_mass("vk02_$v002", true)
	--vehicle_infinite_mass("vk02_$v003", true)
	
	character_add_vehicle("vk02_van_driver", "vk02_chase_van", 0)
	--follower_remain_in_car("vk02_rap_artist", false)
	--character_remove_vehicle("vk02_rap_artist")
	
	set_unjackable_flag("vk02_chase_van", true)
	add_marker_npc( "vk02_van_driver", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	vehicle_set_torque_multiplier( "vk02_chase_van", 2.0 )
	vk02_distance_thread = thread_new("vk02_chase_distance")
	vk02_stalker_created = true
	trigger_enable("vk02_record_studio")
	add_marker_trigger( "vk02_record_studio", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	Vk02_cutscene_played = true
	vk02_garage_close()
	
	
	if (get_char_in_vehicle("vk02_det_car", 0) ~= "#PLAYER#") then
		character_add_vehicle("#PLAYER#", "vk02_det_car", 0)
	end
	
	
	if (get_char_in_vehicle("vk02_det_car", 1) ~= "vk02_rap_artist") then
		character_add_vehicle("vk02_rap_artist", "vk02_det_car", 1)
	end
	
	teleport_vehicle( "vk02_det_car", "vk02_$n_pos_on_road" )
	
	hud_timer_set(VK2_bomb_timer_min * 60 * 1000,"vk02_detonate_car")
	local bomb_timer = thread_new("vk02_bomb_timer")
	
	damage_indicator_on("vk02_det_car", .75, "lc08_carbomb")
	
	persona_override_persona_start("SP_AISHA", "escort - stripper reacts to hitting human", "VOC_AISHA_VK2_RUNOVER")
	persona_override_persona_start("SP_AISHA", "escort - stripper reacts to hitting vehicle", "VOC_AISHA_VK2_HITOBJECT")
		
	--hud_timer_pause(false)
	while (not vk02_stalker_created) do
		thread_yield()
	end
	
	vehicle_degrade_control("vk02_chase_van", 2.0, 2.0, 2.0)
	vehicle_chase("vk02_chase_van", "#PLAYER#", false, true, true )
	
	--audio_play_for_character("STALKER_VK2_APPEAR_1", "vk02_van_driver", "voice", false, true)
	--audio_play_for_character("AISHA_VK2_SEESTALKER_1", "vk02_rap_artist", "voice", false, false)
	
	vk02_stalker_thread = thread_new("vk02_stalker_lines")
	vk02_damage_thread = thread_new("vk02_damage_lines")

	mission_help_table( "vk02_lose_stalker" )

	
	-- ditch stalker and wait for timer
	while(not vk02_Time_elapsed) do
		local v_dis = get_dist_vehicle_to_nav("vk02_det_car","vk02_record_studio")

		if (vk02_chasers_withdrawn) then
			if (v_dis<=vk02_MAX_EFFECTIVE_RANGE) then
				hud_timer_stop()
				vk02_Time_elapsed = true
				remove_marker_trigger("vk02_record_studio")
			end
		elseif (v_dis<=vk02_MAX_EFFECTIVE_RANGE) then
			mission_help_table( "vk02_lose_stalker2" )
			delay(1)
		end
		
		thread_yield()
	end
	
	
	-- final cutscene
	on_damage("","vk02_det_car",0)
	on_vehicle_destroyed( "", "vk02_det_car" )
	on_death("","vk02_rap_artist")
	on_vehicle_exit("", "vk02_det_car")
	local distance = get_dist_vehicle_to_nav("vk02_det_car","vk02_record_studio")
	
	if (distance > vk02_MAX_EFFECTIVE_RANGE or not vk02_chasers_withdrawn) then
		vk02_vehicle_failure()
		mission_end_failure("vk02", "vk02_fail_timer_expired")
	else
		hud_timer_stop()
		thread_kill(bomb_timer)
		party_dismiss("vk02_rap_artist")
		player_controls_disable()
		vehicle_stop("vk02_det_car")
		audio_play_for_character("AISHA_VK2_EXIT_4", "vk02_rap_artist", "voice", false, true)
		delay(0.3)
		audio_play_for_character("AISHA_VK2_EXIT_3", "vk02_rap_artist", "voice", false, true)
		vehicle_supress_npc_exit( "vk02_det_car", false )
		follower_remain_in_car("vk02_rap_artist", false)
		vehicle_exit("vk02_rap_artist")
		delay(0.01)
		cutscene_in("vk02_scene02")
		character_remove_vehicle("#PLAYER#")
		teleport("#PLAYER#", "vk02_player_post_cutscene")
		damage_indicator_off()
		thread_kill(vk02_damage_thread)
		thread_kill(vk02_stalker_thread)
		group_destroy("vk02_Group")
		group_destroy("vk02_chasers")
		player_controls_enable()
		cutscene_play("vk02_scene02", true)
		music_studio_set_state(1)
		mission_end_success("vk02")
	end
end

function vk02_vk02_Garage_reached()
	if (get_char_in_vehicle("vk02_det_car",0)=="#PLAYER#") then
		on_trigger("","vk02_garage")
		trigger_disable("vk02_garage")
		mission_waypoint_remove()
		vk02_Garage_reached = true
	else
		mission_help_table("vk02_exits_car")
	end
end

function vk02_detonate_car()
	vk02_Time_elapsed = true
end

function vk02_rap_artist_death()
	mission_end_failure("vk02", "vk02_fail_aisha_death")
end

function vk02_rap_artist_abandoned()
	mission_end_failure("vk02", "vk02_aisha_abandoned")
end

function vk02_chase_distance()
	while (not Vk02_cutscene_played) do
		thread_yield()
	end
	
	delay(15)
	
	while (not vk02_Time_elapsed) do
		if( is_dead("vk02_van_driver") or is_vehicle_destroyed("vk02_chase_van") or get_dist_char_to_vehicle("#PLAYER#", "vk02_chase_van") >= 190 ) then
			turn_vulnerable("vk02_van_driver")
			mission_help_table( "vk02_goto_studio" )
			mission_waypoint_add ( "vk02_studio_gps" )
			vk02_chasers_withdrawn = true
			vk02_distance_check = -1
			add_marker_trigger( "vk02_record_studio", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
			remove_marker_vehicle("vk02_chase_van")
			remove_marker_npc("vk02_van_driver")
			
			if (vk02_stalker_thread ~= -1) then
				thread_kill(vk02_stalker_thread)
				vk02_stalker_thread = -1
			end
			
			if (vk02_damage_thread ~= -1) then
				thread_kill(vk02_damage_thread)
				vk02_stalker_thread = -1
			end
			
			vehicle_flee("vk02_chase_van")

			return
		end
		
		thread_yield()
	end

	vk02_distance_thread = -1
end

function vk02_vehicle_failure()
	hud_timer_stop()
	damage_indicator_off()
	on_death("","vk02_rap_artist")
	vehicle_detonate("vk02_det_car")
	delay(4)
	
end

function vk02_vehicle_damage_threshold()
	vk02_vehicle_failure()	
	mission_end_failure("vk02", "vk02_fail_car_destroyed")
end