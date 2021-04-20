---------------------------------
-- Generated By: SR Cutscene Exporter
-- Cutscene: vk03b_scene01
-- Exported By: Ev.Religioso
---------------------------------


function cutscene_main()
	load_chunk("sr_chunk34_vk09", true )
	pvs_enable(false)
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
	thread_new_cutscene_shot("shot21", 21)
	thread_new_cutscene_shot("shot22", 22)
end

function shot1()
	local excluded_lights_1 = {"CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot03", "PentSpot50", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni48"}
	light_set_lights(excluded_lights_1, 14, false)

	local included_lights_1 = {"CS_PentSpot02", "CS_Omni44", "PentSpot01", "PentSpot02", "PentBB Omni44", "PentBB Omni25", "PentSpot71", "CS Warren Omni47", "CS Warren Omni49"}
	light_set_lights(included_lights_1, 9, true)

	fade_in(0.5)
	select_slate("slate_vkboardroom")
	character_hide("#PLAYER#")
	teleport_to_slate_pos("CS_king", 9.549, 0.0, -10.031, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_1")
	teleport_to_slate_pos("CS_warren", 7.393, 0.0, -9.691, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_1")
	teleport_to_slate_pos("CS_tanya", -2.722, 0.0, 2.742, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_1")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_1")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_1")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_1")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_1")
	time_of_day_character_shadows_enable(false)
	set_level_lights(false)
end

function shot2()
	local excluded_lights_2 = {"CS_Omni44", "CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_2, 17, false)

	local included_lights_2 = {"CS_PentSpot02", "PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_2, 6, true)

	teleport_to_slate_pos("CS_king", 9.545, 0.0, -10.026, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_2")
	teleport_to_slate_pos("CS_warren", 7.394, 0.0, -9.691, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_2")
	teleport_to_slate_pos("CS_tanya", -2.722, 0.0, 2.74, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_2")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_2")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_2")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_2")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_2")
end

function shot3()
	local excluded_lights_3 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48"}
	light_set_lights(excluded_lights_3, 16, false)

	local included_lights_3 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentBB Omni44", "PentSpot71", "CS Warren Omni49"}
	light_set_lights(included_lights_3, 7, true)

	teleport_to_slate_pos("CS_king", 9.545, 0.0, -10.027, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_3")
	teleport_to_slate_pos("CS_warren", 7.394, 0.0, -9.691, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_3")
	teleport_to_slate_pos("CS_tanya", -2.723, 0.0, 2.729, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_3")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_3")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_3")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_3")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_3")
end

function shot4()
	local excluded_lights_4 = {"CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_4, 19, false)

	local included_lights_4 = {"CS_PentSpot02", "CS_Omni44", "PentBB Omni44", "PentSpot71"}
	light_set_lights(included_lights_4, 4, true)

	teleport_to_slate_pos("CS_king", 9.547, 0.0, -10.028, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_4")
	teleport_to_slate_pos("CS_warren", 7.395, 0.0, -9.69, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_4")
	teleport_to_slate_pos("CS_tanya", -2.72, 0.0, 2.738, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_4")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_4")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_4")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_4")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_4")
end

function shot5()
	local excluded_lights_5 = {"CS_Omni44", "CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_5, 17, false)

	local included_lights_5 = {"CS_PentSpot02", "PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_5, 6, true)

	teleport_to_slate_pos("CS_king", 9.543, 0.0, -10.028, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_5")
	teleport_to_slate_pos("CS_warren", 7.402, 0.0, -9.698, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_5")
	teleport_to_slate_pos("CS_tanya", -2.714, 0.0, 2.746, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_5")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_5")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_5")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_5")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_5")
end

function shot6()
	local excluded_lights_6 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_6, 17, false)

	local included_lights_6 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentBB Omni44", "PentSpot71"}
	light_set_lights(included_lights_6, 6, true)

	teleport_to_slate_pos("CS_king", 9.542, 0.0, -10.026, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_6")
	teleport_to_slate_pos("CS_warren", 7.324, 0.0, -9.737, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_6")
	teleport_to_slate_pos("CS_tanya", -2.717, 0.0, 2.752, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_6")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_6")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_6")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_6")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_6")
end

function shot7()
	local excluded_lights_7 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_7, 18, false)

	local included_lights_7 = {"PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_7, 5, true)

	teleport_to_slate_pos("CS_king", 9.542, 0.0, -10.009, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_7")
	teleport_to_slate_pos("CS_warren", 7.312, 0.0, -9.736, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_7")
	teleport_to_slate_pos("CS_tanya", -2.721, 0.0, 2.754, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_7")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_7")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_7")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_7")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_7")
end

function shot8()
	local excluded_lights_8 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_8, 17, false)

	local included_lights_8 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentBB Omni44", "PentSpot71"}
	light_set_lights(included_lights_8, 6, true)

	teleport_to_slate_pos("CS_king", 9.549, 0.0, -10.016, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_8")
	teleport_to_slate_pos("CS_warren", 7.312, 0.0, -9.736, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_8")
	teleport_to_slate_pos("CS_tanya", -2.716, 0.0, 2.767, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_8")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_8")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_8")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_8")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_8")
end

function shot9()
	local excluded_lights_9 = {"CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_9, 16, false)

	local included_lights_9 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "CS_Omni46", "PentSpot02", "PentBB Omni25", "PentSpot71"}
	light_set_lights(included_lights_9, 7, true)

	teleport_to_slate_pos("CS_king", 9.551, 0.0, -10.017, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_9")
	teleport_to_slate_pos("CS_warren", 7.311, 0.0, -9.735, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_9")
	teleport_to_slate_pos("CS_tanya", -2.726, 0.0, 2.747, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_9")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_9")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_9")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_9")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_9")
end

function shot10()
	local excluded_lights_10 = {"CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentBB Omni44", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_10, 15, false)

	local included_lights_10 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "CS_Omni46", "PentSpot02", "PentSpot50", "PentBB Omni25", "PentSpot71"}
	light_set_lights(included_lights_10, 8, true)

	teleport_to_slate_pos("CS_king", 9.548, 0.0, -10.01, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_10")
	teleport_to_slate_pos("CS_warren", 7.31, 0.0, -9.735, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_10")
	teleport_to_slate_pos("CS_tanya", -2.725, 0.0, 2.751, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_10")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_10")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_10")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_10")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_10")
end

function shot11()
	local excluded_lights_11 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_11, 17, false)

	local included_lights_11 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentBB Omni44", "PentSpot71"}
	light_set_lights(included_lights_11, 6, true)

	teleport_to_slate_pos("CS_king", 9.534, 0.0, -10.032, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_11")
	teleport_to_slate_pos("CS_warren", 7.31, 0.0, -9.736, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_11")
	teleport_to_slate_pos("CS_tanya", -2.723, 0.0, 2.751, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_11")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_11")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_11")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_11")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_11")
end

function shot12()
	local excluded_lights_12 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_12, 14, false)

	local included_lights_12 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_12, 9, true)

	teleport_to_slate_pos("CS_king", 9.535, 0.0, -10.027, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_12")
	teleport_to_slate_pos("CS_warren", 7.311, 0.0, -9.736, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_12")
	teleport_to_slate_pos("CS_tanya", -2.722, 0.0, 2.754, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_12")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_12")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_12")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_12")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_12")
end

function shot13()
	local excluded_lights_13 = {"CS_Omni46", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentSpot50", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_13, 15, false)

	local included_lights_13 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "CS_king", "PentSpot02", "PentBB Omni44", "PentBB Omni25", "PentSpot71"}
	light_set_lights(included_lights_13, 8, true)

	teleport_to_slate_pos("CS_king", 9.535, 0.0, -10.03, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_13")
	teleport_to_slate_pos("CS_warren", 7.591, 0.0, -9.805, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_13")
	teleport_to_slate_pos("CS_tanya", -2.725, 0.0, 2.76, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_13")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_13")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_13")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_13")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_13")
end

function shot14()
	local excluded_lights_14 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_14, 14, false)

	local included_lights_14 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(included_lights_14, 9, true)

	teleport_to_slate_pos("CS_king", 9.542, 0.0, -10.011, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_14")
	teleport_to_slate_pos("CS_warren", 7.598, 0.0, -9.701, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_14")
	teleport_to_slate_pos("CS_tanya", -2.725, 0.0, 2.753, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_14")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_14")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_14")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_14")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_14")
end

function shot15()
	local excluded_lights_15 = {"CS_Omni44", "CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_15, 18, false)

	local included_lights_15 = {"CS_PentSpot02", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_15, 5, true)

	teleport_to_slate_pos("CS_king", 9.541, 0.0, -10.01, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_15")
	teleport_to_slate_pos("CS_warren", 7.602, 0.0, -9.748, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_15")
	teleport_to_slate_pos("CS_tanya", -2.627, 0.0, 2.673, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_15")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_15")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_15")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_15")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_15")
end

function shot16()
	local excluded_lights_16 = {"CS_Omni44", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentSpot50", "PentBB Omni25", "PentSpot51", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_16, 18, false)

	local included_lights_16 = {"CS_PentSpot02", "CS_Omni45", "PentBB Omni44", "PentSpot71", "CS Tanya Omni47"}
	light_set_lights(included_lights_16, 5, true)

	teleport_to_slate_pos("CS_king", 9.541, 0.0, -10.012, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_16")
	teleport_to_slate_pos("CS_warren", 7.601, 0.0, -9.747, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_16")
	teleport_to_slate_pos("CS_tanya", -0.957, 0.0, 1.942, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_16")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_16")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_16")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_16")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_16")
end

function shot17()
	local excluded_lights_17 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentBB Omni44", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_17, 12, false)

	local included_lights_17 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentSpot50", "PentBB Omni25", "PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_17, 11, true)

	teleport_to_slate_pos("CS_king", 9.562, 0.0, -10.026, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_17")
	teleport_to_slate_pos("CS_warren", 7.414, 0.0, -9.71, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_17")
	teleport_to_slate_pos("CS_tanya", 10.565, 0.0, -7.769, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_17")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_17")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_17")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_17")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_17")
end

function shot18()
	local excluded_lights_18 = {"CS_Omni46", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentSpot50", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_18, 16, false)

	local included_lights_18 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "CS_king", "PentBB Omni44", "PentBB Omni25", "PentSpot71"}
	light_set_lights(included_lights_18, 7, true)

	teleport_to_slate_pos("CS_king", 9.58, 0.0, -10.067, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_18")
	teleport_to_slate_pos("CS_warren", 7.321, 0.0, -9.75, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_18")
	teleport_to_slate_pos("CS_tanya", 10.544, 0.0, -8.734, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_18")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_18")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_18")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_18")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_18")
end

function shot19()
	local excluded_lights_19 = {"CS_Omni44", "CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_19, 16, false)

	local included_lights_19 = {"CS_PentSpot02", "PentSpot02", "PentSpot51", "PentSpot71", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_19, 7, true)

	teleport_to_slate_pos("CS_king", 9.495, 0.0, -9.946, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_19")
	teleport_to_slate_pos("CS_warren", 7.347, 0.0, -9.749, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_19")
	teleport_to_slate_pos("CS_tanya", 10.551, 0.0, -8.729, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_19")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_19")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_19")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_19")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_19")
end

function shot20()
	local excluded_lights_20 = {"CS_Omni45", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot02", "PentSpot03", "PentSpot50", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_20, 16, false)

	local included_lights_20 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni46", "CS_king", "PentBB Omni44", "PentBB Omni25", "PentSpot71"}
	light_set_lights(included_lights_20, 7, true)

	teleport_to_slate_pos("CS_king", 9.435, 0.0, -9.946, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_20")
	teleport_to_slate_pos("CS_warren", 7.331, 0.0, -9.749, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_20")
	teleport_to_slate_pos("CS_tanya", 10.548, 0.0, -8.733, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_20")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_20")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_20")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_20")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_20")
end

function shot21()
	local excluded_lights_21 = {"CS_Omni44", "CS_Omni45", "CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentBB Omni44", "PentSpot50", "PentBB Omni25", "PentSpot71", "CS Tanya Omni47", "CS Tanya Omni48"}
	light_set_lights(excluded_lights_21, 17, false)

	local included_lights_21 = {"CS_PentSpot02", "PentSpot02", "PentSpot51", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(included_lights_21, 6, true)

	teleport_to_slate_pos("CS_king", 9.421, 0.0, -9.936, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_21")
	teleport_to_slate_pos("CS_warren", 7.291, 0.0, -9.736, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_21")
	teleport_to_slate_pos("CS_tanya", 10.547, 0.0, -8.731, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_21")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_21")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_21")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_21")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_21")
end

function shot22()
	local excluded_lights_22 = {"CS_Omni46", "CS_king", "PentSpot05", "PentSpot04", "PentSpot70", "PentSpot34", "PentSpot35", "PentSpot01", "PentSpot03", "PentSpot50", "PentSpot51", "CS Tanya Omni47", "CS Tanya Omni48", "CS Warren Omni47", "CS Warren Omni48", "CS Warren Omni49"}
	light_set_lights(excluded_lights_22, 16, false)

	local included_lights_22 = {"CS_PentSpot02", "CS_Omni44", "CS_Omni45", "PentSpot02", "PentBB Omni44", "PentBB Omni25", "PentSpot71"}
	light_set_lights(included_lights_22, 7, true)

	teleport_to_slate_pos("CS_king", 9.422, 0.0, -9.936, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk03b_scene01_king_22")
	teleport_to_slate_pos("CS_warren", 7.284, 0.0, -9.751, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk03b_scene01_warren_22")
	teleport_to_slate_pos("CS_tanya", 10.533, 0.0, -8.729, "slate_vkboardroom")
	play_custom_action_do("CS_tanya", "vk03b_scene01_tanya_22")
	teleport_to_slate_pos("CS_chair01", 9.547, 0.0, -10.037, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk03b_scene01_chair01_22")
	teleport_to_slate_pos("CS_chair02", 7.394, 0.0, -9.696, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk03b_scene01_chair02_22")
	teleport_to_slate_pos("CS_chair03", 10.614, 0.0, -9.028, "slate_vkboardroom")
	play_custom_action_do("CS_chair03", "vk03b_scene01_chair03_22")
	teleport_to_slate_pos("CS_anthony", 10.658, 0.0, -9.054, "slate_vkboardroom")
	play_custom_action_do("CS_anthony", "vk03b_scene01_anthony_22")
	delay(15.9)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	character_show("#PLAYER#")
	time_of_day_character_shadows_enable(true)
end

function cutscene_end()
	character_show("#PLAYER#")
	stop_custom_actions("CS_king")
	stop_custom_actions("CS_warren")
	stop_custom_actions("CS_tanya")
	stop_custom_actions("CS_chair01")
	stop_custom_actions("CS_chair02")
	stop_custom_actions("CS_chair03")
	stop_custom_actions("CS_anthony")
	letterbox_fade_out(true)
	fade_out(0.5)
	time_of_day_character_shadows_enable(true)
end