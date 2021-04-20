-- phasefive.lua
-- Master Lua Script for Phase 5 level
-- Created 8/14/04


--include("phasefive_AM.lua")
--include("phasefive_AS.lua")
--include("phasefive_DN.lua")
--include("phasefive_E1.lua")
--include("phasefive_E2.lua")
include("phasefive_DW.lua")
--include("cutscene_racing_downtown.lua")
include("cutscene_exec_combat.lua")

include("pd01.lua")
include("pd_district.lua")


function phasefive_init()
	--phasefive_alvan_init()
	--phasefive_anoop_init()
	--phasefive_doug_init()
	--phasefive_exec1_init()
	--phasefive_exec2_init()
	phasefive_dave_init()
--	cutscene_racing_downtown_init()
	cutscene_exec_combat_init()

	pd01_init()
	pd_district_init()
end


function phasefive_main()
	--thread_new("phasefive_alvan_main")
	--thread_new("phasefive_anoop_main")
	--thread_new("phasefive_exec1_main")
	--thread_new("phasefive_exec2_main")
	thread_new("phasefive_dave_main")

	thread_new("pd01_main")
	thread_new("pd_district_main")
end