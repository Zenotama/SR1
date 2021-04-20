-- pd01.lua
-- THQ Press Demo Mission in P5 level
-- Created 4/1/05

-- global flag to track if gang members have been added to party
E1_characters_added_to_party = false
Doorway = {"pd01_E2_DoorwayB1", "pd01_E2_DoorwayH1", "pd01_E2_DoorwayW1"}
Barrels = {"pd01_E2_BarrelsB1", "pd01_E2_BarrelsH1", "pd01_E2_BarrelsH2", "pd01_E2_BarrelsH3"}
Boxes = {"pd01_E2_BoxesB1", "pd01_E2_BoxesB2", "pd01_E2_BoxesH1", "pd01_E2_BoxesW1"}
Ramp = {"pd01_E2_RampH1", "pd01_E2_RampH2", "pd01_E2_RampW2"}
Boss = {"pd01_E2_Boss", "pd01_E2_BossB1", "pd01_E2_BossB2"}



function pd01_init()
	mission_add("pd01", "func_ex1_unlock", "func_ex1_setup", "pd01_E1_$nav-ex1-start", "func_ex1_start", "radar_genrollerz.tga")
	teleport("#PLAYER#", "AM_$nav_plyr_start2")

	on_trigger("func_ex1_arrive_warehouse", "pd01_E1_$execute lua script000")
	on_trigger("func_ex1_arrive_warehouse", "pd01_E1_$execute lua script001")
	on_trigger("func_ex1_arrive_warehouse2", "pd01_E1_$execute lua script002")
	
	trigger_disable("pd01_E1_$execute lua script000")
	trigger_disable("pd01_E1_$execute lua script001")
	trigger_disable("pd01_E1_$execute lua script002")

	--character_hide("JS_JohnnyNavpoint")
	--teleport("JS_JohnnyNavpoint", "pd01_E1_$nav-warp-gat")
	--teleport("SY_tyrell", "pd01_E1_$nav-warp-raceguy")
	inv_item_add("ak47")
	inv_item_add("tec9")
	inv_item_add("pump_action_shotgun")
	inv_item_add("rpg_launcher")
	inv_item_add("molotov")

	-- from doug's old phasefive_E2.lua
	on_trigger("show_doorway", "pd01_E2_$trigger_doorway")
	on_trigger("show_barrels", "pd01_E2_$trigger_barrels")
	on_trigger("show_boxes", "pd01_E2_$trigger_boxes")
	on_trigger("show_ramp", "pd01_E2_$trigger_ramp")
	on_trigger("show_boss", "pd01_E2_$trigger_boss")
	on_trigger("peds_off", "pd01_E2_$trigger_peds_off")
	on_trigger("peds_on", "pd01_E2_$trigger_peds_on")

	-- AM 1/8/05: disable these triggers at start of level (you don't want them active if the player hasn't started the mission yet)
	trigger_disable("pd01_E2_$trigger_doorway")
	trigger_disable("pd01_E2_$trigger_barrels")
	trigger_disable("pd01_E2_$trigger_boxes")
	trigger_disable("pd01_E2_$trigger_ramp")
	trigger_disable("pd01_E2_$trigger_boss")
	trigger_disable("pd01_E2_$trigger_peds_off")
	trigger_disable("pd01_E2_$trigger_peds_on")
end


function pd01_main()
	--message("exec1 script start")
end


function func_ex1_unlock()
	mission_unlock("pd01")
end


function func_ex1_setup()
	--FIXME 12/20/04: hmm, is it bad having this mission failure stuff get called upon mission unlock?  what happens if the player
	--is in another mission when this one gets unlocked?
	party_set_dismissable(true)
	party_set_recruitable(true)
	party_dismiss_all()
	destroy_group("pd01_E1_$Group-ex1-start")
	minimap_icon_remove_navpoint("pd01_E1_$nav-warehouse")
	minimap_icon_remove_navpoint("pd01_E2_$nav006")
	trigger_disable("pd01_E1_$execute lua script000")
	trigger_disable("pd01_E1_$execute lua script001")
	trigger_disable("pd01_E1_$execute lua script002")

	-- doug's triggers
	trigger_disable("pd01_E2_$trigger_doorway")
	trigger_disable("pd01_E2_$trigger_barrels")
	trigger_disable("pd01_E2_$trigger_boxes")
	trigger_disable("pd01_E2_$trigger_ramp")
	trigger_disable("pd01_E2_$trigger_boss")
	trigger_disable("pd01_E2_$trigger_peds_off")
	trigger_disable("pd01_E2_$trigger_peds_on")

	destroy_group("pd01_E1_$Group-ware-ext1")
	destroy_group("pd01_E2_$Doorway")
	destroy_group("pd01_E2_$Boss")
	destroy_group("pd01_E2_$Barrels")
	destroy_group("pd01_E2_$Boxes")
	destroy_group("pd01_E2_$Ramp")
	spawning_on()
end


function func_ex1_start()
	--message("mission start called")

	E1_characters_added_to_party = false

	letterbox_fade_in()
	create_group("pd01_E1_$Group-ware-ext1")

	--[[
	AM 3/30/05: per alan's request, moved these out of mission start to func_ex1_arrive_warehouse()
	create_group("pd01_E2_$Doorway")
	create_group("pd01_E2_$Boss")
	create_group("pd01_E2_$Barrels")
	create_group("pd01_E2_$Boxes")
	create_group("pd01_E2_$Ramp")
	]]

	fade_out(0.25)
	--cutscene_play("exec_combat")

	party_dismiss_all()
	party_set_recruitable(false)
	party_set_dismissable(false)
	create_group("pd01_E1_$Group-ex1-start", true)
	party_add("pd01_E1_vl3a_Gat_ingame")

	--party_add("JS_JohnnyNavpoint")
	--character_hide("JS_JohnnyNavpoint")
	
	minimap_icon_add_navpoint("pd01_E1_$nav-warehouse", "radar_gendropa.tga")

	trigger_enable("pd01_E1_$execute lua script000")
	trigger_enable("pd01_E1_$execute lua script001")
	trigger_enable("pd01_E1_$execute lua script002")

	-- doug's triggers
	trigger_enable("pd01_E2_$trigger_doorway")
	trigger_enable("pd01_E2_$trigger_barrels")
	trigger_enable("pd01_E2_$trigger_boxes")
	trigger_enable("pd01_E2_$trigger_ramp")
	trigger_enable("pd01_E2_$trigger_boss")
	trigger_enable("pd01_E2_$trigger_peds_off")
	trigger_enable("pd01_E2_$trigger_peds_on")

	--delay(2.0)
	--subtitle("Let's hurry up and find a ride.", 3.3)
	--audio_play("VOC_Gat_ExecCar_1.wav", "voice")
	letterbox_fade_out()
	delay(0.5)
	fade_in(.25)
	mission_help_text("Help your crew take over the Vice King warehouse.  Its location is marked on the mini-map.", 5.0)
end


function create_doorway_guys()
	create_group("pd01_E2_$Doorway", true)
	character_hide_group(Doorway)
end

function create_boss_guys()
	create_group("pd01_E2_$Boss", true)
	character_hide_group(Boss)
end

function create_barrels_guys()
	create_group("pd01_E2_$Barrels", true)
	character_hide_group(Barrels)
end

function create_boxes_guys()
	create_group("pd01_E2_$Boxes", true)
	character_hide_group(Boxes)
end

function create_ramp_guys()
	create_group("pd01_E2_$Ramp", true)
	character_hide_group(Ramp)
end


function func_ex1_arrive_warehouse()
	--message("ware1 trigger - make aggressive")
	trigger_disable("pd01_E1_$execute lua script000")
	trigger_disable("pd01_E1_$execute lua script001")

	-- create and hide doug's characters
	thread_new("create_doorway_guys")
	thread_new("create_boss_guys")
	thread_new("create_barrels_guys")
	thread_new("create_boxes_guys")
	thread_new("create_ramp_guys")

	--on_death hooks for doug's characters
	--on_death("gat_voc1", "pd01_E2_DoorwayB1")
	--on_death("gat_voc2", "pd01_E2_BarrelsH1")
	--on_death("gat_voc3", "pd01_E2_BoxesH1")
	--on_death("gat_voc4", "pd01_E2_RampW2")
	--on_death("gat_voc5", "pd01_E2_Boss")
	--on_death("green_gat", "pd01_E2_BossB2")
	on_death("func_ex1_mission_end", "pd01_E2_Boss")

	-- set agg and self-pres on guys outside warehouse
	set_aggressiveness("pd01_E1_vllvl2_black#000", 4)
	set_aggressiveness("pd01_E1_vllvl1_white#000", 4)
	set_aggressiveness("pd01_E1_vllvl2_latino#000", 4)
	set_aggressiveness("pd01_E1_vllvl2_black#001", 4)
	set_self_preservation("pd01_E1_vllvl2_black#000", 0)
	set_self_preservation("pd01_E1_vllvl1_white#000", 0)
	set_self_preservation("pd01_E1_vllvl2_latino#000", 0)
	set_self_preservation("pd01_E1_vllvl2_black#001", 0)
	
	set_aggressiveness("pd01_E1_pclvl1_black#000", 4)
	set_aggressiveness("pd01_E1_pclvl1_white#000", 4)
	set_aggressiveness("pd01_E1_pclvl2_latino#000", 4)
	set_aggressiveness("pd01_E1_pclvl2_black#000", 4)
	set_self_preservation("pd01_E1_pclvl1_black#000", 4)
	set_self_preservation("pd01_E1_pclvl1_white#000", 1)
	set_self_preservation("pd01_E1_pclvl2_latino#000", 0)
	set_self_preservation("pd01_E1_pclvl2_black#000", 0)

	-- add on_death hooks
	on_death("func_ex1_check_death", "pd01_E1_vllvl2_black#000")
	on_death("func_ex1_check_death", "pd01_E1_vllvl1_white#000")
	on_death("func_ex1_check_death", "pd01_E1_vllvl2_latino#000")
	on_death("func_ex1_check_death", "pd01_E1_vllvl2_black#001")
end


function func_ex1_arrive_warehouse2()
	--message("ware2 trigger - make vulnerable")

	trigger_disable("pd01_E1_$execute lua script002")

	turn_vulnerable("pd01_E1_vllvl2_black#000")
	turn_vulnerable("pd01_E1_vllvl1_white#000")
	turn_vulnerable("pd01_E1_vllvl2_latino#000")
	turn_vulnerable("pd01_E1_vllvl2_black#001")

	turn_vulnerable("pd01_E1_pclvl1_black#000")
	turn_vulnerable("pd01_E1_pclvl1_white#000")

	--turn_vulnerable("pd01_E1_vl3a_Gat_ingame")
end


function func_ex1_check_death()
	--message("check death")

	if ( is_dead("pd01_E1_vllvl2_black#000") and is_dead("pd01_E1_vllvl1_white#000") and
			is_dead("pd01_E1_vllvl2_latino#000") and is_dead("pd01_E1_vllvl2_black#001") and not E1_characters_added_to_party) then


		E1_characters_added_to_party = true

		--message("add chars to party")
		delay(3)

		--subtitle("Keep moving, we gotta find Green!", 3.3)
		--audio_play("VOC_Gat_ExecCall_1.wav", "voice")

		minimap_icon_remove_navpoint("pd01_E1_$nav-warehouse")
		minimap_icon_add_navpoint("pd01_E2_$nav006", "radar_gendropa.tga")
		
		--subtitle("Take that cocksuckers.", 3)
		--delay(3)
		--subtitle("Let's go clean up the rest of this place.", 3)

		party_add("pd01_E1_pclvl2_latino#000")
		party_add("pd01_E1_pclvl2_black#000")
		turn_vulnerable("pd01_E1_pclvl2_latino#000")
		turn_vulnerable("pd01_E1_pclvl2_black#000")
	end
end

function func_ex1_mission_end()
	mission_end_success("pd01")

	party_dismiss_all()
	party_set_recruitable(true)
	party_set_dismissable(true)
	release_to_world("pd01_E1_$Group-ware-ext1")
	release_to_world("pd01_E2_$Doorway")
	release_to_world("pd01_E2_$Boss")
	release_to_world("pd01_E2_$Barrels")
	release_to_world("pd01_E2_$Boxes")
	release_to_world("pd01_E2_$Ramp")
	release_to_world("pd01_E1_$Group-ex1-start")
	spawning_on()
	minimap_icon_remove_navpoint("pd01_E1_$nav-warehouse")
	minimap_icon_remove_navpoint("pd01_E2_$nav006")
end



--------------------------------------------------------
--FROM DOUG'S OLD PHASEFIVE_E2.LUA----------------------
function show_doorway()
	--message("show_doorway")
	trigger_disable("pd01_E2_$trigger_doorway")
	character_show_group(Doorway)
end

function show_barrels()
	--message("show_barrels")
	trigger_disable("pd01_E2_$trigger_barrels")
	character_show_group(Barrels)
end

function show_boxes()
	--message("show_boxes")
	trigger_disable("pd01_E2_$trigger_boxes")
	character_show_group(Boxes)
end

function show_ramp()
	--message("show_ramp")
	trigger_disable("pd01_E2_$trigger_ramp")
	character_show_group(Ramp)
end

function show_boss()
	--message("show_boss")
	trigger_disable("pd01_E2_$trigger_boss")
	character_show_group(Boss)
end

function peds_off()
	--message("peds turned OFF")
	spawning_off()
end

function peds_on()
	--message("peds turned ON")
	spawning_on()
end

function gat_voc1()
	subtitle("What are you waitin' for?  Drop those bitches!", 3.3)
	audio_play("voc_gat_execcall_3.wav", "voice")
end

function gat_voc2()
	subtitle("That the best you got!?", 3.3)
	audio_play("voc_gat_execatk_2.wav", "voice")
end

function gat_voc3()
	subtitle("Keep 'em commin' baby, I got enough bullets for everyone!", 3.3)
	audio_play("voc_gat_execatk_4.wav", "voice")
end

function gat_voc4()
	subtitle("Bitches, you never should'a messed with third street!", 3.3)
	audio_play("voc_gat_execatk_3.wav", "voice")
end

function gat_voc5()
	subtitle("Bad day to be wearin' yellow…", 3.3)
	audio_play("voc_gat_execatk_1.wav", "voice")
	delay(2.0)
	subtitle("Good work man, looks like the Vice Kings won't be getting any new noisemakers any time soon.", 3.3)
	audio_play("voc_gat_execend_1.wav", "voice")
	delay(4)
	if (is_mission_active("pd01")) then
		mission_end_success("pd01")
		delay(4)
	end
	--fade_out(0.5)
	--delay(0.6)
	party_dismiss_all()
	party_set_recruitable(true)
	party_set_dismissable(true)
	release_to_world("pd01_E1_$Group-ware-ext1")
	release_to_world("pd01_E2_$Doorway")
	release_to_world("pd01_E2_$Boss")
	release_to_world("pd01_E2_$Barrels")
	release_to_world("pd01_E2_$Boxes")
	release_to_world("pd01_E2_$Ramp")
	release_to_world("pd01_E1_$Group-ex1-start")
	--character_hide("JS_JohnnyNavpoint")
	--release_to_world("JS_JohnnyNavpoint")
	spawning_on()
	minimap_icon_remove_navpoint("pd01_E1_$nav-warehouse")
	minimap_icon_remove_navpoint("pd01_E2_$nav006")
	--delay(1.2)
	--fade_in(1)
end

function green_gat()
	subtitle("You third street mothafucka's ain't walkin' out of here…", 3.3)
	audio_play("voc_green_execboss_1.wav", "voice")
	delay(3.0)
	subtitle("I don't see how a bunch of dead bodies are gonna stop us…", 3.3)
	audio_play("voc_gat_execboss_1.wav", "voice")
	delay(3.0)
	subtitle("I ain't scared of either you bitches!", 3.3)
	audio_play("voc_green_execatk_1.wav", "voice")
end

--------------------------------------------------------
--------------------------------------------------------



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