---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: projects_camera
-- Exported By: Ding.Ye
---------------------------------


function cutscene_main()
    load_chunk("sr_chunk07b",true)
	load_chunks("sr_chunk07","sr_chunk07b")
	thread_new_cutscene_shot("shot1", 1)
end

function shot1()
	fade_in(0.5)
	select_slate("slate_projects_camera")
	character_hide("#PLAYER#")
	
	
end

function cutscene_abort()
	letterbox_fade_out(true)
	
	character_show("#PLAYER#")
end

function cutscene_end()
	character_show("#PLAYER#")
	letterbox_fade_out(true)
	
end
