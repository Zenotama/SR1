
-- CONSTANTS ----------------------------

-- GLOBAL VARIABLES ---------------------
Tss03_in_bus = 0
Tss03_bus_in_trigger = 0
Tss03_loop_handle = 0
Tss03_threat_handle = 0
tss03_collision = false

-- FUNCTIONS ----------------------------
function tss03_init()
	mission_add("tss03", "tss03_unlock", "tss03_cleanup", "tss03_$nstart", "tss03_start", "radar_genstarta", 0, 0, "tss03_success")
end


function tss03_main()
end


function tss03_unlock()
	-- mission_unlock("tss03")
end


function tss03_cleanup()
	set_cops_shooting_from_vehicles(false)
	mesh_hide("sr_city_train1")
	mesh_mover_reset("sr_city_train1")
	
	damage_indicator_off()
	mission_waypoint_remove()
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "mission_start_tss03")
		fade_in( 0.5 )
	end

	vehicle_infinite_mass("tss03_campaignbus", false)
	
	release_to_world("tss03_bus")
	release_to_world("tss03_escort")
	
	notoriety_reset("police")
	
	hud_timer_stop()
	
	-- unregister functions
	on_vehicle_destroyed("", "tss03_campaignbus")
	on_death("", "tss03_escort1-1" )
	on_death("", "tss03_escort2-1")
	on_death("", "tss03_escort3-1")
	on_death("", "tss03_escort4-1")
	on_death("", "tss03_escort1-2")
	on_death("", "tss03_escort2-2")
	on_death("", "tss03_escort3-2")
	on_death("", "tss03_escort4-2")
	on_death("", "tss03_busdriver")
	on_take_damage("", "tss03_campaignbus")
	on_vehicle_enter("", "tss03_campaignbus")
	on_vehicle_exit("", "tss03_campaignbus")
	on_trigger("", "tss03_$train_trigger")
	on_trigger_exit("", "tss03_$train_trigger")
	on_damage("", "tss03_campaignbus", 0.6)
	
	-- minimap icons
	minimap_icon_remove_navpoint("tss03_$execute lua script000")
	minimap_icon_remove_vehicle("tss03_campaignbus")
	ingame_effect_remove_vehicle("tss03_campaignbus")
	ingame_effect_remove_navpoint("tss03_$execute lua script000")
end

function tss03_success()
	radio_post_event("NEWS_3SS_EP_WINSLOWDEATH", true)
end

function tss03_campaign_loop()
	while (true) do
		vehicle_pathfind_to("tss03_escort1", "tss03_$path01", "tss03_$n_000", "tss03_$n_001", "tss03_$n_003", 
			"tss03_$n_004", "tss03_$n_005", "tss03_$n_006", "tss03_$n_007", "tss03_$n_008", 
			"tss03_$n_013", "tss03_$n_014", "tss03_$n_015", false, false)
		delay(0.01)
	end
end

function tss03_fail()
	mission_end_failure("tss03", "tss03_fail1")
end

function tss03_train_sfx()
	while (true) do
		audio_play_for_mover("SFX_TRAIN_ENGINE_1", "sr_city_train1", "foley", true, false)
		thread_yield()
	end
end

function tss03_train_start()
	mesh_show("sr_city_train1")
	mesh_mover_play_action("sr_city_train1", "start1")
end

function tss03_fail_time()
	mission_end_failure("tss03", "tss03_fail2")
end

function tss03_fleechase()
	set_cops_shooting_from_vehicles(true)
	if (Tss03_loop_handle > 0) then
		thread_kill(Tss03_loop_handle)
		Tss03_loop_handle = 0
	end
	on_detection("", "tss03_escort1-1" )
	on_detection("", "tss03_escort2-1")
	on_detection("", "tss03_escort3-1")
	on_detection("", "tss03_escort4-1")
	on_detection("", "tss03_escort1-2")
	on_detection("", "tss03_escort2-2")
	on_detection("", "tss03_escort3-2")
	on_detection("", "tss03_escort4-2")
	on_take_damage("", "tss03_campaignbus")

	vehicle_set_sirens("tss03_escort1", true)
	vehicle_set_sirens("tss03_escort2", true)
	vehicle_set_sirens("tss03_escort3", true)
	vehicle_set_sirens("tss03_escort4", true)

	attack("tss03_escort1-1", "#PLAYER#")
	attack("tss03_escort2-1", "#PLAYER#")
	attack("tss03_escort3-1", "#PLAYER#")
	attack("tss03_escort4-1", "#PLAYER#")
	
	notoriety_set("police", 2)
	notoriety_set_min("police", 2)
	audio_play_for_character("WINSLOW_3SS3_BUS_1", "tss03_winslow", "voice", false, false)
	
	while (get_char_in_vehicle("tss03_campaignbus", 0) == "tss03_busdriver") do
		vehicle_flee("tss03_campaignbus", "#PLAYER#")
		delay(10)
	end
end

function tss03_create()
	create_group("tss03_bus", true)
	mission_waypoint_add("tss03_campaignbus")
	create_group("tss03_escort", true)
	
	character_add_vehicle("tss03_busdriver", "tss03_campaignbus", 0)
	
	character_add_vehicle("tss03_winslow", "tss03_campaignbus", 5)
	vehicle_supress_npc_exit( "tss03_campaignbus", true )
	
	character_add_vehicle("tss03_escort1-1", "tss03_escort1", 0)
	character_add_vehicle("tss03_escort1-2", "tss03_escort1", 1)
	
	character_add_vehicle("tss03_escort2-1", "tss03_escort2", 0)
	character_add_vehicle("tss03_escort2-2", "tss03_escort2", 1)
	
	character_add_vehicle("tss03_escort3-1", "tss03_escort3", 0)
	character_add_vehicle("tss03_escort3-2", "tss03_escort3", 1)
	
	character_add_vehicle("tss03_escort4-1", "tss03_escort4", 0)
	character_add_vehicle("tss03_escort4-2", "tss03_escort4", 1)
	
	vehicle_set_sirenlights("tss03_escort1", true)
	vehicle_set_sirenlights("tss03_escort2", true)
	vehicle_set_sirenlights("tss03_escort3", true)
	vehicle_set_sirenlights("tss03_escort4", true)

	while (get_dist_char_to_char("#PLAYER#", "tss03_busdriver") > 200) do
		delay(1)
	end
	
	vehicle_speed_override("tss03_escort1", 25)
	
	vehicle_chase("tss03_escort2", "tss03_escort1-1", false, false, false, true)
	vehicle_chase("tss03_campaignbus", "tss03_escort2-1", false, false, false, true)
	vehicle_chase("tss03_escort3", "tss03_busdriver", false, false, false, true)
	vehicle_chase("tss03_escort4", "tss03_escort3-1", false, false, false, true)
	
	set_unjackable_flag("tss03_campaignbus", true)
	damage_indicator_on("tss03_campaignbus", 0.6, "tss03_winslow_bus")
	
	Tss03_loop_handle = thread_new("tss03_campaign_loop")
end

function tss03_bus_damaged()
	on_death("", "tss03_busdriver")
	turn_invulnerable("tss03_campaignbus", false)
	
	damage_indicator_off()
	set_unjackable_flag("tss03_campaignbus", false)
	if (not is_dead("tss03_busdriver")) then
		vehicle_exit("tss03_busdriver")
		flee("tss03_busdriver", "#PLAYER#", false)
	end
end

function tss03_start()
	set_mission_author("Sandeep Shekar")
	
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "mission_start_tss03")
		fade_in( 0.5 )
	end
	
	tss03_collision = false
		
	Tss03_in_bus = 0
	Tss03_bus_in_trigger = 0
	Tss03_loop_handle = 0
	Tss03_threat_handle = 0

	notoriety_set_max("police", 2)
	
	thread_new("tss03_create")
	
	audio_play_for_cellphone_force( "SYS_CELL_RING", "MONROE_3SS3_PHONE_1" ) -- rings 2*, animates cell phone, and plays audio
	cellphone_add_message("VOC_Monroe_3SS3Phone_1", "Chief Monroe")
	
	hud_timer_set(1000 * 60 * 3.75, "tss03_fail_time")
	mission_help_table("tss03_hijack_bus")
	
	-- minimap icons
	minimap_icon_add_vehicle("tss03_campaignbus", MINIMAP_ICON_PROTECT_ACQUIRE)
	ingame_effect_add_vehicle("tss03_campaignbus", INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	
	-- register functions
	on_vehicle_destroyed("tss03_fail", "tss03_campaignbus")
	on_detection("tss03_fleechase", "tss03_escort1-1" )
	on_detection("tss03_fleechase", "tss03_escort2-1")
	on_detection("tss03_fleechase", "tss03_escort3-1")
	on_detection("tss03_fleechase", "tss03_escort4-1")
	on_detection("tss03_fleechase", "tss03_escort1-2")
	on_detection("tss03_fleechase", "tss03_escort2-2")
	on_detection("tss03_fleechase", "tss03_escort3-2")
	on_detection("tss03_fleechase", "tss03_escort4-2")
	on_take_damage("tss03_fleechase", "tss03_campaignbus")
	on_death("tss03_bus_damaged", "tss03_busdriver")
	on_damage("tss03_bus_damaged", "tss03_campaignbus", 0.6)
	on_vehicle_enter("tss03_entered_bus", "tss03_campaignbus")
	on_vehicle_exit("tss03_left_bus", "tss03_campaignbus")
	on_trigger("tss03_entered_trigger", "tss03_$train_trigger")
	on_trigger_exit("tss03_exit_trigger", "tss03_$train_trigger")
	
	-- init globals
	Tss03_in_bus = 0
	Tss03_bus_in_trigger = 0
end

function tss03_dialogue()
	while (Tss03_in_bus == 0) do
		delay(2)
	end
	audio_play_for_character("WINSLOW_3SS3_BUS_2", "tss03_winslow", "voice", false, false)
	delay(10)
	while (Tss03_in_bus == 0) do
		delay(2)
	end
	audio_play_for_character("WINSLOW_3SS3_BUS_3", "tss03_winslow", "voice", false, false)
	delay(3)
	while (Tss03_bus_in_trigger == 0) do
		delay(0.5)
	end
	audio_play_for_character("WINSLOW_3SS3_TRAIN_1", "tss03_winslow", "voice", false, false)
end

function tss03_entered_bus()
	Tss03_in_bus = 1
	vehicle_infinite_mass("tss03_campaignbus", true)
	
	trigger_enable("tss03_$train_trigger")
	mission_help_table("tss03_take_bus")
	
	if (Tss03_threat_handle == 0) then 
		Tss03_threat_handle = thread_new("tss03_dialogue")
	end
	
	mission_waypoint_add("tss03_train_gps")
	
	minimap_icon_add_navpoint("tss03_$execute lua script000", MINIMAP_ICON_LOCATION)
	ingame_effect_add_navpoint("tss03_$execute lua script000", INGAME_EFFECT_VEHICLE_LOCATION)
	minimap_icon_remove_vehicle("tss03_campaignbus")
	ingame_effect_remove_vehicle("tss03_campaignbus")
	
	tss03_fleechase()
end

function tss03_win_mission()
	
end

tss03_engine_sound = -1

function tss03_bus_hit(speed, collider)
	if (collider == "sr_city_train1") then
		tss03_collision = true
		audio_play_for_mover("IMP TRAIN HARD", "sr_city_train1", "foley", false, false)
		turn_vulnerable("tss03_campaignbus")
		vehicle_detonate("tss03_campaignbus")
		delay(1)
		thread_kill(tss03_engine_sound)
		delay(5)
		mission_end_success("tss03")
	end
end

function tss03_left_bus()
	Tss03_in_bus = 0
	trigger_disable("tss03_$train_trigger")
	if (Tss03_bus_in_trigger == 1) then
		thread_new("tss03_train_start")
		tss03_engine_sound = thread_new("tss03_train_sfx")
		hud_timer_stop()
		on_vehicle_destroyed("", "tss03_campaignbus")
		on_collision("tss03_bus_hit", "tss03_campaignbus")
		delay(6)
		audio_play_for_mover("SFX_TRAIN_HORN_1", "sr_city_train1", "foley", false, false)
		delay(1)
		audio_play_for_character("WINSLOW_3SS3_TRAIN_2", "tss03_winslow", "voice", false, false)
		delay(5)
		thread_kill(tss03_engine_sound)
		audio_play_for_mover("SFX_TRAIN_BRAKES", "sr_city_train1", "foley", false, false)
		delay(10)
		if (not tss03_collision) then
			mission_end_failure("tss03", "tss03_fail2")
		end
		--tss03_bus_hit()
		--vehicle_detonate("tss03_campaignbus")
		--delay(7)
		
	else 
		minimap_icon_remove_navpoint("tss03_$execute lua script000")
		minimap_icon_add_vehicle("tss03_campaignbus", MINIMAP_ICON_PROTECT_ACQUIRE)
		ingame_effect_add_vehicle("tss03_campaignbus", INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
		ingame_effect_remove_navpoint("tss03_$execute lua script000")
		mission_help_table("tss03_hijack_bus")
	end
end

function tss03_entered_trigger()
	if (Tss03_in_bus) then
		mission_help_table("tss03_get_out")
		Tss03_bus_in_trigger = 1
		minimap_icon_remove_navpoint("tss03_$execute lua script000")
		minimap_icon_remove_vehicle("tss03_campaignbus")
		ingame_effect_remove_vehicle("tss03_campaignbus")
		ingame_effect_remove_navpoint("tss03_$execute lua script000")
	end
end

function tss03_exit_trigger()
	if (Tss03_in_bus) then
		Tss03_bus_in_trigger = 0
		mission_help_table_nag("tss03_take_bus")
		minimap_icon_add_navpoint("tss03_$execute lua script000", MINIMAP_ICON_LOCATION)
		ingame_effect_add_navpoint("tss03_$execute lua script000", INGAME_EFFECT_VEHICLE_LOCATION)
	end
end