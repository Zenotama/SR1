-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\wr06_scene01\wr06_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02_church__interiors.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	load_chunks("sr_chunk02_church", "sr_chunk09")
	select_slate("slate_church_main")
	audio_play("WR06_SCENE01", "voice", true)
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
	load_chunk("sr_chunk09", true )
	select_slate("slate_wr_poolhall_room")
end

function shot7()
end

function shot8()
end

function shot9()
end

function cutscene_abort()
end

function cutscene_end()
end