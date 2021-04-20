-- vksuburb.lua
-- SR district script
-- 9/9/05

--[[
FIXMES/TDLS/NOTES:
X	- change char type to rollers

]]


-- GLOBAL VARIABLES ---------
VKgrocery_death_count = 0
VKgrocery_death_total = 12
VKgrocery_death_targets = {"vksuburb_Vk_x_m_thug1-01#015", "vksuburb_Vk_x_m_thug1-01#017", "vksuburb_Vk_x_m_thug1-01#018", "vksuburb_Vk_x_m_thug1-01#019",
									"vksuburb_Vk_x_m_thug1-01#020", "vksuburb_Vk_x_m_thug1-01#021", "vksuburb_Vk_x_m_thug1-01#022", "vksuburb_Vk_x_m_killa1-01#000",
									"vksuburb_$c-grocery-int09", "vksuburb_$c-grocery-int10", "vksuburb_$c-grocery-int11", "vksuburb_$c-grocery-int12"}

VKgrocery_phone_handle = 0

--[[
"vksuburb_Vk_x_m_thug1-01#015"
"vksuburb_Vk_x_m_thug1-01#017"
"vksuburb_Vk_x_m_thug1-01#018"
"vksuburb_Vk_x_m_thug1-01#019"
"vksuburb_Vk_x_m_thug1-01#020"
"vksuburb_Vk_x_m_thug1-01#021"
"vksuburb_Vk_x_m_thug1-01#022"
"vksuburb_Vk_x_m_killa1-01#000"
"vksuburb_$c-grocery-int09"
"vksuburb_$c-grocery-int10"
"vksuburb_$c-grocery-int11"
"vksuburb_$c-grocery-int12"
]]


-- FUNCTIONS ----------------
function vksuburb_init()

	-- GROCERY STRONGHOLD SETUP
	on_stronghold_takeover_start("vksuburb_sh_grocery_start", "vksuburb_sh_grocery")
	on_stronghold_reset("vksuburb_sh_grocery_reset", "vksuburb_sh_grocery")
	on_stronghold_takeover_success("vksuburb_sh_grocery_success", "vksuburb_sh_grocery")
--	on_stronghold_check_enable("vksuburb_sh_grocery_unlock", "vksuburb_sh_grocery")
	stronghold_set_cost( "vksuburb_sh_grocery",  VKSUBURB_SH_GROCERY_REQUIRED_PROPS)

	--debug_vksuburb()
	if (is_mission_complete("vk05")) then
		door_lock("g_02grns_meshmver01", false)
		door_lock("g_03grns_meshmver02", false)
	else
		door_lock("g_02grns_meshmver01", true)
		door_lock("g_03grns_meshmver02", true)
	end
end


function debug_vksuburb()
	teleport("#PLAYER#", "vksuburb_$n_sh1-warp")
	stronghold_enable("vksuburb_sh_grocery")
end


function vksuburb_main()
end


-- debug function - call from the console with 'lua' command
function warp_vksuburb()
	message("warping...")
	delay(0)
	player_teleport(  "vksuburb_$nav-warp")
end



----------------------------------------------
-- VK GROCERY STRONGHOLD ---------------------
----------------------------------------------

-- 2006/02/28 STL: This function isn't being called anymore.
function vksuburb_sh_grocery_unlock()
	if ( is_mission_complete("vk03b") ) then
		stronghold_enable("vksuburb_sh_grocery")
		debug_message("vksuburb grocery stronghold unlocked!")
	end
end

function vksuburb_sh_grocery_reset()
	for i = 1, VKgrocery_death_total, 1 do
		remove_marker_npc(VKgrocery_death_targets[i])
	end

	on_trigger("", "vksuburb_$t-show-objective")
	on_trigger("", "vksuburb_$t-grocery-attk-l")
	on_trigger("", "vksuburb_$t-grocery-attk-r")
	on_trigger("", "vksuburb_$t-grocery-weapons")

	on_death("", "vksuburb_Vk_x_m_thug1-01#015")
	on_death("", "vksuburb_Vk_x_m_thug1-01#017")
	on_death("", "vksuburb_Vk_x_m_thug1-01#018")
	on_death("", "vksuburb_Vk_x_m_thug1-01#019")
	on_death("", "vksuburb_Vk_x_m_thug1-01#020")
	on_death("", "vksuburb_Vk_x_m_thug1-01#021")
	on_death("", "vksuburb_Vk_x_m_thug1-01#022")
	on_death("", "vksuburb_Vk_x_m_killa1-01#000")
	on_death("", "vksuburb_$c-grocery-int09")
	on_death("", "vksuburb_$c-grocery-int10")
	on_death("", "vksuburb_$c-grocery-int11")
	on_death("", "vksuburb_$c-grocery-int12")

	trigger_disable("vksuburb_$t-show-objective")
	trigger_disable("vksuburb_$t-grocery-attk-l")
	trigger_disable("vksuburb_$t-grocery-attk-r")
	trigger_disable("vksuburb_$t-grocery-weapons")

	remove_marker_trigger("vksuburb_$t-show-objective")
	--remove_marker_navpoint("vksuburb_$execute lua script000")

	objective_text_clear()

	release_to_world("vksuburb_$G-sh1-01")
	release_to_world("vksuburb_$G-sh1-02")
	group_destroy("vksuburb_$G-grocery-weapons")
	group_destroy("vksuburb_$G-sh1-intro")

	audio_stop(VKgrocery_phone_handle)

	VKgrocery_death_count = 0
end


--[[
function projects_sh_loft_scene02_defend()
	--load_chunks("sr_chunk07", "sr_chunk07b")	-- new chunk, current chunk

	--camera_look_through("projects_$cam-loft-03")
	delay(0)
	camera_look_through("projects_$cam-loft-close1")
	delay(0)
	projects_sh_loft_start_wave1()
	delay(0)	-- need these delays, otherwise wave1() seems to hang
	
	--teleport("#PLAYER#", "projects_$n-loft-warp1")
	--teleport("#PLAYER#", "projects_$n-loft-roof")

	modal_begin()
	fade_in(1)
	delay(5)	
	modal_end()
end

function projects_sh_loft_scene02_defend_end()
	fade_out(.75)
	delay(.8)
	camera_end_script()
end

	cutscene_in()
	scripted_cutscene_play("projects_sh_loft_scene02_defend", "projects_sh_loft_scene02_defend_end")
	cutscene_out() ]]


function vksuburb_sh_grocery_scene01_intro()
	teleport("#PLAYER#", "vksuburb_$t-grocery-use")
	camera_look_through("vksuburb_$cam-grocery-01")

	team_despawn("Vice Lords", true)

	modal_begin()

	character_hide("#PLAYER#")
	group_create_preload("vksuburb_$G-sh1-intro", "vksuburb_$G-sh1-01")
	npc_unholster_best_weapon("vksuburb_Vk_x_m_thug1-01#003")
	thread_new("vksuburb_sh_grocery_phonecall")
	
	delay(2)

	fade_in(1)
	thread_new("vksuburb_sh_grocery_scene01_walk")
	delay(3.75)
	camera_look_through("vksuburb_$n-grocery-intro-jh01")
	delay(5.25)
	fade_out(.75)
	fade_out_block()
	modal_end()
end

function vksuburb_sh_grocery_scene01_intro_end()
	fade_out(0)
	delay(.1)
	character_show("#PLAYER#")
	camera_end_script()
	--AM 7/7/06: making this preload version and moving to above function to reduce 
	--group_create("vksuburb_$G-sh1-01", true)
	combat_enable("vksuburb_Vk_x_m_thug1-01#003")
	combat_enable("vksuburb_grocery03")
	delay(0.25)
end

function vksuburb_sh_grocery_scene01_walk()
	move_to("vksuburb_grocery03", "vksuburb_$n-grocery03-a", 1)
end

function vksuburb_sh_grocery_start()
	set_mission_author("Alvan Monje")

	cutscene_in()
	scripted_cutscene_play("vksuburb_sh_grocery_scene01_intro", "vksuburb_sh_grocery_scene01_intro_end")
	cutscene_out()

	on_trigger("vksuburb_sh_grocery_show_objective", "vksuburb_$t-show-objective")
	on_trigger("vksuburb_sh_grocery_attack_left", "vksuburb_$t-grocery-attk-l")
	on_trigger("vksuburb_sh_grocery_attack_right", "vksuburb_$t-grocery-attk-r")
	on_trigger("vksuburb_sh_grocery_create_weapons", "vksuburb_$t-grocery-weapons")

	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#015")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#017")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#018")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#019")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#020")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#021")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_thug1-01#022")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_Vk_x_m_killa1-01#000")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_$c-grocery-int09")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_$c-grocery-int10")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_$c-grocery-int11")
	on_death("vksuburb_sh_grocery_check_death", "vksuburb_$c-grocery-int12")	

	mission_help_table("vkgrocery_start") -- text: "Fight your way to the grocery!"
	add_marker_trigger("vksuburb_$t-show-objective", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)

	trigger_enable("vksuburb_$t-show-objective")
	trigger_enable("vksuburb_$t-grocery-attk-l")
	trigger_enable("vksuburb_$t-grocery-attk-r")
	trigger_enable("vksuburb_$t-grocery-weapons")
end


function vksuburb_sh_grocery_create_weapons()
	trigger_disable("vksuburb_$t-grocery-weapons")

	group_create("vksuburb_$G-grocery-weapons")
end


function vksuburb_sh_grocery_success()
	group_destroy("vksuburb_$G-sh1-01")
	group_destroy("vksuburb_$G-sh1-02")
	group_destroy("vksuburb_$G-grocery-weapons")

	hood_set_owner("wr_suburb03", "Playas")

	trigger_enable("vksuburb_$t-grocery-save")
end

function vksuburb_sh_grocery_phonecall()
	audio_play("SYS_CELL_RING", "foley", false, true)
	audio_play("SYS_CELL_RING", "foley", false, true)
	VKgrocery_phone_handle = audio_play("JULIUS_STRONGHOLD_5", "voice", false, false)
end

-- patrols
function vksuburb_sh_grocery_start_patrol1()
	while (1) do
		move_to("vksuburb_grocery01", "vksuburb_$n_grocery01a", 1)
		delay(1)
		move_to("vksuburb_grocery01", "vksuburb_grocery01", 1)
		delay(1)
	end
end


function vksuburb_sh_grocery_start_patrol2()
	while (1) do
		move_to("vksuburb_grocery02", "vksuburb_$n_grocery02a", 1)
		delay(1)
		move_to("vksuburb_grocery02", "vksuburb_grocery02", 1)
		delay(1)
	end
end


function vksuburb_sh_grocery_start_patrol3()
	while (1) do
		move_to("vksuburb_grocery03", "vksuburb_$n_grocery03a", 1)
		delay(1)
		move_to("vksuburb_grocery03", "vksuburb_grocery03", 1)
		delay(1)
	end
end



-- when player enters grocery, show objective text
function vksuburb_sh_grocery_show_objective()
	trigger_disable("vksuburb_$t-show-objective")

	mission_help_table("vkgrocery_interior") -- text: "Kill all enemies!"
	objective_text("vkgrocery_objective", VKgrocery_death_total - VKgrocery_death_count)
	remove_marker_trigger("vksuburb_$t-show-objective")
	--remove_marker_navpoint("vksuburb_$execute lua script000")

	for i = 1, VKgrocery_death_total, 1 do
		add_marker_npc(VKgrocery_death_targets[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	end
end


-- whenever a character dies, increment counter and objective text, check for win condition
function vksuburb_sh_grocery_check_death(npc)
	VKgrocery_death_count = VKgrocery_death_count + 1
	objective_text("vkgrocery_objective", VKgrocery_death_total - VKgrocery_death_count)
	remove_marker_npc(npc)

	if	(VKgrocery_death_count == VKgrocery_death_total) then
		delay(5)
		stronghold_takeover_success()
	end
end


function vksuburb_sh_grocery_attack_left()
	trigger_disable("vksuburb_$t-grocery-attk-l")

	--debug_message("attack left")
	set_ignore_ai_flag("vksuburb_$c-grocery-int11", false)
	set_ignore_ai_flag("vksuburb_$c-grocery-int12", false)
	attack("vksuburb_$c-grocery-int11")
	attack("vksuburb_$c-grocery-int12")
end

function vksuburb_sh_grocery_attack_right()
	trigger_disable("vksuburb_$t-grocery-attk-r")

	--debug_message("attack right")
	set_ignore_ai_flag("vksuburb_$c-grocery-int09", false)
	set_ignore_ai_flag("vksuburb_$c-grocery-int10", false)
	attack("vksuburb_$c-grocery-int09")
	attack("vksuburb_$c-grocery-int10")
end