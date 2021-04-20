function trainyard_init()
	--debug_trainyard()
end

function trainyard_main()
	--message("test trainyard") -- test
end

-- debug function - call from the console with 'lua' command
function warp_trainyard()
	message("warping...")
	delay(0)
	player_teleport(  "trainyard_$nav-warp")
end

function debug_trainyard()
	--teleport("#PLAYER#", "trainyard_$n-meeting")
	--teleport("#PLAYER#", "trainyard_$n-beatdown")
	teleport("#PLAYER#", "trainyard_$n-driveby")
end




-----------------------------------------------------------
---- AM 12/21/05:  SCRIPTS TO SET UP SCREENSHOT SCENES ----

function trainyard_meeting1()
	teleport("#PLAYER#", "trainyard_$n-screenshot-warp01")
	group_create("trainyard_$G-screenshot1-meeting", true)
end

function trainyard_meeting2()
	while (1) do
		play_custom_action("trainyard_$c-screenshot1-hector", "gml1_bs_sd_talk_drs")
		delay(2)
		play_custom_action("trainyard_$c-screenshot1-hector", "gml1_bs_sd_talk_yes")
		delay(2)
	end
end


function trainyard_beatdown1()
	teleport("#PLAYER#", "trainyard_$n-beatdown")
	character_slots_reserve_for_team("Los Carnales", 4)
	group_create("trainyard_$G-screenshot2-beatdown", true)
end

function trainyard_beatdown2()
	attack("trainyard_$c-screenshot2-01", "trainyard_$c-screenshot2-ped")
	attack("trainyard_$c-screenshot2-02", "trainyard_$c-screenshot2-ped")
end


function trainyard_driveby1()
	teleport("#PLAYER#", "trainyard_$n-driveby")
	character_slots_reserve_for_team("Los Carnales", 3)
	character_slots_reserve_for_team("Vice Lords", 5)
	group_create("trainyard_$G-screenshot3-driveby", true)
end

function trainyard_driveby2()
	character_add_vehicle("trainyard_$c-screenshot3-01", "trainyard_$v-screenshot3", 0)
	character_add_vehicle("trainyard_$c-screenshot3-02", "trainyard_$v-screenshot3", 1)
	character_add_vehicle("trainyard_$c-screenshot3-03", "trainyard_$v-screenshot3", 2)
	character_add_vehicle("trainyard_$c-screenshot3-04", "trainyard_$v-screenshot3", 3)
	
	set_ignore_ai_flag("trainyard_$c-screenshot3-01", true)
	combat_disable("trainyard_$c-screenshot3-01")
	vehicle_disable_chase("trainyard_$v-screenshot3", true)

	delay(1)

	while (1) do
		teleport_vehicle("trainyard_$v-screenshot3", "trainyard_$v-screenshot3")

		attack("trainyard_$c-screenshot3-02", "trainyard_$c-driveby-vk01")
		attack("trainyard_$c-screenshot3-03", "trainyard_$c-driveby-vk08")
	
		vehicle_pathfind_to("trainyard_$v-screenshot3", "trainyard_$n-driveby-end", false, true)
		delay(2)
	end
end



--------------------------------------------------------------
---- AM 1/31/06:  SCREENSHOT SCRIPTS FOR AARON LEMAY --------
--------------------------------------------------------------


-- saints ---------------
function trainyard_saints_pic()
	trainyard_pic_cleanup()

	character_slots_reserve_for_team("Playas", 3)

	teleport("#PLAYER#", "trainyard_$n-pic-saints-plyr")

	group_create("trainyard_$G-pic-saints", true)
	
	npc_unholster_best_weapon("trainyard_$c001") -- dex
	npc_unholster_best_weapon("trainyard_$c000") -- lin
	npc_unholster_best_weapon("trainyard_$c-pic-sr01")
end

function trainyard_saints_tele()
	teleport("#PLAYER#", "trainyard_$n-pic-saints-plyr")
end


-- los carnales ---------------
function trainyard_lc_pic()
	trainyard_pic_cleanup()

	character_slots_reserve_for_team("Los Carnales", 3)

	teleport("#PLAYER#", "trainyard_$n-pic-lc-player")

	group_create("trainyard_$G-pic-lc", true)

	npc_unholster_best_weapon("trainyard_$c011") -- victor
	npc_unholster_best_weapon("trainyard_$c008") -- angelo
end

function trainyard_lc_tele()
	teleport("#PLAYER#", "trainyard_$n-pic-lc-player")
end


-- vice kings -----------------------
function trainyard_vk_pic()
	trainyard_pic_cleanup()

	character_slots_reserve_for_team("Vice Lords", 4)	

	teleport("#PLAYER#", "trainyard_$n-pic-downtown-player")

	group_create("trainyard_$G-pic-vk", true)

	npc_unholster_best_weapon("trainyard_$c025") -- warren
	npc_unholster_best_weapon("trainyard_$c024") -- anthony
end

function trainyard_vk_tele()
	teleport("#PLAYER#", "trainyard_$n-pic-downtown-player")
end



-- rollers -----------------------
function trainyard_wr_pic()
	trainyard_pic_cleanup()

	character_slots_reserve_for_team("Rollerz", 5)	

	teleport("#PLAYER#", "trainyard_$n-pic-warp-wr")

	group_create("trainyard_$G-pic-wr", true)

	npc_unholster_best_weapon("trainyard_$c037") -- price
end

function trainyard_wr_tele()
	teleport("#PLAYER#", "trainyard_$n-pic-warp-wr")
end




function trainyard_pic_cleanup()
	group_destroy("trainyard_$G-pic-saints")
	group_destroy("trainyard_$G-pic-lc")
	group_destroy("trainyard_$G-pic-vk")
	group_destroy("trainyard_$G-pic-wr")

	character_slots_clear_reservations()
end



-- lopez pics at docks -----------------
function trainyard_pic_lopez()
	teleport("#PLAYER#", "trainyard_$n-pic-lopez-player")
	group_create("trainyard_$G-pic-lopez")
end

function trainyard_pic_studio()
	teleport("#PLAYER#", "trainyard_$n-pic-recordstudio")
	group_create("trainyard_$G-pic-studio")
end



-- unlock stuff for harris ------------
function unlock_lc()
	group_destroy("trainyard_$G-unlock-lc")
	group_destroy("trainyard_$G-unlock-wr")
	group_destroy("trainyard_$G-unlock-vk")
	teleport("#PLAYER#", "trainyard_$n-unlock-lc")
	group_create("trainyard_$G-unlock-lc")
end

function unlock_wr()
	group_destroy("trainyard_$G-unlock-lc")
	group_destroy("trainyard_$G-unlock-wr")
	group_destroy("trainyard_$G-unlock-vk")
	teleport("#PLAYER#", "trainyard_$n-unlock-wr")
	group_create("trainyard_$G-unlock-wr")	
end

function unlock_vk()
	group_destroy("trainyard_$G-unlock-lc")
	group_destroy("trainyard_$G-unlock-wr")
	group_destroy("trainyard_$G-unlock-vk")
	teleport("#PLAYER#", "trainyard_$n-unlock-vk")
	group_create("trainyard_$G-unlock-vk")	
end