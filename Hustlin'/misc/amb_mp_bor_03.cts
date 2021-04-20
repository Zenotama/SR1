// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_bor_03_roomtone"
$Type:		"floating"
$Pos:			<0 0 0>
$Orient:		[I]

$Navpoint:	"amb_mp_bor_03_mainreverb"
$Type:		"floating"
$Pos:			<-0.089931 -0.000004 -0.144188>
$Orient:		[I]
+Chunk:		"mp_bor_03"

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

$Ambient:	"amb_mp_bor_03_roomtone"
	$Navpoint:	"amb_mp_bor_03_roomtone"
	$Shape:	"Sphere"
		$Inner Radius:	126.13
		$Outer Radius:	131.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3750
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_large_1.wav"
	+Masked

// ---------------
#Negative Regions
// ---------------

// ----------
#DSP Regions
// ----------

$DSP:	"amb_mp_bor_03_mainreverb"
	$Navpoint:	"amb_mp_bor_03_mainreverb"
	$Shape:	"Sphere"
		$Inner Radius:	126.63
		$Outer Radius:	137.38
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.340
	+Masked

// -------------
#Audio Cluders
// -------------

// -------
#Nodes
// -------


#End
