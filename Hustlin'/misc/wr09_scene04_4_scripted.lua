-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\wr09_scene04\wr09_scene04.cts
-- Level:D:\projects\blingbling\data\test\cutscene_wr09_scene04.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	time_of_day_character_shadows_enable(false)
	set_level_lights(false)
end

function shot2()
end

function shot3()
end

function shot4()
end

function shot5()
	fat_bones_enable("#PLAYER#", false) 
end

function shot6()
	set_far_clip(1000)
end

function shot7()
end

function cutscene_abort()
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_character_shadows_enable(true)
	set_far_clip(4000)
end

function cutscene_end()
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_character_shadows_enable(true)
	set_far_clip(4000)
end