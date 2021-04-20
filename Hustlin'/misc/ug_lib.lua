----------------------
-- System Functions --
----------------------

_UGGlobals = {}
_CutsceneGlobals = {}
_MissionGlobals = {}

In_mission = false

MINIMAP_ICON_KILL = "map_act_kill"
MINIMAP_ICON_PROTECT_ACQUIRE = "map_act_protectacquire"
MINIMAP_ICON_LOCATION = "map_act_location"

INGAME_EFFECT_KILL = "icon_red"
INGAME_EFFECT_PROTECT_ACQUIRE = "icon_green"
INGAME_EFFECT_LOCATION = "mission_complete"
INGAME_EFFECT_CUTSCENE = "mission_purchase"

INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE = "Icon_lg_c"
INGAME_EFFECT_VEHICLE_KILL = "Icon_lg_d"

INGAME_EFFECT_VEHICLE_LOCATION = "Mission_car_a"
INGAME_EFFECT_VEHICLE_CUTSCENE = "Mission_car_b"

Mission_waypoint = -1

-- Assign a value to global variable. Any nil-assignment raises an error.
--
function _CatchNilAssignment(t, k, v)
	if (v == nil) then
		error("attempted to initialize global variable '"..k.."' with nil value")
	else
		rawset(t, k, v)
	end
end

-- Catch an attempt to read from an undefined global variable
--
function _CatchUndefinedGlobalRead(t, k)
	error("attempted to read from undefined global variable '"..k.."'")
end

-- Catch an attempt to write to an undefined global variable
--
function _CatchUndefinedGlobalWrite(t, k, v)
	error("attempted to write to undefined global variable '"..k.."'")
end

-- Retrieve the value of a cutscene global variable
--
function _GetCutsceneGlobal(t, k)
	local v
	
	v = rawget(_CutsceneGlobals, k)
	if (v ~= nil) then
		return v
	else
			--continue to allow access to mission globals
		if (In_mission) then
			v = rawget(_MissionGlobals, k)
			
			if (v~=nil) then
				return v
			end
		end
	
		error("attempted to read undefined cutscene global variable '"..k.."'")
	end
end

-- Define a new cutscene global variable. Cutscene global variables are tracked so they can be released when the cutscene
-- finishes.
--
function _AddCutsceneGlobal(t, k, v)
	_CatchNilAssignment(_CutsceneGlobals, k, v)
end

-- Prepare to read cutscene global variables. Cutscene global variables are tracked so they can be release when the cutscene
-- finishes.
--
function _PrepareCutsceneGlobals()
	setmetatable(_UGGlobals, {__index = _GetCutsceneGlobal, __newindex = _AddCutsceneGlobal})
end

function _GetMissionGlobal(t, k)
	local v
	
	v = rawget(_MissionGlobals, k)
	if (v ~= nil) then
		return v
	else
		error("attempted to read undefined mission global variable '"..k.."'")
	end
end

function _AddMissionGlobal(t, k, v)
	_CatchNilAssignment(_MissionGlobals, k, v)
end

-- Unload all cutscene global variables
--
function _UnloadCutsceneGlobals()
	_CutsceneGlobals = {}
	
	if (In_mission) then
		setmetatable(_UGGlobals, {__index = _GetMissionGlobal, __newindex = _AddMissionGlobal})
	else
		setmetatable(_UGGlobals, {__index = _CatchUndefinedGlobalRead, __newindex = _CatchUndefinedGlobalWrite})
	end
end


function _PrepareMissionGlobals()
	setmetatable(_UGGlobals, {__index = _GetMissionGlobal, __newindex = _AddMissionGlobal})
	In_mission = true
end

function _UnloadMissionGlobals()
	_MissionGlobals = {}
	setmetatable(_UGGlobals, {__index = _CatchUndefinedGlobalRead, __newindex = _CatchUndefinedGlobalWrite})
	In_mission = false
end

--------------------
-- Script Actions --
--------------------

function spawning_peds(enable)
	spawning_pedestrians(enable)
end

function spawning_cars(enable)
	spawning_vehicles(enable)
end

-- Add an activity to the game
--
-- activity_name:		game side name of the activity type
-- region_name:			name of the specific region
-- navpoint_name:		name of the navpoint where the activity should be activated
-- cutscene_function_name:	name of the cutscene function to play when first starting the activity
-- use_message:			(optional) usage message to display at the trigger
--
function activity_add(activity_name, region_name, navpoint_name, cutscene_funtion_name, use_message)
	--activity_add_do(activity_name, region_name, navpoint_name, cutscene_funtion_name, use_message)
end

function pause_menu_objective_add( tag, string1, string2 )
	if (string1 == nil) then
		string1 = ""
	end
	
	if (string2 == nil) then
		string2 = ""
	end
	
	return pause_menu_objective_add_do( tag, string1, string2 )
end

-- Cause a character to attack another character
--
-- attacker:	name of attacker
-- target:		(optional) name of target (if not specified, player is the target)
-- yield:		(optional) set to true to yield until attack is finished
--
function attack(attacker, ...)
	local target, yield
	
	if (arg.n > 0) then
		target = arg[1]

		if (arg.n > 1) then
			yield = arg[2]
		else
			yield = false
		end
	else
		target = "#PLAYER#"
		yield = false
	end
	
	if (yield) then	
		if (not(attack_do(attacker, target))) then
			return
		end
		while (not(attack_check_done(attacker, target))) do
			thread_yield()
		end
	else
		attack_do(attacker, target)
	end
end

-- Play a riff of 2D audio
--
-- audio_name:		name of audio to play
-- type_name:		(optional) name of audio type
--										foley
--										voice
--										music
--										ambient
-- for_cutscene:	play for a cutscene
--
-- returns:		audio instance handle
--
function audio_play(audio_name, ...)
	-- play a foley by default
	local type_name = "foley"
	local for_cutscene = false
	
	if (arg.n > 0) then
		type_name = arg[1]
		if (arg.n > 1) then
			for_cutscene = arg[2]
		end
	end
	
	local handle = audio_play_do(audio_name, type_name, for_cutscene, false)
	
	if ((arg.n < 3) or (not arg[3])) then
		return handle;
	end
	
	while (audio_is_playing(handle)) do
		thread_yield()
	end
	
	return -1;
end

-- Play a cellphone ring... and conversation
--		doesn't put put a "press Y to..." message
--    rings 2* and then plays conversation.
--    Also animates the player
-- ring_name:		name of ring tone from foley.xtbl
-- conv_name:		name of the conversation from the voice.xtbl
--
function audio_play_for_cellphone_force(ring_name, conv_name )

	audio_play(ring_name, "foley", false, true)
	delay(0.5)
	audio_play(ring_name, "foley", false, true)
	delay(0.5)
	cell_phone_animate_start_do()
	audio_play_for_character(conv_name, "#PLAYER#", "voice", false, true)
	cell_phone_animate_stop_do()

end


-- Play a cellphone ring... and conversation
--
-- ring_name:		name of ring tone from foley.xtbl
-- num_rings:		number or ring tones in one phone call
-- ring_interval:	number of seconds between ring tones
-- ring_passive:	number of minutes before the call happens again if not answered
-- conv_name:		name of the conversation from the voice.xtbl
-- speaker_id:		name of the speaker ( plain english )
-- mission_interrupt:	can this call interrupt a mission
-- begin_name:		(optional) registered function to execute at the beginning of the conversation
-- end_name:		(optional) registered function to execute at the end of the conversation
--
-- NOTE: the begin_name and end_name functions are registered through the "cellphone_register" function.
--			This should be done once in the init function for the script.
--
function audio_play_for_cellphone(ring_name, num_rings, ring_interval, ring_passive, conv_name, speaker_id, mission_interrupt, ...)
	local begin, ending
	
	if (arg.n > 0) then
		begin = arg[1]
		if (arg.n > 1) then
			ending = arg[2]
		else
			ending = ""
		end
	else
		begin = ""
		ending = ""
	end
	
	audio_play_for_cellphone_do(ring_name, num_rings, ring_interval, ring_passive, conv_name, speaker_id, mission_interrupt, begin, ending)
end

-- Play a persona line for a NPC
--
-- npc_name:			NPC speaking the line
-- situation_name:	persona situation to play for foley for
-- distance:			(optional) distance that the voice can be heard (0 = short, 1 = normal, 2 = long, 3 = extreme)
--
function audio_play_persona_line(npc_name, situation_name, ...)
	local distance = -1;

	if (arg.n > 0) then
		distance = arg[1]
	end

	audio_play_persona_line_do(npc_name, situation_name, distance)
end

-- Adds a cell phone message to the messages log
-- Displays nothing
--
-- message_id:			localization ID of the conversation ( audio filename from voice.xtbl )
-- speaker_name:		name of the speaker ( plain english )
--
-- NOTE: the begin_name and end_name functions are registered through the "cellphone_register" function.
--			This should be done once in the init function for the script.
--
function cellphone_add_message( message_id, speaker_name )

	cellphone_add_message_do( message_id, speaker_name )
end


-- Play a riff of 3D audio on a character
--
-- audio_name:		name of audio to play
-- human_name:		name of character to play audio on
-- type_name:		(optional) name of audio type
--										foley
--										voice
--										music
--										ambient
-- for_cutscene:	play for a cutscene
--
-- returns:			audio instance handle
--
function audio_play_for_character(audio_name, human_name, ...)
	local type_name = "foley"
	local for_cutscene = false
	local blocking = false
	local variant = -1
	local voice_distance = -1
	
	if (is_dead(human_name)) then
		return -1, 0
	end
	
	if (arg.n > 0) then
		type_name = arg[1]

		if (arg.n > 1) then
			for_cutscene = arg[2]

			if (arg.n > 2) then
				blocking = arg[3]

				if (arg.n > 3) then
					variant = arg[4]

					if (arg.n > 4) then
						voice_distance = arg[5]
					end
				end
			end
		end
	end
	
	local handle, play_time = audio_play_for_character_do(audio_name, human_name, type_name, for_cutscene, blocking, variant, voice_distance)

	if (not(blocking)) then
		return handle, play_time;
	end
	
	if (handle > 0) then
		while (audio_is_playing(handle)) do
			thread_yield()
		end
	else
		delay( play_time )
	end
	
	return -1, 0
end

-- Play a riff of 3D audio on a mesh
--
-- audio_name:		name of audio to play
-- mesh_name:		name of mesh to play sound on
-- type_name:		(optional) name of audio type
--										foley
--										voice
--										music
--										ambient
-- for_cutscene:	play for a cutscene
--
-- returns;		audio instance handle
--
function audio_play_for_mesh(audio_name, chunk_name, mesh_name, ...)
	local c_obj_index = -1
	local mesh_index = -1
	local type_name = "foley"
	local for_cutscene = false
	
	if (arg.n > 0) then
		type_name = arg[1]
		if (arg.n > 1) then
			for_cutscene = arg[2]
		end
	end
	
	c_obj_index, mesh_index = mesh_get_index(chunk_name, mesh_name)

	return audio_play_for_mesh_do(audio_name, c_obj_index, mesh_index, type_name, for_cutscene)
end

function audio_play_for_mover( audio_name, script_mover, type_name, blocking, for_cutscene )
	if (for_cutscene == nil) then
		for_cutscene = false
	end
	
	if (type_name == nil) then
		type_name = "foley"
	end
	
	if (blocking == nil) then
		blocking = false
	end
	
	local handle = audio_play_for_mover_do( audio_name, script_mover, type_name, for_cutscene )
	
	thread_new( "audio_update_mover_pos_loop", handle, script_mover )
	
	if (not blocking) then
		return handle
	end
	
	if (handle > 0) then
		while (audio_is_playing(handle)) do
			thread_yield()
		end
	end
	
	return -1
end

function audio_update_mover_pos_loop(handle, script_mover)

	while( audio_is_playing( handle ) ) do
		audio_update_mover_pos( handle, script_mover )
		thread_yield()
	end

end

-- Play a riff 3D audio at a navpoint
--
-- audio_name:		name of audio to play
-- navpoint_name:	name of navpoint to play sound at
-- type_name:		(optional) name of audio type
--										foley
--										voice
--										music
--										ambient
-- for_cutscene:	play for a cutscene
--
-- returns;		audio instance handle
--
function audio_play_for_navpoint(audio_name, navpoint_name, ...)
	local type_name = "foley"
	local for_cutscene = false
	
	if (arg.n > 0) then
		type_name = arg[1]
		if (arg.n > 1) then
			for_cutscene = arg[2]
		end
	end
	
	return audio_play_for_navpoint_do(audio_name, navpoint_name, type_name, for_cutscene)
end

-- Return camera movement to default behavior
--
-- snap:	(optional) set to true to jump directly to default position, else set to false
--
function camera_begin_script(script_name, ...)
	local yield

	if (arg.n > 0) then
		yield = arg[1]
	else
		yield = false
	end

	camera_begin_script_do(script_name)

	if (yield) then	
		while (not(camera_script_is_finished())) do
			thread_yield()
		end
	end
end

-- Return camera movement to default behavior
--
-- snap:	(optional) set to true to jump directly to default position, else set to false
--
function camera_end_script(...)
	local snap

	if (arg.n > 0) then
		snap = arg[1]
	else
		snap = true
	end
	
	camera_end_script_do(snap)
end

-- Smoothly move the camera to look through the specified navpoint
--
-- navp:			navpoint to look through
-- duration:	duration of movement
--
function camera_look_through(navp, ...)
	local duration
	local yield
	
	if (arg.n > 0) then
		duration = arg[1]
		if (arg.n > 1) then
			yield = arg[2]
		else
			yield = false
		end
	else
		duration = 0
		yield = false
	end
	
	camera_look_through_do(navp, duration)

	if (yield) then	
		while (not(camera_script_is_finished())) do
			thread_yield()
		end
	end
end

-- Init car carrier boss ai
--
-- name: NPC boss in car carrier
--
function car_carrier_boss_ai_init(name, ...)
	local player = "#PLAYER#"
	
	car_carrier_boss_ai_init_do(name, player)
end

-- Car combat against the player
--
-- name:	NPC chasing the player
--
function car_combat(name, ...)
	local player
	
	if (arg.n > 0) then
		player = arg[1]
	else
		player = "#PLAYER#"
	end
	
	if (car_combat_do(name)) then
		while (not(car_combat_check_done(name, player))) do
			thread_yield()
		end
	end
end

-- Destroys any item the player is carrying
--
-- player: (optional) player to check for item
--
function carried_item_destroy(player)
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	carried_item_destroy_do(player)
end

-- Drops any item the player is carrying
--
-- player: (optional) player to check for item
--
function carried_item_drop(player)
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	carried_item_drop_do(player)
end

-- Checks to see if player is carrying an item
--
-- item: (optional) item to check for, nil to check for any item
-- player: (optional) player to check for item
--
-- returns: true if item is found, false otherwise
--
function carried_item_is_carrying(item, player)
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	return carried_item_is_carrying_do(item, player)
end

-- Player picks up the item
--
-- item: item to pick up
-- player: (optional) player to pick up item
--
function carried_item_pickup(item, player)
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	carried_item_pickup_do(item, player)
end

-- Give cash to a player
--
-- amount:	Amount of cash to give to the player
-- player:	(optional) Player to give cash to
--
function cash_add(amount, ...)
	local player
	
	if (arg.n > 0) then
		player = arg[1]
	else
		player = "#PLAYER#"
	end
	
	cash_add_do(amount, player)
end

-- Removes cash from a player
--
-- amount:	Amount of cash to give to the player
-- player:	(optional) Player to remove cash from
--
function cash_remove(amount, ...)
	local player
	
	if (arg.n > 0) then
		player = arg[1]
	else
		player = "#PLAYER#"
	end
	
	cash_remove_do(amount, player)
end

-- Flags an npc group to respawn for co-op
--
-- group: 		name of NPC group
-- delay:		(optional) delay in seconds before the NPCs respawn, defaults to 5 sec
--
function character_ignite(name, damaging)
	if (damaging == nil) then
		damaging = true
	end
	
	character_ignite_do(name, damaging)
end

function character_ragdoll( name, time )
	npc_ragdoll( name, time )
end

-- Flags an npc group to respawn for co-op
--
-- group: 		name of NPC group
-- target:		name of NPC or #PLAYER1#/#PLAYER2#
-- delay:		(optional) delay in seconds before the NPCs respawn, defaults to 5 sec
--
function coop_create_hunter_group(group, target, delay)
	if (delay == nil) then
		delay = 5
	end
	
	coop_create_hunter_group_do(group, target, delay)
end

-- Display full credits
--
function credits_full_roll(fade_at_end)

	if (fade_at_end == nil) then
		fade_at_end = false
	end

	credits_full_roll_do(fade_at_end)

	-- since the above call pauses the game we only need to yield the thread
	-- it won't return until the game is unpaused, i.e. when credits are done
	thread_yield();
end

-- Display abbreviated credits
--
function credits_abbr_roll()
	credits_abbr_roll_do()
	
	-- since the above call pauses the game we only need to yield the thread
	-- it won't return until the game is unpaused, i.e. when credits are done
	thread_yield();
end

-- Play a cutscene
--
-- name:	name of cutscene to play
--
function cutscene_play(name, group_name)	
	if (group_name == nil) then
		group_name = ""
	end

	cutscene_play_do(name, group_name)
	while (not(cutscene_play_check_done())) do
		thread_yield()
	end
end

-- Intro for a cutscene
--
function cutscene_in(cutscene_name)

	if ( is_dead("#PLAYER#") ) then
		return
	end

	fade_out(1.0)
	fade_out_block()
end

-- Outtro from a cutscene
--
function cutscene_out()
	fade_in(0.5)
	fade_in_block()
end

-- Spawn a group
--
-- name: Name of the group to spawn
-- block (optional, default false): Don't continue this thread until they're all streamed in.  Yield to other threads.
--
function create_group(name, block)
	if (block == nil) then
		block = false
	end
	
	create_group_do(name)

	local handle = thread_new("create_group_check_done_loop",name)

	while(block and not thread_check_done(handle)) do
		thread_yield()
	end
end

function group_create(name, block)
	create_group(name, block)
end

function group_destroy(name)
	destroy_group(name)
end

function create_group_check_done_loop(name)
	while (not(create_group_check_done(name))) do
		thread_yield()
	end
end

-- Turn the hud bar on
--
-- obj_name: the object whose damage we want to show.
-- min_percent: what percent we want to consider "empty" for the bar.
-- label_text: if non-nil, the label before the hud bar.
-- bar_time_when_full_sec: if non-nil, the number of seconds "full" on the bar corresponds to; used to enable sound when the bar is near empty.
-- 
function damage_indicator_on(obj_name, min_percent, label_text, bar_time_when_full_sec)
	if label_text == nil then
		label_text = ""
	end
	if bar_time_when_full_sec == nil then
		bar_time_when_full_sec = 0
	end

	damage_indicator_on_do(obj_name, min_percent, label_text, bar_time_when_full_sec)
end

-- Delay execution for a certain amount of time
--
-- duration:	duration of delay, in seconds (if time_seconds <= 0, execution will delay for exactly one frame)
--
function delay(duration)
	local elapsed_time = 0.0
	repeat
		thread_yield()
		elapsed_time = elapsed_time + delay_do()
	until (delay_check_done(elapsed_time, duration))
end

-- Open drawbridge
--
-- open angle:  maximum angle of bridge with horizontal in degrees
-- open time:   time to open to max angle
--
function drawbridge_open(open_angle, open_time)
	drawbridge_open_do(open_angle, open_time)
end

-- Force drawbridge opened
--
-- open angle:  angle of bridge with horizontal in degrees
--
function drawbridge_force_open(open_angle)
	drawbridge_force_opened_do(open_angle)
end

-- Close drawbridge
--
function drawbridge_force_closed()
	drawbridge_force_closed_do()
end

-- Returns the frame time of the last frame
--
-- returns:	frame time in seconds
--
function get_frame_time()
	return delay_do()
end

-- Perform fullscreen fade-out
--
-- duration:	duration of fade-out, in seconds
-- color:		(optional) color to fade to
--
function fade_out(duration, ...)
	local r, g, b

	if (arg.n > 0) then
		r = arg[1][1]
		g = arg[1][2]
		b = arg[1][3]
	else
		r = 0
		g = 0
		b = 0
	end

	fade_out_do(duration, r, g, b)
end

function fade_out_block()
	while( fade_get_percent() < 1.0 ) do
		thread_yield()
	end
	
	thread_yield()
end

function fade_in_block()
	while( fade_get_percent() > 0.0 ) do
		thread_yield()
	end
	
	thread_yield()
end

-- Make an NPC flee
--
-- flee_person:  The person who's going to flee
-- flee_from:    The person they're supposed to flee from
--
function flee(flee_person, flee_from, force_cower, ignore_distance)
	if (flee_from == nil) then
		flee_from = "#PLAYER#"
	end
	if (force_cower == nil) then
		force_cower = false
	end
	if (ignore_distance == nil) then
		ignore_distance = false
	end
	flee_do(flee_person, flee_from, force_cower, ignore_distance)
end

-- Make a NPC flee to a navpoint
--
-- flee_person:	NPC that is fleeing
-- flee_navpoint:	navpoint to flee to
-- flee_from:		(optional) human the NPC is fleeing from, only used once the NPC reaches the navpoint (defaults to "#PLAYER#")
-- force_cower:	(optional) set to true to force the NPC use cower run (defaults to false)
--
function flee_to_navpoint(flee_person, flee_navpoint, flee_from, force_cower)
	if (flee_from == nil) then
		flee_from = "#PLAYER#"
	end
	if (force_cower == nil) then
		force_cower = false
	end
	flee_to_navpoint_do(flee_person, flee_navpoint, flee_from, force_cower)
end

-- Make a NPC fire at a navpoint
--
-- name:					NPC that is firing
-- fire_at_navpoint:	navpoint to fire at
-- fire_once:			(optional) set to true to only fire once at the navpoint
--
function force_fire(name, fire_at_navpoint, ...)
	local fire_once
	if (arg.n > 0) then
		fire_once = arg[1]
	else
		fire_once = false
	end

	if (force_fire_do(name, fire_at_navpoint, fire_once)) then
		while (not(force_fire_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a NPC fire at a target
--
-- name:					NPC that is firing
-- fire_at_target:	target to fire at
-- fire_once:			(optional) set to true to only fire once at the navpoint
--
function force_fire_target(name, fire_at_target, ...)
	local fire_once
	if (arg.n > 0) then
		fire_once = arg[1]
	else
		fire_once = false
	end

	if (force_fire_target_do(name, fire_at_target, fire_once)) then
		while (not(force_fire_target_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a NPC throw a grenade at a navpoint
--
-- name:						NPC that is throwing
-- throw_at_navpoint:	navpoint to throw at
-- throw_pitch:			pitch to throw at
-- throw_speed:			(optional) speed to throw the grenade at
--
function force_throw(name, throw_at_navpoint, throw_pitch, ...)
	local throw_speed
	if (arg.n > 0) then
		throw_speed = arg[1]
	else
		throw_speed = -1
	end

	if (force_throw_do(name, throw_at_navpoint, throw_pitch, throw_speed)) then
		while (not(force_throw_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a NPC throw a grenade at a character
--
-- name:						NPC that is throwing
-- throw_at_navpoint:	navpoint to throw at
-- throw_pitch:			pitch to throw at
--
function force_throw_char(name, throw_at_navpoint, throw_pitch)
	if (force_throw_char_do(name, throw_at_navpoint, throw_pitch)) then
		while (not(force_throw_check_done(name))) do
			thread_yield()
		end
	end
end

-- Turn the hud bar on
--
-- skin_name: determines the color of the bar, and label if label_text is nil.
-- label_text: if non-nil, the label before the hud bar.
-- bar_time_when_full_sec: if non-nil, the number of seconds "full" on the bar corresponds to; used to enable sound when the bar is near empty.
-- 
function hud_bar_on(skin_name, label_text, bar_time_when_full_sec)
	if label_text == nil then
		label_text = ""
	end
	if bar_time_when_full_sec == nil then
		bar_time_when_full_sec = 0
	end

	hud_bar_on_do(skin_name, label_text, bar_time_when_full_sec)
end

-- time_in_ms: time left (in ms)
-- function_name: (optional) function to call when timer expires
-- enable_sound: (optional, defualt=true) whether to make noise as timer runs out.
function hud_timer_set(time_in_ms, function_name, enable_sound)
	if function_name == nil then
		function_name = ""
	end
	if enable_sound == nil then
		enable_sound = true
	end

	hud_timer_set_do(time_in_ms, function_name, enable_sound)
end

-- Makes a human a priority target for NPC AI targeting
--
-- human_name: name of human to make a priority
-- is_priority: true if priority, false if not
-- distance_override: (optional) any target closer than this distance to the NPC overrides the priority in favor of the closer target
-- Note: distance override not used when is_priority is false
--
function human_make_priority_target(human_name, is_priority, distance_override)
	if distance_override == nil then
		distance_override = 0
	end
	
	human_make_priority_target_do(human_name, is_priority, distance_override)
end

-- Wait for the human's resources to be loaded.
--
-- name:	Name of the human.
--
function human_wait_for_loaded_resource(name)
	while (not(human_check_resource_loaded(name))) do
		thread_yield()
	end
end

-- Checks if the player has the specified item
--
-- item_name:	name of item to check
-- player:		(optional) player to check inventory of
--
function inv_have_item(item_name, player) 
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	return inv_have_item_do(item_name, player)
end

-- Add an item to the player's inventory
--
-- item_name:	name of item to give
-- count:		(optional) number of the item to give (default = 1)
-- player:		(optional) player to add item to (default = "#PLAYER#")
--
function inv_item_add(item_name, count, player)
	if (count == nil) then
		count = 1
	end
	
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	if (type(item_name) == "table" ) then
		local size = item_name.n
		
		if (size == nil) then
			size = sizeof_table(item_name)
		end
		
		for x=1, size, 1 do
			inv_item_add_do(item_name[x], count[x], player)
		end
		
		return
	
	end
	
	inv_item_add_do(item_name, count, player)
end

-- Equips the specified item if it's in the player's inventory
--
-- item_name:	name of item to equip
-- player:		(optional) player to equip item on
--
function inv_item_equip(item_name, player)
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	inv_item_equip_do(item_name, player)
end

function inv_item_get_all(char_name)
	if (char_name == nil) then
		char_name = "#PLAYER#"
	end
	
	local item_table = { inv_item_get_all_do(char_name) }
	local ammo_table = { inv_item_get_all_ammo_do(char_name) }

	return item_table, ammo_table
end

-- Check if the specified item is currently equipped 
--
-- item_name:	name of item to check
-- player:		(optional) player to check
--
function inv_item_is_equipped(item_name, player)
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	return inv_item_is_equipped_do(item_name, player)
end

-- Remove an item from the player's inventory
--
-- item_name:	name of item to give
-- count:		(optional) number of the item to remove (default = 1)
-- player:		(optional) player to remove item to (default = "#PLAYER#")
--
function inv_item_remove(item_name, count, player)
	if (count == nil) then
		count = 1
	end
	
	if (player == nil) then
		player = "#PLAYER#"
	end
	
	inv_item_remove_do(item_name, count, player)
end

function inv_item_remove_all( name )

	if (name == nil) then
		name = "#PLAYER#"
	end
	
	inv_item_remove_all_do( name )
end

function is_hood_owner( hood_name, ... )

	if( arg.n > 0 ) then
		return is_hood_owner_do( hood_name, arg[1] )
	end
		
	return is_hood_owner_do( hood_name, "Playas" )
end

function is_mission_active( name )

	if (name == nil) then
		name = ""
	end
	
	return is_mission_active_do( name )
end

-- Fade in letterbox mode
--
-- immediate:	(optional) set to true to fade in immediately and completely
--
function letterbox_fade_in(...)
	local immediate
	
	if (arg.n > 0) then
		immediate = arg[1]
	else
		immediate = false
	end
	
	letterbox_fade_in_do(immediate)
end

-- Fade out letterbox mode
--
-- immediate:	(optional) set to true to fade out immediately and completely
--
function letterbox_fade_out(...)
	local immediate
	
	if (arg.n > 0) then
		immediate = arg[1]
	else
		immediate = false
	end
	
	letterbox_fade_out_do(immediate)
end

-- Load a level
--
-- level_name:				name of level to load
-- player_start_name:	(optional) name of player start to use
--
function level_load(level_name, ...)
	local player_start_name
	
	if (arg.n > 0) then
		player_start_name = arg[1]
	else
		player_start_name = ""	
	end
	
	level_load_do(level_name, player_start_name)
end

-- Load a chunk.
--
-- chunk_name:		Name of the chunk to load.
-- blocking:		(DEFAULT: true) True if the load should block.
--
function load_chunk(chunk_name, ...)
	if (arg.n > 0) then
		load_chunk_do(chunk_name, arg[1])
	else
		load_chunk_do(chunk_name, true)
	end
end

-- Load a pair of chunks, one blocking and one streaming.
--
-- block_name:		Name of the chunk to block load.
-- stream_name:		Name of the chunk to stream in.
--
function load_chunks(block_name, stream_name)
	load_chunks_do(block_name, stream_name)
end

-- Check line of sight between two human-types
--
-- name_one, name_two:  Names of the people to check los between
--
function los_check(name_one, name_two)
	local retval = false
	local current_los_result = -1
	local num_retries = 0
	-- It's possible for the los check to continually get deleted intead of processed
	-- For example, if one of the humans is hidden.  So only try re-issuing 100 times.
	while (current_los_result == -1 and num_retries < 100) do
		current_los_result = los_check_do(name_one, name_two)
		thread_yield()
		num_retries = num_retries + 1
	end
	if (current_los_result == 0) then
		return false
	end
	if (current_los_result == 1) then
		return true
	end
	return false
end

-- Display a message in the HUD
-- (Multiplayer) displays message to all players by default unless player specified
--
-- msg:			message to display
-- duration:	(optional) duration to display message, in seconds
-- pname:		(optional, multiplayer) player name to display name to
function message(msg, ...)
	local duration
	local player
	
	if (arg.n > 0) then
		duration = arg[1]
	
		if (arg.n > 1) then
			player = arg[2]
		else
			player = "#PLAYER#"
		end
	else
		duration = 2.0
		player = "#PLAYER#"
	end

	message_do(msg, duration, player)
end

-- Adds a minimap icon to an item
--
-- name: name of item
-- bitmap_name: name of minimap icon file
-- is_critical: (optional) flag for if icon is critical
-- bitmap_glow_name: (optional) name of minimap icon glow file
--
function minimap_icon_add_item(name, bitmap_name, is_critical, bitmap_glow_name)
	if is_critical == nil then
		is_critical = false
	end
	
	if bitmap_glow_name == nil then
		bitmap_glow_name = ""
	end	
	
	minimap_icon_add_item_do(name, bitmap_name, is_critical, bitmap_glow_name)
end 

-- Adds a minimap icon to a navpoint
--
-- name: name of navpoint
-- bitmap_name: name of minimap icon file
-- is_critical: (optional) flag for if icon is critical
-- bitmap_glow_name: (optional) name of minimap icon glow file
--
function minimap_icon_add_navpoint(name, bitmap_name, is_critical, bitmap_glow_name)
	if is_critical == nil then
		is_critical = false
	end
	
	if bitmap_glow_name == nil then
		bitmap_glow_name = ""
	end	
	
	minimap_icon_add_navpoint_do(name, bitmap_name, is_critical, bitmap_glow_name)
end 

-- Adds a minimap icon to an NPC
--
-- name: name of NPC
-- bitmap_name: name of minimap icon file
-- is_critical: (optional) flag for if icon is critical
-- bitmap_glow_name: (optional) name of minimap icon glow file
--
function minimap_icon_add_npc(name, bitmap_name, is_critical, bitmap_glow_name)
	if is_critical == nil then
		is_critical = false
	end
	
	if bitmap_glow_name == nil then
		bitmap_glow_name = ""
	end	
	
	minimap_icon_add_npc_do(name, bitmap_name, is_critical, bitmap_glow_name)
end 

-- Adds a minimap icon to a trigger
--
-- name: name of trigger
-- bitmap_name: name of minimap icon file
-- is_critical: (optional) flag for if icon is critical
-- bitmap_glow_name: (optional) name of minimap icon glow file
--
function minimap_icon_add_trigger(name, bitmap_name, is_critical, bitmap_glow_name)
	if is_critical == nil then
		is_critical = false
	end
	
	if bitmap_glow_name == nil then
		bitmap_glow_name = ""
	end
	
	minimap_icon_add_trigger_do(name, bitmap_name, is_critical, bitmap_glow_name)
end 

-- Adds a minimap icon to a vehicle
--
-- name: name of vehicle
-- bitmap_name: name of minimap icon file
-- is_critical: (optional) flag for if icon is critical
-- bitmap_glow_name: (optional) name of minimap icon glow file
--
function minimap_icon_add_vehicle(name, bitmap_name, is_critical, bitmap_glow_name)
	if is_critical == nil then
		is_critical = false
	end
	
	if bitmap_glow_name == nil then
		bitmap_glow_name = ""
	end	
	
	minimap_icon_add_vehicle_do(name, bitmap_name, is_critical, bitmap_glow_name)
end 

-- Adds a minimap icon to a mover
--
-- name: name of vehicle
-- bitmap_name: name of minimap icon file
-- is_critical: (optional) flag for if icon is critical
-- bitmap_glow_name: (optional) name of minimap icon glow file
--
function minimap_icon_add_mover(name, bitmap_name, is_critical, bitmap_glow_name)
	if is_critical == nil then
		is_critical = false
	end
	
	if bitmap_glow_name == nil then
		bitmap_glow_name = ""
	end	
	
	minimap_icon_add_mover_do(name, bitmap_name, is_critical, bitmap_glow_name)
end 

function mission_add(mission_name, unlock_function, cleanup_function, navpoint, start_function, minimap_icon_name, cash_award, respect_award, repect_cost, ...)
	local optional_functions = {nil,nil}
	local x
	
	for x=1,arg.n,1 do
		optional_functions[x] = arg[x]
	end
	
	mission_add_do(mission_name, unlock_function, cleanup_function, navpoint, start_function, minimap_icon_name, cash_award, respect_award, repect_cost, optional_functions[1], optional_functions[2])
--	mission_set_display_name( mission_name, mission_name.."_display_name" )
-- unneeded. mission_add takes care of this
end

function mission_add_triggerless(mission_name, unlock_function, cleanup_function, start_function, cash_award, respect_award, respect_cost, ...)
	local optional_functions = {nil,nil}
	local x
	
	for x=1,arg.n,1 do
		optional_functions[x] = arg[x]
	end
	
	mission_add_triggerless_do(mission_name, unlock_function, cleanup_function, start_function, cash_award, respect_award, respect_cost, optional_functions[1], optional_functions[2])
end

function mission_debug(msg, ...)
	local optional_params = {2.0,-1}
	
	for x=1,arg.n,1 do
		optional_params[x] = arg[x]
	end
	
	return mission_debug_do(msg, optional_params[1], optional_params[2])
end

-- Generates a mission help message from string table
-- Also updates Objectives screen
--
function mission_help_table(tag, ...)
	local optional_params = {"", "" };
	
	for x=1, arg.n, 1 do
		optional_params[x] = arg[x]
	end
	
	mission_help_table_do(tag, 1, optional_params[1], optional_params[2])
end

-- Generates a mission help nag message from string table
-- Doesn't update Objectives screen
--
function mission_help_table_nag(tag, ...)
	local optional_params = {"", "" };
	
	for x=1, arg.n, 1 do
		optional_params[x] = arg[x]
	end
	
	mission_help_table_do(tag, 0, optional_params[1], optional_params[2])
end

-- Generates a mission help nag message from string table
-- Doesn't update Objectives screen
--
function mp_chat_msg(tag, ...)
	local optional_params = {"",""}

	for x=1, arg.n, 1 do
		optional_params[x] = arg[x]
	end
	
	mp_chat_msg_do(tag, optional_params[1], optional_params[2])
end

-- Do arithemetic modulo operatation
--
-- a:			first operand
-- b:			second operand
--
-- returns:	a mod b
--
function mod(a, b)
	return mod_do(a, b)
end

-- Make a human move to a destination
-- 
-- name:					name of the human
-- dest:					name of destination navpoint(s)
-- speed:				(optional) movement speed (1 = walk, 2 = run, 3 = sprint; default = 1)
-- retry_on_failure:	(optional) set to true to keep retrying if path calculation fails (default = false)
-- move_and_fire:		(optional) set to true to allow the NPC to fire on the move (default = false)
--
function move_to(name, ...)
	local num_args, speed, retry_on_failure, move_and_fire

	-- Wait until the resource is loaded.
	human_wait_for_loaded_resource(name)
			
	num_args = arg.n

	-- get move and fire
	if ( (num_args > 3) and (type(arg[num_args]) == "boolean") ) then
		move_and_fire = arg[num_args]
		num_args = num_args - 1
	else
		move_and_fire = false
	end

	-- get retry
	if ( (num_args > 2) and (type(arg[num_args]) == "boolean") ) then
		retry_on_failure = arg[num_args]
		num_args = num_args - 1
	else
		retry_on_failure = false
	end
	
	-- get speed
	if ( (num_args > 1) and (type(arg[num_args]) == "number") ) then
		speed = arg[num_args]
		num_args = num_args - 1
	else
		speed = 1
	end
	
	while( not human_is_ready( name ) ) do
		thread_yield()
	end
	
	-- for each argument (not including the optional speed argument)
	for i = 1, num_args, 1 do
		local arg_val, arg_type
		
		arg_val = arg[i]
		arg_type = type(arg_val)
		if (arg_type == "table") then
			local j
			
			j = 1
			while (arg_val[j] ~= nil) do
				if (move_to_do(name, arg_val[j], speed, retry_on_failure, move_and_fire)) then
					while(not(move_to_check_done(name, arg_val[j], speed, retry_on_failure, move_and_fire))) do
						thread_yield()
					end
					
					j = j + 1
				else
					return false
				end
			end					
		elseif (arg_type == "string") then
			if (move_to_do(name, arg_val, speed, retry_on_failure, move_and_fire)) then
				while(not(move_to_check_done(name, arg_val, speed, retry_on_failure, move_and_fire))) do
					thread_yield()
				end
			else
				return false
			end
		end
	end
	
	return true
end

function notoriety_spawn_count( gang_name, type_filter )
	if( gang_name == nil ) then
		gang_name = "All"
	end
	
	if( type_filter == nil ) then
		type_filter = "All"
	end

	return notoriety_spawn_count_do( gang_name, type_filter )
end

function notoriety_reset_vehicle_count( gang_name )
	notoriety_set_desired_vehicle_count( gang_name, -1 )
end

function npc_leash_to_nav( npc, nav, distance )
	if (distance == nil) then
		distance = -1
	end
	
	npc_leash_to_nav_do( npc, nav, distance )
end

function on_notoriety_event( function_name, player_name )

	if( player_name == nil ) then
		player_name = "#PLAYER#"
	end

	on_notoriety_event_do( function_name, player_name )

end

function open_player_creation()
	open_player_creation_do()
	
	while (player_creation_is_open_do()) do
		thread_yield()
	end
end

function player_creation_set_opening()
	player_creation_set_opening_do()
end

function objective_text(tag, ...)
	local optional_params = {"", "" };
	
	for x=1, arg.n, 1 do
		optional_params[x] = arg[x]
	end
	
	objective_text_do(tag, optional_params[1], optional_params[2])
end

function on_random_human_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 1 )
end

function on_random_mover_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 2 )
end

function on_random_vehicle_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 3 )
end

-- Add members to the player's party
--
-- name:	name of NPC to add to player's party
--
function party_add(...)
	party_add_do(arg)
end

function party_add_optional(...)
	party_add_optional_do(arg)
end

-- Dismiss members from the player's party
--
-- name:	name of NPC to dismiss from player's party
--
function party_dismiss(...)
	party_dismiss_do(arg)
end

function persona_override_human_start(human, situation, audio, count)

	if (count == nil) then
		count = -1
	end
	
	if (audio == nil) then
		audio = ""
	end
	
	persona_override_human_start_do( human, situation, audio, count )

end

function persona_override_persona_start(persona, situation, audio, count)

	if (count == nil) then
		count = -1
	end
	
	if (audio == nil) then
		audio = ""
	end
	
	persona_override_persona_start_do( persona, situation, audio, count )

end

function play_action_or_state( npc, name )
	if (is_animation_state( name )) then
		set_animation_state( npc, name )
		
		while (not(play_action_check_done(npc, 1))) do
			thread_yield()
		end
	else
		play_action( npc, name )
	end
end

function play_action_sequence_table( name, table )

	local size = table.n
	
	if (size == nil) then
		size = sizeof_table( table )
	end
	
	for x=1, size, 1 do
		local data = table[x]
		local typename = type(data)
		
		if (typename == "number") then
			delay( data )
		elseif (typename == "table") then
			play_action_sequence_table( data )
		else
			play_action_or_state( name, data )
		end
	end

end

function play_action_sequence( name, ... )
	play_action_sequence_table( name, arg )
end

function play_action_sequence_thread( name, ... )
	thread_new( "play_action_sequence_table", name, arg )
end

-- Make a human play an animation
--
-- name:			name of human
-- anim_name:	name of animation to play
--
function play_action(name, anim_name, ...)
	local r, g

	if (arg.n > 0) then
		r = arg[1]

		if (arg.n > 1) then
			g = arg[2]
		else
			g = false
		end
	else
		r = "\0"
		g = false
	end
	
	while (not(play_action_do(name, anim_name, r, g))) do
		thread_yield()
	end
	while (not(play_action_check_done(name, .8))) do
		thread_yield()
	end
end

-- Make a human play a custom animation
--
-- name:			name of human
-- anim_name:	filename of animation to play
--
function play_custom_action(name, anim_name)
	local r, g

	while (not(play_custom_action_do(name, anim_name))) do
		thread_yield()
	end
	while (not(play_action_check_done(name,.8))) do
		thread_yield()
	end
end

-- Play an effect at the specified location.
--
-- effect_name:		Name of the effect to play.
-- navpoint_name:	Name of the navpoint to play the effect at.
-- looping:		TRUE if the effect should be looping.
--
-- returns:		Handle to the effect, or 0 if the effect could not be played.
--
function play_effect(effect_name, navpoint_name, looping)
	local handle = play_effect_do(effect_name, navpoint_name, looping)
	
	return handle
end

-- Make the current player enter a vehicle
--
-- vehicle_name: name of the vehicle to enter
--
function player_vehicle_enter(vehicle_name, ...)
	local run
	
	if (arg.n > 0) then
		run = arg[1]
	else
		run = false
	end

	if (player_vehicle_enter_do(vehicle_name, run)) then
		while (not(player_vehicle_enter_check_done())) do
			thread_yield()
		end
	end
end

-- Post a radio event
--
-- event_name:	Name of the radio event to post.
-- is_critical:	True if the radio event is critical.
--
function radio_post_event(event_name, is_critical)
	radio_post_event_do(event_name, is_critical)
end

-- Cause human to say some text
--
-- name:				name of human who is speaking
-- x:					x-position to display dialogue box (-1 for default)
-- y:					y-position to display dialogue box (-1 for default)
-- w:					width of dialogue box (-1 for default)
-- h:					height of dialogue box (-1 for default)
-- show_portrait:	set to true to show speaker portrait, else set to false
-- text:				pages of spoken text
-- options:			dialogue options
--
-- returns:			index of selected dialogue option (0 = no selection)
--
function say(name, x, y, w, h, show_portrait, ...)
	local handle
	
	handle = say_do(name, x, y, w, h, show_portrait, arg)
	if (handle >= 0) then
		local rc
		repeat
			thread_yield()
			rc = say_check_done(handle)
		until (rc ~= nil)
		return rc
	else
		return 0
	end
end

-- Cause human to say some timed text
--
-- name:				name of human who is speaking
-- x:					x-position to display dialogue box (-1 for default)
-- y:					y-position to display dialogue box (-1 for default)
-- w:					width of dialogue box (-1 for default)
-- h:					height of dialogue box (-1 for default)
-- show_portrait:	set to true to show speaker portrait, else set to false
-- time:				time to display each page of text, in seconds
-- text:				pages of spoken text
--
-- returns:			index of selected dialogue option (0 = no selection)
--
function say_timed(name, x, y, w, h, show_portrait, time, ...)
	say_timed_do(name, x, y, w, h, show_portrait, time, arg)
end

function scripted_cutscene_play( cutscene_func, abort_func )
	scripted_cutscene_playing( true )

	thread_new_block( cutscene_func )
	
	thread_new_block( abort_func )
	
	scripted_cutscene_playing( false )
end

-- Select the cutscene slate.
--
-- slate_name:	Name of the slate to select.
--
function select_slate(slate_name)
	select_slate_do(slate_name)
end

-- Set the indoor/outdoor state of the game.
--
-- enable:		True if the game should render in indoor mode, false for outdoor mode.
--
function set_indoors(enable)
	set_indoors_do(enable)
end

function set_human_cutscene_weapon( item_name, character_name )

	if (character_name == nil) then
		character_name = "#PLAYER#"
	end
	
	return set_human_cutscene_weapon_do( item_name, character_name )
end

-- Enable or disable the lights for the chunk the camera is in.
--
-- enable:		True if the lights should be enabled, false otherwise.
--
function set_level_lights(enable)
	set_level_lights_do(enable)
end

-- Turn on or off the auto streaming for chunks.
--
-- enable:		True if auto streaming should be on, or false to turn it off.
--
function set_autostreaming(enable)
	set_autostreaming_do(enable)
end

-- Returns number of elements in a table
--
-- ...:			table of elements
--
-- returns:		number of elements in a table
--
function sizeof_table(...)
	return sizeof_table_do(arg)
end

-- Stop an effect from playing.
--
-- effect_handle:	Handle of the effect to stop.
--
function stop_effect(effect_handle)
	stop_effect_do(effect_handle)
end

function subgroup_create( group_name, count, ... )

	subgroup_create_do( group_name, count )
	
	local handle = thread_new("create_group_check_done_loop",group_name)

	while((arg.n>0 and arg[1]) and not thread_check_done(handle)) do
		thread_yield()
	end
end

-- Display a subtitle
--
-- msg:			message to display
-- duration:	(optional) duration to display message, in seconds
--
function subtitle(msg, ...)
	local duration

	if (arg.n > 0) then
		duration = arg[1]
	else
		duration = -1.0
	end

	--subtitle_do(msg, duration)
end

-- Display a subtitle after a delay.
--
-- msg:			message to display
-- delay:      (optional) the delay.
-- duration:	(optional) duration to display message, in seconds
--
function subtitle_delay(msg, ...)
	local duration

	if (arg.n > 0) then
		delay = arg[1]
	else
		delay = -1.0
	end

	if (arg.n > 1) then
		duration = arg[2]
	else
		duration = -1.0
	end

	--subtitle_delay_do(msg, delay, duration)
end

-- Teleport a character to navpoint
--
-- name:			character to teleport
-- navpoint_name:	navpoint to teleport to
--
function teleport(name, navpoint_name, chunk_name)

	if (chunk_name ~= nil) then
		load_chunk( chunk_name, true )
	end

	teleport_do(name, navpoint_name, chunk_name == nil )
end

-- Teleport a character to a position.
--
-- name:		Character to teleport.
-- x:			X position to teleport to.
-- y:			Y position to teleport to.
-- z:			Z position to teleport to.
-- slate_name:		Name of the slate to offset the position with.
--
function teleport_to_slate_pos(name, x, y, z, slate_name)
	teleport_to_slate_pos_do(name, x, y, z, slate_name)
end

-- Call a function in a new thread
--
-- func_name:	name of function to execute in new thread
-- arg:			(optional) arguments to pass to the function
--
-- returns:		handle to the new thread, nil if thread could not be created
--
function thread_new(func_name, ...)
	return thread_new_do(func_name, arg)
end

-- Call a cutscene shot function in a new thread
--
-- func_name:	name of function to execute in new thread
-- shot_num:	cutscene shot number to wait until to execute the function
-- handle:		(optional) handle of thread to kill when this cutscene function executes (multiple handles can be specified)
--
function thread_new_cutscene_shot(func_name, shot_num, ...)
	local handle
	
	while (1) do
		handle = thread_new_cutscene_shot_do(func_name, shot_num, arg)
		if (handle == nil) then
			thread_yield()
		else
			break
		end
	end
	
	return handle
end

function thread_new_block(func_name)
	local handle = thread_new(func_name)
	
	while(not thread_check_done(handle)) do
		thread_yield()
	end
	
	hud_show()
end

-- Make a human turn a certain amount
--
-- name:		name of character that is turning
-- angle:	relative angle to turn, in degrees
--
function turn_angle(name, angle)
	angle = angle * 0.017453	-- convert to radians
	while (angle ~= 0) do
		angle = turn_angle_do(name, angle)
		thread_yield()
	end
end

function turn_invulnerable(name, ...)
	
	if (arg.n > 0) then
		turn_invulnerable_do( name, arg[1] )
	else
		turn_invulnerable_do( name, false )
	end
	
end

-- Make a human turn to face a character
--
-- name:		name of character that is turning
-- target:	name of target character
--
function turn_to_char(name, target)
	while (not(turn_to_char_do(name, target))) do
		thread_yield()
	end
end

-- Make a human turn to face a navpoint
--
-- name:			name of character that is turning
-- nav_name:	name of target navpoint
--
function turn_to_nav(name, nav_name)
	while (not(turn_to_nav_do(name, nav_name))) do
		thread_yield()
	end
end

-- Make a human turn to face in the same direction as a navpoint
--
-- name:			name of character that is turning
-- nav_name:	name of navpoint to get orientation from
--
function turn_to_orient(name, nav_name)
	while (not(turn_to_orient_do(name, nav_name))) do
		thread_yield()
	end
end

-- Start playing a tutorial message.
--
-- name:			name of the tutorial to play
-- delay_ms:	(optional) delay before starting the tutorial.  delay doesn't count down while the game is paused, etc.
-- auto_unlock:	(optional) unlock the tutorial first, then play.
function tutorial_start(name, delay_ms, auto_unlock)
	 tutorial_start_do(name, delay_ms or 0, auto_unlock or false)
end


-- Make the player unholster a weapon.
--
-- weapon_name:	(optional) The name of the weapon to unholster.  If not specified, unholsters last weapon used.
--
function unholster(...)
	local weapon_name

	if (arg.n > 0) then
		weapon_name = arg[1]
	else
		weapon_name = ""
	end

	unholster_do(weapon_name)
end

function vehicle_chase(vehicle_name, ... )
	local target_name = "#PLAYER#"
	local exit_on_stop = true
	local allow_ram = false
	local allow_lateral_chase = true
	local no_sirens = false;
	
	local defaults = {target_name, exit_on_stop, allow_ram, allow_lateral_chase, no_sirens}

	for x=1, arg.n, 1 do
		defaults[x] = arg[x]
	end

	vehicle_chase_do( vehicle_name, defaults[1], defaults[2], defaults[3], defaults[4], defaults[5] )

end

function vehicle_chase_mover( vehicle_name, mover_name, ... )
	local allow_lateral_chase = false
	
	if (arg.n>0) then
		allow_lateral_chase = arg[1]
	end
	
	vehicle_chase_mover_do( vehicle_name, mover_name, allow_lateral_chase )

end

-- Make a npc enter a vehicle
--
-- name:				name of character that is entering the vehicle
-- vehicle_name:	name of vehicle to enter
--
function vehicle_enter(name, vehicle_name, ...)
	local seat
	local r
	local block = true
	
	if (arg.n > 0) then
		seat = arg[1]
	else
		seat = 0
	end
	
	if arg.n > 1 then
		if arg[2] == false then
			block = false
		end
	end
	
	local s = vehicle_enter_do(name, vehicle_name, seat)

	if (block) then
		repeat
			r = vehicle_enter_check_done(name)
			thread_yield()
		until r ~= 0
	else
		return s
	end
	
	if r == 2 then
		return false
	else
		return true
	end
end

-- Make a group of NPCs enter a vehicle
--
-- names:			names of characters entering the vehicle
-- vehicle_name:	name of vehicle to enter
-- 
function vehicle_enter_group(...)
	if (vehicle_enter_group_do(arg)) then
		while (not(vehicle_enter_group_check_done(arg))) do
			thread_yield()
		end
	end
end

-- Make a npc exit a vehicle
--
-- name:	name of character to exit a vehicle
--
function vehicle_exit(name)
	if (vehicle_exit_do(name)) then
		while (not(vehicle_exit_check_done(name))) do
			thread_yield()
		end
	end
end


-- Make an Vehicle flee
--
-- flee_vehilce: The vehicle that's going to flee
-- flee_from:    The person they're supposed to flee from
--
function vehicle_flee(flee_vehicle, flee_from)
	if (flee_from == nil) then
		flee_from = "#PLAYER#"
	end
	vehicle_flee_do(flee_vehicle, flee_from)
end

function vehicle_lights_on( name, on )

	if (on == nil) then
		on = true
	end
	
	return vehicle_lights_on_do( name, on )
end

function vehicle_lights_off( name, off )

	if (off == nil) then
		off = true
	end
	
	return vehicle_lights_off_do( name, off )
end


-- Modify the damage done to a vehicle by explosions 
--
-- name:			name of vehicle
-- modifier:	multiplier value for explosion damage
--
function vehicle_set_explosion_damage_multiplier(name, multiplier)
	return vehicle_set_explosion_damage_modifer_do(name, multiplier)
end


-- Make a vehicle use turret mode to move througha series of navpoints (could just be 1)
-- 
-- name:		name of the vehicle
-- dest:		name of destination navpoint(s)
-- stop_at_goal:	(optional) whether vehicle should stop at end of goal (default true)
--
function vehicle_turret_base_to(name, ...)
	local num_args, stop_at_goal
	
	-- Wait until the resource is loaded.
	-- human_wait_for_loaded_resource(name)
			
	num_args = arg.n
	
	-- get whether to stop_at_goal is passed in...
	local last_arg_bool = type(arg[num_args]) == "boolean"
	
	if (last_arg_bool == true) then
		stop_at_goal = arg[num_args]
		num_args = num_args - 1
	else
		stop_at_goal = true
		num_args = num_args
	end
	
	local arg_type = type(arg[1])

	if (arg_type == "table") then
		num_args = sizeof_table(arg[1])
		if (vehicle_turret_base_to_do(stop_at_goal, name, arg[1], num_args)) then
			local check_done = vehicle_pathfind_navmesh_check_done(name, arg[1], num_args)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_navmesh_check_done(name, arg[1], num_args)
			end
			
			return check_done == 1 or check_done == 3
		else
			return false
		end
	elseif (arg_type == "string") then
		if (vehicle_turret_base_to_do(stop_at_goal, name, arg, num_args)) then
			local check_done = vehicle_pathfind_navmesh_check_done(name, arg, num_args)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_navmesh_check_done(name, arg, num_args)
			end
			
			return check_done == 1 or check_done == 3
		else
			return false
		end
	end
end


-- Make a vehicle go to a series of navpoints (could just be 1)
-- 
-- name:		name of the vehicle
-- dest:		name of destination navpoint(s)
-- use_navmesh:	if the car should use navmesh or traffic splines(default normal)
-- stop_at_goal:	(optional) whether vehicle should stop at end of goal (default true)
-- force_path:		(optional) whether to ignore current position to support looping (defualt false)
--
function vehicle_pathfind_to(name, ...)
	local num_args, use_navmesh, stop_at_goal, force_path
	
	stop_at_goal = true
	force_path = false

	-- Wait until the resource is loaded.
	-- human_wait_for_loaded_resource(name)
			
	num_args = arg.n
	
	local bool_count = 0;
	local index = num_args;
	
	while (type(arg[num_args]) == "boolean") do
		bool_count = bool_count + 1
		num_args = num_args - 1
	end
	
	if (bool_count == 3) then
		force_path = arg[num_args + 3]
		stop_at_goal = arg[num_args + 2]
		use_navmesh = arg[num_args + 1]
	elseif (bool_count == 2) then
		stop_at_goal = arg[num_args + 2]
		use_navmesh = arg[num_args + 1]
	else
		use_navmesh = arg[num_args + 1]
	end

	local arg_type = type(arg[1])
	if (use_navmesh) then

		if (arg_type == "table") then
			num_args = sizeof_table(arg[1])
			if (vehicle_pathfind_navmesh_do(force_path, stop_at_goal, name, arg[1], num_args)) then
				local check_done = vehicle_pathfind_navmesh_check_done(name, arg[1], num_args)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_navmesh_check_done(name, arg[1], num_args)
				end
				
				return check_done == 1 or check_done == 3
			else
				return false
			end
		elseif (arg_type == "string") then
			if (vehicle_pathfind_navmesh_do(force_path, stop_at_goal, name, arg, num_args)) then
				local check_done = vehicle_pathfind_navmesh_check_done(name, arg, num_args)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_navmesh_check_done(name, arg, num_args)
				end
				
				return check_done == 1 or check_done == 3
			else
				return false
			end
		end
	else
		if (arg_type == "table") then
			num_args = sizeof_table(arg[1])
			if (vehicle_pathfind_to_do(stop_at_goal, name, arg[1], num_args)) then
				local check_done = vehicle_pathfind_navmesh_check_done(name, arg[1], num_args)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_navmesh_check_done(name, arg[1], num_args)
				end
				
				return check_done == 1 or check_done == 3
			else
				return false
			end
		elseif (arg_type == "string") then
			if (vehicle_pathfind_to_do(stop_at_goal, name, arg, num_args)) then
				local check_done = vehicle_pathfind_navmesh_check_done(name, arg, num_args)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_navmesh_check_done(name, arg, num_args)
				end
				
				return check_done == 1 or check_done == 3
			else
				return false
			end
		end
	end
end

function vehicle_stop( name, dont_block )
	vehicle_stop_do( name )
	
	while( (not dont_block) and get_vehicle_speed(name) > 0 ) do
		thread_yield()
	end
end

function vehicle_interrogation_start( interrogator, interrogatee )
	
	vi_start_do( interrogator, interrogatee )
	
	while (not vi_start_check_done( interrogator )) do
		thread_yield()
	end
	
end

function wander_start( npc, nav, radius )
	
	if (radius == nil) then
		radius = -1
	end
	
	if (nav == nil) then
		nav = "LEASH"
	end

	return wander_start_do( npc, nav, radius )
end

function wardrobe_force_wear_option( mesh_name, variant_name )

	if (variant_name == nil) then
		variant_name = "Default"
	end
	
	wardrobe_force_wear_option_do( mesh_name, variant_name )
end


-- Wear a customization item.
--
-- item_name		Name of the customization item (see customization_items.xtbl to get this and the other values.)
-- mesh			Mesh associated with the desired wear option. ("mesh name" field in the wear options grid, including the extension.)
-- variant		Variant to wear ("variant name" field in the variants grid.)
--
function wear_customization_item(item_name, mesh, variant)
	wear_customization_item_do(item_name, mesh, variant)
end

-- Enable/disable customization stores.
--
-- enable		True if the stores should be enabled, false otherwise.
--
function customization_stores_enable(enable)
	customization_stores_enable_do(enable)
end

function debug_validate_lane(...)
	debug_validate_lane_do(arg)
end

-- Object marking functions ----------------------------------------------------------
function add_marker_navpoint(nav_name, minimap_icon_name, ingame_icon_name)
	minimap_icon_add_navpoint(nav_name, minimap_icon_name)
	ingame_effect_add_navpoint(nav_name, ingame_icon_name)
end

function remove_marker_navpoint(nav_name)
	minimap_icon_remove_navpoint(nav_name)
	ingame_effect_remove_navpoint(nav_name)
end

function add_marker_npc(char_name, minimap_icon_name, ingame_icon_name)
	if (not is_dead(char_name)) then
		minimap_icon_add_npc(char_name, minimap_icon_name)
		ingame_effect_add_npc(char_name, ingame_icon_name)
	end
end

function add_marker_trigger(trigger_name, minimap_icon_name, ingame_effect_name)
	minimap_icon_add_trigger(trigger_name, minimap_icon_name)
	ingame_effect_add_trigger(trigger_name, ingame_effect_name)
end

function remove_marker_npc(char_name)
	minimap_icon_remove_npc(char_name)
	ingame_effect_remove_npc(char_name)
end

function add_marker_vehicle(vehicle_name, minimap_icon_name, ingame_icon_name)
	if (not is_vehicle_destroyed(vehicle_name)) then
		minimap_icon_add_vehicle(vehicle_name, minimap_icon_name)
		ingame_effect_add_vehicle(vehicle_name, ingame_icon_name)
	end
end

function remove_marker_vehicle(vehicle_name)
	minimap_icon_remove_vehicle(vehicle_name)
	ingame_effect_remove_vehicle(vehicle_name)
end

function remove_marker_trigger(trigger_name)
	minimap_icon_remove_trigger(trigger_name)
	ingame_effect_remove_trigger(trigger_name)
end

function spawning_vehicles(turn_on_off)
	spawning_vehicles_do(turn_on_off)
end

function spawning_pedestrians(turn_on_off)
	spawning_pedestrians_do(turn_on_off)
end

function attack_safe( npc_name, target )
	local real_target = target
	if target == nil then
		real_target = "#PLAYER#"
	end
		
	if ((not is_dead( npc_name )) and ((not is_dead(real_target))) ) then
		attack( npc_name, real_target ) 
	end
end

function mission_waypoint_add(navpoint)
	mission_waypoint_remove()
	Mission_waypoint = waypoint_add(navpoint)
end

function mission_waypoint_remove()
	if (Mission_waypoint ~= -1) then
		waypoint_remove(Mission_waypoint)
		Mission_waypoint = -1
	end
end

function voice_block(char)
	while (npc_is_speaking(char)) do
		thread_yield()
	end
end

function cutscene_tester( cutscene_name )
	cutscene_in( cutscene_name )
	cutscene_play( cutscene_name )
end
