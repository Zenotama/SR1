-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\test_scripted_chars\test_scripted_chars.cts
-- Level:D:\projects\blingbling\data\test\cutscene_test_scripted_chars.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
end

function shot1()
	teleport_to_slate_pos("#PLAYER#", -2.0409, 0.00148093, -2.66336, "slate_test_scriptchars")
	play_custom_action_do("#PLAYER#", "test_scripted_1")
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
end

function cutscene_end()
	stop_custom_actions("#PLAYER#")
	letterbox_fade_out(true)
	fade_out(0.5)
end
