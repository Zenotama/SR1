// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mplobby_01_roomtone"
$Type:		"floating"
$Pos:			<0.173887 1.437415 0.045898>
$Orient:		[-0.006163]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_cokemachine"
$Type:		"floating"
$Pos:			<20.577488 0.083270 -7.505914>
$Orient:		[0.104798]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_distantact"
$Type:		"floating"
$Pos:			<0.979269 0 22.466867>
$Orient:		[I]

$Navpoint:	"amb_mplobby_01_negative_1"
$Type:		"ground"
$Pos:			<-1.415462 1.175722 -0.155866>
$Orient:		[-0.009204]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_city"
$Type:		"floating"
$Pos:			<-15.186783 0.004997 -41.999458>
$Orient:		[I]

$Navpoint:	"amb_mplobby_01_machine1"
$Type:		"floating"
$Pos:			<12.990548 0.025626 9.699883>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine2"
$Type:		"floating"
$Pos:			<-15.920000 0.000003 12.929717>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine3"
$Type:		"floating"
$Pos:			<-9.699493 -0.000005 -4.781847>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine4"
$Type:		"floating"
$Pos:			<-2.722030 0 -15.642605>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine5"
$Type:		"floating"
$Pos:			<-7.994335 0.000000 -9.284783>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine6"
$Type:		"floating"
$Pos:			<-18.178946 -0.000003 4.397070>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine7"
$Type:		"floating"
$Pos:			<-17.796574 0.000001 -3.642968>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine8"
$Type:		"floating"
$Pos:			<-4.522009 0.000003 8.543646>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_machine9"
$Type:		"floating"
$Pos:			<4.935407 0 5.886008>
$Orient:		[I]
+Chunk:		"mplobby_01"

$Navpoint:	"amb_mplobby_01_radiator"
$Type:		"floating"
$Pos:			<18.669617 0.000001 -17.481853>
$Orient:		[I]

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

// -------
#Humans
// -------

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

$Ambient:	"amb_mplobby_01_roomtone"
	$Navpoint:	"amb_mplobby_01_roomtone"
	$Shape:	"Box"
		$Inner Dimensions:	<49 25 59>
		$Outer Dimensions:	<50 26 60>
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2500
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_large_3.wav"
	+Masked

$Ambient:	"amb_mplobby_01_city"
	$Navpoint:	"amb_mplobby_01_city"
	$Shape:	"Cylinder"
		$Inner Radius:	71.13
		$Outer Radius:	160.00
		$Inner Height:	15.25
		$Outer Height:	85.00
	$Inner Offset:	<0 32.625000 -75.750000>
	$Emitter:	"horns"
		$Volume:	0.2000
		$Min Delay:	20000
		$Max Delay:	60000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_car_horn_1.wav"
		+File:	"amb_ext_car_horn_2.wav"
		+File:	"amb_ext_car_horn_3.wav"
		+File:	"amb_ext_car_horn_4.wav"
		+File:	"amb_ext_car_horn_5.wav"
		+File:	"amb_ext_car_horn_6.wav"
	$Emitter:	"distant bass"
		$Volume:	0.2500
		$Min Delay:	60000
		$Max Delay:	120000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_distnt_bass_1.wav"
		+File:	"amb_ext_distnt_bass_2.wav"
		+File:	"amb_ext_distnt_bass_3.wav"
		+File:	"amb_ext_distnt_bass_4.wav"
		+File:	"amb_ext_distnt_bass_5.wav"
	$Emitter:	"gunshots"
		$Volume:	0.4500
		$Min Delay:	30000
		$Max Delay:	80000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_gun_shot_1.wav"
		+File:	"amb_ext_gun_shot_2.wav"
		+File:	"amb_ext_gun_shot_3.wav"
		+File:	"amb_ext_gun_shot_4.wav"
		+File:	"amb_ext_gun_shot_5.wav"
		+File:	"amb_ext_gun_shot_6.wav"
		+File:	"amb_ext_gunshots_1.wav"
		+File:	"amb_ext_gunshots_2.wav"
		+File:	"amb_ext_gunshots_3.wav"
		+File:	"amb_ext_gunshots_4.wav"
	$Emitter:	"drivebys"
		$Volume:	0.3000
		$Min Delay:	20000
		$Max Delay:	40000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_veh_drvby_bus_1.wav"
		+File:	"amb_ext_veh_drvby_bus_2.wav"
		+File:	"amb_ext_veh_drvby_bus_3.wav"
		+File:	"amb_ext_veh_drvby_car_1.wav"
		+File:	"amb_ext_veh_drvby_car_2.wav"
		+File:	"amb_ext_veh_drvby_car_3.wav"
		+File:	"amb_ext_veh_drvby_car_4.wav"
		+File:	"amb_ext_veh_drvby_car_5.wav"
		+File:	"amb_ext_veh_drvby_car_6.wav"
	$Emitter:	"sirens"
		$Volume:	0.4250
		$Min Delay:	40000
		$Max Delay:	120000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_veh_siren_1.wav"
		+File:	"amb_ext_veh_siren_2.wav"
		+File:	"amb_ext_veh_siren_3.wav"
		+File:	"amb_ext_veh_siren_4.wav"
		+File:	"amb_ext_veh_siren_5.wav"
		+File:	"amb_ext_veh_siren_6.wav"
	+Masked

$Ambient:	"amb_mplobby_01_cokemachine"
	$Navpoint:	"amb_mplobby_01_cokemachine"
	$Shape:	"Sphere"
		$Inner Radius:	3.88
		$Outer Radius:	17.75
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_2.wav"
	+Masked

$Ambient:	"amb_mplobby_01_distantact"
	$Navpoint:	"amb_mplobby_01_distantact"
	$Shape:	"Sphere"
		$Inner Radius:	1.75
		$Outer Radius:	40.00
	$Inner Offset:	<0 0 7.125000>
	$Emitter:	"list_0"
		$Volume:	0.1750
		$Min Delay:	20000
		$Max Delay:	50000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_int_garage_hoist_1.wav"
		+File:	"amb_int_garage_metaldrop_4.wav"
		+File:	"amb_int_garage_metaldrop_5.wav"
		+File:	"amb_int_garage_metaldrop_6.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine1"
	$Navpoint:	"amb_mplobby_01_machine1"
	$Shape:	"Sphere"
		$Inner Radius:	6.00
		$Outer Radius:	20.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_machine_2.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine2"
	$Navpoint:	"amb_mplobby_01_machine2"
	$Shape:	"Sphere"
		$Inner Radius:	1.50
		$Outer Radius:	20.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_machine_3.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine3"
	$Navpoint:	"amb_mplobby_01_machine3"
	$Shape:	"Sphere"
		$Inner Radius:	1.38
		$Outer Radius:	20.63
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_med_2.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine4"
	$Navpoint:	"amb_mplobby_01_machine4"
	$Shape:	"Sphere"
		$Inner Radius:	6.75
		$Outer Radius:	27.25
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_med_3.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine5"
	$Navpoint:	"amb_mplobby_01_machine5"
	$Shape:	"Sphere"
		$Inner Radius:	5.25
		$Outer Radius:	26.88
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_large_1.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine6"
	$Navpoint:	"amb_mplobby_01_machine6"
	$Shape:	"Sphere"
		$Inner Radius:	1.38
		$Outer Radius:	20.38
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_large_2.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine7"
	$Navpoint:	"amb_mplobby_01_machine7"
	$Shape:	"Sphere"
		$Inner Radius:	1.38
		$Outer Radius:	20.50
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_med_4.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine8"
	$Navpoint:	"amb_mplobby_01_machine8"
	$Shape:	"Sphere"
		$Inner Radius:	2.25
		$Outer Radius:	22.13
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_large_4.wav"
	+Masked

$Ambient:	"amb_mplobby_01_machine9"
	$Navpoint:	"amb_mplobby_01_machine9"
	$Shape:	"Sphere"
		$Inner Radius:	3.75
		$Outer Radius:	7.88
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_machine_2.wav"
	+Masked

$Ambient:	"amb_mplobby_01_radiator"
	$Navpoint:	"amb_mplobby_01_radiator"
	$Shape:	"Sphere"
		$Inner Radius:	2.13
		$Outer Radius:	9.13
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2500
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_neon_hum_3.wav"
	+Masked

// ---------------
#Negative Regions
// ---------------

$Negative:	"amb_mplobby_01_negative_1"
	$Navpoint:	"amb_mplobby_01_negative_1"
	$Shape:	"Box"
		$Inner Dimensions:	<54 29 63>
		$Outer Dimensions:	<55 30 64>
	$Inner Offset:	<0 0 0>
	$Min Volume:	0.250
	$LPF Send Level:	0.210
	$Reverb Send Level:	0.999
	+Masked

// ----------
#DSP Regions
// ----------

// -------------
#Audio Cluders
// -------------

// -------
#Nodes
// -------


#End
