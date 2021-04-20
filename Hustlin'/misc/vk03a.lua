-- vk03a.lua
-- script for VK Mission 3a
-- created 1/30/05

VK03A_NUM_SEX = 4

--										Behind				BJ						Girls					Bed					front
VK03A_BROTHEL_DOOR_NAMES = {"VK_MeshMoverE01","VK_MeshMoverD01","VK_MeshMoverA01","VK_MeshMoverB01"}

VK03A_FRONT_DOOR = "VK_MeshMoverC01"

VK03A_BROTHEL_THUG_NAMES = {"vk03a_thug_behind","vk03a_thug_bj",
								"vk03a_thug_girls","vk03a_thug_bed"}
								
VK03A_BROTHEL_HO_NAMES = {"vk03a_stripper_behind","vk03a_stripper_bj",
								"vk03a_stripper_girls","vk03a_stripper_bed"}

 
VK03A_SEX_HO_ANIMS = {"pfl1_bs_sx_strtl.animx", "pfl1_bs_bj_strtl.animx", "pfl1_bs_he_give_strtl.animx", "PFL1_BS_SP_Strtl_B.animx"}
VK03A_SEX_THUG_ANIMS = {"pml1_bs_sx_strtl.animx", "pml1_bs_bj_strtl.animx", "pfl1_bs_he_get_strtl.animx", "PML1_BS_BED_Strtl.animx.animx"}

VK03A_BROTHEL_TARGET = {"vk03a_thug_bed", "vk03a_thug_girls", "vk03a_thug_behind", "vk03a_thug_bj", "vk03a_$c000", 
								"vk03a_$c001", "vk03a_$c002", "vk03a_$c003", "vk03a_$c004", "vk03a_$c005", "vk03a_$c006",
								"vk03a_$c007", "vk03a_$c008", "vk03a_$c009" }

VK03A_BROTHEL_NON_TARGET = {"vk03a_ho_bed", "vk03a_ho_girls", "vk03a_ho_behind", "vk03a_ho_bj", "vk03a_ho1", 
								"vk03a_ho2", "vk03a_ho3", "vk03a_client1", "vk03a_client2", "vk03a_client3" }

VK03A_SEX_SOUNDS = {"BFSTRP_CLIMAX_LOWPASS", "BFSTRP_SEX_LOWPASS", "BFSTRP_SEXFINISH_LOWPASS"}
	

-- CONSTANT VARIABLES
VK3a_REQUIRED_PROPS = 2000
VK3a_PROPS_REWARD = 1000

VK3a_group = "vk03a_$group-vk3a"

VK3a_gangsters = {
	"vk03a_vk3a_lvl1b_01", "vk03a_vk3a_lvl2l_02", "vk03a_vk3a_lvl1w_03",
	"vk03a_vk3a_lvl1b_04", "vk03a_vk3a_lvl1b_05"
}

VK3a_cars = {
	"vk03a_car_4dr_lowrider01#000", "vk03a_car_4dr_lowrider01#001",
	"vk03a_car_4dr_lowrider01#002", "vk03a_car_4dr_lowrider01#003"
}

VK3a_patrols = {
	{ "vk03a_$nav-vk3a-car0-pat1", "vk03a_$nav-vk3a-car0-pat2" },
	{ "vk03a_$nav-vk3a-car1-pat1", "vk03a_$nav-vk3a-car1-pat2" },
	{ "vk03a_$nav-vk3a-car2-pat1", "vk03a_$nav-vk3a-car2-pat2" },
	{ "vk03a_$nav-vk3a-car3-pat1", "vk03a_$nav-vk3a-car3-pat2" }
}

-- GLOBAL VARIABLES ---------------------
VK3a_cars_left = 4
VK3a_patrol_handles = {0,0,0,0}
VK3a_detect_handles = {0,0,0,0}

Vk03a_sound_threads = {-1,-1,-1,-1}

Vk03a_targets_living = -1

-- we have to use our own death flags for the gangstas since
-- if two die simultaniously it will throw off the script
VK3a_gangstas_dead = {false, false, false, false, false}

VK3a_gangster_damaged_flag = false

function vk03a_reset_globals()
	VK3a_cars_left = 4
	for i = 1, sizeof_table(VK3a_cars)  do
		VK3a_patrol_handles[i] = 0
		VK3a_detect_handles[i] = 0
	end
	
	Vk03a_targets_living = -1
end

-- FUNCTIONS ----------------------------

function vk03a_success()
	hood_set_owner("vk_redlight03","Playas")
	radio_post_event("NEWS_VK_KCEXPLO_02", false)
end

function vk03a_cleanup()
	special_spawns_enable(true)
	last_function("vk3a cleanup")
	mission_waypoint_remove()
	
	-- reset globals
	vk03a_reset_globals()
	on_trigger("", "vk03a_enter_alley")

	-- kill any still running threads
	
	for i,gangsta in pairs(VK3a_gangsters) do
		remove_marker_npc(gangsta)
	end

	-- deregister functions
	for i,gangsta in pairs(VK3a_gangsters) do
		on_death("", gangsta)
	end
	
	remove_marker_trigger("vk03a_enter_alley")
	
	for i,thug in pairs(VK03A_BROTHEL_TARGET) do
		remove_marker_npc(thug)
		on_death("", thug)
	end

	for i, door in pairs(VK03A_BROTHEL_DOOR_NAMES) do
		on_door_opened("", door)
	end
	
	-- release any groups to world
	group_destroy("vk03a_brothel_targets")
	release_to_world(VK3a_group)
	release_to_world("vk03a_brothel_inside")
	
	persona_override_remove_all("BM_VK1")
	persona_override_remove_all("BM_VK2")
	persona_override_remove_all("BM_VK3")
	persona_override_remove_all("WM_VK1")
	persona_override_remove_all("WM_VK2")
	persona_override_remove_all("WM_VK3")
	persona_override_remove_all("BF_VK1")
	persona_override_remove_all("BF_VK2")
	persona_override_remove_all("BF_VK3")
	persona_override_remove_all("WF_VK1")
	persona_override_remove_all("WF_VK2")
	persona_override_remove_all("WF_VK3")
	
	objective_text_clear()
end


function vk03a_start()
	last_function("vk3a start")
	special_spawns_enable(false)
	Vk03a_sound_threads = {-1,-1,-1,-1}
	music_studio_set_state(2)

	--set_mission_author("David Cobb")
	--set_mission_author("Russell Aasland")
	set_mission_author("Sandeep Shekar")

	-- init globals
	vk03a_reset_globals()

	-- mission setup
	--thread_new("vk03a_create")	
	
	
	-- cutscene
	cutscene_in("vk03a_scene01")
	cutscene_play("vk03a_scene01")
	
	notoriety_set_max("vice_kings", 1)
	objective_text("vk03a_kill_count", VK3a_cars_left)
	vk03a_create()
	
	delay(2)
	-- mission prompt --
	mission_help_table( "vk03a_destroy_cars" )
	mission_waypoint_add( "vk03a_redlight_gps" )
	
	on_trigger("vk03a_alley_entered", "vk03a_enter_alley")
	trigger_enable("vk03a_enter_alley")
	
	while (true) do
		if ((get_current_hood_by_position("#PLAYER#") == "vk_redlight01") or (get_current_hood_by_position("#PLAYER#") == "vk_redlight02") or (get_current_hood_by_position("#PLAYER#") == "vk_redlight03")) then
			mission_waypoint_remove()
			break
		end
		thread_yield()
	end
end


function vk03a_create()
	last_function("vk3a create")

	create_group(VK3a_group, true)
	
	character_add_vehicle(VK3a_gangsters[1], VK3a_cars[1], 0)		-- setup characters
	character_add_vehicle(VK3a_gangsters[2], VK3a_cars[2], 0)
	character_add_vehicle(VK3a_gangsters[3], VK3a_cars[3], 0)
	character_add_vehicle(VK3a_gangsters[4], VK3a_cars[3], 1)
	character_add_vehicle(VK3a_gangsters[5], VK3a_cars[4], 0)

	for i,j in pairs(VK3a_gangsters) do
		on_death("vk03a_guy0" .. i .. "_dies", j)
	end

	for k,v in pairs(VK3a_cars) do
		-- start vehicle patrols
		vehicle_disable_flee(v, true)
		VK3a_patrol_handles[k] = thread_new("vk03a_car" .. k - 1 .. "_patrol")
	end
	-- add minimap/in-game icons
	for i,gangsta in pairs(VK3a_gangsters) do
		add_marker_npc(gangsta, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL) 
	end
end


-- while driver isn't dead, pathfind to next patrol point; is_dead() check added because pathfind call was
-- giving an error after killing your target
function vk03a_car0_patrol()
	mission_debug("vk3a car0 patrol", 0, 5)

	while (1) do
		if (not is_dead(VK3a_gangsters[1])) then
			mission_debug("car0 patrol a", 0, 1)
			vehicle_pathfind_to(VK3a_cars[1], VK3a_patrols[1][2], false)
		end
		if (not is_dead(VK3a_gangsters[1])) then
			mission_debug("car0 patrol b", 0, 1)
			vehicle_pathfind_to(VK3a_cars[1], VK3a_patrols[1][1], false)
		end
		delay(0.5)
	end
end


-- while driver isn't dead, pathfind to next patrol point
function vk03a_car1_patrol()
	mission_debug("vk3a car1 patrol", 0, 6)

	while (1) do
		if (not is_dead(VK3a_gangsters[2])) then
			mission_debug("car1 patrol a", 0, 2)
			vehicle_pathfind_to(VK3a_cars[2], VK3a_patrols[2][2], false)
		end
		if (not is_dead(VK3a_gangsters[2])) then
			mission_debug("car1 patrol b", 0, 2)
			vehicle_pathfind_to(VK3a_cars[2], VK3a_patrols[2][1], false)
		end
		delay(0.5)
	end
end


-- while driver isn't dead, pathfind to next patrol point
function vk03a_car2_patrol()
	mission_debug("vk3a car2 patrol", 0, 7)

	while (1) do
		if (not is_dead(VK3a_gangsters[3])) then
			mission_debug("car2 patrol a", 0, 3)
			vehicle_pathfind_to(VK3a_cars[3], VK3a_patrols[3][2], false)
		end
		if (not is_dead(VK3a_gangsters[3])) then
			mission_debug("car2 patrol b", 0, 3)
			vehicle_pathfind_to(VK3a_cars[3], VK3a_patrols[3][1], false)
		end
		delay(0.5)
	end
end

-- while driver isn't dead, pathfind to next patrol point
function vk03a_car3_patrol()
	mission_debug("vk3a car3 patrol", 0, 8)

	while (1) do
		if (not is_dead(VK3a_gangsters[5])) then
			mission_debug("car3 patrol a", 0, 4)
			vehicle_pathfind_to(VK3a_cars[4], VK3a_patrols[4][2], false)
		end
		if (not is_dead(VK3a_gangsters[5])) then
			mission_debug("car3 patrol b", 0, 4)
			vehicle_pathfind_to(VK3a_cars[4], VK3a_patrols[4][1], false)
		end
		delay(0.5)
	end
end

function vk03a_vehicle_detect_loop(char_name)
	last_function("vk3a vehicle detect loop("..char_name..")")

	while (not is_player_detected_by_vehicle(char_name, 60)) do
		delay(0.25)
	end
	
	mission_debug("player found!", 3.0)
	car_combat(char_name)
	notoriety_set("vice_kings", 1) 
	notoriety_set_min("vice_kings", 1)
end


function vk03a_guy01_dies(name)
	mission_debug("vk3a guy01 dies", 0, 4)

	VK3a_gangstas_dead[1] = true
	remove_marker_npc(name)
	thread_kill(VK3a_patrol_handles[1])
	thread_kill(VK3a_detect_handles[1])
	VK3a_cars_left = VK3a_cars_left - 1
	vk03a_check_all_chars_dead()
end


function vk03a_guy02_dies(name)
	mission_debug("vk3a guy02 dies", 0, 5)

	VK3a_gangstas_dead[2] = true
	remove_marker_npc(name)
	thread_kill(VK3a_patrol_handles[2])
	thread_kill(VK3a_detect_handles[2])
	VK3a_cars_left = VK3a_cars_left - 1
	vk03a_check_all_chars_dead()
end

function vk03a_guy03_dies(name)
	mission_debug("vk3a guy03 dies", 0, 6)

	thread_kill(VK3a_patrol_handles[3])
	VK3a_gangstas_dead[3] = true
	remove_marker_npc(name)

	vk03a_check_car3()
end

function vk03a_guy04_dies(name)
	mission_debug("vk3a guy04 dies", 0, 7)
	VK3a_gangstas_dead[4] = true
	remove_marker_npc(name)

	vk03a_check_car3()
end

-- since car3 has a passenger it gets special handling
function vk03a_check_car3()
	last_function("vk3a check car3", 5)

	-- only kill detection loop and remove minimap icon if the other passenger is also dead
	if VK3a_gangstas_dead[3] == true and VK3a_gangstas_dead[4] == true then
		thread_kill(VK3a_detect_handles[3])
		VK3a_cars_left = VK3a_cars_left - 1
		vk03a_check_all_chars_dead()
	end
end

function vk03a_guy05_dies(name)
	mission_debug("vk3a guy05 dies", 0, 8)

	VK3a_gangstas_dead[5] = true
	remove_marker_npc(name)
	thread_kill(VK3a_patrol_handles[4])
	thread_kill(VK3a_detect_handles[4])
	VK3a_cars_left = VK3a_cars_left - 1
	vk03a_check_all_chars_dead()
end

function vk03a_check_all_chars_dead()
	notoriety_set("vice_kings", 1) 
	notoriety_set_min("vice_kings", 1)
	
	last_function("vk3a check_all_chars_dead", 5)
	local gangstas_dead = true
	for i, gangsta in pairs(VK3a_gangstas_dead) do
		if (not gangsta) then
			gangstas_dead = false
		end
	end
	
	objective_text("vk03a_kill_count", VK3a_cars_left)
	
	if gangstas_dead and (VK3a_cars_left == 0) then
		vk03a_cellphone_call()
	end
end

function vk03a_cellphone_call()
	objective_text_clear()
	group_create("vk03a_brothel_targets", true)
	create_group("vk03a_brothel_inside", true)
	-- Cellphone call
	--audio_play("SYS_CELL_RING", "foley", false, true)
	--delay(0.5)
	--audio_play("SYS_CELL_RING", "foley", false, true)
	--delay(0.5)
	--audio_play("GAT_VK3A_PHONE1_1", "voice", false, true)
	audio_play_for_cellphone_force( "SYS_CELL_RING", "GAT_VK3A_PHONE1_1" ) -- rings 2*, animates cell phone, and plays audio
	--cellphone_add_message("GAT_VK3A_PHONE1_1", "Johnny Gat")
	
	-- start second phase of mission here
	vk03a_stronghold_start()
end

function vk03a_one_dead(deadguy)
	remove_marker_npc(deadguy)
	Vk03a_targets_living = Vk03a_targets_living - 1
	objective_text("vk03b_kill_count", Vk03a_targets_living, sizeof_table( VK03A_BROTHEL_TARGET ))
	if (Vk03a_targets_living < 1) then
		delay(2)
	
		-- cutscene...apparently
		cutscene_in("vk03b_scene01")
		cutscene_play("vk03b_scene01", true)
	
		mission_end_success("vk03a")
	end
end

function vk03a_alley_entered()
	trigger_disable("vk03a_enter_alley")
	
	while( Vk03a_targets_living == -1 ) do
		thread_yield()
	end
	
	mission_waypoint_remove()
	remove_marker_trigger("vk03a_enter_alley")
	mission_help_table( "vk03b_brothel_kill" )
	objective_text("vk03b_kill_count", Vk03a_targets_living, sizeof_table( VK03A_BROTHEL_TARGET ))
	
	for i, target in pairs(VK03A_BROTHEL_TARGET) do
		on_death("vk03a_one_dead", target)
		add_marker_npc(target, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL) 
	end
	
	for i, door in pairs(VK03A_BROTHEL_DOOR_NAMES) do
		npc_turn_immaterial(VK03A_BROTHEL_THUG_NAMES[i]) 
		npc_turn_immaterial(VK03A_BROTHEL_HO_NAMES[i]) 
		on_door_opened("vk03a_door_opened", door)
		Vk03a_sound_threads[i] = thread_new("vk03a_room_noise", i)
	end
end

function vk03a_stronghold_start()
	mission_waypoint_add ( "vk03a_brothel_gps" )
	mission_help_table( "vk03b_brothel" )
	add_marker_trigger("vk03a_enter_alley", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)
	
	Vk03a_targets_living = sizeof_table( VK03A_BROTHEL_TARGET )
	
	persona_override_persona_start("BM_VK1", "threat - alert (solo attack)", "BMVK1_VK3B_ATTACK") 
	persona_override_persona_start("BM_VK1", "threat - alert (group attack)", "BMVK1_VK3B_ATTACK") 
	persona_override_persona_start("BM_VK1", "threat - damage received (firearm)", "BMVK1_VK3B_DAMAGED") 
	persona_override_persona_start("BM_VK2", "threat - alert (solo attack)", "BMVK2_VK3B_ATTACK") 
	persona_override_persona_start("BM_VK2", "threat - alert (group attack)", "BMVK2_VK3B_ATTACK") 
	persona_override_persona_start("BM_VK2", "threat - damage received (firearm)", "BMVK2_VK3B_DAMAGED") 
	persona_override_persona_start("BM_VK3", "threat - alert (solo attack)", "BMVK3_VK3B_ATTACK") 
	persona_override_persona_start("BM_VK3", "threat - alert (group attack)", "BMVK3_VK3B_ATTACK") 
	persona_override_persona_start("BM_VK3", "threat - damage received (firearm)", "BMVK3_VK3B_DAMAGED") 
	persona_override_persona_start("WM_VK1", "threat - alert (solo attack)", "WMVK1_VK3B_ATTACK") 
	persona_override_persona_start("WM_VK1", "threat - alert (group attack)", "WMVK1_VK3B_ATTACK") 
	persona_override_persona_start("WM_VK1", "threat - damage received (firearm)", "WMVK1_VK3B_DAMAGED") 
	persona_override_persona_start("WM_VK2", "threat - alert (solo attack)", "WMVK2_VK3B_ATTACK") 
	persona_override_persona_start("WM_VK2", "threat - alert (group attack)", "WMVK2_VK3B_ATTACK") 
	persona_override_persona_start("WM_VK2", "threat - damage received (firearm)", "WMVK2_VK3B_DAMAGED") 
	persona_override_persona_start("WM_VK3", "threat - alert (solo attack)", "WMVK3_VK3B_ATTACK") 
	persona_override_persona_start("WM_VK3", "threat - alert (group attack)", "WMVK3_VK3B_ATTACK") 
	persona_override_persona_start("WM_VK3", "threat - damage received (firearm)", "WMVK3_VK3B_DAMAGED") 
	
	persona_override_persona_start("BF_VK1", "threat - alert (solo attack)", "BFVK1_VK3B_ATTACK") 
	persona_override_persona_start("BF_VK1", "threat - alert (group attack)", "BFVK1_VK3B_ATTACK") 
	persona_override_persona_start("BF_VK1", "threat - damage received (firearm)", "BFVK1_VK3B_DAMAGED") 
	persona_override_persona_start("BF_VK2", "threat - alert (solo attack)", "BFVK2_VK3B_ATTACK") 
	persona_override_persona_start("BF_VK2", "threat - alert (group attack)", "BFVK2_VK3B_ATTACK") 
	persona_override_persona_start("BF_VK2", "threat - damage received (firearm)", "BFVK2_VK3B_DAMAGED") 
	persona_override_persona_start("BF_VK3", "threat - alert (solo attack)", "BFVK3_VK3B_ATTACK") 
	persona_override_persona_start("BF_VK3", "threat - alert (group attack)", "BFVK3_VK3B_ATTACK") 
	persona_override_persona_start("BF_VK3", "threat - damage received (firearm)", "BFVK3_VK3B_DAMAGED") 
	persona_override_persona_start("WF_VK1", "threat - alert (solo attack)", "WFVK1_VK3B_ATTACK") 
	persona_override_persona_start("WF_VK1", "threat - alert (group attack)", "WFVK1_VK3B_ATTACK") 
	persona_override_persona_start("WF_VK1", "threat - damage received (firearm)", "WFVK1_VK3B_DAMAGED") 
	persona_override_persona_start("WF_VK2", "threat - alert (solo attack)", "WFVK2_VK3B_ATTACK") 
	persona_override_persona_start("WF_VK2", "threat - alert (group attack)", "WFVK2_VK3B_ATTACK") 
	persona_override_persona_start("WF_VK2", "threat - damage received (firearm)", "WFVK2_VK3B_DAMAGED") 
	persona_override_persona_start("WF_VK3", "threat - alert (solo attack)", "WFVK3_VK3B_ATTACK") 
	persona_override_persona_start("WF_VK3", "threat - alert (group attack)", "WFVK3_VK3B_ATTACK") 
	persona_override_persona_start("WF_VK3", "threat - damage received (firearm)", "WFVK3_VK3B_DAMAGED") 
end

function vk03a_door_opened(door_opened)
	local doornum = 0
	
	for i, door in pairs(VK03A_BROTHEL_DOOR_NAMES) do
		if door_opened == door then
			doornum = i
		end
	end
	
	if (Vk03a_sound_threads[doornum] > -1) then
		thread_kill(Vk03a_sound_threads[doornum])
		Vk03a_sound_threads[doornum] = -1
	end
	
	
	local thug = VK03A_BROTHEL_THUG_NAMES[doornum]
	local ho = VK03A_BROTHEL_HO_NAMES[doornum]
	local thuganim = VK03A_SEX_THUG_ANIMS[doornum]
	local hoanim = VK03A_SEX_HO_ANIMS[doornum]
	
	thread_new("vk03a_thug_anim", thug, thuganim)
	thread_new("vk03a_ho_anim", ho, hoanim)
end

function vk03a_thug_anim(thug, thuganim)
	hearing_enable(thug)
	set_ignore_ai_flag(thug, true)
	play_custom_action( thug, thuganim )
	set_ignore_ai_flag(thug, false)
	npc_turn_material( thug )
	attack( thug )
end

function vk03a_ho_anim(ho, hoanim)
	hearing_enable(ho)
	set_ignore_ai_flag(ho, true)
	play_custom_action( ho, hoanim )
	set_ignore_ai_flag(ho, false)
	npc_turn_material( ho )
	flee( ho, "#PLAYER#", true )
end

function vk03a_room_noise(roomnum)
	local last = -1
	
	while (true) do
		local rand = last
		
		while (rand==last) do
			rand = rand_int( 1, sizeof_table(VK03A_SEX_SOUNDS) )
		end
		
		--last = rand
		audio_play_for_character( VK03A_SEX_SOUNDS[rand], VK03A_BROTHEL_HO_NAMES[roomnum],
																	"foley", false, true )
		
		--audio_play_persona_line(VK03A_BROTHEL_HO_NAMES[roomnum], "escort - both react to sex")
		delay( 1.0 )
	end
end

function last_function(text)
	mission_debug(text, 0, 0)
end

-- DEBUG FUNCTIONS ----------------------------------------
function vk03a_teleport()
	if (is_player_in_vehicle()) then
		teleport_vehicle( "#PLAYER#", "vk03a_debug_teleport" )
	else
		teleport( "#PLAYER#", "vk03a_debug_teleport" )
	end
end