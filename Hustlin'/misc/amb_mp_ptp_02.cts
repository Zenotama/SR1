// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_ptp_02_roomtone"
$Type:		"floating"
$Pos:			<43.424118 -0.000031 74.457718>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke1"
$Type:		"floating"
$Pos:			<111.999054 0 -93.841934>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke2"
$Type:		"floating"
$Pos:			<100.339005 0 -84.269554>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke3"
$Type:		"floating"
$Pos:			<157.738632 1.532260 -98.981186>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke4"
$Type:		"floating"
$Pos:			<69.666641 0.924567 -60.272869>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke5"
$Type:		"floating"
$Pos:			<40.623676 5.474413 -23.456856>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke6"
$Type:		"floating"
$Pos:			<-0.234336 -0.000002 52.780495>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_Musak1"
$Type:		"floating"
$Pos:			<46.182533 12.550514 31.402130>
$Orient:		[I]

$Navpoint:	"amb_mp_ptp_02_securityradio_1"
$Type:		"floating"
$Pos:			<26.823147 4.745014 -32.038925>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_securityradio_2"
$Type:		"floating"
$Pos:			<21.828705 4.456000 -82.736305>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_excluder_2"
$Type:		"floating"
$Pos:			<19.606834 3.946110 -63.091034>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_excluder_3"
$Type:		"floating"
$Pos:			<23.911245 3.960538 -51.492329>
$Orient:		[-1.570770]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_excluder_4"
$Type:		"floating"
$Pos:			<0.834776 4.443213 3.932561>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_excluder_5"
$Type:		"floating"
$Pos:			<-8.709474 8.910948 106.780243>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_securityradio_3"
$Type:		"floating"
$Pos:			<-9.966696 4.746685 -87.618484>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke7"
$Type:		"floating"
$Pos:			<3.736535 0.000130 -45.482704>
$Orient:		[0.177942]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_coke8"
$Type:		"floating"
$Pos:			<23.219837 -0.020972 87.082764>
$Orient:		[0.031331]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_securityradio_4"
$Type:		"floating"
$Pos:			<51.183949 4.744998 -24.994312>
$Orient:		[I]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_reverb_1"
$Type:		"ground"
$Pos:			<16.065929 16.897091 42.266266>
$Orient:		[0.000933]
+Chunk:		"mp_ptp_02"

$Navpoint:	"amb_mp_ptp_02_excluder_1"
$Type:		"floating"
$Pos:			<11.825365 6.649853 -79.450203>
$Orient:		[-1.570770]
+Chunk:		"mp_ptp_02"

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

$Ambient:	"amb_mp_ptp_02_roomtone"
	$Navpoint:	"amb_mp_ptp_02_roomtone"
	$Shape:	"Cylinder"
		$Inner Radius:	372.75
		$Outer Radius:	799.00
		$Inner Height:	131.13
		$Outer Height:	221.88
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1375
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_med_1.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke1"
	$Navpoint:	"amb_mp_ptp_02_coke1"
	$Shape:	"Sphere"
		$Inner Radius:	1.38
		$Outer Radius:	8.63
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1875
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_1.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke2"
	$Navpoint:	"amb_mp_ptp_02_coke2"
	$Shape:	"Sphere"
		$Inner Radius:	1.50
		$Outer Radius:	9.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1750
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_2.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke3"
	$Navpoint:	"amb_mp_ptp_02_coke3"
	$Shape:	"Sphere"
		$Inner Radius:	0.63
		$Outer Radius:	4.13
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1875
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_2.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke4"
	$Navpoint:	"amb_mp_ptp_02_coke4"
	$Shape:	"Sphere"
		$Inner Radius:	0.75
		$Outer Radius:	5.50
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2000
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_1.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke5"
	$Navpoint:	"amb_mp_ptp_02_coke5"
	$Shape:	"Sphere"
		$Inner Radius:	0.75
		$Outer Radius:	6.88
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2000
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_2.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke6"
	$Navpoint:	"amb_mp_ptp_02_coke6"
	$Shape:	"Sphere"
		$Inner Radius:	0.88
		$Outer Radius:	9.75
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2000
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_1.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_Musak1"
	$Navpoint:	"amb_mp_ptp_02_Musak1"
	$Shape:	"Box"
		$Inner Dimensions:	<416.500000 114 400.625000>
		$Outer Dimensions:	<425.750000 114.500000 404.500000>
	$Inner Offset:	<0 0 0>
	$Emitter:	"muzak"
		$Volume:	0.0250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_airport_muzak_st_1.wav"
		+File:	"amb_airport_muzak_st_2.wav"
		+File:	"amb_airport_muzak_st_3.wav"
		+File:	"amb_airport_muzak_st_4.wav"
		+File:	"amb_airport_muzak_st_5.wav"
		+File:	"amb_airport_muzak_st_6.wav"
		+File:	"amb_airport_muzak_st_7.wav"
		+File:	"amb_airport_muzak_st_8.wav"
	$Emitter:	"flybys"
		$Volume:	0.3000
		$Min Delay:	30000
		$Max Delay:	120000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_veh_flyby_plane_1.wav"
		+File:	"amb_ext_veh_flyby_plane_2.wav"
	$Emitter:	"page"
		$Volume:	0.4750
		$Min Delay:	40000
		$Max Delay:	120000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_phone_page_1.wav"
		+File:	"amb_ext_phone_page_10.wav"
		+File:	"amb_ext_phone_page_11.wav"
		+File:	"amb_ext_phone_page_14.wav"
		+File:	"amb_ext_phone_page_15.wav"
		+File:	"amb_ext_phone_page_16.wav"
		+File:	"amb_ext_phone_page_2.wav"
		+File:	"amb_ext_phone_page_3.wav"
		+File:	"amb_ext_phone_page_4.wav"
		+File:	"amb_ext_phone_page_5.wav"
		+File:	"amb_ext_phone_page_8.wav"
		+File:	"amb_ext_phone_page_9.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_securityradio_1"
	$Navpoint:	"amb_mp_ptp_02_securityradio_1"
	$Shape:	"Sphere"
		$Inner Radius:	4.00
		$Outer Radius:	16.63
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	20000
		$Max Delay:	30000
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

$Ambient:	"amb_mp_ptp_02_securityradio_2"
	$Navpoint:	"amb_mp_ptp_02_securityradio_2"
	$Shape:	"Sphere"
		$Inner Radius:	4.00
		$Outer Radius:	16.63
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	20000
		$Max Delay:	30000
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

$Ambient:	"amb_mp_ptp_02_securityradio_3"
	$Navpoint:	"amb_mp_ptp_02_securityradio_3"
	$Shape:	"Sphere"
		$Inner Radius:	4.00
		$Outer Radius:	16.75
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	20000
		$Max Delay:	30000
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

$Ambient:	"amb_mp_ptp_02_coke7"
	$Navpoint:	"amb_mp_ptp_02_coke7"
	$Shape:	"Sphere"
		$Inner Radius:	1.50
		$Outer Radius:	8.50
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1750
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_1.wav"
	+Masked

$Ambient:	"amb_mp_ptp_02_coke8"
	$Navpoint:	"amb_mp_ptp_02_coke8"
	$Shape:	"Sphere"
		$Inner Radius:	1.50
		$Outer Radius:	8.50
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1750
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_coke_machine_1.wav"

$Ambient:	"amb_mp_ptp_02_securityradio_4"
	$Navpoint:	"amb_mp_ptp_02_securityradio_4"
	$Shape:	"Sphere"
		$Inner Radius:	4.00
		$Outer Radius:	16.50
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	20000
		$Max Delay:	30000
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

// ----------
#DSP Regions
// ----------

$DSP:	"amb_mp_ptp_02_reverb_1"
	$Navpoint:	"amb_mp_ptp_02_reverb_1"
	$Shape:	"Box"
		$Inner Dimensions:	<108.500000 76 348>
		$Outer Dimensions:	<151.875000 76.250000 348.250000>
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.325
	+Masked

// -------------
#Audio Cluders
// -------------

$Cluder:	"amb_mp_ptp_02_excluder_2"
	$Navpoint:	"amb_mp_ptp_02_excluder_2"
	$Rotation:	<0 0 0>
	$Inner:	16.000000	16.000000
	$Outer:	20.000000	20.000000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.200000
	+Masked

$Cluder:	"amb_mp_ptp_02_excluder_3"
	$Navpoint:	"amb_mp_ptp_02_excluder_3"
	$Rotation:	<0 90 0>
	$Inner:	28.250000	16.000000
	$Outer:	32.375000	20.000000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.200000
	+Masked

$Cluder:	"amb_mp_ptp_02_excluder_4"
	$Navpoint:	"amb_mp_ptp_02_excluder_4"
	$Rotation:	<90 0 0>
	$Inner:	38.375000	16.000000
	$Outer:	39.375000	24.750000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.200000
	+Masked

$Cluder:	"amb_mp_ptp_02_excluder_5"
	$Navpoint:	"amb_mp_ptp_02_excluder_5"
	$Rotation:	<90 0 0>
	$Inner:	24.375000	9.250000
	$Outer:	24.375000	13.625000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.200000
	+Masked

$Cluder:	"amb_mp_ptp_02_excluder_1"
	$Navpoint:	"amb_mp_ptp_02_excluder_1"
	$Rotation:	<0 90 0>
	$Inner:	19.500000	11.250000
	$Outer:	23.000000	14.625000
	$Offset:	1.750000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.200000
	+Masked

// -------
#Nodes
// -------


#End
