-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss01_scene03\tss01_scene03.cts
-- Level:D:\projects\blingbling\data\test\cutscene_tss01_scene03.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	set_level_lights(false)
	time_of_day_character_shadows_enable(false)
end

function shot2()
end

function shot3()
end

function shot4()
	fat_bones_enable("#PLAYER#", false)
end

function shot5()
	fat_bones_enable("#PLAYER#", true)
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

function cutscene_abort()
	time_of_day_character_shadows_enable(true)
	fat_bones_enable("#PLAYER#", true)
end

function cutscene_end()
	time_of_day_character_shadows_enable(true)
	fat_bones_enable("#PLAYER#", true)
end

function scripted_event1()
	teleport("CS_stander01", "CS_CSCharnav-stander01_1")
	play_action_sequence("CS_stander01", "stand")
end

function scripted_event2()
	teleport("CS_stander02", "CS_CSCharnav-stander02_1")
	play_action_sequence("CS_stander02", "stand")
end

function scripted_event3()
	teleport("CS_stander03", "CS_CSCharnav-stander03_1")
	play_action_sequence("CS_stander03", "stand")
end