--[[-------------------------------------------------------
-- docks.lua
-- SR district script
-- 11/19/05


AM 11/20/05 NOTES/TODOS/FIXMES:
	- level art
		- place containers (6); make dynamic OR toggle-able (see code section below)
		- widen dock area, make less cluttered
		- remove lip from docks
	- code
		- support for on_mesh_in_water() or equivalent
		- maybe support for setting props dynamic/static via script
	- script
		- place more guys (vehicles?) for crates\
		- force failure on bulldozer death?
		- have timer force failure (to prevent soft crashes)?
		- make player have to hijack bulldozer at start

warehouse stronghold (1/10/06)
	- add second boss car/character to teleport directly to end pos'n and attack player
	- use vehicle_supress_npc_exit(vehicle_name, supress?) to prohibit boss from exiting car
	- RL anims for NPCs in a car should be in-game by 1/11 or 1/12; definitely by content complete of 1/16
	- fix prob's of seeing groups spawn in by remove notoriety guys completely? using trigger to force player to stay in middle?
	- add help text/objective text where necessary


PEN
	- IF DESTROY CRATE, GET OUT OF BULLDOZER THEN BACK IN, GET A MINIMAP ICON FOR DESTROYED CRATE
	- if carjack bulldozer before taking out guys -> AI still fight etc.

----------------------------------------------------------]]


-- Global Variables
Docks_pen_death_count = 0
Docks_pen_death_total = 6
Docks_pen_player_entered_bulldozer = false
Docks_pen_crate1_destroyed = false
Docks_pen_crate2_destroyed = false
Docks_pen_crate3_destroyed = false
Docks_pen_crate4_destroyed = false
Docks_pen_crate5_destroyed = false
Docks_pen_crate6_destroyed = false
Docks_pen_crate_time_remaining = 0
Docks_pen_exit_bulldozer_timer_handle = 0
Docks_pen_on_first_enter_done = false

Docks_pen_handle_intro_talk = 0
Docks_pen_handle_intro_backhoe = 0

Docks_ware_handle_intro_walk = 0
Docks_ware_handle_intro_talk = 0
Docks_ware_handle_intro_smoke = 0

Docks_ware_phone_handle = 0
Docks_pen_phone_handle = 0

function docks_init()
	-- setup for warehouse stronghold
	on_stronghold_takeover_start("docks_stronghold_ware_start", "docks_stronghold_ware")
	on_stronghold_takeover_success("docks_stronghold_ware_success", "docks_stronghold_ware")
	on_stronghold_reset("docks_stronghold_ware_reset", "docks_stronghold_ware")
--	on_stronghold_check_enable("docks_stronghold_ware_unlock", "docks_stronghold_ware")
	stronghold_set_cost( "docks_stronghold_ware",  DOCKS_SH_WAREHOUSE_REQUIRED_PROPS)


	-- setup for peninsula stronghold
	on_stronghold_takeover_start("docks_sh_peninsula_start", "docks_sh_peninsula")
	on_stronghold_takeover_success("docks_sh_peninsula_success", "docks_sh_peninsula")
	on_stronghold_reset("docks_sh_peninsula_reset", "docks_sh_peninsula")
--	on_stronghold_check_enable("docks_sh_peninsula_unlock", "docks_sh_peninsula")
	stronghold_set_cost( "docks_sh_peninsula",  DOCKS_SH_PENINSULA_REQUIRED_PROPS)

	-- DWC: remember to disable this crap when you check it in
	--debug_docks()
end


function docks_main()
	--message("test docks") -- test
	stronghold_disable("docks_stronghold_ware")
end


-- debug function - call from the console with 'lua' command
function warp_docks()
	message("warping...")
	delay(0)
	player_teleport(  "docks_$nav-warp")
end


function debug_docks()
	teleport("#PLAYER#", "docks_$t_stronghold-ware_start1")
	stronghold_enable("docks_stronghold_ware")

	--teleport("#PLAYER#", "docks_$t-pen-test")	-- tip of peninsula
	stronghold_enable("docks_sh_peninsula")
end



----------------------------------------------
-- LC DOCKS xWAREHOUSE STRONGHOLD -------------
----------------------------------------------


--Docks warehouse stronghold functions

init_group_count = 6

Group_members = {}			-- member names in a group
Group_member_count = {}		-- max members in group
Group_alive_count = {}		-- group members currently alive
LC_group_hash_table = {}	-- reverse of the Group_members table
Group_count = 4
Overall_alive = 0
Boss_arrived = false
Docks_flag_ware_drive_done = false
Docks_handle_ware_move_wave1 = 0
Docks_handle_ware_move_wave2 = 0
Docks_handle_ware_move_wave3 = 0
Docks_handle_ware_exit_timer = 0
Docks_sh_warehouse_boss_handle = 0
Docks_sh_warehouse_boss_count = 0	-- number bosses killed currently
Docks_sh_warehouse_boss_goal = 2		-- total number of bosses player must kill
docks_stronghold_ware_time_remaining = 0


-- 2006/02/28 STL: This function isn't being called anymore.
function docks_stronghold_ware_unlock()
	if ( is_mission_complete("lc08") ) then
		stronghold_enable("docks_stronghold_ware")
		debug_message("docks warehouse stronghold unlocked!")
	end
end


function docks_stronghold_ware_start()
	set_mission_author( "Alvan Monje" )

	cutscene_in()
	scripted_cutscene_play("docks_stronghold_ware_cutscene", "docks_stronghold_ware_cutscene_end")
	cutscene_out()

	on_death( "docks_stronghold_init_char_death", "docks_$stronghold-ware_init-1" )
	on_death( "docks_stronghold_init_char_death", "docks_$stronghold-ware_init-2" )
	on_death( "docks_stronghold_init_char_death", "docks_$stronghold-ware_init-3" )
	on_death( "docks_stronghold_init_char_death", "docks_$stronghold-ware_init-4" )
	on_death( "docks_stronghold_init_char_death", "docks_$c-ware-init05" )
	on_death( "docks_stronghold_init_char_death", "docks_$c-ware-init06" )

	-- Assign group members to a group
	Group_members["docks_$G_stronghold-ware_front1"] = {"docks_$stronghold-ware_front1-1", 
														"docks_$stronghold-ware_front1-2", 
														"docks_$stronghold-ware_front1-3"}
														
	Group_members["docks_$G_stronghold-ware_front2"] = {"docks_$stronghold-ware_front2-1", 
														"docks_$stronghold-ware_front2-2", 
														"docks_$stronghold-ware_front2-3"}
													
	Group_members["docks_$G_stronghold-ware_back1"] = {"docks_$stronghold-ware_back1-1", 
														"docks_$stronghold-ware_back1-2", 
														"docks_$stronghold-ware_back1-3"}
									
	Group_members["docks_$G_stronghold-ware_back2"] = {"docks_$stronghold-ware_back2-1", 
														"docks_$stronghold-ware_back2-2", 
														"docks_$stronghold-ware_back2-3"}
					
	-- Assigning initial group counts					
	Group_member_count["docks_$G_stronghold-ware_front1"] = 3
	Group_member_count["docks_$G_stronghold-ware_front2"] = 3
	Group_member_count["docks_$G_stronghold-ware_back1"] = 3
	Group_member_count["docks_$G_stronghold-ware_back2"] = 3
	
	-- Loop through the member count and assign 0 to the alive count for each group
	for group in pairs(Group_member_count) do
		Group_alive_count[group] = 0
	end

	-- Now we create the Group_members table in reverse, so we can find a group for each LC
	for group, members in pairs(Group_members) do
		for i, LC in ipairs(members) do
			LC_group_hash_table[LC] = group
		end
	end
    
	-- Assigning death callbacks for each LC using the hash table we just made
	for LC, group in pairs(LC_group_hash_table) do
		on_death("docks_stronghold_npc_death_process", LC)
	end

	delay(1)
	mission_help_table("docks_ware_start")
	objective_text("docks_ware_killcount", init_group_count)

	add_marker_npc("docks_$stronghold-ware_init-1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("docks_$stronghold-ware_init-2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("docks_$stronghold-ware_init-3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("docks_$stronghold-ware_init-4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("docks_$c-ware-init05", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("docks_$c-ware-init06", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
end

function docks_stronghold_ware_intro_move_wrapper(npc, nav)
	move_to(npc, nav, 1)
end

function docks_stronghold_ware_intro_play_wrapper(npc, action)
	play_action( npc, action )
end

function docks_stronghold_ware_cutscene()
	teleport("#PLAYER#", "docks_$t_stronghold-ware_start1")
	character_slots_reserve_for_team("Los Carnales", 4)
	notoriety_reset("police")
	notoriety_reset("los_carnales")
	camera_look_through("docks_$cam-jh-docks-intro01")

	team_despawn("Los Carnales", true)

	modal_begin()
	group_create_preload("docks_$G_stronghold-ware_init", "docks_$G-ware-cover")
	thread_new("docks_stronghold_ware_cutscene_helper")
	thread_new("docks_stronghold_ware_phonecall")

	delay(2)

	fade_in(1)
	delay(4)
	set_animation_state("docks_$c-ware-init05", "blunt smoking")
	Docks_ware_handle_intro_smoke = thread_new("docks_stronghold_ware_intro_play_wrapper", "docks_$c-ware-init05", "smoke action")
	delay(2)

	camera_look_through("docks_$cam-jh-docks-intro02")
	delay(5)
	fade_out(0.75)
	fade_out_block()
	modal_end()
end

function docks_stronghold_ware_cutscene_helper()
	npc_unholster_best_weapon("docks_$stronghold-ware_init-3")
	Docks_ware_handle_intro_talk = thread_new("docks_stronghold_ware_intro_play_wrapper", "docks_$stronghold-ware_init-4", "talk submissive")
	Docks_ware_handle_intro_walk = thread_new("docks_stronghold_ware_intro_move_wrapper", "docks_$stronghold-ware_init-1", "docks_$n-ware-intro-walk")
end

function docks_stronghold_ware_cutscene_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	thread_kill(Docks_ware_handle_intro_walk)
	thread_kill(Docks_ware_handle_intro_talk)
	thread_kill(Docks_ware_handle_intro_smoke)
end


function docks_stronghold_ware_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Docks_ware_phone_handle = audio_play("JULIUS_STRONGHOLD_13", "voice", false, false)
end


function docks_stronghold_init_char_death(npc)
	init_group_count = init_group_count - 1
	--mission_help_table_nag("docks_ware_killed") -- text "Carnales defender killed."
	objective_text("docks_ware_killcount", init_group_count)
	remove_marker_npc(npc)

	if init_group_count == 0 then
		--debug_message("Init group destroyed, spawning groups")
		-- Spawn two groups randomly and add a delay to make sure players can see where both sides are coming from

		delay(0.5)
		
		-- cutscene showing first wave of attackers --
		cutscene_in()
		scripted_cutscene_play("docks_stronghold_ware_wave1_cutscene", "docks_stronghold_ware_wave1_cutscene_end")
		cutscene_out()

		attack("docks_$c-ware-wave1-01")
		attack("docks_$c-ware-wave1-02")
		attack("docks_$c-ware-wave1-03")

		mission_help_table("docks_ware_defend") -- text "Defend the complex."
		hud_timer_set(1000 * 120, "docks_stronghold_ware_boss_create", false) -- start the timer

		on_trigger_exit("docks_stronghold_ware_holdyourground_start", "docks_$t-ware-exit")
		trigger_enable("docks_$t-ware-exit")

		delay(6)
		docks_stronghold_spawn_random_group(nil)
		delay(3)
		docks_stronghold_spawn_random_group(nil)
	end
end

function docks_stronghold_ware_holdyourground_start()
	on_trigger_exit("", "docks_$t-ware-exit")
	mission_help_table("docks_ware_hold") -- text "Return to the stronghold or we'll lose it!"
	Docks_handle_ware_exit_timer = thread_new("docks_stronghold_ware_holdyourground_timer")
	--minimap_icon_add_navpoint("docks_$t-ware-exit", MINIMAP_ICON_PROTECT_ACQUIRE, true)
	distance_display_on("docks_$t-ware-exit", 0.5, 54, .5, 54)
	docks_stronghold_ware_time_remaining = hud_timer_get_remainder()
	hud_timer_stop()
	on_trigger("docks_stronghold_ware_holdyourground_end", "docks_$t-ware-exit")
end

function docks_stronghold_ware_holdyourground_timer()
	delay(15)
	stronghold_takeover_failure("docks_ware_fail") -- text "You left the stronghold!"
end

function docks_stronghold_ware_holdyourground_end()
	on_trigger("", "docks_$t-ware-exit")
	thread_kill(Docks_handle_ware_exit_timer)
	distance_display_off()
	--minimap_icon_remove_navpoint("docks_$t-ware-exit")
	mission_help_table("docks_ware_defend") -- text "Defend the complex."
	hud_timer_set(docks_stronghold_ware_time_remaining, "docks_stronghold_ware_boss_create", false) -- start the timer (again)
	on_trigger_exit("docks_stronghold_ware_holdyourground_start", "docks_$t-ware-exit")
end


function docks_stronghold_ware_wave1_cutscene()
	-- setup
	objective_text_clear()

	-- shot 1
	modal_begin()
	group_create_preload("docks_$G_stronghold-ware_defend_wave1")
	thread_new("docks_stronghold_ware_wave1_cutscene_helper")
	delay(0.25)

	camera_look_through("docks_$cam-ware-jh-reinf01")
	fade_in(1)
	delay(.5)
	
	audio_play_persona_line("docks_$c-ware-wave1-01", "taunt - fleeing enemy", 3)

	delay(2.5)
	fade_out(.75)
	fade_out_block()
	modal_end()
end

function docks_stronghold_ware_wave1_cutscene_helper()
	npc_unholster_best_weapon("docks_$c-ware-wave1-01")
	npc_unholster_best_weapon("docks_$c-ware-wave1-02")
	npc_unholster_best_weapon("docks_$c-ware-wave1-03")
	Docks_handle_ware_move_wave1 = thread_new("docks_stronghold_ware_move_wave1", "docks_$c-ware-wave1-01")
	Docks_handle_ware_move_wave2 = thread_new("docks_stronghold_ware_move_wave1", "docks_$c-ware-wave1-02")
	Docks_handle_ware_move_wave3 = thread_new("docks_stronghold_ware_move_wave1", "docks_$c-ware-wave1-03")
end

function docks_stronghold_ware_wave1_cutscene_end()
	fade_out(0)
	delay(0.1)
	camera_end_script()

	thread_kill(Docks_handle_ware_move_wave1) -- kill move to threads
	thread_kill(Docks_handle_ware_move_wave2)
	thread_kill(Docks_handle_ware_move_wave3)

	--teleport("#PLAYER#", "docks_$n_stronghold-ware_target")

	if ( is_player_in_vehicle() ) then
		teleport_vehicle("#PLAYER#", "docks_$n_stronghold-ware_target")
	else
		teleport("#PLAYER#", "docks_$n_stronghold-ware_target")
	end

	notoriety_set_max("los_carnales", 3) -- bump up player notoriety
	notoriety_set_min("los_carnales", 3)
	notoriety_set_max("police", 0)
	notoriety_set_min("police", 0)
	delay(1)
end


function docks_stronghold_ware_move_wave1(npc)
	move_to(npc, "docks_$n_stronghold-ware_target", 2)
end

function docks_stronghold_spawn_random_group(old_group)
	-- Create a list of groups that can be respawned (have no live members)
	local respawnable_groups = {}
	local rg_count = 0
	if Boss_arrived == true then
		return
	end
	for group, num in pairs(Group_alive_count) do
		if num == 0 and group ~= old_group then
			-- Assign a group name to the next count
			rg_count = rg_count + 1
			respawnable_groups[rg_count] = group
		end
	end
	
	-- Check that there's actually a valid group to respawn
	if (rg_count == 0) then
		return
	end
	
	-- Choose a random group and respawn the group
	local rand_idx = rand_int(1, rg_count)
	local chosen_group = respawnable_groups[rand_idx]
	
	--release_to_world(chosen_group)
	group_destroy(chosen_group)
	group_create(chosen_group)
	
	-- Reset the group alive count to the max member count
	Group_alive_count[chosen_group] = Group_member_count[chosen_group]

	-- Add the member count to the overall alive
	Overall_alive = Overall_alive + Group_member_count[chosen_group]
	
	-- Start move to threads for the group to move them into the center.
	for i, LC in ipairs(Group_members[chosen_group]) do
		--thread_new("move_LC_to_center", LC)
		--debug_message("Moving " .. LC .. " to stronghold nav")
		--thread_new("move_to", LC, "docks_$n_stronghold-ware_target", 2)
		patrol("docks_stronghold_move_LC_to_center", LC)
	end
	
	--debug_message(chosen_group .. " created")
end

function docks_stronghold_move_LC_to_center(LC)
	while true do
		--attack(LC, "#PLAYER#", true)
		move_to(LC, "docks_$n_stronghold-ware_target", 2)
	end
end

function docks_stronghold_npc_death_process(npc)
	local group = LC_group_hash_table[npc]

	Group_alive_count[group] = Group_alive_count[group] - 1
	Overall_alive = Overall_alive - 1
	if Group_alive_count[group] == 0 or Overall_alive <= 2 then
		--destroy_group(group)
		delay(3)
		docks_stronghold_spawn_random_group(group)
	end
end

function docks_stronghold_ware_boss_create()
	-- cleanup exit trigger
	on_trigger_exit("", "docks_$t-ware-exit")
	on_trigger("", "docks_$t-ware-exit")
	trigger_disable("docks_$t-ware-exit")
	thread_kill(Docks_handle_ware_exit_timer)
	distance_display_off()
	hud_timer_stop()

	cutscene_in()
	scripted_cutscene_play("docks_stronghold_ware_boss_cutscene", "docks_stronghold_ware_cutscene_boss_end")
	cutscene_out()

	on_death("docks_stronghold_ware_boss_dies", "docks_$stronghold-ware_boss")
	on_death("docks_stronghold_ware_boss_dies", "docks_$c-ware-boss02")

	mission_help_table("docks_ware_boss") -- text "The bosses are here. Take them out!"

	add_marker_npc("docks_$stronghold-ware_boss", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("docks_$c-ware-boss02", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

	delay(.5)

	combat_enable("docks_$stronghold-ware_boss")
	force_fire("docks_$stronghold-ware_boss", "docks_$n-boss02-target", true)

	delay(3)

	attack("docks_$c-ware-boss03")
	attack("docks_$c-ware-boss04")	

	combat_enable("docks_$c-ware-boss02")
	force_fire("docks_$c-ware-boss02", "docks_$n-boss02b-target2", true)

	delay(3)

	set_always_sees_player_flag("docks_$stronghold-ware_boss", true)
	attack("docks_$stronghold-ware_boss")

	delay(3)

	set_always_sees_player_flag("docks_$c-ware-boss02", true)
	attack("docks_$c-ware-boss02")
end


function docks_stronghold_ware_boss_cutscene()
	-- cutscene setup --
	notoriety_reset("police")
	notoriety_reset("los_carnales")

	group_destroy("docks_$G_stronghold-ware_init")
	group_destroy("docks_$G_stronghold-ware_boss")
	group_destroy("docks_$G_stronghold-ware_front1")
	group_destroy("docks_$G_stronghold-ware_front2")
	group_destroy("docks_$G_stronghold-ware_back1")
	group_destroy("docks_$G_stronghold-ware_back2")
	
	on_death( "", "docks_$stronghold-ware_init-1" )  -- disable on_deaths so more characters don't come (????)
	on_death( "", "docks_$stronghold-ware_init-2" )
	on_death( "", "docks_$stronghold-ware_init-3" )
	on_death( "", "docks_$stronghold-ware_init-4" )
	for LC, group in pairs(LC_group_hash_table) do
		on_death("", LC)
	end

	if ( is_player_in_vehicle() ) then
		teleport_vehicle("#PLAYER#", "docks_$n-ware-battle-plyr01")
	else
		teleport("#PLAYER#", "docks_$n-ware-battle-plyr01")
	end

	modal_begin()

	group_create_preload("docks_$G_stronghold-ware_boss")
	combat_disable("docks_$stronghold-ware_boss")
	combat_disable("docks_$c-ware-boss02")
	character_add_vehicle("docks_$stronghold-ware_boss", "docks_$v_stronghold-ware_boss", 0)
	character_add_vehicle("docks_$c-ware-boss02", "docks_$v_stronghold-ware_boss", 1)
	Boss_arrived = true
	Docks_sh_warehouse_boss_handle = thread_new("docks_stronghold_ware_boss_drive")

	delay(0.5)

	-- shot 1 --
	camera_look_through("docks_$n-ware-cam-boss02")
	delay(0.5)
	fade_in(1)

	while (not Docks_flag_ware_drive_done) do
		delay(.1)
	end

	--thread_new("docks_stronghold_ware_boss_exit_car", "docks_$stronghold-ware_boss")
	--thread_new("docks_stronghold_ware_boss_exit_car", "docks_$c-ware-boss02")
	--vehicle_exit("docks_$stronghold-ware_boss")
	fade_out(.2)
	fade_out_block()
	modal_end()
end


function docks_stronghold_ware_cutscene_boss_end()
	fade_out(0)
	delay(.1)

	Boss_arrived = true

	thread_kill(Docks_sh_warehouse_boss_handle)
	character_remove_vehicle("docks_$stronghold-ware_boss")
	character_remove_vehicle("docks_$c-ware-boss02")
	delay(0.5)

	teleport("docks_$stronghold-ware_boss", "docks_$n-ware-battle-boss02")
	teleport("docks_$c-ware-boss02", "docks_$n-ware-battle-boss02b")
	teleport("docks_$c-ware-boss03", "docks_$n-ware-boss03-b")
	teleport("docks_$c-ware-boss04", "docks_$n-ware-boss04-b")

	Docks_flag_ware_drive_done = true

	notoriety_set_max("los_carnales", 3) -- bump up player notoriety
	notoriety_set_min("los_carnales", 3)

	camera_end_script()
	delay(.25)
end


function docks_stronghold_ware_boss_drive()
	vehicle_pathfind_to("docks_$v_stronghold-ware_boss", "docks_$n-ware-battle-boss01", "docks_$n-ware-battle-boss03", true, true)
	Docks_flag_ware_drive_done = true
end


function docks_stronghold_ware_boss_exit_car(npc)
	vehicle_exit(npc)
end


function docks_stronghold_ware_boss_dies(npc)
	Docks_sh_warehouse_boss_count = Docks_sh_warehouse_boss_count + 1
	remove_marker_npc(npc)

	if (Docks_sh_warehouse_boss_count == Docks_sh_warehouse_boss_goal) then
		delay(5)
		stronghold_takeover_success()
	elseif ( is_dead("docks_$stronghold-ware_boss") ) then
		set_perfect_aim("docks_$c-ware-boss02", true)
	else
		set_perfect_aim("docks_$stronghold-ware_boss", true)
	end
end


function docks_stronghold_ware_success()
	hood_set_owner("lc_docks02", "playas")

	group_destroy("docks_$G_stronghold-ware_init")
	group_destroy("docks_$G_stronghold-ware_boss")
	group_destroy("docks_$G_stronghold-ware_front1")
	group_destroy("docks_$G_stronghold-ware_front2")
	group_destroy("docks_$G_stronghold-ware_back1")
	group_destroy("docks_$G_stronghold-ware_back2")
	group_destroy("docks_$G_stronghold-ware_defend_wave1")

	props_add("los_carnales", DOCKS_SH_WAREHOUSE_PROPS_REWARD)

	trigger_enable("docks_$t-ware-save")
end

function docks_stronghold_ware_reset()
	objective_text_clear()
	hud_timer_stop()
	distance_display_off()
	
	on_death( "", "docks_$stronghold-ware_init-1" )
	on_death( "", "docks_$stronghold-ware_init-2" )
	on_death( "", "docks_$stronghold-ware_init-3" )
	on_death( "", "docks_$stronghold-ware_init-4" )
	on_death("", "docks_$stronghold-ware_boss")
	on_death("", "docks_$c-ware-boss02")

	on_trigger("", "docks_$t-ware-exit")
	on_trigger_exit("", "docks_$t-ware-exit")

	for LC, group in pairs(LC_group_hash_table) do
		on_death("", LC)
	end

	remove_marker_npc("docks_$stronghold-ware_boss")
	remove_marker_npc("docks_$c-ware-boss02")
	remove_marker_npc("docks_$stronghold-ware_init-1")
	remove_marker_npc("docks_$stronghold-ware_init-2")
	remove_marker_npc("docks_$stronghold-ware_init-3")
	remove_marker_npc("docks_$stronghold-ware_init-4")
	remove_marker_npc("docks_$c-ware-init05")
	remove_marker_npc("docks_$c-ware-init06")

	notoriety_reset("rollers")
	notoriety_reset("police")

	release_to_world("docks_$G_stronghold-ware_init")
	release_to_world("docks_$G_stronghold-ware_boss")
	release_to_world("docks_$G_stronghold-ware_front1")
	release_to_world("docks_$G_stronghold-ware_front2")
	release_to_world("docks_$G_stronghold-ware_back1")
	release_to_world("docks_$G_stronghold-ware_back2")
	release_to_world("docks_$G_stronghold-ware_defend_wave1")
	release_to_world("docks_$G-ware-cover")

	Boss_arrived = false
	Docks_flag_ware_drive_done = false
	Docks_sh_warehouse_boss_count = 0
	init_group_count = 6

	trigger_disable("docks_$t-ware-exit")

	character_slots_clear_reservations()

	audio_stop(Docks_ware_phone_handle)
end

--end of docks warehouse stonghold






----------------------------------------------
-- LC DOCKS xPENINSULA STRONGHOLD -------------
----------------------------------------------

-- 2006/02/28 STL: This function isn't being called anymore.
function docks_sh_peninsula_unlock()
	if ( is_mission_complete("lc04") ) then
		stronghold_enable("docks_sh_peninsula")
		debug_message("docks peninsula stronghold unlocked!")
	end
end


function docks_sh_peninsula_reset()
	hud_timer_stop()
	Docks_pen_player_entered_bulldozer = false
	Docks_pen_on_first_enter_done = false
	Docks_pen_death_count = 0
	Docks_pen_crate_time_remaining = 0
	Docks_pen_exit_bulldozer_timer_handle = 0

	trigger_disable("docks_$t-pen-dock-create")
	trigger_disable("docks_$t-pen-warning")
	trigger_disable("docks_$t-pen-exit")

	on_trigger("", "docks_$t-pen-dock-create")
	on_trigger("", "docks_$t-pen-warning")
	on_trigger("", "docks_$t-pen-exit")
	on_entered_water("", "docks_$pen-crate01")
	on_entered_water("", "docks_$pen-crate02")
	on_entered_water("", "docks_$pen-crate03")
	on_entered_water("", "docks_$pen-crate04")
	on_entered_water("", "docks_$pen-crate05")
	on_entered_water("", "docks_$pen-crate06")
	on_vehicle_enter("", "docks_$v-pen-bulldozer")
	on_vehicle_exit("", "docks_$v-pen-bulldozer")

	remove_marker_vehicle("docks_$v-pen-bulldozer")
	objective_text_clear()
	notoriety_reset("los_carnales")

	release_to_world("docks_$G-pen-hangar")
	release_to_world("docks_$G-pen-platforms")
	release_to_world("docks_$G-pen-dock")
	group_destroy("docks_$G-pen-intro-b")
	group_destroy("docks_$G-pen-intro")

	minimap_icon_remove_mover("docks_$pen-crate01")
	minimap_icon_remove_mover("docks_$pen-crate02")
	minimap_icon_remove_mover("docks_$pen-crate03")
	minimap_icon_remove_mover("docks_$pen-crate04")
	minimap_icon_remove_mover("docks_$pen-crate05")
	minimap_icon_remove_mover("docks_$pen-crate06")

	ingame_effect_remove_mover("docks_$pen-crate01")
	ingame_effect_remove_mover("docks_$pen-crate02")
	ingame_effect_remove_mover("docks_$pen-crate03")
	ingame_effect_remove_mover("docks_$pen-crate04")
	ingame_effect_remove_mover("docks_$pen-crate05")
	ingame_effect_remove_mover("docks_$pen-crate06")

	Docks_pen_crate1_destroyed = false
	Docks_pen_crate2_destroyed = false
	Docks_pen_crate3_destroyed = false
	Docks_pen_crate4_destroyed = false
	Docks_pen_crate5_destroyed = false
	Docks_pen_crate6_destroyed = false

	audio_stop(Docks_pen_phone_handle)
end

function docks_sh_peninsula_success()
	group_destroy("docks_$G-pen-platforms")
	group_destroy("docks_$G-pen-dock")

	hood_set_owner("lc_docks03", "Playas")
	props_add("los_carnales", DOCKS_SH_PENINSULA_PROPS_REWARD)

	trigger_enable("docks_$t-pen-save")
end


function docks_sh_peninsula_scene01_intro()
	-- FIXME -- REDO SHORT CUTSCENE
	teleport("#PLAYER#", "docks_$n-pen-start")

	--camera_look_through("docks_$n-pen-cam1b")
	camera_look_through("docks_$cam-jh-pen-intro01")
	group_destroy("docks_$G-pen-hangar")
	mesh_mover_reset("docks_$pen-crate01")
	mesh_mover_reset("docks_$pen-crate02")
	mesh_mover_reset("docks_$pen-crate03")
	mesh_mover_reset("docks_$pen-crate04")
	mesh_mover_reset("docks_$pen-crate05")
	mesh_mover_reset("docks_$pen-crate06")

	team_despawn("Los Carnales", true)

	modal_begin()

	group_create_preload("docks_$G-pen-intro", "docks_$G-pen-intro-b", "docks_$G-pen-hangar")
	thread_new("docks_sh_peninsula_scene01_intro_helper")
	thread_new("docks_sh_peninsula_phonecall")

	delay(2)
	
	fade_in(.7)
	delay(5)

	camera_look_through("docks_$cam-jh-pen-intro02")
	delay(4)

	fade_out(.7)
	fade_out_block()
	modal_end()
end

function docks_sh_peninsula_scene01_intro_helper()
	character_add_vehicle("docks_$c-pen-intro-dock01", "docks_$v-pen-intro-hoe01", 0)
	Docks_pen_handle_intro_talk = thread_new("play_action", "docks_$c-pen-dock03", "talk with respect")
	Docks_pen_handle_intro_backhoe = thread_new("docks_sh_peninsula_backhoe_pathfind_wrapper")
end

function docks_sh_peninsula_scene01_intro_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	thread_kill(Docks_pen_handle_intro_talk)
	thread_kill(Docks_pen_handle_intro_backhoe)

	--group_create("docks_$G-pen-hangar", true) -- CHANGED TO 'PRELOAD' VERSION AND MOVED TO MAIN CUTSCENE FUNCTION
	group_create("docks_$G-pen-platforms")
	group_destroy("docks_$G-pen-intro-b")

	teleport("#PLAYER#", "docks_$n-pen-player01")

	character_add_vehicle("docks_$c-pen-hangar01", "docks_$v-pen-bulldozer", 0)
	character_add_vehicle("docks_$c-pen-hangar02", "docks_$v-pen-hangar01", 0)
	character_add_vehicle("docks_$c-pen-hangar03", "docks_$v-pen-hangar01", 1)

	thread_new("docks_sh_peninsula_bulldozer_pathfind_wrapper1")
	thread_new("docks_sh_peninsula_bulldozer_pathfind_wrapper2")

	delay(.1)
end

function docks_sh_peninsula_backhoe_pathfind_wrapper()
	vehicle_pathfind_to("docks_$v-pen-intro-hoe01", "docks_$n-pen-intro-hoe-a", true, true)
end

--[[
]]



function docks_sh_peninsula_bulldozer_pathfind_wrapper1()
	vehicle_speed_override("docks_$v-pen-bulldozer", 25)
	
	if (vehicle_pathfind_to("docks_$v-pen-bulldozer", "docks_$n-pen-bull01", "docks_$n-pen-bull02", true, true)) then
		--vehicle_pathfind_to("docks_$v-pen-bulldozer", "docks_$n-pen-bull01", true, true)
		vehicle_speed_cancel("docks_$v-pen-bulldozer")
		vehicle_exit("docks_$c-pen-hangar01")
		flee("docks_$c-pen-hangar01")
	end
end

function docks_sh_peninsula_bulldozer_pathfind_wrapper2()
	vehicle_speed_override("docks_$v-pen-hangar01", 25)
	vehicle_pathfind_to("docks_$v-pen-hangar01", "docks_$n-pen-holly01", true, true)
	vehicle_speed_cancel("docks_$v-pen-hangar01")
	thread_new("docks_sh_peninsula_exit_and_attack", "docks_$c-pen-hangar02")
	thread_new("docks_sh_peninsula_exit_and_attack", "docks_$c-pen-hangar03")
	--attack("docks_$c-pen-hangar02")
	--attack("docks_$c-pen-hangar03")
end

function docks_sh_peninsula_exit_and_attack(npc)
	vehicle_exit(npc)
	attack(npc)
end

function docks_sh_peninsula_start()
	set_mission_author("Alvan Monje")

	cutscene_in()
	scripted_cutscene_play("docks_sh_peninsula_scene01_intro", "docks_sh_peninsula_scene01_intro_end")
	cutscene_out()

	trigger_enable("docks_$t-pen-dock-create")
	trigger_enable("docks_$t-pen-warning")
	trigger_enable("docks_$t-pen-exit")	
	on_trigger("docks_sh_peninsula_create", "docks_$t-pen-dock-create")
	on_trigger("docks_sh_peninsula_exit_warning", "docks_$t-pen-warning")
	on_trigger("docks_sh_peninsula_exit_failure", "docks_$t-pen-exit")

	on_vehicle_exit("docks_sh_peninsula_exit_bulldozer", "docks_$v-pen-bulldozer")
	on_vehicle_enter("docks_sh_peninsula_enter_bulldozer", "docks_$v-pen-bulldozer")
	on_vehicle_destroyed("docks_sh_peninsula_bulldozer_destroyed", "docks_$v-pen-bulldozer")

	notoriety_set_max("los_carnales", 4)

	delay(1)

	add_marker_vehicle("docks_$v-pen-bulldozer", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	mission_help_table("docks_pen_bulldozer") -- text: "Get in the bulldozer"

	--delay(4)
	--attack("docks_$c-pen-hangar02")
	--attack("docks_$c-pen-hangar03")
end


function docks_sh_peninsula_exit_warning()
	trigger_disable("docks_$t-pen-warning")
	mission_help_table("docks_pen_failure_warn") -- text "Turn around, you're leaving the drug shipments behind!"
end

function docks_sh_peninsula_exit_failure()
	trigger_disable("docks_$t-pen-exit")
	stronghold_takeover_failure("docks_pen_failure_exit") -- text "You left the drug shipments behind."
end


function docks_sh_peninsula_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Docks_pen_phone_handle = audio_play("JULIUS_STRONGHOLD_15", "voice", false, false)
end


--[[
AM 5/18/06 GENERAL PROB: get in bulldozer, mash on Y to get out, then get in.  what happens w/orig. script is:
- on_enter begins
- on_exit begins, attempts to turn icons off but they're not on yet
- on_enter happens a second time, adding doubles of all minimap icons

3 cases:
- get in bulldozer the first time
- get in bulldozer for the nth time, and first time is not done
- get in bulldozer for the nth time, and first time is done

]]
function docks_sh_peninsula_enter_bulldozer()
	-- if first time, play short cutscene, reset mover positions, register on_entered functions, display mission help text
	if (not Docks_pen_player_entered_bulldozer) then
		player_controls_disable()
		Docks_pen_player_entered_bulldozer = true

		remove_marker_vehicle("docks_$v-pen-bulldozer")

		vehicle_stop("#PLAYER#")

		cutscene_in()
		scripted_cutscene_play("docks_sh_peninsula_scene02_crates", "docks_sh_peninsula_scene02_crates_end")
		cutscene_out()

		mission_help_table("docks_pen_drugs") -- text: "Push the Carnales drug shipments into the water!"
		objective_text("docks_pen_objective", Docks_pen_death_total - Docks_pen_death_count)

		hud_timer_set(1000 * 45, "docks_sh_peninsula_crate_timer") -- start general failure timer for crates

		Docks_pen_on_first_enter_done = true
		player_controls_enable()
	elseif (Docks_pen_on_first_enter_done) then
		remove_marker_vehicle("docks_$v-pen-bulldozer")

		-- only restart timer if it's been started already; otherwise time_remaining = 0 and this statement will cause mission failure
		if (Docks_pen_crate_time_remaining ~= 0) then
			hud_timer_set(Docks_pen_crate_time_remaining, "docks_sh_peninsula_crate_timer") -- restart crate timer
		end

		-- remove all icons so there's no duplicates (for case of getting in bulldozer,
		-- getting out before first on_enter thread is done, then getting in again)
		minimap_icon_remove_mover("docks_$pen-crate01")
		minimap_icon_remove_mover("docks_$pen-crate02")
		minimap_icon_remove_mover("docks_$pen-crate03")
		minimap_icon_remove_mover("docks_$pen-crate04")
		minimap_icon_remove_mover("docks_$pen-crate05")
		minimap_icon_remove_mover("docks_$pen-crate06")

		ingame_effect_remove_mover("docks_$pen-crate01")
		ingame_effect_remove_mover("docks_$pen-crate02")
		ingame_effect_remove_mover("docks_$pen-crate03")
		ingame_effect_remove_mover("docks_$pen-crate04")
		ingame_effect_remove_mover("docks_$pen-crate05")
		ingame_effect_remove_mover("docks_$pen-crate06")

		if (not Docks_pen_crate1_destroyed) then
			minimap_icon_add_mover("docks_$pen-crate01", MINIMAP_ICON_KILL, true)
			ingame_effect_add_mover("docks_$pen-crate01", INGAME_EFFECT_VEHICLE_KILL)
		end
		if (not Docks_pen_crate2_destroyed) then
			minimap_icon_add_mover("docks_$pen-crate02", MINIMAP_ICON_KILL, true)
			ingame_effect_add_mover("docks_$pen-crate02", INGAME_EFFECT_VEHICLE_KILL)
		end
		if (not Docks_pen_crate3_destroyed) then
			minimap_icon_add_mover("docks_$pen-crate03", MINIMAP_ICON_KILL, true)
			ingame_effect_add_mover("docks_$pen-crate03", INGAME_EFFECT_VEHICLE_KILL)
		end
		if (not Docks_pen_crate4_destroyed) then
			minimap_icon_add_mover("docks_$pen-crate04", MINIMAP_ICON_KILL, true)
			ingame_effect_add_mover("docks_$pen-crate04", INGAME_EFFECT_VEHICLE_KILL)
		end
		if (not Docks_pen_crate5_destroyed) then
			minimap_icon_add_mover("docks_$pen-crate05", MINIMAP_ICON_KILL, true)
			ingame_effect_add_mover("docks_$pen-crate05", INGAME_EFFECT_VEHICLE_KILL)
		end
		if (not Docks_pen_crate6_destroyed) then
			minimap_icon_add_mover("docks_$pen-crate06", MINIMAP_ICON_KILL, true)
			ingame_effect_add_mover("docks_$pen-crate06", INGAME_EFFECT_VEHICLE_KILL)
		end
	end
end


function docks_sh_peninsula_crate_timer()
	stronghold_takeover_failure("docks_pen_crate_timer") -- text "You ran out of time!"
end


function docks_sh_peninsula_scene02_crates()
	mesh_mover_reset("docks_$pen-crate01")
	mesh_mover_reset("docks_$pen-crate02")
	mesh_mover_reset("docks_$pen-crate03")
	mesh_mover_reset("docks_$pen-crate04")
	mesh_mover_reset("docks_$pen-crate05")
	mesh_mover_reset("docks_$pen-crate06")

	minimap_icon_add_mover("docks_$pen-crate01", MINIMAP_ICON_KILL, true)
	minimap_icon_add_mover("docks_$pen-crate02", MINIMAP_ICON_KILL, true)
	minimap_icon_add_mover("docks_$pen-crate03", MINIMAP_ICON_KILL, true)
	minimap_icon_add_mover("docks_$pen-crate04", MINIMAP_ICON_KILL, true)
	minimap_icon_add_mover("docks_$pen-crate05", MINIMAP_ICON_KILL, true)
	minimap_icon_add_mover("docks_$pen-crate06", MINIMAP_ICON_KILL, true)

	ingame_effect_add_mover("docks_$pen-crate01", INGAME_EFFECT_VEHICLE_KILL)
	ingame_effect_add_mover("docks_$pen-crate02", INGAME_EFFECT_VEHICLE_KILL)
	ingame_effect_add_mover("docks_$pen-crate03", INGAME_EFFECT_VEHICLE_KILL)
	ingame_effect_add_mover("docks_$pen-crate04", INGAME_EFFECT_VEHICLE_KILL)
	ingame_effect_add_mover("docks_$pen-crate05", INGAME_EFFECT_VEHICLE_KILL)
	ingame_effect_add_mover("docks_$pen-crate06", INGAME_EFFECT_VEHICLE_KILL)

	camera_look_through("docks_$cam-pen-crate01")
	delay(.25)

	modal_begin()
	fade_in(.7)
	delay(2)

	camera_look_through("docks_$cam-pen-crate02")
	delay(1.75)

	camera_look_through("docks_$cam-pen-crate03")
	delay(1.75)

	fade_out(.7)
	fade_out_block()
	modal_end()
end

function docks_sh_peninsula_scene02_crates_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	on_entered_water("docks_sh_peninsula_test_crate_death", "docks_$pen-crate01")
	on_entered_water("docks_sh_peninsula_test_crate_death", "docks_$pen-crate02")
	on_entered_water("docks_sh_peninsula_test_crate_death", "docks_$pen-crate03")
	on_entered_water("docks_sh_peninsula_test_crate_death", "docks_$pen-crate04")
	on_entered_water("docks_sh_peninsula_test_crate_death", "docks_$pen-crate05")
	on_entered_water("docks_sh_peninsula_test_crate_death", "docks_$pen-crate06")
end


function docks_sh_peninsula_exit_bulldozer()
	if ( (Docks_pen_death_count ~= Docks_pen_death_total) and Docks_pen_on_first_enter_done) then
		mission_help_table("docks_pen_reenter_bull") -- text: "You have 20 seconds to get back in the bulldozer"
		add_marker_vehicle("docks_$v-pen-bulldozer", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
		Docks_pen_crate_time_remaining = hud_timer_get_remainder()
		hud_timer_stop()
		--note - using hud_timer_set instead of this, so there's an actual timer on screen
		--Docks_pen_exit_bulldozer_timer_handle = thread_new("docks_sh_peninsula_leave_bulldozer")
		hud_timer_set(1000 * 20, "docks_sh_peninsula_leave_bulldozer")

		minimap_icon_remove_mover("docks_$pen-crate01")
		minimap_icon_remove_mover("docks_$pen-crate02")
		minimap_icon_remove_mover("docks_$pen-crate03")
		minimap_icon_remove_mover("docks_$pen-crate04")
		minimap_icon_remove_mover("docks_$pen-crate05")
		minimap_icon_remove_mover("docks_$pen-crate06")

		ingame_effect_remove_mover("docks_$pen-crate01")
		ingame_effect_remove_mover("docks_$pen-crate02")
		ingame_effect_remove_mover("docks_$pen-crate03")
		ingame_effect_remove_mover("docks_$pen-crate04")
		ingame_effect_remove_mover("docks_$pen-crate05")
		ingame_effect_remove_mover("docks_$pen-crate06")
	end
end


function docks_sh_peninsula_bulldozer_destroyed()
	delay(3)
	stronghold_takeover_failure("docks_pen_failure_bull") -- text "The bulldozer was destroyed!"
end


function docks_sh_peninsula_leave_bulldozer()
	stronghold_takeover_failure("docks_pen_failure_leave") -- text "You didn't get back in the bulldozer in time!"
end

function docks_sh_peninsula_test_crate_death(mesh)
	-- test to make sure callback is called only once for each mesh

	minimap_icon_remove_mover(mesh)
	ingame_effect_remove_mover(mesh)

	if ( (mesh == "docks_$pen-crate01") and (not Docks_pen_crate1_destroyed) ) then
		Docks_pen_crate1_destroyed = true
		docks_sh_peninsula_do_crate_death()
	elseif ( (mesh == "docks_$pen-crate02") and (not Docks_pen_crate2_destroyed) ) then
		Docks_pen_crate2_destroyed = true
		docks_sh_peninsula_do_crate_death()
	elseif ( (mesh == "docks_$pen-crate03") and (not Docks_pen_crate3_destroyed) ) then
		Docks_pen_crate3_destroyed = true
		docks_sh_peninsula_do_crate_death()
	elseif ( (mesh == "docks_$pen-crate04") and (not Docks_pen_crate4_destroyed) ) then
		Docks_pen_crate4_destroyed = true
		docks_sh_peninsula_do_crate_death()
	elseif ( (mesh == "docks_$pen-crate05") and (not Docks_pen_crate5_destroyed) ) then
		Docks_pen_crate5_destroyed = true
		docks_sh_peninsula_do_crate_death()
	elseif ( (mesh == "docks_$pen-crate06") and (not Docks_pen_crate6_destroyed) ) then
		Docks_pen_crate6_destroyed = true
		docks_sh_peninsula_do_crate_death()
	end
end


function docks_sh_peninsula_do_crate_death()
	Docks_pen_death_count = Docks_pen_death_count + 1
	objective_text("docks_pen_objective", Docks_pen_death_total - Docks_pen_death_count)

	if (Docks_pen_death_count ~= Docks_pen_death_total) then
		Docks_pen_crate_time_remaining = hud_timer_get_remainder()
		--hud_timer_stop()
		hud_timer_set(Docks_pen_crate_time_remaining + 20 * 1000, "docks_sh_peninsula_crate_timer") -- add more time
		--mission_help_table_nag("docks_pen_destroyed") -- text "Drug shipment destroyed!"
	end

	--remove_marker_npc(mesh)

	if ( (Docks_pen_death_count == 1) and (notoriety_get("los_carnales") <= 2) ) then
		notoriety_set("los_carnales", 2)
		notoriety_set_min("los_carnales", 2)
	elseif ( (Docks_pen_death_count == 3) and (notoriety_get("los_carnales") <= 3) ) then
		notoriety_set("los_carnales", 3)
		notoriety_set_min("los_carnales", 3)
	elseif ( (Docks_pen_death_count == 4) and (notoriety_get("los_carnales") <= 4) ) then
		notoriety_set("los_carnales", 4)
		notoriety_set_min("los_carnales", 4)
	elseif (Docks_pen_death_count == Docks_pen_death_total) then
		hud_timer_stop()
		delay(5)
		stronghold_takeover_success()
	end
end








--[[

		hud_timer_set(1000 * 120, "docks_stronghold_ware_boss_create") -- start the timer

		on_trigger_exit("docks_stronghold_ware_holdyourground_start", "docks_$t-ware-exit")
		trigger_enable("docks_$t-ware-exit")

		delay(6)
		docks_stronghold_spawn_random_group(nil)
		delay(3)
		docks_stronghold_spawn_random_group(nil)
	end
end

function docks_stronghold_ware_holdyourground_start()
	on_trigger_exit("", "docks_$t-ware-exit")
	mission_help_table("docks_ware_hold") -- text "Return to the stronghold or we'll lose it!"
	Docks_handle_ware_exit_timer = thread_new("docks_stronghold_ware_holdyourground_timer")
	--minimap_icon_add_navpoint("docks_$t-ware-exit", MINIMAP_ICON_PROTECT_ACQUIRE, true)
	distance_display_on("docks_$t-ware-exit", 0.5, 54, .5, 54)
	docks_stronghold_ware_time_remaining = hud_timer_get_remainder()
	hud_timer_stop()
	on_trigger("docks_stronghold_ware_holdyourground_end", "docks_$t-ware-exit")
end

function docks_stronghold_ware_holdyourground_timer()
	delay(15)
	stronghold_takeover_failure("docks_ware_fail") -- text "You left the stronghold!"
end

function docks_stronghold_ware_holdyourground_end()
	on_trigger("", "docks_$t-ware-exit")
	thread_kill(Docks_handle_ware_exit_timer)
	distance_display_off()
	--minimap_icon_remove_navpoint("docks_$t-ware-exit")
	mission_help_table("docks_ware_defend") -- text "Defend the complex."
	hud_timer_set(docks_stronghold_ware_time_remaining, "docks_stronghold_ware_boss_create") -- start the timer (again)
	on_trigger_exit("docks_stronghold_ware_holdyourground_start", "docks_$t-ware-exit")
end

]]




function docks_sh_peninsula_create()
	trigger_disable("docks_$t-pen-dock-create")

	group_create("docks_$G-pen-dock")
end


function test_docks()

	--ingame_effect_add_mover("docks_$pen-crate01", INGAME_EFFECT_VEHICLE_KILL)

--[[
	camera_look_through("docks_$n-pen-cam1b")
	delay(1.5)
	camera_begin_script("docks_camera000", true)
	delay(1.5)
	camera_begin_script("docks_camera001", true)
	delay(2)
	camera_begin_script("docks_camera002", true)
	delay(2)
	camera_end_script(true)
]]
end



--[[
$Navpoint:	"docks_$cam-jh-docks-intro01"
$Type:		"floating"
$Pos:			<-497.576721 5.158422 1211.918579>
$Orient:		[<-0.555008 0 -0.831845> <-0.095799 0.993346 0.063917> <0.826310 0.115165 -0.551315>]

$Navpoint:	"docks_$cam-jh-docks-intro02"
$Type:		"floating"
$Pos:			<-516.121399 5.234708 1179.951782>
$Orient:		[<-0.752443 0 0.658657> <0.035603 0.998538 0.040673> <-0.657694 0.054054 -0.751343>]

$Navpoint:	"docks_$cam-ware-jh-reinf01"
$Type:		"floating"
$Pos:			<-517.662292 4.700459 1237.290527>
$Orient:		[<0.972755 0 -0.231834> <-0.016871 0.997348 -0.070790> <0.231220 0.072773 0.970176>]




$Navpoint:	"docks_$cam-jh-pen-intro01"
$Type:		"floating"
$Pos:			<-1303.276489 -1.700514 1028.841187>
$Orient:		[<-0.932987 0 0.359911> <0.012501 0.999397 0.032407> <-0.359694 0.034735 -0.932424>]

$Navpoint:	"docks_$cam-jh-pen-intro02"
]]


function docks_test_dis()
	player_controls_disable()
end

function docks_test_en()
	player_controls_enable()
end