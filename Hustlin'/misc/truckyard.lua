-- truckyard.lua
-- SR district script
-- 1/13/06

function truckyard_init()
	on_stronghold_takeover_start("truckyard_stronghold_start", "truckyard_stronghold")
	on_stronghold_reset("truckyard_stronghold_reset", "truckyard_stronghold")
	on_stronghold_takeover_success("truckyard_stronghold_success", "truckyard_stronghold")
--	on_stronghold_check_enable("truckyard_stronghold_unlock", "truckyard_stronghold")
	stronghold_set_cost( "truckyard_stronghold",  TRUCKYARD_SH_REQUIRED_PROPS)

end

function truckyard_main()
	--message("test truckyard") -- test
end

function debug_truckyard()
	teleport("#PLAYER#", "truckyard_strong_prim")
	stronghold_enable("truckyard_stronghold")
end



----------------------------------------------
-- TRUCKYARD STRONGHOLD ----------------------
----------------------------------------------

Truckyard_sh_survival_handle = 0
Truckyard_handle_sh_exit_timer = 0
Truckyard_sh_time_remaining = 0
Truckyard_intro_handle_run1 = 0
Truckyard_intro_handle_run2 = 0
Truckyard_intro_handle_run3 = 0
Truckyard_intro_handle_run4 = 0
Truckyard_complex_phone_handle = 0
Truckyard_boss_pathfind_handle = 0
Truckyard_cutscene2_done = false


-- 2006/02/28 STL: This function isn't being called anymore.
function truckyard_stronghold_unlock()
	if ( is_mission_complete("wr02") ) then
		stronghold_enable("truckyard_stronghold")
		debug_message("truckyard stronghold unlocked!")
	end
end

function truckyard_stronghold_success()
	group_destroy("truckyard_strong_group")
	group_destroy("truckyard_strong_wave1")

	hood_set_owner("wr_truckyard01", "Playas")

	trigger_enable("truckyard_$t-save")
end

function truckyard_stronghold_win()
	--AM: disable both on_ events if player has already won
	on_vehicle_destroyed("", "truckyard_stong_attack_car")
	on_death("", "truckyard_strong_driver")
	delay(5)
	stronghold_takeover_success()
end

function truckyard_stronghold_cutscene2()
	camera_look_through("truckyard_$n-boss-intro-jh02")

	modal_begin()

	group_create_preload("truckyard_$G-boss01")
	thread_new("truckyard_stronghold_cutscene2_helper") -- to prevent problems w/quickly skipping cutscene
	
	Truckyard_cutscene2_done = true

	delay(0.85)

	fade_in(1)
	delay(2)
	vehicle_lights_on("truckyard_stong_attack_car", true)
	delay(1)
	Truckyard_boss_pathfind_handle = thread_new("truckyard_stronghold_bossmove_wrapper")
	delay(.75)
	fade_out(0.75)
	fade_out_block()
	modal_end()
end


-- to prevent problems w/quickly skipping cutscene
function truckyard_stronghold_cutscene2_helper()
	set_max_hit_points("truckyard_stong_attack_car", 20000)	-- AM 1/13/05 -- RL does 1500; semi01 normally has 50000hp
	vehicle_lights_on("truckyard_stong_attack_car", false)
	on_vehicle_destroyed("truckyard_stronghold_win", "truckyard_stong_attack_car")
	on_death("truckyard_stronghold_win", "truckyard_strong_driver")
	character_add_vehicle("truckyard_strong_driver","truckyard_stong_attack_car",0)
	car_combat("truckyard_strong_driver")
end

--[[
-- to show boss truck move in cutscene
function truckyard_stronghold_bossmove_timer()
	delay(3)
	--vehicle_chase("truckyard_stong_attack_car", "#PLAYER#", false, true)
	Truckyard_boss_pathfind_handle = thread_new("truckyard_stronghold_bossmove_wrapper")
end
]]

function truckyard_stronghold_bossmove_wrapper()
	vehicle_speed_override("truckyard_stong_attack_car", 4)
	vehicle_pathfind_to("truckyard_stong_attack_car", "truckyard_$n-boss-path-01", true, false)
end

function truckyard_stronghold_cutscene2_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	thread_kill(Truckyard_boss_pathfind_handle)
	vehicle_speed_cancel("truckyard_stong_attack_car")

	if (not Truckyard_cutscene2_done) then
		thread_new("truckyard_stronghold_cutscene2_helper")
	end
end


function truckyard_stronghold_start_timer()
	mission_help_table("truckyard_strong_survive") -- text: "Hold onto this position for 3 minutes."
	hud_timer_set(1000 * 60 * 3, "truckyard_stronghold_bossfight", false)
	Truckyard_sh_survival_handle = thread_new("truckyard_stronghold_survival")
end

-- FIXME -- for some reason, delay() calls below were adding up to < 3 minutes, like 2-2.5 minutes.  wtf
function truckyard_stronghold_survival()
	notoriety_set_desired_vehicle_count("Rollerz", 2)
	notoriety_set_min("rollers", 2)
	delay(60)
	notoriety_set_desired_vehicle_count("Rollerz", 3)
	notoriety_set_min("rollers", 3)
	delay(90)
	notoriety_set_desired_vehicle_count("Rollerz", 4)
	notoriety_set_min("rollers", 4)
	delay(45)
	--notoriety_set_min("rollers", 5)
	--delay(60)
	--notoriety_set_desired_vehicle_count("rollerz", 0)
	--delay(20)
end

function truckyard_stronghold_bossfight()
	trigger_disable("truckyard_$t-sh-exit")
	thread_kill(Truckyard_sh_survival_handle)
	notoriety_set_desired_vehicle_count("Rollerz", 0)

	cutscene_in()
	scripted_cutscene_play("truckyard_stronghold_cutscene2", "truckyard_stronghold_cutscene2_end")
	cutscene_out()
	
	hud_timer_stop()

	delay(1)

	add_marker_vehicle("truckyard_stong_attack_car", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	vehicle_chase("truckyard_stong_attack_car", "#PLAYER#", false, true)
	vehicle_set_allow_ram_ped("truckyard_stong_attack_car", true)
	mission_help_table("truckyard_strong_destroy_rig")
end

function truckyard_stronghold_init()
	--on_vehicle_destroyed("truckyard_stronghold_start_timer", "truckyard_strong_target2")
end

function truckyard_stronghold_reset()
	hud_timer_stop()
	notoriety_reset("rollers")
	notoriety_reset_vehicle_count("rollerz")
	remove_marker_vehicle("truckyard_stong_attack_car")

	on_trigger_exit("", "truckyard_$t-sh-exit")
	trigger_disable("truckyard_$t-sh-exit")

	release_to_world("truckyard_strong_group")
	release_to_world("truckyard_strong_wave1")
	release_to_world("truckyard_$G-boss01")

	audio_stop(Truckyard_complex_phone_handle)

	Truckyard_cutscene2_done = false
end


function truckyard_stronghold_call()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Truckyard_complex_phone_handle = audio_play("JULIUS_STRONGHOLD_9", "voice", false, false)
end


function truckyard_stronghold_cutscene()
	teleport("#PLAYER#", "truckyard_strong_prim")

	team_despawn("Rollerz", true)
	team_despawn("Police", true)

	modal_begin()

	group_create_preload("truckyard_strong_group", "truckyard_strong_wave1")

	thread_new("truckyard_stronghold_call")

	delay(2)

	camera_look_through("truckyard_$cam-intro-am01")

	Truckyard_intro_handle_run1 = thread_new("truckyard_stronghold_intro_move_wrapper", "truckyard_w1-1", "truckyard_$n-run-w1-1")
	delay(.1)
	Truckyard_intro_handle_run2 = thread_new("truckyard_stronghold_intro_move_wrapper", "truckyard_w1-2", "truckyard_$n-run-w1-2")
	
	fade_in(1)
	delay(3.75)

	camera_look_through("truckyard_$cam-intro2-am01")

	thread_kill(Truckyard_intro_handle_run1)
	thread_kill(Truckyard_intro_handle_run2)
	
	Truckyard_intro_handle_run3 = thread_new("truckyard_stronghold_intro_move_wrapper", "truckyard_w1-3", "truckyard_strong_prim")
	delay(.1)
	Truckyard_intro_handle_run4 = thread_new("truckyard_stronghold_intro_move_wrapper", "truckyard_w1-4", "truckyard_strong_prim")

	delay(3.9)
	
	fade_out(0.75)
	fade_out_block()
	modal_end()
end



function truckyard_stronghold_intro_move_wrapper(npc, nav)
	combat_disable(npc)
	npc_unholster_best_weapon(npc)
	move_to(npc, nav, 2)
end

function truckyard_stronghold_cutscene_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	thread_kill(Truckyard_intro_handle_run1)
	thread_kill(Truckyard_intro_handle_run2)
	thread_kill(Truckyard_intro_handle_run3)
	thread_kill(Truckyard_intro_handle_run4)
	npc_unholster_best_weapon("truckyard_w1-1")
	npc_unholster_best_weapon("truckyard_w1-2")
	npc_unholster_best_weapon("truckyard_w1-3")
	npc_unholster_best_weapon("truckyard_w1-4")
end


function truckyard_stronghold_start()
	cutscene_in()
	scripted_cutscene_play("truckyard_stronghold_cutscene", "truckyard_stronghold_cutscene_end")
	cutscene_out()

	delay(1)

	combat_enable("truckyard_w1-1")
	combat_enable("truckyard_w1-2")
	combat_enable("truckyard_w1-3")
	combat_enable("truckyard_w1-4")
	attack("truckyard_w1-1")
	attack("truckyard_w1-2")
	attack("truckyard_w1-3")
	attack("truckyard_w1-4")

	truckyard_stronghold_start_timer()

	on_trigger_exit("truckyard_stronghold_holdyourground_start", "truckyard_$t-sh-exit")
	trigger_enable("truckyard_$t-sh-exit")
end

-- debug function - call from the console with 'lua' command
function warp_truckyard()
	message("warping...")
	delay(0)
	player_teleport(  "truckyard_$nav-warp")
end


function truckyard_stronghold_holdyourground_start()
	on_trigger_exit("", "truckyard_$t-sh-exit")
	mission_help_table("docks_ware_hold") -- text "Return to the stronghold or we'll lose it!"
	--Truckyard_handle_sh_exit_timer = thread_new("truckyard_stronghold_holdyourground_timer")
	distance_display_on("truckyard_$t-sh-exit", 0.5, 50, .5, 50)
	Truckyard_sh_time_remaining = hud_timer_get_remainder()
	hud_timer_stop()
	hud_timer_set(1000 * 15, "truckyard_stronghold_holdyourground_timer")
	on_trigger("truckyard_stronghold_holdyourground_end", "truckyard_$t-sh-exit")
end


function truckyard_stronghold_holdyourground_timer()
	--delay(15)
	stronghold_takeover_failure("docks_ware_fail") -- text "You left the stronghold!"
end

function truckyard_stronghold_holdyourground_end()
	on_trigger("", "truckyard_$t-sh-exit")
	hud_timer_stop()
	--thread_kill(Truckyard_handle_sh_exit_timer)
	distance_display_off()
	--minimap_icon_remove_navpoint("docks_$t-ware-exit")
	mission_help_table("docks_ware_defend") -- text "Defend the complex."
	hud_timer_set(Truckyard_sh_time_remaining, "truckyard_stronghold_bossfight", false) -- start the timer (again)
	on_trigger_exit("truckyard_stronghold_holdyourground_start", "truckyard_$t-sh-exit")
end



-- FUNCTIONS FOR TESTING DELAY(), HUD_TIMER() FRAMERATE DEPENDENCE
function test_time()
	thread_new("test_hud_timer")
	thread_new("test_delay")
	debug_message("test start")
end

function test_hud_timer()
	hud_timer_set(1000 * 60, "test_timer_done")
end

function test_timer_done()
	debug_message("hud timer done!")
end

function test_delay()
	delay(60)
	debug_message("delay done")
end