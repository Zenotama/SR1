-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk02_scene02\vk02_scene02.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk32__interiors.cts
-------------------------------------


function cutscene_main()
	load_chunks("sr_chunk32_ms", "sr_chunk32")
end

function shot1()
end

function shot2()
end

function shot3()
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

function shot14()
	cutscene_mesh_hide("MS_C32_Glass_02")
	cutscene_mesh_hide("MS_C32_Glass_01")
	cutscene_mesh_hide("MS_C32_Glass_03")
	cutscene_mesh_hide("MS_C32_FDoor_01")
	cutscene_mesh_hide("MS_C32_FDoor_02")
	cutscene_mesh_hide("MS_C32_FDoor_03")
	cutscene_mesh_hide("MS_C32_FDoor_04")
	cutscene_mesh_hide("MS_C32_FDoor_05")
	cutscene_mesh_hide("MS_C32_FDoor_09")
	cutscene_mesh_hide("MS_C32_FDoor_14")
	cutscene_mesh_hide("MS_C32_Fdoor_17")
end

function cutscene_abort()
	cutscene_mesh_unhide("MS_C32_Glass_02")
	cutscene_mesh_unhide("MS_C32_Glass_03")
	cutscene_mesh_unhide("MS_C32_Glass_01")
	cutscene_mesh_unhide("MS_C32_FDoor_01")
	cutscene_mesh_unhide("MS_C32_FDoor_02")
	cutscene_mesh_unhide("MS_C32_FDoor_03")
	cutscene_mesh_unhide("MS_C32_FDoor_04")
	cutscene_mesh_unhide("MS_C32_FDoor_05")
	cutscene_mesh_unhide("MS_C32_FDoor_09")
	cutscene_mesh_unhide("MS_C32_FDoor_14")
	cutscene_mesh_unhide("MS_C32_Fdoor_17")
end

function cutscene_end()
	cutscene_mesh_unhide("MS_C32_Glass_02")
	cutscene_mesh_unhide("MS_C32_Glass_03")
	cutscene_mesh_unhide("MS_C32_Glass_01")
	cutscene_mesh_unhide("MS_C32_FDoor_01")
	cutscene_mesh_unhide("MS_C32_FDoor_02")
	cutscene_mesh_unhide("MS_C32_FDoor_03")
	cutscene_mesh_unhide("MS_C32_FDoor_04")
	cutscene_mesh_unhide("MS_C32_FDoor_05")
	cutscene_mesh_unhide("MS_C32_FDoor_09")
	cutscene_mesh_unhide("MS_C32_FDoor_14")
	cutscene_mesh_unhide("MS_C32_Fdoor_17")
end
