-- phasefive_E2.lua
-- THQ Exec Presentation - Script 2 - Warehouse Interior
-- Created 12/20/04


-- doug:	replace ALL CAPS with reasonable names, and uncomment stuff out as necessary
--			*** DON'T FORGET TO CHANGE YOUR "cts_name DN" in your gamestart.txt to "cts_name E2"!!! ***

NAME_OF_GROUP_OF_GUYS_TO_ACTIVATE_HEARING = {"1ST GUY", "2ND GUY", "3RD GUY"} -- can have as many guys in here as you want


function phasefive_exec2_init()
	--create_group("NAME_OF_GROUP")

	--on_death("FUNCTION_TO_CALL_WHEN_CHARACTER_DIES", "CHARACTER_NAME_OF_GUY_TO_DIE")

	--on_trigger("FUNCTION_TO_CALL_WHEN_PLAYER_WALKS_ONTO_TRIGGER", "TRIGGER NAME")

	--hearing_disable_group(NAME_OF_GROUP_OF_GUYS_TO_ACTIVATE_HEARING) -- no quotes here
end


function phasefive_exec2_main()
end


-- enable hearing of a group of characters
function FUNCTION_TO_CALL_WHEN_PLAYER_WALKS_ONTO_TRIGGER()
	hearing_enable_group(NAME_OF_GROUP_OF_GUYS_TO_ACTIVATE_HEARING) -- no quotes here
end


-- play some audio lines when a specific character dies
function FUNCTION_TO_CALL_WHEN_CHARACTER_DIES()
end