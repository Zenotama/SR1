-- Executive Presentation Race Activity
-- Created by David Wessman 12/17/04

function phasefive_dave_init()
	activity_add("Racing", "phasefive", "AS_$nav000", "racing_cutscene", "begin the racing activity")
end

function phasefive_dave_main()
end

		-- Racing Setup --

function phasefive_racing_init()
end

function racing_cutscene()
	fade_out(0.5)
	delay(1.0)
	cutscene_play("racing_downtown")
end