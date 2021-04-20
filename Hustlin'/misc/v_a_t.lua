-- vehicle ambient transition test mission
-- requested by DaveA
-- Global Variables------


-- FUNCTIONS ----------------------------

V_a_t_navs = {"v_a_t_$n0000", "v_a_t_$n0001", "v_a_t_$n0002", "v_a_t_$n0003", "v_a_t_$n0004", "v_a_t_$n0005", "v_a_t_$n0006", "v_a_t_$n_end"}

function v_a_t_cleanup()
	release_to_world("v_a_t_$v_free_car")
	group_destroy("v_a_t_$Group000")
end

-- Sets up phase 1
-- Called by mission trigger
function v_a_t_start()
	set_mission_author("Sean Rose")
	
	group_create("v_a_t_$Group000", true)
	
	character_add_vehicle("v_a_t_$c_driver", "v_a_t_$v_truck", 0)
	
	vehicle_attach_trailer("v_a_t_$v_truck", "v_a_t_$v_trailer")
	
	trigger_enable("v_a_t_$t_spline")
	trigger_enable("v_a_t_$t_navmesh")
	
	on_trigger("v_a_t_nav_mesh", "v_a_t_$t_navmesh") 
	on_trigger("v_a_t_spline", "v_a_t_$t_spline") 
	
	add_marker_trigger("v_a_t_$t_navmesh", MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
	add_marker_trigger("v_a_t_$t_spline", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)
end

function v_a_t_nav_mesh()
	remove_marker_trigger("v_a_t_$t_navmesh")
	remove_marker_trigger("v_a_t_$t_spline")

	trigger_disable("v_a_t_$t_spline")
	trigger_disable("v_a_t_$t_navmesh")

	character_add_vehicle("#PLAYER#", "v_a_t_$v_free_car", 0)
	
	car_carrier_boss_ai_init("v_a_t_$c_driver")	
	
	vehicle_pathfind_to("v_a_t_$v_truck", V_a_t_navs, true, true)
	
	mission_end_success("v_a_t")
end

function v_a_t_spline()
	remove_marker_trigger("v_a_t_$t_navmesh")
	remove_marker_trigger("v_a_t_$t_spline")

	trigger_disable("v_a_t_$t_spline")
	trigger_disable("v_a_t_$t_navmesh")

	character_add_vehicle("#PLAYER#", "v_a_t_$v_free_car", 0)

	car_carrier_boss_ai_init("v_a_t_$c_driver")
	
	vehicle_pathfind_to("v_a_t_$v_truck", "v_a_t_$n_end", false, true)
	
	mission_end_success("v_a_t")
end