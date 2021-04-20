-- redlight.lua
-- SR district script
-- 9/14/05


-- IDEAS/FIXME ------------
	-- P	1) NAVMESH
	-- P	2) AI/GEO PROBLEM ON RIGHT SIDE
	-- P	7) CLIMB SPLINES FOR WINDOW

	-- X	3) ATTACK WAVE
	-- X	4) OBJECTIVE/WIN CONDITION
	-- 5) HELP TEXT
	-- 6) COVER
	-- 7) KILL THREADS UPON WINNING/FAILING/EXITING STRONGHOLD
	-- 8) ADD CORRECT MINIMAP ICONS, IN-GAME EFFECTS
	-- 9) SCRIPT SNIPERS
	-- have some cars start out as normal driving (so easier to hit)
	-- vary attacker cars (some non-convertible to make sniping difficult?)
	-- vehicle_chase() not working when player is on rooftop; related to bad navmesh?
	-- SNIPER BATTLE!  :)  ROCKET LAUNCHER BATTLE!  :)  :)
	-- SNIPERS ON ROOFTOPS!!  :)  :)
	-- 'never cower or flee' flag -> will they still use cover with this setting?
	-- tracers for snipers
	-- real 'ignore ai' flag, for snipers running for cover
	-- geo change - add cover to rooftop for player to use against snipers
	-- force sniper pickup after 1st part of stronghold

	-- X	ADD USE TRIGGER
	-- X	CHANGE APT WINDOW TO DOOR?

	-- TRIGGER PASS
	-- STRONGHOLD CODE:  EFFECTS FOR USE TRIGGER?


--[[
possibilities for stronghold attack:
	- survive for X minutes during attack, text "Defend the stronghold!"
		- use AI - attack() command or similar; AI guides enemies up to rooftop
		- use script - fake attack by spawning/teleporting guys on rooftop
	- kill all enemies before they get to some point, e.g. front door
	- Saints form barricade; protect friends
]]

--	X	make drivers not flee?
-- X	DRIVER DYING OPTIONS:
	-- make drivers invuln?
		-- problems: if player snipes driver; fix - disable weapon select
	-- give drivers more hp?
	-- give cars less hp?
	-- add on_death() for driver which
		-- counts hit separately?
		-- destroys car?

-- MAKE EXIT TRIGGER FOR ROOF AREA
-- X	USE RANDOMIZED CARS IN SHOOTING GALLERY
-- FIXME -- 2-5, 6-3 PAIR OF CARS SLAM INTO EACH OTHER!!!!!!!!!!
-- fixme -- suppress AI behavior? -- VK driver hit and/or was hit by a civvy, got out and started fighting


-- GLOBAL VARIABLES---------
Redlight_sh_rooftop_death_count = 0			-- 6 occurrences
Redlight_sh_rooftop_death_required = 5		-- 4
--Redlight_sh_rooftop_vehicles_total = 6		-- 8 (inc below) -- FIXME -- STILL NEEDED?
Redlight_sh_rooftop_miss_current = 0
Redlight_sh_rooftop_miss_max = 10 - Redlight_sh_rooftop_death_required
--Redlight_sh_rooftop_vehicles = {"redlight_$v0000", "redlight_$v0001", "redlight_$v0002", "redlight_$v0003", "redlight_$v0004", "redlight_$v0005"}
Redlight_sh_rooftop_v_handles = {}			-- 11
Handle_redlight_rooftop_roof_attackers = 0


Redlight_stronghold_node1_node4 = {"redlight_$n-rooftop-node01", "redlight_$n-rooftop-travel01",
												"redlight_$n-rooftop-travel02", "redlight_$n-rooftop-node04"}
Redlight_stronghold_node1_node5 = {"redlight_$n-rooftop-node01", "redlight_$n-rooftop-travel01",
												"redlight_$n-rooftop-travel02", "redlight_$n-rooftop-travel03",
												"redlight_$n-rooftop-travel04", "redlight_$n-rooftop-node05"}
Redlight_stronghold_node1_node6 = {"redlight_$n-rooftop-node01", "redlight_$n-rooftop-travel01",
												"redlight_$n-rooftop-travel02", "redlight_$n-rooftop-travel03",
												"redlight_$n-rooftop-travel05", "redlight_$n-rooftop-travel06",
												"redlight_$n-rooftop-travel07", "redlight_$n-rooftop-node06"}
Redlight_stronghold_node2_node5 = {"redlight_$n-rooftop-node02", "redlight_$n-rooftop-travel01",
												"redlight_$n-rooftop-travel02", "redlight_$n-rooftop-travel03",
												"redlight_$n-rooftop-travel04", "redlight_$n-rooftop-node05"}
Redlight_stronghold_node3_node6 = {"redlight_$n-rooftop-node03", "redlight_$n-rooftop-travel03",
												"redlight_$n-rooftop-travel05", "redlight_$n-rooftop-travel06",
												"redlight_$n-rooftop-travel07", "redlight_$n-rooftop-node06"}
Redlight_stronghold_node4_node5 = {"redlight_$n-rooftop-node04", "redlight_$n-rooftop-travel03",
												"redlight_$n-rooftop-travel04", "redlight_$n-rooftop-node05"}
Redlight_stronghold_node6_node5 = {"redlight_$n-rooftop-node06", "redlight_$n-rooftop-travel07",
												"redlight_$n-rooftop-travel06", "redlight_$n-rooftop-travel05",
												"redlight_$n-rooftop-travel04", "redlight_$n-rooftop-node05"}

Redlight_stronghold_car_targets = {"redlight_$v-rooftop-01", "redlight_$v-rooftop-02", "redlight_$v-rooftop-03", "redlight_$v-rooftop-04",
										"redlight_$v-rooftop-05", "redlight_$v-rooftop-06", "redlight_$v-rooftop-07", "redlight_$v-rooftop-08",
										"redlight_$v-rooftop-09", "redlight_$v-rooftop-010"}

Redlight_roof_handle_walk1 = 0
Redlight_roof_handle_walk2 = 0

Redlight_roof_phone_handle = 0


-- FUNCTIONS----------------

function redlight_init()
	on_stronghold_takeover_start("redlight_sh_rooftop_start", "redlight_sh_rooftop")
	on_stronghold_reset("redlight_sh_rooftop_reset", "redlight_sh_rooftop")
	on_stronghold_takeover_success("redlight_sh_rooftop_success", "redlight_sh_rooftop")
--	on_stronghold_check_enable("redlight_sh_rooftop_unlock", "redlight_sh_rooftop")
	stronghold_set_cost( "redlight_sh_rooftop",  REDLIGHT_SH_REQUIRED_PROPS)

	--debug_redlight()
end

function debug_redlight()
	teleport("#PLAYER#", "redlight_$n-rooftop-warp1")	-- door
	stronghold_enable("redlight_sh_rooftop")

	--teleport("#PLAYER#", "redlight_$n-rooftop-warp2")	-- roof
	--teleport("#PLAYER#", "redlight_$n-rooftop-warp3")	-- far
	--inv_item_add("sniper_rifle")
end


function redlight_main()
	if (is_mission_complete("redlight_sh_rooftop")) then
		door_lock("redlight_Roof_MeshMover010", false)
		door_lock("redlight_Roof_MeshMover021", false)
	else
		door_lock("redlight_Roof_MeshMover010", true)
		door_lock("redlight_Roof_MeshMover021", true)
	end
end


-- debug function - call from the console with 'lua' command
function warp_redlight()
	message("warping...")
	delay(0)
	player_teleport(  "redlight_$nav-warp")
end




----------------------------------------------
-- VK REDLIGHT ROOFTOP STRONGHOLD ------------
----------------------------------------------

function redlight_sh_rooftop_reverse_array(array)
	local reversed_array = {}
	local j = sizeof_table(array)

	for i = 1, sizeof_table(array), 1 do
		reversed_array[i] = array[j]
		j = j - 1
	end

	return reversed_array
end

Redlight_stronghold_node6_node3 = redlight_sh_rooftop_reverse_array(Redlight_stronghold_node3_node6)

Redlight_stronghold_path_car1 = {Redlight_stronghold_node2_node5, Redlight_stronghold_node1_node6, Redlight_stronghold_node4_node5,
										Redlight_stronghold_node3_node6, Redlight_stronghold_node2_node5, Redlight_stronghold_node1_node6,
										Redlight_stronghold_node6_node5}

Redlight_stronghold_path_car2 = {Redlight_stronghold_node6_node3, Redlight_stronghold_node4_node5, Redlight_stronghold_node1_node4}

-- 2006/02/28 STL: This function isn't being called anymore.
function redlight_sh_rooftop_unlock()
	if ( is_mission_complete("vk07") ) then
		stronghold_enable("redlight_sh_rooftop")
		debug_message("redlight stronghold unlocked!")
	end
end


function redlight_sh_rooftop_reset()
	thread_kill(Handle_redlight_rooftop_roof_attackers)

	thread_kill(Redlight_roof_handle_walk1)
	thread_kill(Redlight_roof_handle_walk2)

	-- OLD OLD OLD
	--for i = 1, Redlight_sh_rooftop_vehicles_total, 1 do
		--thread_kill(Redlight_sh_rooftop_v_handles[Redlight_sh_rooftop_vehicles[i]])
		--remove_marker_vehicle(Redlight_sh_rooftop_vehicles[i])
	--end

	for i = 1, 10, 1 do
		remove_marker_vehicle(Redlight_stronghold_car_targets[i])
		release_to_world(Redlight_stronghold_car_targets[i])
	end

	release_to_world("redlight_$Apartment")
	release_to_world("redlight_$IntStairs")
	release_to_world("redlight_$Rooftop1")
	release_to_world("redlight_$Rooftop2")
	group_destroy("redlight_$Rooftop2-items")
	release_to_world("redlight_$G-rooftop-wave02")
	release_to_world("redlight_$G-rooftop-wave03")
	release_to_world("redlight_$G-rooftop-roof01")
	release_to_world("redlight_$G-rooftop-roof02")
	release_to_world("redlight_$G-rooftop-roof03")

	trigger_disable("redlight_$t-rooftop-stairs")			-- disable triggers
	trigger_disable("redlight_$t-rooftop-attack-start")
	trigger_disable("redlight_$Rooftop1")
	trigger_disable("redlight_$Rooftop2")

	on_trigger("", "redlight_$t-rooftop-stairs")				-- unregister sh functions
	on_trigger("", "redlight_$t-rooftop-attack-start")
	on_trigger("", "redlight_$Rooftop1")
	on_trigger("", "redlight_$Rooftop2")

	remove_marker_trigger("redlight_$t-rooftop-attack-start")

	objective_text_clear()

	Redlight_sh_rooftop_death_count = 0
	Redlight_sh_rooftop_miss_current = 0

	if (is_mission_complete("redlight_sh_rooftop")) then
		door_lock("redlight_Roof_MeshMover010", false)
		door_lock("redlight_Roof_MeshMover021", false)
	else
		door_lock("redlight_Roof_MeshMover010", true)
		door_lock("redlight_Roof_MeshMover021", true)
	end

	audio_stop(Redlight_roof_phone_handle)

	release_to_world("redlight_$G-rooftop-target01")
	release_to_world("redlight_$G-rooftop-target02")
	release_to_world("redlight_$G-rooftop-target03")
	release_to_world("redlight_$G-rooftop-target04")
	release_to_world("redlight_$G-rooftop-target05")
	release_to_world("redlight_$G-rooftop-target06")
	release_to_world("redlight_$G-rooftop-target07")
	release_to_world("redlight_$G-rooftop-target08")
	release_to_world("redlight_$G-rooftop-target09")
	release_to_world("redlight_$G-rooftop-target010")
	release_to_world("redlight_$G-rooftop-driver1")
	release_to_world("redlight_$G-rooftop-driver2")
end


function redlight_sh_rooftop_scene01()
	teleport("#PLAYER#", "redlight_$n-rooftop-start")
	camera_look_through("redlight_$cam-roof-02")

	team_despawn("Vice Lords", true)

	modal_begin()

	group_create_preload("redlight_$Rooftop2", "redlight_$IntStairs")
	Redlight_roof_handle_walk1 = thread_new("redlight_sh_rooftop_walk_wrapper", "redlight_Rooftop2VKBlack02", "redlight_$n-roof-blk2-a")	
	thread_new("redlight_sh_rooftop_phonecall")

	delay(2)

	fade_in(1)
	delay(2)

	Redlight_roof_handle_walk2 = thread_new("redlight_sh_rooftop_walk_wrapper", "redlight_Rooftop2VKBlack01", "redlight_$n-roof-blk1-a")
	
	delay(3.8)
	fade_out(.75)
	fade_out_block()
	modal_end()
end


function redlight_sh_rooftop_scene01_end()
	fade_out(0)
	camera_end_script()

	delay(.1)

	door_close("redlight_Roof_MeshMover010")
	door_close("redlight_Roof_MeshMover021")

	thread_kill(Redlight_roof_handle_walk1)
	thread_kill(Redlight_roof_handle_walk2)
	group_destroy("redlight_$Rooftop2")
	--group_create("redlight_$IntStairs", true) -- CHANGED TO PRELOAD VERSION AND MOVED TO CUTSCENE

	delay(.1)
end

function redlight_sh_rooftop_walk_wrapper(npc, nav)
	move_to(npc, nav, 1)
end


function redlight_sh_rooftop_start()
	cutscene_in()
	scripted_cutscene_play("redlight_sh_rooftop_scene01", "redlight_sh_rooftop_scene01_end")
	cutscene_out()

	--delay(0.25)	-- need this delay, otherwise camera_look_through() hangs

	door_lock("redlight_Roof_MeshMover010", false)
	door_lock("redlight_Roof_MeshMover021", false)

	trigger_enable("redlight_$t-rooftop-stairs")
	trigger_enable("redlight_$t-rooftop-attack-start")
	trigger_enable("redlight_$Rooftop1")
	trigger_enable("redlight_$Rooftop2")

	on_trigger("redlight_sh_rooftop_stairs_trigger", "redlight_$t-rooftop-stairs")
	on_trigger("redlight_sh_rooftop_start_roof_attack", "redlight_$t-rooftop-attack-start")
	on_trigger("redlight_sh_rooftop_create_roof1_group", "redlight_$Rooftop1")
	on_trigger("redlight_sh_rooftop_ignore_flag", "redlight_$Rooftop2")
	
	--on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0000")
	--on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0001")
	--on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0002")
	--on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0003")
	--on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0004")
	--on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0005")

	--OLD OLD OLD
	--for i = 1, Redlight_sh_rooftop_vehicles_total, 1 do
		--Redlight_sh_rooftop_v_handles[Redlight_sh_rooftop_vehicles[i]] = -1
	--end


	mission_help_table("vkrooftop_start") -- text: "Fight your way to the rooftop!"
	add_marker_trigger("redlight_$t-rooftop-attack-start", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end


function redlight_sh_rooftop_success()
	group_destroy("redlight_$Apartment")
	group_destroy("redlight_$IntStairs")
	group_destroy("redlight_$Rooftop1")
	group_destroy("redlight_$Rooftop2")
	group_destroy("redlight_$Rooftop2-items")
	group_destroy("redlight_$G-rooftop-wave02")
	group_destroy("redlight_$G-rooftop-wave03")
	group_destroy("redlight_$G-rooftop-roof01")
	group_destroy("redlight_$G-rooftop-roof02")
	group_destroy("redlight_$G-rooftop-roof03")

	hood_set_owner("vk_redlight02", "Playas")

	trigger_enable("redlight_$t-rooftop-save")	
end


function redlight_sh_rooftop_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Redlight_roof_phone_handle = audio_play("JULIUS_STRONGHOLD_1", "voice", false, false)
end


function redlight_sh_rooftop_ignore_flag()
	trigger_disable("redlight_$Rooftop2")

	--AM 6/12/06: moved to redlight_sh_rooftop_stairs_trigger() because player can circumvent this trigger
	--set_ignore_ai_flag("redlight_Rooftop2VKLatino01", false)
	--set_ignore_ai_flag("redlight_Rooftop2VKBlack01", false)
	--set_ignore_ai_flag("redlight_Rooftop2VKWhite01", false)
	--set_ignore_ai_flag("redlight_Rooftop2VKBlack02", false)
	--set_ignore_ai_flag("redlight_Rooftop2VKBlack03", false)
end


function redlight_sh_rooftop_create_roof1_group()
	trigger_disable("redlight_$Rooftop1")

	group_create("redlight_$Rooftop1", true)

	combat_disable("redlight_Rooftop1VKLatino01")
	combat_disable("redlight_Rooftop1VKAsian01")
	combat_disable("redlight_Rooftop1VKBlack01")
	combat_disable("redlight_Rooftop1VKBlack02")
end


---------------------------
-- vehicle shooting gallery
	-- notes:
	-- 3 cases for the pathfind:  succeeds, fails because destroyed, fails because stuck; ignoring last case for now
	-- redlight_sh_rooftop_is_vehicle_stuck() function needed here?  kills thread if car gets stuck?
function redlight_sh_rooftop_start_roof_attack()
	local i = 1
	local twocars = false

	trigger_disable("redlight_$t-rooftop-attack-start")
	remove_marker_trigger("redlight_$t-rooftop-attack-start")
	mission_help_table("vkrooftop_defend")		-- text: "Destroy the VK patrols!"
	objective_text("vkrooftop_objective", Redlight_sh_rooftop_death_required - Redlight_sh_rooftop_death_count)

	-- do shooting gallery --
	while ( Redlight_sh_rooftop_miss_current <= Redlight_sh_rooftop_miss_max and i <= 7 ) do
		if (i >= 5) then
			twocars = true
		end

		-- create and set up target
		group_create("redlight_$G-rooftop-target0"..i, true)
		group_create("redlight_$G-rooftop-driver1", true)
		redlight_sh_rooftop_setup_car("redlight_$v-rooftop-0"..i, "redlight_$c-rooftop-driver1", "redlight_$c-rooftop-pass1")
		teleport_vehicle("redlight_$v-rooftop-0"..i, Redlight_stronghold_path_car1[i][1])		

		-- start pathfind thread
		Redlight_sh_rooftop_v_handles["redlight_$v-rooftop-0"..i] = thread_new("redlight_sh_rooftop_pathfind_wrap", "redlight_$v-rooftop-0"..i, Redlight_stronghold_path_car1[i])
		add_marker_vehicle("redlight_$v-rooftop-0"..i, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		--AM: removing this text because it interferes with other text
		--mission_help_table_nag("vkrooftop_incoming")	-- text "VK patrol incoming!"

		-- repeat for second car, if necessary
		if (twocars) then
			group_create("redlight_$G-rooftop-target0"..(i+3), true)
			group_create("redlight_$G-rooftop-driver2", true)
			redlight_sh_rooftop_setup_car("redlight_$v-rooftop-0"..(i+3), "redlight_$c-rooftop-driver2", "redlight_$c-rooftop-pass2")
			teleport_vehicle("redlight_$v-rooftop-0"..(i+3), Redlight_stronghold_path_car2[i-4][1])
			delay(2)
			Redlight_sh_rooftop_v_handles["redlight_$v-rooftop-0"..(i+3)] = thread_new("redlight_sh_rooftop_pathfind_wrap", "redlight_$v-rooftop-0"..(i+3), Redlight_stronghold_path_car2[i-4])
			add_marker_vehicle("redlight_$v-rooftop-0"..(i+3), MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		end


		-- problem of, killing 2nd guy while the while pathfind not done loop for 1st guy still running -> no feedback on hit until later which feels weird
		-- so putting car2 check in separate thread
		if (twocars) then
			thread_new("redlight_sh_rooftop_hit_check_car2", i)
		end

		-- wait here until pathfind is done, then check if hit or miss
		while(not thread_check_done(Redlight_sh_rooftop_v_handles["redlight_$v-rooftop-0"..i])) do
			thread_yield()
		end
		remove_marker_vehicle("redlight_$v-rooftop-0"..i)
		if ( is_vehicle_destroyed("redlight_$v-rooftop-0"..i) or is_dead("redlight_$c-rooftop-driver1") ) then
			redlight_sh_rooftop_score_hit("redlight_$v-rooftop-0"..i)
			debug_message("HIT car1")
		else
			Redlight_sh_rooftop_miss_current = Redlight_sh_rooftop_miss_current + 1	-- inc miss counter
			debug_message("MISS car1")
		end

		-- need to wait here to make sure car2 thread is done, for case where player destroys car 1 quickly
		if (twocars) then
			while(not thread_check_done(Redlight_sh_rooftop_v_handles["redlight_$v-rooftop-0"..(i+3)])) do
				thread_yield()
			end
		end

		--[[
		-- AM 6/2/06: moving these so icons get removed right after pathfind thread finishes
		remove_marker_vehicle("redlight_$v-rooftop-0"..i)
		if (twocars) then
			remove_marker_vehicle("redlight_$v-rooftop-0"..(i+3))
		end
		]]
		
		--delay(2)
		
		release_to_world("redlight_$G-rooftop-target0"..i)
		release_to_world("redlight_$G-rooftop-driver1")
		if (twocars) then
			release_to_world("redlight_$G-rooftop-target0"..(i+3))
			release_to_world("redlight_$G-rooftop-driver2")
		end

		--delay(2)

		i = i + 1
	end


	if (Redlight_sh_rooftop_miss_current > Redlight_sh_rooftop_miss_max) then
		delay(4)
		stronghold_takeover_failure("vkrooftop_failure") -- text "You missed too many patrols!"
	end
end

function redlight_sh_rooftop_hit_check_car2(i)
	while(not thread_check_done(Redlight_sh_rooftop_v_handles["redlight_$v-rooftop-0"..(i+3)])) do
		thread_yield()
	end
	remove_marker_vehicle("redlight_$v-rooftop-0"..(i+3))
	if ( is_vehicle_destroyed("redlight_$v-rooftop-0"..(i+3)) or is_dead("redlight_$c-rooftop-driver2") ) then
		redlight_sh_rooftop_score_hit("redlight_$v-rooftop-0"..(i+3))
		debug_message("HIT car2")
	else
		Redlight_sh_rooftop_miss_current = Redlight_sh_rooftop_miss_current + 1	-- inc miss counter
		debug_message("MISS car2")
	end
end

function redlight_sh_rooftop_score_hit(car)
	Redlight_sh_rooftop_death_count = Redlight_sh_rooftop_death_count + 1
	--mission_help_table_nag("vkrooftop_destroyed")	-- text "VK patrol destroyed!"

	-- cap count variable so it doesn't display as negative on HUD
	if (Redlight_sh_rooftop_death_required - Redlight_sh_rooftop_death_count < 0) then
		Redlight_sh_rooftop_death_count = Redlight_sh_rooftop_death_required
	end
	
	objective_text("vkrooftop_objective", Redlight_sh_rooftop_death_required - Redlight_sh_rooftop_death_count)
	remove_marker_vehicle(car)

	if	(Redlight_sh_rooftop_death_count == Redlight_sh_rooftop_death_required) then
		for i = 1, 10, 1 do
			remove_marker_vehicle(Redlight_stronghold_car_targets[i])
		end
		delay(5)
		stronghold_takeover_success()
	end
end

function redlight_sh_rooftop_setup_car(car, driver, passenger)
	character_add_vehicle(driver, car, 0)
	character_add_vehicle(passenger, car, 1)
	vehicle_speed_override(car, 30)
	vehicle_supress_npc_exit(car, true)
	set_current_hit_points(car, 2000)
end

function redlight_sh_rooftop_pathfind_wrap(car, path)
	vehicle_pathfind_to(car, path, true, false)
end


function redlight_sh_rooftop_start_roof_attack_characters()
	delay(20)
	
	group_create("redlight_$G-rooftop-roof01", true)
	attack("redlight_$c-rooftop-roof01a")
	attack("redlight_$c-rooftop-roof01b")
	delay(90)

	group_create("redlight_$G-rooftop-roof02", true)
	attack("redlight_$c-rooftop-roof02a")
	attack("redlight_$c-rooftop-roof02b")
	attack("redlight_$c-rooftop-roof02c")
	delay(180)

	group_create("redlight_$G-rooftop-roof03", true)
	attack("redlight_$c-rooftop-roof03a")
	attack("redlight_$c-rooftop-roof03b")
end


function redlight_sh_rooftop_stairs_trigger()
	trigger_disable("redlight_$t-rooftop-stairs")

	--debug_message("stair trigger - setup patrol 1")

	combat_enable("redlight_Rooftop1VKLatino01")
	combat_enable("redlight_Rooftop1VKAsian01")
	combat_enable("redlight_Rooftop1VKBlack01")
	combat_enable("redlight_Rooftop1VKBlack02")

	group_create("redlight_$Rooftop2-items")

	group_create("redlight_$Rooftop2", true)		-- old primary group, near roof attack trigger

	set_ignore_ai_flag("redlight_Rooftop2VKLatino01", false)
	set_ignore_ai_flag("redlight_Rooftop2VKBlack01", false)
	set_ignore_ai_flag("redlight_Rooftop2VKWhite01", false)
	set_ignore_ai_flag("redlight_Rooftop2VKBlack02", false)
	set_ignore_ai_flag("redlight_Rooftop2VKBlack03", false)
	


	-- group creation moved to start_roof_attack function
	--group_create("redlight_$G-rooftop-wave02", true)

	--character_add_vehicle("redlight_$c0008", "redlight_$v0000", 0)	-- far to the right
	--character_add_vehicle("redlight_$c0009", "redlight_$v0000", 1)
	--character_add_vehicle("redlight_$c0006", "redlight_$v0002", 0)	-- close, to the left
	--character_add_vehicle("redlight_$c0007", "redlight_$v0002", 1)
	--character_add_vehicle("redlight_$c0020", "redlight_$v0004", 0)	-- far down the street
	--character_add_vehicle("redlight_$c0021", "redlight_$v0004", 1)
end

function redlight_sh_rooftop_patrol1_vehicle0()
	while (1) do
		vehicle_pathfind_to("redlight_$v0000", "redlight_$n-rooftop-v0a", "redlight_$n-rooftop-v0b", "redlight_$n-rooftop-v0c",
									"redlight_$n-rooftop-v0d", true, false)	
		delay(0)
	end
end

function redlight_sh_rooftop_patrol1_vehicle2()
	while (1) do
		vehicle_pathfind_to("redlight_$v0002", "redlight_$n-rooftop-v2a", "redlight_$n-rooftop-v2b", "redlight_$n-rooftop-v2c",
									"redlight_$n-rooftop-v2d", "redlight_$n-rooftop-v2d-b", "redlight_$n-rooftop-v2e", "redlight_$n-rooftop-v2f", true, false)
		delay(0)
	end
end

function redlight_sh_rooftop_patrol1_vehicle4()
	while (1) do
		vehicle_pathfind_to("redlight_$v0004", "redlight_$n-rooftop-v3e", "redlight_$n-rooftop-v3f", "redlight_$n-rooftop-v3g",
									"redlight_$n-rooftop-v3h", "redlight_$n-rooftop-v3i", "redlight_$n-rooftop-v3a",
									"redlight_$n-rooftop-v3b", "redlight_$n-rooftop-v3c", "redlight_$n-rooftop-v3d", true, false)

		delay(0)
	end
end

function redlight_sh_rooftop_patrol1_vehicle1()
	while (1) do
		vehicle_pathfind_to("redlight_$v0001", "redlight_$n-rooftop-v1a", "redlight_$n-rooftop-v2a", "redlight_$n-rooftop-v1b",
									"redlight_$n-rooftop-v1c", "redlight_$n-rooftop-v1d", "redlight_$n-rooftop-v1e", true, false)	
		delay(0)
	end
end

function redlight_sh_rooftop_patrol1_vehicle3()
	while (1) do
		vehicle_pathfind_to("redlight_$v0003", "redlight_$n-rooftop-v3a", "redlight_$n-rooftop-v3b", "redlight_$n-rooftop-v3c",
									"redlight_$n-rooftop-v3d", "redlight_$n-rooftop-v3e", "redlight_$n-rooftop-v3f",
									"redlight_$n-rooftop-v3g", "redlight_$n-rooftop-v3h", "redlight_$n-rooftop-v3i", true, false)
		delay(0)
	end
end

function redlight_sh_rooftop_patrol1_vehicle5()
	while (1) do
		vehicle_pathfind_to("redlight_$v0005", "redlight_$n-rooftop-v5a", "redlight_$n-rooftop-v2a", "redlight_$n-rooftop-v2b",
									"redlight_$n-rooftop-v2c", "redlight_$n-rooftop-v2d", "redlight_$n-rooftop-v2d-b", "redlight_$n-rooftop-v2e",
									"redlight_$n-rooftop-v5b", "redlight_$n-rooftop-v5c", "redlight_$n-rooftop-v5d", true, false)	
		delay(0)
	end
end




function redlight_sh_rooftop_exit_and_attack(npc)
	local rush_chance = rand_int(0,1)
	
	vehicle_exit(npc)

	if (rush_chance == 1) then
		set_ignore_ai_flag(npc, true)
	end

	--attack(npc)	-- NPCs don't move at all  :(

	-- FIXME:  DEBUG CODE
	--move_to(npc, "redlight_$n-rooftop-warp2", 2)
	--move_to(npc, "redlight_$n-rooftop-warp1", 2)
	--move_to(npc, "redlight_$n-rooftop-warp4", 2)		-- inside apt, by window (run OK)
	move_to(npc, "redlight_$n-rooftop-warp5", 2)		-- inside apt, first hallway (run OK)
	--move_to(npc, "redlight_$n-rooftop-fire", 2)		-- inside apt, on fire escape (run OK, but can't climb window sill)
end


function redlight_sh_rooftop_start_snipers()
	group_create("redlight_$G-rooftop-wave-s", true)
	attack("redlight_$c0023")
	attack("redlight_$c0024")
	attack("redlight_$c0025")
	attack("redlight_$c0026")
end



function test_redlight_cars()
	-- patrol 1 vehicles
	group_create("redlight_$G-rooftop-wave02", true)

	character_add_vehicle("redlight_$c0008", "redlight_$v0000", 0)	-- far to the right
	character_add_vehicle("redlight_$c0009", "redlight_$v0000", 1)
	character_add_vehicle("redlight_$c0006", "redlight_$v0002", 0)	-- close, to the left
	character_add_vehicle("redlight_$c0007", "redlight_$v0002", 1)
	character_add_vehicle("redlight_$c0020", "redlight_$v0004", 0)	-- far down the street
	character_add_vehicle("redlight_$c0021", "redlight_$v0004", 1)

	-- patrol 2 vehicles
	group_create("redlight_$G-rooftop-wave03", true)

	character_add_vehicle("redlight_$c0010", "redlight_$v0001", 0)	-- middle street on the left
	character_add_vehicle("redlight_$c0011", "redlight_$v0001", 1)
	character_add_vehicle("redlight_$c0012", "redlight_$v0001", 2)
	character_add_vehicle("redlight_$c0013", "redlight_$v0001", 3)
	character_add_vehicle("redlight_$c0018", "redlight_$v0003", 0)
	character_add_vehicle("redlight_$c0019", "redlight_$v0003", 1)
	character_add_vehicle("redlight_$c0014", "redlight_$v0005", 0)	-- down street to the left
	character_add_vehicle("redlight_$c0015", "redlight_$v0005", 1)
	character_add_vehicle("redlight_$c0016", "redlight_$v0005", 2)
	character_add_vehicle("redlight_$c0017", "redlight_$v0005", 3)
end



function test_redlight_newpath()
	on_vehicle_destroyed("redlight_sh_rooftop_vehicle_destroyed", "redlight_$v0000")
end


function red_test_anim1()
	group_destroy("redlight_$G-test-anim")
	group_create("redlight_$G-test-anim", true)
end

function red_test_anim2()
	--set_animation_state("redlight_$c-test-anim", "riding ready")
	--set_animation_state("redlight_$c-test-anim", "forty drinking")
	set_animation_state("redlight_$c-test-anim", "blunt smoking")
end

function red_test_anim3()
	--play_custom_action("#PLAYER#", "gml1_bs_bomb.animx")
	---play_action("redlight_$c-test-anim", "drink action")
	play_action("redlight_$c-test-anim", "smoke action")
end

function red_test_bool()
	if (is_mission_complete("redlight_sh_rooftop")) then
		debug_message("Complete!")
	else
		debug_message("NOT Complete!")
	end
end