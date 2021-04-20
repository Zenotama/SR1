-- phasefive_E1.lua
-- THQ Exec Presentation -- Script 1 -- Warehouse Exterior
-- Created 12/17/04


function phasefive_exec1_init()
	mission_add("mission_ex1", "func_ex1_unlock", "func_ex1_setup", "E1_$nav-ex1-start", "func_ex1_start", "radar_genrollerz.tga")
	teleport("#PLAYER#", "AM_$nav_plyr_start2")

	on_trigger("func_ex1_arrive_warehouse", "E1_$execute lua script000")
	on_trigger("func_ex1_arrive_warehouse", "E1_$execute lua script001")
	on_trigger("func_ex1_arrive_warehouse2", "E1_$execute lua script002")
	
	trigger_disable("E1_$execute lua script000")
	trigger_disable("E1_$execute lua script001")
	trigger_disable("E1_$execute lua script002")
end


function phasefive_exec1_main()
	--message("exec1 script start")
end


function func_ex1_unlock()
	mission_unlock("mission_ex1")
end


function func_ex1_setup()
	--FIXME 12/20/04: hmm, is it bad having this mission failure stuff get called upon mission unlock?  what happens if the player
	--is in another mission when this one gets unlocked?
	party_set_dismissable(true)
	party_set_recruitable(true)
	party_dismiss_all()
	destroy_group("E1_$Group-ex1-start")
	minimap_icon_remove_navpoint("E1_$nav-warehouse")
	trigger_disable("E1_$execute lua script000")
	trigger_disable("E1_$execute lua script001")
	trigger_disable("E1_$execute lua script002")
end


function func_ex1_start()
	--message("mission brief here")

	modal_begin()
	letterbox_fade_in()
	create_group("E1_$Group-ware-ext1")

	subtitle("Julius just sent the word...we're done gettin' slapped around like some ho.", 4)
	delay(4)
	subtitle("It's time for us to take the fight to the Vice Kings.", 3)
	delay(3)
	subtitle("The VK's main arms dealer is operating outta some warehouse just west of here, so let's put his bitch-ass in the ground.", 4)
	delay(4)
	subtitle("Now, that's not gonna be easy...Anthony's ex-military, so that motherfucker is as dangerous as he is crazy.", 4)
	delay(4)
	subtitle("Luckily for you, I'm gonna be your guardian angel.", 3)
	delay(3)
	subtitle("You drive.", 2.5)
	delay(2.5)

	-- CLEANUP --
	fade_out(0.5)
	delay(0.6)
	create_group("E1_$Group-ex1-start", true)
	letterbox_fade_out()

	party_dismiss_all()
	party_add("E1_vl3a_Gat_ingame")
	party_set_recruitable(false)
	party_set_dismissable(false)
	
	minimap_icon_add_navpoint("E1_$nav-warehouse", "radar_gendropa.tga")

	trigger_enable("E1_$execute lua script000")
	trigger_enable("E1_$execute lua script001")
	trigger_enable("E1_$execute lua script002")

	delay(0.1)
	modal_end()
	fade_in(1.0)
	delay(2.0)
	message("Head to the warehouse.", 3.0)
end


function func_ex1_arrive_warehouse()
	--message("ware1 trigger - make aggressive")

	trigger_disable("E1_$execute lua script000")
	trigger_disable("E1_$execute lua script001")

	-- set agg and self-pres on guys outside warehouse
	set_aggressiveness("E1_vllvl2_black#000", 4)
	set_aggressiveness("E1_vllvl1_white#000", 4)
	set_aggressiveness("E1_vllvl2_latino#000", 4)
	set_aggressiveness("E1_vllvl2_black#001", 4)
	set_self_preservation("E1_vllvl2_black#000", 0)
	set_self_preservation("E1_vllvl1_white#000", 0)
	set_self_preservation("E1_vllvl2_latino#000", 0)
	set_self_preservation("E1_vllvl2_black#001", 0)
	
	set_aggressiveness("E1_pclvl1_black#000", 4)
	set_aggressiveness("E1_pclvl1_white#000", 4)
	set_aggressiveness("E1_pclvl2_latino#000", 4)
	set_aggressiveness("E1_pclvl2_black#000", 4)
	set_self_preservation("E1_pclvl1_black#000", 4)
	set_self_preservation("E1_pclvl1_white#000", 1)
	set_self_preservation("E1_pclvl2_latino#000", 0)
	set_self_preservation("E1_pclvl2_black#000", 0)

	-- add on_death hooks
	on_death("func_ex1_check_death", "E1_vllvl2_black#000")
	on_death("func_ex1_check_death", "E1_vllvl1_white#000")
	on_death("func_ex1_check_death", "E1_vllvl2_latino#000")
	on_death("func_ex1_check_death", "E1_vllvl2_black#001")
end


function func_ex1_arrive_warehouse2()
	--message("ware2 trigger - make vulnerable")

	trigger_disable("E1_$execute lua script002")

	turn_vulnerable("E1_vllvl2_black#000")
	turn_vulnerable("E1_vllvl1_white#000")
	turn_vulnerable("E1_vllvl2_latino#000")
	turn_vulnerable("E1_vllvl2_black#001")

	turn_vulnerable("E1_pclvl1_black#000")
	turn_vulnerable("E1_pclvl1_white#000")

	--turn_vulnerable("E1_vl3a_Gat_ingame")
end


function func_ex1_check_death()
	--message("check death")

	if ( is_dead("E1_vllvl2_black#000") and is_dead("E1_vllvl1_white#000") and
			is_dead("E1_vllvl2_latino#000") and is_dead("E1_vllvl2_black#001") ) then
		--message("add chars to party")
		delay(2)
		subtitle("Take that cocksuckers.", 3)
		delay(3)
		subtitle("Let's go clean up the rest of this place.", 3)
		party_add("E1_pclvl2_latino#000")
		party_add("E1_pclvl2_black#000")
		turn_vulnerable("E1_pclvl2_latino#000")
		turn_vulnerable("E1_pclvl2_black#000")
	end
end






function add_marker_npc(char_name, minimap_icon_name, ingame_icon_name)
	minimap_icon_add_npc(char_name, minimap_icon_name)
	ingame_item_add_npc(char_name, ingame_icon_name)
end

function remove_marker_npc(char_name)
	--minimap_icon_remove_npc(char_name)
	minimap_icon_remove_npc("radar-blip.tga", char_name)
	ingame_item_remove_npc(char_name)
end

function add_marker_vehicle(vehicle_name, minimap_icon_name, ingame_icon_name)
	minimap_icon_add_vehicle(vehicle_name, minimap_icon_name)
	ingame_item_add_vehicle(vehicle_name, ingame_icon_name)
end

function remove_marker_vehicle(vehicle_name)
	minimap_icon_remove_vehicle(vehicle_name)
	ingame_item_remove_vehicle(vehicle_name)
end

function add_marker_navpoint(nav_name, minimap_icon_name, ingame_icon_name)
	minimap_icon_add_navpoint(nav_name, minimap_icon_name)
	ingame_item_add_navpoint(nav_name, ingame_icon_name)
end

function remove_marker_navpoint(nav_name)
	minimap_icon_remove_navpoint(nav_name)
	ingame_item_remove_navpoint(nav_name)
end

function hearing_enable_group(tbl)
	local tbl_size = sizeof_table(tbl)

	for i = 1, tbl_size, 1 do
		--character_hide(tbl[i])
		--delay(0.25)
		hearing_enable(tbl[i])
	end
end

function hearing_disable_group(tbl)
	local tbl_size = sizeof_table(tbl)

	for i = 1, tbl_size, 1 do
		--character_show(tbl[i])
		--delay(0.25)
		hearing_disable(tbl[i])
	end
end