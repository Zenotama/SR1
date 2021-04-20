// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_bac_02_roomtone"
$Type:		"floating"
$Pos:			<6.629148 0.888977 -5.819134>
$Orient:		[-0.016399]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_negative"
$Type:		"floating"
$Pos:			<6.563415 -0.372789 -4.688766>
$Orient:		[-0.017500]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine01"
$Type:		"floating"
$Pos:			<33.279408 2.453169 -12.127019>
$Orient:		[-0.011330]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine02"
$Type:		"floating"
$Pos:			<16.978821 3.774943 -24.499447>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine03"
$Type:		"floating"
$Pos:			<5.187090 4.347455 -30.980869>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine04"
$Type:		"floating"
$Pos:			<5.013208 2.507003 14.219459>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine05"
$Type:		"floating"
$Pos:			<-7.417296 2.717036 23.031681>
$Orient:		[-0.028039]

$Navpoint:	"amb_mp_bac_02_machine06"
$Type:		"floating"
$Pos:			<-11.830420 2.591083 0.216624>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine07"
$Type:		"floating"
$Pos:			<-13.358305 6.096134 12.459426>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_reverb"
$Type:		"floating"
$Pos:			<15.754883 0.030762 0.797150>
$Orient:		[-0.016083]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine08"
$Type:		"floating"
$Pos:			<-19.292597 5.440580 -24.451927>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine09"
$Type:		"floating"
$Pos:			<-19.803093 4.372718 -14.769928>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_machine10"
$Type:		"floating"
$Pos:			<-7.122602 5.179130 -25.477129>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_guardradio01"
$Type:		"floating"
$Pos:			<-37.616333 2.766600 -6.944893>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_guardradio02"
$Type:		"floating"
$Pos:			<-37.336491 8.517845 -1.419569>
$Orient:		[-0.006035]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_cluder01"
$Type:		"floating"
$Pos:			<-36.958961 6.660779 -1.298236>
$Orient:		[<1 0 0> <0 0.000026 1> <0 -1 0.000026>]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_transformer01"
$Type:		"floating"
$Pos:			<-31.162201 0.950940 -0.131399>
$Orient:		[I]
+Chunk:		"mp_bac_02"

$Navpoint:	"amb_mp_bac_02_cluder02"
$Type:		"floating"
$Pos:			<-34.677036 2.408523 -1.020181>
$Orient:		[I]
+Chunk:		"mp_bac_02"

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

$Ambient:	"amb_mp_bac_02_roomtone"
	$Navpoint:	"amb_mp_bac_02_roomtone"
	$Shape:	"Box"
		$Inner Dimensions:	<182.125000 80.375000 222.750000>
		$Outer Dimensions:	<190 82.750000 230>
	$Inner Offset:	<0 0 0>
	$Emitter:	"roomtone"
		$Volume:	0.4625
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_ind_1.wav"
	$Emitter:	"Industrial_1"
		$Volume:	0.2250
		$Min Delay:	8000
		$Max Delay:	20000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_int_garage_metaldrag_1.wav"
		+File:	"amb_int_garage_metaldrag_2.wav"
		+File:	"amb_int_garage_metaldrag_3.wav"
		+File:	"amb_int_garage_metaldrop_1.wav"
		+File:	"amb_int_garage_metaldrop_2.wav"
		+File:	"amb_int_garage_metaldrop_3.wav"
		+File:	"amb_int_garage_metaldrop_4.wav"
		+File:	"amb_int_garage_metaldrop_5.wav"
		+File:	"amb_int_garage_metaldrop_6.wav"
	$Emitter:	"Industrial_2"
		$Volume:	0.4000
		$Min Delay:	6000
		$Max Delay:	10000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_ind_steam_rls_1.wav"
		+File:	"amb_int_ind_steam_vent_1.wav"
		+File:	"amb_int_ind_steam_vent_2.wav"
	$Emitter:	"Car Alarms"
		$Volume:	0.2000
		$Min Delay:	40000
		$Max Delay:	180000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"walla_ext_car_alarm_1.wav"
		+File:	"walla_ext_car_alarm_2.wav"
		+File:	"walla_ext_car_alarm_3.wav"
		+File:	"walla_ext_car_alarm_4.wav"
	$Emitter:	"planes"
		$Volume:	0.3000
		$Min Delay:	120000
		$Max Delay:	180000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_veh_flyby_plane_1.wav"
		+File:	"amb_ext_veh_flyby_plane_2.wav"
	$Emitter:	"sirens"
		$Volume:	0.1875
		$Min Delay:	60000
		$Max Delay:	180000
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

$Ambient:	"amb_mp_bac_02_machine01"
	$Navpoint:	"amb_mp_bac_02_machine01"
	$Shape:	"Sphere"
		$Inner Radius:	6.75
		$Outer Radius:	24.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_machine_2.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine02"
	$Navpoint:	"amb_mp_bac_02_machine02"
	$Shape:	"Sphere"
		$Inner Radius:	8.00
		$Outer Radius:	29.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_machine_3.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine03"
	$Navpoint:	"amb_mp_bac_02_machine03"
	$Shape:	"Sphere"
		$Inner Radius:	6.00
		$Outer Radius:	17.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_med_4.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine04"
	$Navpoint:	"amb_mp_bac_02_machine04"
	$Shape:	"Sphere"
		$Inner Radius:	7.00
		$Outer Radius:	26.50
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_machine_3.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine05"
	$Navpoint:	"amb_mp_bac_02_machine05"
	$Shape:	"Sphere"
		$Inner Radius:	7.00
		$Outer Radius:	23.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_vent_md_1.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine06"
	$Navpoint:	"amb_mp_bac_02_machine06"
	$Shape:	"Box"
		$Inner Dimensions:	<7.375000 6.750000 6.125000>
		$Outer Dimensions:	<14.250000 18.625000 19.500000>
	$Inner Offset:	<0 0 -1.375000>
	$Emitter:	"list_0"
		$Volume:	0.3000
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_ac_unit_2.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine07"
	$Navpoint:	"amb_mp_bac_02_machine07"
	$Shape:	"Sphere"
		$Inner Radius:	11.00
		$Outer Radius:	23.25
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_large_4.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine08"
	$Navpoint:	"amb_mp_bac_02_machine08"
	$Shape:	"Sphere"
		$Inner Radius:	8.00
		$Outer Radius:	26.75
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_engine_large_2.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine09"
	$Navpoint:	"amb_mp_bac_02_machine09"
	$Shape:	"Sphere"
		$Inner Radius:	6.25
		$Outer Radius:	25.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3000
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_vent_md_1.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_machine10"
	$Navpoint:	"amb_mp_bac_02_machine10"
	$Shape:	"Sphere"
		$Inner Radius:	6.50
		$Outer Radius:	16.25
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3000
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_turbine_3.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_guardradio01"
	$Navpoint:	"amb_mp_bac_02_guardradio01"
	$Shape:	"Box"
		$Inner Dimensions:	<5.750000 3.250000 5.625000>
		$Outer Dimensions:	<9.500000 5 11>
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	5000
		$Max Delay:	10000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_guard_radio_4.wav"
		+File:	"amb_ext_guard_radio_5.wav"
		+File:	"amb_ext_guard_radio_6.wav"
		+File:	"amb_ext_guard_radio_7.wav"
		+File:	"amb_ext_guard_radio_8.wav"
		+File:	"amb_ext_guard_radio_9.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_guardradio02"
	$Navpoint:	"amb_mp_bac_02_guardradio02"
	$Shape:	"Cylinder"
		$Inner Radius:	4.13
		$Outer Radius:	8.88
		$Inner Height:	4.00
		$Outer Height:	4.13
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	5000
		$Max Delay:	10000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_guard_radio_4.wav"
		+File:	"amb_ext_guard_radio_5.wav"
		+File:	"amb_ext_guard_radio_6.wav"
		+File:	"amb_ext_guard_radio_7.wav"
		+File:	"amb_ext_guard_radio_8.wav"
		+File:	"amb_ext_guard_radio_9.wav"
	+Masked

$Ambient:	"amb_mp_bac_02_transformer01"
	$Navpoint:	"amb_mp_bac_02_transformer01"
	$Shape:	"Sphere"
		$Inner Radius:	3.25
		$Outer Radius:	7.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_transformer_1.wav"
	+Masked

// ---------------
#Negative Regions
// ---------------

$Negative:	"amb_mp_bac_02_negative"
	$Navpoint:	"amb_mp_bac_02_negative"
	$Shape:	"Box"
		$Inner Dimensions:	<205 96 247.250000>
		$Outer Dimensions:	<210 98 250>
	$Inner Offset:	<0 0 0>
	$Min Volume:	0.000
	$LPF Send Level:	0.000
	$Reverb Send Level:	0.999
	+Masked

// ----------
#DSP Regions
// ----------

$DSP:	"amb_mp_bac_02_reverb"
	$Navpoint:	"amb_mp_bac_02_reverb"
	$Shape:	"Box"
		$Inner Dimensions:	<88.125000 54 178.750000>
		$Outer Dimensions:	<94 55.625000 180.500000>
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.500
	+Masked

// -------------
#Audio Cluders
// -------------

$Cluder:	"amb_mp_bac_02_cluder01"
	$Navpoint:	"amb_mp_bac_02_cluder01"
	$Rotation:	<-90 0 0>
	$Inner:	14.875000	24.000000
	$Outer:	15.250000	24.750000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.250000
	+Masked

$Cluder:	"amb_mp_bac_02_cluder02"
	$Navpoint:	"amb_mp_bac_02_cluder02"
	$Rotation:	<0 0 0>
	$Inner:	9.500000	8.375000
	$Outer:	11.500000	8.500000
	$Offset:	0.500000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.200000
	+Masked

// -------
#Nodes
// -------


#End
