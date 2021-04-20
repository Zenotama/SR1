-- phasefive_E1.lua
-- THQ Exec Presentation -- Script 1 -- Warehouse Exterior
-- Created 12/17/04

-- global flag to track if gang members have been added to party
E1_characters_added_to_party = false

function phasefive_exec1_init()
	mission_add("mission_ex1", "func_ex1_unlock", "func_ex1_setup", "phasefive_E1_$nav-ex1-start", "func_ex1_start", "radar_genrollerz.tga")
	teleport("#PLAYER#", "AM_$nav_plyr_start2")

	on_trigger("func_ex1_arrive_warehouse", "phasefive_E1_$execute lua script000")
	on_trigger("func_ex1_arrive_warehouse", "phasefive_E1_$execute lua script001")
	on_trigger("func_ex1_arrive_warehouse2", "phasefive_E1_$execute lua script002")
	
	trigger_disable("phasefive_E1_$execute lua script000")
	trigger_disable("phasefive_E1_$execute lua script001")
	trigger_disable("phasefive_E1_$execute lua script002")

	--character_hide("JS_JohnnyNavpoint")
	--teleport("JS_JohnnyNavpoint", "phasefive_E1_$nav-warp-gat")
	--teleport("SY_tyrell", "phasefive_E1_$nav-warp-raceguy")
	inv_item_add("ak47")
	inv_item_add("tec9")
	inv_item_add("pump_action_shotgun")
	inv_item_add("rpg_launcher")
	inv_item_add("molotov")
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
	destroy_group("phasefive_E1_$Group-ex1-start")
	minimap_icon_remove_navpoint("phasefive_E1_$nav-warehouse")
	minimap_icon_remove_navpoint("phasefive_E2_$nav006")
	trigger_disable("phasefive_E1_$execute lua script000")
	trigger_disable("phasefive_E1_$execute lua script001")
	trigger_disable("phasefive_E1_$execute lua script002")

	-- doug's triggers
	trigger_disable("phasefive_E2_$trigger_doorway")
	trigger_disable("phasefive_E2_$trigger_barrels")
	trigger_disable("phasefive_E2_$trigger_boxes")
	trigger_disable("phasefive_E2_$trigger_ramp")
	trigger_disable("phasefive_E2_$trigger_boss")
	trigger_disable("phasefive_E2_$trigger_peds_off")
	trigger_disable("phasefive_E2_$trigger_peds_on")

	destroy_group("phasefive_E1_$Group-ware-ext1")
	destroy_group("phasefive_E2_$Doorway")
	destroy_group("phasefive_E2_$Boss")
	destroy_group("phasefive_E2_$Barrels")
	destroy_group("phasefive_E2_$Boxes")
	destroy_group("phasefive_E2_$Ramp")
	spawning_on()
end


function func_ex1_start()
	--message("mission start called")

	E1_characters_added_to_party = false

	letterbox_fade_in()
	create_group("phasefive_E1_$Group-ware-ext1")

	--[[
	AM 3/30/05: per alan's request, moved these out of mission start to func_ex1_arrive_warehouse()
	create_group("phasefive_E2_$Doorway")
	create_group("phasefive_E2_$Boss")
	create_group("phasefive_E2_$Barrels")
	create_group("phasefive_E2_$Boxes")
	create_group("phasefive_E2_$Ramp")
	]]

	fade_out(0.25)
	delay(0.5)
	cutscene_play("exec_combat")

	--create_group("phasefive_E1_$Group-ex1-start", true)
	--letterbox_fade_out()

	party_dismiss_all()
	--party_add("phasefive_E1_vl3a_Gat_ingame")
	party_add("JS_JohnnyNavpoint")
	party_set_recruitable(false)
	party_set_dismissable(false)
	--character_hide("JS_JohnnyNavpoint")
	
	minimap_icon_add_navpoint("phasefive_E1_$nav-warehouse", "radar_gendropa.tga")

	trigger_enable("phasefive_E1_$execute lua script000")
	trigger_enable("phasefive_E1_$execute lua script001")
	trigger_enable("phasefive_E1_$execute lua script002")

	-- doug's triggers
	trigger_enable("phasefive_E2_$trigger_doorway")
	trigger_enable("phasefive_E2_$trigger_barrels")
	trigger_enable("phasefive_E2_$trigger_boxes")
	trigger_enable("phasefive_E2_$trigger_ramp")
	trigger_enable("phasefive_E2_$trigger_boss")
	trigger_enable("phasefive_E2_$trigger_peds_off")
	trigger_enable("phasefive_E2_$trigger_peds_on")

	delay(2.0)
	subtitle("Let's hurry up and find a ride.", 3.3)
	audio_play("VOC_Gat_ExecCar_1.wav", "voice")
end


function create_doorway_guys()
	create_group("phasefive_E2_$Doorway", true)
	character_hide_group(Doorway)
end

function create_boss_guys()
	create_group("phasefive_E2_$Boss", true)
	character_hide_group(Boss)
end

function create_barrels_guys()
	create_group("phasefive_E2_$Barrels", true)
	character_hide_group(Barrels)
end

function create_boxes_guys()
	create_group("phasefive_E2_$Boxes", true)
	character_hide_group(Boxes)
end

function create_ramp_guys()
	create_group("phasefive_E2_$Ramp", true)
	character_hide_group(Ramp)
end


function func_ex1_arrive_warehouse()
	--message("ware1 trigger - make aggressive")
	trigger_disable("phasefive_E1_$execute lua script000")
	trigger_disable("phasefive_E1_$execute lua script001")

	-- create and hide doug's characters
	thread_new("create_doorway_guys")
	thread_new("create_boss_guys")
	thread_new("create_barrels_guys")
	thread_new("create_boxes_guys")
	thread_new("create_ramp_guys")

	-- on_death hooks for doug's characters
	on_death("gat_voc1", "phasefive_E2_DoorwayB1")
	on_death("gat_voc2", "phasefive_E2_BarrelsH1")
	on_death("gat_voc3", "phasefive_E2_BoxesH1")
	on_death("gat_voc4", "phasefive_E2_RampW2")
	on_death("gat_voc5", "phasefive_E2_Boss")
	on_death("green_gat", "phasefive_E2_BossB2")
	--on_death("func_ex1_mission_end", "phasefive_E2_Boss")

	-- set agg and self-pres on guys outside warehouse
	set_aggressiveness("phasefive_E1_vllvl2_black#000", 4)
	set_aggressiveness("phasefive_E1_vllvl1_white#000", 4)
	set_aggressiveness("phasefive_E1_vllvl2_latino#000", 4)
	set_aggressiveness("phasefive_E1_vllvl2_black#001", 4)
	set_self_preservation("phasefive_E1_vllvl2_black#000", 0)
	set_self_preservation("phasefive_E1_vllvl1_white#000", 0)
	set_self_preservation("phasefive_E1_vllvl2_latino#000", 0)
	set_self_preservation("phasefive_E1_vllvl2_black#001", 0)
	
	set_aggressiveness("phasefive_E1_pclvl1_black#000", 4)
	set_aggressiveness("phasefive_E1_pclvl1_white#000", 4)
	set_aggressiveness("phasefive_E1_pclvl2_latino#000", 4)
	set_aggressiveness("phasefive_E1_pclvl2_black#000", 4)
	set_self_preservation("phasefive_E1_pclvl1_black#000", 4)
	set_self_preservation("phasefive_E1_pclvl1_white#000", 1)
	set_self_preservation("phasefive_E1_pclvl2_latino#000", 0)
	set_self_preservation("phasefive_E1_pclvl2_black#000", 0)

	-- add on_death hooks
	on_death("func_ex1_check_death", "phasefive_E1_vllvl2_black#000")
	on_death("func_ex1_check_death", "phasefive_E1_vllvl1_white#000")
	on_death("func_ex1_check_death", "phasefive_E1_vllvl2_latino#000")
	on_death("func_ex1_check_death", "phasefive_E1_vllvl2_black#001")
end


function func_ex1_arrive_warehouse2()
	--message("ware2 trigger - make vulnerable")

	trigger_disable("phasefive_E1_$execute lua script002")

	turn_vulnerable("phasefive_E1_vllvl2_black#000")
	turn_vulnerable("phasefive_E1_vllvl1_white#000")
	turn_vulnerable("phasefive_E1_vllvl2_latino#000")
	turn_vulnerable("phasefive_E1_vllvl2_black#001")

	turn_vulnerable("phasefive_E1_pclvl1_black#000")
	turn_vulnerable("phasefive_E1_pclvl1_white#000")

	--turn_vulnerable("phasefive_E1_vl3a_Gat_ingame")
end


function func_ex1_check_death()
	--message("check death")

	if ( is_dead("phasefive_E1_vllvl2_black#000") and is_dead("phasefive_E1_vllvl1_white#000") and
			is_dead("phasefive_E1_vllvl2_latino#000") and is_dead("phasefive_E1_vllvl2_black#001") and not E1_characters_added_to_party) then


		E1_characters_added_to_party = true

		--message("add chars to party")
		delay(3)

		subtitle("Keep moving, we gotta find Green!", 3.3)
		audio_play("VOC_Gat_ExecCall_1.wav", "voice")

		minimap_icon_remove_navpoint("phasefive_E1_$nav-warehouse")
		minimap_icon_add_navpoint("phasefive_E2_$nav006", "radar_gendropa.tga")
		
		--subtitle("Take that cocksuckers.", 3)
		--delay(3)
		--subtitle("Let's go clean up the rest of this place.", 3)

		party_add("phasefive_E1_pclvl2_latino#000")
		party_add("phasefive_E1_pclvl2_black#000")
		turn_vulnerable("phasefive_E1_pclvl2_latino#000")
		turn_vulnerable("phasefive_E1_pclvl2_black#000")
	end
end

function func_ex1_mission_end()
	mission_end_success("mission_ex1")
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

function character_show_group(tbl)
	local tbl_size = sizeof_table(tbl)

	for i = 1, tbl_size, 1 do
		character_show(tbl[i])
		--delay(0.25)
		--hearing_enable(tbl[i])
	end
end

function character_hide_group(tbl)
	local tbl_size = sizeof_table(tbl)

	for i = 1, tbl_size, 1 do
		character_hide(tbl[i])
		--delay(0.25)
		--hearing_disable(tbl[i])
	end
end