// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor1"
$Type:		"floating"
$Pos:			<-3.750883 9.078643 -23.519222>
$Orient:		[<1.000001 0 0> <0 0.000026 -1.000001> <0 1 0.000026>]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor2"
$Type:		"floating"
$Pos:			<11.090935 9.688755 14.230669>
$Orient:		[<0.999848 0 -0.017452> <-0.017452 0.000026 -0.999848> <0 1 0.000026>]

$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor3"
$Type:		"floating"
$Pos:			<-22.761080 9.476007 13.269672>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor4"
$Type:		"floating"
$Pos:			<-8.941008 9.487532 18.526840>
$Orient:		[<1 0 0> <0 0.000026 -1.000001> <0 1.000001 0.000026>]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_clud_1stfloor1"
$Type:		"floating"
$Pos:			<8.935905 4.326575 -35.450462>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]

$Navpoint:	"amb_mp_ptp_03_clud_1stfloor2"
$Type:		"floating"
$Pos:			<18.961559 4.397891 0.194420>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_clud_1stfloor3"
$Type:		"floating"
$Pos:			<-13.267447 4.305459 11.107353>
$Orient:		[<1 0 0> <0 0.000026 -1.000001> <0 1.000001 0.000026>]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_clud_1stfloor4"
$Type:		"floating"
$Pos:			<-25.392101 3.724479 -28.483625>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]

$Navpoint:	"amb_mp_ptp_03_security_1"
$Type:		"floating"
$Pos:			<31.027052 1.477482 9.203842>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_security_2"
$Type:		"floating"
$Pos:			<11.695259 6.629477 -21.693113>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_roomtone_1"
$Type:		"floating"
$Pos:			<-0.463034 14.500061 -1.836108>
$Orient:		[0.000171]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_security_3"
$Type:		"floating"
$Pos:			<21.127363 11.952711 -1.574047>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"amb_mp_ptp_03_neg"
$Type:		"ground"
$Pos:			<-1.191380 10.000137 -4.232861>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

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

$Ambient:	"amb_mp_ptp_03_security_1"
	$Navpoint:	"amb_mp_ptp_03_security_1"
	$Shape:	"Cylinder"
		$Inner Radius:	3.75
		$Outer Radius:	11.00
		$Inner Height:	3.25
		$Outer Height:	5.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	10000
		$Max Delay:	20000
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

$Ambient:	"amb_mp_ptp_03_security_2"
	$Navpoint:	"amb_mp_ptp_03_security_2"
	$Shape:	"Cylinder"
		$Inner Radius:	2.88
		$Outer Radius:	10.88
		$Inner Height:	3.00
		$Outer Height:	4.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	10000
		$Max Delay:	20000
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

$Ambient:	"amb_mp_ptp_03_roomtone_1"
	$Navpoint:	"amb_mp_ptp_03_roomtone_1"
	$Shape:	"Cylinder"
		$Inner Radius:	94.00
		$Outer Radius:	94.88
		$Inner Height:	38.00
		$Outer Height:	38.63
	$Inner Offset:	<0 0 0>
	$Emitter:	"room tone"
		$Volume:	0.2500
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_med_1.wav"
	$Emitter:	"muzak"
		$Volume:	0.0475
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_airport_muzak_st_4.wav"
		+File:	"amb_airport_muzak_st_5.wav"
	$Emitter:	"page"
		$Volume:	0.6000
		$Min Delay:	30000
		$Max Delay:	60000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_hospital_pa_1.wav"
		+File:	"amb_hospital_pa_2.wav"
		+File:	"amb_hospital_pa_3.wav"
		+File:	"amb_hospital_pa_4.wav"
		+File:	"amb_hospital_pa_5.wav"
		+File:	"amb_hospital_pa_6.wav"
		+File:	"amb_hospital_pa_7.wav"
		+File:	"amb_hospital_pa_8.wav"
		+File:	"amb_hospital_pa_9.wav"
		+File:	"amb_hospital_pa_10.wav"
	+Masked

$Ambient:	"amb_mp_ptp_03_security_3"
	$Navpoint:	"amb_mp_ptp_03_security_3"
	$Shape:	"Box"
		$Inner Dimensions:	<4 4 4>
		$Outer Dimensions:	<7.875000 4.875000 17>
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	10000
		$Max Delay:	20000
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

// ---------------
#Negative Regions
// ---------------

$Negative:	"amb_mp_ptp_03_neg"
	$Navpoint:	"amb_mp_ptp_03_neg"
	$Shape:	"Box"
		$Inner Dimensions:	<234 87 245.500000>
		$Outer Dimensions:	<234.750000 87.500000 246>
	$Inner Offset:	<0 0 0>
	$Min Volume:	0.000
	$LPF Send Level:	0.250
	$Reverb Send Level:	0.999
	+Masked

// ----------
#DSP Regions
// ----------

// -------------
#Audio Cluders
// -------------

$Cluder:	"amb_mp_ptp_03_clud_2ndfloor1"
	$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor1"
	$Rotation:	<90 0 0>
	$Inner:	62.625000	33.875000
	$Outer:	63.500000	35.125000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_2ndfloor2"
	$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor2"
	$Rotation:	<90 0 -1>
	$Inner:	33.625000	42.250000
	$Outer:	34.750000	45.375000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_2ndfloor3"
	$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor3"
	$Rotation:	<90 0 0>
	$Inner:	19.625000	40.250000
	$Outer:	21.375000	40.250000
	$Offset:	-0.875000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_2ndfloor4"
	$Navpoint:	"amb_mp_ptp_03_clud_2ndfloor4"
	$Rotation:	<90 0 0>
	$Inner:	9.875000	29.250000
	$Outer:	11.500000	29.250000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_1stfloor1"
	$Navpoint:	"amb_mp_ptp_03_clud_1stfloor1"
	$Rotation:	<90 0 0>
	$Inner:	46.000000	16.000000
	$Outer:	46.375000	16.625000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_1stfloor2"
	$Navpoint:	"amb_mp_ptp_03_clud_1stfloor2"
	$Rotation:	<90 0 0>
	$Inner:	27.125000	76.750000
	$Outer:	28.250000	77.875000
	$Offset:	0.375000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_1stfloor3"
	$Navpoint:	"amb_mp_ptp_03_clud_1stfloor3"
	$Rotation:	<90 0 0>
	$Inner:	34.375000	56.875000
	$Outer:	46.375000	60.250000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

$Cluder:	"amb_mp_ptp_03_clud_1stfloor4"
	$Navpoint:	"amb_mp_ptp_03_clud_1stfloor4"
	$Rotation:	<90 0 0>
	$Inner:	27.625000	24.250000
	$Outer:	28.750000	25.375000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	#Interior
	$Volume:	0.025000
	+Masked

// -------
#Nodes
// -------


#End
