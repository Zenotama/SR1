-- racetrack.lua
-- SR district script
-- 1/13/06

Racetrack_storage_phone_handle = 0
Racetrack_storage_path1 = {"racetrack_$n-storage-path-01", "racetrack_$n-storage-path-02", "racetrack_$n-storage-path-03", 
									"racetrack_$n-storage-path-04", "racetrack_$n-storage-path-05", "racetrack_$n-storage-path-06", 
									"racetrack_$n-storage-path-07", "racetrack_$n-storage-path-08", "racetrack_$n-storage-path-09", 
									"racetrack_$n-storage-path-10"}

Racetrack_storage_path2 = {"racetrack_$n-storage-path-05", "racetrack_$n-storage-path-06", "racetrack_$n-storage-path-07", 
									"racetrack_$n-storage-path-08", "racetrack_$n-storage-path-09", "racetrack_$n-storage-path-10", 
									"racetrack_$n-storage-path-01", "racetrack_$n-storage-path-02", "racetrack_$n-storage-path-03", 
									"racetrack_$n-storage-path-04"}

function racetrack_init()

	--setup for storage stronghold
	on_stronghold_takeover_start("racetrack_stronghold_store_start", "racetrack_stronghold_store")
	on_stronghold_takeover_success("racetrack_stronghold_store_success", "racetrack_stronghold_store")
	on_stronghold_reset("racetrack_stronghold_store_reset", "racetrack_stronghold_store")
--	on_stronghold_check_enable("racetrack_stronghold_store_unlock", "racetrack_stronghold_store")
	stronghold_set_cost( "racetrack_stronghold_store",  ARENA_SH_STORAGE_REQUIRED_PROPS)
	
end

function racetrack_main()
	--message("test racetrack") -- test
	stronghold_disable("racetrack_stronghold_store")
end

-- debug function - call from the console with 'lua' command
function warp_racetrack()
	message("warping...")
	delay(0)
	player_teleport(  "racetrack_$nav-warp")
end

function debug_racetrack()
	teleport("#PLAYER#", "racetrack_$t_sh_store_start")
	stronghold_enable("racetrack_stronghold_store")
end





---------------------------------------------------------------
---------------------------------------------------------------
-- RACETRACK STORAGE STRONGHOLD -------------------------------
---------------------------------------------------------------
---------------------------------------------------------------

-- 2006/02/28 STL: This function isn't being called anymore.
function racetrack_stronghold_store_unlock()
	if ( is_mission_complete("wr05") ) then
		stronghold_enable("racetrack_stronghold_store")
		debug_message("arena storage stronghold unlocked!")
	end
end


Racetrack_sh_car_targets = 8
Racetrack_sh_cars_destroyed = 0


function racetrack_stronghold_store_scene01()
	teleport("#PLAYER#", "racetrack_$t_sh_store_start")

	camera_look_through("racetrack_$n-storage-intro-jh01")

	team_despawn("Rollerz", true)

	group_create("racetrack_$G-storage-grenade")

	modal_begin()

	group_create_preload("racetrack_$G_sh_store_targets")
	thread_new("racetrack_stronghold_store_scene01_move_wrapper", "racetrack_$c_sh_store_1a", "racetrack_$n-storage-intro-1a-a")
	thread_new("racetrack_stronghold_store_phonecall")

	delay(2)
	
	fade_in(1)
	delay(8)
	fade_out(1.25)
	fade_out_block()
	modal_end()
end

function racetrack_stronghold_store_scene01_end()
	fade_out(0)
	delay(.1)
	camera_end_script()
end

function racetrack_stronghold_store_scene01_move_wrapper(npc, nav)
	move_to(npc, nav, 1)
end

function racetrack_stronghold_store_start()
	set_mission_author("Alvan Monje")

	cutscene_in()
	scripted_cutscene_play("racetrack_stronghold_store_scene01", "racetrack_stronghold_store_scene01_end")
	cutscene_out()

	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_sh_store_target1")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_sh_store_target2")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_sh_store_target3")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_sh_store_target4")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_sh_store_target5")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_sh_store_target6")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v_s_store_attack")
	on_vehicle_destroyed("racetrack_stronghold_store_check_death", "racetrack_$v-storage-attack02")

	set_unjackable_flag("racetrack_$v_sh_store_target1", true)
	set_unjackable_flag("racetrack_$v_sh_store_target2", true)
	set_unjackable_flag("racetrack_$v_sh_store_target3", true)
	set_unjackable_flag("racetrack_$v_sh_store_target4", true)
	set_unjackable_flag("racetrack_$v_sh_store_target5", true)
	set_unjackable_flag("racetrack_$v_sh_store_target6", true)

	add_marker_vehicle("racetrack_$v_sh_store_target1", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("racetrack_$v_sh_store_target2", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("racetrack_$v_sh_store_target3", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("racetrack_$v_sh_store_target4", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("racetrack_$v_sh_store_target5", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("racetrack_$v_sh_store_target6", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	on_trigger("racetrack_stronghold_store_attack", "racetrack_$t_sh_store_attack")
	trigger_enable("racetrack_$t_sh_store_attack")

	--on_trigger("racetrack_stronghold_store_attack2", "racetrack_$t_sh_store_attack2")
	--trigger_enable("racetrack_$t_sh_store_attack2")

	notoriety_set_max("rollers", 1)

	mission_help_table("wrstorage_start") --text "Destroy all the Rollerz cars!"
	objective_text("wrstorage_objective", Racetrack_sh_car_targets - Racetrack_sh_cars_destroyed) --text "Car Destroyed"
end


function racetrack_stronghold_store_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Racetrack_storage_phone_handle = audio_play("JULIUS_STRONGHOLD_8", "voice", false, false)
end


function racetrack_stronghold_store_check_death(vehicle)
	Racetrack_sh_cars_destroyed = Racetrack_sh_cars_destroyed + 1
	--mission_help_table_nag("wrstorage_car_destroyed") --text "Rollerz car destroyed!"
	objective_text("wrstorage_objective", Racetrack_sh_car_targets - Racetrack_sh_cars_destroyed) --text "Cars Destroyed"
	remove_marker_vehicle(vehicle)
	
	if	(Racetrack_sh_cars_destroyed == Racetrack_sh_car_targets) then
		delay(5)
		stronghold_takeover_success()
	elseif (Racetrack_sh_cars_destroyed == 1) then
		notoriety_set_min("rollers", 1)
	elseif (Racetrack_sh_cars_destroyed == 4) then
		notoriety_set_max("rollers", 2)
		notoriety_set_min("rollers", 2)
	end
end

function racetrack_stronghold_store_attack()
	trigger_disable("racetrack_$t_sh_store_attack")

	thread_new("racetrack_stronghold_store_pathfind", "racetrack_$G_sh_store_attack", "racetrack_$c_sh_store_attack1",
					"racetrack_$c_sh_store_attack2", "racetrack_$v_s_store_attack", Racetrack_storage_path1)

	thread_new("racetrack_stronghold_store_pathfind", "racetrack_$G_sh_store_attack2", "racetrack_$c-storage-attk2-01",
					"racetrack_$c-storage-attk2-02", "racetrack_$v-storage-attack02", Racetrack_storage_path2)
--[[
	group_create("racetrack_$G_sh_store_attack", true)
	character_add_vehicle("racetrack_$c_sh_store_attack1", "racetrack_$v_s_store_attack", 0)
	character_add_vehicle("racetrack_$c_sh_store_attack2", "racetrack_$v_s_store_attack", 1)
	vehicle_chase("racetrack_$v_s_store_attack")
	add_marker_vehicle("racetrack_$v_s_store_attack", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
]]
end

function racetrack_stronghold_store_pathfind(group, npc1, npc2, car, path)
	group_create(group, true)
	character_add_vehicle(npc1, car, 0)
	character_add_vehicle(npc2, car, 1)
	add_marker_vehicle(car, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	vehicle_disable_chase(car, true)
	vehicle_disable_flee(car, true)

	attack(npc2)

	while (1) do
		for i = 1, 10, 1 do
			vehicle_pathfind_to(car, path[i], true, false)
		end
		delay(0)
	end
end

--[[
function racetrack_stronghold_store_attack2()
	trigger_disable("racetrack_$t_sh_store_attack2")

	group_create("racetrack_$G_sh_store_attack2", true)
	character_add_vehicle("racetrack_$c-storage-attk2-01", "racetrack_$v-storage-attack02", 0)
	character_add_vehicle("racetrack_$c-storage-attk2-02", "racetrack_$v-storage-attack02", 1)
	vehicle_chase("racetrack_$v-storage-attack02")
	add_marker_vehicle("racetrack_$v-storage-attack02", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
end
]]


function racetrack_stronghold_store_success()
	objective_text_clear()
	
	remove_marker_vehicle("racetrack_$v_sh_store_target1")
	remove_marker_vehicle("racetrack_$v_sh_store_target2")
	remove_marker_vehicle("racetrack_$v_sh_store_target3")
	remove_marker_vehicle("racetrack_$v_sh_store_target4")
	remove_marker_vehicle("racetrack_$v_sh_store_target6")
	
	hood_set_owner("wr_arena02", "playas")

	trigger_enable("racetrack_$t-storage-save")

	group_destroy("racetrack_$G_sh_store_targets")
	group_destroy("racetrack_$G_sh_store_attack")
	group_destroy("racetrack_$G_sh_store_attack2")
end

function racetrack_stronghold_store_reset()
	trigger_disable("racetrack_$t_sh_store_attack")
	trigger_disable("racetrack_$t_sh_store_attack2")

	on_vehicle_destroyed("", "racetrack_$v_sh_store_target1")
	on_vehicle_destroyed("", "racetrack_$v_sh_store_target2")
	on_vehicle_destroyed("", "racetrack_$v_sh_store_target3")
	on_vehicle_destroyed("", "racetrack_$v_sh_store_target4")
	on_vehicle_destroyed("", "racetrack_$v_sh_store_target5")
	on_vehicle_destroyed("", "racetrack_$v_sh_store_target6")
	on_vehicle_destroyed("", "racetrack_$v_s_store_attack")
	on_vehicle_destroyed("", "racetrack_$v-storage-attack02")

	remove_marker_vehicle("racetrack_$v_sh_store_target1")
	remove_marker_vehicle("racetrack_$v_sh_store_target2")
	remove_marker_vehicle("racetrack_$v_sh_store_target3")
	remove_marker_vehicle("racetrack_$v_sh_store_target4")
	remove_marker_vehicle("racetrack_$v_sh_store_target5")
	remove_marker_vehicle("racetrack_$v_sh_store_target6")
	remove_marker_vehicle("racetrack_$v_s_store_attack")
	remove_marker_vehicle("racetrack_$v-storage-attack02")
	
	objective_text_clear()
	
	notoriety_reset("rollers")
	notoriety_reset("police")
	
	--group_destroy("racetrack_$G_sh_store_attack")
	--release_to_world("racetrack_$G_sh_store_targets")
	group_destroy("racetrack_$G_sh_store_targets")	-- need to destroy high-end cars so player can't cancel out of stronghold and take them
	release_to_world("racetrack_$G_sh_store_attack")
	release_to_world("racetrack_$G_sh_store_attack2")
	group_destroy("racetrack_$G-storage-grenade")

	Racetrack_sh_cars_destroyed = 0

	audio_stop(Racetrack_storage_phone_handle)
end
