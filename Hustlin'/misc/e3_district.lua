-- e3_district.lua
-- Master Lua Script for E3 level
-- Created 4/21/05

E3_STRONGHOLD_NAME = "e3_district__brothel"

		--						Behind				BJ				Girls				Bed				front
E3_STRONGHOLD_DOOR_NAMES = {"VK_MeshMoverE01","VK_MeshMoverD01","VK_MeshMoverA01","VK_MeshMoverB01","VK_MeshMoverC01"}

E3_STRONGHOLD_JUROR_NAMES = {"e3_district_brothel_juror00","e3_district_brothel_juror01",
								"e3_district_brothel_juror02","e3_district_brothel_juror03"}
E3_STRONGHOLD_HO_NAMES = {"e3_district_brothel_ho02","e3_district_brothel_ho03",
							"e3_district_brothel_ho01","e3_district_brothel_ho00"}

E3_STRONGHOLD_HO_LINES = {	{"VOC_E3STRIPPER1_PANIC_3","VOC_E3STRIPPER1_PANIC_1","VOC_E3STRIPPER1_PANIC_2"},
							{"VOC_E3STRIPPER1_PANIC_4","VOC_E3STRIPPER1_PANIC_1","VOC_E3STRIPPER1_PANIC_2"},
							{"VOC_E3STRIPPER2_PANIC_1","VOC_E3STRIPPER2_PANIC_3","VOC_E3STRIPPER2_PANIC_4"},
							{"VOC_E3STRIPPER2_PANIC_2","VOC_E3STRIPPER2_PANIC_3","VOC_E3STRIPPER2_PANIC_4"}}
							
E3_STRONGHOLD_LINE_ASSOCIATIONS = {	 }
E3_STRONGHOLD_AUDIO_LENGTHS = { }
E3_SCREAM_TIMERS = {}
							
E3_STRONGHOLD_PROPS_REQUIREMENT = 100
E3_STRONGHOLD_JURORS_FOR_VICTORY = 2
E3_STRONGHOLD_FLEE_POINT = "e3_district_flee_nav"

E3_sh_juror_count = 0
E3_sh_animation_threads = {}
E3_sh_noise_thread_handles = {-1,-1,-1,-1}
E3_sh_current_noise_handles = {-1,-1,-1,-1}

E3_sh_flee_thread_handles = {}
E3_sh_flee_noise_handles = {}

--E3_STRONGHOLD_CAR_GROUP = "e3_district_$BrothelCar"

function e3_district_init()
	teleport("#PLAYER#", "e3_district_$start")
	
	--on_props_trigger( "e3_district_props_trigger", E3_STRONGHOLD_PROPS_REQUIREMENT, "vice_kings" )
	on_trigger("e3_district_store_greeting", "e3_district_$store_greeting")
	
	--stronghold_disable( E3_STRONGHOLD_NAME )
	on_stronghold_reset( "e3_district_stronghold_reset", E3_STRONGHOLD_NAME )
	on_stronghold_takeover_start( "e3_district_stronghold_start", E3_STRONGHOLD_NAME )
	on_stronghold_takeover_init( "e3_district_stronghold_init", E3_STRONGHOLD_NAME )
	on_stronghold_takeover_success( "e3_district_stronghold_success", E3_STRONGHOLD_NAME )

	inv_item_add("beretta")
	inv_item_add("rpg_launcher")
	inv_item_add("pump_action_shotgun")
	inv_item_add("mac10")
	
	E3_STRONGHOLD_LINE_ASSOCIATIONS[ E3_STRONGHOLD_HO_NAMES[1] ] = 1
	E3_STRONGHOLD_LINE_ASSOCIATIONS[ E3_STRONGHOLD_HO_NAMES[2] ] = 2
	E3_STRONGHOLD_LINE_ASSOCIATIONS[ E3_STRONGHOLD_HO_NAMES[3] ] = 3
	E3_STRONGHOLD_LINE_ASSOCIATIONS[ E3_STRONGHOLD_HO_NAMES[4] ] = 4
	E3_STRONGHOLD_LINE_ASSOCIATIONS[ "e3_district_Stripper-black#000" ] = 1
	E3_STRONGHOLD_LINE_ASSOCIATIONS[ "e3_district_Stripper-white#000" ] = 3
	
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER1_PANIC_1" ] = 2
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER1_PANIC_2" ] = 2
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER1_PANIC_3" ] = 1
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER1_PANIC_4" ] = 1
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER2_PANIC_1" ] = 1
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER2_PANIC_2" ] = 2
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER2_PANIC_3" ] = 3
	E3_STRONGHOLD_AUDIO_LENGTHS[ "VOC_E3STRIPPER2_PANIC_4" ] = 1

	E3_SCREAM_TIMERS[ E3_STRONGHOLD_HO_NAMES[1] ] = 20
	E3_SCREAM_TIMERS[ E3_STRONGHOLD_HO_NAMES[2] ] = 20
	E3_SCREAM_TIMERS[ E3_STRONGHOLD_HO_NAMES[3] ] = 20
	E3_SCREAM_TIMERS[ E3_STRONGHOLD_HO_NAMES[4] ] = 20
	E3_SCREAM_TIMERS[ "e3_district_Stripper-black#000" ] = 15
	E3_SCREAM_TIMERS[ "e3_district_Stripper-white#000" ] = 15
end

function e3_district_main()
end

function test_custom()
	play_custom_action( "#PLAYER#", "pfl1_bs_he_give_strtl.animx" )
end

function e3_district_store_greeting()
	mission_debug("play audio")
	audio_play_for_character("VOC_BFMid+_StoreGreet", "e3_district_Ped_male6#000", "voice")
end
----- Unlocking and Cellphone Functions ----------

function e3_district_props_trigger()
	cellphone_register( "e3_district_cell_start" )
	cellphone_register( "e3_district_cell_end" )
	
	audio_play_for_cellphone("Ring 1", 4, 1.5, 1, "VOC_BMYng_WhoreMission", false, "e3_district_cell_start", "e3_district_cell_end")

end

function e3_district_cell_start()
end

function e3_district_cell_end()
	stronghold_enable(E3_STRONGHOLD_NAME)
end

---- STRONGHOLD FUNCTIONS -----------------------

function e3_district_stronghold_reset()
	mission_debug( "stronghold reset" )

	if (not stronghold_is_player_controlled(E3_STRONGHOLD_NAME) ) then
		for x=1, sizeof_table(E3_STRONGHOLD_DOOR_NAMES), 1 do
			on_door_opened( "", E3_STRONGHOLD_DOOR_NAMES[x] )
		end

		for x=1, sizeof_table(E3_STRONGHOLD_JUROR_NAMES), 1 do
			on_death( "", E3_STRONGHOLD_JUROR_NAMES[x] )
		end

		trigger_disable( "e3_district_$downstairshallway" )
		
		for x=1, sizeof_table(E3_STRONGHOLD_JUROR_NAMES), 1 do
			minimap_icon_remove_navpoint( E3_STRONGHOLD_JUROR_NAMES[x] )
			minimap_icon_remove_npc( E3_STRONGHOLD_JUROR_NAMES[x] )
			ingame_effect_remove_npc( E3_STRONGHOLD_JUROR_NAMES[x] )
			trigger_disable( "e3_district_door"..x.."_load" )
		end
		
		for x=1, sizeof_table(E3_sh_noise_thread_handles), 1 do
			audio_stop( E3_sh_current_noise_handles[x] )
			audio_stop( E3_sh_flee_noise_handles[ E3_STRONGHOLD_HO_NAMES[x] ] )
			mission_debug(E3_STRONGHOLD_HO_NAMES[x])
			thread_kill( E3_sh_noise_thread_handles[x] )
			thread_kill( E3_sh_animation_threads[ E3_STRONGHOLD_JUROR_NAMES[x] ] )
			thread_kill( E3_sh_animation_threads[ E3_STRONGHOLD_HO_NAMES[x] ] )
			thread_kill( E3_sh_flee_thread_handles[ E3_STRONGHOLD_HO_NAMES[x] ] )
		end

		thread_kill( E3_sh_flee_thread_handles[ "e3_district_Stripper-black#000" ] )
		thread_kill( E3_sh_flee_thread_handles[ "e3_district_Stripper-white#000" ] )
		audio_stop( E3_sh_flee_noise_handles[ "e3_district_Stripper-black#000" ] )
		audio_stop( E3_sh_flee_noise_handles[ "e3_district_Stripper-white#000" ] )
	end
	
	release_to_world( "e3_district_bedroom_behind")
	release_to_world( "e3_district_bedroom_BJ" )
	release_to_world( "e3_district_bedroom_girls" )
	release_to_world( "e3_district_bedroom_sleep" )
	release_to_world( "e3_district_flee_strippers" )
--	release_to_world( "e3_district_$BrothelCar" )

	objective_text_clear()
end

function e3_district_stronghold_init()
	set_mission_author( "Russell Aasland" )
	mission_debug( "stronghold init'd" )
	
	message(" dug sucks ")
	
--	group_create( "e3_district_$BrothelCar", false)

	on_trigger( "e3_district_stairs_top", "e3_district_$downstairshallway" )
	trigger_enable( "e3_district_$downstairshallway" )
	
	E3_sh_juror_count = 0
	
	for x=1, sizeof_table(E3_STRONGHOLD_DOOR_NAMES), 1 do
		on_door_opened( "e3_district_stronghold_door0"..x, E3_STRONGHOLD_DOOR_NAMES[x] )
	end

	for x=1, sizeof_table(E3_STRONGHOLD_JUROR_NAMES), 1 do
		on_death( "e3_district_stronghold_juror_death", E3_STRONGHOLD_JUROR_NAMES[x] )
		on_death( "e3_district_stronghold_ho_death", E3_STRONGHOLD_HO_NAMES[x] )
		on_trigger( "e3_district_door"..x.."_load", "e3_district_door"..x.."_load" )
		trigger_enable( "e3_district_door"..x.."_load" )
		E3_sh_animation_threads[ E3_STRONGHOLD_HO_NAMES[x] ] = -1
		E3_sh_animation_threads[ E3_STRONGHOLD_JUROR_NAMES[x] ] = -1

		E3_sh_flee_thread_handles[ E3_STRONGHOLD_HO_NAMES[x] ] = -1
		E3_sh_flee_noise_handles[ E3_STRONGHOLD_HO_NAMES[x] ] = -1
	end
	
	E3_sh_flee_thread_handles[ "e3_district_Stripper-black#000" ] = -1
	E3_sh_flee_thread_handles[ "e3_district_Stripper-white#000" ] = -1
	E3_sh_flee_noise_handles[ "e3_district_Stripper-black#000" ] = -1
	E3_sh_flee_noise_handles[ "e3_district_Stripper-white#000" ] = -1
end

function e3_district_stronghold_start()
	mission_debug( "stronghold started" )

	mission_help_table( "e3_start" )
	objective_text( "e3_juror_killed", E3_sh_juror_count, E3_STRONGHOLD_JURORS_FOR_VICTORY )

	for x=1, sizeof_table(E3_STRONGHOLD_JUROR_NAMES), 1 do
		minimap_icon_add_navpoint( E3_STRONGHOLD_JUROR_NAMES[x], "radar_objkill" )
	end
end

function e3_district_stronghold_success()
		for x=1, sizeof_table(E3_STRONGHOLD_DOOR_NAMES), 1 do
			on_door_opened( "", E3_STRONGHOLD_DOOR_NAMES[x] )
		end

		for x=1, sizeof_table(E3_STRONGHOLD_JUROR_NAMES), 1 do
			on_death( "", E3_STRONGHOLD_JUROR_NAMES[x] )
		end

		trigger_disable( "e3_district_$downstairshallway" )
		
		for x=1, sizeof_table(E3_STRONGHOLD_JUROR_NAMES), 1 do
			minimap_icon_remove_navpoint( E3_STRONGHOLD_JUROR_NAMES[x] )
			minimap_icon_remove_npc( E3_STRONGHOLD_JUROR_NAMES[x] )
			ingame_effect_remove_npc( E3_STRONGHOLD_JUROR_NAMES[x] )
			trigger_disable( "e3_district_door"..x.."_load" )
		end
		
		for x=1, sizeof_table(E3_sh_noise_thread_handles), 1 do
			audio_stop( E3_sh_current_noise_handles[x] )
			audio_stop( E3_sh_flee_noise_handles[ E3_STRONGHOLD_HO_NAMES[x] ] )
			thread_kill( E3_sh_noise_thread_handles[ x ] )
			thread_kill( E3_sh_animation_threads[ E3_STRONGHOLD_JUROR_NAMES[x] ] )
			thread_kill( E3_sh_animation_threads[ E3_STRONGHOLD_HO_NAMES[x] ] )
			thread_kill( E3_sh_flee_thread_handles[ E3_STRONGHOLD_HO_NAMES[x] ] )
		end

	thread_kill( E3_sh_flee_thread_handles[ "e3_district_Stripper-black#000"] )
	thread_kill( E3_sh_flee_thread_handles[ "e3_district_Stripper-white#000"] )
	audio_stop( E3_sh_flee_noise_handles[ "e3_district_Stripper-black#000" ] )
	audio_stop( E3_sh_flee_noise_handles[ "e3_district_Stripper-white#000" ] )

	release_to_world( "e3_district_bedroom_behind")
	release_to_world( "e3_district_bedroom_BJ" )
	release_to_world( "e3_district_bedroom_girls" )
	release_to_world( "e3_district_bedroom_sleep" )
	release_to_world( "e3_district_flee_strippers" )

	objective_text_clear()
end

function e3_district_stronghold_juror_death( name )
	E3_sh_juror_count = E3_sh_juror_count + 1

	thread_kill( E3_sh_animation_threads[ name ] )
	E3_sh_animation_threads[ name ] = -1
	
	minimap_icon_remove_npc( name )
	ingame_effect_remove_npc( name )
	
	if (E3_sh_juror_count == E3_STRONGHOLD_JURORS_FOR_VICTORY) then
		stronghold_takeover_success()
		mission_help_table( "e3_stronghold_won" )
	else
		objective_text( "e3_juror_killed", E3_sh_juror_count, E3_STRONGHOLD_JURORS_FOR_VICTORY )
	end
end

function e3_district_stronghold_ho_death( name )
	thread_kill( E3_sh_animation_threads[ name ] )
	E3_sh_animation_threads[ name ] = -1
	
	thread_kill( E3_sh_flee_thread_handles[ name ] )
	E3_sh_flee_thread_handles[ name ] = -1
end

function e3_district_stairs_top()
	group_create( "e3_district_flee_strippers", true );
	flee_to_navpoint( "e3_district_Stripper-black#000", E3_STRONGHOLD_FLEE_POINT ,"#PLAYER#", true )
	flee_to_navpoint( "e3_district_Stripper-white#000", E3_STRONGHOLD_FLEE_POINT ,"#PLAYER#", true )
	
	npc_suppress_persona( "e3_district_Stripper-black#000", true )
	npc_suppress_persona( "e3_district_Stripper-white#000", true )

	E3_sh_flee_thread_handles[ "e3_district_Stripper-black#000" ] = thread_new( "e3_stripper_scream", "e3_district_Stripper-black#000" )
	E3_sh_flee_thread_handles[ "e3_district_Stripper-white#000" ] = thread_new( "e3_stripper_scream", "e3_district_Stripper-white#000" )
end

-- Door functions

	-- this is the sex from behind one
function e3_district_stronghold_door01()
	mission_debug( E3_STRONGHOLD_DOOR_NAMES[1].." opened" )
	
	minimap_icon_add_npc( E3_STRONGHOLD_JUROR_NAMES[1], "radar_objkill" )
	ingame_effect_add_npc( E3_STRONGHOLD_JUROR_NAMES[1], "icon_red" )
	minimap_icon_remove_navpoint( E3_STRONGHOLD_JUROR_NAMES[1] )

	audio_stop( E3_sh_current_noise_handles[1] )
	thread_kill( E3_sh_noise_thread_handles[1] )
	
	E3_sh_animation_threads[E3_STRONGHOLD_HO_NAMES[1]] = thread_new( "tester_ho", E3_STRONGHOLD_HO_NAMES[1], "pfl1_bs_sx_strtl.animx" )
	E3_sh_animation_threads[E3_STRONGHOLD_JUROR_NAMES[1]] = thread_new( "tester", E3_STRONGHOLD_JUROR_NAMES[1], "pml1_bs_sx_strtl.animx" )
end

	-- this is the BJ one
function e3_district_stronghold_door02()
	mission_debug( E3_STRONGHOLD_DOOR_NAMES[2].." opened" )
	
	minimap_icon_add_npc( E3_STRONGHOLD_JUROR_NAMES[2], "radar_objkill" )
	ingame_effect_add_npc( E3_STRONGHOLD_JUROR_NAMES[2], "icon_red" )
	minimap_icon_remove_navpoint( E3_STRONGHOLD_JUROR_NAMES[2] )

	audio_stop( E3_sh_current_noise_handles[2] )
	thread_kill( E3_sh_noise_thread_handles[2] )
	
	E3_sh_animation_threads[E3_STRONGHOLD_HO_NAMES[2]] = thread_new( "tester_ho", E3_STRONGHOLD_HO_NAMES[2], "pfl1_bs_bj_strtl.animx" )
	E3_sh_animation_threads[E3_STRONGHOLD_JUROR_NAMES[2]] = thread_new( "tester", E3_STRONGHOLD_JUROR_NAMES[2], "pml1_bs_bj_strtl.animx" )
end

	-- this is the girl-on-girl one
function e3_district_stronghold_door03()
	mission_debug( E3_STRONGHOLD_DOOR_NAMES[3].." opened" )
	
	minimap_icon_add_npc( E3_STRONGHOLD_JUROR_NAMES[3], "radar_objkill" )
	ingame_effect_add_npc( E3_STRONGHOLD_JUROR_NAMES[3], "icon_red" )
	minimap_icon_remove_navpoint( E3_STRONGHOLD_JUROR_NAMES[3] )
	
	audio_stop( E3_sh_current_noise_handles[3] )
	thread_kill( E3_sh_noise_thread_handles[3] )
	
	E3_sh_animation_threads[E3_STRONGHOLD_HO_NAMES[3]] = thread_new( "tester_ho", E3_STRONGHOLD_HO_NAMES[3], "pfl1_bs_he_give_strtl.animx" )
	E3_sh_animation_threads[E3_STRONGHOLD_JUROR_NAMES[3]] = thread_new( "tester", E3_STRONGHOLD_JUROR_NAMES[3], "pfl1_bs_he_get_strtl.animx" )
end

	-- this is the in bed one
function e3_district_stronghold_door04()
	mission_debug( E3_STRONGHOLD_DOOR_NAMES[4].." opened" )
	
	minimap_icon_add_npc( E3_STRONGHOLD_JUROR_NAMES[4], "radar_objkill" )
	ingame_effect_add_npc( E3_STRONGHOLD_JUROR_NAMES[4], "icon_red" )
	minimap_icon_remove_navpoint( E3_STRONGHOLD_JUROR_NAMES[4] )
	
	audio_stop( E3_sh_current_noise_handles[4] )
	thread_kill( E3_sh_noise_thread_handles[4] )

	E3_sh_animation_threads[E3_STRONGHOLD_HO_NAMES[4]] = thread_new( "tester_ho", E3_STRONGHOLD_HO_NAMES[4], "PFL1_BS_SP_Strtl_B.animx" )
	E3_sh_animation_threads[E3_STRONGHOLD_JUROR_NAMES[4]] = thread_new( "tester", E3_STRONGHOLD_JUROR_NAMES[4], "pml1_bs_sp_strtl.animx" )
end

function e3_district_stronghold_door05()
	mission_debug( E3_STRONGHOLD_DOOR_NAMES[5].." opened" )
	
	if (not is_dead( "e3_district_Vllvl3_black#001" ) ) then
		attack( "e3_district_Vllvl3_black#001" )
	end
	
	if (not is_dead( "e3_district_Vllvl1_white#000" ) ) then
		attack( "e3_district_Vllvl1_white#000" )
	end
	
	if (not is_dead( "e3_district_Vllvl1_black#004" ) ) then
		attack( "e3_district_Vllvl1_black#004" )
	end
end

function tester( name, animation )
	play_custom_action( name, animation )
	npc_turn_material( name )
	flee_to_navpoint( name, E3_STRONGHOLD_FLEE_POINT ,"#PLAYER#", true )
	E3_sh_animation_threads[ name ] = -1
end

function tester_ho( name, animation )
	play_custom_action( name, animation )
	npc_turn_material( name )
	flee_to_navpoint( name, E3_STRONGHOLD_FLEE_POINT ,"#PLAYER#", true )
	E3_sh_animation_threads[ name ] = -1
	
	local handle, play = audio_play_for_character( E3_STRONGHOLD_HO_LINES[E3_STRONGHOLD_LINE_ASSOCIATIONS[name]][1],
																	name, "voice", false, false )
	E3_sh_flee_noise_handles[ name ] = handle
																	
	E3_sh_flee_thread_handles[ name ] = thread_new( "e3_stripper_scream", name )
end

	-- this is the sex from behind one
function e3_district_room01_noise()
	local sound_table = {"voc_bfstrp_escortsex_5M","voc_bfstrp_escortsex_7M","voc_bfstrp_escortsex_3M",
							"voc_wmrich_escortsex_4M","voc_wmrich_escortsex_6M"}
	local play_times = {3,3,2,3,2}

	local last = -1
	
	while (1) do
		local rand = last
		
		while (rand==last) do
			rand = rand_int( 1, sizeof_table(sound_table) )
		end
		
		last = rand
		local handle, play_time = audio_play_for_character( sound_table[rand], E3_STRONGHOLD_JUROR_NAMES[1],
																	"voice", false, false )
		play_time = play_times[rand]
	
		E3_sh_current_noise_handles[1] = handle

		while( play_time > 0 ) do
			thread_yield()
			play_time = play_time - delay_do()
		end
		
		E3_sh_current_noise_handles[1] = -1
		delay( 2 )
	end

	E3_sh_current_noise_handles[1] = -1
	E3_sh_noise_thread_handles[1] = -1
end

	-- this is the BJ one
function e3_district_room02_noise()
	local sound_table = {"voc_bfstrp_escortclimax_3M","voc_bfstrp_escortsex_4M","voc_wmrich_escortchat_4M",
							"voc_wmrich_escortclimax_1M","voc_wmrich_escortgreet_4M"}
	local play_times = {2,2,3,3,3}
	local last = -1
	
	while (1) do
		local rand = last
		
		while (rand==last) do
			rand = rand_int( 1, sizeof_table(sound_table) )
		end
		
		last = rand
		local handle, play_time = audio_play_for_character( sound_table[rand], E3_STRONGHOLD_JUROR_NAMES[2],
																	"voice", false, false )
		play_time = play_times[rand]
	
		E3_sh_current_noise_handles[2] = handle

		while( play_time > 0 ) do
			thread_yield()
			play_time = play_time - delay_do()
		end
		
		E3_sh_current_noise_handles[2] = -1
		delay( 2 )
	end

	E3_sh_current_noise_handles[2] = -1
	E3_sh_noise_thread_handles[2] = -1
end

	-- this is the girl-on-girl one
function e3_district_room03_noise()
	local sound_table = {"voc_bfyng_escortsex_2M","voc_bfyng_escortclimax_1M","voc_bfyng_escortclimax_4M",
							"voc_bfstrp_escortsex_6M","voc_bfstrp_escortsex_8M"}
	local play_times = {2,3,3,7,2}
	local last = -1
	
	while (1) do
		local rand = last
		
		while (rand==last) do
			rand = rand_int( 1, sizeof_table(sound_table) )
		end
		
		last = rand
		local handle, play_time = audio_play_for_character( sound_table[rand], E3_STRONGHOLD_JUROR_NAMES[3],
																	"voice", false, false )
		play_time = play_times[rand]
	
		E3_sh_current_noise_handles[3] = handle

		while( play_time > 0 ) do
			thread_yield()
			play_time = play_time - delay_do()
		end
		
		E3_sh_current_noise_handles[3] = -1
		delay( 2 )
		
	end

	E3_sh_current_noise_handles[3] = -1
	E3_sh_noise_thread_handles[3] = -1
end

	-- this is the in bed one
function e3_district_room04_noise()
	local sound_table = {"voc_bfstrp_escortclimax_5M","voc_bfstrp_escortexit_2M","voc_bfstrp_escortexit_4M",
							"voc_bmmid_escortclimax_4M"}
	local play_times = {3,2,3,2}
	local last = -1
	
	while (1) do
		local rand = last
		
		while (rand==last) do
			rand = rand_int( 1, sizeof_table(sound_table) )
		end

		last = rand
		local handle, play_time = audio_play_for_character( sound_table[rand], E3_STRONGHOLD_JUROR_NAMES[4],
																	"voice", false, false )
		play_time = play_times[rand]
	
		E3_sh_current_noise_handles[4] = handle
		
		while( play_time > 0 ) do
			thread_yield()
			play_time = play_time - delay_do()
		end
		
		E3_sh_current_noise_handles[4] = -1
		delay( 2 )
	end

	E3_sh_current_noise_handles[4] = -1
	E3_sh_noise_thread_handles[4] = -1
end

function e3_district_door1_load()
	trigger_disable( "e3_district_door1_load" )
	group_create("e3_district_bedroom_behind", true)
	E3_sh_current_noise_handles[1] = -1
	E3_sh_noise_thread_handles[1] = thread_new( "e3_district_room01_noise" )
	
	npc_suppress_persona( E3_STRONGHOLD_HO_NAMES[1], true )
	--npc_suppress_persona( E3_STRONGHOLD_JUROR_NAMES[1], true )
	
end
function e3_district_door2_load()
	trigger_disable( "e3_district_door2_load" )
	group_create("e3_district_bedroom_BJ", true)
	E3_sh_current_noise_handles[2] = -1
	E3_sh_noise_thread_handles[2] = thread_new( "e3_district_room02_noise" )
	
	npc_suppress_persona( E3_STRONGHOLD_HO_NAMES[2], true )
	--npc_suppress_persona( E3_STRONGHOLD_JUROR_NAMES[2], true )
end
function e3_district_door3_load()
	trigger_disable( "e3_district_door3_load" )
	group_create("e3_district_bedroom_girls", true)
	E3_sh_current_noise_handles[3] = -1
	E3_sh_noise_thread_handles[3] = thread_new( "e3_district_room03_noise" )
	
	npc_suppress_persona( E3_STRONGHOLD_HO_NAMES[3], true )
	--npc_suppress_persona( E3_STRONGHOLD_JUROR_NAMES[3], true )
end
function e3_district_door4_load()
	trigger_disable( "e3_district_door4_load" )
	group_create("e3_district_bedroom_sleep", true)
	E3_sh_current_noise_handles[4] = -1
	E3_sh_noise_thread_handles[4] = thread_new( "e3_district_room04_noise" )
	
	npc_suppress_persona( E3_STRONGHOLD_HO_NAMES[4], true )
	--npc_suppress_persona( E3_STRONGHOLD_JUROR_NAMES[4], true )
end

function e3_stripper_scream( name )
	local sound_table = E3_STRONGHOLD_HO_LINES[ E3_STRONGHOLD_LINE_ASSOCIATIONS[name] ]
	local last = -1
	
	while( audio_is_playing( E3_sh_flee_noise_handles[name] ) ) do
		thread_yield()
	end
	
	local scream_timer = E3_SCREAM_TIMERS[ name ]

	while (scream_timer > 0) do
		local rand = last
		
		while (rand==last) do
			rand = rand_int( 2, sizeof_table(sound_table) )
		end

		last = rand
		local handle, play_time = audio_play_for_character( sound_table[rand], name, "voice", false, false )
		play_time = E3_STRONGHOLD_AUDIO_LENGTHS[ sound_table[rand] ]
	
		E3_sh_flee_noise_handles[name] = handle
		
		scream_timer = scream_timer - play_time
		
		while( play_time > 0 ) do
			thread_yield()
			play_time = play_time - delay_do()
		end
		
		E3_sh_flee_noise_handles[name] = -1
		delay( 2 )
		
		scream_timer = scream_timer - 2
	end
	
	npc_suppress_persona( name, false )
	E3_sh_flee_thread_handles[name] = -1
end