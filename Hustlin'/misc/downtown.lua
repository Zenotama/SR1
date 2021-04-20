-- downtown.lua
-- SR district script
-- 9/12/05


-- FIXME 9/14:
	-- collision probems off ramp; landing problems (jeremiah is looking into this)
	-- massive trigger to turn spawning on/off
	-- start trigger should be disabled if stronghold is not active
	-- sh triggers being re-triggerable after sh is completed; secondary triggers getting triggered twice in the same try

--[[
FIXME 10/26/05
	- trigger pass - disable "test trig2" if player has init'ed but NOT started stronghold
	- add more resistance, more action
	- disable exit trigger
	- make init trigger big
	- destroy/release to world where necessary

FIXME 11/28/05
	- make parked cars unjackable!
	X	- make it so jumper vehicle doesn't appear until all other vehicles desetroyed; add help text prompts?
	X	- make it so jumper vehicle doesn't go into combat and actually jumps ramp
]]

-- GLOBAL VARIABLES---------
VKparking_cars_destroyed = 0
VKparking_cars_total = 9
VKparking_vehicle_attack2_done = false
Downtown_sh_handle_anim1 = 0
Downtown_sh_handle_anim2 = 0

Downtown_park_phone_handle = 0

-- FUNCTIONS----------------
function downtown_init()

	-- DOWNTOWN PARKING STRONGHOLD
	on_stronghold_takeover_start("downtown_sh_parking_start", "downtown_sh_parking")
	on_stronghold_reset("downtown_sh_parking_reset", "downtown_sh_parking")
	on_stronghold_takeover_success("downtown_sh_parking_success", "downtown_sh_parking")
--	on_stronghold_check_enable("downtown_sh_parking_unlock", "downtown_sh_parking")
	stronghold_set_cost( "downtown_sh_parking",  DOWNTOWN_SH_PARKING_REQUIRED_PROPS)

	on_trigger("teleport_to_penthouse", "downtown_$crib_warp_garage")
	on_trigger("teleport_to_penthouse", "downtown_$crib_warp_front")
	on_trigger("teleport_to_front", "downtown_$crib_warp_penthouse")
	--debug_downtown()
end


function downtown_main()
end


function debug_downtown()
	--teleport("#PLAYER#", "downtown_$n-warp-sh")
	stronghold_enable("downtown_sh_parking")
	--teleport("#PLAYER#", "downtown_$n-parking-warp2")
	teleport("#PLAYER#", "downtown_$n-parking-plyr01")
	--create_group("downtown_$G-parking-02")
	--trigger_enable("downtown_$t-test-ramp")
	--on_trigger("downtown_sh_parking_jump_ramp", "downtown_$t-test-ramp")
	--VKparking_cars_destroyed = 8
end


-- debug function - call from the console with 'lua' command
function warp_downtown()
	message("warping...")
	delay(0)
	player_teleport(  "downtown_$nav-warp")
end

function teleport_to_penthouse()
	fade_out(2.0)
	fade_out_block()
	teleport("#PLAYER#", "downtown_$crib_warp_penthouse")
	fade_in(2.0)
end

function teleport_to_front()
	fade_out(2.0)
	fade_out_block()
	teleport("#PLAYER#", "downtown_$crib_warp_front")
	fade_in(2.0)
end

------------------------------------------------------
-- VK PARKING GARAGE STRONGHOLD ----------------------
------------------------------------------------------

-- 2006/02/28 STL: This function isn't being called anymore.
function downtown_sh_parking_unlock()
	if ( is_mission_complete("vkx") ) then
		stronghold_enable("downtown_sh_parking")
		debug_message("downtown parking stronghold unlocked!")
	end
end

-- AM 12/3/05 note:  reset seems to get called upon success, failure, and cancel (but not failure via dying and probably not failure via arrest either)
function downtown_sh_parking_reset()
	trigger_disable("downtown_$t-parking-car-atk")
	trigger_disable("downtown_$t-parking-jump")
	trigger_disable("downtown_$t-parking-2")
	trigger_disable("downtown_$t-parking-4")
	trigger_disable("downtown_$t-vattk-2")
	trigger_disable("downtown_$t-parking-3")
	trigger_disable("downtown_$t-parking-stopnpc")

	on_trigger("", "downtown_$t-parking-car-atk")	-- unregister on_ functions
	on_trigger("", "downtown_$t-parking-jump")
	on_trigger("", "downtown_$t-parking-2")
	on_trigger("", "downtown_$t-parking-4")
	on_trigger("", "downtown_$t-vattk-2")
	on_trigger("", "downtown_$t-parking-3")
	on_trigger("", "downtown_$t-parking-stopnpc")

	on_vehicle_destroyed("", "downtown_car_2dr_luxury04#000")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#000")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#001")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#002")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#004")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#006")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#007")
	on_vehicle_destroyed("", "downtown_car_4dr_lowrider01#009")
	on_vehicle_destroyed("", "downtown_$v-parking-attk01")

	thread_kill(Downtown_sh_handle_anim1)
	thread_kill(Downtown_sh_handle_anim2)

	VKparking_cars_destroyed = 0	-- need to reset in case of mission failure
	VKparking_vehicle_attack2_done = false

	distance_display_off()
	objective_text_clear()

	remove_marker_vehicle("downtown_car_2dr_luxury04#000")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#000")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#001")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#002")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#004")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#006")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#007")
	remove_marker_vehicle("downtown_car_4dr_lowrider01#009")
	remove_marker_vehicle("downtown_$v-parking-attk01")
	minimap_icon_remove_navpoint("downtown_car_2dr_luxury04#000")

	release_to_world("downtown_$G-parking-01")
	group_destroy("downtown_$G-parking-items")
	release_to_world("downtown_$G-parking-02")
	release_to_world("downtown_$G-parking-03")
	release_to_world("downtown_$G-parking-04")
	release_to_world("downtown_$G-parking-targets")
	release_to_world("downtown_$G-parking-courtesy")
	group_destroy("downtown_$G-parking-jumper")

	audio_stop(Downtown_park_phone_handle)

	notoriety_reset("police")
end


function downtown_sh_parking_scene01_intro()
	teleport("#PLAYER#", "downtown_$t-parking-start")
	group_create("downtown_$G-parking-items")
	camera_look_through("downtown_$n-parking-jh-intro01")
	delay(.25)

	team_despawn("Vice Lords", true)
	team_despawn("Police", true)

	modal_begin()

	group_create_preload("downtown_$G-parking-01", "downtown_$G-parking-targets")	
	--group_create_preload("downtown_$G-parking-targets")
	thread_new("downtown_sh_parking_phonecall")

	delay(2)
	
	fade_in(.7)
	delay(3.5)
	set_animation_state("downtown_$c-parking-vattk1a", "blunt smoking")
	delay(.5)
	--camera_look_through("downtown_$cam-park-intro02")
	Downtown_sh_handle_anim1 = thread_new("play_action", "downtown_$c-parking-vattk1a", "smoke action")
	Downtown_sh_handle_anim2 = thread_new("play_action", "downtown_$c-parking-vattk1b", "talk with respect")
	delay(.5)
	--camera_look_through("downtown_$cam-park-intro02")
	camera_look_through("downtown_$n-parking-jh-intro02")
	delay(4.5)
	fade_out(.7)
	fade_out_block()
	modal_end()
end

function downtown_sh_parking_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	Downtown_park_phone_handle = audio_play("JULIUS_STRONGHOLD_4", "voice", false, false)
end

function downtown_sh_parking_scene01_intro_end()
	fade_out(0)
	delay(.1)
	camera_end_script()
	thread_kill(Downtown_sh_handle_anim1)
	thread_kill(Downtown_sh_handle_anim2)
	-- set_animation_state("downtown_$c-parking-vattk1a", "") -- no worky
end


-- use trigger activated; start stronghold
function downtown_sh_parking_start()
	cutscene_in()
	scripted_cutscene_play("downtown_sh_parking_scene01_intro", "downtown_sh_parking_scene01_intro_end")
	cutscene_out()

	on_trigger("downtown_sh_parking_vehicle_attack", "downtown_$t-parking-car-atk")	-- regular trigger
	on_trigger("downtown_sh_parking_jump_ramp", "downtown_$t-parking-jump")				-- regular trigger
	on_trigger("downtown_sh_parking_add_markers2", "downtown_$t-parking-2")				-- sh trigger
	on_trigger("downtown_sh_parking_add_markers4", "downtown_$t-parking-4")				-- sh trigger
	on_trigger("downtown_sh_parking_vehicle_attack_2", "downtown_$t-vattk-2")			-- regular trigger
	on_trigger("downtown_sh_parking_create_level3", "downtown_$t-parking-3")			-- regular trigger
	on_trigger("downtown_sh_parking_stop_npcs", "downtown_$t-parking-stopnpc")

	trigger_enable("downtown_$t-parking-car-atk")
	trigger_enable("downtown_$t-parking-jump")
	trigger_enable("downtown_$t-parking-2")
	trigger_enable("downtown_$t-parking-4")
	trigger_enable("downtown_$t-vattk-2")
	trigger_enable("downtown_$t-parking-3")
	trigger_enable("downtown_$t-parking-stopnpc")

	set_current_hit_points("downtown_car_4dr_lowrider01#000", 3800)
	set_current_hit_points("downtown_car_4dr_lowrider01#001", 3800)
	set_current_hit_points("downtown_car_4dr_lowrider01#002", 3800)
	set_current_hit_points("downtown_car_4dr_lowrider01#004", 3800)
	set_current_hit_points("downtown_car_4dr_lowrider01#006", 3800)
	set_current_hit_points("downtown_car_4dr_lowrider01#007", 3800)
	set_current_hit_points("downtown_$v-parking-attk01", 3800)

--[[
THESE GUYS CREATED LATER
"downtown_car_4dr_lowrider01#009" --- "downtown_$G-parking-02"
"downtown_car_2dr_luxury04#000" -- "downtown_$G-parking-jumper"
]]

	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_2dr_luxury04#000")		--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#000")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#001")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#002")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#004")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#006")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#007")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_car_4dr_lowrider01#009")	--
	on_vehicle_destroyed("downtown_sh_parking_check_death", "downtown_$v-parking-attk01")	-- attacker vehicle

	--set_unjackable_flag("downtown_car_2dr_luxury04#000", true)	-- done in jumper function
	set_unjackable_flag("downtown_car_4dr_lowrider01#000", true)
	set_unjackable_flag("downtown_car_4dr_lowrider01#001", true)
	set_unjackable_flag("downtown_car_4dr_lowrider01#002", true)
	set_unjackable_flag("downtown_car_4dr_lowrider01#004", true)
	set_unjackable_flag("downtown_car_4dr_lowrider01#006", true)
	set_unjackable_flag("downtown_car_4dr_lowrider01#007", true)
	--set_unjackable_flag("downtown_car_4dr_lowrider01#009", true)	-- done in attack function
	--set_unjackable_flag("downtown_$v-parking-attk01", true)		-- done in attack function

	delay(1)

	mission_help_table("vkparking_start") -- text: "Destroy all Vice King vehicles!"
	objective_text("vkparking_objective", VKparking_cars_total - VKparking_cars_destroyed)
	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#000", INGAME_EFFECT_VEHICLE_KILL)
	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#001", INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("downtown_car_4dr_lowrider01#000", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("downtown_car_4dr_lowrider01#001", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("downtown_car_4dr_lowrider01#002", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("downtown_car_4dr_lowrider01#004", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("downtown_car_4dr_lowrider01#006", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	add_marker_vehicle("downtown_car_4dr_lowrider01#007", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	notoriety_set_max("police", 4) -- limit vehicle slots used by cops by capping at 4
end


function downtown_sh_parking_success()
	hood_set_owner("vk_downtown01", "Playas")
	trigger_enable("downtown_$t-parking-save")
end

function downtown_sh_parking_create_level3()
	trigger_disable("downtown_$t-parking-3")

	group_create("downtown_$G-parking-03", true)
	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#004", INGAME_EFFECT_VEHICLE_KILL)
end


function downtown_sh_parking_add_markers2()
	--debug_message("test trig2")

	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#002", INGAME_EFFECT_VEHICLE_KILL)
	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#009", INGAME_EFFECT_VEHICLE_KILL)

	-- BAD -- marker added to same car elsewhere in script
	--add_marker_vehicle("downtown_car_4dr_lowrider01#009", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
end

function downtown_sh_parking_add_markers4()
	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#006", INGAME_EFFECT_VEHICLE_KILL)
	--ingame_effect_add_vehicle("downtown_car_4dr_lowrider01#007", INGAME_EFFECT_VEHICLE_KILL)
end



function downtown_sh_parking_scene02_jumper()
	--thread_new("downtown_sh_parking_scene02_timer")

	notoriety_set("vice_kings", 0)									-- attempt to force driver to jump off ramp instead of going into combat/missing ramp

	modal_begin()

	group_create_preload("downtown_$G-parking-jumper", "downtown_$G-parking-courtesy")
	combat_disable("downtown_Vk_x_m_thug1-01#000")				-- ditto
	set_cant_flee_flag("downtown_Vk_x_m_thug1-01#000", true) -- ditto
	vehicle_disable_flee("downtown_car_2dr_luxury04#000", true)
	turn_invulnerable("downtown_car_2dr_luxury04#000")
	turn_invulnerable("downtown_Vk_x_m_thug1-01#000")

	camera_look_through("downtown_$n-parking-jump-jh-01")
	
	delay(.2)
	fade_in(.5)
	audio_play_persona_line("downtown_Vk_x_m_thug1-01#000", "voice - startled line", 3)
	vehicle_enter("downtown_Vk_x_m_thug1-01#000", "downtown_car_2dr_luxury04#000", 0)
	delay(.75)

	fade_out(.5)
	fade_out_block()
	modal_end()
end


function downtown_sh_parking_scene02_jumper_end()
	fade_out(0)
	delay(.1)
	camera_end_script()

	combat_disable("downtown_Vk_x_m_thug1-01#000")							-- ditto
	set_cant_flee_flag("downtown_Vk_x_m_thug1-01#000", true)				-- ditto
	vehicle_disable_flee("downtown_car_2dr_luxury04#000", true)

	vehicle_allow_flat_swerve("downtown_car_2dr_luxury04#000", false) -- ditto (see above)

	if ( get_char_in_vehicle("downtown_car_2dr_luxury04#000", 0) == nil ) then
		character_add_vehicle("downtown_Vk_x_m_thug1-01#000", "downtown_car_2dr_luxury04#000", 0)
	end

	set_unjackable_flag("downtown_car_2dr_luxury04#000", true)

	if ( not(is_player_in_vehicle()) ) then
		character_add_vehicle("#PLAYER#", "downtown_$v-parking-courtesycar", 0)
	end
	teleport_vehicle("#PLAYER#", "downtown_$n-parking-plyr01")

	turn_invulnerable("downtown_car_2dr_luxury04#000", true) -- true = allow player damage
	turn_invulnerable("downtown_Vk_x_m_thug1-01#000", true)	

	delay(.2)
end

function downtown_sh_parking_jump_ramp()
	local jump_timer = 0

	if ( VKparking_cars_destroyed == (VKparking_cars_total - 1) ) then -- FIXME - if all other guys killed
		trigger_disable("downtown_$t-parking-jump")

		player_controls_disable()
		
		if ( is_player_in_vehicle() ) then
			vehicle_stop("#PLAYER#")
		end
		
		cutscene_in()
		scripted_cutscene_play("downtown_sh_parking_scene02_jumper", "downtown_sh_parking_scene02_jumper_end")
		cutscene_out()

		--delay(.25)

		while ( get_char_in_vehicle("downtown_car_2dr_luxury04#000", 0) == nil ) do
			delay(.1)
		end

		delay(.15)

		debug_message("vehicle speed start")

		vehicle_speed_override("downtown_car_2dr_luxury04#000", 60)		
		
		delay(.25)
		
		player_controls_enable()

		distance_display_on("downtown_Vk_x_m_thug1-01#000", 0.1, 10000, 0.15, 150)
		on_tailing_far("downtown_sh_parking_tailing_far")
		on_tailing_good("downtown_sh_parking_tailing_good")
		minimap_icon_remove_navpoint("downtown_car_2dr_luxury04#000")
		add_marker_vehicle("downtown_car_2dr_luxury04#000", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		mission_help_table("vkparking_ramp") -- text: "Don't let him get away!"

		debug_message("while loop start")
		
		--thread_new("downtown_sh_parking_roof_timer")

		-- wait here until jumper car has either jumped (i.e. is outside of 69m) or missed jump (9 seconds have passed), whichever happens first
		while (get_dist_char_to_nav("downtown_Vk_x_m_thug1-01#000", "downtown_$n-jump-start") < 70) and (jump_timer <= 36) do
			delay(.25)
			jump_timer = jump_timer + 1
		end

		debug_message("while loop end")
		
		vehicle_disable_flee("downtown_car_2dr_luxury04#000", false)
		vehicle_speed_cancel("downtown_car_2dr_luxury04#000")
		combat_enable("downtown_Vk_x_m_thug1-01#000")
		set_cant_flee_flag("downtown_Vk_x_m_thug1-01#000", false)
		vehicle_allow_flat_swerve("downtown_car_2dr_luxury04#000", true)

		-- if jump successful, flee else attack player
		if (jump_timer <= 36) then
			thread_new("downtown_sh_parking_flee_loop")
		else
			vehicle_chase("downtown_car_2dr_luxury04#000", "#PLAYER#", true, true)
		end
	end
end

function downtown_sh_parking_flee_loop()
	while (1) do
		vehicle_flee("downtown_car_2dr_luxury04#000")
		delay(10)
	end
end

function downtown_sh_parking_roof_timer()
	--if 
end

function downtown_sh_parking_tailing_far()
	mission_help_table_nag("vkparking_tail_far") -- text "You're losing him! Don't let him get away!")
	hud_timer_set(1000 * 15, "downtown_sh_parking_tailing_timer") -- start the timer
end

function downtown_sh_parking_tailing_timer()
	distance_display_off()
	objective_text_clear()
	stronghold_takeover_failure("vkparking_fail") -- text: "You lost him!"
end

function downtown_sh_parking_tailing_good()
	hud_timer_stop()
	mission_help_table_nag("vkparking_tail_good") -- text "He's close now, chase him down."
end

-- when player hits trigger on ramp
function downtown_sh_parking_vehicle_attack()
	--debug_message("vehicle attack!")

	trigger_disable("downtown_$t-parking-car-atk")

	set_ignore_ai_flag("downtown_Vk_x_m_thug1-01#005", false)
	set_ignore_ai_flag("downtown_$c0000", false)
	vehicle_disable_flee("downtown_car_4dr_lowrider01#009", true)
	character_add_vehicle("downtown_Vk_x_m_thug1-01#005", "downtown_car_4dr_lowrider01#009", 0)
	character_add_vehicle("downtown_$c0000", "downtown_car_4dr_lowrider01#009", 1)
	vehicle_chase("downtown_car_4dr_lowrider01#009", "#PLAYER#", true, true)
	add_marker_vehicle("downtown_car_4dr_lowrider01#009", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

	set_unjackable_flag("downtown_car_4dr_lowrider01#009", true)

	set_current_hit_points("downtown_car_4dr_lowrider01#009", 3800)
end


-- when player destroys his first vehicle
function downtown_sh_parking_vehicle_attack_2()
	if (not VKparking_vehicle_attack2_done) then
		--debug_message("vehicle attack 2!")

		VKparking_vehicle_attack2_done = true
		set_ignore_ai_flag("downtown_$c-parking-vattk1a", false)
		set_ignore_ai_flag("downtown_$c-parking-vattk1b", false)
		vehicle_disable_flee("downtown_$v-parking-attk01", true)
		character_add_vehicle("downtown_$c-parking-vattk1a", "downtown_$v-parking-attk01", 0)
		character_add_vehicle("downtown_$c-parking-vattk1b", "downtown_$v-parking-attk01", 1)
		vehicle_chase("downtown_$v-parking-attk01", "#PLAYER#", true, true)
		add_marker_vehicle("downtown_$v-parking-attk01", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)

		set_unjackable_flag("downtown_$v-parking-attk01", true)
	end
end


-- each time a target vehicle is destroyed, increment counter, check if player is done
function downtown_sh_parking_check_death(car)
	remove_marker_vehicle(car)
	remove_marker_vehicle(car) -- in case a 2nd marker was added
	VKparking_cars_destroyed = VKparking_cars_destroyed + 1
	objective_text("vkparking_objective", VKparking_cars_total - VKparking_cars_destroyed)
	--mission_help_table_nag("vkparking_car") -- text: "VK car destroyed!"

	if ( (VKparking_cars_destroyed == 1) and (not VKparking_vehicle_attack2_done) ) then
		downtown_sh_parking_vehicle_attack_2()
	elseif ( VKparking_cars_destroyed == (VKparking_cars_total - 1) ) then
		delay(5)
		mission_help_table("vkparking_oneleft") -- text: "One more VK left, on the rooftop."
		minimap_icon_add_navpoint("downtown_car_2dr_luxury04#000", MINIMAP_ICON_KILL, true)
	elseif (VKparking_cars_destroyed == VKparking_cars_total) then
		delay(5)
		stronghold_takeover_success()
	end
end


function downtown_sh_parking_stop_npcs()
	trigger_disable("downtown_$t-parking-stopnpc")

	debug_message("STOP NPC CAR ATTACKERS")

	thread_new("downtown_sh_parking_stop_car", "downtown_car_4dr_lowrider01#009")
	thread_new("downtown_sh_parking_stop_car", "downtown_$v-parking-attk01")

	thread_new("downtown_sh_parking_exit_car", "downtown_Vk_x_m_thug1-01#005")
	thread_new("downtown_sh_parking_exit_car", "downtown_$c0000")

	thread_new("downtown_sh_parking_exit_car", "downtown_$c-parking-vattk1a")
	thread_new("downtown_sh_parking_exit_car", "downtown_$c-parking-vattk1b")
end

function downtown_sh_parking_stop_car(car)
	if (not is_vehicle_destroyed(car)) then
		vehicle_stop(car)
	end
end

function downtown_sh_parking_exit_car(npc)
	if (not is_dead(npc)) then
		delay(5)
		vehicle_exit(npc)
		attack(npc)
	end
end
















-- TEST
function test_jump()
	local jump_timer = 0

--	if ( VKparking_cars_destroyed == (VKparking_cars_total - 1) ) then -- FIXME - if all other guys killed

	trigger_disable("downtown_$t-parking-jump")

	player_controls_disable()
	
	if ( is_player_in_vehicle() ) then
		vehicle_stop("#PLAYER#")
	end
	
	cutscene_in()
	scripted_cutscene_play("downtown_sh_parking_scene02_jumper", "downtown_sh_parking_scene02_jumper_end")
	cutscene_out()

	--delay(.25)

	while ( get_char_in_vehicle("downtown_car_2dr_luxury04#000", 0) == nil ) do
		delay(.1)
	end

	delay(.15)

	debug_message("vehicle speed start")

	vehicle_speed_override("downtown_car_2dr_luxury04#000", 60)		
	
	delay(.25)
	
	player_controls_enable()

	distance_display_on("downtown_Vk_x_m_thug1-01#000", 0.1, 10000, 0.15, 150)
	on_tailing_far("downtown_sh_parking_tailing_far")
	on_tailing_good("downtown_sh_parking_tailing_good")
	minimap_icon_remove_navpoint("downtown_car_2dr_luxury04#000")
	add_marker_vehicle("downtown_car_2dr_luxury04#000", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	mission_help_table("vkparking_ramp") -- text: "Don't let him get away!"

	debug_message("while loop start")
	
	--thread_new("downtown_sh_parking_roof_timer")

	while (get_dist_char_to_nav("downtown_Vk_x_m_thug1-01#000", "downtown_$n-jump-start") < 70) and (jump_timer <= 24) do
		delay(.25)
		jump_timer = jump_timer + 1
	end

	debug_message("while loop end")
	
	vehicle_disable_flee("downtown_car_2dr_luxury04#000", false)
	vehicle_speed_cancel("downtown_car_2dr_luxury04#000")
	combat_enable("downtown_Vk_x_m_thug1-01#000")
	set_cant_flee_flag("downtown_Vk_x_m_thug1-01#000", false)

	-- if jump successful, flee else attack player
	--if (jump_timer <= 24) then
		thread_new("downtown_sh_parking_flee_loop")
	--else
		--vehicle_chase("downtown_car_2dr_luxury04#000", "#PLAYER#", true, true)
	--end

end