-- Global Variables------

-- Rewards
Wr09_hood_reward = ""

Wr09_price_waypoints_start = {
	"wr09_$n_pricea", "wr09_$n_priceb", "wr09_$n_pricec", "wr09_$n_priced",
	"wr09_$n_pricee", "wr09_$n_pricef", "wr09_$n_priceg", "wr09_$n_priceh",
	"wr09_$n_pricei", "wr09_$n_pricej", "wr09_$n_pricek", "wr09_$n_pricel",
	"wr09_$n_pricem", "wr09_$n_pricen", "wr09_$n_priceo", "wr09_$n_pricep",
	"wr09_$n_priceq", "wr09_$n_pricer", "wr09_$n_prices",
}

Wr09_price_waypoints_loop = {
	"wr09_$n_price01", "wr09_$n_price02", "wr09_$n_price03", "wr09_$n_price04", "wr09_$n_price05", 
	"wr09_$n_price06", "wr09_$n_price07", "wr09_$n_price08", "wr09_$n_price09", "wr09_$n_price10", 
	"wr09_$n_price11", "wr09_$n_price12", "wr09_$n_price13", "wr09_$n_price14", "wr09_$n_price15", 
	"wr09_$n_price16", "wr09_$n_price17", "wr09_$n_price18", "wr09_$n_price19", "wr09_$n_price20", 
	"wr09_$n_price21", "wr09_$n_price22", "wr09_$n_price23", "wr09_$n_price24", "wr09_$n_price25", 
	"wr09_$n_price26", "wr09_$n_price27", "wr09_$n_price28", "wr09_$n_price29", "wr09_$n_price30", 
	"wr09_$n_price31", "wr09_$n_price32", "wr09_$n_price33", "wr09_$n_price34", "wr09_$n_price35", 
	"wr09_$n_price36", "wr09_$n_price37", "wr09_$n_price38", "wr09_$n_price39", "wr09_$n_price40",
	"wr09_$n_price41", "wr09_$n_price42", "wr09_$n_price43", "wr09_$n_price44", "wr09_$n_price45",
	"wr09_$n_price46", "wr09_$n_price47", "wr09_$n_price48", "wr09_$n_price49", "wr09_$n_price50", 
	"wr09_$n_price51", "wr09_$n_price52", "wr09_$n_price53", "wr09_$n_price54", "wr09_$n_price55", 
	"wr09_$n_price56", "wr09_$n_price57", "wr09_$n_price58", "wr09_$n_price58b", "wr09_$n_price59", "wr09_$n_price60", 
	"wr09_$n_price61", "wr09_$n_price62", "wr09_$n_price63", "wr09_$n_price64", "wr09_$n_price65", 
	"wr09_$n_price66", "wr09_$n_price67", "wr09_$n_price68", "wr09_$n_price69", "wr09_$n_price70", 
	"wr09_$n_price71", "wr09_$n_price72", "wr09_$n_price73", "wr09_$n_price74", "wr09_$n_price75", 
	"wr09_$n_price76", "wr09_$n_price77", "wr09_$n_price78", "wr09_$n_price79", "wr09_$n_price80",
	"wr09_$n_price81", "wr09_$n_price82", "wr09_$n_price83", "wr09_$n_price84",
}

Wr09_threads = {}

Wr09_on_take_damage = {}

Wr09_vehicle_hits = {}

Wr09_cars_left = 4
Wr09_price_hits_left = 300

Wr09_damage_to_truck_per_car_destroyed = 0

Wr09_current_taunt = 1
Wr09_current_molotov = 1
Wr09_current_damage = 1
Wr09_current_ram = 1

Wr09_audio_playing = false
Wr08_damage_playing = false

function wr09_taunt()
	if (Wr09_audio_playing) then
		return
	end
	
	Wr09_audio_playing = true
	audio_play_for_character("PRICE_WR9_TAUNT_"..Wr09_current_taunt, "wr09_$c_price", "voice", false, true)
	delay(10)
	Wr09_audio_playing = false
	
	Wr09_current_taunt = Wr09_current_taunt + 1
	
	if Wr09_current_taunt > 11 then
		Wr09_current_taunt = 12
	end
	
	if Wr09_current_taunt > 13 then
		Wr09_current_taunt = 1
	end
end

function wr09_damage()
	if (Wr09_audio_playing) or (Wr08_damage_playing) then
		return
	end
	
	Wr09_audio_playing = true
	Wr08_damage_playing = true
	audio_play_for_character("PRICE_WR9_DAMAGE", "wr09_$c_price", "voice", false, true)
	delay(12)
	Wr09_audio_playing = false
	Wr08_damage_playing = false
end

function wr09_ram()
	if (Wr09_audio_playing) then
		return
	end
	
	Wr09_audio_playing = true
	audio_play_for_character("PRICE_WR9_RAM_"..Wr09_current_ram, "wr09_$c_price", "voice", false, true)
	delay(10)
	Wr09_audio_playing = false
	
	Wr09_current_ram = Wr09_current_ram + 1
	if Wr09_current_ram > 13 then
		Wr09_current_ram = 1
	end
end

function wr09_molotov()
	if (Wr09_audio_playing) then
		return
	end
	
	Wr09_audio_playing = true
	audio_play_for_character("PRICE_WR9_MOLTOV_"..Wr09_current_molotov, "wr09_$c_price", "voice", false, true)
	delay(10)
	Wr09_audio_playing = false
	
	Wr09_current_molotov = Wr09_current_molotov + 1
	if Wr09_current_molotov > 14 then
		Wr09_current_molotov = 1
	end
end

function wr09_taunt_loop()
	while (true) do
		delay(rand_int(25,35))
		wr09_taunt()
	end
end

-- FUNCTIONS ----------------------------

function wr09_cleanup()
	wr09_kill_all_threads()
	ammo_infinite(false)
	on_collision("", "#PLAYER#")
	on_death("", "#PLAYER#")
	on_take_damage("","wr09_$v_trailer")
	on_take_damage("","wr09_$v_price")
	for i = 1, 7 do
		local v = "wr09_$v_car"..i
		on_take_damage("", v)
	end
	

	hud_bar_off()
	distance_display_off()
	hud_timer_stop()
	remove_marker_vehicle("wr09_$v_trailer")
	remove_marker_vehicle("wr09_$v_price")
	set_unjackable_flag("wr09_$v_price", false)

	release_to_world("wr09_$v_courtesy_car")
	destroy_group("wr09_$g_price")
	
	notoriety_reset("rollers")
end

function wr09_kill_all_threads()
	for i, j in Wr09_threads do
		thread_kill(j)
	end
	
	Wr09_threads = {}
end

-- Called by mission trigger
function wr09_start()
	Wr09_audio_playing = false
	Wr08_damage_playing = false
	
	ammo_infinite(true)
	
	set_mission_author("Sean Rose")
	cutscene_in("wr09_scene02")
	cutscene_play("wr09_scene02", "wr09_$g_price")
	vehicle_show("wr09_$v_courtesy_car")
	notoriety_set_max("rollers", 2)

	Wr09_price_hits_left = 300
	Wr09_cars_left = 4

	hud_bar_set_range(0, Wr09_price_hits_left)
	hud_bar_on("Damage", "wr09_truck_name")
	hud_bar_set_value(Wr09_price_hits_left)

	Wr09_damage_to_truck_per_car_destroyed =  (Wr09_price_hits_left * 0.75) / Wr09_cars_left
	
	wr09_spawn_price()
end

function wr09_success()
	unlockable_unlock("wr09")
	unlockable_unlock("wr09_2")
	unlockable_unlock("wr09_3")
	trigger_enable("wrsuburb_$crib_save000")
	--mission_unlock("wrsuburb_stronghold_price")
	if Wr09_hood_reward ~= "" then
		hood_set_owner(Wr09_hood_reward, "Playas")
	end
	radio_post_event("NEWS_WR_TANKERPRICE", false)
	parking_spot_enable("parking_c$parking076") -- enable Price semi truck parking spawn; coords -187 21 405
end

function wr09_spawn_price()
	character_show("wr09_$c_price")
	vehicle_show("wr09_$v_trailer")
	vehicle_show("wr09_$v_price")
	
	
	character_add_vehicle("wr09_$c_price", "wr09_$v_price", 0)
	add_marker_vehicle("wr09_$v_trailer", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	mission_waypoint_add("wr09_$v_price")
	vehicle_infinite_mass("wr09_$v_price", true)
	vehicle_infinite_mass("wr09_$v_trailer", true)
	vehicle_ignore_repulsors("wr09_$v_price", true)
	--vehicle_wheel_world_collision("wr09_$v_price", true)
	set_unjackable_flag("wr09_$v_price", true)
	vehicle_supress_npc_exit("wr09_$v_price", true)
	vehicle_disable_flee("wr09_$v_price", true)
	vehicle_disable_chase("wr09_$v_price", true)
	vehicle_attach_trailer("wr09_$v_price", "wr09_$v_trailer")
	
	for i = 1, 7 do
		local v = "wr09_$v_car"..i
		vehicle_show(v)
		vehicle_attach_to_carrier(v, "wr09_$v_trailer", i - 1)
		vehicle_set_hostile(v, true)
		turn_invulnerable(v)
		set_unjackable_flag(v, true)
		on_take_damage("wr09_car_damage", v)
		Wr09_vehicle_hits[v] = 20
	end
		
	Wr09_threads["distance_check"] = thread_new("wr09_distance_check")
	Wr09_threads["price_behavior"] = thread_new("wr09_price_behavior")
	delay(2)
	mission_help_table("wr09_chase_price")
end

function wr09_player_died()
	wr09_kill_all_threads()
	mission_end_failure("wr09")
end

function wr09_distance_check()
	hud_timer_set(120 * 1000, "wr09_distance_timer_expired")
	
	vehicle_speed_override("wr09_$v_price", 70)
	
	while true do
		if get_dist_char_to_vehicle("#PLAYER#", "wr09_$v_price") < 100 then
			break
		end
		delay(0.1)
	end
	
	hud_timer_stop()
	mission_help_table("wr09_spotted_price")
	distance_display_on("wr09_$c_price", 0, 150, 0, 150)
	car_carrier_boss_ai_init("wr09_$c_price")
	Wr09_threads["taunts"] = thread_new("wr09_taunt_loop")
	
	on_collision("wr09_ram", "#PLAYER#")

	local d
	local timer_running = false
	while true do
		d = get_dist_char_to_char("#PLAYER#", "wr09_$c_price")
		
		if d > 150 and timer_running == false then
			-- 10 seconds to get back in range
			vehicle_speed_override("wr09_$v_price", 40)
			hud_timer_set(30 * 1000, "wr09_distance_timer_expired")
			timer_running = true
		elseif d <= 150 and timer_running == true then
			vehicle_speed_override("wr09_$v_price", 70)
			hud_timer_stop()
			timer_running = false
		end
		
		delay(0.1)
	end
end

function wr09_distance_timer_expired()
	wr09_kill_all_threads()
	mission_end_failure("wr09", "wr09_got_away")
end

function wr09_car_damage(vehicle, attacker)
	if attacker == "#PLAYER#" then
		local hits = Wr09_vehicle_hits[vehicle]
		if hits > 0 then
			hits = hits - 1
			Wr09_vehicle_hits[vehicle] = hits

			if hits == 0 then
				vehicle_set_smoke_and_fire_state(vehicle, true, true)
				delay(4)
				turn_vulnerable(vehicle)
				vehicle_detonate(vehicle)
				wr09_car_destroyed()
			elseif hits < 25 then
				vehicle_set_smoke_and_fire_state(vehicle, true, false)
			end
		end
	end

	mission_debug("cars left: "..Wr09_cars_left, -1, 3)
	mission_debug("hp left: "..Wr09_price_hits_left, -1, 4)
end

function wr09_car_destroyed()
	Wr09_cars_left = Wr09_cars_left - 1
	
	thread_new("wr09_damage")
	
	Wr09_price_hits_left = Wr09_price_hits_left - Wr09_damage_to_truck_per_car_destroyed
	hud_bar_set_value(Wr09_price_hits_left)
	
	if Wr09_cars_left == 0 then
		delay(3)
		vehicle_infinite_mass("wr09_$v_trailer", false)
		vehicle_detach_trailer("wr09_$v_price")
		on_take_damage("wr09_big_rig_damaged", "wr09_$v_price")
		remove_marker_vehicle("wr09_$v_trailer")
		add_marker_vehicle("wr09_$v_price", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		mission_help_table("wr09_destroy_cab")
	elseif Wr09_cars_left < 2 then
		vehicle_set_smoke_and_fire_state("wr09_$v_price", true, true)
	elseif Wr09_cars_left < 3 then
		vehicle_set_smoke_and_fire_state("wr09_$v_price", true, false)
		notoriety_set_max("rollers", 3)
		notoriety_set_min("rollers", 3)
	elseif Wr09_cars_left == 3 then
		mission_help_table("wr09_first_car_destroyed")
		notoriety_set_min("rollers", 2)
	end
end

function wr09_kill_rig()
	if Wr09_threads["distance_check"] ~= nil then
		thread_kill(Wr09_threads["distance_check"])
	end
	
	if Wr09_threads["taunts"] ~= nil then
		thread_kill(Wr09_threads["taunts"])
	end
	
	on_take_damage("", "wr09_$v_price")
	on_collision("", "#PLAYER#")

	distance_display_off()
	hud_bar_off()
	vehicle_speed_override("wr09_$v_price", 1000)
	vehicle_set_torque_multiplier("wr09_$v_price", 2)
	wr09_kill_all_threads()
	
	audio_play_for_character("PRICE_WR9_DIE_1", "wr09_$c_price", "voice", false, true)
	delay(1)
	turn_vulnerable("wr09_$v_price")
	delay(0.1)
	vehicle_detonate("wr09_$v_price")
	delay(3)

	if not is_dead("#PLAYER#") then
		cutscene_in("wr09_scene04")
		release_to_world("wr09_$v_courtesy_car")
		destroy_group("wr09_$g_price")
		cutscene_play("wr09_scene04", true)
		teleport("#PLAYER#", "wr09_player_port")
		mission_end_success("wr09")
	end	
end

function wr09_big_rig_damaged(attacked, attacker)
	if is_vehicle_destroyed(attacked) then
		wr09_kill_rig()
		return
	end

	if attacker == "#PLAYER#" then
		Wr09_price_hits_left = Wr09_price_hits_left - 1
		hud_bar_set_value(Wr09_price_hits_left)
		thread_new("wr09_damage")
		
		if Wr09_price_hits_left > 0 then
			hud_bar_set_value(Wr09_price_hits_left)
		else			
			wr09_kill_rig()
		end
	end
end

function wr09_price_behavior()
	vehicle_pathfind_to("wr09_$v_price", Wr09_price_waypoints_start, true, false)
	
	while true do
		vehicle_pathfind_to("wr09_$v_price", Wr09_price_waypoints_loop, true, false)
		delay(0.1)
	end
end

function wr09_destroy_car_now()
	for i = 1, 7 do
		local v = "wr09_$v_car"..i
		
		if is_vehicle_destroyed(v) == false then
			turn_vulnerable(v)
			vehicle_detonate(v)
			wr09_car_destroyed()
			break
		end
	end
end
