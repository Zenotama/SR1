-- e3citynight.lua
-- Master Lua Script for E3 Night level
-- Created 5/9/05


include("e3_district_night.lua")


function e3citynight_init()
	e3_district_night_init()
end


function e3citynight_main()
	thread_new("e3_district_night_main")
end