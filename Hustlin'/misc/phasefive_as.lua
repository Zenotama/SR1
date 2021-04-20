--race_active=false

function phasefive_anoop_init()
--	on_npc_trigger("start_race", "AS_RaceGuy#001_AS")
--	on_race_end("end_race", "player_won", "AS_race000")
--	on_activity_trigger("loan_begin", "loan_shark_cutscene", "talk to the Loan Shark", "AS_Activity000")
	on_trigger("loan_start", "AS_Activity000")
	activity_add("Pimping", "Brothel1", "AS_$navp_pimping", "pimp_cutscene", "begin the pimp activity")
	activity_add("Racing", "Phasefive", "AS_$nav000", "racing_cutscene", "begin the racing activity")
end


function phasefive_anoop_main()
--	minimap_icon_add_navpoint("AS_$nav000", "radar_raceenda.tga")
	minimap_icon_add_navpoint("AS_$nav001", "radar_loanshark.tga")
--	minimap_icon_add_navpoint("AS_$nav002", "radar_pimp.tga")
--	minimap_icon_add_navpoint("AS_$navp_pimping", "radar_pimp.tga")
end


--function start_race()
--	if (not race_active) then
--		subtitle("You want to race?", 5.0)
--		subtitle("Then get over to the start point that I'm putting on your map", 5.0)
--		minimap_icon_add_navpoint("AS_$start000", "radar_raceenda.tga")
--		minimap_icon_remove_navpoint("AS_$nav000")
--		race_enable_opponents("AS_race000", false, 0, "Hood1Opp1", "Hood1Opp2", "Hood1Opp3")
--		race_active=true
--		audio_play_for_character("Race Pickup 1", "AS_RaceGuy#001_AS", "voice")
--		delay(.8)
--		audio_play_for_character("Race Pickup 2", "AS_RaceGuy#001_AS", "voice")
--	end
--end


--function end_race()
--	race_active=false
--	minimap_icon_remove_navpoint("AS_$start000")
--	minimap_icon_add_navpoint("AS_$nav000", "radar_raceenda.tga")
--end

function loan_begin()
	loan_start()
end

--function pimp_begin()
--	pimping_start("Brothel1")
--end

function loan_shark_cutscene()
end

function pimp_cutscene()
end

function racing_cutscene()
end

--function player_won()
--	props_add(200)
--end