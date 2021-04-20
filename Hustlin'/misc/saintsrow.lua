Saintsrow_strong_path = {"saintsrow_$n_strong_cpath0000", "saintsrow_$n_strong_cpath0001", "saintsrow_$n_strong_cpath0002", "saintsrow_$n_strong_cpath0003",
								"saintsrow_$n_strong_cpath0004", "saintsrow_$n_strong_cpath0005", "saintsrow_$n_strong_cpath0006", "saintsrow_$n_strong_cpath0007",
								"saintsrow_$n_strong_cpath0008", "saintsrow_$n_strong_cpath0009", "saintsrow_$n_strong_cpath0010", "saintsrow_$n_strong_cpath0011",
								"saintsrow_$n_strong_cpath0012", "saintsrow_$n_strong_cpath0013", "saintsrow_$n_strong_cpath0014", "saintsrow_$n_strong_cpath0015",
								"saintsrow_$n_strong_cpath0016", "saintsrow_$n_strong_cpath0017", "saintsrow_$n_strong_cpath0018", "saintsrow_$n_strong_cpath0019",
								"saintsrow_$n_strong_cpath0020", "saintsrow_$n_strong_cpath0021", "saintsrow_$n_strong_cpath0022", "saintsrow_$n_strong_cpath0023",
								"saintsrow_$n_strong_cpath0024", "saintsrow_$n_strong_cpath0025", "saintsrow_$n_strong_cpath0026", "saintsrow_$n_strong_cpath0027",
								"saintsrow_$n_strong_cpath0028", "saintsrow_$n_strong_cpath0029", "saintsrow_$n_strong_cpath0030", "saintsrow_$n_strong_cpath0031"}

SAINTSROW_STRONG_FRONTDOOR = "MiniSH_sr01MeshMoverA01"
SAINTSROW_STRONG_MIDDOOR = "MiniSH_sr01MeshMoverC01"
SAINTSROW_STRONG_BACKDOOR = "MiniSH_sr01MeshMoverB02"

Saintsrow_strong_timer_on = false
Saintsrow_strong_walk_thread = -1
Saintsrow_strong_pf_thread = -1
Saintsrow_strong_left_area = false

function saintsrow_init()
	--on_stronghold_takeover_init("saintsrow_stronghold_init", "saintsrow_$s0000")
	--on_stronghold_takeover_start("saintsrow_stronghold_start", "saintsrow_$s0000")
	
	stronghold_disable("saintsrow_stronghold")
	on_stronghold_takeover_start("saintsrow_stronghold_start", "saintsrow_stronghold")
	stronghold_set_cost( "saintsrow_stronghold",  TSS_REQUIRED_PROPS)
	if (is_compressed_prologue()) then
		stronghold_set_awards("saintsrow_stronghold", 200, 500)
	else
		stronghold_set_awards("saintsrow_stronghold", 0, SAINTSROW_SH_PROPS_REWARD) 
	end
	
	trigger_disable("saintsrow_leave_door")
	trigger_disable("saintsrow_leave_door2")
	on_trigger("", "saintsrow_leave_door")
	on_trigger("", "saintsrow_leave_door2")
	on_death("", "saintsrow_$c0000")
	
	player_creation_set_opening()
end

function saintsrow_stronghold_success()
	hood_set_owner("ts_saintsrow03", "Playas")
	trigger_enable("saintsrow_save")
	-- props_add("saints", 100) -- AM 1/16/06:  taken care of with stronghold_set_awards() call currently residing in redlight.lua
	--mission_set_next_props_req( "saints", 1000 )
end

function saintsrow_stronghold_win()
	distance_display_off()
	remove_marker_npc("saintsrow_$c0000")
	delay(3)
	release_to_world("saintsrow_strong_chaseguy")
	stronghold_takeover_success()
end

function saintsrow_stronghold_init()
	--on_trigger("saintsrow_stronghold_start", "saintsrow_strong_start")
	
	door_close(SAINTSROW_STRONG_FRONTDOOR)
	door_close(SAINTSROW_STRONG_MIDDOOR)
	door_close(SAINTSROW_STRONG_BACKDOOR)
	--saintsrow_stronghold_start()
end

function saintsrow_stronghold_reset()
	distance_display_off()
	hud_timer_stop()
	
	door_close(SAINTSROW_STRONG_FRONTDOOR)
	door_close(SAINTSROW_STRONG_MIDDOOR)
	door_close(SAINTSROW_STRONG_BACKDOOR)
	set_unjackable_flag("saintsrow_strong_chase_car", false)
	
	remove_marker_npc("saintsrow_$c0000")
	ingame_effect_remove_navpoint("saintsrow_strong_start")
	
	notoriety_reset("los_carnales")
	
	if (Saintsrow_strong_pf_thread > -1) then
		thread_kill(Saintsrow_strong_pf_thread)
		Saintsrow_strong_pf_thread = -1
	end
	
	if (Saintsrow_strong_walk_thread > -1) then
		thread_kill(Saintsrow_strong_walk_thread)
		Saintsrow_strong_walk_thread = -1
	end
	
	trigger_disable("saintsrow_leave_door")
	trigger_disable("saintsrow_leave_door2")
	on_trigger("", "saintsrow_leave_door")
	on_trigger("", "saintsrow_leave_door2")
	on_trigger("", "saintsrow_strong_chase2")
	on_take_damage("", "saintsrow_$c0000")
	
	on_door_opened("", SAINTSROW_STRONG_FRONTDOOR)
	
	on_death("", "saintsrow_$c0000")
	on_detection("", "saintsrow_$c0000")
	
	destroy_group("saintsrow_strong_chaseguy")
	destroy_group("saintsrow_strong_main")
	release_to_world("saintsrow_strong_car")
end

function saintsrow_stronghold_start_chase()
	Saintsrow_strong_left_area = true
end

function saintsrow_stronghold_fail()
	if (Saintsrow_strong_pf_thread > -1) then
		thread_kill(Saintsrow_strong_pf_thread)
		Saintsrow_strong_pf_thread = -1
	end
	
	distance_display_off()
	
	stronghold_takeover_failure("saintsrow_strong_lost")
end

function saintsrow_stronghold_car_pf()
	npc_prevent_flinching("saintsrow_$c0000", false)
	set_max_hit_points("saintsrow_$c0000", 800) 
	combat_enable("saintsrow_$c0000")
	vehicle_pathfind_to("saintsrow_strong_chase_car", Saintsrow_strong_path, true, false)
	vehicle_exit("saintsrow_$c0000")
	delay(0.1)
	attack("saintsrow_$c0000")
	forced_target_set("saintsrow_$c0000", "#PLAYER#") 
	Saintsrow_strong_pf_thread = -1
end

	
function saintsrow_stronghold_walk()
	move_to("saintsrow_$c0000", "saintsrow_chaseguy_walk", 1)
	move_to("saintsrow_$c0000", "saintsrow_strong_chase_dest1", 1)
	Saintsrow_strong_walk_thread = -1
end

function saintsrow_stronghold_cutscene()
	modal_begin()
	
	camera_look_through("saintsrow_camera2")
	
	npc_unholster_best_weapon("saintsrow_$c0000")
	npc_unholster_best_weapon("saintsrow_$c011")
	fade_in(1)
	delay(1)
	letterbox_fade_in()

	camera_look_through("saintsrow_camera2", 2.5)
	delay(0.2)
	audio_play_persona_line("saintsrow_$c0000", "misc - walk by ambient")
	
	delay(2.8)
	
	camera_look_through("saintsrow_camera4", 0)
	delay(2)
	
	camera_look_through("saintsrow_camera5", 0)
	delay(1)
	
	modal_end()
end

function saintsrow_stronghold_cutscene_abort()
	fade_out(0.75)
	delay(0.8)
	letterbox_fade_out()
	camera_end_script()

	
	
	thread_kill(Saintsrow_strong_walk_thread)
	Saintsrow_strong_walk_thread = -1
end

function saintsrow_stronghold_door_opened()
	attack("saintsrow_$c009", "#PLAYER#")
end

function saintsrow_cell()
	audio_play_for_cellphone_force( "SYS_CELL_RING", "TROY_STRONGHOLD_1" ) -- rings 2*, animates cell phone, and plays audio
	--cellphone_add_message("TROY_STRONGHOLD_1", "Troy")
end

function saintsrow_stronghold_start()
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "saintsrow_strong_start")
		fade_in( 0.5 )
	end
	
	--thread_new("saintsrow_cell")
	
	mission_waypoint_remove()
	Saintsrow_strong_timer_on = false
	Saintsrow_strong_walk_thread = -1
	
	--mission_force_notoriety("lc")
	notoriety_set_max("los_carnales", 1)
	stronghold_exit_trigger_enable()
	
	on_stronghold_reset("saintsrow_stronghold_reset", "saintsrow_stronghold")
	on_stronghold_takeover_success("saintsrow_stronghold_success", "saintsrow_stronghold") 
	
	Saintsrow_strong_left_area = false
	
	trigger_enable("saintsrow_leave_door")
	trigger_enable("saintsrow_leave_door2")
	on_trigger("saintsrow_stronghold_start_chase", "saintsrow_leave_door")
	on_trigger("saintsrow_stronghold_start_chase", "saintsrow_leave_door2")
	
	
	--player_controls_disable()
	create_group("saintsrow_strong_chaseguy", true)
	create_group("saintsrow_strong_main", true)
	create_group("saintsrow_strong_car", true)
	--player_controls_enable()
	
	add_marker_npc("saintsrow_$c0000", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	--teleport("saintsrow_$c0000", "saintsrow_strong_chase_dest2")
	
	--Saintsrow_strong_walk_thread = thread_new("saintsrow_stronghold_walk")

	door_open(SAINTSROW_STRONG_MIDDOOR)
	door_open(SAINTSROW_STRONG_BACKDOOR)
	
	on_door_opened("saintsrow_stronghold_door_opened", SAINTSROW_STRONG_FRONTDOOR)
	on_take_damage("saintsrow_stronghold_start_chase", "saintsrow_$c0000")
	
	--cutscene_in()
	--scripted_cutscene_play("saintsrow_stronghold_cutscene", "saintsrow_stronghold_cutscene_abort")
	--cutscene_out()

	combat_disable("saintsrow_$c0000")
	set_max_hit_points("saintsrow_$c0000", 5000)
	set_current_hit_points("saintsrow_$c0000", 5000)
	npc_prevent_flinching("saintsrow_$c0000", true)
	
	set_unjackable_flag("saintsrow_strong_chase_car", true)
	
	
	mission_help_table("saintsrow_strong_kill_leader") -- text: "Destroy all Vice King vehicles!"
	
	on_death("saintsrow_stronghold_win", "saintsrow_$c0000")
	
	while (not Saintsrow_strong_left_area) do
		thread_yield()
	end
	
	debug_message("start chase!!")
	on_take_damage("", "saintsrow_$c0000")
	trigger_disable("saintsrow_leave_door")
	trigger_disable("saintsrow_leave_door2")
	on_trigger("", "saintsrow_leave_door")
	on_trigger("", "saintsrow_leave_door2")
	
	mission_help_table("saintsrow_strong_chase_leader") -- text: "Destroy all Vice King vehicles!"
	
	audio_play_persona_line("saintsrow_$c0000", "voice - startled line", 3)
		
	--move_to("saintsrow_$c0000", "saintsrow_strong_nearcar", 2)
	
	set_unjackable_flag("saintsrow_strong_chase_car", false)
	vehicle_enter("saintsrow_$c0000", "saintsrow_strong_chase_car", 0)
		
	if (get_char_in_vehicle("saintsrow_strong_chase_car", 0) ~= "saintsrow_$c0000") then
		set_max_hit_points("saintsrow_$c0000", 500)
		combat_enable("saintsrow_$c0000")
		attack("saintsrow_$c0000")
		forced_target_set("saintsrow_$c0000", "#PLAYER#") 
	end
	
	if (is_vehicle_destroyed("saintsrow_strong_chase_car")) then
		set_max_hit_points("saintsrow_$c0000", 500) 
		combat_enable("saintsrow_$c0000")
		attack("saintsrow_$c0000")
		forced_target_set("saintsrow_$c0000", "#PLAYER#") 
	end
	
	set_unjackable_flag("saintsrow_strong_chase_car", true)
	vehicle_disable_chase("saintsrow_strong_chase_car", true)
	vehicle_disable_flee("saintsrow_strong_chase_car", true)
	
	stronghold_exit_trigger_disable()
	
	vehicle_speed_override("saintsrow_strong_chase_car", 65)
	
	Saintsrow_strong_pf_thread = thread_new("saintsrow_stronghold_car_pf")
	
	distance_display_on("saintsrow_$c0000", 0, 200, 0, 120) 
	
	while (not is_dead("saintsrow_$c0000")) do
		if (get_dist_char_to_char("#PLAYER#", "saintsrow_$c0000") > 60) then
			vehicle_speed_override("saintsrow_strong_chase_car", 40)
			delay(1)
		else
			vehicle_speed_override("saintsrow_strong_chase_car", 65)
			delay(1)
		end
		
		if (get_dist_char_to_char("#PLAYER#", "saintsrow_$c0000") > 120) then
			if (not Saintsrow_strong_timer_on) then
				mission_help_table("saintsrow_strong_losing_him")		
				hud_timer_set(30 * 1000, "saintsrow_stronghold_fail")
				Saintsrow_strong_timer_on = true
			end
		else
			hud_timer_stop()
			Saintsrow_strong_timer_on = false
		end
		
		thread_yield()
		
	end
	
	distance_display_off()
	--fade_in(1)
end

function saintsrow_main()
	--message("test saintsrow") -- test
	--teleport("#PLAYER#", "saintsrow_$player_start")
	
	open_player_creation()
	
	if (not is_mission_unlocked("tss01")) then
		player_controls_disable()
		if( not skip_intro_cutscene_do() ) then
			cutscene_in("tss_intro")
			cutscene_play("tss_intro", true)
		end

		fade_in(1)
		
		radio_post_event("NEWS_PRO_HIGHLEVELS", false)

		set_team("#PLAYER#", "Neutral Gang")
		
		teleport("#PLAYER#", "saintsrow_prologue_start", "sr_chunk02")
		player_controls_enable();
		
		fade_in_block()
		mission_unlock("tss01")
		tutorial_start("save", 3000)
		delay(5)
		pause_menu_objective_force_show()
		mission_help_table("tss01_go_church")
		--pause_menu_objective_add("tss01_go_church")
		mission_waypoint_add("saintsrow_church_gps")
		thread_new("saintsrow_church_reminder")
		
	else
		set_team("#PLAYER#", "Playas")
	end
end

function saintsrow_church_reminder()
	local counter = 1
	delay(120)
	while (is_mission_active()) do
		thread_yield()
	end
	while (not is_mission_complete("tss01")) do
		mission_help_table_nag("tss01_repeat_church")
		counter = counter + 1
		if (counter > 9) then
			return
		end
		delay(120+(counter * 60))
		while (is_mission_active()) do
			thread_yield()
		end
	end
end

-- debug function - call from the console with 'lua' command
function warp_saintsrow()
	message("warping...")
	delay(0)
	player_teleport( "saintsrow_$nav-warp")
end

function saintsrow_strong_debug()
	stronghold_enable("saintsrow_stronghold")
	teleport("#PLAYER#", "saintsrow_$n_strong_cpath0001")
	delay(1)
end

function open_vehicle_customization_door()
	if is_player_in_vehicle() then 
-- commented out for X05, as the mesh mover will always be up
--		mesh_mover_play_action("saintsrow_vehicle_customization", "start1")
	end
end
