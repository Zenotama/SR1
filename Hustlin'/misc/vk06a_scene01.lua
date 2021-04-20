---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: vk06a_scene01
-- Exported By: Ev.religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk04", true )
	load_chunks("sr_chunk04_cs", "sr_chunk04" )
	thread_new_cutscene_shot("shot1", 1)
	thread_new_cutscene_shot("shot2", 2)
	thread_new_cutscene_shot("shot3", 3)
	thread_new_cutscene_shot("shot4", 4)
	thread_new_cutscene_shot("shot5", 5)
	thread_new_cutscene_shot("shot6", 6)
	thread_new_cutscene_shot("shot7", 7)
	thread_new_cutscene_shot("shot8", 8)
	thread_new_cutscene_shot("shot9", 9)
	thread_new_cutscene_shot("shot10", 10)
	thread_new_cutscene_shot("shot11", 11)
	thread_new_cutscene_shot("shot12", 12)
	thread_new_cutscene_shot("shot13", 13)
	thread_new_cutscene_shot("shot14", 14)
	thread_new_cutscene_shot("shot15", 15)
	thread_new_cutscene_shot("shot16", 16)
	thread_new_cutscene_shot("shot17", 17)
	thread_new_cutscene_shot("shot18", 18)
	thread_new_cutscene_shot("shot19", 19)
	thread_new_cutscene_shot("shot20", 20)
end

function shot1()
	local excluded_lights_1 = {"BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_1, 4, false)

	local included_lights_1 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay Light11"}
	light_set_lights(included_lights_1, 11, true)

	fade_in(0.5)
	select_slate("slate_clothing_store")
	character_hide("#PLAYER#")
	teleport_to_slate_pos("CS_johnny", 1.065, 0.0, -0.485, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_1")
	teleport_to_slate_pos("CS_dex", 0.918, 0.0, 1.315, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_1")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_1")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_1")
	fat_bones_enable("#PLAYER#", false)
	set_level_lights(false)
	time_of_day_character_shadows_enable(false) 
	spawning_peds(false)
	spawning_cars(false)
	tree_shadows_enable(false)
end

function shot2()
	local excluded_lights_2 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Dex Rim Light07", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_2, 9, false)

	local included_lights_2 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Dex Key Light05", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_2, 6, true)

	teleport_to_slate_pos("CS_johnny", 1.065, 0.0, -0.364, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_2")
	teleport_to_slate_pos("CS_dex", 0.917, 0.0, 1.313, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_2")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_2")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_2")
end

function shot3()
	local excluded_lights_3 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Johnny Rim Light08", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_3, 8, false)

	local included_lights_3 = {"BB AllDay Dex Fill Light06", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Light11"}
	light_set_lights(included_lights_3, 7, true)

	teleport_to_slate_pos("CS_johnny", 1.078, 0.0, -0.368, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_3")
	teleport_to_slate_pos("CS_dex", 0.918, 0.0, 1.312, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_3")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_3")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_3")
end

function shot4()
	local excluded_lights_4 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Dex Rim Light07", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_4, 9, false)

	local included_lights_4 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay Light11"}
	light_set_lights(included_lights_4, 6, true)

	teleport_to_slate_pos("CS_johnny", 1.069, 0.0, -0.309, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_4")
	teleport_to_slate_pos("CS_dex", 0.917, 0.0, 1.316, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_4")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_4")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_4")
end

function shot5()
	local excluded_lights_5 = {"BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Rim Light08", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_5, 6, false)

	local included_lights_5 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Johnny Key Light06", "BB AllDay Light11"}
	light_set_lights(included_lights_5, 9, true)

	teleport_to_slate_pos("CS_johnny", 1.116, 0.0, -0.318, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_5")
	teleport_to_slate_pos("CS_dex", 0.917, 0.0, 1.314, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_5")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_5")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_5")
end

function shot6()
	local excluded_lights_6 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Dex Rim Light07", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_6, 10, false)

	local included_lights_6 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_6, 5, true)

	teleport_to_slate_pos("CS_johnny", 1.026, 0.0, -0.186, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_6")
	teleport_to_slate_pos("CS_dex", 0.916, 0.0, 1.306, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_6")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_6")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_6")
end

function shot7()
	local excluded_lights_7 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Johnny Rim Light08", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_7, 8, false)

	local included_lights_7 = {"BB AllDay Dex Fill Light06", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Light11"}
	light_set_lights(included_lights_7, 7, true)

	teleport_to_slate_pos("CS_johnny", 0.968, 0.0, -0.025, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_7")
	teleport_to_slate_pos("CS_dex", 0.918, 0.0, 1.311, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_7")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_7")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_7")
end

function shot8()
	local excluded_lights_8 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Dex Rim Light07", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_8, 9, false)

	local included_lights_8 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Dex Key Light05", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_8, 6, true)

	teleport_to_slate_pos("CS_johnny", 0.996, 0.0, -0.01, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_8")
	teleport_to_slate_pos("CS_dex", 0.916, 0.0, 1.311, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_8")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_8")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_8")
end

function shot9()
	local excluded_lights_9 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_9, 10, false)

	local included_lights_9 = {"BB AllDay Dex Fill Light06", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07"}
	light_set_lights(included_lights_9, 5, true)

	teleport_to_slate_pos("CS_johnny", 0.911, 0.0, -0.054, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_9")
	teleport_to_slate_pos("CS_dex", 0.917, 0.0, 1.309, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_9")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_9")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_9")
end

function shot10()
	local excluded_lights_10 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Dex Rim Light07", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_10, 9, false)

	local included_lights_10 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay Light11"}
	light_set_lights(included_lights_10, 6, true)

	teleport_to_slate_pos("CS_johnny", 0.906, 0.0, -0.055, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_10")
	teleport_to_slate_pos("CS_dex", 0.917, 0.0, 1.305, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_10")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_10")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_10")
end

function shot11()
	local excluded_lights_11 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Johnny Rim Light08", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_11, 6, false)

	local included_lights_11 = {"BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Light11"}
	light_set_lights(included_lights_11, 9, true)

	teleport_to_slate_pos("CS_johnny", 1.051, 0.0, -0.044, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_11")
	teleport_to_slate_pos("CS_dex", 0.919, 0.0, 1.32, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_11")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_11")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_11")
end

function shot12()
	local excluded_lights_12 = {"BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_12, 7, false)

	local included_lights_12 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_12, 8, true)

	teleport_to_slate_pos("CS_johnny", 0.877, 0.0, -0.079, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_12")
	teleport_to_slate_pos("CS_dex", 0.951, 0.0, 0.677, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_12")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_12")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_12")
end

function shot13()
	local excluded_lights_13 = {"BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_13, 7, false)

	local included_lights_13 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_13, 8, true)

	teleport_to_slate_pos("CS_johnny", 0.852, 0.0, -0.069, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_13")
	teleport_to_slate_pos("CS_dex", 0.767, 0.0, 0.615, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_13")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_13")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_13")
end

function shot14()
	local excluded_lights_14 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_14, 7, false)

	local included_lights_14 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_14, 8, true)

	teleport_to_slate_pos("CS_johnny", 0.943, 0.0, -0.094, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_14")
	teleport_to_slate_pos("CS_dex", 0.76, 0.0, 0.609, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_14")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_14")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_14")
end

function shot15()
	local excluded_lights_15 = {"BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Johnny Rim Light08", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_15, 7, false)

	local included_lights_15 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06"}
	light_set_lights(included_lights_15, 8, true)

	teleport_to_slate_pos("CS_johnny", 0.875, 0.0, -0.15, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_15")
	teleport_to_slate_pos("CS_dex", 0.913, 0.0, 0.583, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_15")
	teleport_to_slate_pos("CS_Tshirt", 0.249, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_15")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_15")
end

function shot16()
	local excluded_lights_16 = {"BB AllDay Dex Fill Light06", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light09", "BB AllDay Dex Rim Light07", "BB AllDay Light11", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_16, 9, false)

	local included_lights_16 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Dex Key Light05", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08"}
	light_set_lights(included_lights_16, 6, true)

	teleport_to_slate_pos("CS_johnny", 0.939, 0.0, -0.107, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_16")
	teleport_to_slate_pos("CS_dex", 0.82, 0.0, 0.622, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_16")
	teleport_to_slate_pos("CS_Tshirt", 0.649, 0.0, 0.017, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_16")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_16")
end

function shot17()
	local excluded_lights_17 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay PC Key Light07"}
	light_set_lights(excluded_lights_17, 9, false)

	local included_lights_17 = {"BB AllDay Dex Fill Light06", "BB AllDay Dex Key Light05", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Dex Rim Light07", "BB AllDay Light11"}
	light_set_lights(included_lights_17, 6, true)

	teleport_to_slate_pos("CS_johnny", 0.933, 0.0, -0.113, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_17")
	teleport_to_slate_pos("CS_dex", 0.839, 0.0, 0.616, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_17")
	teleport_to_slate_pos("CS_Tshirt", 0.653, 0.0, 0.017, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_17")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_17")
end

function shot18()
	local excluded_lights_18 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Light01", "BB AllDay Light02", "BB AllDay Light09", "BB AllDay Light10", "BB AllDay Dex Rim Light07", "BB AllDay Light11"}
	light_set_lights(excluded_lights_18, 7, false)

	local included_lights_18 = {"BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Dex Key Light05", "BB AllDay Light08", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay PC Key Light07"}
	light_set_lights(included_lights_18, 8, true)

	teleport_to_slate_pos("CS_johnny", 0.928, 0.0, -0.11, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_18")
	teleport_to_slate_pos("CS_dex", 0.845, 0.0, 0.593, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_18")
	teleport_to_slate_pos("CS_Tshirt", 0.653, 0.0, 0.017, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_18")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_18")
end

function shot19()
	local excluded_lights_19 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light10", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay Light11"}
	light_set_lights(excluded_lights_19, 11, false)

	local included_lights_19 = {"BB AllDay Dex Key Light05", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay PC Key Light07"}
	light_set_lights(included_lights_19, 4, true)

	character_show("#PLAYER#")
	teleport_to_slate_pos("#PLAYER#", -1.348, 0.0, -0.085, "slate_clothing_store")
	play_custom_action_do("#PLAYER#", "vk06a_scene01_player_19")
	teleport_to_slate_pos("CS_johnny", 0.903, 0.0, -0.128, "slate_clothing_store")
	play_custom_action_do("CS_johnny", "vk06a_scene01_johnny_19")
	teleport_to_slate_pos("CS_dex", 0.856, 0.0, 0.586, "slate_clothing_store")
	play_custom_action_do("CS_dex", "vk06a_scene01_dex_19")
	teleport_to_slate_pos("CS_Tshirt", -0.983, 0.0, -0.303, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_19")
	teleport_to_slate_pos("CS_shopppingbag", 0.255, 0.0, 1.286, "slate_clothing_store")
	play_custom_action_do("CS_shopppingbag", "vk06a_scene01_shoppingbag_19")
end

function shot20()
	local excluded_lights_20 = {"BB AllDay  Johnny Fill Light07", "BB AllDay Dex Fill Light06", "BB AllDay Light04", "BB AllDay Light03", "BB AllDay Light02", "BB AllDay Light08", "BB AllDay Light10", "BB AllDay Dex Rim Light07", "BB AllDay Johnny Key Light06", "BB AllDay Johnny Rim Light08", "BB AllDay Light11"}
	light_set_lights(excluded_lights_20, 11, false)

	local included_lights_20 = {"BB AllDay Dex Key Light05", "BB AllDay Light01", "BB AllDay Light09", "BB AllDay PC Key Light07"}
	light_set_lights(included_lights_20, 4, true)

	teleport_to_slate_pos("#PLAYER#", -1.369, 0.0, -0.098, "slate_clothing_store")
	play_custom_action_do("#PLAYER#", "vk06a_scene01_player_20")
	teleport_to_slate_pos("CS_Tshirt", -1.073, 0.0, -0.32, "slate_clothing_store")
	play_custom_action_do("CS_Tshirt", "vk06a_scene01_tshirt_20")
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	fat_bones_enable("#PLAYER#", true) 
	time_of_day_character_shadows_enable(true)
	spawning_peds(true)
	spawning_cars(true)
	tree_shadows_enable(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_johnny")
	stop_custom_actions("CS_dex")
	stop_custom_actions("CS_Tshirt")
	stop_custom_actions("CS_shopppingbag")
	letterbox_fade_out(true)
	fade_out(0.5)
	fat_bones_enable("#PLAYER#", true)
	time_of_day_character_shadows_enable(true) 
	spawning_peds(true)
	spawning_cars(true)
	tree_shadows_enable(true)
end