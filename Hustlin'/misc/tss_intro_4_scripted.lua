-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\tss_intro\tss_intro.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk05__ground.cts
-------------------------------------


function cutscene_main()
end

function shot1()
	set_far_clip(5000)
	set_weather(0, true)
	set_time_of_day(22, 0)
	set_level_lights(false)

	
	inv_item_equip("watchcase","CS_hustler")
	
	thread_new("scripted_event1", 1)
	thread_new("scripted_event2", 2)
	thread_new("scripted_event3", 3)
	thread_new("scripted_event4", 4)
end

function shot2()
	set_far_clip(40)
	character_hide("CS_walker01")
    character_hide("CS_walker02")
    character_hide("CS_ho02")
    character_hide("CS_stander01") 
	
    character_hide("CS_hustler")
	
	inv_item_equip("spraycancut","CS_vkc")
	inv_item_equip("baseball_bat","CS_wra")

end

function shot3()
	set_far_clip(5000)
    thread_new("scripted_event5", 5)


end

function shot4()
	set_far_clip(5000)
   character_hide("CS_walker03")
   thread_new("scripted_event6", 6)
   thread_new("scripted_event7", 7)


end

function shot5()
	set_far_clip(200)
    character_hide("CS_ho03")
    character_hide("CS_ho04")
    thread_new("scripted_event8", 8)
	thread_new("scripted_event9", 9)
   

end

function shot6()
	set_far_clip(20)
    character_hide("CS_stander02")
    character_hide("CS_stander03")
   

end

function shot7()
	set_far_clip(50)
end

function shot8()
	set_far_clip(5000)
end	

function shot9()

end

function shot10()
	set_far_clip(20)
	npc_holster("CS_wra") 

end

function shot11()
	set_far_clip(5000)
end

function shot12()

end

function shot13()
	set_far_clip(70) 
end

function shot14()
	set_far_clip(6)
end

function shot15()
	set_far_clip(6)
end

function shot16()
	set_far_clip(6)
end

function shot17()
	set_far_clip(5000)
   npc_unholster_best_weapon("CS_troy")
   npc_unholster_best_weapon("CS_vka")
   npc_unholster_best_weapon("CS_vb")
   npc_unholster_best_weapon("CS_lca")
   npc_unholster_best_weapon("CS_lcb")
   npc_unholster_best_weapon("CS_lcc")
   npc_unholster_best_weapon("CS_wrb")
   npc_unholster_best_weapon("CS_wrc")
   
   inv_item_equip("desert eagle","CS_vkc")
   inv_item_equip("ak47","CS_wra")
   
   spawning_remove_all() 


end

function shot18()
	
end

function shot19()

end

function shot20()
	
end

function shot21()
	set_far_clip(300)
end

function shot22()
	set_far_clip(5000)
end

function shot23()
	set_far_clip(50)
end

function shot24()
	set_far_clip(5000)
end

function shot25()

end

function shot26()
	
end

function shot27()
	set_far_clip(100)
end

function shot28()
	set_far_clip(5000)
end

function shot29()
	set_far_clip(50)
end

function shot30()
	set_far_clip(100)
end

function shot31()
	set_far_clip(100)	
end

function shot32()
	set_far_clip(100)
end

function shot33()
	set_far_clip(50)
end

function shot34()
	set_far_clip(5000)
end

function shot35()
	
end

function shot36()
	
end

function shot37()
	
end

function shot38()
	set_far_clip(50)
end

function shot39()
	set_far_clip(100)
end

function shot40()
	set_far_clip(5000)
end

function shot41()
	set_far_clip(150)
end

function shot42()
	set_far_clip(140)
end

function shot43()
	set_far_clip(20)
end

function shot44()
	set_far_clip(5000)
end

function shot45()
	fat_bones_enable("#PLAYER#", false)
	
end

function shot46()

	delay(1)
	fade_out(0.5)
	delay(2.2)
	fade_in(0.5)
	character_hide("CS_lcb")
	character_hide("CS_lca")
end

function shot47()
	set_far_clip(1000)
	fat_bones_enable("#PLAYER#", true)
end

function shot48()
	set_far_clip(5000)	
end

function shot49()
	
end

function shot50()

end

function shot51()
	
end

function shot52()
	
end

function shot53()
	
end

function shot54()
 	--lay(7.6)
	--de_out(0.5)

end

function cutscene_abort()
	set_far_clip(5000)
	spawning_on()
	set_level_lights(true)
	set_time_of_day(9, 0)
	fat_bones_enable("#PLAYER#", true)
end

function cutscene_end()
	set_far_clip(5000)
	spawning_on()
	set_level_lights(true)
	set_time_of_day(9, 0)
	fat_bones_enable("#PLAYER#", true)
end

function scripted_event1()
	local walker01 = {"CS_pathNav-walker01-01_1"}
	move_to("CS_walker01", walker01, 1)
end

function scripted_event2()
	local walker02 = {"CS_pathNav-walker02-01_1"}
	move_to("CS_walker02", walker02, 1)
end

function scripted_event3()
	teleport("CS_ho02", "CS_Charnav-ho02_1")
	play_action_sequence("CS_ho02", "stand")
end

function scripted_event4()
	teleport("CS_stander01", "CS_Charnav-stander01_1")
	play_action_sequence("CS_stander01", "drunk stand", "talk yell")
end

function scripted_event5()
	local walker03 = {"CS_pathNav-walker03-01_1"}
	move_to("CS_walker03", walker03, 3)
end

function scripted_event6()
	teleport("CS_ho03", "CS_Charnav-ho03_1")
	play_action_sequence("CS_ho03", "stand", "idle flirt")
end

function scripted_event7()
	teleport("CS_ho04", "CS_Charnav-ho04_1")
	play_action_sequence("CS_ho04", "stand", "idle Fix Hair")
end

function scripted_event8()
	teleport("CS_stander02", "CS_Charnav-stander02_1")
	play_action_sequence("CS_stander02", "angry stand")
end

function scripted_event9()
	teleport("CS_stander03", "CS_Charnav-stander03_1")
	play_action_sequence("CS_stander03", "drunk stand")
end
