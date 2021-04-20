-- 03/29/05		JH: initial version.
-- 04/06/05		JH: Removed old shiznit.

function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
end

function shot1()
	fade_in(1.0)
	letterbox_fade_in(true)
	npc_unholster_best_weapon("JH_tyrell")
	teleport("#PLAYER#", "JH_$root_controller_player01")
	teleport("JH_tyrell", "JH_$root_controller_tyrell01")
	play_custom_action("#PLAYER#", "racing_downtown_player")
	play_custom_action("JH_tyrell", "racing_downtown_tyrell")
end

function shot2()
	npc_holster("JH_tyrell")
end

function shot3()
end

function shot4()
end

function shot5()
end

function cutscene_abort()
        letterbox_fade_out(true)
        fade_out(0.5)
end

function cutscene_end()
        letterbox_fade_out(true)
        fade_out(0.5)
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("JH_tyrell")
end
