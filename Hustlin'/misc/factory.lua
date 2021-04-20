-- factory.lua
-- SR district script
-- 7/27/05

--[[
OIL SH TWEAKS:
	- SCRIPT SMALL ENCOUNTERS IN CATWALKS AND STUFF W/SEPARATE TRIGGERS?  KEEP IN GAME (NO CUTSCENES)?

STEEL STRONGHOLD TDLS/FIXMES:
	X	- REMOVE DOME THING ON HIGH PLATFORM (TO MAKE ROOM FOR SNIPER)
	- add sniper to top left of stronghold
	- ADD NAVMESH FOR SNIPER PERCH x 3
	- NAVMESH UPDATE - ESP EXTERIOR, BY TRACKS
	X	- look into why framerate is so awful inside building
	- look into how we're doing bomb planting - code and art side
	- look into effects necessary for sh explosion
	- destroy/rel to world as necessary
	X	- add leash for loading dock dudes
	- mesh movers
		- @ game start, open all garage doors (for race)
		- @ sh start, close all garage doors
		- on sh reset, close loading dock door -OR- close on leaving an exit trigger

	2/4/06 comments:
	- change "bomb planted" message to not play on 3rd plant
	- reduce delay after planting 4th bomb
	- steel intro bugs
		X	- buildings don't show up
		X	- patrol thread doesn't seem to start

]]


-- GLOBAL VARIABLES ------
Tag_count_current = 0
Tag_count_total = 7
Bomb_count_current = 0
Bomb_count_total = 4
Handle_factory_oil_pat1 = 0
Handle_factory_oil_pat2 = 0
Handle_factory_oil_pat3 = 0
Handle_factory_oil_pat4 = 0
Handle_factory_oil_pat5 = 0
Handle_factory_oil_pat6 = 0
Handle_factory_oil_pat7 = 0
Handle_factory_steel_pat1 = 0
Handle_factory_steel_pat2 = 0
Factorysteel_death_count = 0
Factorysteel_death_total = 14
Factorysteel_LC_defenders = {"factory_$c-steel-01", "factory_$c-steel-02", "factory_$c-steel-03", "factory_$c-steel-04", "factory_$c-steel-05",
	"factory_$c-steel-06", "factory_$c-steel-07", "factory_$c-steel-08", "factory_$c-steel-09", "factory_$c-steel-19", "factory_$c-steel-20",
	"factory_$c-steel-21", "factory_$c-steel-22", "factory_$c-steel-23"}
Factoryoil_tag_spots = {"factory_oil_tag01", "factory_oil_tag02", "factory_oil_tag03", "factory_oil_tag04", "factory_oil_tag05",
								"factory_oil_tag06", "factory_oil_tag07"}
Factoryoil_tag_navpoints = {"factory_$n-oil-tag01", "factory_$n-oil-tag02", "factory_$n-oil-tag03", "factory_$n-oil-tag04",
									"factory_$n-oil-tag05", "factory_$n-oil-tag06", "factory_$n-oil-tag07"}

Factory_handle_garage_audio = 0
Factory_steel_phone_handle = 0
Factory_oil_phone_handle = 0
Factory_oil_handle_drink_anim = 0
Factory_oil_was_successful = false

Factory_sh_steel_failed = 0		-- 0 = uninitialized, 1 = dead, 2 = success

-- FUNCTIONS ------------
function factory_init()

	-- OIL STRONGHOLD --
	on_stronghold_takeover_start("factory_sh_oil_start", "factory_sh_oil")
	on_stronghold_reset("factory_sh_oil_reset", "factory_sh_oil")
	on_stronghold_takeover_success("factory_sh_oil_success", "factory_sh_oil")
--	on_stronghold_check_enable("factory_sh_oil_unlock", "factory_sh_oil")
	stronghold_set_cost( "factory_sh_oil",  FACTORY_SH_OIL_REQUIRED_PROPS)

	for i = 1, Tag_count_total, 1 do
		tagging_spot_disable(Factoryoil_tag_spots[i])
	end
	

	-- STEEL/GUN WORKS STRONGHOLD --
	on_stronghold_takeover_start("factory_sh_steel_start", "factory_sh_steel")
	on_stronghold_reset("factory_sh_steel_reset", "factory_sh_steel")
	on_stronghold_takeover_success("factory_sh_steel_success", "factory_sh_steel")
--	on_stronghold_check_enable("factory_sh_steel_unlock", "factory_sh_steel")
	stronghold_set_cost( "factory_sh_steel", FACTORY_SH_STEEL_REQUIRED_PROPS )


	-- FIXME - NO WORKY
	-- open up garage doors at game start for racing activity
	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage02", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage03", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage04", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage06", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage07", "start1")

	--debug_factory()
end


function factory_main()
	door_lock("factory_steel_MeshMover02b0", true)	-- lock loading dock door on level load
end


-- debug function - call from the console with 'lua' command
function warp_factory()
	message("warping...")
	delay(0)
	player_teleport(  "factory_$nav-warp")
end


function debug_factory()
	--teleport("#PLAYER#", "factory_$n_sh1_warp")	-- oil
	teleport("#PLAYER#", "factory_$n-steel-warp1")	-- steel
	--inv_item_add("sniper_rifle")

	stronghold_enable("factory_sh_steel")
	stronghold_enable("factory_sh_oil")
end


---------------------------------------
-- xOIL STRONGHOLD ---------------------
---------------------------------------

-- 2006/02/28 STL: This function isn't being called anymore.
function factory_sh_oil_unlock()
	if ( is_mission_complete("lc05") ) then
		stronghold_enable("factory_sh_oil")
		debug_message("factory oil stronghold unlocked!")
	end
end


function factory_sh_oil_scene01()
	teleport("#PLAYER#", "factory_$stronghold000")

	camera_look_through("factory_$n-intro-jh01-oil")
	
	team_despawn("Los Carnales", true)

	modal_begin()

	group_create_preload("factory_$G-oil-primary")
	thread_new("factory_sh_oil_scene01_helper")
	thread_new("factory_sh_oil_phonecall")
	delay(2)

	fade_in(1.25)
	delay(4.23)

	camera_look_through("factory_$cam-oil-intro-tagspot")

	delay(2)
	Factory_oil_handle_drink_anim = thread_new("play_action", "factory_sh1-guard02", "drink action")
	delay(2)

	fade_out(1.25)
	fade_out_block()
	modal_end()
end

function factory_sh_oil_scene01_helper()
	set_animation_state("factory_sh1-guard02", "forty drinking")
end


function factory_sh_oil_scene01_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	thread_kill(Factory_oil_handle_drink_anim)
end


function factory_sh_oil_start()

	Factory_oil_was_successful = false

	Tag_count_current = 0
	
	for i = 1, Tag_count_total, 1 do
		tagging_spot_untag(Factoryoil_tag_spots[i])
	end

	cutscene_in()
	scripted_cutscene_play("factory_sh_oil_scene01", "factory_sh_oil_scene01_end")
	cutscene_out()

	Handle_factory_oil_pat1 = thread_new("factory_sh_oil_start_patrol1")		-- setup patrols
	Handle_factory_oil_pat2 = thread_new("factory_sh_oil_start_patrol2")
	Handle_factory_oil_pat3 = thread_new("factory_sh_oil_start_patrol3")
	Handle_factory_oil_pat4 = thread_new("factory_sh_oil_start_patrol4")
	Handle_factory_oil_pat5 = thread_new("factory_sh_oil_start_patrol5")
	Handle_factory_oil_pat6 = thread_new("factory_sh_oil_start_patrol6")
	Handle_factory_oil_pat7 = thread_new("factory_sh_oil_start_patrol7")
	notoriety_set("los_carnales", 1)
	notoriety_set_min("los_carnales", 1)
	notoriety_set_max("los_carnales", 1)
	tagging_set_difficulty_level(1)

	delay(2)

	mission_help_table("factory_sh_oil_start")		-- text: "Find and tag the 7 tag spots!"
	objective_text("factory_sh_oil_objective", Tag_count_total - Tag_count_current)

	for i = 1, Tag_count_total, 1 do
		tagging_spot_enable(Factoryoil_tag_spots[i])
		on_tagged("factory_sh_oil_do_tag", Factoryoil_tag_spots[i])  -- set up tagging callbacks
		minimap_icon_add_navpoint(Factoryoil_tag_navpoints[i], MINIMAP_ICON_LOCATION)
	end
end


function factory_sh_oil_reset( from_theater )

	for i = 1, Tag_count_total, 1 do
		tagging_spot_disable(Factoryoil_tag_spots[i])
		on_tagged("", Factoryoil_tag_spots[i])  -- unregister tagging callbacks
		minimap_icon_remove_navpoint(Factoryoil_tag_navpoints[i])
	end

	if (from_theater == true) then
		Tag_count_current = Tag_count_total
		
		for i = 1, Tag_count_total, 1 do
			tagging_spot_tag(Factoryoil_tag_spots[i])
		end
	elseif (not Factory_oil_was_successful) then	-- if stonghold isn't completed, reset counter and untag all spots
		Tag_count_current = 0
		
		for i = 1, Tag_count_total, 1 do
			tagging_spot_untag(Factoryoil_tag_spots[i])
		end
	end

	tagging_reset_difficulty_level()
	notoriety_reset("los_carnales")

	--[[
	on_tagged("", "factory_oil_tag01")		-- unregister sh functions
	on_tagged("", "factory_oil_tag02")
	on_tagged("", "factory_oil_tag03")
	on_tagged("", "factory_oil_tag04")
	on_tagged("", "factory_oil_tag05")
	on_tagged("", "factory_oil_tag06")
	on_tagged("", "factory_oil_tag07")

	tagging_spot_disable("factory_oil_tag01")
	tagging_spot_disable("factory_oil_tag02")
	tagging_spot_disable("factory_oil_tag03")
	tagging_spot_disable("factory_oil_tag04")
	tagging_spot_disable("factory_oil_tag05")
	tagging_spot_disable("factory_oil_tag06")
	tagging_spot_disable("factory_oil_tag07")
	]]

	release_to_world("factory_$G-oil-primary")
	--release_to_world("factory_$G-steel-primary")
	--release_to_world("factory_$G-steel-dock")
	--release_to_world("factory_$G-steel-int")
	--release_to_world("factory_$G-steel-ext")

	group_destroy("factory_$G-oil-wave2-west")
	group_destroy("factory_$G-oil-wave2-east")
	group_destroy("factory_$G-oil-wave2-car")

	objective_text_clear()

	thread_kill(Handle_factory_oil_pat1)
	thread_kill(Handle_factory_oil_pat2)
	thread_kill(Handle_factory_oil_pat3)
	thread_kill(Handle_factory_oil_pat4)
	thread_kill(Handle_factory_oil_pat5)
	thread_kill(Handle_factory_oil_pat6)
	thread_kill(Handle_factory_oil_pat7)

	audio_stop(Factory_oil_phone_handle)
end


function factory_sh_oil_success()
	group_destroy("factory_$G-oil-primary")
	trigger_enable("factory_$t-oil-save")
	hood_set_owner("lc_factory03", "Playas")
end


function factory_sh_oil_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Factory_oil_phone_handle = audio_play("JULIUS_STRONGHOLD_11", "voice", false, false)
end


function factory_sh_oil_start_patrol1()
	while (1) do
		move_to("factory_sh1-guard00", "factory_$n_000", 1)
		delay(1)
		move_to("factory_sh1-guard00", "factory_sh1-guard00", 1)
		delay(1)
	end
end

function factory_sh_oil_start_patrol2()
	while (1) do
		move_to("factory_sh1-guard16", "factory_sh1-guard16-a", 1)
		delay(1)
		move_to("factory_sh1-guard16", "factory_sh1-guard16", 1)
		delay(1)
	end
end

function factory_sh_oil_start_patrol3()
	while (1) do
		move_to("factory_sh1-guard17", "factory_sh1-guard17-a", 1)
		delay(1)
		move_to("factory_sh1-guard17", "factory_sh1-guard17", 1)
		delay(1)
	end
end

function factory_sh_oil_start_patrol4()
	while (1) do
		move_to("factory_sh1-guard20", "factory_sh1-guard20-a", 1)
		delay(1)
		move_to("factory_sh1-guard20", "factory_sh1-guard20", 1)
		delay(1)
	end
end

function factory_sh_oil_start_patrol5()
	while (1) do
		move_to("factory_sh1-guard21", "factory_sh1-guard21-a", 1)
		delay(1)
		move_to("factory_sh1-guard21", "factory_sh1-guard21", 1)
		delay(1)
	end
end

function factory_sh_oil_start_patrol6()
	while (1) do
		move_to("factory_sh1-guard14", "factory_sh1-guard14-a", 1)
		delay(1)
		move_to("factory_sh1-guard14", "factory_sh1-guard14", 1)
		delay(1)
	end
end

function factory_sh_oil_start_patrol7()
	while (1) do
		move_to("factory_sh1-guard15", "factory_sh1-guard15-a", 1)
		delay(1)
		move_to("factory_sh1-guard15", "factory_sh1-guard15", 1)
		delay(1)
	end
end


function factory_sh_oil_do_tag()
	Tag_count_current = Tag_count_current + 1
	objective_text("factory_sh_oil_objective", Tag_count_total - Tag_count_current)

	-- remove minimap icon of the spot just tagged; create wave2 guys if necessary
	if ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag01") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag01")
	
		if	(Tag_count_current == 4) then
			factory_sh_oil_west_attack()
			factory_sh_oil_car_attack()
		end

	elseif ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag02") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag02")

		if	(Tag_count_current == 4) then
			factory_sh_oil_west_attack()
			factory_sh_oil_car_attack()
		end

	elseif ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag03") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag03")

		if	(Tag_count_current == 4) then
			factory_sh_oil_east_attack()
			factory_sh_oil_car_attack()
		end

	elseif ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag04") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag04")

		if	(Tag_count_current == 4) then
			factory_sh_oil_east_attack()
			factory_sh_oil_car_attack()
		end
	
	elseif ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag05") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag05")

		if	(Tag_count_current == 4) then
			factory_sh_oil_east_attack()
			factory_sh_oil_car_attack()
		end	
	
	elseif ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag06") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag06")

		if	(Tag_count_current == 4) then
			factory_sh_oil_east_attack()
			factory_sh_oil_car_attack()
		end

	elseif ( get_dist_char_to_nav("#PLAYER#", "factory_$n-oil-tag07") <= 5.0 ) then
		minimap_icon_remove_navpoint("factory_$n-oil-tag07")

		if	(Tag_count_current == 4) then
			factory_sh_oil_east_attack()
			factory_sh_oil_car_attack()
		end	

	end


	if	(Tag_count_current == Tag_count_total) then
		delay(5)
		Factory_oil_was_successful = true
		stronghold_takeover_success()
	else
		-- mission_help_table_nag("factory_sh_oil_tagged") -- text: "Tag spot tagged!"

		if (Tag_count_current == 2) then
			tagging_set_difficulty_level(2)
		elseif (Tag_count_current == 3) then
			notoriety_set_max("los_carnales", 2)
		elseif (Tag_count_current == 4) then
			tagging_set_difficulty_level(3)
		elseif (Tag_count_current == 6) then
			tagging_set_difficulty_level(4)
		end
	end
end


function factory_sh_oil_west_attack()
	debug_message("west attack")

	group_create("factory_$G-oil-wave2-west", true)
	set_always_sees_player_flag("factory_$c-wave2-w-01", true)
	set_always_sees_player_flag("factory_$c-wave2-w-02", true)
	set_always_sees_player_flag("factory_$c-wave2-w-03", true)
	set_always_sees_player_flag("factory_$c-wave2-w-04", true)
	attack("factory_$c-wave2-w-01")
	attack("factory_$c-wave2-w-02")
	attack("factory_$c-wave2-w-03")
	attack("factory_$c-wave2-w-04")
--"factory_$G-oil-wave2-car"
end


function factory_sh_oil_east_attack()
	debug_message("east attack")

	group_create("factory_$G-oil-wave2-east", true)
	set_always_sees_player_flag("factory_$c-wave2-e-01", true)
	set_always_sees_player_flag("factory_$c-wave2-e-02", true)
	set_always_sees_player_flag("factory_$c-wave2-e-03", true)
	set_always_sees_player_flag("factory_$c-wave2-e-04", true)
	attack("factory_$c-wave2-e-01")
	attack("factory_$c-wave2-e-02")
	attack("factory_$c-wave2-e-03")
	attack("factory_$c-wave2-e-04")
end


function factory_sh_oil_car_attack()
	debug_message("car attack")

	group_create("factory_$G-oil-wave2-car", true)
	character_add_vehicle("factory_$c-wave2-car-01", "factory_$v-wave2-car", 0)
	character_add_vehicle("factory_$c-wave2-car-02", "factory_$v-wave2-car", 1)
	vehicle_pathfind_to("factory_$v-wave2-car", "factory_$n-wave2-car-a", true, true)
	thread_new("factory_sh_oil_car_exit", "factory_$c-wave2-car-01")
	thread_new("factory_sh_oil_car_exit", "factory_$c-wave2-car-02")
end


function factory_sh_oil_car_exit(npc)
	vehicle_exit(npc)
	set_always_sees_player_flag(npc, true)
	attack(npc)
end


--[[
	vehicle_pathfind_to("barrio_$v_sh_bossmobile", "barrio_$n-power-boss-01", true, true)
	delay(.1)
	thread_new("barrio_stronghold_boss_exit", "barrio_sh_boss")
	thread_new("barrio_stronghold_boss_exit", "barrio_sh_bossescort1")
end


function barrio_stronghold_boss_exit(npc)
	vehicle_exit(npc)
	attack(npc)
end
]]






function factory_test_no()
	notoriety_set_min("los_carnales", 4)
	notoriety_set("los_carnales", 4)
end




---------------------------------------
-- xSTEEL STRONGHOLD -------------------
---------------------------------------

--[[
"factory_steel_MeshMover02b0" -- loading dock
"factory_steel_MeshMover020"	-- to rooftop
]]


-- 2006/02/28 STL: This function isn't being called anymore.
function factory_sh_steel_unlock()
	if ( is_mission_complete("lc02") ) then
		stronghold_enable("factory_sh_steel")
		debug_message("factory steel stronghold unlocked!")
	end
end


-- steel stronghold intro
function factory_sh_steel_scene01()

	teleport("#PLAYER#", "factory_$t-steel-use")
	load_chunks("sr_chunk18", "sr_chunk17")	-- new chunk, current chunk

	camera_look_through("factory_$cam-jh-steel-intro01")

	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start2") -- close garage doors
	mesh_mover_play_action("factory_steel_MeshMover_garage02", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage03", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage04", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage06", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage07", "start2")

	notoriety_set("police", 0)
	character_slots_reserve_for_team("Los Carnales", 5)

	team_despawn("Los Carnales", true)

	modal_begin()

	group_create_preload("factory_$G-steel-primary")
	thread_new("factory_sh_steel_scene01_helper")
	thread_new("factory_sh_steel_phonecall")

	delay(2)
	--delay(5) -- 4/18/06, debug opt precert build, real time from first ring to fade in: 1.07 sec
	--delay(10) -- 3.94 sec
	--delay(15) -- 8.77 sec

	fade_in(1)
	delay(4.75)
	camera_look_through("factory_$cam-jh-steel-intro02")
	delay(3.5)
	camera_look_through("factory_$cam-steel-04")
	delay(3)
	fade_out(0.75)
	fade_out_block()
	modal_end()
end

function factory_sh_steel_scene01_helper()
	Handle_factory_steel_pat1 = thread_new("factory_sh_steel_patrol", "factory_$c-steel-06", "factory_$n-steel-06a")
	Handle_factory_steel_pat2 = thread_new("factory_sh_steel_patrol", "factory_$c-steel-07", "factory_$n-steel-07a")
	npc_unholster_best_weapon("factory_$c-steel-08")
	npc_unholster_best_weapon("factory_$c-steel-09")
	npc_unholster_best_weapon("factory_$c-steel-23")
end

function factory_sh_steel_scene01_end()
	fade_out(0)
	delay(.1)
	camera_end_script()
end


function factory_sh_steel_start()
	cutscene_in()
	scripted_cutscene_play("factory_sh_steel_scene01", "factory_sh_steel_scene01_end") -- steel intro
	cutscene_out()
	
	on_trigger("factory_sh_steel_snipe_attack1", "factory_$t-steel-snipe01")		-- dc (disabled correctly)
	on_trigger("factory_sh_steel_deaf01", "factory_$t-steel-deaf01")					-- dc
	on_trigger("factory_sh_steel_exterior", "factory_$t-steel-ext")					-- dc
	on_trigger("factory_sh_steel_car1", "factory_$t-steel-car1")						-- dc
	on_trigger("factory_sh_steel_car2", "factory_$t-steel-car2")						-- dc
	on_trigger("factory_sh_steel_bomb_objective", "factory_$t-steel-int2")			-- dc
	on_trigger("factory_sh_steel_dock_hearing", "factory_$t-steel-dock-hearing")	-- dc
	on_trigger("factory_sh_steel_do_bomb1", "factory_$t-steel-bomb01")				-- dc
	on_trigger("factory_sh_steel_do_bomb2", "factory_$t-steel-bomb02")				-- dc
	on_trigger("factory_sh_steel_do_bomb3", "factory_$t-steel-bomb03")				-- dc
	on_trigger("factory_sh_steel_do_bomb4", "factory_$t-steel-bomb04")				-- dc
	on_trigger("factory_sh_steel_do_bomb4_help", "factory_$t-steel-bomb4-help2")
	on_trigger_exit("factory_sh_steel_exit_end_trigger", "factory_$t-steel-end")	-- dc
	
	trigger_enable("factory_$t-steel-snipe01")
	trigger_enable("factory_$t-steel-deaf01")
	trigger_enable("factory_$t-steel-ext")
	trigger_enable("factory_$t-steel-car1")
	trigger_enable("factory_$t-steel-car2")
	trigger_disable("factory_$t-steel-dock-hearing")
	trigger_disable("factory_$t-steel-bomb4-help2")

	--on_death("factory_sh_steel_snipe_on_death", "factory_$c-steel-08")
	--on_death("factory_sh_steel_snipe_on_death", "factory_$c-steel-09")

	for i = 1, Factorysteel_death_total, 1 do
		add_marker_npc(Factorysteel_LC_defenders[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("factory_sh_steel_check_death", Factorysteel_LC_defenders[i])
	end

	delay(1)

	objective_text("factorysteel_killcount", Factorysteel_death_total - Factorysteel_death_count)
	mission_help_table("factorysteel_defenders")	-- text "Kill the Carnales defenders!"

	-- setup garage/dock area
	group_create("factory_$G-steel-dock", true)
	combat_disable("factory_$c-steel-10")
	combat_disable("factory_$c-steel-11")
	combat_disable("factory_$c-steel-12")
	combat_disable("factory_$c-steel-14")
	combat_disable("factory_$c-steel-15")
	combat_disable("factory_$c-steel-16")

	character_hide("factory_$c-steel-10")
	character_hide("factory_$c-steel-11")
	character_hide("factory_$c-steel-12")
	character_hide("factory_$c-steel-14")
	character_hide("factory_$c-steel-15")
	character_hide("factory_$c-steel-16")
end


function factory_sh_steel_reset()
	thread_kill(Handle_factory_steel_pat1)
	thread_kill(Handle_factory_steel_pat2)

	hud_timer_stop()

	trigger_disable("factory_$t-steel-snipe01")
	trigger_disable("factory_$t-steel-deaf01")
	trigger_disable("factory_$t-steel-ext")
	trigger_disable("factory_$t-steel-car1")
	trigger_disable("factory_$t-steel-car2")
	trigger_disable("factory_$t-steel-int2")
	trigger_disable("factory_$t-steel-dock-hearing")
	trigger_disable("factory_$t-steel-bomb01")
	trigger_disable("factory_$t-steel-bomb02")
	trigger_disable("factory_$t-steel-bomb03")
	trigger_disable("factory_$t-steel-bomb04")
	trigger_disable("factory_$t-steel-end")
	trigger_disable("factory_$t-steel-bomb4-help2")

	on_trigger("", "factory_$t-steel-snipe01")	-- unregister functions
	on_trigger("", "factory_$t-steel-deaf01")
	on_trigger("", "factory_$t-steel-ext")
	on_trigger("", "factory_$t-steel-car1")
	on_trigger("", "factory_$t-steel-car2")
	on_trigger("", "factory_$t-steel-bomb01")
	on_trigger("", "factory_$t-steel-bomb02")
	on_trigger("", "factory_$t-steel-bomb03")
	on_trigger("", "factory_$t-steel-bomb04")
	on_trigger("", "factory_$t-steel-int2")
	on_trigger("", "factory_$t-steel-end")
	on_trigger_exit("", "factory_$t-steel-end")
	on_death("", "factory_$c-steel-08")
	on_death("", "factory_$c-steel-09")
	on_trigger("", "factory_$t-steel-bomb4-help2")

	remove_marker_trigger("factory_$t-steel-int2")
	remove_marker_trigger("factory_$t-steel-bomb01")
	remove_marker_trigger("factory_$t-steel-bomb02")
	remove_marker_trigger("factory_$t-steel-bomb03")
	remove_marker_trigger("factory_$t-steel-bomb04")

	audio_stop(Factory_steel_phone_handle)

	for i = 1, Factorysteel_death_total, 1 do
		remove_marker_npc(Factorysteel_LC_defenders[i])
	end

	release_to_world("factory_$G-steel-primary")
	release_to_world("factory_$G-steel-dock")
	release_to_world("factory_$G-steel-int")
	release_to_world("factory_$G-steel-ext")

	objective_text_clear()

	--OLD mesh_mover_play_action("factory_steel_MeshMover_door02", "start2")
	door_lock("factory_steel_MeshMover02b0", true)
		-- lock loading dock door upon reset (should be inaccessible even if you beat the stronghold, since you blew it up)

	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start1") -- open garage doors for race
	mesh_mover_play_action("factory_steel_MeshMover_garage02", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage03", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage04", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage06", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage07", "start1")

	Factorysteel_death_count = 0
	Bomb_count_current = 0

	character_slots_clear_reservations()

	distance_display_off()

	group_destroy("factory_$G-steel-bomb01")
	group_destroy("factory_$G-steel-bomb02")
	group_destroy("factory_$G-steel-bomb03")
	group_destroy("factory_$G-steel-bomb04")
	group_destroy("factory_$G-steel-items")

	Factory_sh_steel_failed = 0
end

function factory_sh_steel_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Factory_steel_phone_handle = audio_play("JULIUS_STRONGHOLD_12", "voice", false, false)
end

function factory_sh_steel_success()
	group_destroy("factory_$G-steel-primary")
	group_destroy("factory_$G-steel-dock")
	group_destroy("factory_$G-steel-int")
	group_destroy("factory_$G-steel-ext")

	hood_set_owner("lc_factory02", "Playas")

	trigger_enable("factory_$t-steel-save")
end

function factory_sh_steel_exit_end_trigger()
	hud_timer_stop()
	trigger_disable("factory_$t-steel-end")

	-- russellA: check other case; want exactly one instance of cutscene playing
	if (Factory_sh_steel_failed == 0) then
		Factory_sh_steel_failed = 2		-- success
		factory_sh_steel_outro()			-- mini cutscene showing explosion
	elseif (Factory_sh_steel_failed == 1) then
		Factory_sh_steel_failed = 2		-- success
	end
end

function factory_sh_steel_end_fail()
	trigger_disable("factory_$t-steel-end")

	-- 3 values: uninit, dead, success
	if (Factory_sh_steel_failed == 0) then
		Factory_sh_steel_failed = 1				-- dead
		factory_sh_steel_outro()					-- mini cutscene showing explosion
	end	
end



function factory_test_effect()
	play_effect("exp_rpg", "factory_$n-steel-effect02", false)
	delay(.1)
	play_effect("exp_steel_factory", "factory_$t-steel-bomb04", false)
	delay(.2)
	play_effect("exp_rpg", "factory_$n-steel-effect03", false)
end

function factory_test_effect2()
	ingame_effect_remove_navpoint("factory_$t-steel-bomb04")
	ingame_effect_remove_navpoint("factory_$n-steel-effect02")
	ingame_effect_remove_navpoint("factory_$n-steel-effect03")
end



-- cutscene - stronghold explosion
function factory_sh_steel_scene02_outro()
	character_hide("#PLAYER#")

	modal_begin()
	camera_look_through("factory_$cam-steel-outro-mf02")
	delay(.45)
	fade_in(0.75)
	delay(1.5)
	camera_shake_start(.009, 1700, 1700)

	play_effect("exp_steel_factory", "factory_$t-steel-bomb04", false)
	delay(5)

	if ( not(Factory_sh_steel_failed == 1) ) then
		fade_out(0.75)
		fade_out_block()
	end

	modal_end()
end

function factory_sh_steel_scene02_outro_end()
	if (not(Factory_sh_steel_failed == 1)) then
		fade_out(0)
	end
	delay(.1)
	--teleport("#PLAYER#", "factory_$n-steel-end")
	camera_end_script()
	ingame_effect_remove_navpoint("factory_$t-steel-bomb04")
	ingame_effect_remove_navpoint("factory_$n-steel-effect02")
	ingame_effect_remove_navpoint("factory_$n-steel-effect03")


	-- if player escaped, stronghold complete, else hitpoints 0
	if (Factory_sh_steel_failed == 1) then
		thread_new("factory_steel_show_character_thread")
		set_current_hit_points("#PLAYER#", 0)
		--npc_ragdoll( "#PLAYER#", 0 )	-- enter ragdoll
		scripted_cutscene_playing(false)
	else
		character_show("#PLAYER#")
		delay(.25)
		thread_new( "stronghold_complete" )
	end

end

-- deliberately not following naming convention, so thread won't be killed automatically in code
function factory_steel_show_character_thread()
	delay(6)
	character_show("#PLAYER#")
end

function factory_sh_steel_outro()
	if ( not(is_dead("#PLAYER#")) ) then	-- to catch case of player dying right before explosion cutscene
		cutscene_in()
		scripted_cutscene_play("factory_sh_steel_scene02_outro", "factory_sh_steel_scene02_outro_end") -- stronghold explosion
	end
end

function stronghold_complete()
	stronghold_takeover_success()
	scripted_cutscene_playing(false)
	delay(.1)
	fade_in(0)
end

function factory_sh_steel_patrol(npc, nav)
	npc_unholster_best_weapon(npc)
	
	while (1) do
		move_to(npc, nav, 1)
		delay(2)
		move_to(npc, npc, 1)
		delay(2)

		delay(0)
	end
end


function factory_sh_steel_snipe_attack1()
	trigger_disable("factory_$t-steel-snipe01")

	attack("factory_$c-steel-08")
	attack("factory_$c-steel-09")
end

function factory_sh_steel_snipe_on_death()
	--debug_message("snipe attack on death!")
	attack("factory_$c-steel-08")
	attack("factory_$c-steel-09")
end

function factory_sh_steel_deaf01()
	trigger_disable("factory_$t-steel-deaf01")

	-- OLD mesh_mover_play_action("factory_steel_MeshMover_door02", "start1")
	door_lock("factory_steel_MeshMover02b0", false)	-- unlock loading dock door
	door_close("factory_steel_MeshMover020")

	hearing_enable("factory_$c-steel-06")
	hearing_enable("factory_$c-steel-07")
	hearing_enable("factory_$c-steel-19")
	hearing_enable("factory_$c-steel-20")
	hearing_enable("factory_$c-steel-21")
	hearing_enable("factory_$c-steel-22")
end

function factory_sh_steel_exterior()
	trigger_disable("factory_$t-steel-ext")

	group_create("factory_$G-steel-ext", true)

	--debug_message("ext group created")

	character_add_vehicle("factory_$c-steel-ext01", "factory_$v-steel-ext01", 0)
	character_add_vehicle("factory_$c-steel-ext02", "factory_$v-steel-ext01", 1)

	character_add_vehicle("factory_$c-steel-ext03", "factory_$v-steel-ext02", 0)
	character_add_vehicle("factory_$c-steel-ext04", "factory_$v-steel-ext02", 1)

	--set_unjackable_flag("factory_$v-steel-ext02", true)
end


function factory_sh_steel_car1()
	trigger_disable("factory_$t-steel-car1")

	vehicle_pathfind_to("factory_$v-steel-ext01", "factory_$n-steel-ext-v01a", true, true)
	vehicle_exit("factory_$c-steel-ext01")
	vehicle_exit("factory_$c-steel-ext02")
	attack("factory_$c-steel-ext01")
	attack("factory_$c-steel-ext02")
end

function factory_sh_steel_car2()
	trigger_disable("factory_$t-steel-car2")
	
	vehicle_pathfind_to("factory_$v-steel-ext02", "factory_$n-steel-ext-v02a", true, true)
	vehicle_exit("factory_$c-steel-ext03")
	vehicle_exit("factory_$c-steel-ext04")
	attack("factory_$c-steel-ext03")
	attack("factory_$c-steel-ext04")
end


function factory_sh_steel_bomb_objective()
	trigger_disable("factory_$t-steel-int2")
	remove_marker_trigger("factory_$t-steel-int2")

	group_create("factory_$G-steel-items")

	mission_help_table("factory_steel_interior") -- text "Plant the bombs!"
	objective_text("factory_steel_objective", Bomb_count_total - Bomb_count_current)

	add_marker_trigger("factory_$t-steel-bomb01", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb02", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb03", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)

	trigger_enable("factory_$t-steel-bomb01")
	trigger_enable("factory_$t-steel-bomb02")
	trigger_enable("factory_$t-steel-bomb03")
end


function factory_sh_steel_do_bomb1()
	trigger_disable("factory_$t-steel-bomb01")

	remove_marker_trigger("factory_$t-steel-bomb01")

	factory_sh_steel_play_bomb_anim("factory_$G-steel-bomb01")

	Bomb_count_current = Bomb_count_current + 1
	objective_text("factory_steel_objective", Bomb_count_total - Bomb_count_current)

	factory_sh_steel_check_bombs()
end

function factory_sh_steel_do_bomb2()
	trigger_disable("factory_$t-steel-bomb02")

	remove_marker_trigger("factory_$t-steel-bomb02")

	factory_sh_steel_play_bomb_anim("factory_$G-steel-bomb02")

	Bomb_count_current = Bomb_count_current + 1
	objective_text("factory_steel_objective", Bomb_count_total - Bomb_count_current)

	factory_sh_steel_check_bombs()
end

function factory_sh_steel_do_bomb3()
	trigger_disable("factory_$t-steel-bomb03")

	remove_marker_trigger("factory_$t-steel-bomb03")

	factory_sh_steel_play_bomb_anim("factory_$G-steel-bomb03")

	Bomb_count_current = Bomb_count_current + 1
	objective_text("factory_steel_objective", Bomb_count_total - Bomb_count_current)

	factory_sh_steel_check_bombs()
end

function factory_sh_steel_play_bomb_anim(bomb)
	player_controls_disable()
	holster()
	thread_new("factory_sh_steel_play_bomb_anim_timer", bomb)
	play_action("#PLAYER#", "bomb plant")
end

function factory_sh_steel_play_bomb_anim_timer(bomb)
	delay(1)
	thread_new("factory_sh_steel_plant_bomb_audio")
	unholster()
	player_controls_enable()
	group_create(bomb)
end


function factory_sh_steel_plant_bomb_audio()
	audio_play("SFX_SET_EXPLO", "foley", false, true)
end


function factory_sh_steel_check_bombs()
	--mission_help_table_nag("factory_steel_planted") -- text "Bomb planted!"

	if	(Bomb_count_current == 3) then
		mission_help_table("factorysteel_bomb4")	-- text "One more bomb left to plant."
		add_marker_trigger("factory_$t-steel-bomb04", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
		trigger_enable("factory_$t-steel-bomb04")	
		trigger_enable("factory_$t-steel-bomb4-help2")
	end
end


function factory_sh_steel_do_bomb4_help()
	trigger_disable("factory_$t-steel-bomb4-help2")
	mission_help_table("factorysteel_bomb4_help")	-- text "Find a way to the top of the factory."
end


function factory_sh_steel_do_bomb4()
	trigger_disable("factory_$t-steel-bomb04")
	--mission_help_table_nag("factory_steel_planted")	-- text "Bomb planted!"
	remove_marker_trigger("factory_$t-steel-bomb04")

	factory_sh_steel_play_bomb_anim("factory_$G-steel-bomb04")

	Bomb_count_current = Bomb_count_current + 1
	objective_text("factory_steel_objective", Bomb_count_total - Bomb_count_current)

	delay(2)
	objective_text_clear()

	mission_help_table("factory_steel_escape") -- text "Get away from the factory before it blows!"
	hud_timer_set(1000 * 35, "factory_sh_steel_end_fail")
	trigger_enable("factory_$t-steel-end")
	distance_display_on("factory_$t-steel-end", 1, 81.75, 1, 81.75)

	-- FIXME:  add enemies
end


-- cutscene: garage door opens, NPCs attack
function factory_sh_steel_scene03()
	objective_text_clear()

	camera_look_through("factory_$n-steel-cam-garage")

	trigger_enable("factory_$t-steel-dock-hearing")

	thread_new("factory_sh_steel_scene03_helper")

	character_show("factory_$c-steel-10")
	character_show("factory_$c-steel-11")
	character_show("factory_$c-steel-12")
	character_show("factory_$c-steel-14")
	character_show("factory_$c-steel-15")
	character_show("factory_$c-steel-16")

	modal_begin()

	--[[
	-- AM 6/3/06: moving to start of stronghold, to remove cutscene loading screen
	group_create_preload("factory_$G-steel-dock")
	combat_disable("factory_$c-steel-10")
	combat_disable("factory_$c-steel-11")
	combat_disable("factory_$c-steel-12")
	combat_disable("factory_$c-steel-14")
	combat_disable("factory_$c-steel-15")
	combat_disable("factory_$c-steel-16")
	]]

	delay(.25)

	--mesh_mover_play_action("factory_steel_MeshMover_garage01", "start1")
	thread_new("factory_sh_steel_garage_audio")
	--thread_new("factory_sh_steel_garage_attack1a")
	--thread_new("factory_sh_steel_garage_attack1b")

	fade_in(.75)
	delay(4.5)
	fade_out(0.75)
	fade_out_block()
	modal_end()
end

function factory_sh_steel_scene03_helper()
	delay(.25)

	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start1")
	thread_new("factory_sh_steel_garage_attack1a")
	thread_new("factory_sh_steel_garage_attack1b")
end

function factory_sh_steel_garage_audio()
	audio_play("SFX_GRGDOOR_START_1", "foley", false, true)
	Factory_handle_garage_audio = audio_play("SFX_DOOR_LOOP_1", "foley", false, false)
	
	delay(3)
	
	audio_stop(Factory_handle_garage_audio)
	audio_play("SFX_DOOR_END_1", "foley", false, true)
end


function factory_sh_steel_scene03_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	audio_stop(Factory_handle_garage_audio)
end


function factory_sh_steel_check_death(char)
	Factorysteel_death_count = Factorysteel_death_count + 1
	remove_marker_npc(char)
	objective_text("factorysteel_killcount", Factorysteel_death_total - Factorysteel_death_count)

	if	(Factorysteel_death_count == Factorysteel_death_total) then
		delay(1)

		cutscene_in()
		scripted_cutscene_play("factory_sh_steel_scene03", "factory_sh_steel_scene03_end") -- garage door opens; NPCs attack
		cutscene_out()

		delay(2)

		mission_help_table("factory_steel_start") -- text: "Get to the weapons factory"
		trigger_enable("factory_$t-steel-int2")
		add_marker_trigger("factory_$t-steel-int2", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	end
end

function factory_sh_steel_garage_attack1a()
	move_to("factory_$c-steel-30", "factory_$n-steel-run01a", 2, false, true)
	attack("factory_$c-steel-30")
end

function factory_sh_steel_garage_attack1b()
	move_to("factory_$c-steel-31", "factory_$n-steel-run01b", 2, false, true)
	attack("factory_$c-steel-31")
end

function factory_sh_steel_dock_hearing()
	trigger_disable("factory_$t-steel-dock-hearing")

	debug_message("hearing and combat enable!")

	hearing_enable("factory_$c-steel-10")
	hearing_enable("factory_$c-steel-11")
	hearing_enable("factory_$c-steel-12")
	hearing_enable("factory_$c-steel-14")
	hearing_enable("factory_$c-steel-15")
	hearing_enable("factory_$c-steel-16")

	combat_enable("factory_$c-steel-10")
	combat_enable("factory_$c-steel-11")
	combat_enable("factory_$c-steel-12")
	combat_enable("factory_$c-steel-14")
	combat_enable("factory_$c-steel-15")
	combat_enable("factory_$c-steel-16")
end



function factory_test_mesh1()
	--mesh_mover_play_action("stl_gdoor01_MM", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage02", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage03", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage04", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage06", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage07", "start1")
end

function factory_test_mesh_close()
	--mesh_mover_play_action("stl_gdoor01_MM", "start1")
	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage02", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage03", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage04", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage06", "start2")
	mesh_mover_play_action("factory_steel_MeshMover_garage07", "start2")
end

function factory_test_mesh2()
	mesh_mover_play_action("factory_steel_MeshMover_garage01", "start2")
end

function factory_test_door1()
	--mesh_mover_play_action("factory_steel_MeshMover_door02", "start1") -- door opens away from dock
	door_open("factory_steel_MeshMover_door02")
end

function factory_test_door2()
	--mesh_mover_play_action("factory_steel_MeshMover_door02", "start2") -- door opens toward dock
	door_close("factory_steel_MeshMover_door02")
end

function factory_test()
	distance_display_on("factory_$t-steel-end", 1, 81.75, 1, 81.75)
end

function factory_test_bomb()
	on_trigger("factory_sh_steel_do_bomb1", "factory_$t-steel-bomb01")
	on_trigger("factory_sh_steel_do_bomb2", "factory_$t-steel-bomb02")
	on_trigger("factory_sh_steel_do_bomb3", "factory_$t-steel-bomb03")
	on_trigger("factory_sh_steel_do_bomb4", "factory_$t-steel-bomb04")

	remove_marker_trigger("factory_$t-steel-int2")
	mission_help_table("factory_steel_interior") -- text "Plant the bombs!"
	objective_text("factory_steel_objective", Bomb_count_current, Bomb_count_total)

	add_marker_trigger("factory_$t-steel-bomb01", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb02", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb03", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb04", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)

	trigger_enable("factory_$t-steel-bomb01")
	trigger_enable("factory_$t-steel-bomb02")
	trigger_enable("factory_$t-steel-bomb03")
	trigger_enable("factory_$t-steel-bomb04")
end

function factory_test_kill()
	for i = 1, Factorysteel_death_total, 1 do
		set_current_hit_points(Factorysteel_LC_defenders[i], 0)
	end
end

function factory_test_bombs()
	remove_marker_trigger("factory_$t-steel-int2")
	mission_help_table("factory_steel_interior") -- text "Plant the bombs!"
	objective_text("factory_steel_objective", Bomb_count_current, Bomb_count_total)

	add_marker_trigger("factory_$t-steel-bomb01", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb02", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	add_marker_trigger("factory_$t-steel-bomb03", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	--add_marker_trigger("factory_$t-steel-bomb04", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)

	trigger_enable("factory_$t-steel-bomb01")
	trigger_enable("factory_$t-steel-bomb02")
	trigger_enable("factory_$t-steel-bomb03")
	--trigger_enable("factory_$t-steel-bomb04")

	teleport("#PLAYER#", "factory_$t-steel-bomb01")
end

function factory_test_bomb4()
	teleport("#PLAYER#", "factory_$t-steel-bomb04")
end


function test_garage_sound1()
	audio_play("SFX_GRGDOOR_START_1", "foley", false, true)
end

function test_garage_sound2()
	audio_play("SFX_DOOR_LOOP_1", "foley", false, true)
end

function test_garage_sound3()
	audio_play("SFX_DOOR_END_1", "foley", false, true)
end

function fact_test_door1()
	door_open("factory_steel_MeshMover020") -- loading dock
	--"factory_steel_MeshMover020"	-- to rooftop
end

function fact_test_door2()
	door_close("factory_steel_MeshMover020") -- loading dock
end

function fact_test_door3()
	door_lock("factory_steel_MeshMover020", true) -- loading dock
end

function fact_test_door4()
	door_lock("factory_steel_MeshMover020", false) -- loading dock
end

function fact_test_walk()
	Handle_factory_steel_pat2 = thread_new("factory_sh_steel_patrol", "factory_$c-steel-07", "factory_$n-steel-07a")
end

function fact_test_sound()
	audio_play("SFX_SET_EXPLO", "foley", false, true)
end

function fact_test_hide()
	character_hide("#PLAYER#") --"factory_$c-steel-02"
end

function fact_test_show()
	character_show("#PLAYER#") --"factory_$c-steel-02"
end

function fact_test_effect()
	camera_look_through("factory_$cam-steel-outro-close")
	delay(1.5)
	--camera_shake_start(.01, 500, 700)
	play_effect("exp_rpg", "factory_$n-steel-effect02", false)
	camera_shake_start(.009, 1700, 1700)
	delay(.1)
	play_effect("exp_steel_factory", "factory_$t-steel-bomb04", false)
	delay(.1)
	play_effect("exp_rpg", "factory_$n-steel-effect03", false)
end


function fact_test_rag1()
	npc_ragdoll( "#PLAYER#", -1 )	-- enter ragdoll
end

function fact_test_rag2()
	npc_ragdoll( "#PLAYER#", 0 )	-- exit ragdoll
end

function fact_test_rag3()
	set_current_hit_points("#PLAYER#", 0)
end