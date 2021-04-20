-- Global Variables------
lc07_Victor_attack_thread = -1
lc07_car_thread = -1
lc07_Saint_pathing_threads = {-1,-1}
lc07_Victor_chatter_thread = -1

lc07_Victor_is_dead = false

LC07_WAVE1_TARGETS = {"lc07_wave1_dude1", "lc07_wave1_dude2", "lc07_wave1_dude3", "lc07_wave1_dude4", "lc07_wave1_dude5"}
LC07_WAVE2_TARGETS = {"lc07_wave2_dude1", "lc07_wave2_dude2", "lc07_wave2_dude3", "lc07_wave2_dude4", "lc07_wave2_dude5", "lc07_wave2_dude6"}
LC07_WAVE3_TARGETS = {"lc07_wave3_dude1", "lc07_wave3_dude2", "lc07_wave3_dude3", "lc07_wave3_dude4", "lc07_wave3_dude5", "lc07_wave3_dude6"}
LC07_WAVE4_TARGETS = {	"lc07_wave4_dude1", "lc07_wave4_dude2", "lc07_wave4_dude3", "lc07_wave4_dude4", 
						"lc07_wave4_dude5", "lc07_wave4_dude6", "lc07_wave4_dude7", "lc07_wave4_dude8"}

LC07_WAVE_TABLE = {LC07_WAVE1_TARGETS , LC07_WAVE2_TARGETS, LC07_WAVE3_TARGETS, LC07_WAVE4_TARGETS }

LC07_OUTSIDE_GUYS = {"lc07_outside1", "lc07_outside2", "lc07_outside3", "lc07_outside4", "lc07_outside5" }
LC07_GY_GUYS = {"lc07_gy1", "lc07_gy2", "lc07_gy3", "lc07_gy4", "lc07_gy5", "lc07_gy6", "lc07_gy7", "lc07_gy8" }

LC07_VICTOR_PATH = {"lc07_$nvicpath000", "lc07_$nvicpath001", "lc07_$nvicpath002", "lc07_$nvicpath003", "lc07_$nvicpath004", 
						"lc07_$nvicpath005", "lc07_$nvicpath006", "lc07_$nvicpath007", "lc07_$nvicpath008", "lc07_$nvicpath009", 
						"lc07_$nvicpath010", "lc07_$nvicpath011", "lc07_$nvicpath012", "lc07_$nvicpath013", "lc07_$nvicpath014" }
						 
LC07_VICTOR_PATH2 = {"lc07_$nvicpath015", "lc07_$nvicpath016", "lc07_$nvicpath017", "lc07_$nvicpath018", "lc07_$nvicpath019", 
						"lc07_$nvicpath020", "lc07_$nvicpath021", "lc07_$nvicpath022", "lc07_$nvicpath023", "lc07_$nvicpath024", "lc07_$nvicpath025"}

LC07_WAVE1_CARS = {"lc07_wave1_car1", "lc07_wave1_car2"}
LC07_WAVE2_CARS = {"lc07_wave2_car1", "lc07_wave2_car2"}
LC07_WAVE3_CARS = {"lc07_wave3_car1", "lc07_wave3_car2"}
LC07_WAVE4_CARS = {"lc07_wave4_car1", "lc07_wave4_car2"}

LC07_CAR_TABLE = {LC07_WAVE1_CARS, LC07_WAVE2_CARS, LC07_WAVE3_CARS, LC07_WAVE4_CARS }

lc07_group_finished = false
lc07_current_targets = {}
lc07_waves_done = false

lc07_threads = {}

-- FUNCTIONS ----------------------------

function lc07_cleanup()
	notoriety_reset_vehicle_count("Los Carnales")
	special_spawns_enable(true)
	spawning_peds(true)
	if( lc07_waves_done ) then
		set_unjackable_flag( "lc07_Victor_group_car", false )
	end

	hud_timer_stop()
	
	local table_size = sizeof_table( LC07_WAVE_TABLE )
	for x=1, table_size, 1 do
		local wave_size = sizeof_table( LC07_WAVE_TABLE[x] )	
		for y=1, wave_size, 1 do
			on_death( "", LC07_WAVE_TABLE[x][y] )
			remove_marker_npc( LC07_WAVE_TABLE[x][y] )
		end
	end
	
	on_vehicle_destroyed( "", "lc07_Victor_group_car" )
	on_death( "", "lc07_Victor" )

	notoriety_reset( "los_carnales" )

	damage_indicator_off()
	remove_marker_npc( "lc07_Victor" )

	on_death( "", "lc07_Julius" )
	on_dismiss( "", "lc07_Julius" )
	on_death( "", "lc07_rand_saint1" )
	on_dismiss( "", "lc07_rand_saint1" )
	on_death( "", "lc07_rand_saint2" )
	on_dismiss( "", "lc07_rand_saint2" )

	party_dismiss("lc07_Julius")
	never_die( "lc07_Julius", false )

	trigger_disable( "lc07_church_control" )
	on_trigger_exit( "", "lc07_church_control" )
	on_trigger( "", "lc07_church_control" )

	release_to_world( "lc07_wave1" )
	release_to_world( "lc07_wave2" )
	release_to_world( "lc07_wave3" )
	release_to_world( "lc07_wave4" )

	for x=1,4,1 do
		release_to_world("lc07_inside"..x)
	end
	
	for i,char in pairs(LC07_OUTSIDE_GUYS) do
		release_to_world(char)
	end

	for i,char in pairs(LC07_GY_GUYS) do
		release_to_world(char)
	end

	group_destroy( "lc07_Victor_group" )
	group_destroy( "lc07_Saints" )
end

function lc07_success()
	message("You're the winner!")
	mission_unlock("barrio_stronghold")
	mission_set_next_props_req( "los_carnales", LC08_REQUIRED_PROPS )
end

function lc07_inside()
	while not (is_dead("lc07_inside1") and is_dead("lc07_inside2") and is_dead("lc07_inside3") and is_dead("lc07_inside4")) do
		thread_yield()
	end
	
	delay(5)
	
	audio_play_for_character("DEX_LC7_ATTKSOUTH", "lc07_rand_saint1", "voice", false, true, -1, 3)
	mission_help_table("lc07_defend_gy")
	for i,char in pairs(LC07_GY_GUYS) do
		character_show(char)
	end

	lc07_threads["lc07_Julius"] = thread_new( "lc07_path_wrap", "lc07_Julius", "lc07_gy_julius" )
	delay(1)
	lc07_threads["lc07_rand_saint2"] = thread_new( "lc07_path_wrap", "lc07_rand_saint2", "lc07_gy_troy" )
	delay(2)
	lc07_threads["lc07_rand_saint1"] = thread_new( "lc07_path_wrap", "lc07_rand_saint1", "lc07_gy_dex" )
end

function lc07_start()
	set_mission_author("Russell Aasland")
	special_spawns_enable(false)
	spawning_peds(false)
	party_dismiss_all( )
	
	on_trigger_exit( "lc07_church_exit", "lc07_church_control" )

	lc07_Victor_is_dead = false
	lc07_waves_done = false
	
	local table_size = sizeof_table( LC07_WAVE_TABLE )
	for x=1, table_size, 1 do
		local wave_size = sizeof_table( LC07_WAVE_TABLE[x] )
		
		for y=1, wave_size, 1 do
			on_death( "lc07_wave_kill", LC07_WAVE_TABLE[x][y] )
		end
	end
	
	on_death( "lc07_julius_failure", "lc07_Julius" )
	on_dismiss( "lc07_julius_abandon_failure", "lc07_Julius" )
	
	on_death( "lc07_troy_failure", "lc07_rand_saint1" )
	on_dismiss( "lc07_troy_abandon_failure", "lc07_rand_saint1" )
	
	on_death( "lc07_dex_failure", "lc07_rand_saint2" )
	on_dismiss( "lc07_dex_abandon_failure", "lc07_rand_saint2" )

	cutscene_in("lc07_scene01")
	cutscene_play( "lc07_scene01", "lc07_Saints" )
	character_show( "lc07_Julius" )
	character_show( "lc07_rand_saint1" )
	character_show( "lc07_rand_saint2" )
	notoriety_set_min( "los_carnales", 2 )
	notoriety_set_desired_vehicle_count("Los Carnales", 0)
	for x=1,4,1 do
		character_show("lc07_inside"..x)
	end
	
	
	teleport( "#PLAYER#", "lc07_player_port" )
	
	persona_override_human_start( "lc07_Julius", "threat - damage received (firearm)", "JULIUS_LC7_DAMAGE" )
	persona_override_human_start( "lc07_rand_saint1", "threat - damage received (firearm)", "TROY_LC7_DAMAGE" )
	persona_override_human_start( "lc07_rand_saint2", "threat - damage received (firearm)", "DEX_LC7_DAMAGE" )
	persona_override_human_start( "lc07_rand_saint1", "combat - congratulate self", "TROY_LC7_ATTACK" )
	persona_override_human_start( "lc07_rand_saint2", "combat - congratulate self", "DEX_LC7_ATTACK" )

	trigger_enable( "lc07_church_control" )
	
	party_add( "lc07_Julius", "lc07_rand_saint1", "lc07_rand_saint2" )
	
	follower_make_independent( "lc07_Julius" )
	follower_make_independent( "lc07_rand_saint1" )
	follower_make_independent( "lc07_rand_saint2" )
		
	table_size = sizeof_table( LC07_WAVE_TABLE )
	
	pause_menu_objective_add( "lc07_defend" )
	
	audio_play_for_character( "JULIUS_LC7_START_1", "lc07_Julius", "voice", false, true, -1, 2 )
	mission_help_table_nag( "lc07_defend" )
	
	lc07_threads["inside"] = thread_new( "lc07_inside" )
	
	for i,char in pairs(LC07_OUTSIDE_GUYS) do
		character_show(char)
		attack(char, "lc07_Julius")
	end
	
	delay(45)
	notoriety_set_desired_vehicle_count("Los Carnales", 0)
	for x=1, table_size, 1 do
		if x == 2 then
			notoriety_set_desired_vehicle_count("Los Carnales", 1)
		end
		if x == 3 then
			audio_play_for_character("DEX_LC7_ATTKNORTH", "lc07_rand_saint1", "voice", false, true, -1, 3)
			mission_help_table("lc07_defend_north")
			thread_kill(lc07_threads["lc07_Julius"])
			lc07_threads["lc07_Julius"] = thread_new( "lc07_path_wrap2", "lc07_Julius", "lc07_side_julius" )
			delay(1)
			thread_kill(lc07_threads["lc07_rand_saint2"])
			lc07_threads["lc07_rand_saint2"] = thread_new( "lc07_path_wrap2", "lc07_rand_saint2", "lc07_side_troy" )
			delay(2)
			thread_kill(lc07_threads["lc07_rand_saint1"])
			lc07_threads["lc07_rand_saint1"] = thread_new( "lc07_path_wrap2", "lc07_rand_saint1", "lc07_side_dex" )
			notoriety_set_desired_vehicle_count("Los Carnales", 1)
		end
		if x == 4 then
			notoriety_set_desired_vehicle_count("Los Carnales", 2)
		end
		
		lc07_start_wave( x )
		
		--while (not lc07_group_finished) do
		--	thread_yield()
		--end
		delay(39)
		--delay(3)
	end
	
	lc07_waves_done = true
	
	--Victor
	
	group_create( "lc07_Victor_group", true )
	on_vehicle_destroyed( "lc07_car_death", "lc07_Victor_group_car" )
	
	character_add_vehicle( "lc07_Victor", "lc07_Victor_group_car", 0 )
	character_add_vehicle( "lc07_pass01", "lc07_Victor_group_car", 1 )
	character_add_vehicle( "lc07_pass02", "lc07_Victor_group_car", 2 )
	character_add_vehicle( "lc07_pass03", "lc07_Victor_group_car", 3 )
	set_unjackable_flag( "lc07_Victor_group_car", true )
	
	on_death( "lc07_Victor_dead", "lc07_Victor" )
	add_marker_npc( "lc07_Victor", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
	
	lc07_threads["car"] = thread_new( "lc07_car_pathing" )
	
	pause_menu_objective_add( "lc07_destroy_car" )
	audio_play_for_character( "JULIUS_LC7_WAVE2_1", "lc07_Julius", "voice", false, true, -1, 2 )
	mission_help_table_nag( "lc07_destroy_car" )
	
	follower_make_dependent( "lc07_Julius" )
	follower_make_dependent( "lc07_rand_saint1" )
	follower_make_dependent( "lc07_rand_saint2" )
	
	while( not lc07_Victor_is_dead ) do
		thread_yield()
	end
	
	audio_play_for_character( "JULIUS_LC7_WIN_1", "lc07_Julius", "voice", false, true, -1, 3 )
	
	trigger_disable( "lc07_church_control" )
	hud_timer_stop()

	cutscene_in("lc07_scene02")
	
	thread_kill( lc07_Victor_chatter_thread )
	damage_indicator_off()
	
	for i,thread in pairs(lc07_threads) do
		thread_kill(thread)
	end
	
	group_destroy( "lc07_Victor_group" )
	group_destroy( "lc07_Saints" )
	
	cutscene_play( "lc07_scene02", true )
	
	mission_end_success( "lc07" )
end

function lc07_church_enter()
	on_trigger_exit( "lc07_church_exit","lc07_church_control" )
	
	hud_timer_stop()
end

function lc07_church_exit()
	on_trigger( "lc07_church_enter", "lc07_church_control" )
	
	hud_timer_set( 10 * 1000, "lc07_timer_failure" )
	
	mission_help_table( "lc07_abandoning" )
end

function lc07_path_wrap( name, nav )
	--set_ignore_ai_flag( name, true )
	move_to( name, nav, 2, true, true )
	--set_ignore_ai_flag( name, false )
	
	npc_leash_to_nav( name, nav, 4 )
	if name == "lc07_Julius" then
		attack(name, LC07_GY_GUYS[1])
	end
	if name == "lc07_rand_saint1" then
		attack(name, LC07_GY_GUYS[4])
	end
	if name == "lc07_rand_saint2" then
		attack(name, LC07_GY_GUYS[6])
	end
end

function lc07_path_wrap2( name, nav )
	npc_leash_to_nav( name, nav, 400 )
	move_to( name, nav, 2, true, true )
	npc_leash_to_nav( name, nav, 4 )
end

function lc07_timer_failure()
	mission_end_failure( "lc07", "lc07_fail_abandon" )
end

function lc07_julius_failure()
	mission_end_failure( "lc07", "lc07_fail_julius" )
end

function lc07_julius_abandon_failure()
	mission_end_failure( "lc07", "lc07_abandon_julius" )
end

function lc07_troy_failure()
	mission_end_failure( "lc07", "lc07_fail_troy" )
end

function lc07_troy_abandon_failure()
	mission_end_failure( "lc07", "lc07_abandon_troy" )
end

function lc07_dex_failure()
	mission_end_failure( "lc07", "lc07_fail_dex" )
end

function lc07_dex_abandon_failure()
	mission_end_failure( "lc07", "lc07_abandon_dex" )
end

-- Wave Functions
lc07_wave_kill_count = 0
function lc07_start_wave( index )
	lc07_wave_kill_count = 0
	lc07_group_finished = false
	
	lc07_current_targets = LC07_WAVE_TABLE[ index ]
	local targets_size = sizeof_table( lc07_current_targets )
	
	local car_table = LC07_CAR_TABLE[ index ]
	local car_count = sizeof_table( car_table )
	
	local dudes_per_car =  targets_size / car_count
	local total = 1
	
	group_create( "lc07_wave"..index, true )
	
	for x=1, car_count, 1 do
	
		local y = 0
		local char_table = {}
		while (y < dudes_per_car and total <= targets_size) do
			character_add_vehicle( lc07_current_targets[total], car_table[x], y )
			
			char_table[ y + 1 ] = lc07_current_targets[total]
			
			y = y + 1
			total = total + 1
		
		end
		
		lc07_threads[car_table[x]] = thread_new( "lc07_vehicle_path_wrap", car_table[x], car_table[x].."_path", char_table )
	end
end

function lc07_wave_kill( name )
	lc07_wave_kill_count = lc07_wave_kill_count + 1
	remove_marker_npc( name )
	
	if (lc07_wave_kill_count > (sizeof_table( lc07_current_targets) - 2)) then
		lc07_group_finished = true
	end
end

function lc07_vehicle_path_wrap( name, nav, char_table )
	vehicle_pathfind_to( name, nav, true, true )
	
	local table_size = sizeof_table( char_table )
	
	for x=1,table_size,1 do
		vehicle_exit( char_table[x] )
		attack( char_table[x] )
	end
	
	remove_marker_vehicle( name )
end

-- Victor Group Functions

function lc07_car_pathing()
	vehicle_disable_flee("lc07_Victor_group_car", true)
	vehicle_disable_chase("lc07_Victor_group_car", true)
	vehicle_supress_npc_exit( "lc07_Victor_group_car", true )
	notoriety_set_max( "los_carnales", 3 )
	notoriety_set_min( "los_carnales", 3 )
	lc07_Victor_chatter_thread = thread_new( "lc07_victor_chatter" )

	while( not is_vehicle_destroyed("lc07_Victor_group_car")) do
		vehicle_pathfind_to( "lc07_Victor_group_car", LC07_VICTOR_PATH, true, false )
		vehicle_pathfind_to( "lc07_Victor_group_car", LC07_VICTOR_PATH2, true, false )
		thread_yield()
	end
end

function lc07_car_death()
	character_ignite( "lc07_Victor", true )
	set_ignore_ai_flag( "lc07_Victor", true )

	npc_prevent_flinching( "lc07_Victor", true )
	npc_holster( "lc07_Victor" )
	inv_item_remove_all( "lc07_Victor" )
	npc_weapon_pickup_override( "lc07_Victor", false )
	npc_prevent_kneecapping( "lc07_Victor", true )
	
	while( not human_is_ready( "lc07_Victor" ) ) do
		thread_yield()
	end

	audio_play_for_character( "JULIUS_LC7_VICTOR_1", "lc07_Julius", "voice", false, true, -1, 3 )
	mission_help_table( "lc07_kill_victor" )

	turn_vulnerable( "lc07_Victor" )
	damage_indicator_on( "lc07_Victor", 0, "lc07_victor" )
	
	lc07_threads["victor"] = thread_new("lc07_Victor_attack")
end

function lc07_Victor_attack()
	move_to( "lc07_Victor", "lc07_victor_church", 2 )
	set_ignore_ai_flag( "lc07_Victor", false )

	while( not is_dead("lc07_Victor") ) do
		local dis_to_player = get_dist_char_to_char( "lc07_Victor", "#PLAYER#" )
		local dis_to_jules = get_dist_char_to_char( "lc07_Victor", "lc07_Julius" )
		
		if (dis_to_player <= dis_to_jules) then
			attack("lc07_Victor", "#PLAYER#" )
		else
			attack("lc07_Victor", "lc07_Julius" )
		end

		delay(10)
	end
end

function lc07_Victor_dead()
	lc07_Victor_is_dead = true;
end

function lc07_victor_chatter()
	local play_table = {}
	
	for x=1, 4, 1 do
		play_table[x] = false
	end
	
	while( not play_table[4] ) do
	
		delay( rand_float( 10, 25) )
	
		local rand = rand_int( 1, 3 )
		while( play_table[ rand ] ) do
			rand = rand_int( 1, 3 )
		end
		play_table[rand] = true
	
		play_table[4] = true
		for x=1, 3, 1 do
			play_table[4] = play_table[4] and play_table[x]
		end

		audio_play_for_character( "VICTOR_LC7_ATTACK", "lc07_Victor", "voice", false, true, rand )
	end
end