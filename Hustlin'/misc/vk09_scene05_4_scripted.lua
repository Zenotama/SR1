-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk09_scene05\vk09_scene05.cts
-- Level:D:\projects\blingbling\data\cutscenes\vk09_scene05\vk09_scene05.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	shader_lod_force_highest()
	set_level_lights(false)
	set_force_time_of_day_lights("true")
	fat_bones_enable("#PLAYER#", false) 
	pvs_enable(false)
end

function shot2()
end

function shot3()
	set_force_time_of_day_lights("false")
end

function shot4()
end

function shot5()
end

function shot6()
	set_force_time_of_day_lights("true")
end

function shot7()
	set_force_time_of_day_lights("true")
   	character_hide("CS_car")
end

function shot8()
	set_force_time_of_day_lights("true")
end

function shot9()
end

function shot10()
end

function shot11()
end

function shot12()
end

function shot13()
end

function shot14()
end

function shot15()
end

function shot16()
end

function shot17()
	fat_bones_enable("#PLAYER#", true) 
end

function shot18()
end

function shot19()
	fat_bones_enable("#PLAYER#", false) 
end

function cutscene_abort()
	shader_lod_restore()
	fat_bones_enable("#PLAYER#", true) 
	set_force_time_of_day_lights("disabled")
	set_level_lights(true)
end

function cutscene_end()
	shader_lod_restore()
	fat_bones_enable("#PLAYER#", true) 
	set_force_time_of_day_lights("disabled")
	set_level_lights(true)
end
