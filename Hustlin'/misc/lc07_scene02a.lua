-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\lc07_scene02a\lc07_scene02a.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__interiors.cts
-------------------------------------


function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
end

function shot1()
	fade_in(0.5)
	teleport("CS_dex", "CS_$root_controller_dex01")
	play_custom_action_do("CS_dex", "lc07_scene02a_dex")
	teleport("CS_troy", "CS_$root_controller_troy01")
	play_custom_action_do("CS_troy", "lc07_scene02a_troy")
	teleport("CS_corpse", "CS_$root_controller_corpse01")
	play_custom_action_do("CS_corpse", "lc07_scene02a_corpse")
end

function cutscene_abort()
        letterbox_fade_out(true)
        fade_out(0.5)
end

function cutscene_end()
        letterbox_fade_out(true)
        fade_out(0.5)
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_troy")
	stop_custom_actions("CS_corpse")
end
