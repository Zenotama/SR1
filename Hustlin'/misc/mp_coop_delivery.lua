-- Globals
Lives = 4
Boxes = 2
Deaths = 0
Difficulty = 0
Box_respawn_time_ms = 30000

-- Handles for spawning threads and distance despawning threads
Spawn_handles = {}
Distance_despawn_handles = {}

-- stores the script name for the goods
Goods = {0, 0}
Goods_delivered = { false, false }
Num_goods = 2

-- A thread to monitor the the goods
Goods_monitor_thread = 0
-- Hunter members
Hunter_members = {}

-- Hunter flag for if they've been spawned
Hunters_spawned = false

-- Group names, members and the number alive
Group_names = {}
Group_members = {}
Group_alive_count = {}

-- Reverse hash for cop-group association
Npc_group_hash = {}

-- Triggers for each group
Trigger_members = {}

-- List of groups that can be despawned and a count
Groups_to_despawn = {}

function mp_coop_delivery_init()
	on_trigger("mp_coop_delivery_delivery_dropoff", "mp_coop_delivery_$dropoff")
	on_death("mp_coop_delivery_player_death", "#PLAYER1#")
	on_death("mp_coop_delivery_player_death", "#PLAYER2#")
	on_respawn("mp_coop_delivery_player_respawn", "#PLAYER1#")
	on_respawn("mp_coop_delivery_player_respawn", "#PLAYER2#")
	
	-- Fill out the hunter members
	Hunter_members["mp_coop_delivery_$hunt1"] = {
		"mp_coop_delivery_$vk_x_m_killa1-01#000",
		"mp_coop_delivery_$vk_x_m_killa1-01#001"
	}
	
	Hunter_members["mp_coop_delivery_$hunt2"] = {
		"mp_coop_delivery_$vk_x_m_killa1-01#002",
		"mp_coop_delivery_$vk_x_m_killa1-01#003"
	}
	
	-- Fill out the group members
	Group_names = {
		"mp_coop_delivery_$start",			-- 1
		"mp_coop_delivery_$alley",			-- 2
		"mp_coop_delivery_$road1",			-- 3
		"mp_coop_delivery_$road2",			-- 4
		"mp_coop_delivery_$road3",			-- 5
		"mp_coop_delivery_$t_intersect",	-- 6
		"mp_coop_delivery_$end"				-- 7
	}
	
	Group_members["mp_coop_delivery_$start"] = {
		"mp_coop_delivery_$vk_g1_1",
		"mp_coop_delivery_$vk_g1_2",
		"mp_coop_delivery_$vk_g1_3"
	}
	
	Group_members["mp_coop_delivery_$alley"] = {
		"mp_coop_delivery_$vk_g2_1",
		"mp_coop_delivery_$vk_g2_2",
		"mp_coop_delivery_$vk_g2_3"
	}

	Group_members["mp_coop_delivery_$road1"] = {
		"mp_coop_delivery_$vk_g3_1",
		"mp_coop_delivery_$vk_g3_2",
		"mp_coop_delivery_$vk_g3_3",
		"mp_coop_delivery_$vk_g3_4",
		"mp_coop_delivery_$vk_g3_5"
	}
	
	Group_members["mp_coop_delivery_$road2"] = {
		"mp_coop_delivery_$vk_g4_1",
		"mp_coop_delivery_$vk_g4_2",
		"mp_coop_delivery_$vk_g4_3",
		"mp_coop_delivery_$vk_g4_4",
		"mp_coop_delivery_$vk_g4_5"
	}
	
	Group_members["mp_coop_delivery_$road3"] = {
		"mp_coop_delivery_$vk_g5_1",
		"mp_coop_delivery_$vk_g5_2",
		"mp_coop_delivery_$vk_g5_3",
		"mp_coop_delivery_$vk_g5_4",
		"mp_coop_delivery_$vk_g5_5"
	}
	
	Group_members["mp_coop_delivery_$t_intersect"] = {
		"mp_coop_delivery_$vk_g6_1",
		"mp_coop_delivery_$vk_g6_2",
		"mp_coop_delivery_$vk_g6_3",
		"mp_coop_delivery_$vk_g6_4",
		"mp_coop_delivery_$vk_g6_5"
	}
	
	Group_members["mp_coop_delivery_$end"] = {
		"mp_coop_delivery_$vk_g7_1",
		"mp_coop_delivery_$vk_g7_2",
		"mp_coop_delivery_$vk_g7_3",
		"mp_coop_delivery_$vk_g7_4",
		"mp_coop_delivery_$vk_g7_5"
	}
	
	-- Fill out the trigger-group associations
	Trigger_members["mp_coop_delivery_$start"] = {
		"mp_coop_delivery_$road2"
	}
	
	Trigger_members["mp_coop_delivery_$alley"] = {
		"mp_coop_delivery_$road3",
	}	
	
	Trigger_members["mp_coop_delivery_$road1"] = {
		"mp_coop_delivery_$alley",
		"mp_coop_delivery_$road4",
		"mp_coop_delivery_$road4a"
	}
	
	Trigger_members["mp_coop_delivery_$road2"] = {
		"mp_coop_delivery_$road1",
		"mp_coop_delivery_$t_intersect"
	}
	
	Trigger_members["mp_coop_delivery_$road3"] = {
		"mp_coop_delivery_$road2-2",
		"mp_coop_delivery_$end"
	}
	
	Trigger_members["mp_coop_delivery_$t_intersect"] = {
		"mp_coop_delivery_$road4-2",
		"mp_coop_delivery_$road4a-2",
		"mp_coop_delivery_$end-2"
	}
	
	Trigger_members["mp_coop_delivery_$end"] = {
		"mp_coop_delivery_$t_intersect-2"
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
	
	coop_on_premature_end("mp_coop_delivery_game_lost")
	
	Difficulty = coop_get_difficulty_level()
	
	-- Assign hunter members to always attack the players
	if Difficulty == "Gangster" then
		for i, member in ipairs(Hunter_members["mp_coop_delivery_$hunt1"]) do
			on_respawn("attack_player1", member)
		end
		coop_create_hunter_group("mp_coop_delivery_$hunt1", "#PLAYER1#", 30.0)
		
		for i, member in ipairs(Hunter_members["mp_coop_delivery_$hunt2"]) do
			on_respawn("attack_player2", member)
		end
		coop_create_hunter_group("mp_coop_delivery_$hunt2", "#PLAYER2#", 30.0)
	else
		for i, member in ipairs(Hunter_members["mp_coop_delivery_$hunt1"]) do
			on_respawn("attack_player1", member)
		end
		coop_create_hunter_group("mp_coop_delivery_$hunt1", "#PLAYER1#", 30.0)
		
		for i, member in ipairs(Hunter_members["mp_coop_delivery_$hunt2"]) do
			on_respawn("attack_player2", member)
		end
		coop_create_hunter_group("mp_coop_delivery_$hunt2", "#PLAYER2#", 30.0)
	end	

	notoriety_set_min("rollers", 4)
	mp_object_item_set_respawn_timer(Box_respawn_time_ms)

	-- These aren't being used
	trigger_disable("mp_coop_delivery_$alley-2")
	trigger_disable("mp_coop_delivery_$road1-2")
	trigger_disable("mp_coop_delivery_$road3-2")
	
	-- Loops through the triggers in the table and assigns the same callback
	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$start"]) do
		on_trigger("spawn_camp_start", trigger)
	end

	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$alley"]) do
		on_trigger("spawn_camp_alley", trigger)
	end
	
	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$road1"]) do
		on_trigger("spawn_camp_road1", trigger)
	end

	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$road2"]) do
		on_trigger("spawn_camp_road2", trigger)
	end
	
	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$road3"]) do
		on_trigger("spawn_camp_road3", trigger)
	end
	
	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$t_intersect"]) do
		on_trigger("spawn_camp_t_intersect", trigger)
	end
	
	for idx, trigger in ipairs(Trigger_members["mp_coop_delivery_$end"]) do
		on_trigger("spawn_camp_end", trigger)
	end
	
	-- Add weapons to the player's spawn inventory
	coop_add_weapon_to_spawn_inventory("tec9", 200)
	coop_add_weapon_to_spawn_inventory("pipe_bomb", 3)
	coop_add_weapon_to_spawn_inventory("ak47", 200)
	coop_add_weapon_to_spawn_inventory("pump_action_shotgun", 200)
	coop_add_weapon_to_spawn_inventory("desert eagle", 200)
	award_achievement(1)
	award_achievement(2)
	award_achievement(3)
	award_achievement(4)
	award_achievement(5)
	award_achievement(6)
	award_achievement(7)
	award_achievement(8)
	award_achievement(9)
	award_achievement(10)
	award_achievement(11)
	award_achievement(12)
	award_achievement(13)
	award_achievement(14)
	award_achievement(15)
	award_achievement(16)
	award_achievement(17)
	award_achievement(18)
	award_achievement(19)
	award_achievement(20)
	award_achievement(21)
	award_achievement(22)
	award_achievement(23)
	award_achievement(24)
	award_achievement(25)
	award_achievement(26)
	award_achievement(27)
	award_achievement(28)
	award_achievement(29)
	award_achievement(30)
	award_achievement(31)
	award_achievement(32)
	award_achievement(33)
	award_achievement(34)
	award_achievement(35)
	award_achievement(36)
	award_achievement(37)
	award_achievement(38)
	award_achievement(39)
	award_achievement(40)
	award_achievement(41)
	award_achievement(42)
	award_achievement(43)
end

function mp_coop_delivery_main()
	coop_scorebox_add_score("MP_COOP_LIVES_LEFT", "Lives")
	coop_scorebox_add_score("MP_COOP_BOXES_TO_DELIVER", "Boxes")
	coop_scorebox_add_timer("MP_COOP_BOX_1")
	coop_scorebox_add_timer("MP_COOP_BOX_2")
	coop_scorebox_show()
	coop_scorebox_hide_timer(1, true)
	coop_scorebox_hide_timer(2, true)
	
	coop_set_starting_lives(Lives)
	
	for i=1, Num_goods do
		Goods[i] = item_create_at_nav("delivery_goods", "mp_coop_delivery_$box" .. i)
		Goods_delivered[i] = false
		on_carry_pickup("mp_coop_delivery_carry_pickup", Goods[i])
		on_carry_drop("mp_coop_delivery_carry_drop", Goods[i])
		minimap_icon_add_item(Goods[i], "map_mp_coop_box", true)
	end
	
	minimap_icon_add_trigger("mp_coop_delivery_$dropoff", "map_mp_gen_dropoff", true, "map_mp_gen_dropoff_glow")
	ingame_effect_add_trigger("mp_coop_delivery_$dropoff", "mp_marker_pimp")
	trigger_enable("mp_coop_delivery_$dropoff")
	
	-- Start a thread to monitor the the goods.
	Goods_monitor_thread = thread_new("monitor_goods")

	spawn_camp_general(1)
	spawn_camp_general(2)
	
	mp_chat_msg("MSN_DELIVERY_START1")
	delay(5)
	mp_chat_msg("MSN_DELIVERY_START2")
	
--	delay(10)

--	local npc_count = coop_get_npc_slots_left()
--	debug_message(npc_count .. " NPC slots left")
end

-- Monitors Goods (mostly to deal with their timers).
--

function monitor_goods()
	
	-- Do this until the thread gets killed.
	while true do

		for i = 1, Num_goods do

			-- Hide unhidden and elapsed timers.
			if not coop_scorebox_is_timer_hidden(i) and coop_scorebox_timer_is_elapsed(i) then
				coop_scorebox_hide_timer(i, true)
			end
		end

		-- Wait a frame.
		delay(0)
	end
end

-- Despawn a group due to excessive distance from a player, re-enables the triggers that spawn it
function distance_despawn(index, distance)
      -- Keep going forever until the check works
	while true do
		local group = Group_names[index]
	
		local dist1 = get_dist_char_to_nav("#PLAYER1#", Group_members[group][1])
		local dist2 = get_dist_char_to_nav("#PLAYER2#", Group_members[group][1])
		if (dist1 > distance) and (dist2 > distance) then
			destroy_group(group)
			Groups_to_despawn[group] = nil	-- Assigning nil deletes the entry
--			debug_message("Removing " .. group .. " from the Groups_to_despawn table (distance)")
			
			-- Re-enable the triggers for the group
			for i, trigger in ipairs(Trigger_members[group]) do
				trigger_enable(trigger)
			end
			
			-- Make sure the spawn thread's dead
			if Spawn_handles[group] ~= nil then
				thread_kill(Spawn_handles[group])
--				debug_message("Killing spawn thread for group " .. group)
				Spawn_handles[group] = nil
			end			
			
			break
		end
		
		-- Put the thread to sleep for a frame so it doesn't stall the game
		delay(0)
	end
end

-- Releases the NPC into the world, decrements the group count
function npc_death_process(npc)
--	debug_message("Releasing " .. npc .. " to world")
	release_to_world(npc)
	
	local group = Npc_group_hash[npc]
	Group_alive_count[group] = Group_alive_count[group] - 1
	if Group_alive_count[group] == 0 then
		Groups_to_despawn[group] = nil	-- Assigning nil deletes the entry
--		debug_message("Removing " .. group .. " from the Groups_to_despawn table (death)")	

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
			
			-- Re-enable the associated triggers
			-- NOTE: Here's hoping that the distance despawn thread will already handle the spawns enough to not
			-- need this, because it could attempt an immediate group create again if the players are close enough
			-- to step on this within a second or two
			for i, trigger in ipairs(Trigger_members[group]) do
				trigger_enable(trigger)
			end
			
			-- Make sure the spawn thread's dead
			if Spawn_handles[group] ~= nil then
				thread_kill(Spawn_handles[group])
--				debug_message("Killing spawn thread for group " .. group)
				Spawn_handles[group] = nil
			end
			
			-- Kill the distance despawn thread
			if Distance_despawn_handles[group] ~= nil then
				thread_kill(Distance_despawn_handles[group])
				Distance_despawn_handles[group] = nil
			end
		end
		
		idx = idx + 1
	until slots_opened >= slots_needed or idx > max_idx
end

-- General function to spawn a camp and disable the associated triggers
function spawn_camp_general(index)
	local group = Group_names[index]

	-- Loops through the triggers and disables them
	if Trigger_members[group] ~= nil then
		for i, trigger in ipairs(Trigger_members[group]) do
			trigger_disable(trigger)
		end	
	end

	-- Ignore if there's already been a thread started to spawn this group
	if Spawn_handles[group] ~= nil then
--		debug_message("Spawn handle for " .. group .. " already exists")
		return
	end	
	
	local slots_needed = sizeof_table(Group_members[group])

--	if coop_get_npc_slots_left() < slots_needed then
		-- We can't find enough slots, so don't spawn the new group
--		debug_message("Couldn't find enough NPC slots, thread won't spawn new group yet")
--	end

	-- Despawn as many groups as necessary to accommodate the new group
	maybe_despawn_groups(slots_needed)	
	
	Spawn_handles[group] = thread_new("spawn_camp_finish", index)
--	debug_message("Spawn handle for spawn thread " .. group .. " is " .. Spawn_handles[group])
end

-- Thread callback that actually spawns a group of NPCs when there's room
function spawn_camp_finish(index)
    -- Keep going forever until the check works
	while true do
		local group = Group_names[index]

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
		
			local npc_count = coop_get_npc_slots_left()
--			debug_message(npc_count .. " NPC slots left")		

			-- Start a new thread to despawn the group for distance
			Distance_despawn_handles[group] = thread_new("distance_despawn", index, 125)
			break
		end
		
		-- Put the thread to sleep for a frame so it doesn't stall the game
		delay(0)
	end
end

function spawn_camp_start()
	spawn_camp_general(1)
end

function spawn_camp_alley()
	spawn_camp_general(2)
end

function spawn_camp_road1()
	spawn_camp_general(3)
	
	if Hunters_spawned == false then
		group_create("mp_coop_delivery_$hunt1")
		group_create("mp_coop_delivery_$hunt2")
		
--		debug_message("Hunter groups spawned")
		
		-- Only spawn them once
		Hunters_spawned = true
	end		
end

function spawn_camp_road2()
	spawn_camp_general(4)
end

function spawn_camp_road3()
	spawn_camp_general(5)
end

function spawn_camp_t_intersect()
	spawn_camp_general(6)
end

function spawn_camp_end()
	spawn_camp_general(7)
end

function mp_coop_delivery_delivery_dropoff(player)

	-- Ignore this if the game ended.
	if coop_is_game_over() then
		return
	end

	for i, g in ipairs(Goods) do
		if carried_item_is_carrying(g, player) then
			carried_item_destroy(player)
			minimap_icon_remove_item(g)

			Boxes = Boxes - 1
			Goods_delivered[i] = true

			mp_chat_msg("MSN_BOX_DELIVERED")
			break
		end
	end
	
	if Boxes == 0 then
		mp_coop_delivery_game_won()
	end

end

function mp_coop_delivery_player_death()

	-- Ignore this if the game ended.
	if coop_is_game_over() then
		return
	end

	Lives = Lives - 1
	
	if Lives < 0 then
		-- Keep Lives at 0, start counting Deaths
		Lives = 0
		Deaths = Deaths + 1
	end
	
	if Deaths == 2 then
		mp_coop_delivery_game_lost()
	end
end

function mp_coop_delivery_player_respawn(player)
	--debug_message ("Respawning " .. player, 2, player)
end

-- Attack player 1 (for hunter groups)
function attack_player1(attacker)
	attack(attacker, "#PLAYER1#")
end

-- Attack player 2 (for hunter groups)
function attack_player2(attacker)
	attack(attacker, "#PLAYER2#")
end

function game_over()
	-- Kill all the threads that may be active
	thread_kill(Goods_monitor_thread)
	
	for group, handle in pairs(Spawn_handles) do
		thread_kill(handle)
	end
	
	for group, handle in pairs(Distance_despawn_handles) do
		thread_kill(handle)
	end
end

function mp_coop_delivery_game_lost()
	coop_game_over("lost")
	delay(2)
	mp_chat_msg("MSN_DELIVERY_LOSE")
	delay(5)
	game_over()
	coop_game_exit()
end

function mp_coop_delivery_game_won()
	if Difficulty == "Kingpin" then
		award_achievement(36)
	end
	coop_game_over("won")
	
	delay(2)
	mp_chat_msg("MSN_DELIVERY_WON")
	delay(5)
	game_over()
	coop_game_exit()
end

-- Returns the good index based on the name.
--
function mp_coop_get_good_index(name)

	for i = 1, Num_goods do
		if Goods[i] == name then
			return i
		end
	end

	return 1
end

function mp_coop_delivery_carry_pickup(player, item)
	human_make_priority_target(player, true, 10.0)

	-- Get the good index so we can show the respawn timer.
	local good_index = mp_coop_get_good_index(item)
	coop_scorebox_hide_timer(good_index, true)
end

function mp_coop_delivery_carry_drop(player, item)
	human_make_priority_target(player, false)

	-- Get the good index so we can show the respawn timer.
	local good_index = mp_coop_get_good_index(item)

	if not Goods_delivered[good_index] then
		coop_scorebox_timer_start(good_index, Box_respawn_time_ms)
		coop_scorebox_hide_timer(good_index, false)
	end
end
