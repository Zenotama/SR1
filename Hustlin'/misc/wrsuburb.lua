-- wrsuburb.lua
-- SR district script
-- 9/7/2005

--[[
NOTES:

PRICE
	X	- change cars to rollers cars; price car to price variant
	X	- update helptext
	X	- finish win condition
	X	- debug restart problem
	X	- make groups rel to world; price's car gets destroyed while player is in it
	X	- add marker for key
	P	- get better prop for key
	X	- remove ranks from dudes
	X	- move front door trigger to inside house
	X	- check if player can enter thru back door
	X	- DOUBLE-CHECK ABOVE		]]


-- GLOBALS ----------
WRsuburbprice_entered_price_car_before = false
WRsuburb_aparthandle_intro_walk1 = 0
WRsuburb_aparthandle_intro_walk2 = 0
WRsuburb_aparthandle_intro_walk3 = 0
WRsub_apts_handle_t1_john = 0
WRsub_apts_handle_t1_ho = 0
WRsuburb_apts_phone_handle = 0

WRsuburb_price_phone_handle = 0

WRsuburb_price_siren_handle = 0

WRsuburb_apts_ho1_anim_handle = 0
WRsuburb_apts_ho2_anim_handle = 0


-- FUNCTIONS ------------
function wrsuburb_init()

	on_stronghold_takeover_start("wrsuburb_stronghold_price_start", "wrsuburb_stronghold_price")
	on_stronghold_reset("wrsuburb_stronghold_price_reset", "wrsuburb_stronghold_price")
	on_stronghold_takeover_success("wrsuburb_stronghold_price_success", "wrsuburb_stronghold_price")
--	on_stronghold_check_enable("wrsuburb_stronghold_price_unlock", "wrsuburb_stronghold_price")
	stronghold_set_cost( "wrsuburb_stronghold_price", WRSUBURB_SH_PRICE_REQUIRED_PROPS )


	--Apartment complex stronghold setup
	on_stronghold_takeover_start("wrsuburb_stronghold_apart_start", "wrsuburb_stronghold_apart")
	on_stronghold_reset("wrsuburb_stronghold_apart_reset", "wrsuburb_stronghold_apart")
	on_stronghold_takeover_success("wrsuburb_stronghold_apart_success", "wrsuburb_stronghold_apart")
--	on_stronghold_check_enable("wrsuburb_stronghold_apart_unlock", "wrsuburb_stronghold_apart")
	stronghold_set_cost( "wrsuburb_stronghold_apart",  WRSUBURB_SH_APT_REQUIRED_PROPS)

	--thread_new("debug")
	door_lock("wrsuburb_MeshMover010", true)
	door_lock("wrsuburb_MeshMover060", true)
	door_lock("wrsuburb_MeshMover080", true)
	door_lock("wrsuburb_MeshMover340", true)
	door_lock("wrsuburb_MeshMover350", true)
end

function wrsuburb_main()
	--message("test wrsuburb") -- test
	stronghold_disable("wrsuburb_stronghold_apart")
	stronghold_disable( "wrsuburb_stronghold_price" )
end

-- debug function - call from the console with 'lua' command
function warp_wrsuburb()
	message("warping...")
	delay(0)
	player_teleport(  "wrsuburb_$nav-warp")
end


function debug_wrsuburb()
	--teleport("#PLAYER#", "wrsuburb_$t_sh_price_start")
	teleport("#PLAYER#", "wrsuburb_$t_sh_apart_init")

	stronghold_enable("wrsuburb_stronghold_price")
	stronghold_enable("wrsuburb_stronghold_apart")
end


----------------------------------------
-- xPRICE MANSION STRONGHOLD ------------
----------------------------------------

Stronghold_handle_price_notoriety_check = 0

-- 2006/02/28 STL: This function isn't being called anymore.
function wrsuburb_stronghold_price_unlock()
	if ( is_mission_complete("wr09") ) then
		stronghold_enable("wrsuburb_stronghold_price")
		debug_message("price stronghold unlocked!")
	end
end


-- intro cutscene
function wrsuburb_stronghold_price_scene01()
	teleport("#PLAYER#", "wrsuburb_$t_sh_price_start")

	door_close("ManMeshMover01")
	door_close("ManMeshMover02")
	door_close("ManMeshMover03")
	door_lock("ManMeshMover01", false)
	door_lock("ManMeshMover02", false)
	door_lock("ManMeshMover03", false)

	camera_look_through("wrsuburb_$n-price-jh-intro01")

	team_despawn("Rollerz", true)

	modal_begin()

	group_create_preload("wrsuburb_$g_sh_1f-a")

	thread_new("wrsuburb_stronghold_price_phonecall")

	delay(2)

	fade_in(1)
	delay(6)
	fade_out(.75)
	fade_out_block()
	modal_end()
end

function wrsuburb_stronghold_price_scene01_end()
	fade_out(0)
	delay(.1)
	camera_end_script()
end

function wrsuburb_stronghold_price_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	WRsuburb_price_phone_handle = audio_play("JULIUS_STRONGHOLD_6", "voice", false, false)
end


-- called when player enters primary trigger
function wrsuburb_stronghold_price_start()
	set_mission_author("Alvan Monje")

	cutscene_in()
	scripted_cutscene_play("wrsuburb_stronghold_price_scene01", "wrsuburb_stronghold_price_scene01_end")
	cutscene_out()

	mission_help_table("price_strong_start") -- text "Get inside Price's house."

	-- enable triggers, start trigger listeners
	
	trigger_enable("wrsuburb_$t_sh_front_stairs")
	on_trigger("wrsuburb_stronghold_price_front_stairs", "wrsuburb_$t_sh_front_stairs")
	
	trigger_enable("wrsuburb_$t_sh_back_stairs")
	on_trigger("wrsuburb_stronghold_price_back_stairs", "wrsuburb_$t_sh_back_stairs")
	
	trigger_enable("wrsuburb_$t_sh1f_enter_back_door")
	on_trigger("wrsuburb_stronghold_price_entered_1F", "wrsuburb_$t_sh1f_enter_back_door")
	
	trigger_enable("wrsuburb_$t-price-enter-front")
	on_trigger("wrsuburb_stronghold_price_entered_1F", "wrsuburb_$t-price-enter-front")
	
	trigger_enable("wrsuburb_$t_sh1f_stairs")
	on_trigger("wrsuburb_stronghold_price_1F_stairs", "wrsuburb_$t_sh1f_stairs")

	mesh_mover_play_action("wrsuburb_Price_Gdoor_MM040", "start2") -- close garage door

	on_vehicle_destroyed("wrsuburb_stronghold_price_car_destroyed", "wrsuburb_$v_sh_target")
	on_vehicle_exit("wrsuburb_stronghold_price_car_exit", "wrsuburb_$v_sh_target")

	special_spawns_enable(false)

	--AM 6/22/06: stream_show_character_stats is reaching > 60 which is in the danger zone, so we need to limit slots being used
	set_ped_density(0.1)
	notoriety_set_max("police", 1)
end


function wrsuburb_stronghold_price_car_destroyed()
	delay(2)
	stronghold_takeover_failure("price_strong_car_destroyed")
end


function wrsuburb_stronghold_price_reset()
	notoriety_set_min("rollers", 0)
	
	-- reset the triggers
	trigger_disable("wrsuburb_$t_sh_front_stairs")
	trigger_disable("wrsuburb_$t_sh_back_stairs")
	trigger_disable("wrsuburb_$t_sh1f_enter_back_door")
	trigger_disable("wrsuburb_$t-price-enter-front")
	trigger_disable("wrsuburb_$t_sh1f_stairs")
	trigger_disable("wrsuburb_$t_sh_end_front_door")
	trigger_disable("wrsuburb_$t_sh_end_back_door")
	trigger_disable("wrsuburb_$t_sh_price_chopshop")
	
	-- unregister on_ functions
	on_vehicle_enter("", "wrsuburb_$v_sh_target")	
	on_vehicle_destroyed("", "wrsuburb_$v_sh_target") 
	on_trigger("", "wrsuburb_$t_sh_front_stairs")
	on_trigger("", "wrsuburb_$t_sh_back_stairs")
	on_trigger("", "wrsuburb_$t_sh1f_enter_back_door")
	on_trigger("", "wrsuburb_$t-price-enter-front")
	on_trigger("", "wrsuburb_$t_sh1f_stairs")	
	on_trigger("", "wrsuburb_$t_sh_end_front_door")
	on_trigger("", "wrsuburb_$t_sh_end_back_door")
	on_pickup("", "wrsuburb_$i_sh_rolls_key")
	on_vehicle_exit("", "wrsuburb_$v_sh_target")

	--notoriety_set_min("rollers", 0)
	notoriety_reset("rollers")

	thread_kill(Stronghold_handle_price_notoriety_check)

	--minimap_icon_remove_trigger("wrsuburb_$t_sh_price_chopshop")

	mesh_mover_play_action("wrsuburb_Price_Gdoor_MM040", "start1") -- open garage door

	--remove_marker_navpoint("wrsuburb_$i_sh_rolls_key")
	minimap_icon_remove_navpoint("wrsuburb_$i_sh_rolls_key")
	remove_marker_vehicle("wrsuburb_$v_sh_target")
	minimap_icon_remove_navpoint("wrsuburb_$n-price-forgive")
	mission_waypoint_remove()

	WRsuburbprice_entered_price_car_before = false

	hud_timer_stop()

	if (not is_mission_complete("wrsuburb_stronghold_price")) then
		door_lock("ManMeshMover01", true)
		door_lock("ManMeshMover02", true)
		door_lock("ManMeshMover03", true)
	end

	release_to_world("wrsuburb_$g_sh_1f-a")
	release_to_world("wrsuburb_$g_sh_2f-a")
	group_destroy("wrsuburb_$G-price-keys")
	release_to_world("wrsuburb_$g_sh_end")
	release_to_world("wrsuburb_$g_sh_vehicles")

	audio_stop(WRsuburb_price_phone_handle)

	special_spawns_enable(true)

	set_ped_density(1)
	notoriety_reset("police")
end



function wrsuburb_stronghold_price_success()
	group_destroy("wrsuburb_$g_sh_1f-a")
	group_destroy("wrsuburb_$g_sh_2f-a")
	group_destroy("wrsuburb_$g_sh_end")

	hood_set_owner("wr_suburb01", "Playas")
	unlockable_unlock("wr_stronghold_price")
	--crib_unlock("Price Mansion") -- AM: should be done upon WR9 success instead

	trigger_enable("wrsuburb_$t-price-save")

	--mission_help_table("price_strong_win")
	--stronghold_takeover_success()
	--wrsuburb_stronghold_price_reset()
end



-- TRIGGERS --
function wrsuburb_stronghold_price_front_stairs()
	debug_message("Stronghold front stairs")
	trigger_disable("wrsuburb_$t_sh_back_stairs")
	trigger_disable("wrsuburb_$t_sh_front_stairs")
	human_wait_for_loaded_resource("wrsuburb_sh1f_fd1")	-- FIXME -- GROUP GETS DESTROYED BEFORE THREAD CAN FINISH?
	human_wait_for_loaded_resource("wrsuburb_sh1f_fd2")	-- FIXME -- GROUP GETS DESTROYED BEFORE THREAD CAN FINISH?
	human_wait_for_loaded_resource("wrsuburb_sh1f_lr2")
	thread_new("wrsuburb_stronghold_price_move_to_wrapper", "wrsuburb_sh1f_fd1", "wrsuburb_$n_sh1f_fd1")
	thread_new("wrsuburb_stronghold_price_move_to_wrapper", "wrsuburb_sh1f_fd2", "wrsuburb_$n_sh1f_fd2")
	thread_new("wrsuburb_stronghold_price_move_to_wrapper", "wrsuburb_sh1f_lr2", "wrsuburb_$n_sh1f_kitchen")
end


function wrsuburb_stronghold_price_move_to_wrapper(character, navpoint)
	move_to(character, navpoint, 2)
end


function wrsuburb_stronghold_price_back_stairs()
	debug_message("Stronghold rear stairs")
	trigger_disable("wrsuburb_$t_sh_back_stairs")
	trigger_disable("wrsuburb_$t_sh_front_stairs")
	--thread_new("vehicle_enter", "wrsuburb_sh1f_back1", "wrsuburb_$v_sh_back")
	--vehicle_enter("wrsuburb_sh1f_back1", "wrsuburb_$v_sh_back", 1)

	vehicle_enter("wrsuburb_sh1f_back2", "wrsuburb_$v_sh_back", 1)	-- FIXME -- GROUP GETS DESTROYED BEFORE THREAD CAN FINISH?
	-- character_add_vehicle("wrsuburb_sh1f_back2", "wrsuburb_$v_sh_back", 1)

	debug_message("vehicle enter done!")

	car_combat("wrsuburb_sh1f_back1")
	vehicle_chase("wrsuburb_$v_sh_back", "#PLAYER#", false, true)
	move_to("wrsuburb_sh1f_bd2", "wrsuburb_$n_sh_behind_garage", 2)
end


function wrsuburb_stronghold_price_entered_1F()
	mission_help_table("price_strong_enter") -- text "Find Price's car keys."
	trigger_disable("wrsuburb_$t-price-enter-front")
	trigger_disable("wrsuburb_$t_sh1f_enter_back_door")
	
	on_pickup("wrsuburb_stronghold_price_grabbed_key", "wrsuburb_$i_sh_rolls_key")
	--add_marker_navpoint("wrsuburb_$i_sh_rolls_key", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
	minimap_icon_add_navpoint("wrsuburb_$i_sh_rolls_key", MINIMAP_ICON_PROTECT_ACQUIRE)
end


function wrsuburb_stronghold_price_1F_stairs()
	-- spawn 2F group
	group_create("wrsuburb_$g_sh_2f-a")
	group_create("wrsuburb_$G-price-keys")
	trigger_disable("wrsuburb_$t_sh1f_stairs")
	-- make a few guys chase you
end


function wrsuburb_stronghold_price_grabbed_key()
	mission_help_table("price_strong_key") -- text "Head back downstairs to the garage and steal Price's car."

	--remove_marker_navpoint("wrsuburb_$i_sh_rolls_key")
	minimap_icon_remove_navpoint("wrsuburb_$i_sh_rolls_key")

	group_create("wrsuburb_$g_sh_end", true)
	group_create("wrsuburb_$g_sh_vehicles", true)

	character_add_vehicle("wrsuburb_sh_reinf1_drv", "wrsuburb_$v_sh_reinf1", 0)
	character_add_vehicle("wrsuburb_sh_reinf1_pass", "wrsuburb_$v_sh_reinf1", 1)
	character_add_vehicle("wrsuburb_sh_reinf2_drv", "wrsuburb_$v_sh_reinf2", 0)
	character_add_vehicle("wrsuburb_sh_reinf2_pass", "wrsuburb_$v_sh_reinf2", 1)

	set_max_hit_points("wrsuburb_$v_sh_target", 6000)
	set_current_hit_points("wrsuburb_$v_sh_target", 6000)

	trigger_enable("wrsuburb_$t_sh_end_front_door")
	trigger_enable("wrsuburb_$t_sh_end_back_door")
	on_trigger("wrsuburb_stronghold_price_exit_front_door", "wrsuburb_$t_sh_end_front_door")
	on_trigger("wrsuburb_stronghold_price_exit_back_door", "wrsuburb_$t_sh_end_back_door")
	
	on_vehicle_enter("wrsuburb_stronghold_price_enter_vehicle", "wrsuburb_$v_sh_target")

	add_marker_vehicle("wrsuburb_$v_sh_target", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)

	mesh_mover_play_action("wrsuburb_Price_Gdoor_MM040", "start1") -- open garage door
end


function wrsuburb_stronghold_price_exit_front_door()
	debug_message("Exited front door")
	vehicle_pathfind_to("wrsuburb_$v_sh_reinf1", "wrsuburb_$n_sh_back_reinf1", true, true)
	vehicle_pathfind_to("wrsuburb_$v_sh_reinf2", "wrsuburb_$n_sh_front_reinf1", true, true)
end


function wrsuburb_stronghold_price_exit_back_door()
	debug_message("Exited back door")
	vehicle_pathfind_to("wrsuburb_$v_sh_reinf1", "wrsuburb_$n_sh_back_reinf1", true, true)
	vehicle_pathfind_to("wrsuburb_$v_sh_reinf2", "wrsuburb_$n_sh_back_reinf2", true, true)
end


function wrsuburb_stronghold_price_enter_vehicle()
	if (not WRsuburbprice_entered_price_car_before) then
		WRsuburbprice_entered_price_car_before = true
		notoriety_set_min("rollers", 5)
		Stronghold_handle_price_notoriety_check = thread_new("wrsuburb_stronghold_price_check_notoriety")
	end
	hud_timer_stop()
	mission_help_table("price_strong_car") -- text "Head to a Forgive and Forget before they stop you!"
	remove_marker_vehicle("wrsuburb_$v_sh_target")
	minimap_icon_add_navpoint("wrsuburb_$n-price-forgive", MINIMAP_ICON_LOCATION, true)
	mission_waypoint_add("wrsuburb_$n-price-forgive")
end

function wrsuburb_stronghold_price_car_exit()
	mission_help_table("price_strong_car_timer") -- text: "You have 20 seconds to get back in the car"
	add_marker_vehicle("wrsuburb_$v_sh_target", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	hud_timer_set(1000 * 20, "wrsuburb_stronghold_price_car_exit_fail")

	minimap_icon_remove_navpoint("wrsuburb_$n-price-forgive")
	mission_waypoint_remove()
end


function wrsuburb_stronghold_price_car_exit_fail()
	stronghold_takeover_failure("price_strong_car_exit_fail") -- text "You didn't get back to the car in time!"
end


function wrsuburb_stronghold_price_check_notoriety()
	while (notoriety_get("rollers") > 0) do
		delay(1)
	end

	delay(4.5)

	stronghold_takeover_success()
end


function wrsuburb_stronghold_price_test1()
	mesh_mover_play_action("wrsuburb_Price_Gdoor_MM040", "start1") -- open
end

function wrsuburb_stronghold_price_test2()
	mesh_mover_play_action("wrsuburb_Price_Gdoor_MM040", "start2") -- close
end





-------------------------------------------
--xApartment complex stronghold--
-------------------------------------------

--Globals for apartment stronghold
Targets_total = 5
Targets_dead = 0

-- 2006/02/28 STL: This function isn't being called anymore.
function wrsuburb_stronghold_apart_unlock()
	if ( is_mission_complete("wr07") ) then
		stronghold_enable("wrsuburb_stronghold_apart")
		debug_message("wrsuburb apartment stronghold unlocked!")
	end
end


-- intro cutscene
function wrsuburb_stronghold_apart_scene01()
	teleport("#PLAYER#", "wrsuburb_$t_sh_apart_init")

	door_close("wrsuburb_MeshMover010")
	door_close("wrsuburb_MeshMover060")
	door_close("wrsuburb_MeshMover080")
	door_close("wrsuburb_MeshMover340")
	door_close("wrsuburb_MeshMover350")
	door_lock("wrsuburb_MeshMover010", false)
	door_lock("wrsuburb_MeshMover060", false)
	door_lock("wrsuburb_MeshMover080", false)
	door_lock("wrsuburb_MeshMover340", false)
	door_lock("wrsuburb_MeshMover350", false)

	camera_look_through("wrsuburb_$n-apts-intro-am01")

	team_despawn("Rollerz", true)
	team_despawn("Police", true)

	modal_begin()

	group_create_preload("wrsuburb_$G-apts-intro")
	WRsuburb_aparthandle_intro_walk2 = thread_new("wrsuburb_stronghold_apart_scene01_move_wrapper",
																"wrsuburb_$c-apts-intro-john", "wrsuburb_$n-apts-intro-johna")
	thread_new("wrsuburb_stronghold_apart_phonecall")

	delay(2)

	fade_in(.7)
	delay(2)
	WRsuburb_apts_ho1_anim_handle = thread_new("wrsuburb_stronghold_apart_play_wrapper", "wrsuburb_$c-apts-intro-ho1", "idle showcase")
	delay(1)
	WRsuburb_apts_ho2_anim_handle = thread_new("wrsuburb_stronghold_apart_play_wrapper", "wrsuburb_$c-apts-intro-ho2", "idle touchself")
	delay(3)

	--camera_look_through("wrsuburb_$n-apt-intro-jh01")
	camera_look_through("wrsuburb_$cam-apts-am03")
	
	delay(5)
	fade_out(.75)
	fade_out_block()
	modal_end()
end

function wrsuburb_stronghold_apart_play_wrapper(npc, action)
	play_action( npc, action )
end

function wrsuburb_stronghold_apart_scene01_end()
	fade_out(0)
	delay(.1)
	camera_end_script()
	thread_kill(WRsuburb_aparthandle_intro_walk1)
	thread_kill(WRsuburb_aparthandle_intro_walk2)
	thread_kill(WRsuburb_aparthandle_intro_walk3)
	thread_kill(WRsuburb_apts_ho1_anim_handle)
	thread_kill(WRsuburb_apts_ho2_anim_handle)
	group_destroy("wrsuburb_$G-apts-intro")
	group_create("wrsuburb_$G_sh_apart_init", true)
	--group_create("wrsuburb_$G-apts-rifle", true)
	delay(.25)
end

function wrsuburb_stronghold_apart_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	WRsuburb_apts_phone_handle = audio_play("JULIUS_STRONGHOLD_7", "voice", false, false)
end

function wrsuburb_stronghold_apart_scene01_move_wrapper(npc, nav)
	move_to(npc, nav, 1)
end


function wrsuburb_stronghold_apart_start()
	set_mission_author("Alvan Monje")

	cutscene_in()
	scripted_cutscene_play("wrsuburb_stronghold_apart_scene01", "wrsuburb_stronghold_apart_scene01_end")
	cutscene_out()	

	--setup death calls for each target
	on_death("wrsuburb_stronghold_apart_target_killed", "wrsuburb_$c_sh_apart_target1")
	on_death("wrsuburb_stronghold_apart_target_killed", "wrsuburb_$c_sh_apart_target2")
	on_death("wrsuburb_stronghold_apart_target_killed", "wrsuburb_$c_sh_apart_target3")
	on_death("wrsuburb_stronghold_apart_target_killed", "wrsuburb_$c_sh_apart_target4")
	on_death("wrsuburb_stronghold_apart_target_killed", "wrsuburb_$c_sh_apart_target5")
	
	--setup fleeing for each target when they are found
	on_door_opened("wrsuburb_stronghold_apart_target1_found", "wrsuburb_MeshMover350") -- fixed
	on_door_opened("wrsuburb_stronghold_apart_target2_found", "wrsuburb_MeshMover340")
	on_door_opened("wrsuburb_stronghold_apart_target3_found", "wrsuburb_MeshMover060")
	on_door_opened("wrsuburb_stronghold_apart_target4_found", "wrsuburb_MeshMover080")
	on_door_opened("wrsuburb_stronghold_apart_target5_found", "wrsuburb_MeshMover010") -- "wrsuburb_MeshMover010"

	--add markers for targets
	add_marker_npc("wrsuburb_$c_sh_apart_target1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("wrsuburb_$c_sh_apart_target2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("wrsuburb_$c_sh_apart_target3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("wrsuburb_$c_sh_apart_target4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("wrsuburb_$c_sh_apart_target5", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	
	--enable triggers
	trigger_enable("wrsuburb_$t-apart-int-a")
	on_trigger("wrsuburb_stronghold_apart_create_interior_a", "wrsuburb_$t-apart-int-a")
	
	trigger_enable("wrsuburb_$t-apart-int-b")
	on_trigger("wrsuburb_stronghold_apart_create_interior_b", "wrsuburb_$t-apart-int-b")

	trigger_disable("wrsuburb_$t-apts-raid")
	on_trigger("wrsuburb_stronghold_apart_do_raid", "wrsuburb_$t-apts-raid")


	--group_create("wrsuburb_$G_sh_apart_f1_a")
	--group_create("wrsuburb_$G_sh_apart_f1_b")
	
	mission_help_table("wrapartments_start")  --text "Kill all the jurors that the Rollerz are protecting!"
	objective_text("wrapartments_objective", Targets_total - Targets_dead)	
	notoriety_set("rollers", 1)
	notoriety_set_max("rollers", 1)
	notoriety_set_min("rollers", 1)
end


function wrsuburb_stronghold_apart_create_interior_a()
	trigger_disable("wrsuburb_$t-apart-int-a")
	group_create("wrsuburb_$G-apart-int-a")
end

function wrsuburb_stronghold_apart_create_interior_b()
	trigger_disable("wrsuburb_$t-apart-int-b")
	group_create("wrsuburb_$G-apart-int-b")
end




function wrsuburb_test_anim()
	--play_custom_action("wrsuburb_$c_sh_apart_target3", "pml1_bs_sx_strtl.animx") -- up against wall about to spank?
	--play_custom_action("wrsuburb_$c_sh_apart_target3", "pml1_bs_bj_strtl.animx") -- bj standing up
	--play_custom_action("wrsuburb_$c_sh_apart_target3", "pfl1_bs_he_get_strtl.animx") -- bj sitting/leaning against, hand behind head
	--play_custom_action("wrsuburb_$c_sh_apart_target3", "pml1_bs_sp_strtl.animx") -- laying on bed
	play_custom_action("wrsuburb_$c_sh_apart_ho3", "pfl1_bs_sx_strtl.animx") -- ho, up against wall about to spank?
end

--[[
VK03A_SEX_HO_ANIMS = {"pfl1_bs_sx_strtl.animx", "pfl1_bs_bj_strtl.animx", "pfl1_bs_he_give_strtl.animx", "PFL1_BS_SP_Strtl_B.animx"}
VK03A_SEX_THUG_ANIMS = {"pml1_bs_sx_strtl.animx", "pml1_bs_bj_strtl.animx", "pfl1_bs_he_get_strtl.animx", "pml1_bs_sp_strtl.animx"}
VK03A_SEX_SOUNDS = {"BFSTRP_CLIMAX_LOWPASS", "BFSTRP_SEX_LOWPASS", "BFSTRP_SEXFINISH_LOWPASS"}


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
	play_custom_action( thug, thuganim )
	npc_turn_material( thug )
	attack( thug )
end

function vk03a_ho_anim(ho, hoanim)
	hearing_enable(ho)
	play_custom_action( ho, hoanim )
	npc_turn_material( ho )
	flee( ho, "#PLAYER#", true )
end
]]






--functions to flee each target as they are found
function wrsuburb_stronghold_apart_target1_found()
	debug_message("mesh29 opened")

	--add_marker_npc("wrsuburb_$c_sh_apart_target1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	--play_custom_action("wrsuburb_$c_sh_apart_target1", "pml1_bs_sx_strtl.animx")
	--play_custom_action("wrsuburb_$c_sh_apart_ho1", "pfl1_bs_sx_strtl.animx")
	combat_enable("wrsuburb_$c_sh_apart_f2_a1")
	WRsub_apts_handle_t1_john = thread_new("play_custom_action", "wrsuburb_$c_sh_apart_target1", "pml1_bs_sx_strtl.animx") -- up against wall about to spank?
	WRsub_apts_handle_t1_ho = thread_new("play_custom_action", "wrsuburb_$c_sh_apart_ho1", "pfl1_bs_sx_strtl.animx") -- up against wall about to spank?
	delay(1)
	thread_kill(WRsub_apts_handle_t1_john)
	thread_kill(WRsub_apts_handle_t1_ho)
	npc_turn_material("wrsuburb_$c_sh_apart_target1")
	npc_turn_material("wrsuburb_$c_sh_apart_ho1")
	combat_enable("wrsuburb_$c_sh_apart_target1")
	combat_enable("wrsuburb_$c_sh_apart_ho1")
	flee("wrsuburb_$c_sh_apart_target1")
	flee("wrsuburb_$c_sh_apart_ho1")
end

function wrsuburb_stronghold_apart_target2_found()
	debug_message("mesh34 opened")

	--add_marker_npc("wrsuburb_$c_sh_apart_target2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	combat_enable("wrsuburb_$c_sh_apart_f3_a1")
	combat_enable("wrsuburb_$c_sh_apart_f3_a2")
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_target2", "pml1_bs_bj_strtl.animx") -- bj standing up
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_ho2", "pfl1_bs_bj_strtl.animx") -- bj standing up
	delay(2)
	npc_turn_material("wrsuburb_$c_sh_apart_target2")
	npc_turn_material("wrsuburb_$c_sh_apart_ho2")
	combat_enable("wrsuburb_$c_sh_apart_target2")
	combat_enable("wrsuburb_$c_sh_apart_ho2")
	flee("wrsuburb_$c_sh_apart_target2")
	flee("wrsuburb_$c_sh_apart_ho2")
end

--xxx
function wrsuburb_stronghold_apart_target3_found()
	debug_message("mesh6 opened")

	--add_marker_npc("wrsuburb_$c_sh_apart_target3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	combat_enable("wrsuburb_$c_sh_apart_f1_b2")
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_target3", "pfl1_bs_he_get_strtl.animx") -- bj sitting/leaning against, hand behind head
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_ho3", "pfl1_bs_he_give_strtl.animx") -- bj sitting/leaning against, hand behind head
	delay(1)
	npc_turn_material("wrsuburb_$c_sh_apart_target3")
	npc_turn_material("wrsuburb_$c_sh_apart_ho3")
	combat_enable("wrsuburb_$c_sh_apart_target3")
	combat_enable("wrsuburb_$c_sh_apart_ho3")
	flee("wrsuburb_$c_sh_apart_target3")
	flee("wrsuburb_$c_sh_apart_ho3")
end

function wrsuburb_stronghold_apart_target4_found()
	debug_message("mesh8 opened")

	--add_marker_npc("wrsuburb_$c_sh_apart_target4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_target4", "pml1_bs_sx_strtl.animx")	-- spank
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_ho4", "pfl1_bs_sx_strtl.animx")
	delay(1.5)
	npc_turn_material("wrsuburb_$c_sh_apart_target4")
	npc_turn_material("wrsuburb_$c_sh_apart_ho4")
	flee("wrsuburb_$c_sh_apart_target4")
	flee("wrsuburb_$c_sh_apart_ho4")
end

function wrsuburb_stronghold_apart_target5_found()
	debug_message("mesh2 opened -- target 5 found!!")

	--add_marker_npc("wrsuburb_$c_sh_apart_target5", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	combat_enable("wrsuburb_$c_sh_apart_f3_b1")
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_target5", "pml1_bs_bj_strtl.animx")	-- bj standing
	thread_new("play_custom_action", "wrsuburb_$c_sh_apart_ho5", "pfl1_bs_bj_strtl.animx")
	delay(2)
	npc_turn_material("wrsuburb_$c_sh_apart_target5")
	npc_turn_material("wrsuburb_$c_sh_apart_ho5")
	combat_enable("wrsuburb_$c_sh_apart_target5")
	combat_enable("wrsuburb_$c_sh_apart_ho5")
	flee("wrsuburb_$c_sh_apart_target5")
	flee("wrsuburb_$c_sh_apart_ho5")
end


function wrsuburb_stronghold_apart_target_killed(npc)
	Targets_dead = Targets_dead + 1
	--mission_help_table_nag("wrapartments_juror_killed") -- text "Juror Killed!"
	objective_text("wrapartments_objective", Targets_total - Targets_dead)	
	remove_marker_npc(npc)
	
	if (Targets_dead == Targets_total) then
		delay(5)
		stronghold_takeover_success()
	elseif (Targets_dead == 2) then
		-- start police raid
		spawning_peds(false)
		spawning_cars(false)
		thread_new("wrsuburb_stronghold_apart_raid_setup")
		delay(2)
		thread_new("wrsuburb_stronghold_apart_play_siren")
		notoriety_set("police", 5)
	end
end


function wrsuburb_stronghold_apart_raid_setup()
	trigger_enable("wrsuburb_$t-apts-raid")

	group_create("wrsuburb_$G-apts-swat-solo", true)
	delay(1)
	set_always_sees_player_flag("wrsuburb_$c-apt-wr-swat06", true)
	set_always_sees_player_flag("wrsuburb_$c-apt-wr-swat07", true)
	set_always_sees_player_flag("wrsuburb_$c-apt-wr-swat08", true)
	set_always_sees_player_flag("wrsuburb_$c-apt-wr-swat09", true)
	attack("wrsuburb_$c-apt-wr-swat06")
	attack("wrsuburb_$c-apt-wr-swat07")
	attack("wrsuburb_$c-apt-wr-swat08")
	attack("wrsuburb_$c-apt-wr-swat09")
end


function wrsuburb_stronghold_apart_play_siren()
	WRsuburb_price_siren_handle = audio_play("FBI_SIREN_LOOP", "foley", false, false)
	delay(3)
	mission_help_table_nag("wrapartments_cops") -- text "Someone called the cops! Watch out!"
	delay(4)
	audio_stop(WRsuburb_price_siren_handle)
end


function wrsuburb_stronghold_apart_do_raid()
	trigger_disable("wrsuburb_$t-apts-raid")

	group_create("wrsuburb_$G-apts-swat", true)
	
	character_add_vehicle("wrsuburb_$c-apts-swat01", "wrsuburb_$v-apts-swat01", 0)
	character_add_vehicle("wrsuburb_$c-apts-swat02", "wrsuburb_$v-apts-swat01", 1)
	thread_new("wrsuburb_stronghold_apart_pathfind_wrap_swat")

	character_add_vehicle("wrsuburb_$c-apts-cop01", "wrsuburb_$v-apts-cop01", 0)
	thread_new("wrsuburb_stronghold_apart_pathfind_wrap_cop")
end

function wrsuburb_stronghold_apart_pathfind_wrap_swat()
	vehicle_pathfind_to("wrsuburb_$v-apts-swat01", "wrsuburb_$n-swat01-a", true)
	thread_new("wrsuburb_stronghold_apart_exit_car", "wrsuburb_$c-apts-swat01")
	thread_new("wrsuburb_stronghold_apart_exit_car", "wrsuburb_$c-apts-swat02")
end

function wrsuburb_stronghold_apart_pathfind_wrap_cop()
	vehicle_pathfind_to("wrsuburb_$v-apts-cop01", "wrsuburb_$n-cop01-a", true)
	thread_new("wrsuburb_stronghold_apart_exit_car", "wrsuburb_$c-apts-cop01")
end

function wrsuburb_stronghold_apart_exit_car(npc)
	vehicle_exit(npc)
	attack(npc)
end



function wrsuburb_stronghold_apart_success()
	group_destroy("wrsuburb_$G_sh_apart_init")
	group_destroy("wrsuburb_$G-apart-int-a")
	group_destroy("wrsuburb_$G-apart-int-b")

	hood_set_owner("wr_suburb02", "playas")

	trigger_enable("wrsuburb_$t-apts-save")
end

function wrsuburb_stronghold_apart_reset()
	objective_text_clear()

	remove_marker_npc("wrsuburb_$c_sh_apart_target1")
	remove_marker_npc("wrsuburb_$c_sh_apart_target2")
	remove_marker_npc("wrsuburb_$c_sh_apart_target3")
	remove_marker_npc("wrsuburb_$c_sh_apart_target4")
	remove_marker_npc("wrsuburb_$c_sh_apart_target5")	

	Targets_dead = 0

	notoriety_reset("rollers")
	notoriety_reset("police")
	
	on_death("", "wrsuburb_$c_sh_apart_target1")
	on_death("", "wrsuburb_$c_sh_apart_target2")
	on_death("", "wrsuburb_$c_sh_apart_target3")
	on_death("", "wrsuburb_$c_sh_apart_target4")
	on_death("", "wrsuburb_$c_sh_apart_target5")

	trigger_disable("wrsuburb_$t-apart-int-a")
	trigger_disable("wrsuburb_$t-apart-int-b")
	trigger_disable("wrsuburb_$t-apts-raid")

	on_trigger("", "wrsuburb_$t-apart-int-a")
	on_trigger("", "wrsuburb_$t-apart-int-b")
	on_trigger("", "wrsuburb_$t-apts-raid")

	--[[
	on_trigger("", "wrsuburb_$t_sh_apart_starta1")
	on_trigger("", "wrsuburb_$t_sh_apart_starta2")
	on_trigger("", "wrsuburb_$t_sh_apart_starta3")
	on_trigger("", "wrsuburb_$t_sh_apart_starta4")
	on_trigger("", "wrsuburb_$t_sh_apart_startb1")
	on_trigger("", "wrsuburb_$t_sh_apart_startb2")
	on_trigger("", "wrsuburb_$t_sh_apart_startb3")
	on_trigger("", "wrsuburb_$t_sh_apart_startb4")
	
	on_trigger("", "wrsuburb_$t_sh_apart_f2_a1")
	on_trigger("", "wrsuburb_$t_sh_apart_f2_a2")
	on_trigger("", "wrsuburb_$t_sh_apart_f3_a1")
	on_trigger("", "wrsuburb_$t_sh_apart_f3_a2")
	on_trigger("", "wrsuburb_$t_sh_apart_f2_b1")
	on_trigger("", "wrsuburb_$t_sh_apart_f2_b2")
	on_trigger("", "wrsuburb_$t_sh_apart_f3_b1")
	on_trigger("", "wrsuburb_$t_sh_apart_f3_b2")
	]]

	door_lock("wrsuburb_MeshMover010", true)
	door_lock("wrsuburb_MeshMover060", true)
	door_lock("wrsuburb_MeshMover080", true)
	door_lock("wrsuburb_MeshMover340", true)
	door_lock("wrsuburb_MeshMover350", true)

	release_to_world("wrsuburb_$G_sh_apart_init")
	release_to_world("wrsuburb_$G-apart-int-a")
	release_to_world("wrsuburb_$G-apart-int-b")
	group_destroy("wrsuburb_$G-apts-intro")
	group_destroy("wrsuburb_$G-apts-swat-solo")
	group_destroy("wrsuburb_$G-apts-swat")
	--group_destroy("wrsuburb_$G-apts-rifle")
	audio_stop(WRsuburb_apts_phone_handle)

	spawning_peds(true)
	spawning_cars(true)
end


function test_text_x()
	mission_help_table_nag("wrapartments_cops") -- text "Someone called the cops! Watch out!"
end

function test_text_y()
	mission_help_table("wrapartments_cops") -- text "Someone called the cops! Watch out!"
end

function wrsub_test_door_lock()
	door_lock("wrsuburb_MeshMover060", true)
end

function wrsub_test_door_unlock()
	door_lock("wrsuburb_MeshMover060", false)
end


function wrsub_test_key()
	group_create("wrsuburb_$g_sh_2f-a")
end

function wrsub_test_sound1()
	local blah

	--audio_play("FBI_SIREN_LOOP", "foley", false, false)
	--delay(3)
	--audio_stop()
end

function wrsub_test_sound3()
	audio_play("POLICE_SIREN_LOOP", "foley", false, false)
end

function wrsub_test_sound4()
	--audio_play("WMSWAT_MIS_CHOPPERPHONE_XX", "voice", false, false)
	group_create("wrsuburb_$G-apts-swat-solo", true)
	audio_play_persona_line("wrsuburb_$c-apts-swat04", "misc - chopper phone", 3)
end


--[[
	audio_play("SYS_CELL_RING", "foley", false, true)
	delay(0.5)
	WRsuburb_price_phone_handle = audio_play("JULIUS_STRONGHOLD_6", "voice", false, false)

FBI_SIREN_LOOP
FIRETRK_SIREN_LOOP
POLICE_SIREN_LOOP
"misc - chopper phone" (WMSWAT is the persona....I don't know how you want to play these.) The lines themselves are "WMSWAT_MIS_CHOPPERPHONE_XX"
]]