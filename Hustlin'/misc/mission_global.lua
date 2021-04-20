
-- Global Variables------
LC_MISSION_START_ICON = "radar_genstarta"

TSS_REQUIRED_PROPS			= 2000
MISSION_01_REQUIRED_PROPS	= 0
MISSION_REQUIRED_PROPS		= 2000

LC01_PROPS_REWARD = 0
LC02_PROPS_REWARD = LC01_PROPS_REWARD
LC03_PROPS_REWARD = LC01_PROPS_REWARD
LC04_PROPS_REWARD = LC01_PROPS_REWARD
LC05_PROPS_REWARD = LC01_PROPS_REWARD
LC06_PROPS_REWARD = LC01_PROPS_REWARD
LC07_PROPS_REWARD = LC01_PROPS_REWARD
LC08_PROPS_REWARD = LC01_PROPS_REWARD
LC09_PROPS_REWARD = LC01_PROPS_REWARD
LC10_PROPS_REWARD = LC01_PROPS_REWARD
LC02_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC03_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC04_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC05_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC06_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC07_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC08_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC09_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
LC10_REQUIRED_PROPS = MISSION_REQUIRED_PROPS

VK1_PROPS_REWARD = 0
VK02_PROPS_REWARD = VK1_PROPS_REWARD
VK3a_PROPS_REWARD = VK1_PROPS_REWARD
VK04a_PROPS_REWARD = VK1_PROPS_REWARD
VK05_PROPS_REWARD = VK1_PROPS_REWARD
VK6a_PROPS_REWARD = VK1_PROPS_REWARD
VK6b_PROPS_REWARD = VK1_PROPS_REWARD
VK07_PROPS_REWARD = VK1_PROPS_REWARD
VK08_PROPS_REWARD = VK1_PROPS_REWARD
VK09_PROPS_REWARD = VK1_PROPS_REWARD
VKX_PROPS_REWARD = VK1_PROPS_REWARD
VK02_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK3a_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK04a_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK05_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK6a_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK6b_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK07_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK08_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VK09_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VKx_REQUIRED_PROPS = MISSION_REQUIRED_PROPS

Wr01_respect_reward = VK1_PROPS_REWARD
Wr02_respect_reward = VK1_PROPS_REWARD
Wr02_cash_reward = 0
Wr03_respect_reward = VK1_PROPS_REWARD
Wr04_respect_reward = VK1_PROPS_REWARD
Wr04_cash_reward = 0
Wr05_respect_reward = VK1_PROPS_REWARD
Wr05_cash_reward = 0
Wr06_respect_reward = VK1_PROPS_REWARD
Wr07_respect_reward = VK1_PROPS_REWARD
Wr07_cash_reward = 0
Wr08_respect_reward = VK1_PROPS_REWARD
Wr08_cash_reward = 0
Wr09_respect_reward = VK1_PROPS_REWARD
Wr09_cash_reward = 0
Wr02_min_respect_required = MISSION_REQUIRED_PROPS
Wr03_min_respect_required = MISSION_REQUIRED_PROPS
Wr04_min_respect_required = MISSION_REQUIRED_PROPS
Wr05_min_respect_required = MISSION_REQUIRED_PROPS
Wr06_min_respect_required = MISSION_REQUIRED_PROPS
Wr07_min_respect_required = MISSION_REQUIRED_PROPS
Wr08_min_respect_required = MISSION_REQUIRED_PROPS
Wr09_min_respect_required = MISSION_REQUIRED_PROPS

TSS01_CASH_REWARD = 200
TSS01_RESPECT_REWARD = VK1_PROPS_REWARD
TSS01A_CASH_REWARD = 0
TSS01A_RESPECT_REWARD = VK1_PROPS_REWARD
TSS02_REQUIRED_RESPECT = TSS_REQUIRED_PROPS

Tss01a_cellphone_active = false

PHONECALL_LC01 =						0
PHONECALL_LC09 =						1
PHONECALL_TSS01A =						2
PHONECALL_TSS02_ACTIVITY =	 			3
PHONECALL_TSS02_STRONGHOLD =			4
PHONECALL_TSS02_MAIN_TROY =				5
PHONECALL_TSS02_MAIN_JULIUS =			6
PHONECALL_TSS05 =						7
PHONECALL_VK01 =						8
PHONECALL_VKX =							9
PHONECALL_WR01 =						10
PHONECALL_WR02 =						11
PHONECALL_WR03 =						12
PHONECALL_WR04 =						13
PHONECALL_WR09 =						14

-- FUNCTIONS ----------------------------

function v_a_t_init()
	mission_add_triggerless("v_a_t", "v_a_t_unlock", "v_a_t_cleanup", "v_a_t_start", 0, 0, 0)
end

function v_a_t_main()
end

function v_a_t_unlock()
	-- never unlock
end

function test_ghost_init()
	-- test_ghost
	mission_add_triggerless("test_ghost", "test_ghost_unlock", "test_ghost_cleanup", "test_ghost_start", 0, 0, 0)

end

function test_ghost_main()
end

function test_ghost_unlock()
end


-- cutscene testing functions
function vk09_tele()
	teleport( "#PLAYER#", "vk09_elevator_entrance")
end

function vk09_cutscene_debug()

	cutscene_play("vk09_scene02")

	teleport( "#PLAYER#", "vk09_elevator_top_player")
end

-- PROFILING MISSION TO HELP CREATE SCENES WHICH ARE CLOSER TO REAL WORLD

function profiling_init()
	-- test_ghost
	mission_add_triggerless("profiling", "profiling_unlock", "profiling_cleanup", "profiling_start", 0, 0, 0)

end

function profiling_main()
end

function profiling_unlock()
end

-- END PROFILNG MISSION

function lc01_init()
	mission_add("lc01","lc01_unlock","lc01_cleanup","mission_start_lc01","lc01_start",LC_MISSION_START_ICON, 0, LC01_PROPS_REWARD, MISSION_REQUIRED_PROPS, "lc01_success")
end


function lc01_cellphone()
	cellphone_receive_call(PHONECALL_LC01)
end


function lc01_main()
	if (is_mission_complete("lc01")) then
		return
	end
	
	while (not is_mission_complete("tss02")) do
		delay(10)
	end
	
	while (props_get("saints") < TSS_REQUIRED_PROPS) do
		delay(10)
	end
	
	delay(10)
	
	if (cellphone_has_received_call(PHONECALL_LC01)) then
		return
	end
	
	if (not is_mission_complete("lc01")) then
		cellphone_register("lc01_cellphone")
		audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "LC Intro Phone Call", "Dex", false, "", "lc01_cellphone")
	end
end

function lc01_unlock()
	if (is_mission_complete("tss02")) then
		mission_unlock("lc01")
	end
end

function lc02_init()
	mission_add("lc02", "lc02_unlock", "lc02_cleanup", "mission_start_lc02", "lc02_start", LC_MISSION_START_ICON, 500, LC02_PROPS_REWARD, MISSION_REQUIRED_PROPS, "lc02_success")
end

function lc02_main()
end

function lc02_unlock()
	if (is_mission_complete("lc01")) then
		mission_unlock("lc02")
	end
end

function lc03_init()
	mission_add("lc03","lc03_unlock","lc03_cleanup","mission_start_lc03","lc03_start",LC_MISSION_START_ICON, 750, LC03_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc03_success")
end

function lc03_main()
end

function lc03_unlock()
	if (is_mission_complete("lc02")) then
		mission_unlock("lc03")
	end
end

function lc04_init()
	mission_add("lc04","lc04_unlock","lc04_cleanup","mission_start_lc04","lc04_start",LC_MISSION_START_ICON, 0, LC04_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc04_success")
end

function lc04_main()
end

function lc04_unlock()
	if (is_mission_complete("lc03")) then
		mission_unlock("lc04")
	end
end

function lc05_init()
	mission_add("lc05","lc05_unlock","lc05_cleanup","mission_start_lc05","lc05_start",LC_MISSION_START_ICON, 0, LC05_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc05_success")
end

function lc05_main()
end

function lc05_unlock()
	if (is_mission_complete("lc04")) then
		mission_unlock("lc05")
	end
end

function lc06_init()
	mission_add("lc06","lc06_unlock","lc06_cleanup","mission_start_lc06","lc06_start",LC_MISSION_START_ICON, 1500, LC06_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc06_success")
end

function lc06_main()
end

function lc06_unlock()
	if (is_mission_complete("lc05")) then
		mission_unlock("lc06")
	end
end

function lc07_init()
	mission_add("lc07","lc07_unlock","lc07_cleanup","mission_start_lc07","lc07_start",LC_MISSION_START_ICON, 3000, LC07_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc07_success")
end

function lc07_main()
end

function lc07_unlock()
	if (is_mission_complete("lc06")) then
		mission_unlock("lc07")
	end
end

function lc08_init()
	mission_add("lc08","lc08_unlock","lc08_cleanup","mission_start_lc08","lc08_start",LC_MISSION_START_ICON, 0, LC08_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc08_success")
end

function lc08_main()
end

function lc08_unlock()
	if (is_mission_complete("lc07")) then
		mission_unlock("lc08")
	end
end

function lc09a_init()
	mission_add("lc09","lc09_unlock","lc09_cleanup","mission_start_lc09","lc09_start",LC_MISSION_START_ICON, 0, LC09_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc09_success")
end

lc09_phone_played = false
function lc09_unlock()
	if (lc09_phone_played) then
		mission_unlock("lc09")
	end
end

function lc09_cellphone()
	mission_unlock("lc09")
	lc09_phone_played = true
	cellphone_receive_call(PHONECALL_LC09)
end

function lc09_main()
	if (is_mission_unlocked("lc09")) then
		return
	end
	
	while ((not is_mission_complete("lc08")) or (props_get("saints") < Wr09_min_respect_required)) do
		delay(10)
	end
	
	if (cellphone_has_received_call(PHONECALL_LC09)) then
		return
	end
	
	cellphone_register("lc09_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "DEX_LC9_PHONE_1", "Dex", false, "", "lc09_cellphone")
end

function lc09_unlock()
	if (is_mission_complete("lc08")) then
		mission_unlock("lc09")
	end
end

function lc10_debug_show_plane()
	mesh_show( "sr_city_lc10_LearJet" )
end

function lc10_debug_hide_plane()
	mesh_hide( "sr_city_lc10_LearJet" )
end

function lc10_debug_move_plane()
	mesh_mover_play_action( "sr_city_lc10_LearJet", "start1" )
end

function lc10_debug_warp()
	teleport_vehicle( "#PLAYER#", "lc10_hanger" )
end

function lc10_jump_test()
	group_create( "lc10_Plane", true )
	
	character_add_vehicle( "lc10_attack1_driver", "lc10_attack_car1", 0 )
	character_add_vehicle( "lc10_attack1_passenger", "lc10_attack_car1", 1 )
	character_add_vehicle( "lc10_attack2_driver", "lc10_attack_car2", 0 )
	character_add_vehicle( "lc10_attack2_passenger", "lc10_attack_car2", 1 )
	character_add_vehicle( "lc10_attack3_driver", "lc10_attack_car3", 0 )
	character_add_vehicle( "lc10_attack3_passenger", "lc10_attack_car3", 1 )
	
	lc10_attackers()
end

function lc10_jump_test_reset()
	group_destroy( "lc10_Plane" )
end

function lc10_rocket_test()
	on_trigger( "lc10_launch", "lc10_$n005")
	on_trigger( "lc10_launch", "lc10_$n010")
	on_trigger( "lc10_launch", "lc10_$n011")
	on_trigger( "lc10_launch", "lc10_$n012")
	on_trigger( "lc10_launch", "lc10_$n013")
	on_trigger( "lc10_launch", "lc10_$n015")
	
	trigger_enable("lc10_$n005")
	trigger_enable("lc10_$n010")
	trigger_enable("lc10_$n011")
	trigger_enable("lc10_$n012")
	--trigger_enable("lc10_$n013")
	trigger_enable("lc10_$n015")
	
	group_create( "lc10_Group", true )
	group_create( "lc10_Plane", true )
	character_add_vehicle( "lc10_Dex", "lc10_turret_car", 0 )
	
	teleport_vehicle( "lc10_turret_car", "lc10_test_warp" )
	
	teleport( "#PLAYER#", "lc10_$n003" )

	set_debug_game_paused()
	
	local nav_table = { "lc10_$n004", "lc10_$n015", "lc10_$n005",
						"lc10_$n010", "lc10_$n011", "lc10_$n012", "lc10_$n013", "lc10_$n014", "lc10_$n006",
						"lc10_$n007", "lc10_$n008", "lc10_$n009" }

	vehicle_pathfind_to( "lc10_turret_car",  nav_table, true )

end

function damage_test()
	mission_debug( "damage test was called", 10 )
end

function lc10_init()
	mission_add("lc10","lc10_unlock","lc10_cleanup","mission_start_lc10","lc10_start",LC_MISSION_START_ICON, 0, LC10_PROPS_REWARD, MISSION_REQUIRED_PROPS,"lc10_success")
	
	on_take_damage( "damage_test", "sr_city_lc10_LearJet" )
end

function lc10_main()
end

function lc10_unlock()	
	if ((is_mission_complete("factory_sh_steel")) and (is_mission_complete("factory_sh_oil")) and (is_mission_complete("docks_stronghold_ware")) and (is_mission_complete("docks_sh_peninsula")) and (is_mission_complete("barrio_stronghold")) and is_mission_complete("lc09")) then
		mission_unlock("lc10")
	end
end

function tss01_init()
	if (is_compressed_prologue()) then
		mission_add("tss01", "tss01_unlock", "tss01_cleanup", "mission_start_tss01", "tss01_start", "radar_genstarta", TSS01_CASH_REWARD, 500, MISSION_01_REQUIRED_PROPS, "tss01_success")
	else
		mission_add("tss01", "tss01_unlock", "tss01_cleanup", "mission_start_tss01", "tss01_start", "radar_genstarta", TSS01_CASH_REWARD, TSS01_RESPECT_REWARD, MISSION_01_REQUIRED_PROPS, "tss01_success")
	end
end

function tss01_main()
end

function tss01_unlock()
end

function tss01a_init()
	if (is_compressed_prologue()) then
		mission_add("tss01a", "tss01a_unlock", "tss01a_cleanup", "mission_start_tss01a", "tss01a_start", "radar_genstarta", 1000, 500, 0, "tss01a_success")	
	else
		mission_add("tss01a", "tss01a_unlock", "tss01a_cleanup", "mission_start_tss01a", "tss01a_start", "radar_genstarta", 500, 500, 0, "tss01a_success")
	end
end

function loop_tss01a()
	while (not is_mission_complete("tss01a")) do
		delay(10)
		Tss01a_cellphone_active = true
		
		if (cellphone_has_received_call(PHONECALL_TSS01A)) then
			return
		end
		
		cellphone_register("tss01a_cellphone")
		audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "JULIUS_BUYCLOTH_1", "Julius", false, "", "tss01a_cellphone")
		
		while (Tss01a_cellphone_active or is_mission_active("tss01a")) do
			delay(10)
		end
	end
end

function tss01a_main()
	while not is_mission_complete("tss01") do
		thread_yield()
	end
	
	while not is_mission_active("tss01a") do
		thread_yield()
	end
	
	if (not is_mission_complete("tss01a")) then
		mission_waypoint_add("saintsrow_church1_gps")
	end
end

function tss01a_cellphone()
	Tss01a_cellphone_active = false
	mission_start( "tss01a" )	
	cellphone_receive_call(PHONECALL_TSS01A)
end

function tss01a_unlock()
	if (is_mission_complete("tss01")) then
		mission_unlock("tss01a")
		return
	end	
end

function tss02_init()
	mission_add("tss02", "tss02_unlock", "tss02_cleanup", "mission_start_tss02", "tss02_start", "radar_genstarta", 0, 0, TSS_REQUIRED_PROPS, "tss02_success")
	--mission_add_silent("tss02a", "tss_main_story_intro", "tss02a_success", "mission_start_tss02a")
end

Waypoint_thread = -1

function tss02_activity_call()

end

function tss02_cellphone()
	cellphone_receive_call(PHONECALL_TSS02_MAIN_JULIUS)
	mission_waypoint_add("saintsrow_church1_gps")
	mission_unlock( "tss02" )
end

function tss02_stronghold_call()
--	mission_waypoint_add("saintsrow_stronghold_gps")
	cellphone_receive_call(PHONECALL_TSS02_STRONGHOLD)
	tutorial_start("respect_filled", 500, true)
end

function tss02_waypoints()
	if (not activity_cutscene_has_played("tss_theft")) then
		mission_waypoint_add("saintsrow_theft_gps")
	end
	
	while (not activity_cutscene_has_played("tss_theft")) do
		thread_yield()
	end
		
	if (not activity_cutscene_has_played("tss_pimp01")) then
		mission_waypoint_add("saintsrow_pimping_gps")
	end
	
	while (not activity_cutscene_has_played("tss_pimp01")) do
		thread_yield()
	end
	
	mission_waypoint_remove()
	Waypoint_thread = -1
end

tss02_respect_thread = -1

function tss02_respect_reminder()
	delay(120)
	while (is_mission_active()) do
		thread_yield()
	end
	
	while ((props_get("saints") < TSS_REQUIRED_PROPS) and not stronghold_is_player_controlled("saintsrow_stronghold")) do
		mission_help_table_nag("tss01_repeat_respect")
		delay(7)
		mission_help_table_nag("tss01_repeat_respect_2")
		delay(120)
		while (is_mission_active()) do
			thread_yield()
		end
	end
end

function tss02_respect_reminder2()
	delay(120)
	while (is_mission_active()) do
		thread_yield()
	end
	while (not is_mission_complete("tss02") and (props_get("saints") < TSS_REQUIRED_PROPS)) do
		mission_help_table_nag("tss01_repeat_respect2")
		delay(120)
		while (is_mission_active()) do
			thread_yield()
		end
	end
end

function tss02_activity_cell()
	
	cellphone_receive_call(PHONECALL_TSS02_ACTIVITY)
	mission_unlock("tss_pimp01")
	--mission_unlock("tss_theft")
	mission_unlock("tss_demo_derby")
	mission_unlock("lc_chop01")
	mission_unlock("lc_drug01")
	mission_unlock("lc_escort01")
	mission_unlock("lc_fraud01")
	mission_unlock("lc_hijack01")
	mission_unlock("lc_hitman01")
	mission_unlock("lc_pimp01")
	mission_unlock("lc_racing01")
	--mission_unlock("lc_theft")
	mission_unlock("lc_vandal01")
	mission_unlock("vk_chop01")
	mission_unlock("vk_drug01")
	mission_unlock("vk_escort01")
	mission_unlock("vk_fraud01")
	mission_unlock("vk_hijack01")
	mission_unlock("vk_hitman01")
	mission_unlock("vk_pimp01")
	mission_unlock("vk_racing01")
	--mission_unlock("vk_theft")
	mission_unlock("vk_vandal01")
	mission_unlock("wr_chop01")
	mission_unlock("wr_drug01")
	mission_unlock("wr_escort01")
	mission_unlock("wr_fraud01")
	mission_unlock("wr_hijack01")
	mission_unlock("wr_hitman01")
	mission_unlock("wr_pimp01")
	mission_unlock("wr_racing01")
	--mission_unlock("wr_theft")
	mission_unlock("wr_vandal01")
	loan_unlock(true)
	tagging_unlock()
	hostage_unlock()
	tutorial_start("respect", 3000, true)
	
	tutorial_start("waypoint", 6000, true)
	delay(7)
	pause_menu_objective_force_show()
	mission_help_table("tss01_repeat_respect")
	delay(7)
	mission_help_table_nag("tss01_repeat_respect_2")
		
	tss02_respect_thread = thread_new("tss02_respect_reminder")

end

function tss02_unlock_reminder()
	delay(120)
	while (is_mission_active()) do
		thread_yield()
	end
	while (not stronghold_is_player_controlled("saintsrow_stronghold")) do
		mission_help_table_nag("tss01_repeat_stronghold")
		delay(120)
		while (is_mission_active()) do
			thread_yield()
		end
	end
end

function tss02_main_troy_cellphone()
	cellphone_receive_call(PHONECALL_TSS02_MAIN_TROY)
end

function tss02_main()
	Waypoint_thread = -1
	if (is_mission_unlocked("tss02")) then
		if (not is_mission_complete("tss02")) then
			mission_waypoint_add("saintsrow_church1_gps")
		end
		return
	end
	
	if (not is_mission_unlocked("tss_pimp01")) then
		while (not is_mission_complete("tss01a")) do
			delay(1)
		end
		
		if (cellphone_has_received_call(PHONECALL_TSS02_ACTIVITY)) then
			return
		end
		
		delay(6)
		cellphone_register("tss02_activity_cell")
		pause_menu_objective_force_show()
		audio_play_for_cellphone("SYS_CELL_RING", 3, 1.5, 0.75, "JULIUS_3SS1_PHONE", "Julius", false, "", "tss02_activity_cell")
	end	
	
	if (not (stronghold_is_player_controlled("saintsrow_stronghold"))) then
		while (props_get("saints") < TSS_REQUIRED_PROPS) do
			thread_yield()
		end
		while (is_mission_active()) do
			thread_yield()
		end
		thread_kill(tss02_respect_thread)
		tss02_respect_thread = -1
		
		delay(4)
		
		if (cellphone_has_received_call(PHONECALL_TSS02_STRONGHOLD)) then
			return
		end
		
		cellphone_register("tss02_stronghold_call")
		audio_play_for_cellphone("SYS_CELL_RING", 3, 1.5, 0.75, "TROY_STRONGHOLD_1", "Troy", false, "", "tss02_stronghold_call")
		thread_new("tss02_unlock_reminder")
	end
		
	while not (stronghold_is_player_controlled("saintsrow_stronghold")) do
		thread_yield()
	end
	
	cellphone_remove("TROY_STRONGHOLD_1")
	
	if (props_get("saints") < TSS_REQUIRED_PROPS) then
		while (is_mission_active()) do
			thread_yield()
		end
		delay(5)

		if (cellphone_has_received_call(PHONECALL_TSS02_MAIN_TROY)) then
			return
		end
	
		pause_menu_objective_force_show()
		cellphone_register("tss02_main_troy_cellphone")
		audio_play_for_cellphone("SYS_CELL_RING", 3, 1.5, 0.75, "TROY_STRHOLD_COMPLETE_1", "Troy", false, "", "tss02_main_troy_cellphone")
		
		thread_new("tss02_respect_reminder2")
	end
	
	while (props_get("saints") < TSS_REQUIRED_PROPS) do
		thread_yield()
	end
	
	cellphone_remove("TROY_STRHOLD_COMPLETE_1")
	
	delay(5)
	
	if (cellphone_has_received_call(PHONECALL_TSS02_MAIN_JULIUS)) then
		return
	end
	
	cellphone_register("tss02_cellphone")
	pause_menu_objective_force_show()
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "JULIUS_3SS2_PHONE_1", "Julius", false, "", "tss02_cellphone")
end

function tss02_unlock()
	if (stronghold_is_player_controlled("saintsrow_stronghold")) then
		mission_unlock("tss02")
	end	
end

function tss02a_success()
	mission_unlock("tss_pimp01")
	mission_unlock("tss_demo_derby")
	mission_unlock("lc_chop01")
	mission_unlock("lc_drug01")
	mission_unlock("lc_escort01")
	mission_unlock("lc_fraud01")
	mission_unlock("lc_hijack01")
	mission_unlock("lc_hitman01")
	mission_unlock("lc_pimp01")
	mission_unlock("lc_racing01")
	mission_unlock("lc_vandal01")
	mission_unlock("vk_chop01")
	mission_unlock("vk_drug01")
	mission_unlock("vk_escort01")
	mission_unlock("vk_fraud01")
	mission_unlock("vk_hijack01")
	mission_unlock("vk_hitman01")
	mission_unlock("vk_pimp01")
	mission_unlock("vk_racing01")
	mission_unlock("vk_vandal01")
	mission_unlock("wr_chop01")
	mission_unlock("wr_drug01")
	mission_unlock("wr_escort01")
	mission_unlock("wr_fraud01")
	mission_unlock("wr_hijack01")
	mission_unlock("wr_hitman01")
	mission_unlock("wr_pimp01")
	mission_unlock("wr_racing01")
	mission_unlock("wr_vandal01")
	--loan_unlock(true)
	hostage_unlock()
	tagging_unlock()
	
	cellphone_remove("JULIUS_3SS1_PHONE")
	cellphone_remove("JULIUS_3SS2_PHONE_1")
	cellphone_remove("TROY_STRONGHOLD_1")
	cellphone_remove("TROY_STRHOLD_COMPLETE_1")
	
	--teleport("#PLAYER#", "mission_start_tss02a")
	mission_set_next_props_req( "playas", MISSION_REQUIRED_PROPS )
	
	tutorial_start("explore", 20*1000, true)
end

function tss03_init()
	mission_add("tss03", "tss03_unlock", "tss03_cleanup", "mission_start_tss03", "tss03_start", "radar_genstarta", 3000, 0, 0, "tss03_success")
end


function tss03_main()
	if (is_mission_unlocked("tss03")) then
		yacht_set_state(1)
		return
	end
	
	while (not is_mission_complete("wr09") or (get_hood_owned_percentage() < 1.0)) do
		thread_yield()
	end
	cutscene_in("tss_final01")
	
	cutscene_play("tss_final01", true)
	teleport("#PLAYER#", "mission_start_tss03")
	credits_abbr_roll()
	yacht_set_state(1)
	mission_unlock("tss03")
end

function tss03_unlock()
end

function tss04_init()
	mission_add("tss04", "tss04_unlock", "tss04_cleanup", "mission_start_tss03", "tss04_start", "radar_genstarta", 5000, 0, 0, "tss04_success")
end

function tss04_main()
end

function tss04_unlock()
	if (is_mission_complete("tss03")) then 
		mission_unlock("tss04")
	end
end

function tss05_init()
	mission_add("tss05", "tss05_unlock", "tss05_cleanup", "mission_start_tss05", "tss05_start", "radar_genstarta", 0, 0, 0, "tss05_success")
end

function tss05_main()
	while not (is_mission_complete("tss04")) do
		delay(10)
	end
	
	if (cellphone_has_received_call(PHONECALL_TSS05)) then
		return
	end
	
	cellphone_register("tss05_cellcall")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "HUGHES_3SS5_PHONE_1", "Hughes", false, "", "tss05_cellcall")
end

function tss05_cellcall()
	cellphone_receive_call(PHONECALL_TSS05)
	mission_unlock("tss05")
end

function tss05_unlock()
end

function vk01_init()
	mission_add("vk01", "vk01_unlock", "vk01_cleanup", "mission_start_vk01", "vk01_start", "radar_genstarta", 0, VK1_PROPS_REWARD, MISSION_REQUIRED_PROPS, "vk01_success")
end

function vk01_cellphone()
	cellphone_receive_call(PHONECALL_VK01)
end

function vk01_main()
	if (is_mission_complete("vk01")) then
		return
	end
	
	while (not is_mission_complete("tss02")) do
		delay(10)
	end
	
	while (props_get("saints") < TSS_REQUIRED_PROPS) do
		delay(10)
	end
	
	if (cellphone_has_received_call(PHONECALL_VK01)) then
		return
	end
	
	delay(15)
	if (not is_mission_complete("vl01")) then
		cellphone_register("vk01_cellphone")
		audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "VK intro phone call", "Gat", false, "", "vk01_cellphone")
	end
end

function vk01_unlock()
	if (is_mission_complete("tss02")) then
		mission_unlock("vk01")
	end
end

function vk02_init()
	mission_add("vk02","vk02_unlock","vk02_cleanup","mission_start_vk02","vk02_start","radar_genstarta.tga", 0, VK02_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk02_success")
end

function vk02_main()
end

function vk02_unlock()
	if (is_mission_complete("vk01")) then
		mission_unlock("vk02")
	end
end

function vk03a_test_anim(char,anim)
	while (true) do
		play_custom_action( char, anim )
	end
end

function vk03a_test_anims()
	local BROTHEL_THUG_NAMES = {"vk03a_thug_behind","vk03a_thug_bj",
								"vk03a_thug_girls","vk03a_thug_bed"}
								
	local BROTHEL_HO_NAMES = {"vk03a_stripper_behind","vk03a_stripper_bj",
								"vk03a_stripper_girls","vk03a_stripper_bed"}

	local SEX_HO_ANIMS = {"pfl1_bs_sx_strtl.animx", "pfl1_bs_bj_strtl.animx", "pfl1_bs_he_give_strtl.animx", "PFL1_BS_SP_Strtl_B.animx"}
	local SEX_THUG_ANIMS = {"pml1_bs_sx_strtl.animx", "pml1_bs_bj_strtl.animx", "pfl1_bs_he_get_strtl.animx", "pml1_bs_sp_strtl.animx"}

	for i,blah in pairs(BROTHEL_THUG_NAMES) do
		local thug = BROTHEL_THUG_NAMES[i]
		local ho = BROTHEL_HO_NAMES[i]
		local thuganim = SEX_THUG_ANIMS[i]
		local hoanim = SEX_HO_ANIMS[i]
	
		thread_new("vk03a_test_anim", thug, thuganim)
		thread_new("vk03a_test_anim", ho, hoanim)
	end
end

function vk03a_init()
	mission_add("vk03a", "vk03a_unlock", "vk03a_cleanup", "mission_start_vk03a", "vk03a_start", "radar_genstarta.tga", 0, VK3a_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk03a_success")
end

function vk03a_main()
end

function vk03a_unlock()
	if (is_mission_complete("vk02")) then
		mission_unlock("vk03a")
	end
end

function vk04a_init()
	mission_add("vk04a", "vk04a_unlock", "vk04a_cleanup", "mission_start_vk04a", "vk04a_start", "radar_genstarta", 1000, VK04a_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk04a_success")	
end

function vk04a_main()
end

function vk04a_unlock()
	if (is_mission_complete("vkx")) then
		mission_unlock("vk04a")
	end
end

function vk05_init()
	mission_add("vk05","vk05_unlock","vk05_cleanup","mission_start_vk05","vk05_start","radar_genstarta", 0, VK05_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk05_success")
end

function vk05_main()
	if (is_mission_complete("vk05")) then
		door_lock("g_02grns_meshmver01", false)
		door_lock("g_03grns_meshmver02", false)
	end
end

function vk05_unlock()
	if (is_mission_complete("vk04a")) then
		mission_unlock("vk05")
	end
end

function vk06a_init()
	mission_add("vk06a", "vk06a_unlock", "vk06a_cleanup", "mission_start_vk06a", "vk06a_start", "radar_genstarta.tga", 0, VK6a_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk06a_success")
end

function vk06a_main()
end

function vk06a_unlock()
	if ( is_mission_complete("vk05")) then
		mission_unlock("vk06a")
	end
end

function vk06b_init()
	mission_add("vk06b", "vk06b_unlock", "vk06b_cleanup", "mission_start_vk06b", "vk06b_start", "radar_genstarta.tga", 0, VK6b_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk06b_success")
end

function vk06b_main()
end

function vk06b_unlock()
	if ( is_mission_complete("vk06a")) then
		mission_unlock("vk06b")
	end
end

function vk07_init()
	mission_add("vk07", "vk07_unlock", "vk07_cleanup", "mission_start_vk07", "vk07_start", "radar_genstarta.tga", 0, VK07_PROPS_REWARD, MISSION_REQUIRED_PROPS,"vk07_success")
end

function vk07_main()
end

function vk07_unlock()
	if (is_mission_complete("vk06b")) then
		mission_unlock("vk07")
	end
end

function vk08_init()
	mission_add("vk08", "vk08_unlock", "vk08_cleanup", "mission_start_vk08", "vk08_start", "radar_genstarta", 0, VK08_PROPS_REWARD, MISSION_REQUIRED_PROPS, "vk08_success")
end

function vk08_main()
end

function vk08_unlock()
	if (is_mission_complete("vk07")) then
		mission_unlock("vk08")
	end
end

function vk09_init()
	mission_add("vk09","vk09_unlock","vk09_cleanup","mission_start_vk09","vk09_start","radar_genstarta", 0, VK09_PROPS_REWARD, MISSION_REQUIRED_PROPS, "vk09_success")
end

function vk09_main()
	if (is_mission_complete("vk09")) then
		-- enable zee penthaus triggers
		trigger_enable("downtown_$crib_warp_garage")
		trigger_enable("downtown_$crib_warp_front")
		trigger_enable("downtown_$crib_warp_penthouse")
		-- hook up zee teleportination
		on_trigger("teleport_to_penthouse","downtown_$crib_warp_garage")
		on_trigger("teleport_to_penthouse","downtown_$crib_warp_front")
		on_trigger("teleport_to_front","downtown_$crib_warp_penthouse")
		-- set up zee eff ecks
		ingame_effect_add_trigger("downtown_$crib_warp_penthouse", INGAME_EFFECT_LOCATION)
		ingame_effect_add_trigger("downtown_$crib_warp_garage", INGAME_EFFECT_LOCATION)
		ingame_effect_add_trigger("downtown_$crib_warp_front", INGAME_EFFECT_LOCATION)
	end
end

function vk09_unlock()	
	if (is_mission_complete("vksuburb_sh_grocery") and is_mission_complete("redlight_sh_rooftop") and is_mission_complete("projects_sh_loft") and is_mission_complete("projects_police") and is_mission_complete("downtown_sh_parking") and is_mission_complete("vk08")) then
		mission_unlock("vk09")
	end
end

function vkx_init()
	mission_add_triggerless("vkx", "vkx_unlock", "vkx_cleanup", "vkx_start", 1500, VKX_PROPS_REWARD, 0, "vkx_success")
	--on_props_trigger("vkx_props_reached",1100,"vice_kings")
end

function main_vkx()
	if (is_mission_complete("vkx")) then
		return
	end
	
	while not is_mission_complete("vk03a") do
		thread_yield()
	end
	
	delay(25)
	local vk_territory = false
	
	while (true) do
		local hood = get_current_hood_by_position( "#PLAYER#" )
		vk_territory = ((hood == "vk_redlight01") or (hood == "vk_redlight02") or (hood == "vk_redlight03"))
		
		if (not vk_territory) then
			break
		end
		
		delay(5)
	end
	mission_unlock("vkx")
	
	cellphone_register("cellphone_vkx_cellphone_end")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "","Gat", false, "cellphone_vkx_cellphone_end", "")
end

function vkx_main()
	thread_new("main_vkx")
end

function vkx_unlock()
end

function cellphone_vkx_cellphone_end()
	mission_start( "vkx" )
	while (is_mission_active("vkx")) do
		thread_yield()
	end
	
	thread_new("main_vkx")
end

function wr01_init()
	mission_add("wr01", "wr01_unlock", "wr01_cleanup", "mission_start_wr01", "wr01_start", "radar_genstarta.tga", 500, Wr01_respect_reward, MISSION_REQUIRED_PROPS, "wr01_success")
end

function wr01_got_cellphone()
	cellphone_receive_call(PHONECALL_WR01)
end

function wr01_main()
	if (is_mission_complete("wr01")) then
		return
	end
	
	while (not is_mission_complete("tss02")) do
		delay(10)
	end
	
	while (props_get("saints") < TSS_REQUIRED_PROPS) do
		delay(10)
	end
	
	delay(20)
	--cellphone_register("wr01_cellphone")
	
	if (cellphone_has_received_call(PHONECALL_WR01)) then
		return
	end
	
	cellphone_register("wr01_got_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "LIN_WR1_PHONE1_1", "Lin", false, "", "wr01_got_cellphone")
end

wr01_phone_played = false
function wr01_cellphone()
	mission_unlock("wr01")
	wr01_phone_played = true
end

function wr01_unlock()
	if (is_mission_complete("tss02")) then
		mission_unlock("wr01")
	end
end

function wr02_init()
	mission_add("wr02", "wr02_unlock", "wr02_cleanup", "mission_start_wr02", "wr02_start", "radar_genstarta.tga", Wr02_cash_reward, Wr02_respect_reward, MISSION_REQUIRED_PROPS, "wr02_success")
end

wr02_phone_played = false
function wr02_unlock()
	if (wr02_phone_played) then
		mission_unlock("wr02")
	end
end

function wr02_cellphone()
	mission_unlock("wr02")
	wr02_phone_played = true
	cellphone_receive_call(PHONECALL_WR02)
end

function wr02_main()
	if (is_mission_unlocked("wr02")) then
		return
	end
	
	while (not is_mission_complete("wr01")) do
		delay(10)
	end
	
	delay(20)
	
	if (cellphone_has_received_call(PHONECALL_WR02)) then
		return
	end
	
	cellphone_register("wr02_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "LIN_WR2_PHONE1_1", "Lin", false, "", "wr02_cellphone")
end

function wr03_init()
	mission_add("wr03","wr03_unlock","wr03_cleanup","mission_start_wr03","wr03_start","radar_genstarta.tga", 0, Wr03_respect_reward, MISSION_REQUIRED_PROPS,"wr03_success")
end

wr03_phone_played = false
function wr03_unlock()
	if (wr03_phone_played) then
		mission_unlock("wr03")
	end
end

function wr03_cellphone()
	mission_unlock("wr03")
	wr03_phone_played = true
	cellphone_receive_call(PHONECALL_WR03)
end

function wr03_main()
	if (is_mission_unlocked("wr03")) then
		return
	end
	
	while (not is_mission_complete("wr02")) do
		delay(10)
	end
	
	delay(5)
	
	if (cellphone_has_received_call(PHONECALL_WR03)) then
		return
	end
	
	cellphone_register("wr03_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "LIN_WR3_PHONE1_1", "Lin", false, "", "wr03_cellphone")
end

function wr04_init()
	mission_add("wr04","wr04_unlock","wr04_cleanup","mission_start_wr04","wr04_start","radar_genstarta.tga", 1500, Wr04_respect_reward, MISSION_REQUIRED_PROPS,"wr04_success")
end

function wr04_main()
end

wr04_phone_played = false
function wr04_unlock()
	if (wr04_phone_played) then
		mission_unlock("wr04" )
	end
end

function wr04_cellphone()
	mission_unlock("wr04")
	wr04_phone_played = true
	cellphone_receive_call(PHONECALL_WR04)
end

function wr04_main()
	if (is_mission_unlocked("wr04")) then
		return
	end
	
	while (not is_mission_complete("wr03")) do
		delay(10)
	end
	
	delay(5)
	
	if (cellphone_has_received_call(PHONECALL_WR04)) then
		return
	end
	
	cellphone_register("wr04_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "LIN_WR4_PHONE1_1", "Lin", false, "", "wr04_cellphone")
end

function wr05_init()
	mission_add("wr05","wr05_unlock","wr05_cleanup","mission_start_wr05","wr05_start","radar_genstarta.tga", 2000, Wr05_respect_reward, MISSION_REQUIRED_PROPS,"wr05_success")
end

wr05_phone_played = false
function wr05_unlock()
	if (is_mission_complete("wr04")) then
		mission_unlock("wr05" )
	end
end

function wr05_cellphone()
	wr05_phone_played = true
end

function wr05_main()
end

function wr06_init()
	mission_add("wr06","wr06_unlock","wr06_cleanup","mission_start_wr06","wr06_start", "radar_genstarta.tga", 0, Wr06_respect_reward, MISSION_REQUIRED_PROPS,"wr06_success")
end

function wr06_unlock()
	if (is_mission_complete("wr05")) then
		mission_unlock("wr06")
	end
end

function wr07_init()
	mission_add("wr07","wr07_unlock","wr07_cleanup","mission_start_wr07","wr07_start","radar_genstarta.tga", 3000, Wr07_respect_reward, 0, "wr07_success")
end

function wr07_unlock()
	if (is_mission_complete("wr06")) then
		mission_unlock("wr07")
	end
end

function wr08_init()
	mission_add("wr08","wr08_unlock","wr08_cleanup","mission_start_wr08","wr08_start","radar_genstarta.tga", 4000, Wr08_respect_reward, MISSION_REQUIRED_PROPS, "wr08_success")
end

function wr08_unlock()
	if is_mission_complete("wr07") then
		mission_unlock("wr08")
	end
end

function wr09_init()
	mission_add("wr09","wr09_unlock","wr09_cleanup","mission_start_wr09","wr09_start","radar_genstarta", 5000, Wr09_respect_reward, MISSION_REQUIRED_PROPS, "wr09_success")

	if (is_mission_complete("wr09")) then
		parking_spot_enable("parking_c$parking076") -- enable Price semi truck parking spawn; coords -187 21 405
	end
end

wr09_phone_played = false
function wr09_unlock()
	if (wr09_phone_played) then
		mission_unlock("wr09")
	end
end

function wr09_cellphone()
	mission_unlock("wr09")
	wr09_phone_played = true
	cellphone_receive_call(PHONECALL_WR09)
end

function wr09_main()
	if (is_mission_unlocked("wr09")) then
		return
	end
	
	while ((not is_mission_complete("wrsuburb_stronghold_apart")) or (not is_mission_complete("wrsuburb_stronghold_price")) or (not is_mission_complete("racetrack_stronghold_store")) or (not is_mission_complete("truckyard_stronghold")) or (not is_mission_complete("wr08"))) do
		delay(10)
	end
	
	if (cellphone_has_received_call(PHONECALL_WR09)) then
		return
	end
	
	cellphone_register("wr09_cellphone")
	audio_play_for_cellphone("SYS_CELL_RING", 4, 1.5, 0.75, "PRICE_WR9_PHONE_1", "Price", false, "", "wr09_cellphone")
end



------------------------------------------------
-- STRONGHOLDS ---------------------------------
------------------------------------------------

-- prop rewards --
REDLIGHT_SH_PROPS_REWARD = 0
PROJECTS_SH_POLICE_PROPS_REWARD = 0
PROJECTS_SH_LOFT_PROPS_REWARD = 0
DOWNTOWN_SH_PARKING_PROPS_REWARD = 0
VKSUBURB_SH_GROCERY_PROPS_REWARD = 0
WRSUBURB_SH_PRICE_PROPS_REWARD = 0
WRSUBURB_SH_APT_PROPS_REWARD = 0
ARENA_SH_STORAGE_PROPS_REWARD = 0
TRUCKYARD_SH_PROPS_REWARD = 0
BARRIO_SH_POWER_PROPS_REWARD = 0
FACTORY_SH_OIL_PROPS_REWARD = 0
FACTORY_SH_STEEL_PROPS_REWARD = 0
DOCKS_SH_PENINSULA_PROPS_REWARD = 0
DOCKS_SH_WAREHOUSE_PROPS_REWARD = 0
SAINTSROW_SH_PROPS_REWARD = 0

stronghold_set_awards("redlight_sh_rooftop", 0, REDLIGHT_SH_PROPS_REWARD)
stronghold_set_awards("projects_police", 0, PROJECTS_SH_POLICE_PROPS_REWARD)
stronghold_set_awards("projects_sh_loft", 0, PROJECTS_SH_LOFT_PROPS_REWARD)
stronghold_set_awards("downtown_sh_parking", 0, DOWNTOWN_SH_PARKING_PROPS_REWARD)
stronghold_set_awards("vksuburb_sh_grocery", 0, VKSUBURB_SH_GROCERY_PROPS_REWARD)
stronghold_set_awards("wrsuburb_stronghold_price", 0, WRSUBURB_SH_PRICE_PROPS_REWARD)
stronghold_set_awards("wrsuburb_stronghold_apart", 0, WRSUBURB_SH_APT_PROPS_REWARD)
stronghold_set_awards("racetrack_stronghold_store", 0, ARENA_SH_STORAGE_PROPS_REWARD)
stronghold_set_awards("truckyard_stronghold", 0, TRUCKYARD_SH_PROPS_REWARD)
stronghold_set_awards("barrio_stronghold", 0, BARRIO_SH_POWER_PROPS_REWARD)
stronghold_set_awards("factory_sh_oil", 0, FACTORY_SH_OIL_PROPS_REWARD)
stronghold_set_awards("factory_sh_steel", 0, FACTORY_SH_STEEL_PROPS_REWARD)
stronghold_set_awards("docks_stronghold_ware", 0, DOCKS_SH_WAREHOUSE_PROPS_REWARD)
stronghold_set_awards("docks_sh_peninsula", 0, DOCKS_SH_PENINSULA_PROPS_REWARD)

-- required props --
REDLIGHT_SH_REQUIRED_PROPS = MISSION_REQUIRED_PROPS				-- Vice Kings
PROJECTS_SH_POLICE_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
PROJECTS_SH_LOFT_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
DOWNTOWN_SH_PARKING_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
VKSUBURB_SH_GROCERY_REQUIRED_PROPS = MISSION_REQUIRED_PROPS

WRSUBURB_SH_PRICE_REQUIRED_PROPS = MISSION_REQUIRED_PROPS		-- Westside Rollers
WRSUBURB_SH_APT_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
ARENA_SH_STORAGE_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
TRUCKYARD_SH_REQUIRED_PROPS = MISSION_REQUIRED_PROPS

BARRIO_SH_POWER_REQUIRED_PROPS = MISSION_REQUIRED_PROPS			-- Los Carnales
FACTORY_SH_OIL_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
FACTORY_SH_STEEL_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
DOCKS_SH_PENINSULA_REQUIRED_PROPS = MISSION_REQUIRED_PROPS
DOCKS_SH_WAREHOUSE_REQUIRED_PROPS = MISSION_REQUIRED_PROPS

SAINTSROW_SH_REQUIRED_PROPS = TSS_REQUIRED_PROPS					-- Saint's Row



