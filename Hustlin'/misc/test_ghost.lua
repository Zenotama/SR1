

	-- Testing the Ghosting --

-- Globals --
tg_race_nav = {"test_ghost_$nav_race01", "test_ghost_$nav_race02", "test_ghost_$nav_race03", "test_ghost_$nav_race04", "test_ghost_$nav_race05"}
tg_race_thread_handles = {0,0,0}
tg_ricers = "test_ghost_WR1_ricer1"
tg_rice_ridaz = "test_ghost_WR1_rice_rida1"
tg_ricer_group = "test_ghost_$Group_WR1_rice_ridaz"
tg_all_dead = false
tg_ped_patrol = true

tg_patrol_nav = {"test_ghost_$vehicle001", "test_ghost_$vehicle002"}
tg_cars = {"test_ghost_$v_car1", "test_ghost_$v_car2"}
tg_drivers = {"test_ghost_driver1", "test_ghost_driver2"}
tg_patrol_group = {"test_ghost_$G_patrol"}

tg_ped_patrol = -1

function test_ghost_unlock()
	-- never unlock this.  only available from mission_start
end

function test_ghost_cleanup()
	trigger_disable("test_ghost_$e_create_block")
	trigger_disable("test_ghost_$e_create_noblock")
	trigger_disable("test_ghost_path_test_start")
	trigger_disable("test_ghost_follower_test")
	
	trigger_disable("test_ghost_start_pathing")
	trigger_disable("test_ghost_pathing_teleport")
	
	for i = 1, sizeof_table(tg_race_thread_handles), 1 do
		thread_kill(tg_race_thread_handles[i])
	end
	destroy_group(tg_ricer_group)
	destroy_group(tg_patrol_group)
	ingame_item_remove_navpoint("test_ghost_$execute lua script001")
	ingame_item_remove_navpoint("test_ghost_$execute lua script000")
	ingame_item_remove_navpoint("test_ghost_$execute lua script002")
	ingame_item_remove_navpoint("test_ghost_pathing_start")
	ingame_item_remove_navpoint("test_ghost_pathing_teleport")

	minimap_icon_remove_npc(tg_drivers[1]) 
	minimap_icon_remove_npc(tg_drivers[2]) 

	persona_override_remove_all()
	
	thread_kill( tg_ped_patrol )
end

function test_ghost_start()
	on_trigger("test_ghost_create_block", "test_ghost_$e_create_block")
	on_trigger("test_ghost_create_noblock", "test_ghost_$e_create_noblock")
	on_trigger("test_ghost_pathfind","test_ghost_path_test_start")
	on_trigger("test_ghost_follower_start","test_ghost_follower_test")
	
	on_trigger("test_ghost_start_pathing","test_ghost_start_pathing")
	on_trigger("test_ghost_teleport","test_ghost_pathing_teleport")

	-- setup the racers/race
	trigger_enable("test_ghost_$e_create_block")
	trigger_enable("test_ghost_$e_create_noblock")
	trigger_enable("test_ghost_path_test_start")
	trigger_enable("test_ghost_pathing_teleport")
	trigger_enable("test_ghost_follower_test")

	ingame_item_add_navpoint("test_ghost_$execute lua script001", "race_barrel")
	ingame_item_add_navpoint("test_ghost_$execute lua script000", "single_flag_green")
	ingame_item_add_navpoint("test_ghost_$execute lua script002", "single_flag_green")
	ingame_item_add_navpoint("test_ghost_pathing_teleport", "single_flag_green")
	ingame_item_add_navpoint("test_ghost_follower_test", "single_flag_green")

	minimap_icon_add_navpoint("test_ghost_$nav001", "radar_genrollerz.tga")

	mission_debug("Race Barrel Blocks on Create, Coin Doesn't", 0, 0)
	mission_debug("In the console type \"lua tgpatrol\" to start patrol", 0, 0)
	
	tg_ped_patrol = thread_new("test_ghost_ped_loop")
end

function test_ghost_create_block()
	trigger_disable("test_ghost_$e_create_block")
	trigger_disable("test_ghost_$e_create_noblock")
	mission_debug("Creating with blocking for streaming", 0, 0)
	-- sets up the race
	create_group(tg_ricer_group, true)
	-- throw the racers in their cars
	character_add_vehicle(tg_rice_ridaz, tg_ricers, 0)
	-- make the racers show up on the minimap
	minimap_icon_add_npc(tg_rice_ridaz, "radar_genrollerz.tga") 
	-- add the death check
	on_death("test_ghost_check_tg_all_dead", tg_rice_ridaz)
	-- start them on their route
	tg_race_thread_handles[1] = thread_new("test_ghost_run_race")
end

function test_ghost_create_noblock()
	trigger_disable("test_ghost_$e_create_block")
	trigger_disable("test_ghost_$e_create_noblock")
	mission_debug("Creating with no blocking for streaming", 0, 0)
	-- sets up the race
	create_group(tg_ricer_group, true)
	-- throw the racers in their cars
	character_add_vehicle(tg_rice_ridaz, tg_ricers, 0)
	-- make the racers show up on the minimap
	minimap_icon_add_npc(tg_rice_ridaz, "radar_genrollerz.tga") 
	-- add the death check
	on_death("test_ghost_check_tg_all_dead", tg_rice_ridaz)
	-- start them on their route
	tg_race_thread_handles[1] = thread_new("test_ghost_run_race")
	-- vehicle_chase(tg_ricers, "#PLAYER#", false, true)
end

function test_ghost_check_tg_all_dead()
	tg_all_dead = true
		if not is_dead(tg_rice_ridaz) then
			tg_all_dead = false
		else 
			minimap_icon_remove_npc(tg_rice_ridaz)
		end
	-- check victory condition
	if tg_all_dead then
		mission_debug("Why did he die?", 0, 0)
	end
end

function test_ghost_run_race()
	-- need to check to see if the car still has a driver
	while get_char_in_vehicle(tg_ricers, 0) and not(is_dead(tg_rice_ridaz)) do
		vehicle_pathfind_to(tg_ricers, tg_race_nav, false)
	end
end

function tgpatrol()
	minimap_icon_add_navpoint("test_ghost_$nav001", "radar_genrollerz.tga")
	create_group(tg_patrol_group, true)
	minimap_icon_remove_navpoint("test_ghost_$nav001")
	tg_race_thread_handles[2] = thread_new("test_ghost_driveloop", 1)
	tg_race_thread_handles[3] = thread_new("test_ghost_driveloop", 2)
	mission_debug("Default patrolling guys created and patrolling...", 0, 0)
end

function tgflee()
	tg_ped_patrol = false
end

function test_ghost_driveloop(index)
	local i 
	i = mod(index, 2)+1
	character_add_vehicle(tg_drivers[index], tg_cars[index], 0)
	minimap_icon_add_npc(tg_drivers[index], "radar-blipred2.tga") 
	while get_char_in_vehicle(tg_cars[index], 0) and not(is_dead(tg_drivers[index])) do
		mission_debug("Car: " .. index .. ", Target: " .. i, 0, index - 1)
		vehicle_pathfind_to(tg_cars[index], tg_patrol_nav[i], true)
		mission_debug("Car: " .. index .. ", Arrived: " .. i, 3.0, index + 1)
		i = mod(i, 2) + 1
	end
end

function test_ghost_success()
	mission_debug("You can win this?  I didn't think it was scripted like that.", 0, 0)
	mission_end_success("test_ghost")
end

function test_ghost_ped_loop()
	create_group( "test_ghost_ped_patrol", true )
	persona_override_human_start( "test_ghost_ped_test", "voice - startled line", "", 3);
	persona_override_human_start( "test_ghost_ped_test", "cower - damage received (melee)", "VOC_BFStrp_EscortSex", 1);
	persona_override_human_start( "test_ghost_ped_test", "flee - damage", "VOC_BFStrp_EscortSex", 1);

	--while (tg_ped_patrol) do
	--	move_to( "test_ghost_ped_test", "test_ghost_$nav005", "test_ghost_$nav004", 2 )
	--end

	--flee("test_ghost_ped_test", "#PLAYER#", false, true);
end

function tg_clear_startle()
	persona_override_human_stop( "test_ghost_ped_test", "voice - startled line" );
end

function tg_clear_all_human()
	persona_override_human_stop_all( "test_ghost_ped_test" );
end

function tg_clear_all()
	persona_override_remove_all();
end

function test_ghost_pathfind()
	trigger_disable("test_ghost_path_test_start")

	create_group( "test_ghost_path_test", true )
	character_add_vehicle("test_ghost_path_test_driver","test_ghost_path_test_car",0)
	
	vehicle_pathfind_to("test_ghost_path_test_car", "test_ghost_$nav006", false )
end

function test_ghost_teleport()
	trigger_disable("test_ghost_pathing_teleport")
	
	trigger_enable("test_ghost_start_pathing")
	ingame_item_add_navpoint("test_ghost_start_pathing", "single_flag_green")
	
	teleport( "#PLAYER#", "test_ghost_angelo_teleport" )
	
	group_create( "test_ghost_ChaseCars", true )
	
	turn_invulnerable( "test_ghost_Angelo" )
	character_add_vehicle( "test_ghost_Angelo", "test_ghost_AngeloCar", 0 )
	set_ignore_ai_flag( "test_ghost_Angelo", true )
	
end

function test_ghost_start_pathing()
	trigger_disable("test_ghost_start_pathing")
	vehicle_speed_override( "test_ghost_AngeloCar", 15 )
	vehicle_should_obey_traffic( "test_ghost_AngeloCar", false )
	vehicle_pathfind_to( "test_ghost_AngeloCar", "test_ghost_spline_path_end", false)
end

function test_ghost_follower_start()
	trigger_disable("test_ghost_follower_test")
	on_death( "test_ghost_follower_dead", "test_ghost_follower" )

	group_create( "test_ghost_followers", true )
	party_add( "test_ghost_follower" )
	
	npc_unholster_best_weapon( "test_ghost_attacker" )
	attack( "test_ghost_attacker", "test_ghost_follower" )

end

function test_ghost_follower_dead()
	mission_debug( "the follower died" )
end

function test_ghost_toast_follower_group()
	group_destroy( "test_ghost_followers" )
	trigger_enable("test_ghost_follower_test")
end