-- phasefive_E2.lua
-- THQ Exec Presentation - Script 2 - Warehouse Interior
-- Created 12/20/04


-- doug:	replace ALL CAPS with reasonable names, and uncomment stuff out as necessary
--			*** DON'T FORGET TO CHANGE YOUR "cts_name DN" in your gamestart.txt to "cts_name E2"!!! ***

-- Global Variables

stronghold_chars = {"phasefive_E2_DoorwayB1", "phasefive_E2_DoorwayH1", "phasefive_E2_DoorwayH2", "phasefive_E2_DoorwayW1", "phasefive_E2_BarrelsB1", "phasefive_E2_BarrelsH1",
			"phasefive_E2_BarrelsH2", "phasefive_E2_BarrelsH3", "phasefive_E2_BarrelsW1", "phasefive_E2_BoxesB1", "phasefive_E2_BoxesB2", "phasefive_E2_BoxesH1",
			"phasefive_E2_BoxesW1", "phasefive_E2_BoxesW2", "phasefive_E2_Boss", "phasefive_E2_BossB1", "phasefive_E2_BossB2", "phasefive_E2_BossH1", "phasefive_E2_RampH1",
			"phasefive_E2_RampH2", "phasefive_E2_RampW1", "phasefive_E2_RampW2"} 

Doorway = {"phasefive_E2_DoorwayB1", "phasefive_E2_DoorwayH1", "phasefive_E2_DoorwayH2", "phasefive_E2_DoorwayW1"}
Barrels = {"phasefive_E2_BarrelsB1", "phasefive_E2_BarrelsH1", "phasefive_E2_BarrelsH2", "phasefive_E2_BarrelsH3", "phasefive_E2_BarrelsW1"}
Boxes = {"phasefive_E2_BoxesB1", "phasefive_E2_BoxesB2", "phasefive_E2_BoxesH1", "phasefive_E2_BoxesW1", "phasefive_E2_BoxesW2"}
Ramp = {"phasefive_E2_RampH1", "phasefive_E2_RampH2", "phasefive_E2_RampW1", "phasefive_E2_RampW2"}
Boss = {"phasefive_E2_Boss", "phasefive_E2_BossB1", "phasefive_E2_BossB2", "phasefive_E2_BossH1"}


function phasefive_exec2_init()
	on_trigger("show_doorway", "phasefive_E2_$trigger_doorway")
	on_trigger("show_barrels", "phasefive_E2_$trigger_barrels")
	on_trigger("show_boxes", "phasefive_E2_$trigger_boxes")
	on_trigger("show_ramp", "phasefive_E2_$trigger_ramp")
	on_trigger("show_boss", "phasefive_E2_$trigger_boss")
	on_trigger("peds_off", "phasefive_E2_$trigger_peds_off")
	on_trigger("peds_on", "phasefive_E2_$trigger_peds_on")

	-- AM 1/8/05: disable these triggers at start of level (you don't want them active if the player hasn't started the mission yet)
	trigger_disable("phasefive_E2_$trigger_doorway")
	trigger_disable("phasefive_E2_$trigger_barrels")
	trigger_disable("phasefive_E2_$trigger_boxes")
	trigger_disable("phasefive_E2_$trigger_ramp")
	trigger_disable("phasefive_E2_$trigger_boss")
	trigger_disable("phasefive_E2_$trigger_peds_off")
	trigger_disable("phasefive_E2_$trigger_peds_on")
end


function phasefive_exec2_main()
end


function show_doorway()
	--message("show_doorway")
	trigger_disable("phasefive_E2_$trigger_doorway")
	character_show_group(Doorway)
end

function show_barrels()
	--message("show_barrels")
	trigger_disable("phasefive_E2_$trigger_barrels")
	character_show_group(Barrels)
end

function show_boxes()
	--message("show_boxes")
	trigger_disable("phasefive_E2_$trigger_boxes")
	character_show_group(Boxes)
end

function show_ramp()
	--message("show_ramp")
	trigger_disable("phasefive_E2_$trigger_ramp")
	character_show_group(Ramp)
end

function show_boss()
	--message("show_boss")
	trigger_disable("phasefive_E2_$trigger_boss")
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
	if (is_mission_active("mission_ex1")) then
		mission_end_success("mission_ex1")
		delay(4)
	end
	fade_out(0.5)
	delay(0.6)
	party_dismiss_all()
	party_set_recruitable(true)
	party_set_dismissable(true)
	destroy_group("phasefive_E1_$Group-ware-ext1")
	destroy_group("phasefive_E2_$Doorway")
	destroy_group("phasefive_E2_$Boss")
	destroy_group("phasefive_E2_$Barrels")
	destroy_group("phasefive_E2_$Boxes")
	destroy_group("phasefive_E2_$Ramp")
	character_hide("JS_JohnnyNavpoint")
	spawning_on()
	minimap_icon_remove_navpoint("phasefive_E1_$nav-warehouse")
	minimap_icon_remove_navpoint("phasefive_E2_$nav006")
	delay(1.2)
	fade_in(1)
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




