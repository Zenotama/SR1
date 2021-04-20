-- e3city.lua
-- Master Lua Script for E3 level
-- Created 4/21/05


include("e3_district.lua")


function e3city_init()
	e3_district_init()
end


function e3city_main()
	thread_new("e3_district_main")
end