-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\test_effects\test_effects.cts
-- Level:undefined.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
end

function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
	load_chunk("cutscene_test_effects", true )
	select_slate("effectsTest")
end

function shot2()
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
end

function cutscene_end()
	letterbox_fade_out(true)
	fade_out(0.5)
end
