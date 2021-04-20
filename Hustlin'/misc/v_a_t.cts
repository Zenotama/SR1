// -------
#Groups
// -------

$Group:	"v_a_t_$Group000"

// -------
#Navpoints
// -------

$Navpoint:	"v_a_t_$n_mission_start"
$Type:		"ground"
$Pos:			<950.924255 21.433563 -618.688416>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$t_spline"
$Type:		"ground"
$Pos:			<955.859314 21.373123 -620.748535>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$t_navmesh"
$Type:		"ground"
$Pos:			<946.673218 21.598831 -616.914612>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$v_truck"
$Type:		"ground"
$Pos:			<922.736145 21.334797 -686.501526>
$Orient:		[-2.862339]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$v_trailer"
$Type:		"ground"
$Pos:			<924.429993 21.343716 -680.540833>
$Orient:		[-2.862339]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$vehicle001"
$Type:		"ground"
$Pos:			<-418.698944 -2.764175 -89.505463>
$Orient:		[-0.750492]
+Chunk:		"sr_chunk04"

$Navpoint:	"v_a_t_$nav000"
$Type:		"ground"
$Pos:			<-420.797974 -2.832796 -91.184982>
$Orient:		[I]
+Chunk:		"sr_chunk04"

$Navpoint:	"v_a_t_$n_end"
$Type:		"ground"
$Pos:			<585.732483 21.343864 -1735.410645>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"v_a_t_$v_free_car"
$Type:		"ground"
$Pos:			<937.473267 21.403854 -656.045105>
$Orient:		[-2.722712]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$c_driver"
$Type:		"ground"
$Pos:			<924.832520 21.287029 -688.416199>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$n0000"
$Type:		"ground"
$Pos:			<910.632507 21.278656 -739.029114>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$n0001"
$Type:		"ground"
$Pos:			<899.796631 21.311916 -891.784241>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$n0002"
$Type:		"ground"
$Pos:			<887.241760 20.869551 -1037.484131>
$Orient:		[I]
+Chunk:		"sr_chunk09"

$Navpoint:	"v_a_t_$n0003"
$Type:		"ground"
$Pos:			<854.615051 20.191832 -1195.913208>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"v_a_t_$n0004"
$Type:		"ground"
$Pos:			<763.730957 21.213924 -1443.965454>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"v_a_t_$n0005"
$Type:		"ground"
$Pos:			<673.670532 20.359995 -1559.186646>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"v_a_t_$n0006"
$Type:		"ground"
$Pos:			<614.617310 18.707781 -1658.203369>
$Orient:		[I]
+Chunk:		"sr_chunk39"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"v_a_t_$t_spline"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"v_a_t_$t_spline"
+Disabled
$Sphere radius:		1.000000

$Trigger:				"v_a_t_$t_navmesh"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"v_a_t_$t_navmesh"
+Disabled
$Sphere radius:		1.000000

// -------
#Vehicles
// -------

$Vehicle:		"v_a_t_$v_truck"
$Vehicle type:	"truck_2dr_semi01"
$Start nav:		"v_a_t_$v_truck"
$Group:			"v_a_t_$Group000"
$Stream Distance:			50.000
+Invulnerable

$Vehicle:		"v_a_t_$v_trailer"
$Vehicle type:	"sp_trailer_carri01"
$Start nav:		"v_a_t_$v_trailer"
$Group:			"v_a_t_$Group000"
$Stream Distance:			50.000
+Invulnerable

$Vehicle:		"v_a_t_$v_free_car"
$Vehicle type:	"car_2dr_exoticsports02"
$Start nav:		"v_a_t_$v_free_car"
$Group:			"v_a_t_$Group000"
$Stream Distance:			50.000
+Invulnerable

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"v_a_t_$c_driver"
$Char type:				"AC_A_F_TanyaWinters"
$Start nav:				"v_a_t_$c_driver"
+Team:					"Vice Lords"
+Invulnerable
+Group:					"v_a_t_$Group000"

// -------
#Spawn NPC Regions
// -------

// -------
#Racing
// -------

// -------
#Strongholds
// -------

// -------
#Special Spawns
// -------

// -------
#Parking
// -------

// -------
#Chunk Streaming Test Cases
// -------

// -------
#Ambients
// -------

// ---------------
#Negative Regions
// ---------------

// -------------
#Audio Barriers
// -------------

// -------
#Nodes
// -------

// -------
#Movers
// -------



#End
