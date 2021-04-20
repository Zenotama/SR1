function human_exists_and_is_ready(name)
	if (npc_exists(name)) then
		if (human_is_ready(name)) then
			return true
		end
	else
		return false
	end
end

function sspawn_suicide()
	if (npc_exists("sspawn_suicide")) then
		npc_disable_rank_reactions("sspawn_suicide")
	end
	delay(2.0)
	if (npc_exists("sspawn_suicide")) then
		play_action("sspawn_suicide", "jump run start") 
		npc_jump_forward_fake("sspawn_suicide")
		npc_kill("sspawn_suicide")
	end
	
end

function sspawn_dead_body()
	if (npc_exists("sspawn_corpse")) then
		npc_kill("sspawn_corpse")
	end
end

function sspawn_beatdown()
	if (npc_exists("sspawn_beatdown_victim") and npc_exists("sspawn_beatdown_attack1") and npc_exists("sspawn_beatdown_attack2")) then
		npc_ragdoll("sspawn_beatdown_victim", -1)
		inv_item_remove_all("sspawn_beatdown_attack1")
		inv_item_remove_all("sspawn_beatdown_attack2")
		attack("sspawn_beatdown_attack1", "sspawn_beatdown_victim", false) 
		attack("sspawn_beatdown_attack2", "sspawn_beatdown_victim", false) 
	end
end

function sspawn_jackhammer()
	local handle = -1
	
	while (human_exists_and_is_ready("sspawn_jackhammer")) do
		handle = audio_play_for_character("SFX_JACKHAMMER_LOOP_1", "sspawn_jackhammer")
		if (handle ~= -1) then
			while (audio_is_playing(handle) and human_exists_and_is_ready("sspawn_jackhammer")) do
				thread_yield()
			end
		else
			npc_begin_sidewalking("sspawn_jackhammer")
			return
		end		
   end

   if (handle ~= -1) then
		audio_stop(handle)
	end

end

function sspawn_drunk_vomit()
	if (npc_exists("sspawn_drunk")) then
		npc_disable_rank_reactions("sspawn_drunk")
	end
	delay(1.5)
	if (npc_exists("sspawn_drunk")) then
		play_action("sspawn_drunk", "stand vomit") 
	end
end

function sspawn_gang_gun()
	inv_item_add("mac10",1, "sspawn_gunholder")
	delay(2.0)
	npc_unholster_best_weapon("sspawn_gunholder")
end


function sspawn_gang_pistol()
	inv_item_add("glock",1, "sspawn_pistolholder")
	delay(2.0)
	npc_unholster_best_weapon("sspawn_pistolholder")
end