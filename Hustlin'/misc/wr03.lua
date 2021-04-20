-- Global Variables------

-- Respect level required to unlock mission
wr03_reached_suburbs = false
wr03_timer_on = false

WR03_threads = {}

WR03_required_kills = 2

wr03_npc_waves =
{
	{		-- wave 1
		aggressives = {"wr03_$c_outside_1", "wr03_$c_outside_2", "wr03_$c_outside_3", "wr03_$c_outside_4"},
		cowards		= {},
	},
	{		-- wave 2
		aggressives = {"wr03_$c_bay_1", "wr03_$c_bay_2"},
		cowards		= {},
	},
	{		-- wave 3
		aggressives = {},
		cowards		= {"wr03_$c_mechanic_1", "wr03_$c_mechanic_2"},
	},
	{		-- wave 4
		aggressives = {"wr03_$c_lobby_1", "wr03_$c_lobby_2"},
		cowards		= {},
	},
	{		-- wave 5
		aggressives = {"wr03_$c_guard_1", "wr03_$c_guard_2"},
		cowards		= {},
	},
	{		-- wave 6
		aggressives = {"wr03_$c_bodyguard1", "wr03_$c_bodyguard2", "wr03_$c_donnie"},
		cowards		= {},
	},
}

wr03_lin_path = {"wr03_$n_linpath000",
	"wr03_$n_linpath001",	"wr03_$n_linpath002", "wr03_$n_linpath003", "wr03_$n_linpath004", "wr03_$n_linpath005",
	"wr03_$n_linpath006",	"wr03_$n_linpath007", "wr03_$n_linpath008", "wr03_$n_linpath009", "wr03_$n_linpath010",
	"wr03_$n_linpath011",	"wr03_$n_linpath012", "wr03_$n_linpath013", "wr03_$n_linpath014", "wr03_$n_linpath015",
	"wr03_$n_linpath016",	"wr03_$n_linpath017", "wr03_$n_linpath018", "wr03_$n_linpath019", "wr03_$n_linpath020",
	"wr03_$n_linpath021",	"wr03_$n_linpath022", "wr03_$n_linpath023", "wr03_$n_linpath024", "wr03_$n_linpath025",
	
	"wr03_$n_linpath026",	"wr03_$n_linpath027", "wr03_$n_linpath028", "wr03_$n_linpath029", "wr03_$n_linpath030",
	"wr03_$n_linpath031",	"wr03_$n_linpath032", "wr03_$n_linpath033", "wr03_$n_linpath034", "wr03_$n_linpath035",
	"wr03_$n_linpath036",	"wr03_$n_linpath037", "wr03_$n_linpath038", "wr03_$n_linpath039", "wr03_$n_linpath040",
	"wr03_$n_linpath041",	"wr03_$n_linpath042", "wr03_$n_linpath043", "wr03_$n_linpath044", "wr03_$n_linpath045",
	"wr03_$n_linpath046",	"wr03_$n_linpath047", "wr03_$n_linpath048", "wr03_$n_linpath049", "wr03_$n_linpath050",
	
	"wr03_$n_linpath051",	"wr03_$n_linpath052", "wr03_$n_linpath053", "wr03_$n_linpath054", "wr03_$n_linpath055",
	"wr03_$n_linpath056",	"wr03_$n_linpath057", "wr03_$n_linpath058", "wr03_$n_linpath059", "wr03_$n_linpath060",
	"wr03_$n_linpath061",	"wr03_$n_linpath062", "wr03_$n_linpath063", "wr03_$n_linpath064", "wr03_$n_linpath065",
	"wr03_$n_linpath066",	"wr03_$n_linpath067", "wr03_$n_linpath068", "wr03_$n_linpath069", "wr03_$n_linpath070",
	"wr03_$n_linpath071",	"wr03_$n_linpath072", "wr03_$n_linpath073", "wr03_$n_linpath074", "wr03_$n_linpath075",
	
	"wr03_$n_linpath076",	"wr03_$n_linpath077", "wr03_$n_linpath078", "wr03_$n_linpath079", "wr03_$n_linpath080",
	"wr03_$n_linpath081",	"wr03_$n_linpath082", "wr03_$n_linpath083", "wr03_$n_linpath084", "wr03_$n_linpath085",
	"wr03_$n_linpath086",	"wr03_$n_linpath087", "wr03_$n_linpath088", "wr03_$n_linpath089", "wr03_$n_linpath090",
	"wr03_$n_linpath091",	"wr03_$n_linpath092", "wr03_$n_linpath093", "wr03_$n_linpath094", "wr03_$n_linpath095",
	"wr03_$n_linpath096",	"wr03_$n_linpath097", "wr03_$n_linpath098", "wr03_$n_linpath099", "wr03_$n_linpath100",
	
	"wr03_$n_linpath101",   "wr03_$n_linpath102"
}


-- FUNCTIONS ----------------------------

function wr03_success()
	hood_set_owner("wr_apartments01", "Playas")
end

function wr03_cleanup()
	mission_waypoint_remove()
	for index, value in WR03_threads do
		thread_kill(value)
	end
	WR03_threads = {}

	distance_display_off()
			
	on_death("", "wr03_lin")
	on_vehicle_destroyed("", "wr03_lin_car")
	
	on_death("", "wr03_$c_bodyguard1")
	on_death("", "wr03_$c_bodyguard2")
	on_death("", "wr03_$c_donnie")
	
	on_take_damage("", "wr03_lin_car")
	
	hud_timer_stop()
	
	on_trigger("", "wr03_$t_wave_2")
	on_trigger("", "wr03_$t_wave_3")
	on_trigger("", "wr03_$t_wave_4")
	on_trigger("", "wr03_$t_wave_5")
	on_trigger("", "wr03_$t_wave_6")
	on_trigger("", "wr03_$t_crib")
	wr03_disable_triggers()
	
	remove_marker_npc("wr03_$c_donnie")
	remove_marker_npc("wr03_$c_bodyguard1")
	remove_marker_npc("wr03_$c_bodyguard2")
	remove_marker_vehicle("wr03_lin_car")
	
	on_take_damage("", "wr03_$c_donnie")
	on_take_damage("", "wr03_$c_bodyguard2")
	on_take_damage("", "wr03_$c_bodyguard1")
	
	release_to_world("wr03_$c_mechanic_1")
	release_to_world("wr03_$c_mechanic_2")
	
	release_to_world("wr03_$c_outside_1")
	release_to_world("wr03_$c_outside_2")
	release_to_world("wr03_$c_outside_3")
	release_to_world("wr03_$c_outside_4")
	
	release_to_world("wr03_$c_bay_1")
	release_to_world("wr03_$c_bay_2")
	
	release_to_world("wr03_$c_lobby_1")
	release_to_world("wr03_$c_lobby_2")
	
	release_to_world("wr03_$c_guard_1")
	release_to_world("wr03_$c_guard_2")
	
	release_to_world("wr03_$c_bodyguard1")
	release_to_world("wr03_$c_bodyguard2")
	
	release_to_world("wr03_car_2dr_sports04#000")
	release_to_world("wr03_car_2dr_compact04#000")
	release_to_world("wr03_sp_limo01#000")
	release_to_world("wr03_player_car")
	
	
	group_destroy("wr03_$g_chopshop")
	notoriety_reset("rollers")
	remove_marker_trigger("wr03_$t_crib")
	remove_marker_trigger("wr03_$t_wave_6")
	remove_marker_navpoint("wr03_$n_chopshop")
	
	persona_override_remove_all("AM_WR1")
	persona_override_remove_all("AM_WR2")
	persona_override_remove_all("AM_WR3")
	persona_override_remove_all("WM_WR1")
	persona_override_remove_all("WM_WR2")
	persona_override_remove_all("WM_WR3")
	persona_override_remove_all("AF_WR1")
	persona_override_remove_all("AF_WR2")
	persona_override_remove_all("AF_WR3")
	persona_override_remove_all("WF_WR1")
	persona_override_remove_all("WF_WR2")
	persona_override_remove_all("WF_WR3")
end

function wr03_disable_triggers()
	trigger_disable("wr03_$t_wave_2")
	trigger_disable("wr03_$t_wave_3")
	trigger_disable("wr03_$t_wave_4")
	trigger_disable("wr03_$t_wave_5")
	trigger_disable("wr03_$t_wave_6")
	trigger_disable("wr03_$t_crib")
end

-- Sets up phase 1
-- Called by mission trigger
function wr03_start()
	cutscene_in("wr03_scene01")
	cutscene_play("wr03_scene01", "wr03_$g_chopshop")
	teleport("#PLAYER#", "mission_start_wr03")
	wr03_reached_suburbs = false
	WR03_required_kills = 2
	
	notoriety_set_max("rollers", 2)
	
	add_marker_navpoint("wr03_$n_chopshop", MINIMAP_ICON_LOCATION, "")
	mission_waypoint_add("wr03_donnie_gps")
	
	persona_override_persona_start("AM_WR1", "threat - alert (solo attack)", "AMWR1_WR3_ATTACK") 
	persona_override_persona_start("AM_WR1", "threat - alert (group attack)", "AMWR1_WR3_ATTACK") 
	persona_override_persona_start("AM_WR2", "threat - alert (solo attack)", "AMWR2_WR3_ATTACK") 
	persona_override_persona_start("AM_WR2", "threat - alert (group attack)", "AMWR2_WR3_ATTACK") 
	persona_override_persona_start("AM_WR3", "threat - alert (solo attack)", "AMWR3_WR3_ATTACK") 
	persona_override_persona_start("AM_WR3", "threat - alert (group attack)", "AMWR3_WR3_ATTACK") 
	persona_override_persona_start("WM_WR1", "threat - alert (solo attack)", "WMWR1_WR3_ATTACK") 
	persona_override_persona_start("WM_WR1", "threat - alert (group attack)", "WMWR1_WR3_ATTACK") 
	persona_override_persona_start("WM_WR2", "threat - alert (solo attack)", "WMWR2_WR3_ATTACK") 
	persona_override_persona_start("WM_WR2", "threat - alert (group attack)", "WMWR2_WR3_ATTACK") 
	persona_override_persona_start("WM_WR3", "threat - alert (solo attack)", "WMWR3_WR3_ATTACK") 
	persona_override_persona_start("WM_WR3", "threat - alert (group attack)", "WMWR3_WR3_ATTACK") 
	
	persona_override_persona_start("AF_WR1", "threat - alert (solo attack)", "AFWR1_WR3_ATTACK") 
	persona_override_persona_start("AF_WR1", "threat - alert (group attack)", "AFWR1_WR3_ATTACK") 
	persona_override_persona_start("AF_WR2", "threat - alert (solo attack)", "AFWR2_WR3_ATTACK") 
	persona_override_persona_start("AF_WR2", "threat - alert (group attack)", "AFWR2_WR3_ATTACK") 
	persona_override_persona_start("AF_WR3", "threat - alert (solo attack)", "AFWR3_WR3_ATTACK") 
	persona_override_persona_start("AF_WR3", "threat - alert (group attack)", "AFWR3_WR3_ATTACK") 
	persona_override_persona_start("WF_WR1", "threat - alert (solo attack)", "WFWR1_WR3_ATTACK") 
	persona_override_persona_start("WF_WR1", "threat - alert (group attack)", "WFWR1_WR3_ATTACK") 
	persona_override_persona_start("WF_WR2", "threat - alert (solo attack)", "WFWR2_WR3_ATTACK") 
	persona_override_persona_start("WF_WR2", "threat - alert (group attack)", "WFWR2_WR3_ATTACK") 
	persona_override_persona_start("WF_WR3", "threat - alert (solo attack)", "WFWR3_WR3_ATTACK") 
	persona_override_persona_start("WF_WR3", "threat - alert (group attack)", "WFWR3_WR3_ATTACK") 
	
	character_show("wr03_$c_mechanic_1")
	character_show("wr03_$c_mechanic_2")
	
	character_show("wr03_$c_outside_1")
	character_show("wr03_$c_outside_2")
	character_show("wr03_$c_outside_3")
	character_show("wr03_$c_outside_4")
	
	character_show("wr03_$c_bay_1")
	character_show("wr03_$c_bay_2")
	
	character_show("wr03_$c_lobby_1")
	character_show("wr03_$c_lobby_2")
	
	character_show("wr03_$c_guard_1")
	character_show("wr03_$c_guard_2")
	
	character_show("wr03_$c_donnie")
	
	add_marker_npc("wr03_$c_donnie", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)

	character_show("wr03_$c_bodyguard1")
	character_show("wr03_$c_bodyguard2")
	
	vehicle_show("wr03_car_2dr_sports04#000")
	vehicle_show("wr03_car_2dr_compact04#000")
	vehicle_show("wr03_sp_limo01#000")
	vehicle_show("wr03_player_car")
	
	on_death("wr03_bodyguard_killed", "wr03_$c_bodyguard1")
	on_death("wr03_bodyguard_killed", "wr03_$c_bodyguard2")
	on_death("wr03_donnie_killed", "wr03_$c_donnie")
	
	combat_disable("wr03_$c_bodyguard1")
	combat_disable("wr03_$c_bodyguard2")
	
	on_take_damage("wr03_take_damage", "wr03_$c_donnie")
	on_take_damage("wr03_take_damage", "wr03_$c_bodyguard2")
	on_take_damage("wr03_take_damage", "wr03_$c_bodyguard1")
	
	on_trigger("wr03_trigger_wave_2", "wr03_$t_wave_2")
	trigger_enable("wr03_$t_wave_2")
	
	on_trigger("wr03_trigger_wave_3", "wr03_$t_wave_3")
	trigger_enable("wr03_$t_wave_3")
	
	on_trigger("wr03_trigger_wave_4", "wr03_$t_wave_4")
	trigger_enable("wr03_$t_wave_4")
	
	on_trigger("wr03_trigger_wave_5", "wr03_$t_wave_5")
	trigger_enable("wr03_$t_wave_5")

	on_trigger("wr03_trigger_wave_6", "wr03_$t_wave_6")
	trigger_enable("wr03_$t_wave_6")
	
	delay(2)
	mission_help_table("wr03_go_to_shop")	
end

function wr03_take_damage()
	wr03_trigger_wave_6()
end

wr03_warning_played = false

function wr03_lin_damage(target, attacker)
	if (wr03_warning_played) then
		return
	end
	if (attacker == "#PLAYER#") then
		wr03_warning_played = true
		mission_help_table_nag("wr03_dont_kill")
		delay(10)
		wr03_warning_played = false
	end
end

function wr03_bodyguard_killed(name)
	on_death("", name)
	
	remove_marker_npc(name)
	WR03_required_kills = WR03_required_kills - 1
	
	mission_debug("required kills: "..WR03_required_kills, -1)
	
	if WR03_required_kills < 1 then
		if WR03_threads["wr03_donnie_cower"] ~= nil then
			thread_kill(WR03_threads["wr03_donnie_cower"])
			WR03_threads["wr03_donnie_cower"] = nil
		end
		
		WR03_threads["wr03_donnie_escape"] = thread_new("wr03_donnie_escape")
	elseif WR03_required_kills < 2 then
		WR03_threads["wr03_donnie_cower"] = thread_new("wr03_donnie_cower")
	end
end

function wr03_donnie_killed()
	mission_end_failure("wr03", "wr03_donnie")
end


function wave_attack(wave)
	for index, value in wave.aggressives do
		hearing_enable(value)
		attack(value, "#PLAYER#")
		mission_debug(value.." attacking")
	end

	for index, value in wave.cowards do
		hearing_enable(value)
		flee(value, "#PLAYER#")
		mission_debug(value.." fleeing")
	end
end

function wr03_trigger_wave_2()
	mission_debug("trigger 2 tripped")
	trigger_disable("wr03_$t_wave_2")
	wave_attack(wr03_npc_waves[2])
	wave_attack(wr03_npc_waves[1])
end

function wr03_trigger_wave_3()
	mission_help_table("wr03_find_scare")
	mission_debug("trigger 3 tripped")
	trigger_disable("wr03_$t_wave_3")
	wave_attack(wr03_npc_waves[3])
end

function wr03_trigger_wave_4()
	mission_debug("trigger 4 tripped")
	trigger_disable("wr03_$t_wave_4")
	wave_attack(wr03_npc_waves[4])
end

function wr03_trigger_wave_5()
	mission_debug("trigger 5 tripped")
	trigger_disable("wr03_$t_wave_5")
	wave_attack(wr03_npc_waves[5])
end

function wr03_trigger_wave_6()
	mission_debug("trigger 6 tripped")
	trigger_disable("wr03_$t_wave_6")
	
	on_take_damage("", "wr03_$c_donnie")
	on_take_damage("", "wr03_$c_bodyguard2")
	on_take_damage("", "wr03_$c_bodyguard1")
	
	combat_enable("wr03_$c_bodyguard1")
	combat_enable("wr03_$c_bodyguard2")

	wave_attack(wr03_npc_waves[6])
	
	remove_marker_navpoint("wr03_$n_chopshop")
	if (not is_dead("wr03_$c_bodyguard1")) then
		add_marker_npc("wr03_$c_bodyguard1", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	if (not is_dead("wr03_$c_bodyguard2")) then
		add_marker_npc("wr03_$c_bodyguard2", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
	
	audio_play_for_character("DONNIE_WR3_SPOT_1","wr03_$c_donnie", "voice", true, true)
	mission_help_table("wr03_kill_guards")
end

function wr03_donnie_cower()
	mission_debug("Donnie cowering", -1)
	npc_go_idle("wr03_$c_donnie")
	combat_disable("wr03_$c_donnie")
	flee_to_navpoint("wr03_$c_donnie", "wr03_$n_donnie_cower", "#PLAYER#", true)
	WR03_threads["wr03_donnie_cower"] = nil
end

wr03_reached_suburbs = false

function wr03_lin_fail()
	on_death("", "wr03_lin")
	on_vehicle_destroyed("", "wr03_lin_car")
	delay(3)
	mission_end_failure("wr03", "wr03_lin_died")	
end

function wr03_slow_fail()
	mission_end_failure("wr03", "wr03_lost_car")
end

function wr03_monitor()
	vehicle_supress_npc_exit("wr03_lin_car", true)
	set_unjackable_flag("wr03_lin_car", true)
	vehicle_infinite_mass("wr03_lin_car", true)
	turn_invulnerable("wr03_lin_car", true)
	vehicle_speed_override("wr03_lin_car", 65)
	mission_help_table("wr03_chase_lin")
	on_take_damage("wr03_lin_damage", "wr03_lin_car")
	add_marker_vehicle("wr03_lin_car", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	delay(5)
	mission_help_table_nag("wr03_dont_kill")
	wr03_warning_played = false
	distance_display_on("wr03_lin", 0,200,0,80)
	on_death("wr03_lin_fail", "wr03_lin")
	on_vehicle_destroyed("wr03_lin_fail", "wr03_lin_car")
	wr03_timer_on = false
	while (true) do
		if (wr03_reached_suburbs) then
			hud_timer_stop()
			distance_display_off()
			vehicle_speed_override("wr03_lin_car", 80)
			if (get_dist_char_to_vehicle("#PLAYER#", "wr03_lin_car") > 160) then
				delay(3)
				mission_end_success("wr03")
				return
			end
		else
			if (get_dist_char_to_vehicle("#PLAYER#", "wr03_lin_car") > 80) then
				if (not wr03_timer_on) then
					vehicle_speed_override("wr03_lin_car", 45)
					mission_help_table_nag("wr03_falling_behind")		
					hud_timer_set(30 * 1000, "wr03_slow_fail")
					wr03_timer_on = true
				end
			else
				vehicle_speed_override("wr03_lin_car", 65)
				hud_timer_stop()
				wr03_timer_on = false
			end
		end
		thread_yield()
	end
end

function wr03_donnie_escape()
	delay(2)
	mission_waypoint_remove()
	mission_debug("Donnie escape", -1)
	persona_override_remove_all("AM_WR1")
	persona_override_remove_all("AM_WR2")
	persona_override_remove_all("AM_WR3")
	persona_override_remove_all("WM_WR1")
	persona_override_remove_all("WM_WR2")
	persona_override_remove_all("WM_WR3")
	persona_override_remove_all("AF_WR1")
	persona_override_remove_all("AF_WR2")
	persona_override_remove_all("AF_WR3")
	persona_override_remove_all("WF_WR1")
	persona_override_remove_all("WF_WR2")
	persona_override_remove_all("WF_WR3")
	cutscene_in("wr03_scene02")
	cutscene_play("wr03_scene02")
	teleport("#PLAYER#", "wr03_player_pos")
	notoriety_set_max("rollers", 2)
	notoriety_set_min("rollers", 1)
	vehicle_show("wr03_lin_car")
	character_show("wr03_lin")
	character_add_vehicle("wr03_lin", "wr03_lin_car", 0)
	character_add_vehicle("wr03_$c_donnie", "wr03_lin_car", 1)
	thread_new("wr03_monitor")
	
	vehicle_pathfind_to("wr03_lin_car", wr03_lin_path, true, false)
	wr03_reached_suburbs = true
	mission_help_table("wr03_get_away")
	vehicle_turret_base_to( "wr03_lin_car", "wr03_$n_linpath_final", true)
end

function wr03_win()
	mission_end_success("wr03")
end