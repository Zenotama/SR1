-- Bling Bling
-- Lua script for Phase 5 level
-- created 8/20/04


-- Global Variables
stronghold_chars = {"DN_VLLvl2_Latino#000", "DN_VLLvl1_Black#000", "DN_VLLvl2_Black#000", "DN_VLLvl1_White#000",
			"DN_VLLvl1_Black#001", "DN_VLLvl1Test01#000", "DN_VLLvl3Test01#000", "DN_VLLvl2_Black#001",
			"DN_VLLvl1Test02#000", "DN_VLLvl3Test01#001", "DN_VLLvl1_Black#002",
			"DN_VLLvl3_Black#000", "DN_VLLvl1_White#001", "DN_VLLvl1_White#002",
			"DN_VLLvl1_Black#003", "DN_VLLvl2_Black#002", "DN_VLLvl2_Latino#002",
			"DN_VLLvl1_White#003", "DN_VLLvl1Test02#001", "DN_VLLvl3Test01#002",
			"DN_VLLvl2_Black#003", "DN_VLLvl1Test01#003", "DN_VLLvl1Test02#002"}


function phasefive_doug_init()

	thread_new("hide_stronghold_chars")

	trigger_disable("DN_execute LUA roof000")
	trigger_disable("DN_execute LUA door000")
	trigger_disable("DN_execute LUA wave2")
	trigger_disable("DN_execute LUA boss000")
	
	--AM 8/25/04: trigger is now in phasefive_am.lua; commenting out here
	--on_props_trigger("unlock_stronghold", 100)
	on_trigger("spawningoff", "DN_execute LUA spawn_off")
	on_trigger("spawningon", "DN_execute LUA spawn_on")
	on_trigger("hear_roof", "DN_execute LUA roof000")
	on_trigger("hear_door", "DN_execute LUA door000")
	on_trigger("hear_wave2", "DN_execute LUA wave2")
	on_trigger("hear_boss", "DN_execute LUA boss000")
	on_death("leader_killed", "DN_VLLvl3_Black#000")

	cellphone_register("unlock_stronghold_begin")
end


function unlock_stronghold()
	local		voice

	delay(4.0)

	voice = pda_get_voice("VL Stronghold")
	audio_play_for_cellphone("Ring 1", 6, 1.2, 0.65, voice, false, "unlock_stronghold_begin")
end


function unlock_stronghold_begin()
	show_stronghold_chars()

	minimap_icon_add_navpoint("DN_$strong01", "radar_strnghld.tga")

	trigger_enable("DN_execute LUA roof000")
	trigger_enable("DN_execute LUA door000")
	trigger_enable("DN_execute LUA wave2")
	trigger_enable("DN_execute LUA boss000")

	pda_play_message("VL Stronghold")
	pda_log_message("VL Stronghold")
end


function hide_stronghold_chars()
	local count

	for count = 1, 23, 1 do
		character_hide(stronghold_chars[count])
	end
end


function show_stronghold_chars()
	local count

	for count = 1, 23, 1 do
		character_show(stronghold_chars[count])
	end
end


function spawningoff()
	--message("spawning turned OFF")
	spawning_off()
end


function spawningon()
	--message("spawning turned ON")
	spawning_on()
end


function hear_roof()
	hearing_enable("DN_VLLvl1_Black#000")
	hearing_enable("DN_VLLvl1_White#000")
	hearing_enable("DN_VLLvl2_Black#000")
	hearing_enable("DN_VLLvl2_Latino#000")
end


function hear_door()
	hearing_enable("DN_VLLvl3Test01#000")
	hearing_enable("DN_VLLvl1Test01#000")
	hearing_enable("DN_VLLvl1_Black#001")
	hearing_enable("DN_VLLvl1_Black#003")
	hearing_enable("DN_VLLvl2_Black#001")
	hearing_enable("DN_VLLvl1_White#002")
end


function hear_wave2()
	hearing_enable("DN_VLLvl1Test02#001")
	hearing_enable("DN_VLLvl1_White#003")
	hearing_enable("DN_VLLvl3Test01#002")
	hearing_enable("DN_VLLvl1Test02#000")
	hearing_enable("DN_VLLvl1_White#001")
	hearing_enable("DN_VLLvl2_Black#003")
end


function hear_boss()
	hearing_enable("DN_VLLvl1_Black#002")
	hearing_enable("DN_VLLvl1Test01#003")
	hearing_enable("DN_VLLvl1Test02#002")
	hearing_enable("DN_VLLvl3Test01#001")
	hearing_enable("DN_VLLvl2_Latino#002")
	hearing_enable("DN_VLLvl2_Black#002")
	hearing_enable("DN_VLLvl3_Black#000")
end


function leader_killed()
	local		voice
	voice = pda_get_voice("P5_Stronghold_Defeat")
	audio_play_for_cellphone("Ring 1", 6, 1.2, 0.65, voice, false, "stronghold_defeated")
	minimap_icon_remove_navpoint("DN_$strong01")
end


function stronghold_defeated()
	delay(4.0)
	
	pda_play_message("P5_Stronghold_Defeat")
	pda_log_message("P5_Stronghold_Defeat")
end