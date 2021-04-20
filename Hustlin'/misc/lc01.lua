
lc01_current_lab = -1

lc01_LAB_TRIGGERS = {"lc01_lab_two","lc01_lab_three"}

lc01_lab_count = 0

lc01_iloop_debug = false
function lc01_iloop_test()
	lc01_iloop_debug = true
end

function lc01_cleanup()
	special_spawns_enable(true)
	mission_waypoint_remove()
	
	for x=1,sizeof_table(lc01_LAB_TRIGGERS),1 do
		trigger_disable( lc01_LAB_TRIGGERS[x] )
		trigger_disable( lc01_LAB_TRIGGERS[x].."_half" )
		
		minimap_icon_remove_navpoint("lc01_l"..(x+1).."_drug")
		
		on_trigger( "", lc01_LAB_TRIGGERS[x] )
		on_trigger_exit( "", lc01_LAB_TRIGGERS[x] )
		on_trigger( "", lc01_LAB_TRIGGERS[x].."_half" )
		
		local actual_number = x+1

		on_trigger("", "lc01_lab"..actual_number.."_entry" )

		on_mover_destroyed("","lc01_l"..actual_number.."_equipment")
		remove_marker_navpoint( "lc01_l"..actual_number.."_drug" )
		release_to_world("lc01_l"..actual_number.."_exterior")
		release_to_world("lc01_l"..actual_number.."_interior")
	end
	
	objective_text_clear()
	notoriety_reset( "los_carnales" )
end

function lc01_success()
	--message("You're the winner!")
	hood_set_owner( "lc_barrio03", "Playas" )
	hood_set_owner( "lc_factory01", "Playas" )

	mission_set_next_props_req( "los_carnales", LC02_REQUIRED_PROPS )
	radio_post_event("NEWS_LC_LABSBLOWNUP", false)
end

function lc01_start()
	set_mission_author("Russell Aasland")
	lc01_lab_count = 0
	special_spawns_enable(false)
	cellphone_remove("LC intro phone call")
	persona_override_persona_start( "HM_LC1", "threat - damage received (firearm)", "HMLC1_LC1ATTACK" )
	persona_override_persona_start( "HM_LC2", "threat - damage received (firearm)", "HMLC2_LC1ATTACK" )
	persona_override_persona_start( "HM_LC3", "threat - damage received (firearm)", "HMLC3_LC1ATTACK" )
	persona_override_persona_start( "WM_LC1", "threat - damage received (firearm)", "WMLC1_LC1ATTACK" )
	persona_override_persona_start( "WM_LC2", "threat - damage received (firearm)", "WMLC2_LC1ATTACK" )
	persona_override_persona_start( "WM_LC3", "threat - damage received (firearm)", "WMLC3_LC1ATTACK" )

	persona_override_persona_start( "HF_LC1", "threat - damage received (firearm)", "HFLC1_LC1ATTACK" )
	persona_override_persona_start( "HF_LC2", "threat - damage received (firearm)", "HFLC2_LC1ATTACK" )
	persona_override_persona_start( "HF_LC3", "threat - damage received (firearm)", "HFLC3_LC1ATTACK" )
	persona_override_persona_start( "WF_LC1", "threat - damage received (firearm)", "WFLC1_LC1ATTACK" )
	persona_override_persona_start( "WF_LC2", "threat - damage received (firearm)", "WFLC2_LC1ATTACK" )
	persona_override_persona_start( "WF_LC3", "threat - damage received (firearm)", "WFLC3_LC1ATTACK" )
	
	for x=1,sizeof_table(lc01_LAB_TRIGGERS),1 do
		trigger_disable( lc01_LAB_TRIGGERS[x] )
		trigger_disable( lc01_LAB_TRIGGERS[x].."_half" )
		
		on_trigger( lc01_LAB_TRIGGERS[x].."_arrival", lc01_LAB_TRIGGERS[x] )
		on_trigger( "lc01_lab_arrival_half", lc01_LAB_TRIGGERS[x].."_half" )
		
		on_trigger("lc01_lab_entry", "lc01_lab"..(x+1).."_entry" )
	end

	cutscene_in("lc01_scene01")
	cutscene_play( "lc01_scene01" )
	teleport("#PLAYER#", "mission_start_lc01" )
	
	mission_waypoint_add("lc01_l2_gps")
	
	for x=1,sizeof_table(lc01_LAB_TRIGGERS),1 do
		trigger_enable( lc01_LAB_TRIGGERS[x] )
		trigger_enable( lc01_LAB_TRIGGERS[x].."_half" )

		minimap_icon_add_navpoint("lc01_l"..(x+1).."_drug", MINIMAP_ICON_KILL)
		on_mover_destroyed("lc01_equip_destroyed", "lc01_l"..(x+1).."_equipment")
	end
	
	for x=1, sizeof_table(lc01_LAB_TRIGGERS), 1 do
		create_group("lc01_l"..(x+1).."_exterior",true)
	end

	lc01_current_lab = -1
	
	notoriety_set_max( "los_carnales", 2 )
	
	delay(2)
	mission_help_table( "lc01_start" )
	objective_text( "lc01_objective", 2-lc01_lab_count, sizeof_table(lc01_LAB_TRIGGERS) )
	
	--patrol( "lc01_patrol1", "lc01_l"..1 .."_patrol"..1 )
	--patrol( "lc01_patrol2", "lc01_l"..1 .."_patrol"..2 )
	patrol( "lc01_patrol1", "lc01_l"..2 .."_patrol"..1 )
	--patrol( "lc01_patrol1", "lc01_l"..2 .."_patrol"..2 )
	patrol( "lc01_patrol1", "lc01_l"..3 .."_patrol"..1 )
	patrol( "lc01_patrol2", "lc01_l"..3 .."_patrol"..2 )
end

--[[
function lc01_lab_one_arrival()
	lc01_current_lab = 1
	mission_debug("Lab One", 0, 0)
end
]]

function lc01_lab_two_arrival()
	lc01_current_lab = 1
	mission_debug("Lab Two", 0, 0)
end

function lc01_lab_three_arrival()
	lc01_current_lab = 2
	mission_debug("Lab Three", 0, 0)
end

function lc01_lab_arrival_half()
	while( lc01_current_lab == -1 ) do
		thread_yield()
	end
	
	local lab_number = lc01_current_lab + 1

	trigger_disable( lc01_LAB_TRIGGERS[lc01_current_lab].."_half" )

	minimap_icon_remove_navpoint("lc01_l"..lab_number.."_drug")
	
	trigger_enable( "lc01_lab"..lab_number.."_entry" )
	on_trigger_exit( "lc01_lab_exit", lc01_LAB_TRIGGERS[lc01_current_lab] )
	
	group_create( "lc01_l"..lab_number.."_interior", true )
	add_marker_navpoint( "lc01_l"..lab_number.."_drug", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
end

function lc01_lab_exit()
	local lab_number = lc01_current_lab + 1

	on_trigger_exit( "", lc01_LAB_TRIGGERS[lc01_current_lab] )

	mission_debug("Lab "..lab_number.." left", 0, 0)
	group_destroy( "lc01_l"..lab_number.."_interior" )

	minimap_icon_add_navpoint("lc01_l"..lab_number.."_drug", MINIMAP_ICON_KILL)
	remove_marker_navpoint( "lc01_l"..lab_number.."_drug" )

	trigger_disable( "lc01_lab"..lab_number.."_entry" )
	trigger_enable( lc01_LAB_TRIGGERS[lc01_current_lab].."_half" )

	lc01_current_lab = -1
end

function lc01_lab_entry()
	local lab_number = lc01_current_lab + 1
	
	trigger_disable( "lc01_lab"..lab_number.."_entry" )
	mission_help_table_nag( "lc01_arrival" )

	if ((lc01_lab_count+1) <= 2) then
		notoriety_set_min( "los_carnales", lc01_lab_count+1 )
	end
	
	attack_safe( "lc01_l"..lab_number.."_patrol1" )
	--attack_safe( "lc01_l"..lab_number.."_patrol2" )
	attack_safe( "lc01_l"..lab_number.."_guard1" )
	--attack_safe( "lc01_l"..lab_number.."_guard2" )
end

function lc01_equip_destroyed()
	local lab_number = lc01_current_lab + 1
	
	trigger_disable( lc01_LAB_TRIGGERS[lc01_current_lab] )
	trigger_disable( lc01_LAB_TRIGGERS[lc01_current_lab].."_half" )
	trigger_disable( "lc01_lab"..lab_number.."_entry" )

	minimap_icon_remove_navpoint("lc01_l"..lab_number.."_drug")
	remove_marker_navpoint( "lc01_l"..lab_number.."_drug" )
	
	release_to_world( "lc01_l"..lab_number.."_interior" )
	release_to_world( "lc01_l"..lab_number.."_exterior" )

	lc01_lab_count = lc01_lab_count + 1
	objective_text( "lc01_objective", 2-lc01_lab_count, sizeof_table(lc01_LAB_TRIGGERS) )
	
	mission_waypoint_remove()
	
	if(lc01_lab_count == sizeof_table(lc01_LAB_TRIGGERS)) then
		delay(3)
		mission_end_success( "lc01" )
	else
		if lc01_current_lab == 1 then
			mission_waypoint_add("lc01_l3_gps")
		else
			mission_waypoint_add("lc01_l2_gps")
		end
		lc01_current_lab = -1
	end
end

function lc01_patrol1(char_name)
	local navs = {char_name.."_nav2",char_name.."_nav3",char_name.."_nav4",char_name.."_nav1"}
	
	local i = 1
	
	local success = true
	
	while (success) do
		success = move_to( char_name, navs[i], 1, true )
		
		if( lc01_iloop_debug and not success ) then
			set_debug_game_paused(true)
			mission_debug( char_name.." stopped pathing", 0 )
			thread_yield()
		end
		
		i = i + 1
		
		if (i>4) then
			i = 1
		end	
	end
end

function lc01_patrol2(char_name)	
	local navs = {char_name.."_nav1",char_name.."_nav2",char_name.."_nav3",char_name.."_nav4"}

	local current = 1
	local last = 1
	
	local success = true
	
	while (success) do
		local random = current
		
		while ( (random == current) or (random == last) ) do
			random = rand_int(1,sizeof_table(navs))
		end
		
		last = current
		current = random
		
		success = move_to( char_name, navs[current], 1, true )
	
	end
end