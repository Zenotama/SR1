-------------------------------------
-- Generated by "One Button Export"
-- Cutscene:D:\projects\blingbling\data\cutscenes\vk07_scene01\vk07_scene01.cts
-- Level:D:\projects\blingbling\data\levels\SaintsRow\sr_chunk02__interiors.cts
-------------------------------------


function cutscene_main()
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
	set_level_lights(false)
	fade_in(0.5)
	letterbox_fade_in(true)
	teleport_to_slate_pos("#PLAYER#", -3.4758, 0.0, -2.40864, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk07_scene01_player_1")
	teleport_to_slate_pos("CS_pad", -3.5149, 0.0, -2.74211, "slate_church_johnnyroom")
	play_custom_action_do("CS_pad", "vk07_scene01_pad_1")
end

function shot2()
	teleport_to_slate_pos("#PLAYER#", -3.46467, 0.0, -2.43024, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk07_scene01_player_2")
	teleport_to_slate_pos("CS_pad", -3.39613, 0.0, -2.73419, "slate_church_johnnyroom")
	play_custom_action_do("CS_pad", "vk07_scene01_pad_2")
end

function shot3()
	teleport_to_slate_pos("#PLAYER#", -3.46627, 0.0, -2.43195, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk07_scene01_player_3")
	teleport_to_slate_pos("CS_julius", -5.80432, 0.0, 3.28183, "slate_church_johnnyroom")
	play_custom_action_do("CS_julius", "vk07_scene01_julius_3")
	teleport_to_slate_pos("CS_pad", -3.40932, 0.0, -2.76061, "slate_church_johnnyroom")
	play_custom_action_do("CS_pad", "vk07_scene01_pad_3")
end

function shot4()
	teleport_to_slate_pos("#PLAYER#", -3.63818, 0.0, -2.4209, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk07_scene01_player_4")
	teleport_to_slate_pos("CS_julius", -2.72209, 0.0, 1.7936, "slate_church_johnnyroom")
	play_custom_action_do("CS_julius", "vk07_scene01_julius_4")
	teleport_to_slate_pos("CS_pad", -3.98019, 0.0, -2.08117, "slate_church_johnnyroom")
	play_custom_action_do("CS_pad", "vk07_scene01_pad_4")
end

function shot5()
	teleport_to_slate_pos("#PLAYER#", -3.63818, 0.0, -2.4209, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk07_scene01_player_5")
	teleport_to_slate_pos("CS_julius", -2.97889, 0.0, 1.66247, "slate_church_johnnyroom")
	play_custom_action_do("CS_julius", "vk07_scene01_julius_5")
end

function shot6()
	teleport_to_slate_pos("CS_king", 14.0935, 0.0, -17.598, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_6")
	teleport_to_slate_pos("CS_killa01", 5.45159, 0.0, -19.8073, "slate_vkboardroom")
	play_custom_action_do("CS_killa01", "vk07_scene01_killa01_6")
	teleport_to_slate_pos("CS_thug01", 11.2897, 0.0, -20.3912, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_6")
	teleport_to_slate_pos("CS_thugt01", 7.58312, 0.0, -20.6388, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_6")
	teleport_to_slate_pos("CS_thugk01", 0.593096, 0.0, -16.1442, "slate_vkboardroom")
	play_custom_action_do("CS_thugk01", "vk07_scene01_thugk01_6")
	teleport_to_slate_pos("CS_killa201", 12.4552, 0.0, -12.763, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_6")
	teleport_to_slate_pos("CS_thug201", 10.8067, 0.0, -12.0355, "slate_vkboardroom")
	play_custom_action_do("CS_thug201", "vk07_scene01_thug201_6")
	teleport_to_slate_pos("CS_thug301", 8.73866, 0.0, -12.3395, "slate_vkboardroom")
	play_custom_action_do("CS_thug301", "vk07_scene01_thug301_6")
	teleport_to_slate_pos("CS_thug401", 4.57795, 0.0, -12.9335, "slate_vkboardroom")
	play_custom_action_do("CS_thug401", "vk07_scene01_thug401_6")
	teleport_to_slate_pos("CS_bat", 11.51, 0.0, -20.2244, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_6")
	teleport_to_slate_pos("CS_chair01", 9.68258, 0.0, -17.4374, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_6")
	teleport_to_slate_pos("CS_chair02", 8.63021, 0.0, -17.5486, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_6")
end

function shot7()
	teleport_to_slate_pos("CS_king", 14.6623, 0.0, -17.6014, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_7")
	teleport_to_slate_pos("CS_killa01", 6.80871, 0.0, -19.6769, "slate_vkboardroom")
	play_custom_action_do("CS_killa01", "vk07_scene01_killa01_7")
	teleport_to_slate_pos("CS_thug01", 12.105, 0.0, -19.6871, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_7")
	teleport_to_slate_pos("CS_thugt01", 8.42682, 0.0, -20.1149, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_7")
	teleport_to_slate_pos("CS_thugk01", 0.970363, 0.0, -14.8635, "slate_vkboardroom")
	play_custom_action_do("CS_thugk01", "vk07_scene01_thugk01_7")
	teleport_to_slate_pos("CS_killa201", 13.319, 0.0, -13.1873, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_7")
	teleport_to_slate_pos("CS_thug201", 11.9513, 0.0, -12.5757, "slate_vkboardroom")
	play_custom_action_do("CS_thug201", "vk07_scene01_thug201_7")
	teleport_to_slate_pos("CS_thug301", 9.64348, 0.0, -12.7267, "slate_vkboardroom")
	play_custom_action_do("CS_thug301", "vk07_scene01_thug301_7")
	teleport_to_slate_pos("CS_thug401", 5.77748, 0.0, -12.9705, "slate_vkboardroom")
	play_custom_action_do("CS_thug401", "vk07_scene01_thug401_7")
	teleport_to_slate_pos("CS_bat", 12.3098, 0.0, -19.5547, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_7")
	teleport_to_slate_pos("CS_chair01", 9.93253, 0.0, -17.4212, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_7")
	teleport_to_slate_pos("CS_chair02", 8.63021, 0.0, -17.5486, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_7")
	teleport_to_slate_pos("CS_doorL", -3.59494, 0.0, -19.2841, "slate_vkboardroom")
	play_custom_action_do("CS_doorL", "vk07_scene01_doorL_7")
	teleport_to_slate_pos("CS_doorR", -3.59853, 0.0, -17.8782, "slate_vkboardroom")
	play_custom_action_do("CS_doorR", "vk07_scene01_doorR_7")
end

function shot8()
	teleport_to_slate_pos("CS_king", 15.205, 0.0, -17.7112, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_8")
end

function shot9()
	teleport_to_slate_pos("CS_king", 14.934, 0.0, -17.4431, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_9")
	teleport_to_slate_pos("CS_thug01", 11.8337, 0.0, -20.0595, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_9")
	teleport_to_slate_pos("CS_bat", 11.8228, 0.0, -19.8068, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_9")
	teleport_to_slate_pos("CS_chair01", 10.3015, 0.0, -17.3948, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_9")
end

function shot10()
	teleport_to_slate_pos("CS_king", 12.7035, 0.0, -16.7248, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_10")
	teleport_to_slate_pos("CS_thug01", 11.6982, 0.0, -17.5205, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_10")
	teleport_to_slate_pos("CS_bat", 11.8453, 0.0, -17.1444, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_10")
	teleport_to_slate_pos("CS_chair01", 10.3954, 0.0, -17.3874, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_10")
end

function shot11()
	teleport_to_slate_pos("CS_king", 12.574, 0.0, -16.6813, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_11")
	teleport_to_slate_pos("CS_thug01", 11.81, 0.0, -17.4542, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_11")
	teleport_to_slate_pos("CS_killa201", 14.2147, 0.0, -14.9225, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_11")
	teleport_to_slate_pos("CS_bat", 12.041, 0.0, -16.6922, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_11")
	teleport_to_slate_pos("CS_chair01", 10.4526, 0.0, -17.3828, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_11")
	teleport_to_slate_pos("CS_chair02", 8.63021, 0.0, -17.5486, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_11")
end

function shot12()
	teleport_to_slate_pos("CS_king", 11.0543, 0.0, -16.3132, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_12")
	teleport_to_slate_pos("CS_thug01", 11.8675, 0.0, -17.5885, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_12")
	teleport_to_slate_pos("CS_thugt01", 8.67636, 0.0, -17.202, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_12")
	teleport_to_slate_pos("CS_killa201", 14.0028, 0.0, -15.1285, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_12")
	teleport_to_slate_pos("CS_bat", 10.5599, 0.0, -16.2953, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_12")
	teleport_to_slate_pos("CS_chair01", 10.4926, 0.0, -17.3795, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_12")
	teleport_to_slate_pos("CS_chair02", 8.63021, 0.0, -17.5486, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_12")
end

function shot13()
	teleport_to_slate_pos("CS_king", 9.61796, 0.0, -16.3908, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_13")
	teleport_to_slate_pos("CS_thug01", 11.6163, 0.0, -18.3939, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_13")
	teleport_to_slate_pos("CS_thugt01", 9.44151, 0.0, -17.7364, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_13")
	teleport_to_slate_pos("CS_killa201", 14.0033, 0.0, -15.1277, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_13")
	teleport_to_slate_pos("CS_thug401", 4.73377, 0.0, -13.0358, "slate_vkboardroom")
	play_custom_action_do("CS_thug401", "vk07_scene01_thug401_13")
	teleport_to_slate_pos("CS_bat", 9.8129, 0.0, -16.3961, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_13")
	teleport_to_slate_pos("CS_chair01", 10.5193, 0.0, -17.3772, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_13")
	teleport_to_slate_pos("CS_chair02", 8.63021, 0.0, -17.5486, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_13")
end

function shot14()
	teleport_to_slate_pos("CS_king", 8.5815, 0.0, -16.1628, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_14")
	teleport_to_slate_pos("CS_killa01", 7.3262, 0.0, -18.3132, "slate_vkboardroom")
	play_custom_action_do("CS_killa01", "vk07_scene01_killa01_14")
	teleport_to_slate_pos("CS_killa201", 13.9289, 0.0, -15.134, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_14")
	teleport_to_slate_pos("CS_thug201", 12.1228, 0.0, -13.806, "slate_vkboardroom")
	play_custom_action_do("CS_thug201", "vk07_scene01_thug201_14")
	teleport_to_slate_pos("CS_thug301", 10.4351, 0.0, -13.7557, "slate_vkboardroom")
	play_custom_action_do("CS_thug301", "vk07_scene01_thug301_14")
	teleport_to_slate_pos("CS_thug401", 4.66508, 0.0, -13.0507, "slate_vkboardroom")
	play_custom_action_do("CS_thug401", "vk07_scene01_thug401_14")
	teleport_to_slate_pos("CS_bat", 8.91382, 0.0, -16.2641, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_14")
	teleport_to_slate_pos("CS_chair01", 11.3658, 0.0, -17.9249, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_14")
	teleport_to_slate_pos("CS_chair02", 8.52052, 0.0, -18.6009, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_14")
end

function shot15()
	teleport_to_slate_pos("CS_king", 7.04779, 0.0, -15.8688, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_15")
	teleport_to_slate_pos("CS_killa01", 7.59781, 0.0, -18.3942, "slate_vkboardroom")
	play_custom_action_do("CS_killa01", "vk07_scene01_killa01_15")
	teleport_to_slate_pos("CS_thug01", 11.6227, 0.0, -18.4158, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_15")
	teleport_to_slate_pos("CS_thugt01", 9.34377, 0.0, -18.8384, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_15")
	teleport_to_slate_pos("CS_killa201", 13.8529, 0.0, -15.0436, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_15")
	teleport_to_slate_pos("CS_thug201", 12.0681, 0.0, -13.7485, "slate_vkboardroom")
	play_custom_action_do("CS_thug201", "vk07_scene01_thug201_15")
	teleport_to_slate_pos("CS_thug301", 10.3496, 0.0, -13.6574, "slate_vkboardroom")
	play_custom_action_do("CS_thug301", "vk07_scene01_thug301_15")
	teleport_to_slate_pos("CS_thug401", 5.25353, 0.0, -13.5348, "slate_vkboardroom")
	play_custom_action_do("CS_thug401", "vk07_scene01_thug401_15")
	teleport_to_slate_pos("CS_bat", 6.85564, 0.0, -15.3329, "slate_vkboardroom")
	play_custom_action_do("CS_bat", "vk07_scene01_bat_15")
	teleport_to_slate_pos("CS_chair01", 11.3732, 0.0, -17.9292, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_15")
end

function shot16()
	teleport_to_slate_pos("CS_king", 4.68919, 0.0, -15.4612, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_16")
	teleport_to_slate_pos("CS_killa01", 7.90974, 0.0, -19.0662, "slate_vkboardroom")
	play_custom_action_do("CS_killa01", "vk07_scene01_killa01_16")
	teleport_to_slate_pos("CS_thug01", 11.6319, 0.0, -18.4227, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_16")
	teleport_to_slate_pos("CS_thugt01", 9.34653, 0.0, -18.8358, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_16")
	teleport_to_slate_pos("CS_thugk01", -0.88867, 0.0, -15.8389, "slate_vkboardroom")
	play_custom_action_do("CS_thugk01", "vk07_scene01_thugk01_16")
	teleport_to_slate_pos("CS_killa201", 13.8849, 0.0, -15.0998, "slate_vkboardroom")
	play_custom_action_do("CS_killa201", "vk07_scene01_killa201_16")
	teleport_to_slate_pos("CS_chair01", 11.3732, 0.0, -17.9292, "slate_vkboardroom")
	play_custom_action_do("CS_chair01", "vk07_scene01_chair01_16")
	teleport_to_slate_pos("CS_chair02", 8.56196, 0.0, -18.7437, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_16")
end

function shot17()
	teleport_to_slate_pos("CS_warren", 16.3564, 0.0, -26.4128, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk07_scene01_warren_17")
end

function shot18()
	teleport_to_slate_pos("CS_king", -2.48799, 0.0, -18.5911, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_18")
	teleport_to_slate_pos("CS_warren", 12.3085, 0.0, -24.029, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk07_scene01_warren_18")
	teleport_to_slate_pos("CS_thugk01", 0.187921, 0.0, -15.5224, "slate_vkboardroom")
	play_custom_action_do("CS_thugk01", "vk07_scene01_thugk01_18")
	teleport_to_slate_pos("CS_doorL", -3.59494, 0.0, -19.2841, "slate_vkboardroom")
	play_custom_action_do("CS_doorL", "vk07_scene01_doorL_18")
	teleport_to_slate_pos("CS_doorR", -3.30476, 0.0, -17.8299, "slate_vkboardroom")
	play_custom_action_do("CS_doorR", "vk07_scene01_doorR_18")
end

function shot19()
	teleport_to_slate_pos("CS_king", -2.81244, 0.0, -18.5339, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_19")
	teleport_to_slate_pos("CS_warren", 12.388, 0.0, -24.2239, "slate_vkboardroom")
	play_custom_action_do("CS_warren", "vk07_scene01_warren_19")
	teleport_to_slate_pos("CS_killa01", 7.74537, 0.0, -18.8853, "slate_vkboardroom")
	play_custom_action_do("CS_killa01", "vk07_scene01_killa01_19")
	teleport_to_slate_pos("CS_thug01", 11.6347, 0.0, -18.4134, "slate_vkboardroom")
	play_custom_action_do("CS_thug01", "vk07_scene01_thug01_19")
	teleport_to_slate_pos("CS_thugt01", 9.34653, 0.0, -18.8358, "slate_vkboardroom")
	play_custom_action_do("CS_thugt01", "vk07_scene01_thugt01_19")
	teleport_to_slate_pos("CS_chair02", 8.56196, 0.0, -18.7437, "slate_vkboardroom")
	play_custom_action_do("CS_chair02", "vk07_scene01_chair02_19")
	teleport_to_slate_pos("CS_doorL", -3.59494, 0.0, -19.2841, "slate_vkboardroom")
	play_custom_action_do("CS_doorL", "vk07_scene01_doorL_19")
	teleport_to_slate_pos("CS_doorR", -3.04209, 0.0, -17.6465, "slate_vkboardroom")
	play_custom_action_do("CS_doorR", "vk07_scene01_doorR_19")
end

function shot20()
	teleport_to_slate_pos("CS_king", -3.92854, 0.0, -18.0147, "slate_vkboardroom")
	play_custom_action_do("CS_king", "vk07_scene01_king_20")
	teleport_to_slate_pos("CS_doorL", -3.59494, 0.0, -19.2841, "slate_vkboardroom")
	play_custom_action_do("CS_doorL", "vk07_scene01_doorL_20")
	teleport_to_slate_pos("CS_doorR", -3.04209, 0.0, -17.6465, "slate_vkboardroom")
	play_custom_action_do("CS_doorR", "vk07_scene01_doorR_20")
end

function shot21()
	teleport_to_slate_pos("#PLAYER#", -3.63818, 0.0, -2.4209, "slate_church_johnnyroom")
	play_custom_action_do("#PLAYER#", "vk07_scene01_player_21")
	teleport_to_slate_pos("CS_julius", -3.03627, 0.0, 1.70391, "slate_church_johnnyroom")
	play_custom_action_do("CS_julius", "vk07_scene01_julius_21")
end

function shot22()
	teleport_to_slate_pos("CS_julius", -2.91097, 0.0, 1.68476, "slate_church_johnnyroom")
	play_custom_action_do("CS_julius", "vk07_scene01_julius_22")
	delay(0.2)
	fade_out(0.5)
end

function cutscene_abort()
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end

function cutscene_end()
	stop_custom_actions("CS_king")
	stop_custom_actions("CS_warren")
	stop_custom_actions("CS_killa01")
	stop_custom_actions("CS_thug01")
	stop_custom_actions("CS_thugt01")
	stop_custom_actions("CS_thugk01")
	stop_custom_actions("CS_killa201")
	stop_custom_actions("CS_thug201")
	stop_custom_actions("CS_thug301")
	stop_custom_actions("CS_thug401")
	stop_custom_actions("#PLAYER#")
	stop_custom_actions("CS_bat")
	stop_custom_actions("CS_julius")
	stop_custom_actions("CS_chair01")
	stop_custom_actions("CS_chair02")
	stop_custom_actions("CS_pad")
	stop_custom_actions("CS_doorL")
	stop_custom_actions("CS_doorR")
	letterbox_fade_out(true)
	fade_out(0.5)
	set_level_lights(true)
end
