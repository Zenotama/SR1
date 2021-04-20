// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_ptp_01_clud_1stfloor"
$Type:		"floating"
$Pos:			<6.161573 5.420857 -23.619226>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_clud_2ndfloor"
$Type:		"floating"
$Pos:			<3.217886 11.202410 -8.582951>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_cludbasement"
$Type:		"floating"
$Pos:			<69.080215 -0.535091 -6.453014>
$Orient:		[<1 0 0> <0 0.000026 -1.000001> <0 1.000001 0.000026>]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_reverb1"
$Type:		"ground"
$Pos:			<0.625278 0.007141 19.183117>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_reverb2"
$Type:		"ground"
$Pos:			<59.124264 -7.290287 0.644948>
$Orient:		[0.002635]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_roomtone"
$Type:		"floating"
$Pos:			<39.093719 1.045471 -10.846830>
$Orient:		[I]

$Navpoint:	"amb_mp_ptp_01_guardradio"
$Type:		"floating"
$Pos:			<0.451966 2.093632 17.040142>
$Orient:		[0.017023]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_clud_2ndfloor2"
$Type:		"floating"
$Pos:			<34.604275 10.141932 -36.779274>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]
+Chunk:		"mp_ptp_01"

$Navpoint:	"amb_mp_ptp_01_clud_basement2"
$Type:		"floating"
$Pos:			<20.775925 -0.641528 -39.754768>
$Orient:		[<1 0 0> <0 0.000026 -1> <0 1 0.000026>]

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

$Ambient:	"amb_mp_ptp_01_roomtone"
	$Navpoint:	"amb_mp_ptp_01_roomtone"
	$Shape:	"Cylinder"
		$Inner Radius:	177.00
		$Outer Radius:	219.50
		$Inner Height:	117.75
		$Outer Height:	117.88
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
		+File:	"amb_int_room_med_2.wav"
	+Masked

$Ambient:	"amb_mp_ptp_01_guardradio"
	$Navpoint:	"amb_mp_ptp_01_guardradio"
	$Shape:	"Cylinder"
		$Inner Radius:	7.13
		$Outer Radius:	16.00
		$Inner Height:	5.38
		$Outer Height:	6.50
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

// ---------------
#Negative Regions
// ---------------

// ----------
#DSP Regions
// ----------

$DSP:	"amb_mp_ptp_01_reverb1"
	$Navpoint:	"amb_mp_ptp_01_reverb1"
	$Shape:	"Box"
		$Inner Dimensions:	<68.750000 39.875000 38.125000>
		$Outer Dimensions:	<71.375000 40 38.250000>
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.225
	+Masked

$DSP:	"amb_mp_ptp_01_reverb2"
	$Navpoint:	"amb_mp_ptp_01_reverb2"
	$Shape:	"Box"
		$Inner Dimensions:	<45.875000 22.250000 45.375000>
		$Outer Dimensions:	<46 29.125000 47.250000>
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.500
	+Masked

// -------------
#Audio Cluders
// -------------

$Cluder:	"amb_mp_ptp_01_clud_1stfloor"
	$Navpoint:	"amb_mp_ptp_01_clud_1stfloor"
	$Rotation:	<90 0 0>
	$Inner:	58.625000	48.125000
	$Outer:	60.625000	48.500000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.087500
	+Masked

$Cluder:	"amb_mp_ptp_01_clud_2ndfloor"
	$Navpoint:	"amb_mp_ptp_01_clud_2ndfloor"
	$Rotation:	<90 0 0>
	$Inner:	47.625000	98.500000
	$Outer:	55.250000	100.250000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.087500
	+Masked

$Cluder:	"amb_mp_ptp_01_cludbasement"
	$Navpoint:	"amb_mp_ptp_01_cludbasement"
	$Rotation:	<90 0 0>
	$Inner:	68.000000	70.625000
	$Outer:	68.125000	74.500000
	$Offset:	0.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.200000
	+Masked

$Cluder:	"amb_mp_ptp_01_clud_2ndfloor2"
	$Navpoint:	"amb_mp_ptp_01_clud_2ndfloor2"
	$Rotation:	<90 0 0>
	$Inner:	14.625000	1.875000
	$Outer:	14.625000	6.500000
	$Offset:	0.000000	2.250000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.000000
	+Masked

$Cluder:	"amb_mp_ptp_01_clud_basement2"
	$Navpoint:	"amb_mp_ptp_01_clud_basement2"
	$Rotation:	<90 0 0>
	$Inner:	9.875000	38.875000
	$Outer:	14.375000	39.875000
	$Offset:	-2.000000	0.000000
	$Radius Inner:	10.000000
	$Radius Outer:	20.000000
	$Excluder:	1
	$Volume:	0.000000
	+Masked

// -------
#Nodes
// -------


#End
