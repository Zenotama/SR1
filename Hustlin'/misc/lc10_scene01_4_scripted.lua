-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc10_scene01\lc10_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__interiors.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	spawning_peds(false)
	spawning_cars(false)
	set_level_lights(false)
	time_of_day_character_shadows_enable(false)
	tree_shadows_enable(false)
end

function shot2()
end

function shot3()
end

function shot4()
end

function shot5()
end

function cutscene_abort()
	spawning_peds(true)
	spawning_cars(true)
	time_of_day_character_shadows_enable(true)
	tree_shadows_enable(true)
end

function cutscene_end()
	spawning_peds(true)
	spawning_cars(true)
	time_of_day_character_shadows_enable(true)
	tree_shadows_enable(true)
end
