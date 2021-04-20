-- /////////////////////////////////////////////////////////////
--                Code generated by LUA Cutscene Editor
--                      Version: 0.2b
--                      Date: 12/15/2005 11:01:07 AM
--                      Author: jeff.spoonhower
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk01_kidnapper\vk01_kidnapper.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk06__RLDinteriors.cts
-- /////////////////////////////////////////////////////////////

function cutscene_main()
end

function shot1()
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	time_of_day_character_shadows_enable(false)
end

function shot2()
end

function cutscene_abort()
	time_of_day_character_shadows_enable(true)
end

function cutscene_end()
	time_of_day_character_shadows_enable(true)
end

function scripted_event1()
	teleport("CS_walker01", "CS_Charnav_walker01_1")
	local walker01_navs01 = {"CS_PathNav_walker01_01_1"}
	move_to("CS_walker01", walker01_navs01, 1)
end

function scripted_event2()
	teleport("CS_talker01", "CS_CharNav_talker01_1")
	play_action_sequence("CS_talker01", "talk submissive", "talk yell", "talk submissive", "talk submissive")
end

function scripted_event3()
	teleport("CS_talker02", "CS_CharNav_talker02_1")
	play_action_sequence("CS_talker02", "talk yell", "talk submissive", "talk submissive", "talk yell")
end
