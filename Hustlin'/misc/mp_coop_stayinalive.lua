-- Globals
Lives							= 4
Deaths						= 0

Group_members 				= {}		-- member names in a group
Group_help_messages		= {}		-- help messages for each group
Group_alive_count			= {}		-- group members currently alive
Cop_group_hash_table		= {}		-- reverse of the Group_members table
Cop_limits					= {}		-- Limit to how many cops can be spawned at once (changes with locks deactivated)
Cop_spawn_handles			= {}		-- Thread handles for group spawns
Cop_attack_handles		= {}		-- Thread handles for cop behavior
Last_group_spawned		= ""		-- Last group that was spawned in the game
Spawn_process_handle		= 0		-- Thread handle for the spawn process thread
Overall_alive				= 0		-- Overall number of cops alive
Pending_spawns				= 0		-- Number of cops that are in the process of spawning
GROUP_SIZE					= 4		-- Number of cops per group

Left_building 				= {}		-- Whether a player's left the building or not
Sniper_active_handles 	= {}		-- Handles for the sniper trained on the players' heads
SNIPER_AUDIO_ID 			= 21		-- MP audio ID for the sniper rifle firing sound

Cash							= ""		-- Cash box to drop off
BOX_RESPAWN_TIME_MS		= 30000	-- Time for the box to respawn (really high so it's not a factor)

Lock_help_messages		= {}		-- help messages for each trigger
Lock_ready					= {} 		-- when lock is ready to be opened
Lock_open					= {}		-- when each lock has been opened
Lock_names					= {} 		-- names of each lock
Lock_indexes				= {} 		-- indexes of each lock
Current_lock				= "" 		-- stores the name of the lock that is currently ready to be opened
Player_on_lock				= {}		-- whether a player is on the lock
Lock_ready_timer_handle	= 0		-- handle to the lock ready thread
Lock_timer_on_handle		= 0		-- handle to the lock timer thread
Lock_count					= 4 		-- number of locks that are still active
LOCK_READY_TIME_MS		= 45000	-- Time it takes for locks to become ready (ms)
LOCK_DEACTIVATE_TIME_MS	= 45000	-- Time it takes for locks to deactivate (ms)

Laser_mesh_names			= {}		-- Name of mesh movers for lasers
Alarm_light_mesh_names	= {}		-- Name of mesh movers for alarm lights
AI_KILLED                   = 0
AI_KILLED_EXTRA_AMMO        = 0
AI_KILLED_EXTRA_HEALTH      = 0
AI_KILLED_EXTRA_LIFE        = 0
PLAYER_HITPOINTS            = 0


function mp_coop_stayinalive_init()
	-- ======================
	-- Player Initializations
	-- ======================
	local player_names = {"#PLAYER1#", "#PLAYER2#"}
	
	for i, name in pairs(player_names) do
		-- Assign the death callback
		on_death("player_death", name)
		
		-- Assign the respawn callback
		on_respawn("player_respawn", name)
		
		-- Players start off in the building
		Left_building[name] = false
		
		-- Players start off not on any lock
		Player_on_lock[name] = false
	end

	-- =====================
	-- Group Initializations
	-- =====================
	-- Group names
	local group_names = {
		"mp_coop_stayinalive_$GroupFront1",
		"mp_coop_stayinalive_$GroupFront2",
		"mp_coop_stayinalive_$GroupGarage",
		"mp_coop_stayinalive_$GroupBack",
		"mp_coop_stayinalive_$GroupRoof"
	}
	
	for i, group in pairs(group_names) do		
		-- Assign the current alive count for each group to 0
		Group_alive_count[group] = 0
	end
	
	-- Assign group members to a group
	-- Note: The number of members per group should equal GROUP_SIZE
	Group_members["mp_coop_stayinalive_$GroupFront1"] = {
		"mp_coop_stayinalive_Lw_w_m_swat01#000", 
		"mp_coop_stayinalive_Lw_w_m_swat01#001", 
		"mp_coop_stayinalive_Lw_w_m_swat01#002", 
		"mp_coop_stayinalive_Lw_w_m_swat01#003"
	}

	Group_members["mp_coop_stayinalive_$GroupFront2"] = {
		"mp_coop_stayinalive_Lw_w_m_swat01#004", 
		"mp_coop_stayinalive_Lw_w_m_swat01#005",
		"mp_coop_stayinalive_Lw_w_m_swat01#006", 
		"mp_coop_stayinalive_Lw_w_m_swat01#007"
	}

	Group_members["mp_coop_stayinalive_$GroupGarage"] = {
		"mp_coop_stayinalive_Lw_w_m_swat01#008", 
		"mp_coop_stayinalive_Lw_w_m_swat01#009", 
		"mp_coop_stayinalive_Lw_w_m_swat01#010", 
		"mp_coop_stayinalive_Lw_w_m_swat01#011"
	}

	Group_members["mp_coop_stayinalive_$GroupBack"] = {
		"mp_coop_stayinalive_Lw_w_m_swat01#012", 
		"mp_coop_stayinalive_Lw_w_m_swat01#013", 
		"mp_coop_stayinalive_Lw_w_m_swat01#014", 
		"mp_coop_stayinalive_Lw_w_m_swat01#015"
	}

	Group_members["mp_coop_stayinalive_$GroupRoof"] = {
		"mp_coop_stayinalive_Lw_w_m_swat01#016", 
		"mp_coop_stayinalive_Lw_w_m_swat01#017", 
		"mp_coop_stayinalive_Lw_w_m_swat01#018", 
		"mp_coop_stayinalive_Lw_w_m_swat01#019"
	}

	-- Now we create the Group_members table in reverse, so we can find a group for each cop
	for group, members in pairs(Group_members) do
		for i, cop in pairs(members) do
			Cop_group_hash_table[cop] = group
		end
	end
    
	-- Assigning death callbacks for each cop using the hash table we just made
	for cop, group in pairs(Cop_group_hash_table) do
		on_death("npc_death_process", cop)
	end
	
	-- Assigning the help messages for each group
	Group_help_messages["mp_coop_stayinalive_$GroupFront1"] = "MSN_SA_FRONT1"
	Group_help_messages["mp_coop_stayinalive_$GroupFront2"] = "MSN_SA_FRONT2"
	Group_help_messages["mp_coop_stayinalive_$GroupGarage"] = "MSN_SA_GARAGE"
	Group_help_messages["mp_coop_stayinalive_$GroupBack"] = "MSN_SA_BACK"
	Group_help_messages["mp_coop_stayinalive_$GroupRoof"] = "MSN_SA_ROOF"

	-- ==========
	-- Cop Limits
	-- ==========
	-- Assigning the number of cops spawnable depending on how many locks are deactivated
	-- Note 1: Must have exactly # locks + 1 entries!
	-- Note 2: The index goes down because it's the number of *active* locks.
	if coop_get_difficulty_level() == "Gangster" then
		Cop_limits[4] = 8
		Cop_limits[3] = 8
		Cop_limits[2] = 9
		Cop_limits[1] = 9	
		Cop_limits[0] = 10
	else
		Cop_limits[4] = 8
		Cop_limits[3] = 9
		Cop_limits[2] = 10
		Cop_limits[1] = 11	
		Cop_limits[0] = 12
	end
	
	-- Double-check that these limits are all lower than the max slots we have for NPCs.  Should be okay
	-- right now, because none of the cops are spawned yet.
	local max_limit = coop_get_npc_slots_left()
	for locks, limit in pairs(Cop_limits) do
		if limit > max_limit then
			Cop_limits[locks] = max_limit
		end
	end	
	
	-- =====================
	-- Lock Intitializations
	-- =====================
	-- Intializing locks.  Note that the order here is the order in which the locks are deactivated
	Lock_names = {
		"mp_coop_stayinalive_$lock4",
		"mp_coop_stayinalive_$lock1",
		"mp_coop_stayinalive_$lock2",
		"mp_coop_stayinalive_$lock3"
	}	
	
	for i, name in pairs(Lock_names) do
		-- Mark the lock closed
		Lock_open[name] = false
		
		-- Mark the lock as not ready
		Lock_ready[name] = false
		
		-- Reverse the lock name to hash the index
		Lock_indexes[name] = i
		
		-- Assigning trigger callbacks for entering and exiting a lock
		on_trigger("trigger_lock", name)
		on_trigger_exit("trigger_lock_exit", name)
	end
	
	-- =======================
	-- Trigger Initializations
	-- =======================
	--Trigger callbacks for leaving and entering the building
	on_trigger("exit_building", "mp_coop_stayinalive_$front_out")
	on_trigger("exit_building", "mp_coop_stayinalive_$side_out")
	on_trigger("exit_building", "mp_coop_stayinalive_$back_out")
	on_trigger("exit_building", "mp_coop_stayinalive_$garage_out")
	on_trigger("exit_building", "mp_coop_stayinalive_$roof_out")
	
	on_trigger("enter_building", "mp_coop_stayinalive_$front_in")
	on_trigger("enter_building", "mp_coop_stayinalive_$side_in")
	on_trigger("enter_building", "mp_coop_stayinalive_$back_in")
	on_trigger("enter_building", "mp_coop_stayinalive_$garage_in")
	on_trigger("enter_building", "mp_coop_stayinalive_$roof_in")
	
	-- Callback for dropping off the cash box
	on_trigger("cash_dropoff", "mp_coop_stayinalive_$exit")	
	
	-- ===========
	-- Mesh Movers
	-- ===========
	-- Laser mesh mover names
	Laser_mesh_names = {
		"mp_coop_stayinalive_MeshMover010",
		"mp_coop_stayinalive_MeshMover020",
		"mp_coop_stayinalive_MeshMover030"
	}	
	
	-- Alarm light mesh mover names
	for i = 1, 4 do
		Alarm_light_mesh_names["mp_coop_stayinalive_$lock" .. i] = {
			"mp_coop_stayinalive_alarm" .. i .. "_red_on",
			"mp_coop_stayinalive_alarm" .. i .. "_yellow_on",
			"mp_coop_stayinalive_alarm" .. i .. "_green_on",
			"mp_coop_stayinalive_alarm" .. i .. "_red_off",
			"mp_coop_stayinalive_alarm" .. i .. "_yellow_off",
			"mp_coop_stayinalive_alarm" .. i .. "_green_off"
		}
	end
	
	-- =====
	-- Other
	-- =====
	-- Callback if someone leaves early
	coop_on_premature_end("game_lost")
	
	-- Make the getaway car invulnerable
	--turn_invulnerable("mp_coop_stayinalive_$v000", false)
	
	-- Set the item respawn timer to some high number so it's not noticable
	mp_object_item_set_respawn_timer(BOX_RESPAWN_TIME_MS)
	
end

function mp_coop_stayinalive_main()
	-- Link the life count in code
	coop_set_starting_lives(Lives)
	
	-- Make the box o' cash
	Cash = item_create_at_nav("delivery_goods", "mp_coop_stayinalive_$cash")
	
	-- Add callbacks for picking up or dropping the cash
	on_carry_pickup("cash_pickup_msg", Cash)
	on_carry_drop("cash_drop_msg", Cash)
	
	-- Add the icon and effect to each lock, then turn them off for now
	for i, lock in pairs(Lock_names) do
		minimap_icon_add_trigger(lock, "map_mp_gen_dropoff", true, "map_mp_gen_dropoff_glow")
		ingame_effect_add_trigger(lock, "mp_marker_pimp")
		trigger_disable(lock)
	end
	
	-- Do the same for the exit trigger
	minimap_icon_add_trigger("mp_coop_stayinalive_$exit", "map_mp_gen_dropoff", true, "map_mp_gen_dropoff_glow")
	ingame_effect_add_trigger("mp_coop_stayinalive_$exit", "mp_marker_pimp")
	trigger_disable("mp_coop_stayinalive_$exit")
	
	-- Locks are done in the order of the names array
	Current_lock = Lock_names[1]
	
	-- Make sure the laser meshes are on
	for i, mesh in pairs(Laser_mesh_names) do
		mesh_show(mesh)
	end
	
	-- Make sure the alarm lights are set to red
	for i, lock in pairs(Lock_names) do
		turn_on_alarm_light(lock, "red", true)
		turn_on_alarm_light(lock, "yellow", false)
		turn_on_alarm_light(lock, "green", false)			
	end
	
	
	mp_chat_msg("MSN_SA_WELCOME")
	
	notoriety_set_min("police", 4)

	delay(3)
	mp_chat_msg("SA_Instructions")
	
	-- Setup the scorebox
	-- Note: put scorebox after the delay for race conditions with the DLC localized text
	coop_scorebox_add_score("MP_COOP_LIVES_LEFT", "Lives")
	coop_scorebox_add_score("MP_COOP_LOCKS_LEFT", "Lock_count")
	coop_scorebox_add_score("ZOMBIES_KILLED", "AI_KILLED")
	coop_scorebox_add_timer("SA_Lock_Ready")	
	coop_scorebox_add_timer("SA_Lock_Timer")

	coop_scorebox_show()	
	
	coop_scorebox_timer_start(1, LOCK_READY_TIME_MS)

	-- HACK: Timer in successive plays can have a buggy hide timer, so make sure to toggle it ~SherwinT 10/30/06
	coop_scorebox_hide_timer(1, true)
	coop_scorebox_hide_timer(1, false)

	coop_scorebox_hide_timer(2, true)

	-- Start the lock checking thread
	Lock_ready_timer_handle = thread_new("is_lock_ready", Current_lock)
	
	-- Spawn two groups randomly and add a delay to make sure players can see where both sides are coming from
	spawn_random_group(nil, 5)
	spawn_random_group(nil, 10)
	--ammo_infinite( true )
	-- set hit points
	PLAYER_HITPOINTS = get_current_hit_points("#PLAYER1#")
	Spawn_process_handle = thread_new("spawn_process")
end


-- on_death callback for players
--
function player_death(player)
	-- Dead players aren't on any lock
	Player_on_lock[player] = false

	Lives = Lives - 1

	if Lives < 0 then
		-- Keep lives at 0, start counting deaths
		Lives = 0
		Deaths = Deaths + 1
	end

	if Deaths == 2 then
		game_lost()
	end
end

-- on_respawn callback for players
--
function player_respawn(player)
	--message ("Respawning " .. player, 2, player)
end

-- on_death callback for each NPC, decrements the alive count for the NPC's group,
-- spawns a new group if count is 0
--
function npc_death_process(npc)
    AI_KILLED = AI_KILLED + 1
	AI_KILLED_EXTRA_AMMO = AI_KILLED_EXTRA_AMMO + 1
	AI_KILLED_EXTRA_HEALTH = AI_KILLED_EXTRA_HEALTH + 1
	AI_KILLED_EXTRA_LIFE = AI_KILLED_EXTRA_LIFE + 1
	if AI_KILLED_EXTRA_AMMO == 20 then
	 AI_KILLED_EXTRA_AMMO = 0
	 -- give both players extra ammo if alive
	 		if Lock_count == 4 then
		    inv_item_remove_all("#PLAYER1#")
			inv_item_add("glock", 250, "#PLAYER1#")
			inv_item_add("tec9b", 250, "#PLAYER1#")	
			inv_item_add("pump_action_shotgun", 50, "#PLAYER1#")			
		    inv_item_remove_all("#PLAYER2#")
			inv_item_add("glock", 250, "#PLAYER2#")
			inv_item_add("tec9b", 250, "#PLAYER2#")	
			inv_item_add("pump_action_shotgun", 50, "#PLAYER2#")	
		 elseif Lock_count == 3 then
		    inv_item_remove_all("#PLAYER1#")
			inv_item_add("glock", 250, "#PLAYER1#")
			inv_item_add("mac10", 250, "#PLAYER1#")
			inv_item_add("twelve_gauge", 50, "#PLAYER1#")
		    inv_item_remove_all("#PLAYER2#")
			inv_item_add("glock", 250, "#PLAYER2#")
			inv_item_add("mac10", 250, "#PLAYER2#")
			inv_item_add("twelve_gauge", 50, "#PLAYER2#")
         elseif Lock_count == 2 then
		    inv_item_remove_all("#PLAYER1#")
			inv_item_add("magnum", 250, "#PLAYER1#")
			inv_item_add("mac10", 250, "#PLAYER1#")
			inv_item_add("twelve_gauge", 50, "#PLAYER1#")
			inv_item_add("m16", 150, "#PLAYER1#")
		    inv_item_remove_all("#PLAYER2#")
			inv_item_add("magnum", 250, "#PLAYER2#")
			inv_item_add("mac10", 250, "#PLAYER2#")
			inv_item_add("twelve_gauge", 50, "#PLAYER2#")
			inv_item_add("m16", 150, "#PLAYER2#")
         else
		    inv_item_remove_all("#PLAYER1#")
			inv_item_add("magnum", 250, "#PLAYER1#")
			inv_item_add("mac10", 250, "#PLAYER1#")
			inv_item_add("twelve_gauge", 50, "#PLAYER1#")
			inv_item_add("m16", 150, "#PLAYER1#")
			inv_item_add("molotov", 5, "#PLAYER1#")
		    inv_item_remove_all("#PLAYER2#")
			inv_item_add("magnum", 250, "#PLAYER2#")
			inv_item_add("mac10", 250, "#PLAYER2#")
			inv_item_add("twelve_gauge", 50, "#PLAYER2#")
			inv_item_add("m16", 150, "#PLAYER2#")
			inv_item_add("molotov", 5, "#PLAYER2#")
        end	
		mp_chat_msg("EXTRA_AMMO")
	 end
	 if AI_KILLED_EXTRA_HEALTH == 50 then
	  -- give both players extra health if alive
	  AI_KILLED_EXTRA_HEALTH = 0
	  set_current_hit_points("#PLAYER1#", PLAYER_HITPOINTS)
	  set_current_hit_points("#PLAYER2#", PLAYER_HITPOINTS)
	  mp_chat_msg("EXTRA_HEALTH")
	  end
	  if AI_KILLED_EXTRA_LIFE == 100 then
	  -- give 1 extra life
	  AI_KILLED_EXTRA_LIFE = 0
	  Lives = Lives + 1
	  mp_chat_msg("EXTRA_LIFE")
	  end
	 
	release_to_world(npc)

	-- Kill the AI thread
	thread_kill(Cop_attack_handles[npc])
	Cop_attack_handles[npc] = nil
	
	local group = Cop_group_hash_table[npc]

	Group_alive_count[group] = Group_alive_count[group] - 1
	if Group_alive_count[group] == 0 and Cop_spawn_handles[group] ~= nil then
		--debug_message("Destroying group " .. group)
		group_destroy(group)
	
		-- Make sure the group spawn thread is dead
		thread_kill(Cop_spawn_handles[group])
		Cop_spawn_handles[group] = nil
	end
	
	Overall_alive = Overall_alive - 1 
end

-- Thread that continuously checks whether there's room to spawn more cops
--
function spawn_process()
	while true do
		if Overall_alive + Pending_spawns + GROUP_SIZE <= Cop_limits[Lock_count] then
			-- Have room to fit in a new group
			--debug_message("Spawning a new group for limit " .. Cop_limits[Lock_count])
			spawn_random_group(Last_group_spawned, 10)
		end
		
		delay(0)
	end

end

-- Spawns a random group
--
-- old_group: (optional) name of group that just died, so they don't respawn immediately.  Pass in nil
--            if you don't want to check for an old group
-- delay_time: (optional) time before group actually is created, defaults to 0
--
function spawn_random_group(old_group, delay_time)
	if delay_time == nil then
		delay_time = 0
	end

	-- Create a list of groups that can be respawned (have no live members)
	local respawnable_groups = {}
	
	-- Set count to 0 in case we don't find anything
	local rg_count = 0
	for group, num in pairs(Group_alive_count) do
		if num == 0 and group ~= old_group and Cop_spawn_handles[group] == nil then
			-- Lua indexing starts at 1
			rg_count = rg_count + 1
		
			-- Assign a group name to the next count
			respawnable_groups[rg_count] = group
		end
	end
	
	local chosen_group
	if rg_count > 0 then
		-- Choose a random group
		local rand_idx = rand_int(1, rg_count)
		chosen_group = respawnable_groups[rand_idx]
		
	elseif old_group ~= nil and Group_members[old_group] ~= nil and Cop_spawn_handles[old_group] == nil then
		-- If there's no other group than the old one, they get an immediate revivial
		chosen_group = old_group
		
	else
		return
	end
	
	--debug_message("Chosen random spawn is " .. chosen_group)
	
	-- Add to pending
	Pending_spawns = Pending_spawns + GROUP_SIZE
	
	-- Record this as the last group that was spawned
	Last_group_spawned = chosen_group
	
	-- And now we wait
	delay(delay_time)
	
	-- Start the spawn thread
	Cop_spawn_handles[chosen_group] = thread_new("spawn_group_finish", chosen_group)
end

-- Thread callback that actually spawns a group of NPCs when there's room
--
function spawn_group_finish(group)
    -- Keep going forever until the check works
	while true do
	
		local npc_count = coop_get_npc_slots_left()
		--debug_message(npc_count .. " NPC slots left checking spawn thread")		
	
		if coop_get_npc_slots_left() >= GROUP_SIZE then
			--debug_message("Spawning new group " .. group)
			
			-- Destroy the group just in case it was still around for some odd reason
			group_destroy(group)
			
			-- Make sure the old attack threads are dead
			for i, cop in pairs(Group_members[group]) do
				if Cop_attack_handles[cop] ~= nil then
					thread_kill(Cop_attack_handles[cop])
					Cop_attack_handles[cop] = nil
				end
			end			
			
			group_create(group)
			
			-- Reset the group alive count to the group size
			Group_alive_count[group] = GROUP_SIZE

			-- Add the member count to the overall alive, subtract from pending
			Overall_alive = Overall_alive + GROUP_SIZE
			Pending_spawns = Pending_spawns - GROUP_SIZE

			-- Send a message to the players telling them where the enemies are coming from and send them to the control points.
			mp_chat_msg(Group_help_messages[group])
			
			-- Start attack threads for the group
			for i, cop in pairs(Group_members[group]) do
	            npc_prevent_flinching( cop, true )			    
				Cop_attack_handles[cop] = thread_new("cop_attack", cop)
			end
			
			break
		end
		
		-- Put the thread to sleep for a frame so it doesn't stall the game
		delay(0)
	end
	
	-- Get rid of the handle for this spawn
	Cop_spawn_handles[group] = nil
end

-- Attack thread function for cops
--
function cop_attack(cop)
	while true do
		attack(cop)
		
		-- Re-acquire target every 5 seconds
		delay(5)
	end
end

-- Turns an alarm light on or off
--
function turn_on_alarm_light(lock, color, on)
	local on_index
	if color == "red" then
		on_index = 1
	elseif color == "yellow" then
		on_index = 2
	else
		on_index = 3
	end
	
	local off_index = on_index + 3
	
	if on then
		mesh_hide(Alarm_light_mesh_names[lock][off_index])
		mesh_show(Alarm_light_mesh_names[lock][on_index])
	else
		mesh_hide(Alarm_light_mesh_names[lock][on_index])
		mesh_show(Alarm_light_mesh_names[lock][off_index])	
	end
end

-- Goes through the Player_on_lock array and looks for either player being on the lock
--
function is_player_on_lock()
	for player, on_lock in pairs(Player_on_lock) do
		if on_lock == true then
			return true
		end
	end
	
	return false
end

-- Reset the players on the lock
--
function reset_players_on_lock()
	for player, on_lock in pairs(Player_on_lock) do
		Player_on_lock[player] = false
	end
end

-- When the first timer reaches zero, activate the next lock in the sequence
--
function is_lock_ready(lock)
	while true do
		if coop_scorebox_timer_get_time_left(1) <= 0 then
			-- Kill the timer
			coop_scorebox_timer_stop(1) 
			coop_scorebox_hide_timer(1, true)
			
			-- Ready the lock
			Lock_ready[lock] = true
			mp_chat_msg("SA_lock_ready")
			trigger_enable(lock)
			break
		end
		
		delay(0.5)
	end
	
	-- Clean up the handle
	Lock_ready_timer_handle = 0	
end

-- Check to make sure that the lock is the current lock and if so starts the second timer
--
function trigger_lock(human, trigger)
	if is_player(human) == false or trigger ~= Current_lock or Lock_ready[trigger] == false then
		return
	end
	
	if Lock_open[trigger] == false then
		local start_thread = false
		if is_player_on_lock() == false then
			-- Start the timer
			coop_scorebox_hide_timer(2, false)
			coop_scorebox_timer_start(2, LOCK_DEACTIVATE_TIME_MS)
			mp_chat_msg("SA_Stay_Trigger")
			
			-- Turn on the yellow light
			turn_on_alarm_light(trigger, "red", false)
			turn_on_alarm_light(trigger, "yellow", true)
			turn_on_alarm_light(trigger, "green", false)
			
			-- We can't start the thread until we mark the player as on the trigger (else it'll immediately stop)
			start_thread = true
		end
		
		-- Store player on the lock
		Player_on_lock[human] = true
		
		if start_thread == true then
			Lock_timer_on_handle = thread_new("check_lock_timer", Current_lock)
		end
	end
end

-- Checks to see if the second timer has expired and if so deactivates the lock, restarts the first timer, 
-- and makes the next lock the current lock
--
function check_lock_timer(lock)
	while true do

		-- Mark any dead player as immediately off the lock
		for player, on_lock in pairs(Player_on_lock) do
			if get_current_hit_points(player) <= 0 then
				Player_on_lock[player] = false
			end
		end
	
		-- Now check and see if any live players are still on the lock
		if is_player_on_lock() == false then
			-- Stop the timer countdown
			coop_scorebox_timer_stop(2)
			coop_scorebox_hide_timer(2, true)
			mp_chat_msg("SA_Timer_Reset")
			
			-- Turn the red light back on
			turn_on_alarm_light(lock, "red", true)
			turn_on_alarm_light(lock, "yellow", false)
			turn_on_alarm_light(lock, "green", false)			
			break		
		end
	
		if coop_scorebox_timer_get_time_left(2) <= 0 then
		    -- Give unlockable to players
		if Lock_count == 4 then
		    inv_item_remove_all("#PLAYER1#")
			inv_item_add("glock", 250, "#PLAYER1#")
			inv_item_add("tec9b", 250, "#PLAYER1#")	
			inv_item_add("pump_action_shotgun", 50, "#PLAYER1#")			
		    inv_item_remove_all("#PLAYER2#")
			inv_item_add("glock", 250, "#PLAYER2#")
			inv_item_add("tec9b", 250, "#PLAYER2#")	
			inv_item_add("pump_action_shotgun", 50, "#PLAYER2#")	
		 elseif Lock_count == 3 then
		    inv_item_remove_all("#PLAYER1#")
			inv_item_add("glock", 250, "#PLAYER1#")
			inv_item_add("mac10", 250, "#PLAYER1#")
			inv_item_add("twelve_gauge", 50, "#PLAYER1#")
		    inv_item_remove_all("#PLAYER2#")
			inv_item_add("glock", 250, "#PLAYER2#")
			inv_item_add("mac10", 250, "#PLAYER2#")
			inv_item_add("twelve_gauge", 50, "#PLAYER2#")
         elseif Lock_count == 2 then
			inv_item_add("m16", 150, "#PLAYER1#")
			inv_item_add("m16", 150, "#PLAYER2#")
         else
			inv_item_add("molotov", 5, "#PLAYER1#")
			inv_item_add("molotov", 5, "#PLAYER2#")
        end		
			-- Open the lock
			
			Lock_count = Lock_count - 1
			Lock_open[lock] = true
			mp_chat_msg("SA_Lock_open")
			trigger_disable(lock)
			
			-- Kill the timer
			coop_scorebox_timer_stop(2)
			coop_scorebox_hide_timer(2, true)
			
			-- Turn the green light on
			turn_on_alarm_light(lock, "red", false)
			turn_on_alarm_light(lock, "yellow", false)
			turn_on_alarm_light(lock, "green", true)	
			
			-- Wipe the players on the lock
			reset_players_on_lock()
			
			if Lock_count <= 0 then
				-- Vault time
				delay(2)
				vault_open()
			else
				-- Start the next ready timer
				coop_scorebox_timer_start(1, LOCK_READY_TIME_MS)
				coop_scorebox_hide_timer(1, false)
				
				-- Advance the current lock
				local next_index = Lock_indexes[lock] + 1
				Current_lock = Lock_names[next_index]

				Lock_ready_timer_handle = thread_new("is_lock_ready", Current_lock)
			end
			break
		end
		delay(0.5)
	end
	
	-- Clean up this thread's handle
	Lock_timer_on_handle = 0
end

-- Called to reset a lock if the player exits it
--
function trigger_lock_exit(human, trigger)
	if is_player(human) == false or trigger ~= Current_lock or Lock_ready[trigger] == false then
		return
	end
	
	if Lock_open[trigger] == false then
		-- Wipe the player on the lock
		Player_on_lock[human] = false
	
		if is_player_on_lock() == false then
			-- Stop the timer countdown
			coop_scorebox_timer_stop(2)
			coop_scorebox_hide_timer(2, true)
			
			-- Turn the red light back on
			turn_on_alarm_light(trigger, "red", true)
			turn_on_alarm_light(trigger, "yellow", false)
			turn_on_alarm_light(trigger, "green", false)	
			
			if Lock_timer_on_handle ~= 0 then
				mp_chat_msg("SA_Timer_Reset")
				thread_kill(Lock_timer_on_handle)
				Lock_timer_on_handle = 0
			end
		end
	end
end

-- Called when the locks are all deactivated to "open" the vault
--
function vault_open()
	mp_chat_msg("SA_All_Locks_Open")

	-- Turn the laser meshes off
	for i, mesh in pairs(Laser_mesh_names) do
		mesh_hide(mesh)
	end	
	
	-- Drop the cash box and enable the exit trigger
	minimap_icon_add_item(Cash, "map_mp_coop_box", true)
	trigger_enable("mp_coop_stayinalive_$exit")	
end

-- Callback for dropping off the box o' cash
--
function cash_dropoff(player)

	-- Ignore this if the game ended.
	if coop_is_game_over() then
		return
	end

	if carried_item_is_carrying(Cash, player) then
		minimap_icon_remove_item(Cash)
		
		-- Wipe the cash name first because we don't want the drop message to play
		Cash = ""
		carried_item_destroy(player)

		mp_chat_msg("SA_Got_Out")
		
		game_won()
	end
end

-- Callback for when someone tries to leave the bank
--
function exit_building(human)
	if is_player(human) == false or Left_building[human] == true then
		return
	end
	
	Left_building[human] = true
	mp_chat_msg("SA_Go_Inside")
	Sniper_active_handles[human] = thread_new("sniper_fire", human)
	
end

-- Callback for when someone re-enters the bank
--
function enter_building(human)
	if is_player(human) == false or Left_building[human] == false then
		return
	end
	
	thread_kill(Sniper_active_handles[human])
	Left_building[human] = false
end

-- "Snipe" the player after a delay
--
function sniper_fire(player)
	delay(5)
	if Left_building[player] == true then
		mp_audio_play(player, SNIPER_AUDIO_ID, player)
		--set_current_hit_points(player, 0)
	end
end

-- Message for when you pick up the cash
--
function cash_pickup_msg()
	if Cash ~= "" then
		mp_chat_msg("SA_Get_Out")
	end
end

-- Message for when you drop the cash
--
function cash_drop_msg()
	if Cash ~= "" then
		mp_chat_msg("SA_Dropped_Cash")
	end
end

-- Cleanup all the possible running threads (for game end)
--
function cleanup_threads()
	-- Kill all the cop attack threads
	for cop, group in pairs(Cop_group_hash_table) do
		if Cop_attack_handles[cop] ~= nil then
			thread_kill(Cop_attack_handles[cop])
		end
	end
	
	-- Kill all the cop spawn threads
	for group, count in Group_alive_count do
		if Cop_spawn_handles[group] ~= nil then
			thread_kill(Cop_spawn_handles[group])
		end
	end
	
	-- Kill the spawn thread itself
	thread_kill(Spawn_process_handle)
	
	-- Kill the sniper threads
	local player_names = {"#PLAYER1#", "#PLAYER2#"}
	
	for i, player in player_names do
		if Sniper_active_handles[player] ~= nil then
			thread_kill(Sniper_active_handles[player])
		end
	end
	
	-- Kill any lock threads
	thread_kill(Lock_ready_timer_handle)
	thread_kill(Lock_timer_on_handle)
end

function game_lost()
	cleanup_threads()
	
	coop_game_over("lost")
	delay(2)
	
	mp_chat_msg("MSN_SA_LOSE")
	delay(5)
	coop_game_exit()
end

function game_won()
	cleanup_threads()

	coop_game_over("won")
	delay(2)
	
	mp_chat_msg("MSN_SA_WIN")
	delay(5)
	coop_game_exit()
end
