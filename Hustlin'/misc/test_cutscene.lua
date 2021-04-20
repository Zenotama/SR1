-- Test cutscene script for BB
-- 10/18/04

function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
end


function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport("#PLAYER#", "$root_controller_MAL2")
	teleport("Ped_Male#000", "$root_controller_MAL3")
	play_custom_action("#PLAYER#", "GML1_Custom01")
	play_custom_action("Ped_Male#000", "PML1_Custom01")	
	fade_in(2.0)
end

function shot2()
	delay(4.5)	
	fade_out(0.75)
	delay(0.75)
	letterbox_fade_out(true)
end

function cutscene_abort()
	letterbox_fade_out(false)
end

function cutscene_end()	
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("Ped_Male#000")
end