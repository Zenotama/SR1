-- /////////////////////////////////////////////////////////////
--                Code generated by LUA Cutscene Editor
--                      Version: 0.2b
--                      Date: 1/26/2006 12:40:01 PM
--                      Author: Ev.religioso
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss01_scene01\tss01_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__ground.cts
-- /////////////////////////////////////////////////////////////

function cutscene_main()
end

function shot1()
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	thread_new("scripted_event4", 4)
	spawning_peds(false)
	spawning_cars(false)
	character_hide("CS_jnny")
	character_hide("CS_sntd")
	set_level_lights(false)
	time_of_day_character_shadows_enable(false)
	set_far_clip(200)
end

function shot2()
	thread_new("scripted_event12", 12)
	character_show("CS_jnny")
	character_show("CS_sntd")
end

function shot3()
end

function shot4()
	thread_new("scripted_event6", 6)
end

function shot5()
end

function shot6()
	thread_new("scripted_event7", 7)
	thread_new("scripted_event8", 8)
end

function shot7()
end

function shot8()
end

function shot9()
	thread_new("scripted_event10", 10)
	thread_new("scripted_event11", 11)
end

function shot10()
end

function shot11()
end

function shot12()
	thread_new("scripted_event5", 5)
	thread_new("scripted_event9", 9)
end

function shot13()
end

function cutscene_abort()
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
	set_far_clip(4000)
end

function cutscene_end()
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
	set_far_clip(4000)
end

function scripted_event1()
	play_action_sequence("CS_stander01", "stand")
end

function scripted_event2()
	play_action_sequence("CS_stander02", "stand")
end

function scripted_event3()
	delay(0.3)
	play_action_sequence("CS_stander03", "stand")
end

function scripted_event4()
	play_action_sequence("CS_stander04", "stand")
end

function scripted_event5()
	play_action_sequence("CS_stander03", "Taunt 3", "Taunt 3", "Taunt 3")
end

function scripted_event6()
	play_action_sequence("CS_stander01", "interaction gang sign stand 1")
end

function scripted_event7()
	play_action_sequence("CS_stander02", "interaction gang sign stand 3")
end

function scripted_event8()
	play_action_sequence("CS_stander03", "interaction gang sign stand 4")
end

function scripted_event9()
	play_action_sequence("CS_stander02", "interaction gang sign move 2")
end

function scripted_event10()
	play_action_sequence("CS_stander02", "idle variant 6")
end

function scripted_event11()
	play_action_sequence("CS_stander03", "idle variant 1")
end

function scripted_event12()
	play_action_sequence("CS_stander02", "idle variant 3")
end
