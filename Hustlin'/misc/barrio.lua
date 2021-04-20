-- barrio.lua
-- SR district script
-- 1/10/06


function barrio_init()
	on_stronghold_takeover_start("barrio_stronghold_start", "barrio_stronghold")
	on_stronghold_takeover_success("barrio_stronghold_success", "barrio_stronghold")
	on_stronghold_reset("barrio_stronghold_reset", "barrio_stronghold")
--	on_stronghold_check_enable("barrio_stronghold_unlock", "barrio_stronghold")
	stronghold_set_cost( "barrio_stronghold",  BARRIO_SH_POWER_REQUIRED_PROPS)
end

function barrio_main()
end

-- debug function - call from the console with 'lua' command
function warp_barrio()
	message("warping...")
	delay(0)
	player_teleport( "barrio_$nav-warp")
end


function debug_barrio()
	teleport("#PLAYER#", "barrio_$t_sh_start")
	stronghold_enable("barrio_stronghold")
end




-----------------------------------------------------------------------
-- Barrio Powerplant Mini-Stronghold functions ------------------------
-----------------------------------------------------------------------
--[[
$Group:	"barrio_$G_sh_main"		-- created at stronghold start
$Group:	"barrio_$G_sh_floor2"	-- 8 guys on second floor, don't seem to be getting created at all
$Group:	"barrio_$G_sh_items"		-- weapon, cash items; created by stairwell trigger
$Group:	"barrio_$G_sh_wave2"		-- boss man; created when destroy equipment
]]


Barrio_stronghold_equip_goal = 3
barrio_stronghold_equip_count = 0

Barrio_stronghold_rooftop_goal = 9
Barrio_stronghold_rooftop_count = 0

Barrio_stronghold_rooftop_guys = {"barrio_$c-power-rooftop01", "barrio_$c-power-rooftop02", "barrio_$c-power-rooftop03", "barrio_$c-power-rooftop04",
														"barrio_$c-power-rooftop05", "barrio_$c-power-rooftop06", 
														"barrio_$c-power-rooftop07", "barrio_$c-power-rooftop08", "barrio_$c-power-rooftop09"}

Barrio_stronghold_rooftop_attack_recur_handle = 0

Barrio_power_phone_handle = 0

Barrio_scene03_helper_thread_done = false

Barrio_scene02_walk1_thread_done = false
Barrio_scene02_walk2_thread_done = false
Barrio_scene02_walk3_thread_done = false
Barrio_scene02_walk4_thread_done = false


-- 2006/02/28 STL: This function isn't being called anymore.
function barrio_stronghold_unlock()
	if ( is_mission_complete("lc07") ) then
		stronghold_enable("barrio_stronghold")
		debug_message("barrio stronghold unlocked!")
	end
end


function barrio_stronghold_scene01_intro()
	teleport("#PLAYER#", "barrio_$t_sh_start")

	--camera_look_through("barrio_$n-power-cam01")
	camera_look_through("barrio_$n-power-intro-jh01")
	mesh_mover_reset("barrio_DrugStillA010")
	notoriety_reset("police")
	notoriety_reset("los_carnales")

	team_despawn("Los Carnales", true)

	modal_begin()

	group_create_preload("barrio_$G_sh_main")
	thread_new("barrio_stronghold_phonecall")

	delay(2)
	
	fade_in(.5)
	delay(4.5)
	fade_out(0.75)
	fade_out_block()
	modal_end()
end

function barrio_stronghold_scene01_intro_end()
	fade_out(0)
	delay(.1)
	camera_end_script()
end

function barrio_stronghold_start()
	set_mission_author( "Alvan Monje" )

	cutscene_in()
	scripted_cutscene_play("barrio_stronghold_scene01_intro", "barrio_stronghold_scene01_intro_end")
	cutscene_out()

	trigger_enable("barrio_$t_sh_stairwell")
	trigger_enable("barrio_$t-power-stairwell2")
	on_trigger("barrio_stronghold_do_stair_trigger", "barrio_$t_sh_stairwell")
	on_trigger("barrio_stronghold_do_stair_trigger", "barrio_$t-power-stairwell2")
			
	on_death("barrio_stronghold_boss_killed", "barrio_sh_boss")
	on_mover_destroyed("barrio_stronghold_equip_busted", "barrio_DrugStillA010")

	for i = 1, Barrio_stronghold_rooftop_goal, 1 do
		on_death("barrio_stronghold_rooftop_guy_dies", "barrio_$c-power-rooftop0"..i)
	end

	add_marker_navpoint("barrio_$n-power-drugequip05", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

	delay(1)

	mission_help_table("power_strong_start") -- text "Destroy the drug lab equipment."
end


function barrio_stronghold_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Barrio_power_phone_handle = audio_play("JULIUS_STRONGHOLD_10", "voice", false, false)
end


function barrio_stronghold_reset()
	--debug_message("Power plant reset")

	trigger_disable("barrio_$t_sh_stairwell")
	trigger_disable("barrio_$t-power-stairwell2")
	on_trigger("", "barrio_$t_sh_stairwell")
	on_trigger("", "barrio_$t-power-stairwell2")
	--on_death("", "barrio_sh_fakedrugs1")
	--on_death("", "barrio_sh_fakedrugs2")
	--on_death("", "barrio_sh_fakedrugs3")
	on_death("", "barrio_sh_boss")

	--remove_marker_npc("barrio_sh_fakedrugs1")
	--remove_marker_npc("barrio_sh_fakedrugs2")
	--remove_marker_npc("barrio_sh_fakedrugs3")
	remove_marker_npc("barrio_sh_boss")
	remove_marker_navpoint("barrio_$n-power-drugequip05")

	for i = 1, Barrio_stronghold_rooftop_goal, 1 do
		remove_marker_npc("barrio_$c-power-rooftop0"..i)
	end

	release_to_world("barrio_$G_sh_main")
	release_to_world("barrio_$G_sh_floor2")
	release_to_world("barrio_$G_sh_items")
	release_to_world("barrio_$G_sh_wave2")
	release_to_world("barrio_$G-power-rooftops01")
	release_to_world("barrio_$G-power-rooftops02")

	barrio_stronghold_equip_count = 0
	Barrio_stronghold_rooftop_count = 0

	objective_text_clear()

	-- fixme
	on_mover_destroyed("", "barrio_DrugStillA010")
	--mesh_mover_reset("barrio_DrugStillA010")
	--mesh_show("barrio_DrugStillA010")

	audio_stop(Barrio_power_phone_handle)

	Barrio_scene03_helper_thread_done = false

	Barrio_scene02_walk1_thread_done = false
	Barrio_scene02_walk2_thread_done = false
	Barrio_scene02_walk3_thread_done = false
	Barrio_scene02_walk4_thread_done = false

	thread_kill(Barrio_stronghold_rooftop_attack_recur_handle)
end

function barrio_stronghold_success()
	group_destroy("barrio_$G_sh_main")
	group_destroy("barrio_$G_sh_floor2")
	group_destroy("barrio_$G_sh_items")
	group_destroy("barrio_$G_sh_wave2")
	group_destroy("barrio_$G-power-rooftops01")
	group_destroy("barrio_$G-power-rooftops02")

	trigger_enable("barrio_$t-power-save")

	hood_set_owner("lc_barrio04", "Playas")
end


function barrio_stronghold_equip_busted()
	remove_marker_navpoint("barrio_$n-power-drugequip05")
	delay(.5)

	cutscene_in()
	scripted_cutscene_play("barrio_stronghold_scene02_rooftops", "barrio_stronghold_scene02_rooftops_end")
	cutscene_out()

	delay(1)
	mission_help_table("power_strong_rooftops") -- text "Clean up the surrounding rooftops."
	objective_text("power_strong_roof_remaining", Barrio_stronghold_rooftop_goal - Barrio_stronghold_rooftop_count)

	for i = 1, Barrio_stronghold_rooftop_goal, 1 do
		add_marker_npc("barrio_$c-power-rooftop0"..i, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	end

	Barrio_stronghold_rooftop_attack_recur_handle = thread_new("barrio_stronghold_rooftop_attack_recur")
end


function barrio_stronghold_scene02_rooftops()
	camera_look_through("barrio_$n-roof-jh02")

	modal_begin()

	group_create_preload("barrio_$G-power-rooftops01", "barrio_$G-power-rooftops02")

	npc_unholster_best_weapon("barrio_$c-power-rooftop01")
	npc_unholster_best_weapon("barrio_$c-power-rooftop02")
	npc_unholster_best_weapon("barrio_$c-power-rooftop03")
	npc_unholster_best_weapon("barrio_$c-power-rooftop04")
	npc_unholster_best_weapon("barrio_$c-power-rooftop05")
	npc_unholster_best_weapon("barrio_$c-power-rooftop06")
	npc_unholster_best_weapon("barrio_$c-power-rooftop07")
	npc_unholster_best_weapon("barrio_$c-power-rooftop08")
	npc_unholster_best_weapon("barrio_$c-power-rooftop09")

	thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop05", "barrio_$n-rooftop-05a")
	Barrio_scene02_walk1_thread_done = true
	thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop06", "barrio_$n-rooftop-06a")
	Barrio_scene02_walk2_thread_done = true
	fade_in(.5)

	delay(1)

	--audio_play_persona_line("barrio_$c-power-rooftop05", "taunt - fleeing enemy", 3)
	audio_play_persona_line("barrio_$c-power-rooftop05", "threat - alert (group attack)", 3)	

	delay(2)
	
	thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop07", "barrio_$n-rooftop-07a")
	Barrio_scene02_walk3_thread_done = true
	thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop02", "barrio_$n-rooftop-02a")
	Barrio_scene02_walk4_thread_done = true
	delay(0.1)
	
	camera_look_through("barrio_$cam-rooftop-am03")

	delay(2)

	fade_out(.5)
	fade_out_block()
	modal_end()
end

function barrio_stronghold_scene02_rooftops_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	if (not Barrio_scene02_walk1_thread_done) then
		thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop05", "barrio_$n-rooftop-05a")
	end
	if (not Barrio_scene02_walk2_thread_done) then
		thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop06", "barrio_$n-rooftop-06a")	
	end
	if (not Barrio_scene02_walk3_thread_done) then
		thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop07", "barrio_$n-rooftop-07a")		
	end
	if (not Barrio_scene02_walk4_thread_done) then
		thread_new("barrio_stronghold_move_wrapper", "barrio_$c-power-rooftop02", "barrio_$n-rooftop-02a")		
	end

	--[[
	for i = 1, Barrio_stronghold_rooftop_goal, 1 do
		set_always_sees_player_flag(Barrio_stronghold_rooftop_guys[i], true)
	end
	]]
end


function barrio_stronghold_rooftop_attack_recur()
	while (1) do
		delay(5)

		for i = 1, Barrio_stronghold_rooftop_goal, 1 do
			attack(Barrio_stronghold_rooftop_guys[i])
		end
	end
end


function barrio_stronghold_rooftop_guy_dies(name)
	Barrio_stronghold_rooftop_count = Barrio_stronghold_rooftop_count + 1
	objective_text("power_strong_roof_remaining", Barrio_stronghold_rooftop_goal - Barrio_stronghold_rooftop_count)
	
	remove_marker_npc(name)
	
	--mission_help_table_nag("power_strong_roof_killed") -- text "Rooftop defender killed."
	
	if( Barrio_stronghold_rooftop_count == Barrio_stronghold_rooftop_goal ) then
		delay(2)
		barrio_stronghold_create_reinforcements()
	end
end


function barrio_stronghold_do_stair_trigger()
	--debug_message("stairs trigger")

	trigger_disable("barrio_$t_sh_stairwell")
	trigger_disable("barrio_$t-power-stairwell2")
	group_create("barrio_$G_sh_items")
	group_create("barrio_$G_sh_floor2")
end


-- reinforcements attack
function barrio_stronghold_scene03_reinforcements()

	objective_text_clear()

	modal_begin()

	-- set up boss car
	group_create_preload("barrio_$G_sh_wave2")
	thread_new("barrio_stronghold_scene03_timer")
	Barrio_scene03_helper_thread_done = true

	delay(.25)
	fade_in(.5)
	camera_look_through("barrio_$n-wave2-01-jh")
	delay(.25)

	audio_play_persona_line("barrio_$c-power-wave2-04", "observe - PC (insult)", 3)
	--audio_play_persona_line("barrio_$c-power-wave2-04", "threat - alert (group attack)", 3)

	delay(3)

	camera_look_through("barrio_$n-boss-fence-jh01")
	delay(4.5)
	fade_out(.5)
	fade_out_block()
	modal_end()
end


-- AI actions moved to separate thread, in case player skips cutscene
function barrio_stronghold_scene03_timer()
	character_add_vehicle("barrio_sh_boss", "barrio_$v_sh_bossmobile", 0)
	character_add_vehicle("barrio_sh_bossescort1", "barrio_$v_sh_bossmobile", 1)

	delay(.25)

	attack("barrio_$c-power-wave2-01")
	attack("barrio_$c-power-wave2-02")
	attack("barrio_$c-power-wave2-03")
	
	--delay(2.75)

	attack("barrio_$c-power-wave2-04")
	attack("barrio_$c-power-wave2-05")
	attack("barrio_$c-power-wave2-06")

	--delay(2.25)
	delay(1)

	vehicle_pathfind_to("barrio_$v_sh_bossmobile", "barrio_$n-power-boss-01", true, true)
	delay(.1)
	thread_new("barrio_stronghold_boss_exit", "barrio_sh_boss")
	thread_new("barrio_stronghold_boss_exit", "barrio_sh_bossescort1")
end


function barrio_stronghold_boss_exit(npc)
	vehicle_exit(npc)
	attack(npc)
end



-- reinforcements attack end
function barrio_stronghold_scene03_reinforcements_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	if (not Barrio_scene03_helper_thread_done) then
		thread_new("barrio_stronghold_scene03_timer")
	end
end


function barrio_stronghold_create_reinforcements()
	delay(1)

	cutscene_in()
	scripted_cutscene_play("barrio_stronghold_scene03_reinforcements", "barrio_stronghold_scene03_reinforcements_end")
	cutscene_out()

	delay(1)

	mission_help_table("power_strong_boss")
	add_marker_npc( "barrio_sh_boss", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
end


function barrio_stronghold_boss_drive()
	vehicle_pathfind_to("barrio_$v_sh_bossmobile", "barrio_$n-power-boss-01", true, true)
	vehicle_exit("barrio_sh_boss")
	vehicle_exit("barrio_sh_bossescort1")
end


function barrio_stronghold_boss_killed()
	remove_marker_npc("barrio_sh_boss")
	delay(5)
	stronghold_takeover_success()
end

function barrio_stronghold_move_wrapper(name, navpoint)
	move_to(name, navpoint, 2)
	delay(.25)
	npc_leash_to_nav(name, navpoint, 2)
	delay(3)
	set_always_sees_player_flag(name, true)
end



--[[
"barrio_$n-power-intro-jh01"
"barrio_$n-power-roof-jh01"
"barrio_$n-roof-jh02"
"barrio_$n-wave2-01-jh"
"barrio_$n-boss-fence-jh01"
]]