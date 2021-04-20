-- Test cutscene script for BB
-- 10/18/04

function cutscene_main()
	thread_new_cutscene_shot("shot1", 1)
end


function shot1()
	fade_in(0.5)
	letterbox_fade_in(true)
end

function shot2()
end

function cutscene_end()		
end