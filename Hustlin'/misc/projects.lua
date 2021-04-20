-- projects.lua
-- SR district script
-- 9/25/05

--[[
TODO/FIXMES/NOTES
3) TRIGGER PASS
		- triggers enabled/disabled as necessary (start w/disable flag, enabled when sh starts, disabled after triggered and when sh ends)
		- # activations set correctly (0)

		- loft use
		- loft int
4) MAKE INIT TRIG BIG
6) ADD TRIGGER EFFECT (?)
10) SCRIPT FENCE-BREAKING CAR ATTACKERS


1) UPDATE NAVMESH IN BASEBALL DIAMOND -- fix fence also
2) ADD COVER TO DIAMOND
8) NAVMESH FOR WINDOW SILL AND FIRE ESCAPE
11) ADD KICKABLE DOOR TO LOFT
12) WIDEN FIRE ESCAPE
13) STRONGHOLD CODE -- MAKE IT SO THAT SOME SH'S CAN HAVE NO EXIT TRIGGER (e.g. downtown parking)
14) FORCE PLAYER TO DO OUTDOOR COMBAT BY REQUIRING HE KILL THEM?
15) DESTROY/REL TO WORLD UPON RESET, WIN, FAIL


X	7) MAKE GUYS INDOOR DEAF AND/OR MAKE CREATE TRIGGER SMALLER AND/OR ADD LEASHES
X	5) ADD MINIMAP/IN-GAME ICONS
X	9) HELP TEXT


use new set_always_sees_player_flag() script command to make guys not timeout if player retreats to apt

thu 3/9/06 loft possible tweaks:
X	- remove rush dudes?
X	- fix guys standing around not shooting; timeout prob?
X	- make _all_ guys that spawn required, so you don't have some required and some not (feels weird)?
X	- spread out initial targets more and/or use fewer
X	- add leashes!
X	- remove sniper dude on fire escape and add sniper item drop
X	- bigger arrow effects for guys?
X	- make snipers run out, spread out more in script?
X	- fix guy at bottom of stairs

- MAYBE make rush guys required?
- make initial initial guys rush player if he doesn't kill them initially?
- remove some RL guys?


level
- add more cover
- orient oil drums so cover lines up well
P	- FIX GUYS running into breakable fences (should be special navmesh splines - pink lines) 112759
P	- remove railing
P	- add kickable door to apt
]]


projects_stronghold_leader_dead = 0
projects_homies_rescued = 0

projects_sh_loft_handle_w1_recur = 0
projects_sh_loft_handle_w2a_recur = 0
projects_sh_loft_handle_w2b_recur = 0

Projects_loft_targets_camp = {"projects_$c-loft-01", "projects_$c-loft-03", "projects_$c-loft-06", "projects_$c-loft-13", "projects_$c-loft-95",
										"projects_$c-loft-97", "projects_$c-loft-98", "projects_$c-loft-99"}

Projects_loft_targets_snipe = {"projects_$c-loft-07", "projects_$c-loft-08", "projects_$c-loft-18",
										"projects_$c-loft-14", "projects_$c-loft-15", "projects_$c-loft-19",
										"projects_$c-loft-09", "projects_$c-loft-10", "projects_$c-loft-17"}

Projects_loft_num_targets_camp = sizeof_table(Projects_loft_targets_camp)
Projects_loft_num_targets_snipe = sizeof_table(Projects_loft_targets_snipe)
Projects_loft_required_kills_total = Projects_loft_num_targets_camp + Projects_loft_num_targets_snipe
Projects_loft_required_kills_current = 0

Projects_loft_handle_walk1 = 0
Projects_loft_handle_walk2 = 0
Projects_loft_handle_walk3 = 0
Projects_loft_handle_walk4 = 0

Projects_loft_handle_drink_anim = 0

Projects_police_phone_handle = 0
Projects_loft_phone_handle = 0

Projects_police_attackers_dead_flag = false
Projects_police_recruited_homie_flag = false

Projects_police_intro_helper_done = false

Projects_loft_wave1_thread_started = false

Projectspolice_attack1_homie_handle = 0
Projectspolice_attack2_homie_handle = 0

function projects_init()

	-- loft stronghold setup --
	on_stronghold_takeover_start("projects_sh_loft_start", "projects_sh_loft")
	on_stronghold_reset("projects_sh_loft_reset", "projects_sh_loft")
	on_stronghold_takeover_success("projects_sh_loft_success", "projects_sh_loft")
--	on_stronghold_check_enable("projects_sh_loft_unlock", "projects_sh_loft")
	stronghold_set_cost( "projects_sh_loft",  PROJECTS_SH_LOFT_REQUIRED_PROPS)

	-- police stronghold setup --
	on_stronghold_takeover_start("projects_police_start", "projects_police")
	on_stronghold_takeover_success( "projects_police_success", "projects_police" )
	on_stronghold_reset( "projects_police_reset", "projects_police" )
--	on_stronghold_check_enable( "projects_police_unlock", "projects_police" )
	stronghold_set_cost( "projects_police",  PROJECTS_SH_POLICE_REQUIRED_PROPS)

	--debug_projects()
end


function projects_main()
	if (is_mission_complete("projects_sh_loft")) then
		door_lock("projects_MeshMover040", false)			-- loft outer door
		door_lock("projects_loft_MeshMoverA040", false)	-- loft inner door
	else
		door_lock("projects_MeshMover040", true)			-- loft outer door
		door_lock("projects_loft_MeshMoverA040", true)	-- loft inner door
	end

	if (is_mission_complete("projects_police")) then
		door_lock("projects_jail_MeshMover020", false)
		door_lock("projects_jail_MeshMover010", false)
		door_lock("projects_jaildr_MeshMover010", false)
	else
		door_lock("projects_jail_MeshMover020", true)
		door_lock("projects_jail_MeshMover010", true)
		door_lock("projects_jaildr_MeshMover010", true)
	end

	--message("test projects") -- test
end


-- debug function - call from the console with 'lua' command
function warp_projects()
	message("warping...")
	delay(0)
	tplayer_teleport(  "projects_$nav-warp")
end

function debug_projects()
	--teleport("#PLAYER#", "projects_$n-loft-warp1")
	teleport("#PLAYER#", "projects_$n-loft-warp2")
	stronghold_enable("projects_sh_loft")
	--inv_item_add("sniper_rifle")

	--teleport("#PLAYER#", "projects_police_primary")
	stronghold_enable("projects_police")
end


--------------------------------------------
-- ABANDONED POLICE STRONGHOLD -------------
--------------------------------------------

pabs_boss_loaded = false;
failure_thread = -1

--[[
-- 2006/02/28 STL: This function isn't being called anymore.
function projects_police_unlock()
	if ( is_mission_complete("vk04a") ) then
		door_lock( "projects_jail_MeshMover010", true )
		door_lock( "projects_jail_MeshMover020", true )

		stronghold_enable("projects_police")
		debug_message("projects police stronghold unlocked!")
	end
end
]]


function projects_police_intro_cutscene()
	load_chunks("sr_chunk08_vk4a", "sr_chunk08")	-- needs to be inside cutscene

	teleport("#PLAYER#", "projects_police_primary")

	team_despawn("Vice Lords", true)

	modal_begin() -- needs to be inside cutscene to make skippable

	group_create_preload("projects_police_rescue", "projects_police_sh_primary")
	thread_new("projects_police_intro_helper")
	Projects_police_intro_helper_done = true
	thread_new("projects_police_phonecall")

	delay(2)

	-- shot 1
	camera_look_through("projects_$cam-jh-police-intro01")
	fade_in(1)
	delay(3)
	fade_out(.5)
	delay(.6)

	-- shot 2
	camera_look_through("projects_$n-police-beatcam01")
	attack( "projects_police_homie_attack1", "projects_police_homie_rescue" )
	attack( "projects_police_homie_attack2", "projects_police_homie_rescue" )
	delay(.25)
	fade_in(.5)
	delay(3.5)

	fade_out(.75)
	fade_out_block()

	modal_end()
end


function projects_police_intro_helper()
	turn_invulnerable( "projects_police_homie_rescue" )
	--npc_ragdoll( "projects_police_homie_rescue", -1 )	-- enter ragdoll
end


function projects_police_cutscene_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	if (not Projects_police_intro_helper_done) then
		turn_invulnerable( "projects_police_homie_rescue" )
	end

	--group_create( "projects_police_sh_primary", true ) -- CHANGED TO PRELOAD, MOVED TO MAIN CUTSCENE
	group_destroy("projects_police_rescue")
	door_close( "projects_jail_MeshMover010" )
	door_close( "projects_jail_MeshMover020" )
end


function projects_police_start()
	cutscene_in()
	scripted_cutscene_play("projects_police_intro_cutscene", "projects_police_cutscene_end")
	cutscene_out()

	door_lock( "projects_jail_MeshMover010", false ) -- front doors
	door_lock( "projects_jail_MeshMover020", false ) -- front doors
	door_lock( "projects_jaildr_MeshMover010", false ) -- jail cell door
	door_close("projects_jail_MeshMover010")
	door_close("projects_jail_MeshMover020")
	door_close("projects_jaildr_MeshMover010")

	set_mission_author( "Russell Aasland" )
	mission_help_table("projects_police_rescue") -- text "Kill the VK interrogators before they kill your homie!"

	trigger_enable( "projects_police_rescue_load" )
	trigger_disable( "projects_police_boss_load" )
	trigger_enable("projects_$t-police-recruit-on")
	on_trigger( "projects_police_rescue_setup", "projects_police_rescue_load" )
	on_trigger( "projects_police_boss_setup", "projects_police_boss_load" )
	on_trigger("projects_police_recruit_enable", "projects_$t-police-recruit-on")
	
	on_recruit( "projects_police_rescue_recruit", "projects_police_homie_rescue" )
	on_dismiss( "projects_police_rescue_dismiss", "projects_police_homie_rescue" )
	on_death( "projects_police_rescue_death", "projects_police_homie_rescue" )
	on_death( "projects_police_boss_death", "projects_police_leader" )
	on_door_opened( "projects_police_door_open", "projects_jail_MeshMover010" )
	on_door_opened( "projects_police_door_open", "projects_jail_MeshMover020" )
	on_door_opened("projects_police_cell_open", "projects_jaildr_MeshMover010")

	on_death("projects_police_attacker_dead", "projects_police_homie_attack1")
	on_death("projects_police_attacker_dead", "projects_police_homie_attack2")

	minimap_icon_add_navpoint("projects_police_homie_attack1", MINIMAP_ICON_KILL)
	minimap_icon_add_navpoint("projects_police_homie_attack2", MINIMAP_ICON_KILL)


	pabs_boss_loaded = false
	notoriety_set_max( "vice_kings", 3 )

	failure_thread = thread_new( "projects_police_homie_count_down" )
end


function projects_police_attacker_dead(npc)
	remove_marker_npc(npc)

	if ( is_dead("projects_police_homie_attack1") ) then
		if ( is_dead("projects_police_homie_attack2") ) then
			-- both dead
			if (not Projects_police_attackers_dead_flag) then
				Projects_police_attackers_dead_flag = true
				debug_message("both guys dead if-then")
				set_unrecruitable_flag("projects_police_homie_rescue", false)
				mission_help_table("projects_police_recruit") -- text "Recruit your homie"
				--AM 5/30/06:  removed leash; no longer needed
				--npc_leash_remove("projects_police_homie_rescue")
				add_marker_npc("projects_police_homie_rescue", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
				turn_vulnerable( "projects_police_homie_rescue" )
				--add_marker_npc("projects_$c-police-homie2", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
				thread_kill(failure_thread)
				hud_bar_disable_sound()
				--npc_ragdoll( "projects_police_homie_rescue", 0 )	-- exit ragdoll
				trigger_enable( "projects_police_boss_load" )
			end
		else
			debug_message("attack2 attacks")
			thread_kill(Projectspolice_attack2_homie_handle)
			attack("projects_police_homie_attack2")
			thread_kill(failure_thread)
			hud_bar_disable_sound()
		end
	else
		if ( is_dead("projects_police_homie_attack2") ) then
			debug_message("attack1 attacks")
			thread_kill(Projectspolice_attack1_homie_handle)
			attack("projects_police_homie_attack1")
			thread_kill(failure_thread)
			hud_bar_disable_sound()
		end
	end
end

function projects_police_cell_open()
	debug_message("cell opened!")

	combat_enable("projects_$c-police-homie2")
	hearing_enable("projects_$c-police-homie2")
	set_unrecruitable_flag("projects_$c-police-homie2", false)
end

function projects_police_recruit_enable()
	trigger_disable("projects_$t-police-recruit-on")
	debug_message("RECRUIT ENABLE TRIGGER")
	--set_unrecruitable_flag("projects_police_homie_rescue", false)
	hearing_enable("projects_police_homie_attack1")
	hearing_enable("projects_police_homie_attack2")
	turn_vulnerable("projects_police_homie_attack1")
	turn_vulnerable("projects_police_homie_attack2")
end

function projects_police_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Projects_police_phone_handle = audio_play("JULIUS_STRONGHOLD_2", "voice", false, false)
end


function projects_police_reset()
	on_trigger( "", "projects_police_rescue_load" )
	on_trigger( "", "projects_police_boss_load" )
	on_trigger("", "projects_$t-police-recruit-on")
	on_recruit( "", "projects_police_homie_rescue" )
	on_dismiss( "", "projects_police_homie_rescue" )
	on_death( "", "projects_police_homie_rescue" )
	on_death( "", "projects_police_leader" )
	on_death("", "projects_police_homie_attack1")
	on_death("", "projects_police_homie_attack2")

	trigger_disable( "projects_police_rescue_load" )
	trigger_disable( "projects_police_boss_load" )
	trigger_disable("projects_$t-police-recruit-on")
	
	on_door_opened( "", "projects_jail_MeshMover010" )
	on_door_opened( "", "projects_jail_MeshMover020" )
	on_door_opened( "", "projects_jaildr_MeshMover010" )

	if (is_mission_complete("projects_police")) then
		door_lock("projects_jail_MeshMover020", false)
		door_lock("projects_jail_MeshMover010", false)
		door_lock("projects_jaildr_MeshMover010", false)
	else
		door_lock("projects_jail_MeshMover020", true)
		door_lock("projects_jail_MeshMover010", true)
		door_lock("projects_jaildr_MeshMover010", true)
	end

	objective_text_clear()
	
	--notoriety_set_max( "vice_kings", 5 )
	notoriety_reset("vice_kings")
	
	minimap_icon_remove_navpoint( "projects_police_homie_rescue" )
	minimap_icon_remove_navpoint( "projects_police_leader" )
	minimap_icon_remove_navpoint("projects_police_homie_attack1")
	minimap_icon_remove_navpoint("projects_police_homie_attack2")
	
	remove_marker_npc( "projects_police_homie_rescue" )
	remove_marker_npc( "projects_police_leader" )

	party_dismiss( "projects_police_homie_rescue" )
	
	thread_kill( failure_thread )
	failure_thread = -1
	
	hud_bar_off( )

	release_to_world("projects_police_sh_primary")
	release_to_world("projects_police_boss")
	group_destroy("projects_police_rescue")
	release_to_world("projects_police_library_group")
	release_to_world("projects_police_conf_group")
	release_to_world("projects_police_office_group")
	release_to_world("projects_police_lower_group")
	release_to_world("projects_police_cells")
	release_to_world("projects_police_upper_group")
	release_to_world("projects_police_upoff_group")

	audio_stop(Projects_police_phone_handle)

	Projects_police_attackers_dead_flag = false
	Projects_police_recruited_homie_flag = false
	Projects_police_intro_helper_done = false

	thread_kill(Projectspolice_attack1_homie_handle)
	thread_kill(Projectspolice_attack2_homie_handle)
end

function projects_police_success()
	group_destroy("projects_police_sh_primary")
	group_destroy("projects_police_boss")
	group_destroy("projects_police_rescue")
	group_destroy("projects_police_library_group")
	group_destroy("projects_police_conf_group")
	group_destroy("projects_police_office_group")
	group_destroy("projects_police_lower_group")
	group_destroy("projects_police_cells")
	group_destroy("projects_police_upper_group")
	group_destroy("projects_police_upoff_group")

	hood_set_owner( "vk_projects02", "Playas" )

	trigger_enable("projects_$t-police-save")
end

function projects_police_door_open()
	--if (not stronghold_is_active( "projects_police" ) ) then
	--	stronghold_takeover_force_start( "projects_police" )
	--end

	on_door_opened( "", "projects_jail_MeshMover010" )
	on_door_opened( "", "projects_jail_MeshMover020" )

	-- AM: commenting out loop; deleted some of these characters
	--[[
	for x=1,7,1 do
		local dude_name = "projects_police_entry"..x
	
		set_ignore_ai_flag( dude_name, false )
		attack( dude_name )
	end
	]]

	set_ignore_ai_flag("projects_police_entry1", false)
	set_ignore_ai_flag("projects_police_entry2", false)
	set_ignore_ai_flag("projects_police_entry3", false)
	set_ignore_ai_flag("projects_police_entry5", false)
	set_ignore_ai_flag("projects_police_entry7", false)
	--attack()
end

function projects_police_homie_count_down()
	local TOTAL_TIME = 2 * 60
	local current_time = TOTAL_TIME
	
	--hud_bar_on( 0, TOTAL_TIME )

	--hud_bar_on("Health")
	hud_bar_on("Health", "projects_police_homie_health", 120)
	hud_bar_set_range(0, 120)
	hud_bar_set_value(current_time)

	
	while ( current_time > 0 ) do
		current_time = current_time - delay_do()
		
		hud_bar_set_value( current_time )
	
		thread_yield()
	end

	stronghold_takeover_failure("projects_police_die") -- text "You let your homie die!"
end

function projects_police_rescue_setup()
	trigger_disable("projects_police_rescue_load")

	debug_message("RESCUE SETUP")

	group_create("projects_police_rescue", true)

	-- FIXME
	set_unrecruitable_flag("projects_police_homie_rescue", true)
	set_unrecruitable_flag("projects_$c-police-homie2", true)

	turn_invulnerable( "projects_police_homie_rescue" )
	turn_invulnerable( "projects_police_homie_attack1" )
	turn_invulnerable( "projects_police_homie_attack2" )
	--npc_ragdoll( "projects_police_homie_rescue", -1 )	-- enter ragdoll
	Projectspolice_attack1_homie_handle = thread_new("attack", "projects_police_homie_attack1", "projects_police_homie_rescue" )
	Projectspolice_attack2_homie_handle = thread_new("attack", "projects_police_homie_attack2", "projects_police_homie_rescue" )

	minimap_icon_remove_navpoint("projects_police_homie_attack1")
	minimap_icon_remove_navpoint("projects_police_homie_attack2")
	add_marker_npc("projects_police_homie_attack1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_police_homie_attack2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
end

function projects_police_boss_setup()
	trigger_disable( "projects_police_boss_load" )
	group_create( "projects_police_boss", true )
	pabs_boss_loaded = true
	
	if ( is_in_party("projects_police_homie_rescue") ) then
		minimap_icon_remove_navpoint( "projects_police_leader" )
		add_marker_npc( "projects_police_leader", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	end
end

function projects_police_rescue_recruit()
	if (not pabs_boss_loaded) then
		--trigger_enable( "projects_police_boss_load" ) -- AM: moved to on_death() for attackers
		minimap_icon_add_navpoint( "projects_police_leader", MINIMAP_ICON_KILL )
	else
		add_marker_npc( "projects_police_leader", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	end

	if (not Projects_police_recruited_homie_flag) then
		Projects_police_recruited_homie_flag = true
		thread_kill( failure_thread )
		failure_thread = -1
		hud_bar_off( )
	end

	--objective_text( "projects_police_kill" )
	mission_help_table("projects_police_kill")
	remove_marker_npc( "projects_police_homie_rescue" )
end

function projects_police_rescue_dismiss()
	--AM 6/15/06: trigger must be permanently enabled after killing homie attackers
	--trigger_disable( "projects_police_boss_load" )

	--objective_text( "projects_police_recruit" )
	mission_help_table( "projects_police_recruit" )
	add_marker_npc( "projects_police_homie_rescue", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE )
	
	minimap_icon_remove_navpoint( "projects_police_leader" )
	remove_marker_npc( "projects_police_leader" )
end

function projects_police_rescue_death()
	stronghold_takeover_failure("projects_police_die") -- text "You let your homie die!"
end

function projects_police_boss_death(npc)
	remove_marker_npc(npc)
	delay(5)
	stronghold_takeover_success( )
end


---------------------------------------------------------------------
-- PROJECTS xLOFT STRONGHOLD ----------------------------------------
---------------------------------------------------------------------


--fixme "projects_$c-loft-int03" standing in corner


function projects_sh_loft_reset()

	-- FIXME - ADD TRIGGER DISABLES TO SCRIPT INIT?
	trigger_disable("projects_$t-loft-defend")
	trigger_disable("projects_$t-loft-stairs")
	trigger_disable("projects_$t-loft-door")
	trigger_disable("projects_$t-loft-int")

	on_trigger("", "projects_$t-loft-defend")		-- unregister functions
	on_trigger("", "projects_$t-loft-stairs")
	on_trigger("", "projects_$t-loft-door")
	on_trigger("", "projects_$t-loft-int")
	on_door_opened("", "projects_loft_MeshMoverA040")

	thread_kill(projects_sh_loft_handle_w1_recur)
	thread_kill(projects_sh_loft_handle_w2a_recur)
	thread_kill(projects_sh_loft_handle_w2b_recur)

	remove_marker_trigger("projects_$t-loft-door")
	remove_marker_trigger("projects_$t-loft-defend")
	for i = 1, Projects_loft_num_targets_camp, 1 do
		remove_marker_npc(Projects_loft_targets_camp[i])
	end
	for i = 1, Projects_loft_num_targets_snipe, 1 do
		remove_marker_npc(Projects_loft_targets_snipe[i])
	end
	remove_marker_vehicle("projects_$v-loft-01")
	remove_marker_vehicle("projects_$v-loft-02")
	remove_marker_vehicle("projects_$v-loft-03")

	release_to_world("projects_$G-loft-wave1")
	release_to_world("projects_$G-loft-wave2")
	release_to_world("projects_$G-loft-snipers")
	release_to_world("projects_$G-loft-start1")
	release_to_world("projects_$G-loft-int1")
	group_destroy("projects_$G-loft-sniper")

	objective_text_clear()
	hud_timer_stop()

	Projects_loft_required_kills_total = Projects_loft_num_targets_camp + Projects_loft_num_targets_snipe

	Projects_loft_required_kills_current = 0

	if (is_mission_complete("projects_sh_loft")) then
		door_lock("projects_MeshMover040", false)			-- loft outer door
		door_lock("projects_loft_MeshMoverA040", false)	-- loft inner door
	else
		door_lock("projects_MeshMover040", true)			-- loft outer door
		door_lock("projects_loft_MeshMoverA040", true)	-- loft inner door
	end

	audio_stop(Projects_loft_phone_handle)

	Projects_loft_wave1_thread_started = false

	notoriety_reset("vice_kings")
end


function projects_sh_loft_start()
	cutscene_in()
	scripted_cutscene_play("projects_sh_loft_intro_cutscene", "projects_sh_loft_cutscene_end")
	cutscene_out()

	mission_help_table("vkloft_start") --  text "Fight your way to the loft!"
	add_marker_trigger("projects_$t-loft-door", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)

	set_mission_author("alvanM")

	on_trigger("projects_sh_loft_defend", "projects_$t-loft-defend")
	on_trigger("projects_sh_loft_stairs", "projects_$t-loft-stairs")
	on_trigger("projects_sh_loft_door", "projects_$t-loft-door")
	on_trigger("projects_sh_loft_create_int", "projects_$t-loft-int")
	trigger_enable("projects_$t-loft-defend")
	trigger_enable("projects_$t-loft-stairs")
	trigger_enable("projects_$t-loft-door")
	trigger_enable("projects_$t-loft-int")
	on_door_opened("projects_sh_loft_open_door", "projects_loft_MeshMoverA040")
	door_close("projects_loft_MeshMoverA040")
	door_lock("projects_loft_MeshMoverA040", false)	-- loft inner door

	door_close("projects_MeshMover040")
	door_lock("projects_MeshMover040", false)	-- loft outer door

	notoriety_set_min("vice_kings", 1)
	notoriety_set_max("vice_kings", 1)

	-- set up required kills
	for i = 1, Projects_loft_num_targets_camp, 1 do
		on_death("projects_sh_loft_target_killed", Projects_loft_targets_camp[i])
	end
	for i = 1, Projects_loft_num_targets_snipe, 1 do
		on_death("projects_sh_loft_target_killed", Projects_loft_targets_snipe[i])
	end
end

function projects_sh_loft_open_door()
	debug_message("loft door opened")
	set_ignore_ai_flag("projects_$c-loft-int04", false)
	attack("projects_$c-loft-int04")
end

function projects_sh_loft_create_int()
	trigger_disable("projects_$t-loft-int")

	debug_message("create int guys")

	group_create("projects_$G-loft-sniper")
	group_create("projects_$G-loft-int1", true)

	--set_ignore_ai_flag("projects_$c-loft-int03", false)
	set_ignore_ai_flag("projects_$c-loft-int04", false)
	set_ignore_ai_flag("projects_$c-loft-int05", false)
	set_ignore_ai_flag("projects_$c-loft-int06", false)
	set_ignore_ai_flag("projects_$c-loft-int07", false)
end

--[[
]]

function projects_sh_loft_intro_cutscene()
	teleport("#PLAYER#", "projects_$t-loft-use")

	camera_look_through("projects_$cam-jh-loft-intro01")

	team_despawn("Vice Lords", true)

	modal_begin()
	group_create_preload("projects_$G-loft-start1")
	thread_new("projects_sh_loft_intro_helper")
	thread_new("projects_sh_loft_phonecall")

	delay(2)
	
	fade_in(1)

	Projects_loft_handle_drink_anim = thread_new("play_action", "projects_$c-loft-start10", "drink action")

	delay(5.25)

	camera_look_through("projects_$cam-loft-intro02-am")
	delay(3.75)

	fade_out(.75)
	fade_out_block()

	modal_end()
end

function projects_sh_loft_intro_helper()
	npc_unholster_best_weapon("projects_$c-intro-99")
	set_animation_state("projects_$c-loft-start10", "forty drinking")
end

function projects_sh_loft_cutscene_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	thread_kill(Projects_loft_handle_drink_anim)
end


function projects_sh_loft_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Projects_loft_phone_handle = audio_play("JULIUS_STRONGHOLD_3", "voice", false, false)
end


function projects_sh_loft_door()
	trigger_disable("projects_$t-loft-door")

	mission_help_table("vkloft_escape") --  text "Get to the fire escape"

	remove_marker_trigger("projects_$t-loft-door")
	add_marker_trigger("projects_$t-loft-defend", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end


function projects_sh_loft_stairs()
	trigger_disable("projects_$t-loft-stairs")

	debug_message("ignore off")

	--set_ignore_ai_flag("projects_$c-loft-int03", false)
	--set_ignore_ai_flag("projects_$c-loft-int04", false)
	--set_ignore_ai_flag("projects_$c-loft-int05", false)
	--set_ignore_ai_flag("projects_$c-loft-int06", false)
	--set_ignore_ai_flag("projects_$c-loft-int07", false)
end


function projects_sh_loft_scene02_defend()
	--load_chunks("sr_chunk07", "sr_chunk07b")	-- new chunk, current chunk

	camera_look_through("projects_$cam-loft-close1") -- want high shot to show lots of guys
	--camera_look_through("projects_$cam-jh-loft-reinf01")
	
	modal_begin()

	group_create_preload("projects_$G-loft-wave1")
	thread_new("projects_sh_loft_start_wave1")
	Projects_loft_wave1_thread_started = true

	fade_in(1)
	delay(4)

	fade_out(.75)
	fade_out_block()

	modal_end()
end


function projects_sh_loft_scene02_defend_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	if (not Projects_loft_wave1_thread_started) then
		projects_sh_loft_start_wave1()	-- not threading here since rest of function assumes everything in wave1() has completed already
	end

	thread_kill(Projects_loft_handle_walk1)
	thread_kill(Projects_loft_handle_walk2)
	thread_kill(Projects_loft_handle_walk3)
	thread_kill(Projects_loft_handle_walk4)

	combat_enable("projects_$c-loft-03")
	combat_enable("projects_$c-loft-06")
	combat_enable("projects_$c-loft-13")
	combat_enable("projects_$c-loft-95")
	
	attack("projects_$c-loft-03")	--	required camper
	attack("projects_$c-loft-06")	-- required camper
	attack("projects_$c-loft-13")	-- required camper
	attack("projects_$c-loft-95")	-- required camper
end


function projects_sh_loft_move_wrapper(npc, nav)
	move_to(npc, nav, 2)
end


function projects_sh_loft_defend()
	trigger_disable("projects_$t-loft-defend")
	remove_marker_trigger("projects_$t-loft-defend")

	cutscene_in()
	scripted_cutscene_play("projects_sh_loft_scene02_defend", "projects_sh_loft_scene02_defend_end")
	cutscene_out()

	delay(.5)
	mission_help_table("vkloft_leaders") -- "Kill the VK leaders."
	objective_text("vkloft_remain", Projects_loft_required_kills_total - Projects_loft_required_kills_current)

	projects_sh_loft_handle_w1_recur = thread_new("projects_sh_loft_wave1_recur")	-- so NPCs will not timeout and continue attacking

	for i = 1, Projects_loft_num_targets_camp, 1 do
		add_marker_npc(Projects_loft_targets_camp[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		--add_marker_npc(Projects_loft_targets_camp[i], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	end

	--set_perfect_aim("projects_$c-loft-06", true) -- too much fire, toning down
	set_perfect_aim("projects_$c-loft-97", true)
	set_perfect_aim("projects_$c-loft-03", true)

	-- delay until first wave is killed
	while (Projects_loft_required_kills_current < Projects_loft_num_targets_camp) do
		delay(.5)
	end

	projects_sh_loft_start_wave2()
end


function projects_sh_loft_target_killed(npc)
	Projects_loft_required_kills_current = Projects_loft_required_kills_current + 1
	debug_message("target killed!") -- fixme text
	objective_text("vkloft_remain", Projects_loft_required_kills_total - Projects_loft_required_kills_current)
	remove_marker_npc(npc)

	if (Projects_loft_required_kills_current == Projects_loft_required_kills_total) then
		delay(5)
		stronghold_takeover_success()
	end
end

--xy
--xwave1
function projects_sh_loft_start_wave1()
	--debug_message("wave1 start")

	--group_create("projects_$G-loft-wave1", true)

	combat_disable("projects_$c-loft-03")
	combat_disable("projects_$c-loft-06")
	combat_disable("projects_$c-loft-13")
	combat_disable("projects_$c-loft-95")

	set_always_sees_player_flag("projects_$c-loft-01", true)
	set_always_sees_player_flag("projects_$c-loft-03", true)
	set_always_sees_player_flag("projects_$c-loft-06", true)
	set_always_sees_player_flag("projects_$c-loft-13", true)
	set_always_sees_player_flag("projects_$c-loft-95", true)
	set_always_sees_player_flag("projects_$c-loft-97", true)
	set_always_sees_player_flag("projects_$c-loft-98", true)
	set_always_sees_player_flag("projects_$c-loft-99", true)

	attack("projects_$c-loft-01")	--	required camper
	-- THESE GUYS FOLLOW MOVE_TO INSTEAD (FOR CUTSCENE)
	--attack("projects_$c-loft-03")	--	required camper
	--attack("projects_$c-loft-06")	-- required camper
	--attack("projects_$c-loft-13")	-- required camper
	--attack("projects_$c-loft-95")	-- required camper
	attack("projects_$c-loft-97")	-- required camper
	attack("projects_$c-loft-98")	-- required camper
	attack("projects_$c-loft-99")	-- required camper

	Projects_loft_handle_walk1 = thread_new("projects_sh_loft_move_wrapper", "projects_$c-loft-95", "projects_$n-loft-95a")
	Projects_loft_handle_walk2 = thread_new("projects_sh_loft_move_wrapper", "projects_$c-loft-13", "projects_$n-loft-17a")
	Projects_loft_handle_walk3 = thread_new("projects_sh_loft_move_wrapper", "projects_$c-loft-06", "projects_$n-loft-06a")
	Projects_loft_handle_walk4 = thread_new("projects_sh_loft_move_wrapper", "projects_$c-loft-03", "projects_$n-loft-03a")
end


-- so NPCs will chase player if he hides in apt
function projects_sh_loft_wave1_recur()
	while (1) do
		delay(15)

		attack("projects_$c-loft-01")	--	required camper
		attack("projects_$c-loft-03")	--	required camper
		attack("projects_$c-loft-06")	-- required camper
		attack("projects_$c-loft-13")	-- required camper
		attack("projects_$c-loft-97")	-- required camper
		attack("projects_$c-loft-98")	-- required camper
		attack("projects_$c-loft-99")	-- required camper
	end
end


--xwave2
function projects_sh_loft_start_wave2()
	group_create("projects_$G-loft-wave2", true)

	set_perfect_aim("projects_$c-loft-18", true)
	set_perfect_aim("projects_$c-loft-14", true)

	--debug_message("wave2 start -- watch out for the snipers!") -- fixme text

	combat_disable("projects_$c-loft-08")
	combat_disable("projects_$c-loft-18")
	combat_disable("projects_$c-loft-10")
	combat_disable("projects_$c-loft-17")
	combat_disable("projects_$c-loft-15")
	combat_disable("projects_$c-loft-19")

	thread_new("projects_sh_loft_wave2_car1")			-- forward left

	while (Projects_loft_required_kills_current <= Projects_loft_num_targets_camp) do
		delay(.5)
	end
	thread_new("projects_sh_loft_wave2_car3")			-- back right corner

	while (Projects_loft_required_kills_current <= Projects_loft_num_targets_camp + 2) do
		delay(.5)
	end
	thread_new("projects_sh_loft_wave2_car2")			-- forward right

	--projects_sh_loft_handle_w2a_recur = thread_new("projects_sh_loft_wave2a_recur")	-- so NPCs will not timeout and continue attacking

	--for i = 1, Projects_loft_num_targets_snipe, 1 do
		--add_marker_npc(Projects_loft_targets_snipe[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		--add_marker_npc(Projects_loft_targets_camp[i], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	--end

	--thread_new("projects_sh_loft_wave2_car2")			-- forward right




	-- FIXME FIXME FIXME -- COMMENTING OOT FOR NOW
	--delay(30)

	--thread_new("projects_sh_loft_start_snipers")
	--thread_new("projects_sh_loft_wave2_car4")			-- near left

	--projects_sh_loft_handle_w2b_recur = thread_new("projects_sh_loft_wave2b_recur")	-- so NPCs will chase player if he hides in apt
end


-- so NPCs will not timeout and continue attacking
function projects_sh_loft_wave2a_recur()
	while (1) do
		delay(20)

		attack("projects_$c-loft-08")	-- car 1
		attack("projects_$c-loft-07")
		attack("projects_$c-loft-18")

		attack("projects_$c-loft-15")	-- car 3
		attack("projects_$c-loft-14")
		attack("projects_$c-loft-19")
	end
end


function projects_sh_loft_wave2_car1()
	character_add_vehicle("projects_$c-loft-07", "projects_$v-loft-01", 0) -- no worky?  stands there and doesn't attack
	character_add_vehicle("projects_$c-loft-08", "projects_$v-loft-01", 1)
	character_add_vehicle("projects_$c-loft-18", "projects_$v-loft-01", 2)

	add_marker_vehicle("projects_$v-loft-01", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	vehicle_pathfind_to("projects_$v-loft-01", "projects_$n-loft-v1-b", true, true)
	debug_message("watch out for the snipers!") -- fixme text
	delay(1)
	remove_marker_vehicle("projects_$v-loft-01")
	add_marker_npc("projects_$c-loft-07", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_$c-loft-08", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_$c-loft-18", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

	thread_new("projects_sh_loft_exit_car", "projects_$c-loft-07")
	thread_new("projects_sh_loft_exit_car_run", "projects_$c-loft-08", "projects_$n-loft-08a")
	thread_new("projects_sh_loft_exit_car_run", "projects_$c-loft-18", "projects_$n-loft-18a")
end


function projects_sh_loft_wave2_car2()
	character_add_vehicle("projects_$c-loft-09", "projects_$v-loft-02", 0)
	character_add_vehicle("projects_$c-loft-10", "projects_$v-loft-02", 1)
	character_add_vehicle("projects_$c-loft-17", "projects_$v-loft-02", 2)

	add_marker_vehicle("projects_$v-loft-02", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	vehicle_pathfind_to("projects_$v-loft-02", "projects_$n-loft-v3-b", "projects_$n-loft-v3-c", "projects_$n-loft-v3-d", true, true)
	--debug_message("watch out for the snipers!") -- fixme text
	delay(1)
	remove_marker_vehicle("projects_$v-loft-02")
	add_marker_npc("projects_$c-loft-09", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_$c-loft-10", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_$c-loft-17", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

	thread_new("projects_sh_loft_exit_car", "projects_$c-loft-09")
	thread_new("projects_sh_loft_exit_car_run", "projects_$c-loft-10", "projects_$n-loft-10a")
	thread_new("projects_sh_loft_exit_car_run", "projects_$c-loft-17", "projects_$n-loft-17a")
end


function projects_sh_loft_wave2_car3()
	character_add_vehicle("projects_$c-loft-14", "projects_$v-loft-03", 0)
	character_add_vehicle("projects_$c-loft-15", "projects_$v-loft-03", 1)
	character_add_vehicle("projects_$c-loft-19", "projects_$v-loft-03", 2)

	add_marker_vehicle("projects_$v-loft-03", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	--vehicle_pathfind_to("projects_$v-loft-03", "projects_$n-loft-v3-b", "projects_$n-loft-v3-c", "projects_$n-loft-v3-d", true, true)
	vehicle_pathfind_to("projects_$v-loft-03", "projects_$n-loft-v3-e", true, true)
	--debug_message("watch out for the snipers!") -- fixme text
	delay(1)
	remove_marker_vehicle("projects_$v-loft-03")
	add_marker_npc("projects_$c-loft-14", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_$c-loft-15", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("projects_$c-loft-19", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)

	thread_new("projects_sh_loft_exit_car", "projects_$c-loft-14")
	thread_new("projects_sh_loft_exit_car_run", "projects_$c-loft-15", "projects_$n-loft-15a")
	thread_new("projects_sh_loft_exit_car_run", "projects_$c-loft-19", "projects_$n-loft-19a") -- no worky?  stands there and doesn't attack
end


function projects_sh_loft_exit_car(npc)
	vehicle_exit(npc)
	set_always_sees_player_flag(npc, true)
	while (1) do	-- recur attack periodically to help ensure guys aren't just standing around; thread gets killed automatically in code
		attack(npc)
		delay(15)
	end
end

function projects_sh_loft_exit_car_run(npc, nav)
	vehicle_exit(npc)
	npc_unholster_best_weapon(npc)
	move_to(npc, nav, 2)
	combat_enable(npc)
	set_always_sees_player_flag(npc, true)
	while (1) do	-- recur attack periodically to help ensure guys aren't just standing around; thread gets killed automatically in code
		attack(npc)
		delay(15)
	end
end

function projects_sh_loft_success()
	group_destroy("projects_$G-loft-wave1")
	group_destroy("projects_$G-loft-wave2")
	group_destroy("projects_$G-loft-snipers")
	group_destroy("projects_$G-loft-start1")
	group_destroy("projects_$G-loft-int1")
	group_destroy("projects_$G-loft-sniper")

	hood_set_owner("vk_projects01", "Playas")

	trigger_enable("projects_$t-loft-save")
end


--[[
-- UNUSED FOR NOW
function projects_sh_loft_wave2_car4()
	character_add_vehicle("projects_$c-loft-16", "projects_$v-loft-04", 0)
	character_add_vehicle("projects_$c-loft-17", "projects_$v-loft-04", 1)

	vehicle_pathfind_to("projects_$v-loft-04", "projects_$n-loft-v4-a", true, true)
	delay(0.75)

	vehicle_exit("projects_$c-loft-16")
	attack("projects_$c-loft-16")

	vehicle_exit("projects_$c-loft-17")
	attack("projects_$c-loft-17")
end

-- so NPCs will not timeout and continue attacking
function projects_sh_loft_wave2b_recur()
	while (1) do
		delay(20)

		attack("projects_$c-loft-10")	-- car 2
		attack("projects_$c-loft-09")

		attack("projects_$c-loft-16") -- car 4
		attack("projects_$c-loft-17")
	end
end

function projects_sh_loft_start_snipers()
	group_create("projects_$G-loft-snipers", true)
	attack("projects_$c-loft-snipe1")
	attack("projects_$c-loft-snipe2")
	attack("projects_$c-loft-snipe3")
end

]]
