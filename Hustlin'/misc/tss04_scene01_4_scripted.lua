-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss04_scene01\tss04_scene01.cts
-- Level:D:\projects\blingbling\data\test\cutscene_tss04_scene01.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	set_level_lights(false)
	character_hide("CS_cell")
end

function shot2()
	character_show("CS_cell")
end

function shot3()
	fat_bones_enable("#PLAYER#", false) 
end

function shot4()
end

function shot5()
end

function shot6()
end

function shot7()
end

function shot8()
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

function cutscene_abort()
	fat_bones_enable("#PLAYER#", true) 
end

function cutscene_end()
	fat_bones_enable("#PLAYER#", true) 
end
