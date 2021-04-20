function sspawn_suicide()
	delay(2.0)
	play_action("suicide", "jump run start") 
	npc_jump_forward_fake("suicide")
	npc_kill("suicide")
	
end

function sspawn_dead_body()
	npc_kill("sspawn_corpse")
end

function sspawn_beatdown()
	npc_ragdoll("sspawn_beatdown_victim", -1)
	attack("sspawn_beatdown_attack1", "sspawn_beatdown_victim", false) 
	attack("sspawn_beatdown_attack2", "sspawn_beatdown_victim", false) 
end

function sspawn_drunk_vomit()
	delay(1.5)
	play_action("sspawn_drunk", "stand vomit") 
-- is foley linked to animation?
--	audio_play_for_character(audio_name, human_name, type_name, for_cutscene, blocking) 

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