-- /////////////////////////////////////////////////////////////
--                Code generated by LUA Cutscene Editor
--                      Version: 0.2b
--                      Date: 1/3/2006 5:14:26 PM
--                      Author: Ev.Religioso
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss_final01\tss_final01.cts
-- Level:
-- /////////////////////////////////////////////////////////////

function cutscene_main()
end

function shot1()
	city_no_render_al(true)
	set_human_cutscene_weapon("cellphone1l")
	time_of_day_lights_enable(false)
end

function shot2()
	set_human_cutscene_weapon("cellphone1l", "CS_jul")
	time_of_day_lights_enable(true)
end

function shot3()
	time_of_day_lights_enable(false)
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
	set_human_cutscene_weapon("bouquet", "CS_jnny")
end

function shot4()
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
end

function shot5()
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
	set_human_cutscene_weapon("photolynn", "CS_don")
end

function shot6()
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
end

function shot7()
	time_of_day_lights_enable(true)
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
	set_human_cutscene_weapon("photokingjulius", "CS_king")
end

function shot8()
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
	set_human_cutscene_weapon("", "CS_king")
	set_human_cutscene_weapon("briefcaseL", "CS_king")
end

function shot9()
	time_of_day_lights_enable(false)
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
	set_human_cutscene_weapon("lighter", "CS_luz")
	set_human_cutscene_weapon("lighterL", "CS_man")
end

function shot10()
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 

end

function shot11()
	time_of_day_lights_enable(true)
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
end

function shot12()
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
end

function shot13()
	time_of_day_lights_enable(false)
	set_framebuffer_tint (0.223,0.190,0.119,5)  
	set_framebuffer_saturation (0.7) 
	set_human_cutscene_weapon("liquorbottle", "CS_troy")
end

function shot14()
	time_of_day_lights_enable(false)
end

function shot15()
	time_of_day_lights_enable(true)
end

function shot16()
	time_of_day_lights_enable(false)
end

function shot17()
	fat_bones_enable("#PLAYER#", false) 
end

function cutscene_abort()
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_lights_enable(true)
	character_show("#PLAYER#")
end

function cutscene_end()
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_lights_enable(true)
	character_show("#PLAYER#")
end
