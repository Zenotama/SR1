-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\test_scripted_chars\test_scripted_chars.cts
-- Level:D:\projects\blingbling\data\test\cutscene_test_scripted_chars.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
	load_chunk("cutscene_test_scripted_chars", true )
	select_slate("slate_test_scriptchars")
end

function cutscene_abort()
end

function cutscene_end()
end