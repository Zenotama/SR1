-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc04_scene01\lc04_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__interiors.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	set_level_lights(false)
	tree_shadows_enable(false)
	set_far_clip(100)
end

function shot2()
	set_far_clip(20)
end

function shot3()
	set_far_clip(90)
end

function shot4()
	set_far_clip(20)
end

function shot5()
	set_far_clip(500)
end

function shot6()
	set_far_clip(19)
end

function shot7()
	set_far_clip(500)
end

function shot8()
	set_far_clip(100)
end

function shot9()
	set_far_clip(100)
end

function shot10()
	set_far_clip(25)
end

function shot11()
end

function cutscene_abort()
	set_far_clip(5000)
	tree_shadows_enable(true)
end

function cutscene_end()
	set_far_clip(5000)
	tree_shadows_enable(true)
end