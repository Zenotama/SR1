-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc04_tload\lc04_tload.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__interiors.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	load_chunk("sr_chunk02", true )
	select_slate("slate_samsons_garage")
	audio_play("LC04 TRUCK LOAD", "voice", true)
end

function shot2()
end

function shot3()
end

function cutscene_abort()
end

function cutscene_end()
end
