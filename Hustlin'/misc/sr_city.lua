-- saints_row.lua
-- Master Lua Script for Saints Row
-- Created 1/22/05


-- include("airport.lua")		-- DISTRICTS
-- include("apts.lua")
-- include("barrio.lua")
-- include("chinatown.lua")
-- include("docks.lua")
-- include("downtown.lua")
-- include("factory.lua")
-- include("highend.lua")
-- include("museum.lua")
-- include("projects.lua")
-- include("racetrack.lua")
-- include("redlight.lua")
-- include("saintsrow.lua")
-- include("trainyard.lua")
-- include("truckyard.lua")
-- include("vksuburb.lua")
-- include("wrsuburb.lua")
--include("mission_global.lua")

-- scripts for special spawns
--include("sspawn_scripts.lua")

--include("screenshot.lua")

function sr_city_init()
	airport_init()		-- DISTRICTS
	apts_init()
	barrio_init()
	chinatown_init()
	docks_init()
	downtown_init()
	factory_init()
	highend_init()
	museum_init()
	projects_init()
	racetrack_init()
	redlight_init()
	saintsrow_init()
	trainyard_init()
	truckyard_init()
	vksuburb_init()
	wrsuburb_init()
	
	tss01_init()
	tss01a_init()
	tss02_init()
	
	if (is_demo_execution()) then
		return
	end
	
	tss03_init()
	tss04_init()
	tss05_init()

	lc01_init()
	lc02_init()			-- MISSIONS
	lc03_init()
	lc04_init()
	lc05_init()
	lc06_init()
	lc07_init()
	lc08_init()
	lc09a_init()
	lc10_init()

	vk01_init()
	vk02_init()
	vk03a_init()
	vkx_init()
	vk04a_init()
	vk05_init()
	vk06a_init()
	vk06b_init()
	vk07_init()
	vk08_init()
	vk09_init()

	wr01_init()
	wr02_init()
	wr03_init()
	wr04_init()
	wr05_init()
	wr06_init()
	wr07_init()
	wr08_init()
	wr09_init()

	--test_ghost_init()
	--profiling_init()
	--v_a_t_init()

end

function sr_city_main()
	hood_set_owner("ts_saintsrow01", "Playas")
	shop_unlock_all()
	
	mesh_hide("sr_city_train1")
	mesh_mover_play_action("sr_city_LotGateMover0", "start1")

	thread_new("airport_main")		-- DISTRICTS
	thread_new("apts_main")
	thread_new("barrio_main")
	thread_new("chinatown_main")
	thread_new("docks_main")
	thread_new("downtown_main")
	thread_new("factory_main")
	thread_new("highend_main")
	thread_new("museum_main")
	thread_new("projects_main")
	thread_new("racetrack_main")
	thread_new("redlight_main")
	thread_new("saintsrow_main")
	thread_new("trainyard_main")
	thread_new("truckyard_main")
	thread_new("vksuburb_main")
	thread_new("wrsuburb_main")

	thread_new("tss01_main")
	thread_new("tss01a_main")
	thread_new("tss02_main")
	
	if (is_demo_execution()) then
		return
	end
	
	thread_new("tss03_main")
	thread_new("tss04_main")
	thread_new("tss05_main")
	
	thread_new("lc01_main")
	thread_new("lc02_main")			-- MISSIONS
	thread_new("lc03_main")
	thread_new("lc04_main")
	thread_new("lc05_main")
	thread_new("lc06_main")
	thread_new("lc07_main")
	thread_new("lc08_main")
	thread_new("lc09_main")
	thread_new("lc10_main")
	
	thread_new("vk01_main")
	thread_new("vk02_main")
	thread_new("vk03a_main")
	thread_new("vk04a_main")
	thread_new("vk05_main")
	thread_new("vk06a_main")
	thread_new("vk06b_main")
	thread_new("vk07_main")
	thread_new("vk08_main")
	thread_new("vk09_main")
	thread_new("vkx_main")
	
	thread_new("wr01_main")
	thread_new("wr02_main")
	thread_new("wr03_main")
	thread_new("wr04_main")
	thread_new("wr05_main")
	thread_new("wr09_main")

-- test case "mission" for ghost peer
	thread_new("test_ghost_main")
end
