-- /////////////////////////////////////////////////////////////
--                Code generated by LUA Cutscene Editor
--                      Version: 0.2b
--                      Date: 12/12/2005 6:39:45 PM
--                      Author: Ding.Ye
-- Cutscene:D:\projects\blingbling\data\cutscenes\vandalism_wrsuburbs\vandalism_wrsuburbs.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__ground.cts
-- /////////////////////////////////////////////////////////////

function cutscene_main()
end

function shot1()
	set_level_lights(false)
end

function shot2()
end

function shot3()
end

function shot4()
end

function shot5()
	thread_new("scripted_event3", 3)
	thread_new("scripted_event4", 4)
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

function cutscene_abort()
end

function cutscene_end()
end

function scripted_event3()
	teleport("CS_walker03", "CS_CSCharnav-walker03_1")
	play_action_sequence("CS_walker03", "talk confrontational")
end

function scripted_event4()
	teleport("CS_stander01", "CS_CSCharnav-stander01_1")
	play_action_sequence("CS_stander01", "talk yell")
end