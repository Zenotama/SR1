-- Globals
Lives = 4
Deaths = 0
Escapes = 0
Difficulty = 0

-- Handles for spawning threads
Spawn_handles = {}

-- Table of hunter groups
Hunter_members = {}

-- Hunter flag for if they've been spawned
Hunters_spawned = false

-- Table of spawn group members and num alive
Group_members = {}
Group_alive_count = {}

-- Reverse hash for cop-group association
Npc_group_hash = {}

-- Trigger members for each group
Trigger_members = {}

-- List of groups that can be despawned and a count
Groups_to_despawn = {}

-- Prefix for spawn group names
Group_prefix = "mp_coop_gauntlet_$G_"

function mp_coop_gauntlet_init()
	on_trigger("mp_coop_gauntlet_exit", "mp_coop_gauntlet_$t_exit")
	on_death("mp_coop_gauntlet_player_death", "#PLAYER1#")
	on_death("mp_coop_gauntlet_player_death", "#PLAYER2#")
	
	-- Fill out Hunter_members table
	Hunter_members["mp_coop_gauntlet_$G_hunt1"] = {
		"mp_coop_gauntlet_$c_hunt1_1",
		"mp_coop_gauntlet_$c_hunt1_2"
	}
	
	Hunter_members["mp_coop_gauntlet_$G_hunt2"] = {
		"mp_coop_gauntlet_$c_hunt2_1",
		"mp_coop_gauntlet_$c_hunt2_2"
	}
	Hunter_members["mp_coop_gauntlet_$G_hunt3"] = {
		"mp_coop_gauntlet_$c_hunt3_1",
		"mp_coop_gauntlet_$c_hunt3_2"
	}
	
	Hunter_members["mp_coop_gauntlet_$G_hunt4"] = {
		"mp_coop_gauntlet_$c_hunt4_1",
		"mp_coop_gauntlet_$c_hunt4_2"
	}
	
	-- Fill out the Group_members table
	Group_members["mp_coop_gauntlet_$G_1"] = {	
		"mp_coop_gauntlet_$c_g1_1",
		"mp_coop_gauntlet_$c_g1_2",
		"mp_coop_gauntlet_$c_g1_3",
		"mp_coop_gauntlet_$c_g1_4"
	}

	Group_members["mp_coop_gauntlet_$G_2"] = {	
		"mp_coop_gauntlet_$c_g2_1",
		"mp_coop_gauntlet_$c_g2_2",
		"mp_coop_gauntlet_$c_g2_3",
		"mp_coop_gauntlet_$c_g2_4"
	}
														
	Group_members["mp_coop_gauntlet_$G_3"] = {
		"mp_coop_gauntlet_$c_g3_1",
		"mp_coop_gauntlet_$c_g3_2",
		"mp_coop_gauntlet_$c_g3_3",
		"mp_coop_gauntlet_$c_g3_4"
	}
														
	Group_members["mp_coop_gauntlet_$G_4"] = {
		"mp_coop_gauntlet_$c_g4_1",
		"mp_coop_gauntlet_$c_g4_2",
		"mp_coop_gauntlet_$c_g4_3",
		"mp_coop_gauntlet_$c_g4_4"
	}	

	Group_members["mp_coop_gauntlet_$G_5"] = {
		"mp_coop_gauntlet_$c_g5_1",
		"mp_coop_gauntlet_$c_g5_2",
		"mp_coop_gauntlet_$c_g5_3",
		"mp_coop_gauntlet_$c_g5_4"
	}

	Group_members["mp_coop_gauntlet_$G_6"] = {
		"mp_coop_gauntlet_$c_g6_1",
		"mp_coop_gauntlet_$c_g6_2",
		"mp_coop_gauntlet_$c_g6_3",
		"mp_coop_gauntlet_$c_g6_4",
		"mp_coop_gauntlet_$c_g6_5",
		"mp_coop_gauntlet_$c_g6_6"
	}

	Group_members["mp_coop_gauntlet_$G_7"] = {
		"mp_coop_gauntlet_$c_g7_1",
		"mp_coop_gauntlet_$c_g7_2",
		"mp_coop_gauntlet_$c_g7_3",
		"mp_coop_gauntlet_$c_g7_4",
		"mp_coop_gauntlet_$c_g7_5",
		"mp_coop_gauntlet_$c_g7_6"
	}

	Group_members["mp_coop_gauntlet_$G_8"] = {
		"mp_coop_gauntlet_$c_g8_1",
		"mp_coop_gauntlet_$c_g8_2",
		"mp_coop_gauntlet_$c_g8_3",
		"mp_coop_gauntlet_$c_g8_4",
		"mp_coop_gauntlet_$c_g8_5",
		"mp_coop_gauntlet_$c_g8_6",
		"mp_coop_gauntlet_$c_g8_7",
		"mp_coop_gauntlet_$c_g8_8"
	}

	-- Fill out the trigger-group associations
	
	-- No triggers for "mp_coop_gauntlet_$G_1" so we can use the trigger for the hunters instead
	
	Trigger_members["mp_coop_gauntlet_$G_2"] = {
		"mp_coop_gauntlet_$t_g2"
	}
	
	Trigger_members["mp_coop_gauntlet_$G_3"] = {
		"mp_coop_gauntlet_$t_g3"
	}
	
	Trigger_members["mp_coop_gauntlet_$G_4"] = {
		"mp_coop_gauntlet_$t_g4"
	}
	
	Trigger_members["mp_coop_gauntlet_$G_5"] = {
		"mp_coop_gauntlet_$t_g5"
	}
	
	Trigger_members["mp_coop_gauntlet_$G_6"] = {
		"mp_coop_gauntlet_$t_g6"
	}
	
	Trigger_members["mp_coop_gauntlet_$G_7"] = {
		"mp_coop_gauntlet_$t_g7"
	}
	
	Trigger_members["mp_coop_gauntlet_$G_8"] = {
		"mp_coop_gauntlet_$t_g8"
	}
	
	for group, members in pairs(Group_members) do
		for i, m in ipairs(members) do
			-- Assign the death callback
			on_death("npc_death_process", m)
			
			-- Add an entry into the hash
			Npc_group_hash[m] = group
		end
		
		-- Count the number of group members alive to start
		Group_alive_count[group] = sizeof_table(members)
	end
	
	-- Set up group triggers
	on_trigger("mp_coop_gauntlet_spawn_group_1", "mp_coop_gauntlet_$t_g1")
	on_trigger("mp_coop_gauntlet_spawn_group_2", "mp_coop_gauntlet_$t_g2")
	on_trigger("mp_coop_gauntlet_spawn_group_3", "mp_coop_gauntlet_$t_g3")
	on_trigger("mp_coop_gauntlet_spawn_group_4", "mp_coop_gauntlet_$t_g4")
	on_trigger("mp_coop_gauntlet_spawn_group_5", "mp_coop_gauntlet_$t_g5")
	on_trigger("mp_coop_gauntlet_spawn_group_6", "mp_coop_gauntlet_$t_g6")
	on_trigger("mp_coop_gauntlet_spawn_group_7", "mp_coop_gauntlet_$t_g7")
	on_trigger("mp_coop_gauntlet_spawn_group_8", "mp_coop_gauntlet_$t_g8")
	
	coop_on_premature_end("mp_coop_gauntlet_game_lost")
	
	Difficulty = coop_get_difficulty_level()
	
	-- Assign hunter members to always attack the players
	if Difficulty == "Gangster" then
		for i, member in ipairs(Hunter_members["mp_coop_gauntlet_$G_hunt1"]) do
			on_respawn("attack_player1", member)
		end
		coop_create_hunter_group("mp_coop_gauntlet_$G_hunt1", "#PLAYER1#", 30.0)
		
		for i, member in ipairs(Hunter_members["mp_coop_gauntlet_$G_hunt1"]) do
			on_respawn("attack_player2", member)
		end
		coop_create_hunter_group("mp_coop_gauntlet_$G_hunt2", "#PLAYER2#", 30.0)
	else
		for i, member in ipairs(Hunter_members["mp_coop_gauntlet_$G_hunt3"]) do
			on_respawn("attack_player1", member)
		end
		coop_create_hunter_group("mp_coop_gauntlet_$G_hunt3", "#PLAYER1#", 15.0)
		
		for i, member in ipairs(Hunter_members["mp_coop_gauntlet_$G_hunt4"]) do
			on_respawn("attack_player2", member)
		end
		coop_create_hunter_group("mp_coop_gauntlet_$G_hunt4", "#PLAYER2#", 15.0)
	end
end

function mp_coop_gauntlet_main()
	minimap_icon_add_trigger("mp_coop_gauntlet_$t_exit", "map_mp_gen_dropoff", true, "map_mp_gen_dropoff_glow")
	ingame_effect_add_trigger("mp_coop_gauntlet_$t_exit", "mp_marker_pimp")	
	notoriety_set("rollers", 4)
	notoriety_set_max("rollers", 4)
	notoriety_set_min("rollers", 4)
	coop_scorebox_add_score("MP_COOP_LIVES_LEFT", "Lives")
	coop_scorebox_show()
	
	coop_set_starting_lives(Lives)
	
	spawn_group_general(1)

	mp_chat_msg("MSN_GAUNTLET_START")
	
--	local npc_count = coop_get_npc_slots_left()
--	debug_message(npc_count .. " NPC slots left")
end

-- Attack player 1 (for hunter groups)
function attack_player1(attacker)
	attack(attacker, "#PLAYER1#")
end

-- Attack player 2 (for hunter groups)
function attack_player2(attacker)
	attack(attacker, "#PLAYER2#")
end

-- Releases the NPC into the world, decrements the group count
function npc_death_process(npc)
--	debug_message("Releasing " .. npc .. " to world")
	release_to_world(npc)
	
	local group = Npc_group_hash[npc]
	Group_alive_count[group] = Group_alive_count[group] - 1
	if Group_alive_count[group] == 0 then
		Groups_to_despawn[group] = nil	-- Assigning nil deletes the entry
--		debug_message("Removing " .. group .. " from the Groups_to_despawn table")

		-- Make sure the spawn thread's dead
		if Spawn_handles[group] ~= nil then
			thread_kill(Spawn_handles[group])
--			debug_message("Killing spawn thread for group " .. group)
			Spawn_handles[group] = nil
		end

	end
end

-- Function to possibly despawn NPCs to accommodate new spawns
function maybe_despawn_groups(requested_slots)
	local slots_needed = requested_slots - coop_get_npc_slots_left()

	if slots_needed <= 0 then
		return
	end
	
	-- Not enough slots, so we have to go through the list and start despawning
	local despawn_groups = {}
	local closest_groups = {}
	local closest_distances = {}
	
	for group, index in pairs(Groups_to_despawn) do
		-- Copy the main list
		despawn_groups[group] = index
		
		-- Now find the closest one to each player
		for player = 1, 2 do
			-- Use the first NPC as the navpoint name (should match)
			local dist = get_dist_char_to_nav("#PLAYER" .. player .. "#", Group_members[group][1])
			if closest_distances[player] == nil or closest_distances[player] > dist then
				closest_groups[player] = group
				closest_distances[player] = dist
			end
		end
	end
	
	-- Remove the closest groups to each player from despawn consideration
	-- WARNING: The assumption here is that even after removing the two closest groups to each player, there's enough
	-- NPCs to despawn.  If not, we're not going to have enough slots after this
	for player, group in pairs(closest_groups) do
		despawn_groups[group] = nil	-- Assigning nil deletes the entry
--		debug_message("Group " .. group .. " is too close to player " .. player .. ", can't despawn")
	end
	
	-- For each of the remaining groups, start despawning based on the number (lower is closer to the start) until we
	-- get enough slots
	
	-- Sort the group array by reversing the array, then skip the gaps
	local group_despawn_order = {}
	for group, index in pairs(despawn_groups) do
		group_despawn_order[index] = group
	end
	
	local idx = 1
	local max_idx = sizeof_table(Group_members)
	local slots_opened = 0
	repeat
		if group_despawn_order[idx] ~= nil then
			local group = group_despawn_order[idx]
			destroy_group(group)
			slots_opened = slots_opened + Group_alive_count[group]
			Group_alive_count[group] = 0
			Groups_to_despawn[group] = nil	-- Assigning nil deletes the entry
--			debug_message("Despawning group " .. group_despawn_order[idx])

			-- Make sure the spawn thread's dead
			if Spawn_handles[group] ~= nil then
				thread_kill(Spawn_handles[group])
--				debug_message("Killing spawn thread for group " .. group)
				Spawn_handles[group] = nil
			end
		end
		
		idx = idx + 1
	until slots_opened >= slots_needed or idx > max_idx
end

-- General function to spawn a group and disable the associated triggers
function spawn_group_general(index)
	local group = Group_prefix .. index
	
	if Trigger_members[group] ~= nil then
		for i, trigger in ipairs(Trigger_members[group]) do
			trigger_disable(trigger)
		end
	end
	
	-- Ignore if there's already been a thread started to spawn this group
	if Spawn_handles[group] ~= nil then
		return
	end
	
	local slots_needed = sizeof_table(Group_members[group])
	
	-- Despawn as many groups as necessary to accommodate the new group
	maybe_despawn_groups(slots_needed)

	if coop_get_npc_slots_left() < slots_needed then
		-- We still can't find enough slots, so don't spawn the new group
--		debug_message("Couldn't find enough NPC slots, thread won't spawn new group yet")
	end
		
	Spawn_handles[group] = thread_new("spawn_group_finish", index)
--	debug_message("Spawn handle for spawn thread " .. group .. " is " .. Spawn_handles[group])
end

-- Thread callback that actually spawns a group of NPCs when there's room
function spawn_group_finish(index)
    -- Keep going forever until the check works
	while true do
		local group = Group_prefix .. index

		local slots_needed = sizeof_table(Group_members[group])
	
--		local npc_count = coop_get_npc_slots_left()
--		debug_message(npc_count .. " NPC slots left checking spawn thread")		
	
		if coop_get_npc_slots_left() >= slots_needed then
			group_create(group)
			
			-- Make the group members wander around their spawn location
			for i, member in ipairs(Group_members[group]) do
			    npc_prevent_flinching( member, true )		
				wander_start(member)
			end
			
			Groups_to_despawn[group] = index	-- Assign the index for sorting purposes
--			debug_message(group .. " added to Groups_to_despawn, " .. sizeof_table(Groups_to_despawn) .. " groups in table")
		
--			local npc_count = coop_get_npc_slots_left()
--			debug_message(npc_count .. " NPC slots left")				
			break
		end
		
		-- Put the thread to sleep for a frame so it doesn't stall the game
		delay(0)
	end
end

function mp_coop_gauntlet_spawn_group_1()
--	spawn_group_general(1)
	
	if Hunters_spawned == false then
		if Difficulty == "Gangster" then
			group_create("mp_coop_gauntlet_$G_hunt1")
			group_create("mp_coop_gauntlet_$G_hunt2")
		else
			group_create("mp_coop_gauntlet_$G_hunt3")
			group_create("mp_coop_gauntlet_$G_hunt4")
		end	
		
--		debug_message("Hunter groups spawned")
		
		-- Only spawn them once
		Hunters_spawned = true
	end
end

function mp_coop_gauntlet_spawn_group_2()
	spawn_group_general(2)
end

function mp_coop_gauntlet_spawn_group_3()
	spawn_group_general(3)
end

function mp_coop_gauntlet_spawn_group_4()
	spawn_group_general(4)
end

function mp_coop_gauntlet_spawn_group_5()
	spawn_group_general(5)
end

function mp_coop_gauntlet_spawn_group_6()
	spawn_group_general(6)
end

function mp_coop_gauntlet_spawn_group_7()
	spawn_group_general(7)
end

function mp_coop_gauntlet_spawn_group_8()
	spawn_group_general(8)
end

function mp_coop_gauntlet_exit(player)
	Escapes = Escapes + 1
	mp_chat_msg("MSN_PLAYER_ESCAPED")
	coop_hide_and_force_spectator(player)
	if Escapes == 2 then
		mp_coop_gauntlet_game_won()
	end
end

function mp_coop_gauntlet_player_death()
	Lives = Lives - 1
	
	if Lives < 0 then
		-- Keep Lives at 0, start counting Deaths
		Lives = 0
		Deaths = Deaths + 1
	end
	
	if (Deaths > 0) and (Lives == 0) then
		mp_coop_gauntlet_game_lost()
	end
		
end

function game_over()
	for group, handle in pairs(Spawn_handles) do
		thread_kill(handle)
	end
end

function mp_coop_gauntlet_game_lost()
	coop_game_over("lost")
	delay(2)
	mp_chat_msg("MSN_FAIL")
	delay(5)
	game_over()
	coop_game_exit()
end

function mp_coop_gauntlet_game_won()
	if Difficulty == "Kingpin" then
		award_achievement(34)
	end
	coop_game_over("won")
	delay(2)
	mp_chat_msg("MSN_BOTH_ESCAPED")
	delay(5)
	game_over()
	coop_game_exit()
end
