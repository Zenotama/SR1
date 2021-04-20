-- vkx.lua
-- script for VK Mission X
-- created 2/9/05



-- GLOBAL VARIABLES ---------------------
Vkx_defended_stronghold = false;
Vkx_in_territory = false;
vkx_audio = -1

-- FUNCTIONS ----------------------------
Vkx_won = false

function vkx_cleanup()
	mission_debug("vkx cleanup")

	pushback_reset()
	if (vkx_audio ~= -1) then
		audio_stop(vkx_audio)
	end
	
	persona_override_remove_all("BM_VK1")
	persona_override_remove_all("BM_VK2")
	persona_override_remove_all("BM_VK3")
	persona_override_remove_all("WM_VK1")
	persona_override_remove_all("WM_VK2")
	persona_override_remove_all("WM_VK3")
	persona_override_remove_all("BF_VK1")
	persona_override_remove_all("BF_VK2")
	persona_override_remove_all("BF_VK3")
	persona_override_remove_all("WF_VK1")
	persona_override_remove_all("WF_VK2")
	persona_override_remove_all("WF_VK3")
	
	persona_override_remove_all("BM_3SS1")
	persona_override_remove_all("BM_3SS2")
	persona_override_remove_all("BM_3SS3")
	persona_override_remove_all("WM_3SS1")
	persona_override_remove_all("WM_3SS2")
	persona_override_remove_all("WM_3SS3")
	persona_override_remove_all("AM_3SS1")
	persona_override_remove_all("AM_3SS2")
	persona_override_remove_all("AM_3SS3")
	persona_override_remove_all("HM_3SS1")
	persona_override_remove_all("HM_3SS2")
	persona_override_remove_all("HM_3SS3")
	
	persona_override_remove_all("BF_3SS1")
	persona_override_remove_all("BF_3SS2")
	persona_override_remove_all("BF_3SS3")
	persona_override_remove_all("WF_3SS1")
	persona_override_remove_all("WF_3SS2")
	persona_override_remove_all("WF_3SS3")
	
	persona_override_remove_all("AF_3SS1")
	persona_override_remove_all("AF_3SS2")
	persona_override_remove_all("AF_3SS3")
	persona_override_remove_all("HF_3SS1")
	persona_override_remove_all("HF_3SS2")
	persona_override_remove_all("HF_3SS3")
	
	
	--minimap_icon_remove_navpoint("redlight_$t_pb2_1") 
	notoriety_reset("police")
end

function vkx_success()
	-- Unlock the Downtown Parking stronghold.
	mission_unlock("downtown_sh_parking")
	
	cellphone_remove( "" )
end

function vkx_start()
	Vkx_won = false
	set_mission_author("Sandeep Shekar")
	--set_mission_author("Russell Aasland")
	--set_mission_author("David Cobb")
	mission_debug("vkx start")
	
	if (fade_get_percent() >= 1) then
		teleport("#PLAYER#", "vkx_$n_restart")
	end
	
	fade_in(0.5)
	
	tutorial_suspend(true)
	vkx_audio = audio_play("GAT_VKX_PHONE1_1", "voice", false, true)
	vkx_audio = -1
	tutorial_suspend(false)
	
	mission_help_table("vkx_defend_brothel")
	notoriety_set_min("police", 1);
	
	Vkx_in_territory = false;
	--minimap_icon_add_navpoint("redlight_$t_pb2_1", MINIMAP_ICON_LOCATION)

	pushback_start("vk_redlight03", true)
	
	persona_override_persona_start("BM_VK1", "threat - alert (solo attack)", "BMVK1_VKX_ATTACK") 
	persona_override_persona_start("BM_VK1", "threat - alert (group attack)", "BMVK1_VKX_ATTACK") 
	persona_override_persona_start("BM_VK2", "threat - alert (solo attack)", "BMVK2_VKX_ATTACK") 
	persona_override_persona_start("BM_VK2", "threat - alert (group attack)", "BMVK2_VKX_ATTACK") 
	persona_override_persona_start("BM_VK3", "threat - alert (solo attack)", "BMVK3_VKX_ATTACK") 
	persona_override_persona_start("BM_VK3", "threat - alert (group attack)", "BMVK3_VKX_ATTACK") 
	persona_override_persona_start("WM_VK1", "threat - alert (solo attack)", "WMVK1_VKX_ATTACK") 
	persona_override_persona_start("WM_VK1", "threat - alert (group attack)", "WMVK1_VKX_ATTACK") 
	persona_override_persona_start("WM_VK2", "threat - alert (solo attack)", "WMVK2_VKX_ATTACK") 
	persona_override_persona_start("WM_VK2", "threat - alert (group attack)", "WMVK2_VKX_ATTACK") 
	persona_override_persona_start("WM_VK3", "threat - alert (solo attack)", "WMVK3_VKX_ATTACK") 
	persona_override_persona_start("WM_VK3", "threat - alert (group attack)", "WMVK3_VKX_ATTACK") 
	
	persona_override_persona_start("BF_VK1", "threat - alert (solo attack)", "BFVK1_VKX_ATTACK") 
	persona_override_persona_start("BF_VK1", "threat - alert (group attack)", "BFVK1_VKX_ATTACK") 
	persona_override_persona_start("BF_VK2", "threat - alert (solo attack)", "BFVK2_VKX_ATTACK") 
	persona_override_persona_start("BF_VK2", "threat - alert (group attack)", "BFVK2_VKX_ATTACK") 
	persona_override_persona_start("BF_VK3", "threat - alert (solo attack)", "BFVK3_VKX_ATTACK") 
	persona_override_persona_start("BF_VK3", "threat - alert (group attack)", "BFVK3_VKX_ATTACK") 
	persona_override_persona_start("WF_VK1", "threat - alert (solo attack)", "WFVK1_VKX_ATTACK") 
	persona_override_persona_start("WF_VK1", "threat - alert (group attack)", "WFVK1_VKX_ATTACK") 
	persona_override_persona_start("WF_VK2", "threat - alert (solo attack)", "WFVK2_VKX_ATTACK") 
	persona_override_persona_start("WF_VK2", "threat - alert (group attack)", "WFVK2_VKX_ATTACK") 
	persona_override_persona_start("WF_VK3", "threat - alert (solo attack)", "WFVK3_VKX_ATTACK") 
	persona_override_persona_start("WF_VK3", "threat - alert (group attack)", "WFVK3_VKX_ATTACK") 
	
	persona_override_persona_start("BM_3SS1", "threat - alert (solo attack)", "BM3SS1_VKX_ATTACK") 
	persona_override_persona_start("BM_3SS1", "threat - alert (group attack)", "BM3SS1_VKX_ATTACK") 
	persona_override_persona_start("BM_3SS2", "threat - alert (solo attack)", "BM3SS2_VKX_ATTACK") 
	persona_override_persona_start("BM_3SS2", "threat - alert (group attack)", "BM3SS2_VKX_ATTACK") 
	persona_override_persona_start("BM_3SS3", "threat - alert (solo attack)", "BM3SS3_VKX_ATTACK") 
	persona_override_persona_start("BM_3SS3", "threat - alert (group attack)", "BM3SS3_VKX_ATTACK") 
	persona_override_persona_start("WM_3SS1", "threat - alert (solo attack)", "WM3SS1_VKX_ATTACK") 
	persona_override_persona_start("WM_3SS1", "threat - alert (group attack)", "WM3SS1_VKX_ATTACK") 
	persona_override_persona_start("WM_3SS2", "threat - alert (solo attack)", "WM3SS2_VKX_ATTACK") 
	persona_override_persona_start("WM_3SS2", "threat - alert (group attack)", "WM3SS2_VKX_ATTACK") 
	persona_override_persona_start("WM_3SS3", "threat - alert (solo attack)", "WM3SS3_VKX_ATTACK") 
	persona_override_persona_start("WM_3SS3", "threat - alert (group attack)", "WM3SS3_VKX_ATTACK") 
	
	persona_override_persona_start("AM_3SS1", "threat - alert (solo attack)", "BM3SS1_VKX_ATTACK") 
	persona_override_persona_start("AM_3SS1", "threat - alert (group attack)", "BM3SS1_VKX_ATTACK") 
	persona_override_persona_start("AM_3SS2", "threat - alert (solo attack)", "BM3SS2_VKX_ATTACK") 
	persona_override_persona_start("AM_3SS2", "threat - alert (group attack)", "BM3SS2_VKX_ATTACK") 
	persona_override_persona_start("AM_3SS3", "threat - alert (solo attack)", "BM3SS3_VKX_ATTACK") 
	persona_override_persona_start("AM_3SS3", "threat - alert (group attack)", "BM3SS3_VKX_ATTACK") 
	persona_override_persona_start("HM_3SS1", "threat - alert (solo attack)", "WM3SS1_VKX_ATTACK") 
	persona_override_persona_start("HM_3SS1", "threat - alert (group attack)", "WM3SS1_VKX_ATTACK") 
	persona_override_persona_start("HM_3SS2", "threat - alert (solo attack)", "WM3SS2_VKX_ATTACK") 
	persona_override_persona_start("HM_3SS2", "threat - alert (group attack)", "WM3SS2_VKX_ATTACK") 
	persona_override_persona_start("HM_3SS3", "threat - alert (solo attack)", "WM3SS3_VKX_ATTACK") 
	persona_override_persona_start("HM_3SS3", "threat - alert (group attack)", "WM3SS3_VKX_ATTACK") 
	
	persona_override_persona_start("BF_3SS1", "threat - alert (solo attack)", "BF3SS1_VKX_ATTACK") 
	persona_override_persona_start("BF_3SS1", "threat - alert (group attack)", "BF3SS1_VKX_ATTACK") 
	persona_override_persona_start("BF_3SS2", "threat - alert (solo attack)", "BF3SS2_VKX_ATTACK") 
	persona_override_persona_start("BF_3SS2", "threat - alert (group attack)", "BF3SS2_VKX_ATTACK") 
	persona_override_persona_start("BF_3SS3", "threat - alert (solo attack)", "BF3SS3_VKX_ATTACK") 
	persona_override_persona_start("BF_3SS3", "threat - alert (group attack)", "BF3SS3_VKX_ATTACK") 
	persona_override_persona_start("WF_3SS1", "threat - alert (solo attack)", "WF3SS1_VKX_ATTACK") 
	persona_override_persona_start("WF_3SS1", "threat - alert (group attack)", "WF3SS1_VKX_ATTACK") 
	persona_override_persona_start("WF_3SS2", "threat - alert (solo attack)", "WF3SS2_VKX_ATTACK") 
	persona_override_persona_start("WF_3SS2", "threat - alert (group attack)", "WF3SS2_VKX_ATTACK") 
	persona_override_persona_start("WF_3SS3", "threat - alert (solo attack)", "WF3SS3_VKX_ATTACK") 
	persona_override_persona_start("WF_3SS3", "threat - alert (group attack)", "WF3SS3_VKX_ATTACK") 
	
	persona_override_persona_start("AF_3SS1", "threat - alert (solo attack)", "BM3SS1_VKX_ATTACK") 
	persona_override_persona_start("AF_3SS1", "threat - alert (group attack)", "BM3SS1_VKX_ATTACK") 
	persona_override_persona_start("AF_3SS2", "threat - alert (solo attack)", "BM3SS2_VKX_ATTACK") 
	persona_override_persona_start("AF_3SS2", "threat - alert (group attack)", "BM3SS2_VKX_ATTACK") 
	persona_override_persona_start("AF_3SS3", "threat - alert (solo attack)", "BM3SS3_VKX_ATTACK") 
	persona_override_persona_start("AF_3SS3", "threat - alert (group attack)", "BM3SS3_VKX_ATTACK") 
	persona_override_persona_start("HF_3SS1", "threat - alert (solo attack)", "WM3SS1_VKX_ATTACK") 
	persona_override_persona_start("HF_3SS1", "threat - alert (group attack)", "WM3SS1_VKX_ATTACK") 
	persona_override_persona_start("HF_3SS2", "threat - alert (solo attack)", "WM3SS2_VKX_ATTACK") 
	persona_override_persona_start("HF_3SS2", "threat - alert (group attack)", "WM3SS2_VKX_ATTACK") 
	persona_override_persona_start("HF_3SS3", "threat - alert (solo attack)", "WM3SS3_VKX_ATTACK") 
	persona_override_persona_start("HF_3SS3", "threat - alert (group attack)", "WM3SS3_VKX_ATTACK") 
	
	
	-- arrive hooks
	persona_override_persona_start("BM_3SS1", "combat - congratulate player", "BM3SS1_VKX_ARRIVE") 
	persona_override_persona_start("BM_3SS2", "combat - congratulate player", "BM3SS2_VKX_ARRIVE") 
	persona_override_persona_start("BM_3SS3", "combat - congratulate player", "BM3SS3_VKX_ARRIVE") 
	persona_override_persona_start("WM_3SS1", "combat - congratulate player", "WM3SS1_VKX_ARRIVE") 
	persona_override_persona_start("WM_3SS2", "combat - congratulate player", "WM3SS2_VKX_ARRIVE") 
	persona_override_persona_start("WM_3SS3", "combat - congratulate player", "WM3SS3_VKX_ARRIVE") 
	
	persona_override_persona_start("AM_3SS1", "combat - congratulate player", "BM3SS1_VKX_ARRIVE") 
	persona_override_persona_start("AM_3SS2", "combat - congratulate player", "BM3SS2_VKX_ARRIVE") 
	persona_override_persona_start("AM_3SS3", "combat - congratulate player", "BM3SS3_VKX_ARRIVE") 
	persona_override_persona_start("HM_3SS1", "combat - congratulate player", "WM3SS1_VKX_ARRIVE") 
	persona_override_persona_start("HM_3SS2", "combat - congratulate player", "WM3SS2_VKX_ARRIVE") 
	persona_override_persona_start("HM_3SS3", "combat - congratulate player", "WM3SS3_VKX_ARRIVE") 
	
	persona_override_persona_start("BF_3SS1", "combat - congratulate player", "BF3SS1_VKX_ARRIVE") 
	persona_override_persona_start("BF_3SS2", "combat - congratulate player", "BF3SS2_VKX_ARRIVE") 
	persona_override_persona_start("BF_3SS3", "combat - congratulate player", "BF3SS3_VKX_ARRIVE") 
	persona_override_persona_start("WF_3SS1", "combat - congratulate player", "WF3SS1_VKX_ARRIVE") 
	persona_override_persona_start("WF_3SS2", "combat - congratulate player", "WF3SS2_VKX_ARRIVE") 
	persona_override_persona_start("WF_3SS3", "combat - congratulate player", "WF3SS3_VKX_ARRIVE") 
	
	persona_override_persona_start("AF_3SS1", "combat - congratulate player", "BM3SS1_VKX_ARRIVE") 
	persona_override_persona_start("AF_3SS2", "combat - congratulate player", "BM3SS2_VKX_ARRIVE") 
	persona_override_persona_start("AF_3SS3", "combat - congratulate player", "BM3SS3_VKX_ARRIVE") 
	persona_override_persona_start("HF_3SS1", "combat - congratulate player", "WM3SS1_VKX_ARRIVE") 
	persona_override_persona_start("HF_3SS2", "combat - congratulate player", "WM3SS2_VKX_ARRIVE") 
	persona_override_persona_start("HF_3SS3", "combat - congratulate player", "WM3SS3_VKX_ARRIVE") 
	
	while (is_hood_contested("vk_redlight03")) do
		if ( (not Vkx_in_territory) and (get_current_hood_by_position("#PLAYER#") == "vk_redlight03") ) then
			--minimap_icon_remove_navpoint("redlight_$t_pb2_1")
		elseif ( (Vkx_in_territory) and (get_current_hood_by_position("#PLAYER#") ~= "vk_redlight03") ) then
			--minimap_icon_add_navpoint("redlight_$t_pb2_1", MINIMAP_ICON_LOCATION)
		end
		thread_yield()
	end
	
	audio_play("SYS_CELL_RING", "foley", false)
	delay(0.5)
	audio_play("SYS_CELL_RING", "foley", false)
	delay(0.5)
	vkx_audio = audio_play("GAT_VKX_PHONE1_2", "voice", false, true)
	vkx_audio = -1
	Vkx_won = true
	
	mission_end_success("vkx")
end
