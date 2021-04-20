-- phasefive_am.lua
-- Alvan's script for P5
-- Created 8/14/04



-- GLOBAL VARIABLES ---------------------
Player_has_200_props = false
P5_mission_started = false
P5_mission_combat_started = false
Test_count = 1


-- FUNCTIONS ----------------------------
function phasefive_alvan_init()

	-- Misc --
	teleport("#PLAYER#", "AM_$nav_plyr_start2")
	character_hide("AM_npc_test_mission_reqs")
	--AM 10/5/04:  OBSOLETE COMMANDS, SINCE CREATE_GROUP() HAS NOT BEEN CALLED YET
	--character_hide("AM_Leslie#gangstafem1_1")
	--character_hide("AM_Ricky#RollerLvl3")
	--vehicle_hide("AM_test_2door000")


	-- Insurance Fraud Setup --
	on_npc_trigger("start_insurance_fraud", "AM_Doc#pedmale01")
	minimap_icon_add_npc("AM_Doc#pedmale01", "radar_insfraud.tga")
	ingame_item_add_npc("AM_Doc#pedmale01", "down_arrow")


	-- Drug Dealing Setup --
--	minimap_icon_add_npc("AM_Dealer#pedmale4", "radar_drugdeal.tga")
--	ingame_item_add_npc("AM_Dealer#pedmale4", "down_arrow")
--	on_npc_trigger("start_drug_dealing", "AM_Dealer#pedmale4")
	activity_add("Drug Dealing", "P5_drug_region_1", "AM_$nav_drug_start", "drug_cutscene", "start drug dealing.")
	-- STL 09/17/2004 OBSOLETE
	--thread_new("setup_drug_deal")


	-- Mission Setup --
	--on_damage("P5_mission_success", "AM_test_2door000", 0.01)
	--on_npc_trigger("test_mission_reqs", "AM_npc_test_mission_reqs") -- test mission unlocking
--	mission_add("P5_mission_ricky_duel", "P5_mission_unlock", "P5_mission_setup", "AM_Ricky#RollerLvl3")
	mission_add("P5_mission_ricky_duel", "P5_mission_unlock", "P5_mission_setup", "AM_$trigger000", "P5_mission_start", "radar_genrollerz.tga")
--	on_trigger("P5_mission_start", "AM_trig_P5_mission_start")
	on_trigger("P5_mission_combat", "AM_trig_msn_start_combat")
	--AM 10/5/04: ON_DEATH() MUST BE MOVED UNTIL AFTER CREATE() COMMAND, IN MISSION START FUNCTION
	--on_death("P5_mission_success", "AM_Ricky#RollerLvl3")
--	trigger_disable("AM_trig_P5_mission_start")
	trigger_disable("AM_trig_msn_start_combat")
	--AM 10/5/04:  OBSOLETE COMMAND, SINCE CREATE_GROUP() HAS NOT BEEN CALLED YET
	--set_aggressiveness("AM_Ricky#RollerLvl3", 0)
	cellphone_register("cell_phone_begin")


	-- Props Setup --
	on_props_trigger("props_unlock_mission", 200)
	on_props_trigger("props_unlock_stronghold", 1000)

	
	-- Chop Shop Setup --
	on_trigger("start_chop_shop_delivery", "AM_trig_chop_shop")
	on_npc_trigger("start_chop_shop_activity", "AM_Chop_Shop_Guy#01")
	minimap_icon_add_npc("AM_Chop_Shop_Guy#01", "radar_raceenda.tga")
	ingame_item_add_npc("AM_Chop_Shop_Guy#01", "down_arrow")
	ingame_item_add_navpoint("AM_$trigger002", "single_flag_green")


	--debug_stuff()
end


function phasefive_alvan_main()
	-- Debug testing for cutscenes --
		--P5_mission_cutscene()
		--P5_mission_combat()
end


function debug_stuff()

	-- Group Testing --
	--create_group("mission1 group")
	--on_death("P5_mission_success", "AM_Ricky#RollerLvl3")

	-- Player Warp --
	--teleport("#PLAYER#", "AM_$nav_warp_fraud")
	--teleport("#PLAYER#", "AM_$nav_warp_drugs")
	teleport("#PLAYER#", "AM_$nav_warp_ricky")
	--teleport("#PLAYER#", "AM_$nav_warp_ricky_outside")
	--teleport("#PLAYER#", "AM_$nav_cut_pc_01")
	
	-- Cutscene Testing --
	--teleport_vehicle("AM_$vehicle000", "AM_$msn_ricky_1")
	--character_show("AM_npc_test_mission_reqs")
	--character_show("AM_Leslie#gangstafem1_1")
	--character_show("AM_Ricky#RollerLvl3")
	--vehicle_show("AM_test_2door000")

	-- Mission Testing --
	--Player_has_200_props = true
	--trigger_enable("AM_trig_P5_mission_start")
	--trigger_enable("AM_trig_msn_start_combat")
	--minimap_icon_add_navpoint("AM_$trigger001", "radar_genrollerz.tga")
	--ingame_item_add_navpoint("AM_$trigger001", "down_arrow")
end


function props_unlock_mission()
	delay(2.0)
	audio_play_for_cellphone("Ring 1", 6, 1.2, 0.65, "null", false, "cell_phone_begin")
end


function cell_phone_begin()
	subtitle("Hey kid, looks like we got the Rollerz' attention.", 4.0)
	delay(4)
	subtitle("Ricky's pissed and wants to see you.", 4.0)
	delay(4)
	subtitle("Sending his position to your PDA.", 4.0)
	Player_has_200_props = true
end


function props_unlock_stronghold()
	thread_new("unlock_stronghold")
end


-- Drug Dealing Setup
--[[function setup_drug_deal()
	local drug_level1, drug_level2, drug_level3, drug_level4,
			drug_level5, drug_level6, drug_level7, drug_level8

	drug_level1 = {"AM_$nav_drug_01", "AM_$nav_drug_02", "AM_$nav_drug_03", "AM_$nav_drug_04",
	"AM_$nav_drug_05", "AM_$nav_drug_06", "AM_$nav_drug_07", "AM_$nav_drug_08",
	"AM_$nav_drug_09", "AM_$nav_drug_10", "AM_$nav_drug_11", "AM_$nav_drug_12", 10}

	drug_level2 = {"AM_$nav_drug_01", "AM_$nav_drug_02", "AM_$nav_drug_03", "AM_$nav_drug_04",
	"AM_$nav_drug_05", "AM_$nav_drug_06", "AM_$nav_drug_07", "AM_$nav_drug_08",
	"AM_$nav_drug_09", "AM_$nav_drug_10", "AM_$nav_drug_11", "AM_$nav_drug_12", 10}

	drug_level3 = {"AM_$nav_drug_01", "AM_$nav_drug_02", "AM_$nav_drug_03", "AM_$nav_drug_04",
	"AM_$nav_drug_05", "AM_$nav_drug_06", "AM_$nav_drug_07", "AM_$nav_drug_08",
	"AM_$nav_drug_09", "AM_$nav_drug_10", "AM_$nav_drug_11", "AM_$nav_drug_12", 20}

	drug_level4 = {"AM_$nav_drug_01", "AM_$nav_drug_02", "AM_$nav_drug_03", "AM_$nav_drug_04",
	"AM_$nav_drug_05", "AM_$nav_drug_06", "AM_$nav_drug_07", "AM_$nav_drug_08",
	"AM_$nav_drug_09", "AM_$nav_drug_10", "AM_$nav_drug_11", "AM_$nav_drug_12", 20}

	drug_level5 = {"AM_$nav_drug_01", "AM_$nav_drug_03", "AM_$nav_drug_05", "AM_$nav_drug_07", "AM_$nav_drug_09",
	"AM_$nav_drug_11", "AM_$nav_drug_12", "AM_$nav_drug_13", "AM_$nav_drug_14", "AM_$nav_drug_15", "AM_$nav_drug_16",
	"AM_$nav_drug_17", "AM_$nav_drug_18", 30}

	drug_level6 = {"AM_$nav_drug_01", "AM_$nav_drug_03", "AM_$nav_drug_05", "AM_$nav_drug_07", "AM_$nav_drug_09",
	"AM_$nav_drug_11", "AM_$nav_drug_12", "AM_$nav_drug_13", "AM_$nav_drug_14", "AM_$nav_drug_15", "AM_$nav_drug_16",
	"AM_$nav_drug_17", "AM_$nav_drug_18", 30}

	drug_level7 = {"AM_$nav_drug_01", "AM_$nav_drug_03", "AM_$nav_drug_05", "AM_$nav_drug_07", "AM_$nav_drug_09",
	"AM_$nav_drug_11", "AM_$nav_drug_12", "AM_$nav_drug_13", "AM_$nav_drug_14", "AM_$nav_drug_15", "AM_$nav_drug_16",
	"AM_$nav_drug_17", "AM_$nav_drug_18", 30}

	drug_level8 = {"AM_$nav_drug_01", "AM_$nav_drug_03", "AM_$nav_drug_05", "AM_$nav_drug_07", "AM_$nav_drug_09",
	"AM_$nav_drug_11", "AM_$nav_drug_12", "AM_$nav_drug_13", "AM_$nav_drug_14", "AM_$nav_drug_15", "AM_$nav_drug_16",
	"AM_$nav_drug_17", "AM_$nav_drug_18", 30}

	dealing_add_region("P5_drug_region_1", "AM_$nav_drug_start",
				drug_level1, drug_level2, drug_level3, drug_level4,
				drug_level5, drug_level6, drug_level7, drug_level8,
				7, 1000, 200)
end]]


-- Drug Dealing Start
--[[function start_drug_dealing()
	local answer
	local play_dialogue = true

	while (play_dialogue) do
		
		answer = say("AM_Dealer#pedmale4", -1, -1, -1, -1, true,
			{"Hey kid, customers are waitin'. You ready to start?"},
				{"Yeah, let's start.",
				"Wait, tell me what I gotta do first.",
				"Nevermind."})

		if (answer == 1) then
			play_dialogue = false
			dealing_start("P5_drug_region_1")
		elseif (answer == 2) then
			say("AM_Dealer#pedmale4", -1, -1, -1, -1, true,
				{"This is the drug dealing pickup activity.",
				"Deliver product to all customers within the time allotted.",
				"Then come back here to advance to the next difficulty level."})
		elseif (answer == 3) then
			play_dialogue = false
		end
	end
end]]

function drug_cutscene()
end

-- Insurance Fraud
function start_insurance_fraud()
	local answer
	local play_dialogue = true

	while (play_dialogue) do
		
		answer = say("AM_Doc#pedmale01", -1, -1, -1, -1, true,
			{"Hey kid, you ready for the scam?"},
				{"Yeah, let's start insurance fraud.",
				"Wait, tell me what I gotta do first.",
				"Nevermind."})

		if (answer == 1) then
			play_dialogue = false
			fraud_mode(500000, 90, 200)
		elseif (answer == 2) then
			say("AM_Doc#pedmale01", -1, -1, -1, -1, true,
				{"This is the insurance fraud pickup activity.",
				"Hit L3 at just the right moment to fake accidents.",
				"The nastier the spill, the bigger the paycheck."})
		elseif (answer == 3) then
			play_dialogue = false
		end
	end
end


-- Chop Shop
function start_chop_shop_delivery()
	deliver_to_chop_shop("Phase 5 Chop Shop")
end

function start_chop_shop_activity()
	local answer
	local play_dialogue = true

	while (play_dialogue) do
		
		answer = say("AM_Chop_Shop_Guy#01", -1, -1, -1, -1, true,
			{"Hey kid, I need these cars quick. Get out there and start looking!"},
				{"Hang on a sec, I need to see the list.",
				"Wait, tell me what I gotta do first.",
				"Nevermind."})

		if (answer == 1) then
			play_dialogue = false
			show_chop_shop_list("Phase 5 Chop Shop")
		elseif (answer == 2) then
			say("AM_Chop_Shop_Guy#01", -1, -1, -1, -1, true,
				{"This is the Chop Shop pickup activity.",
				"Steal each car on the list and bring it back here.",
				"Complete the list and get cash, respect, and special unlockables!  Whee!!"})
		elseif (answer == 3) then
			play_dialogue = false
		end
	end
end



---------------------------------------------------------------
-- P5 MISSION - RICKY COMBAT DUEL -----------------------------
function P5_mission_unlock()
	if (Player_has_200_props) then
		mission_unlock("P5_mission_ricky_duel")
	end
end


function P5_mission_setup()

	destroy_group("mission1 group")

--	trigger_enable("AM_trig_P5_mission_start")
--	minimap_icon_add_navpoint("AM_$trigger000", "radar_genrollerz.tga")
--	ingame_item_add_navpoint("AM_$trigger000", "down_arrow")

	trigger_disable("AM_trig_msn_start_combat")
	minimap_icon_remove_navpoint("AM_$trigger001")
	ingame_item_remove_navpoint("AM_$trigger001")

	-- AM 8/27/04: hiding in this function could be bad, if those things are still on screen when the player fails mission
	--vehicle_exit("AM_Ricky#RollerLvl3", "AM_test_2door000")
	--AM 10/5/04:  OBSOLETE COMMANDS; SHOULD BE HANDLED BY CREATE/DESTROY_GROUP()
	--character_hide("AM_Ricky#RollerLvl3")
	--vehicle_hide("AM_test_2door000")

	P5_mission_started = false
	P5_mission_combat_started = false
	set_aggressiveness("AM_Ricky#RollerLvl3", 0)
end


-- Start Mission - called when player walks onto trigger
function P5_mission_start()
	if (not P5_mission_started) then
		-- 10/28/2004 STL unnecessary
--[[		if (is_player_in_vehicle()) then
			message("Get out of the car.", 3)
		else]]
			P5_mission_started = true

--[[
			create_group("mission1 group")
			set_aggressiveness("AM_Ricky#RollerLvl3", 0)
			on_death("P5_mission_success", "AM_Ricky#RollerLvl3")
]]

			-- 10/28/2004 STL unnecessary
--			mission_start("P5_mission_ricky_duel")
--			minimap_icon_remove_navpoint("AM_$trigger000")
--			ingame_item_remove_navpoint("AM_$trigger000")
			P5_mission_cutscene()
			delay(0.5)
			message("Grab a car and get to the meeting place.", 5.0)
			trigger_enable("AM_trig_msn_start_combat")
			minimap_icon_add_navpoint("AM_$trigger001", "radar_genrollerz.tga")
			ingame_item_add_navpoint("AM_$trigger001", "down_arrow")
		end
--	end
end

function P5_mission_cutscene()
	local handle1 = 0
	local handle2 = 0
	local handle3 = 0


	fade_out(0.5)
	delay(0.7)
	modal_begin()

	create_group("mission1 group")
	set_aggressiveness("AM_Ricky#RollerLvl3", 0)
	on_death("P5_mission_success", "AM_Ricky#RollerLvl3")

	letterbox_fade_in()


	-- SHOT 1 --
	teleport("#PLAYER#", "AM_$cut_pc_00")
	teleport("AM_Ricky#RollerLvl3", "AM_$nav000")
	teleport("AM_Leslie#gangstafem1_1", "AM_$cut_les_00")
	teleport_vehicle("AM_test_2door000", "AM_$vehicle000")
	character_show("AM_Leslie#gangstafem1_1")
	character_show("AM_Ricky#RollerLvl3")
	vehicle_show("AM_test_2door000")
	handle1 = thread_new("move_to", "#PLAYER#", "AM_$cut_pc_01")
	handle3 = thread_new("move_to", "AM_Leslie#gangstafem1_1", "AM_$cut_les_01")

	delay(0.5)
	fade_in(1.0)

	camera_begin_script("AM_camera002")
	delay(2.0)
	handle2 = thread_new("move_to", "AM_Ricky#RollerLvl3", "AM_$cut_rick_01")
	delay(2.0)
	thread_kill(handle1)
	thread_kill(handle2)
	thread_kill(handle3)
	delay(1)
	teleport("#PLAYER#", "AM_$cut_pc_01")
	teleport("AM_Ricky#RollerLvl3", "AM_$cut_rick_01")
	teleport("AM_Leslie#gangstafem1_1", "AM_$cut_les_01")


	-- SHOT 2 --
	camera_begin_script("AM_camera003")
	subtitle("You got a lotta balls showin' your face around here.", 3.3)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk short")
	audio_play("P5 Cutscene Ricky1", "voice")
	delay(3.3)
	subtitle("We're tired of you fuckin' around on our turf.", 2.3)
	audio_play("P5 Cutscene Ricky2", "voice")
	delay(2.3)


	-- SHOT 3 --
	thread_new("play_action", "AM_Leslie#gangstafem1_1", "talk confrontational")
	delay(0.2)
	--camera_begin_script("AM_camera014")
	--camera_begin_script("AM_camera019")
	camera_look_through("AM_$camera039")
	subtitle("What are you gonna do about it, huh?", 1.9)
	audio_play("P5 Cutscene Leslie1", "voice")
	delay(1.9)


	-- SHOT 4 --
	--camera_look_through("AM_$camera016")
	--camera_look_through("AM_$camera008")
	camera_begin_script("AM_camera015")
	subtitle("I say we settle this shit right now...once and for all. Like men.", 4)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk long")
	audio_play("P5 Cutscene Ricky3", "voice")
	delay(4)

	subtitle("Pick your poison!", 1.3)
	audio_play("P5 Cutscene Leslie2", "voice")
	delay(1.3)


	-- SHOT 5 --
	--camera_begin_script("AM_camera005")
	camera_begin_script("AM_camera016")
	subtitle("Car combat. Winner take all...loser goes to the morgue.", 4.1)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk short")
	audio_play("P5 Cutscene Ricky4", "voice")
	delay(4.1)


	-- SHOT 6 --
	--camera_begin_script("AM_camera006")
	camera_begin_script("AM_camera017")
	subtitle("Smoke his punk ass, Mickey!", 1.1)
	thread_new("play_action", "AM_Leslie#gangstafem1_1", "talk yes")
	audio_play("P5 Cutscene Leslie3", "voice")
	--delay(2.1)
	delay(1.1)
	thread_new("play_action", "#PLAYER#", "talk yes")
	delay(1.2)


	-- SHOT 7 --
	camera_look_through("AM_$camera013")
	subtitle("Main Street. Now.", 3)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk yes")
	audio_play("P5 Cutscene Ricky5", "voice")
	delay(3)

	
	-- CLEANUP --
	vehicle_hide("AM_test_2door000")
	character_hide("AM_Ricky#RollerLvl3")
	character_hide("AM_Leslie#gangstafem1_1")
	camera_end_script()
	letterbox_fade_out()
	modal_end()
end


--[[
OLD CUTSCENE, WITHOUT FADE

function P5_mission_cutscene()
	local handle1 = 0
	local handle2 = 0
	local handle3 = 0

	modal_begin()
	letterbox_fade_in()


	-- SHOT 1 --
	teleport("#PLAYER#", "AM_$cut_pc_00")
	teleport("AM_Ricky#RollerLvl3", "AM_$nav000")
	teleport("AM_Leslie#gangstafem1_1", "AM_$cut_les_00")
	teleport_vehicle("AM_test_2door000", "AM_$vehicle000")
	character_show("AM_Leslie#gangstafem1_1")
	character_show("AM_Ricky#RollerLvl3")
	vehicle_show("AM_test_2door000")
	handle1 = thread_new("move_to", "#PLAYER#", "AM_$cut_pc_01")
	handle3 = thread_new("move_to", "AM_Leslie#gangstafem1_1", "AM_$cut_les_01")

	camera_begin_script("AM_camera002")
	delay(2.0)
	handle2 = thread_new("move_to", "AM_Ricky#RollerLvl3", "AM_$cut_rick_01")
	delay(2.0)
	thread_kill(handle1)
	thread_kill(handle2)
	thread_kill(handle3)
	delay(1)
	teleport("#PLAYER#", "AM_$cut_pc_01")
	teleport("AM_Ricky#RollerLvl3", "AM_$cut_rick_01")
	teleport("AM_Leslie#gangstafem1_1", "AM_$cut_les_01")


	-- SHOT 2 --
	camera_begin_script("AM_camera003")
	subtitle("You got a lotta balls showin' your face around here.", 4)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk short")
	audio_play("P5 Cutscene Ricky1", "voice")
	delay(3.3)
	subtitle("We're tired of you fuckin' around on our turf.", 4)
	audio_play("P5 Cutscene Ricky2", "voice")
	delay(2.3)


	-- SHOT 3 --
	thread_new("play_action", "AM_Leslie#gangstafem1_1", "talk confrontational")
	delay(0.2)
	--camera_begin_script("AM_camera014")
	--camera_begin_script("AM_camera019")
	camera_look_through("AM_$camera039")
	subtitle("What are you gonna do about it, huh?", 4)
	audio_play("P5 Cutscene Leslie1", "voice")
	delay(1.9)


	-- SHOT 4 --
	--camera_look_through("AM_$camera016")
	--camera_look_through("AM_$camera008")
	camera_begin_script("AM_camera015")
	subtitle("I say we settle this shit right now...once and for all. Like men.", 4)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk long")
	audio_play("P5 Cutscene Ricky3", "voice")
	delay(4)

	message("Pick your poison!", 4)
	audio_play("P5 Cutscene Leslie2", "voice")
	delay(1.3)


	-- SHOT 5 --
	--camera_begin_script("AM_camera005")
	camera_begin_script("AM_camera016")
	subtitle("Car combat. Winner take all...loser goes to the morgue.", 4)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk short")
	audio_play("P5 Cutscene Ricky4", "voice")
	delay(4.1)


	-- SHOT 6 --
	--camera_begin_script("AM_camera006")
	camera_begin_script("AM_camera017")
	subtitle("Smoke his punk ass, Mickey!", 4)
	thread_new("play_action", "AM_Leslie#gangstafem1_1", "talk yes")
	audio_play("P5 Cutscene Leslie3", "voice")
	--delay(2.1)
	delay(1.1)
	thread_new("play_action", "#PLAYER#", "talk yes")
	delay(1.2)


	-- SHOT 7 --
	camera_look_through("AM_$camera013")
	subtitle("Main Street. Now.", 3)
	thread_new("play_action", "AM_Ricky#RollerLvl3", "talk yes")
	audio_play("P5 Cutscene Ricky5", "voice")
	delay(3)

	
	-- CLEANUP --
	vehicle_hide("AM_test_2door000")
	character_hide("AM_Ricky#RollerLvl3")
	character_hide("AM_Leslie#gangstafem1_1")
	camera_end_script()
	letterbox_fade_out()
	modal_end()
end
]]


function P5_mission_combat()
	if (not P5_mission_combat_started) then
		if (not is_player_in_vehicle()) then
			message("You need to grab a car first.", 3)
		else
			P5_mission_combat_started = true

			modal_begin()
			letterbox_fade_in()
			minimap_icon_remove_navpoint("AM_$trigger001")
			ingame_item_remove_navpoint("AM_$trigger001")
	
			-- SHOT 1 -- your car, aerial view
			camera_begin_script("AM_camera010")
			teleport_vehicle("AM_test_2door000", "AM_$msn_ricky_3")
			teleport("AM_Ricky#RollerLvl3", "AM_$msn_ricky_3b")
			character_show("AM_Ricky#RollerLvl3")
			vehicle_enter("AM_Ricky#RollerLvl3", "AM_test_2door000")
			vehicle_show("AM_test_2door000")
			delay(3)

			-- SHOT 2 -- ricky's car, aerial view
			camera_begin_script("AM_camera011")
			delay(3)

			-- SHOT 3 -- ricky's car, close-up
			camera_begin_script("AM_camera012")
			delay(2.25)
			teleport_vehicle("#PLAYER#", "AM_$msn_plyr_1")
			camera_end_script()
			delay(1)
			message("3", 1)
			delay(1)
			message("2", 1)
			delay(1)
			message("1", 1)
			delay(1)

			-- CLEANUP --
			letterbox_fade_out()
			message("GO!!!", 3)
			modal_end()

			set_aggressiveness("AM_Ricky#RollerLvl3", 3)
			car_combat("AM_Ricky#RollerLvl3")
		end
	end
end


function P5_mission_success()
	--message("P5_mission_success called!!")
	mission_end_success("P5_mission_ricky_duel")
	props_add(800)
	destroy_group("mission1 group")
end

-- END MISSION ------------------------------------------
---------------------------------------------------------