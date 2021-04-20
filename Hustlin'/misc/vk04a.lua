-- vk04a.lua
-- script for VK Mission 4a
-- created 1/29/05

-- GLOBAL VARIABLES ---------------------


vk04a_Tanya_damage = false
vk04a_vehicle_chatter = -1


-- FUNCTIONS ----------------------------
function vk04a_debug_stuff()
	--func_hide_front_chars
	--func_show_front_chars
	--teleport("#PLAYER#", "vk04a_$nav-hideout1")
end

function vk04a_cleanup()
	--message("vk4a setup called")
	mission_waypoint_remove()
	special_spawns_enable( true )
	
	cellphone_remove("JULIUS_VK4B_PHONE_1")

	on_take_damage("", "vk04a_Tanya")
	on_death( "", "vk04a_JohnnyGat" )
	
	remove_marker_npc( "vk04a_Tanya" )
	
	on_door_opened( "", "projects_jail_MeshMover020" )
	on_door_opened( "", "projects_jail_MeshMover010" )

	release_to_world("vk04a_$Group4_sh_front")
	release_to_world("vk04a_$Group2_sh_1stfloor")
	release_to_world("vk04a_$Group1_sh_cells")
	release_to_world("vk04a_$Group3_sh_2ndfloor")
	release_to_world("vk04a_courtesy")
	destroy_group("vk04a_$Group_gat")
	destroy_group( "vk04a_$Group_tanya" )

	-- AM 1/29/05 FIXME:  instead of turning spawning in the whole city on/off, should turn spawning on/off in
	--		just whatever region is necessary.  need new script support for this though
	-- spawning_on()

	-- disable triggers on mission failure
	trigger_disable("vk04a_records_01")
	trigger_disable("vk04a_conf_01")
	trigger_disable("vk04a_hall_01")
	trigger_disable("vk04a_office1_01")
	trigger_disable("vk04a_cut1_stairs01")
	trigger_disable("vk04a_stairs_02")
	trigger_disable("vk04a_stairs_03")
	trigger_disable("vk04a_t_hall2_01")
	trigger_disable("vk04a_t_hall2_02")
	trigger_disable("vk04a_off2_01")
	trigger_disable("vk04a_cells_01")
	trigger_disable("vk04a_open_sh_door")
	trigger_disable("vk04a_hall1_02")
	trigger_disable("vk04a_sh_setup")
	trigger_disable("vk04a_sh_start")
	--trigger_disable("vk04a_$t_start_tanya" )
	--trigger_disable("vk04a_$t_start_tanya2" )
	
	on_trigger("", "vk04a_records_01")
	on_trigger("", "vk04a_conf_01")
	on_trigger("", "vk04a_hall_01")
	on_trigger("", "vk04a_office1_01")
	on_trigger("", "vk04a_cut1_stairs01")
	on_trigger("", "vk04a_stairs_02")
	on_trigger("", "vk04a_stairs_03")
	on_trigger("", "vk04a_t_hall2_01")
	on_trigger("", "vk04a_t_hall2_02")
	on_trigger("", "vk04a_off2_01")
	on_trigger("", "vk04a_cells_01")
	on_trigger("", "vk04a_open_sh_door")
	on_trigger("", "vk04a_hall1_02")
	on_trigger("", "vk04a_sh_setup")
	on_trigger("", "vk04a_sh_start")
	--trigger_disable("vk04a_$t_start_tanya" )
	--trigger_disable("vk04a_$t_start_tanya2" )
	
	
	trigger_disable("vk04a_$t-end-vk4b")
	trigger_disable("vk04a_$t_nearing_church")
	remove_marker_navpoint("vk04a_$tnav-end-vk4b")
	minimap_icon_remove_navpoint("vk04a_$nav_stronghold")
	
	release_to_world( "vk04a_escape_car" )
	release_to_world("vk04a_$Group-vk4b-01")

	set_attack_enemies_flag( "vk04a_VKfront01", false )
	set_attack_enemies_flag( "vk04a_VKfront02", false )
	set_attack_enemies_flag( "vk04a_VKfront03", false )
	set_attack_enemies_flag( "vk04a_VKfront04", false )
	set_attack_enemies_flag( "vk04a_VKfront05", false )
	set_attack_enemies_flag( "vk04a_VKfront06", false )
end


function vk04a_start()
	set_mission_author("Russell Aasland")
	
	door_lock( "projects_jail_MeshMover020", false )
	door_lock( "projects_jail_MeshMover010", false )

	
	-- Triggers --
	on_trigger("vk04a_records_room_attack", "vk04a_records_01")
	on_trigger("vk04a_conf_room_attack", "vk04a_conf_01")
	on_trigger("vk04a_hall_room_attack", "vk04a_hall_01")
	on_trigger("vk04a_office1_room_attack", "vk04a_office1_01")
	on_trigger("vk04a_stairs_cutscene", "vk04a_cut1_stairs01")
	
	--on_trigger("vk04a_stairs_attack1", "vk04a_stairs_02")
	on_trigger("vk04a_stairs_attack2", "vk04a_stairs_03")
	on_trigger("vk04a_hall2_attack1", "vk04a_t_hall2_01")
	on_trigger("vk04a_hall2_attack2", "vk04a_t_hall2_02")
	on_trigger("vk04a_end_cutscene", "vk04a_off2_01")
	on_trigger("vk04a_cells1_attack", "vk04a_cells_01")
	on_trigger("vk04a_sh_intro_cutscene", "vk04a_open_sh_door")
	on_trigger("vk04a_hall1_attack2", "vk04a_hall1_02")
	on_trigger("vk04a_sh_setup", "vk04a_sh_setup")
	on_trigger("vk04a_sh_start", "vk04a_sh_start")
	--on_trigger("vk04a_tanya1", "vk04a_$t_start_tanya" )
	--on_trigger("vk04a_tanya2", "vk04a_$t_start_tanya2" )
	
	on_trigger("vk04a_end", "vk04a_$t-end-vk4b")
	on_trigger("vk04a_nearing_church", "vk04a_$t_nearing_church" )
	
	on_take_damage("vk04a_tanya_damage", "vk04a_Tanya")

	never_die( "vk04a_JohnnyGat", true )
	
	on_death( "vk04a_johnny_death", "vk04a_JohnnyGat" )
	on_dismiss( "vk04a_johnny_abandon", "vk04a_JohnnyGat" )
	
	vk04a_vehicle_chatter = -1

	cutscene_in("vk04a_scene01")
	cutscene_play("vk04a_scene01", "vk04a_$Group_gat")
	teleport("#PLAYER#", "mission_start_vk04a")
	character_show("vk04a_JohnnyGat")
	vehicle_show("vk04a_courtesy")
	party_dismiss("#FOLLOWER3#")
	party_add("vk04a_JohnnyGat")
	
	notoriety_set_max( "vice_kings", 2 )

	minimap_icon_add_navpoint("vk04a_$nav_stronghold", MINIMAP_ICON_LOCATION)
	mission_waypoint_add("vk04a_police_gps")
--[[
	persona_override_human_start( "vk04a_JohnnyGat", "escort - stripper reacts to hitting human", "GAT_VK4A_CAR_PED" )
	persona_override_human_start( "vk04a_JohnnyGat", "escort - stripper reacts to hitting vehicle", "GAT_VK4A_CAR_VEH" )
]]
	vk04a_vehicle_chatter = thread_new("vk04a_gat_idle_chatter", "vk04a_JohnnyGat", "GAT_VK4A_CAR_1", "GAT_VK4A_CAR_2")

	-- enable triggers needed for mission
	trigger_enable("vk04a_records_01")
	trigger_enable("vk04a_conf_01")
	trigger_enable("vk04a_hall_01")
	trigger_enable("vk04a_office1_01")
	trigger_enable("vk04a_cut1_stairs01") -- this and above double checked
	trigger_enable("vk04a_stairs_02")
	trigger_enable("vk04a_stairs_03")
	trigger_enable("vk04a_t_hall2_01")
	trigger_enable("vk04a_t_hall2_02")
	trigger_enable("vk04a_off2_01")
	trigger_enable("vk04a_cells_01")
	trigger_enable("vk04a_open_sh_door")
	--trigger_enable("vk04a_$t_start_tanya" )
	--trigger_enable("vk04a_$t_start_tanya2" )
	trigger_enable("vk04a_hall1_02")
	trigger_enable("vk04a_sh_setup")
	trigger_enable("vk04a_sh_start")
	create_group("vk04a_$Group4_sh_front", true)
	
	delay(2)
	mission_help_table( "vk04_goto_stronghold" )
end

function vk04a_success()
	message("A Winner is You!")
	mission_unlock("projects_police")
	--hood_set_owner("vk_downtown03","Playas")
	mission_set_next_props_req( "vice_kings", VK05_REQUIRED_PROPS )
end

function vk04a_johnny_death()
	mission_end_failure( "vk04a", "vk04_fail_gat_death" )
end

function vk04a_johnny_abandon()
	mission_end_failure( "vk04a", "vk04_johnny_abandoned" )
end

function vk04a_stairs_cutscene()
	trigger_disable("vk04a_cut1_stairs01")
	attack("vk04a_stairs03")
	
	vk04a_tanya2()
end

function vk04a_gat_idle_chatter(name, ... )
	while (not is_player_in_vehicle()) do
		thread_yield()
	end
	delay(2)
	audio_play_for_character( "GAT_VK4A_CHATTER_1", name, "voice", false, true )
	delay(2)
	audio_play_for_character( "GAT_VK4A_CHATTER_2", name, "voice", false, true )
	delay(4)
	audio_play_for_character( "GAT_VK4A_CHATTER_3", name, "voice", false, true )

	local play_table = {}
	
	for x=1, arg.n+1, 1 do
		play_table[x] = false
	end
	
	while( not play_table[arg.n+1] ) do
		while (not is_player_in_vehicle() ) do
			thread_yield()
		end

		delay( rand_float( 10, 20) )
	
		local rand = rand_int( 1, arg.n )
		while( play_table[ rand ] ) do
			rand = rand_int( 1, arg.n )
		end
		play_table[rand] = true
	
		play_table[arg.n+1] = true
		for x=1, arg.n, 1 do
			play_table[arg.n+1] = play_table[arg.n+1] and play_table[x]
		end

		while( npc_is_speaking(name) ) do
			delay( rand_float( 5, 15) )
		end

		audio_play_for_character( arg[rand], name, "voice", false, true )
	end
end

function vk04a_sh_setup()
	--message("sh setup trigger", 2.0)
	trigger_disable("vk04a_sh_setup")

	-- AM 1/29/05 FIXME:  instead of turning spawning in the whole city on/off, should turn spawning on/off in
	--		just whatever region is necessary.  need new script support for this though
	spawning_off()

	minimap_icon_remove_navpoint("vk04a_$nav_stronghold")
	mission_waypoint_remove()
	
	thread_kill( vk04a_vehicle_chatter )

	audio_play_for_character( "GAT_VK4A_ARRIVE_1", "vk04a_JohnnyGat", "voice" )
	
	persona_override_human_stop( "vk04a_JohnnyGat", "escort - stripper reacts to hitting human" )
	persona_override_human_stop( "vk04a_JohnnyGat", "escort - stripper reacts to hitting vehicle" )
	
	persona_override_human_start( "vk04a_JohnnyGat", "threat - damage received (firearm)", "GAT_VK4A_DAMAGE" )
	persona_override_human_start( "vk04a_JohnnyGat", "threat - alert (group attack)", "GAT_VK4A_ATTACK" )
	
	

--[[
	persona_override_human_start( "vk04a_JohnnyGat", "combat - congratulate player", "GAT_VK4A_ATTACK" )
	persona_override_human_start( "vk04a_JohnnyGat", "combat - congratulate self", "GAT_VK4A_ATTACK" )
]]
end

function vk04a_sh_start()
	--message("sh setup trigger", 2.0)
	trigger_disable("vk04a_sh_start")
	
	set_attack_enemies_flag( "vk04a_VKfront01", true )
	set_attack_enemies_flag( "vk04a_VKfront02", true )
	set_attack_enemies_flag( "vk04a_VKfront03", true )
	set_attack_enemies_flag( "vk04a_VKfront04", true )
	set_attack_enemies_flag( "vk04a_VKfront05", true )
	set_attack_enemies_flag( "vk04a_VKfront06", true )
end

function func_hide_hall2_chars()
	character_hide("vk04a_hall2_01")
	character_hide("vk04a_hall2_02")
	character_hide("vk04a_hall2_03")
	character_hide("vk04a_hall2_04")
	character_hide("vk04a_hall2_05")
	character_hide("vk04a_stairs07")
end

function vk04a_records_room_attack()
	--message("records room trigger", 2.0)
	trigger_disable("vk04a_records_01")
	attack("vk04a_rec01")
	attack("vk04a_rec02")
	attack("vk04a_rec03")
end

function vk04a_conf_room_attack()
	--message("conference room trigger", 2.0)
	trigger_disable("vk04a_conf_01")
	attack("vk04a_conf04")
end

function vk04a_hall_room_attack()
	--message("hall trigger", 2.0)
	trigger_disable("vk04a_hall_01")
	attack("vk04a_hall01")
	attack("vk04a_hall02")
	delay(1.0)
	attack("vk04a_off1_02")
end

function vk04a_hall1_attack2()
	--message("hall1 attack2 trigger", 2.0)
	trigger_disable("vk04a_hall1_02")
	--attack("vk04a_off1_03") -- 10/31/04 FIXME - 2 ATTACK() CALLS ON SAME NPC (?) ASSERTING

	create_group("vk04a_$Group3_sh_2ndfloor",true)
	create_group("vk04a_$Group1_sh_cells", true)

	character_show("vk04a_stairs01")
	character_show("vk04a_stairs03")
	character_show("vk04a_stairs05")
	character_show("vk04a_stairs06")
end

function vk04a_office1_room_attack()
	--message("office1 trigger", 2.0)
	trigger_disable("vk04a_office1_01")
	crouch_stop("vk04a_off1_01") -- 10/31/04 FIXME -- NECESSARY OR DOES ATTACK GET THEM OUT OF CROUCH AUTOMATICALLY?
	attack("vk04a_off1_01")
	attack("vk04a_off1_03")
end

function vk04a_stairs_attack1() -- stairwell to cells
	-- message("stairs attack1 trigger", 2.0)
	trigger_disable("vk04a_stairs_02")
	attack("vk04a_stairs05")
	attack("vk04a_stairs06")
end

function vk04a_stairs_attack2() -- stairwell to 2nd floor
	--message("stairs attack2 trigger", 2.0)
	trigger_disable("vk04a_stairs_03")
	attack("vk04a_stairs07")
	attack("vk04a_stairs01")
end

function vk04a_hall2_attack1() -- upstairs hallway, before final room
	--message("hall2 attack trigger", 2.0)
	trigger_disable("vk04a_t_hall2_01")
	attack("vk04a_hall2_01")
	attack("vk04a_hall2_02")
	delay(0.5)
	attack("vk04a_hall2_03")
	delay(1.0)
	attack("vk04a_hall2_04")
	
	vk04a_tanya3()
end

function vk04a_hall2_attack2()
	--message("hall2 attack2 trigger", 2.0)
	trigger_disable("vk04a_t_hall2_02")
end

function vk04a_cells1_attack()
	--message("cells1 attack trigger", 2.0)
	trigger_disable("vk04a_cells_01")
	attack("vk04a_cell1_01")
end

function func_hide_cells1_chars()
	character_hide("vk04a_cell1_01")
	
end

function func_hide_cells2_chars()
end

function func_hide_cells3_chars()
end

function vk04a_cellphone()
	mission_help_table("vk04_escape_to_sr")

	add_marker_trigger("vk04a_$t-end-vk4b", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	mission_waypoint_add("vk04a_church_gps")
	
	trigger_enable("vk04a_$t-end-vk4b")
	trigger_enable("vk04a_$t_nearing_church")
end

function vk04a_end_cutscene()
	trigger_disable("vk04a_off2_01")

	cutscene_in("vk04a_scene02")
	party_dismiss("vk04a_JohnnyGat")
	release_to_world("vk04a_courtesy")
	group_destroy( "vk04a_$Group_gat" )
	thread_kill( vk04a_tanya_move_thread )
	remove_marker_npc( "vk04a_Tanya" )
	character_hide( "vk04a_Tanya" )
	
	cutscene_play("vk04a_scene02", "vk04a_$Group-vk4b-01")
	
	vehicle_show( "vk04a_escape_car" )

	teleport("#PLAYER#", "vk04a_$nav_warp_sh_end")
	
	notoriety_set_max( "police", 5 )

	notoriety_set("police", 3.5)
	notoriety_set("vice_kings", 2.5)
	
	special_spawns_enable( false )
	
	release_to_world("vk04a_$Group4_sh_front")
	release_to_world("vk04a_$Group2_sh_1stfloor")
	release_to_world("vk04a_$Group1_sh_cells")
	release_to_world("vk04a_$Group3_sh_2ndfloor")
	
	delay(1.2)
	cellphone_register("vk04a_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 6, 1.2, 0.65, "JULIUS_VK4B_PHONE_1", "Julius", true, "", "vk04a_cellphone")
	
	
	-- AM 1/29/05 FIXME:  instead of turning spawning in the whole city on/off, should turn spawning on/off in
	--		just whatever region is necessary.  need new script support for this though
	spawning_on()
end

function vk04a_nearing_church()
	notoriety_reset("police")
end

function vk04a_door_opened()
	on_door_opened( "", "projects_jail_MeshMover020" )
	on_door_opened( "", "projects_jail_MeshMover010" )

	character_show("vk04a_Tanya")
	turn_invulnerable("vk04a_Tanya")
	npc_prevent_kneecapping("vk04a_Tanya", true )
	npc_prevent_flinching( "vk04a_Tanya", true )
	set_ignore_ai_flag("vk04a_Tanya", true)
	
	vk04a_tanya1()
end

function vk04a_sh_intro_cutscene()
	trigger_disable("vk04a_open_sh_door")
	
	on_door_opened( "vk04a_door_opened", "projects_jail_MeshMover020" )
	on_door_opened( "vk04a_door_opened", "projects_jail_MeshMover010" )
	
	notoriety_set_max( "police", 2 )

	group_create_hidden( "vk04a_$Group_tanya" )
	create_group("vk04a_$Group2_sh_1stfloor", true)

	character_hide("vk04a_hall2_05")
	character_hide("vk04a_fromcell1")
	character_hide("vk04a_stairs03") -- used in func_stairs_attack2
	character_hide("vk04a_stairs05") -- used in func_stairs_attack2
	character_hide("vk04a_stairs06") -- used in func_stairs_attack2

	crouch_start("vk04a_cube03") -- make cube03 dude crouch in next room
	crouch_start("vk04a_off1_01") -- make off1_01 dude in office1 crouch
end

function crouch_test()
	crouch_start("vk04a_cube03")
	crouch_start("vk04a_off1_01")
end

-- debug functions
function func_hide_front_chars()
	character_hide("vk04a_VKfront01")
	character_hide("vk04a_VKfront02")
	character_hide("vk04a_VKfront03")
	character_hide("vk04a_VKfront04")
	character_hide("vk04a_VKfront05")
	character_hide("vk04a_VKfront06")

	character_hide("vk04a_TSfront01")
	character_hide("vk04a_TSfront02")
	character_hide("vk04a_TSfront03")
	character_hide("vk04a_TSfront04")
end

function func_show_front_chars()
	character_show("vk04a_VKfront01")
	character_show("vk04a_VKfront02")
	character_show("vk04a_VKfront03")
	character_show("vk04a_VKfront04")
	character_show("vk04a_VKfront05")
	character_show("vk04a_VKfront06")

	character_show("vk04a_TSfront01")
	character_show("vk04a_TSfront02")
	character_show("vk04a_TSfront03")
	character_show("vk04a_TSfront04")
end

function func_hide_cube_chars()
	character_hide("vk04a_cube01")
	character_hide("vk04a_cube02")
	--character_hide("vk04a_cube03")
end

function func_hide_rec_chars()
	character_hide("vk04a_rec01")
	character_hide("vk04a_rec02")
	character_hide("vk04a_rec03")
end

function func_hide_hall_chars()
	character_hide("vk04a_hall01")
	character_hide("vk04a_hall02")
end

function func_hide_cut_stairs_chars()
	character_hide("vk04a_stairs01")
	character_hide("vk04a_stairs03")
end

function vk04a_end()
	trigger_disable("vk04a_$t-end-vk4b")
	
	cutscene_in("vk04b_scene02")
	cutscene_play( "vk04b_scene02", true )
	
	mission_end_success("vk04a")
end

function vk04a_tanya_damage()
	vk04a_Tanya_damage = true
	mission_debug( "tanya hit", 4 )
end

function vk04a_tanya_should_delay( play_time )
	
	if (vk04a_tanya_move_thread ~= -1) then
		return false
	end
	
	if (vk04a_Tanya_damage) then
		return false
	end
	
	if (play_time <=0) then
		return false
	end
	
	return true
end

vk04a_tanya_move_thread = -1
function vk04a_tanya1()
	--trigger_disable( "vk04a_$t_start_tanya" )
	mission_help_table( "vk04_kill_tanya" )
	add_marker_npc( "vk04a_Tanya", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	vk04a_tanya_move_thread = -1

	attack("vk04a_cube01")
	attack("vk04a_cube02")
	crouch_stop("vk04a_cube03")
	attack("vk04a_cube03")
	
	vk04a_Tanya_damage = false
	--play_action_do( "vk04a_Tanya", "talk yell", "", false )
	audio_play_for_character( "TANYA_VK4A_TAUNT_1", "vk04a_Tanya", "voice", false, false )
	
	delay(2)
	
	vk04a_tanya_move_thread = thread_new( "vk04a_tanya1_move" )
end

function vk04a_tanya2()
	trigger_disable("vk04a_$t_start_tanya2" )
	character_show("vk04a_hall2_05")

	vk04a_Tanya_damage = false
	--play_action_do( "vk04a_Tanya", "talk yell", "", false )
	audio_play_for_character( "TANYA_VK4A_TAUNT_2", "vk04a_Tanya", "voice", false, false)
	
	vk04a_stairs_attack1()

	delay(2)
	
	thread_kill( vk04a_tanya_move_thread )
	vk04a_tanya_move_thread = thread_new( "vk04a_tanya2_move" )
end

function vk04a_tanya3()
	vk04a_Tanya_damage = false
	--play_action_do( "vk04a_Tanya", "talk yell", "", false )
	audio_play_for_character( "TANYA_VK4A_TAUNT_3", "vk04a_Tanya", "voice", false, false)
	
	delay(2)
	
	thread_kill( vk04a_tanya_move_thread )
	vk04a_tanya_move_thread = thread_new( "vk04a_tanya3_move" )
end

function vk04a_tanya1_move()
	move_to("vk04a_Tanya","vk04a_$nav_tanya_hall_02",3)
	turn_to_orient("vk04a_Tanya","vk04a_$nav_tanya_hall_02")
	vk04a_tanya_move_thread = -1
end

function vk04a_tanya2_move()
	move_to("vk04a_Tanya","vk04a_$hall2_tanya_02",3)
	turn_to_orient("vk04a_Tanya","vk04a_$hall2_tanya_02")
	vk04a_tanya_move_thread = -1
end

function vk04a_tanya3_move()
	move_to("vk04a_Tanya","vk04a_$nav_end_tanya",3)
	vk04a_tanya_move_thread = -1
end