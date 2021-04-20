
-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------

Tss01_enter_car_prompt = false
Tss01_entered_car = false
Tss01_wave2_dead_count = 0
Tss01_wave3_dead_count = 0
Tss01_wave4_dead_count = 0
Tss01_weapon_array = {}
Tss01_ammo_array = {}

Tss01_fight_thread = -1

-- FUNCTIONS ----------------------------


function tss01_wave1_dead(dead_char)
	remove_marker_npc(dead_char)
	set_team("tss01_thug2", "Vice Lords")
	set_team("tss01_thug3", "Vice Lords")
	attack("tss01_thug2", "#PLAYER#")
	attack("tss01_thug3", "#PLAYER#")
	add_marker_npc("tss01_thug2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_npc("tss01_thug3", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	tss01_maybe_end()
end

function tss01_wave2_dead(dead_char)
	remove_marker_npc(dead_char)
	Tss01_wave2_dead_count = Tss01_wave2_dead_count + 1
	--tss01_maybe_end()
	if (Tss01_wave2_dead_count >= 2) then
		set_team("tss01_thug4", "Vice Lords")
		set_team("tss01_thug5", "Vice Lords")
		attack("tss01_thug4", "#PLAYER#")
		attack("tss01_thug5", "#PLAYER#")
		add_marker_npc("tss01_thug4", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		add_marker_npc("tss01_thug5", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	tss01_maybe_end()
end

function tss01_wave3_dead(dead_char)
	remove_marker_npc(dead_char)
	Tss01_wave3_dead_count = Tss01_wave3_dead_count + 1
	tss01_maybe_end()
end

function tss01_maybe_end()
	if (is_dead("tss01_thug1") and is_dead("tss01_thug2") and is_dead("tss01_thug3") and is_dead("tss01_thug4") and 
			is_dead("tss01_thug5")) then
		for x=1,5,1 do
			on_death("", "tss01_thug"..x)
		end
		on_damage("", "#PLAYER#", 0.25)
		fade_out(1)
		fade_out_block()
		thread_new_block("tss01_cutscene2_win")
		set_current_hit_points("#PLAYER#", get_max_hit_points("#PLAYER#"))
		teleport("#PLAYER#", "mission_start_tss01a")
		mission_set_next_props_req( "los_carnales", TSS_REQUIRED_PROPS )
		mission_end_success("tss01")
	end
end

function tss01_stop_exploit()
	set_ignore_ai_flag("tss01_dex", false)
	set_ignore_ai_flag("tss01_julius", false)
	set_ignore_ai_flag("tss01_troy", false)
	set_ignore_ai_flag("tss01_gat", false)
	set_team("tss01_dex", "Vice Lords")
	set_team("tss01_julius", "Vice Lords")
	set_team("tss01_troy", "Vice Lords")
	set_team("tss01_gat", "Vice Lords")
	attack("tss01_gat", "#PLAYER#")
	attack("tss01_julius", "#PLAYER#")
	attack("tss01_troy", "#PLAYER#")
	attack("tss01_dex", "#PLAYER#")
end

function tss01_lose()
	for x=1,5,1 do
		on_death("", "tss01_thug"..x)
	end
		
	player_controls_disable()
	character_ragdoll("#PLAYER#", -1)
	fade_out(1)
	fade_out_block()
	player_controls_enable()
	thread_new_block("tss01_cutscene2_lose")
	teleport("#PLAYER#", "mission_start_tss01a")
	set_current_hit_points("#PLAYER#", get_max_hit_points("#PLAYER#"))
	mission_set_next_props_req( "los_carnales", TSS_REQUIRED_PROPS )
	mission_end_success("tss01")
end

function tss01_car_tutorial()
end

function tss01_enter_church_trigger()
	--spawning_remove_all()
	--spawning_on()
	
	
	--spawn_override_set_category("TSS01 Spawn")
	
		
	-- cutscene
	cutscene_in("tss01_scene01")
	team_despawn("Police", true)
	team_despawn("Playas", true)
	team_despawn("Los Carnales", true)
	team_despawn("Vice Lords", true)
	team_despawn("Rollerz", true)
	notoriety_set_max("vice_kings", 0)
	notoriety_set_max("police", 0)
	set_human_health("#PLAYER#", 1.0)
	on_damage("tss01_lose", "#PLAYER#", 0.25)
	cutscene_play( "tss01_scene01", "tss01_fighters" )
	teleport("#PLAYER#", "tss01_player_church_start")
	
	character_show("tss01_thug1")
	character_show("tss01_thug2")
	character_show("tss01_thug3")
	character_show("tss01_thug4")
	character_show("tss01_thug5")
	
	character_show("tss01_spec1")
	character_show("tss01_spec2")
	character_show("tss01_spec3")
	character_show("tss01_spec4")
	character_show("tss01_spec5")
	character_show("tss01_spec6")
	character_show("tss01_spec7")
	character_show("tss01_spec8")
	
	character_show("tss01_troy")
	character_show("tss01_dex")
	character_show("tss01_gat")
	character_show("tss01_julius")
	
	turn_invulnerable("tss01_troy", false)
	turn_invulnerable("tss01_dex", false)
	turn_invulnerable("tss01_gat", false)
	turn_invulnerable("tss01_julius", false)
	
	set_team("tss01_troy", "Civilian")
	set_team("tss01_dex", "Civilian")
	set_team("tss01_gat", "Civilian")
	set_team("tss01_julius", "Civilian")
	
	persona_override_persona_start("SP_GAT", "threat - alert (group attack)", "GAT_3SS1_ATTKLT", 2)
	persona_override_persona_start("SP_JULIUS", "threat - alert (group attack)", "JULIUS_3SS1_ATTKLT", 2)
	persona_override_persona_start("SP_TROY", "threat - alert (group attack)", "TROY_3SS1_ATTKLT", 2)
	
	on_take_damage("tss01_stop_exploit", "tss01_troy")
	on_take_damage("tss01_stop_exploit", "tss01_dex")
	on_take_damage("tss01_stop_exploit", "tss01_gat")
	on_take_damage("tss01_stop_exploit", "tss01_julius")
	
	set_team("tss01_thug1", "Civilian")
	set_team("tss01_thug2", "Civilian")
	set_team("tss01_thug3", "Civilian")
	set_team("tss01_thug4", "Civilian")
	set_team("tss01_thug5", "Civilian")
	
	set_team("tss01_spec1", "Civilian")
	set_team("tss01_spec2", "Civilian")
	set_team("tss01_spec3", "Civilian")
	set_team("tss01_spec4", "Civilian")
	set_team("tss01_spec5", "Civilian")
	set_team("tss01_spec6", "Civilian")
	set_team("tss01_spec7", "Civilian")
	set_team("tss01_spec8", "Civilian")
	cutscene_out()
	
	tutorial_start("combat", 500, true)
	delay(0.7)
	
	-- start fight
	set_team("tss01_thug1", "Vice Lords")
	attack("tss01_thug1", "#PLAYER#")
	add_marker_npc("tss01_thug1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	mission_help_table("tss01_defend_self")
	
	local in_range = true
		
	while (get_dist_char_to_nav("#PLAYER#", "tss01_player_church_start") < 35.0) do
		if (is_player_in_vehicle()) then
			break
		end
		delay(5)
		if (in_range and (get_dist_char_to_nav("#PLAYER#", "tss01_player_church_start") > 20.0)) then
			mission_help_table_nag("tss01_warning")
			in_range = false
		elseif (not in_range and (get_dist_char_to_nav("#PLAYER#", "tss01_player_church_start") < 20.0)) then
			in_range = true
		end
	end
	Tss01_fight_thread = -1
	mission_end_failure("tss01", "3ss01_fail")
end

function tss01_tutorial2()
	
end

function tss01_cleanup()
	player_controls_enable()
	
	notoriety_reset("vice_kings")
	notoriety_reset("police")
	
	--spawn_override_set_category("")
	
	remove_marker_npc("tss01_thug1")
	remove_marker_npc("tss01_thug2")
	remove_marker_npc("tss01_thug3")
	remove_marker_npc("tss01_thug4")
	remove_marker_npc("tss01_thug5")
	
	persona_override_persona_stop_all("BF_3SS1")
	persona_override_persona_stop_all("BF_3SS2")
	persona_override_persona_stop_all("BF_3SS3")
	
	persona_override_persona_stop_all("BM_3SS1")
	persona_override_persona_stop_all("BM_3SS2")
	persona_override_persona_stop_all("BM_3SS3")
	
	persona_override_persona_stop_all("AM_3SS1")
	persona_override_persona_stop_all("AM_3SS2")
	persona_override_persona_stop_all("AM_3SS3")
	
	persona_override_persona_stop_all("HM_3SS1")
	persona_override_persona_stop_all("HM_3SS2")
	persona_override_persona_stop_all("HM_3SS3")
	
	persona_override_persona_stop_all("WM_3SS1")
	persona_override_persona_stop_all("WM_3SS2")
	persona_override_persona_stop_all("WM_3SS3")
	-- unregister functions
	
	on_death("", "tss01_thug1")
	on_death("", "tss01_thug2")
	on_death("", "tss01_thug3")
	on_death("", "tss01_thug4")
	on_death("", "tss01_thug5")
	
	on_damage("", "#PLAYER#", 0.25)
	
	for x=1,8,1 do
		if (x < 6) then
			if (human_check_resource_loaded("tss01_thug"..x)) then
				npc_go_idle("tss01_thug"..x)
				set_team("tss01_thug"..x, "Playas")
				release_to_world("tss01_thug"..x)
			end
		end
		if (human_check_resource_loaded("tss01_spec"..x)) then
			npc_go_idle("tss01_spec"..x)
			set_team("tss01_spec"..x, "Playas")
			release_to_world("tss01_spec"..x)
		end
	end
	
	group_destroy("tss01_fighters")
	
	inv_item_add(Tss01_weapon_array, Tss01_ammo_array)
	
	ambient_gang_spawn_enable()
	ambient_cop_spawn_enable()
	character_slots_clear_reservations()

	spawning_on()
end

function tss01_success()
	--group_destroy("tss01_fighters")
	--mission_set_next_props_req( "saints", 1000 )
	set_team("#PLAYER#", "Playas")
	unlockable_unlock("00_city")
	unlockable_unlock("tss01")
	mission_start("tss01a")
	-- hood_set_owner("vk_redlight01","Playas")
end

function tss01_start()
	set_mission_author("Sandeep Shekar")
	-- register functions
	mission_waypoint_remove()
	
	on_death("tss01_wave1_dead", "tss01_thug1")
	on_death("tss01_wave2_dead", "tss01_thug2")
	on_death("tss01_wave2_dead", "tss01_thug3")
	on_death("tss01_wave3_dead", "tss01_thug4")
	on_death("tss01_wave3_dead", "tss01_thug5")
	
	-- init globals
	Tss01_wave2_dead_count = 0
	Tss01_wave3_dead_count = 0
	Tss01_wave4_dead_count = 0

	Tss01_weapon_array, Tss01_ammo_array = inv_item_get_all()
	inv_item_remove_all()

	ambient_gang_spawn_disable()
	ambient_cop_spawn_disable()
	character_slots_reserve_for_team("Playas", 4)
	
	persona_override_persona_start("BF_3SS1", "threat - alert (group attack)", "BF3SS1_3SS1_ATTACK", 1)
	persona_override_persona_start("BF_3SS2", "threat - alert (group attack)", "BF3SS2_3SS1_ATTACK", 1)
	persona_override_persona_start("BF_3SS3", "threat - alert (group attack)", "BF3SS3_3SS1_ATTACK", 1)
	
	persona_override_persona_start("WM_3SS1", "threat - alert (group attack)", "WM3SS1_3SS1_ATTACK", 1)
	persona_override_persona_start("WM_3SS2", "threat - alert (group attack)", "WM3SS2_3SS1_ATTACK", 1)
	persona_override_persona_start("WM_3SS3", "threat - alert (group attack)", "WM3SS3_3SS1_ATTACK", 1)
	
	persona_override_persona_start("AM_3SS1", "threat - alert (group attack)", "AM3SS1_3SS1_ATTACK", 1)
	persona_override_persona_start("AM_3SS2", "threat - alert (group attack)", "AM3SS2_3SS1_ATTACK", 1)
	persona_override_persona_start("AM_3SS3", "threat - alert (group attack)", "AM3SS3_3SS1_ATTACK", 1)
	
	persona_override_persona_start("HM_3SS1", "threat - alert (group attack)", "HM3SS1_3SS1_ATTACK", 1)
	persona_override_persona_start("HM_3SS2", "threat - alert (group attack)", "HM3SS2_3SS1_ATTACK", 1)
	persona_override_persona_start("HM_3SS3", "threat - alert (group attack)", "HM3SS3_3SS1_ATTACK", 1)
	
	persona_override_persona_start("BM_3SS1", "threat - alert (group attack)", "BM3SS1_3SS1_ATTACK", 1)
	persona_override_persona_start("BM_3SS2", "threat - alert (group attack)", "BM3SS2_3SS1_ATTACK", 1)
	persona_override_persona_start("BM_3SS3", "threat - alert (group attack)", "BM3SS3_3SS1_ATTACK", 1)

	persona_override_persona_start("BF_3SS1", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("BF_3SS2", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("BF_3SS3", "observe - PC (flash gang sign rank 1)", "", 1)
	
	persona_override_persona_start("WM_3SS1", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("WM_3SS2", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("WM_3SS3", "observe - PC (flash gang sign rank 1)", "", 1)
	
	persona_override_persona_start("AM_3SS1", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("AM_3SS2", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("AM_3SS3", "observe - PC (flash gang sign rank 1)", "", 1)
	
	persona_override_persona_start("HM_3SS1", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("HM_3SS2", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("HM_3SS3", "observe - PC (flash gang sign rank 1)", "", 1)
	
	persona_override_persona_start("BM_3SS1", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("BM_3SS2", "observe - PC (flash gang sign rank 1)", "", 1)
	persona_override_persona_start("BM_3SS3", "observe - PC (flash gang sign rank 1)", "", 1)


	persona_override_persona_start("WM_3SS1", "observe - female", "")
	persona_override_persona_start("WM_3SS2", "observe - female", "")
	persona_override_persona_start("WM_3SS3", "observe - female", "")
	
	persona_override_persona_start("AM_3SS1", "observe - female", "")
	persona_override_persona_start("AM_3SS2", "observe - female", "")
	persona_override_persona_start("AM_3SS3", "observe - female", "")
	
	persona_override_persona_start("HM_3SS1", "observe - female", "")
	persona_override_persona_start("HM_3SS2", "observe - female", "")
	persona_override_persona_start("HM_3SS3", "observe - female", "")
	
	persona_override_persona_start("BM_3SS1", "observe - female", "")
	persona_override_persona_start("BM_3SS2", "observe - female", "")
	persona_override_persona_start("BM_3SS3", "observe - female", "")
		
	Tss01_fight_thread = thread_new("tss01_enter_church_trigger")
end

function tss01_cutscene()
	
	--modal_begin()
	-- shot 1 --
	
	-- this cutscene should be julius intrducing the player to getting his ass beat
	
	-- cleanup --
	--fade_out(0.5)
	--delay(0.5)
	--modal_end()
end

function tss01_cutscene2_win()
	if not (Tss01_fight_thread == -1) then
		thread_kill(Tss01_fight_thread)
		Tss01_fight_thread = -1
	end

	on_death("", "tss01_thug1")
	on_death("", "tss01_thug2")
	on_death("", "tss01_thug3")
	on_death("", "tss01_thug4")
	on_death("", "tss01_thug5")
	--group_destroy("tss01_fighters")
	cutscene_in("tss01_scene03")
	
	character_hide("tss01_gat")
	character_hide("tss01_troy")
	character_hide("tss01_dex")
	character_hide("tss01_julius")
	
	for x=1,8,1 do
		npc_go_idle("tss01_thug"..x)
		npc_go_idle("tss01_spec"..x)
		character_hide("tss01_thug"..x)
		character_hide("tss01_spec"..x)
	end
	mission_change_reward(1000,0)
	cutscene_play( "tss01_scene03", true )
	
	for x=1,8,1 do
		if not is_dead("tss01_thug"..x) then
			character_show("tss01_thug"..x)
		end
		if not is_dead("tss01_spec"..x) then
			character_show("tss01_spec"..x)
		end
	end
	

	teleport("#PLAYER#", "tss01_player_church_start")
end

function tss01_cutscene2_lose()
	if not (Tss01_fight_thread == -1) then
		thread_kill(Tss01_fight_thread)
		Tss01_fight_thread = -1
	end
	
	
	on_death("", "tss01_thug1")
	on_death("", "tss01_thug2")
	on_death("", "tss01_thug3")
	on_death("", "tss01_thug4")
	on_death("", "tss01_thug5")
	--group_destroy("tss01_fighters")
	
	cutscene_in("tss01_scene02")
	
	character_hide("tss01_gat")
	character_hide("tss01_troy")
	character_hide("tss01_dex")
	character_hide("tss01_julius")
	
	for x=1,8,1 do
		character_hide("tss01_thug"..x)
		character_hide("tss01_spec"..x)
	end
	
	cutscene_play( "tss01_scene02", true )
	
	for x=1,8,1 do
		if not is_dead("tss01_thug"..x) then
			character_show("tss01_thug"..x)
		end
		if not is_dead("tss01_spec"..x) then
			character_show("tss01_spec"..x)
		end
	end
	
	teleport("#PLAYER#", "tss01_player_church_start")
end



