// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_arena_int"
$Type:		"floating"
$Pos:			<-1.312342 0.376251 -0.823830>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_largereverb"
$Type:		"floating"
$Pos:			<0 0 0>
$Orient:		[I]

$Navpoint:	"amb_mp_arena_tunnelreverb1"
$Type:		"floating"
$Pos:			<-2.347885 -0.338112 56.349869>
$Orient:		[0.008311]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb2"
$Type:		"floating"
$Pos:			<-50.200111 0.753464 48.707794>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb3"
$Type:		"floating"
$Pos:			<0.425667 0.162158 20.096275>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb4"
$Type:		"floating"
$Pos:			<-50.656860 0.487642 -3.667103>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb5"
$Type:		"floating"
$Pos:			<-47.049061 1.936716 -42.282730>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb6"
$Type:		"floating"
$Pos:			<-3.443699 0.808670 -21.355875>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb7"
$Type:		"floating"
$Pos:			<-12.096098 -0.197840 -63.741043>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb8"
$Type:		"floating"
$Pos:			<42.236412 0.549042 -56.836517>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb9"
$Type:		"floating"
$Pos:			<38.934280 1.573658 3.901478>
$Orient:		[I]
+Chunk:		"mp_arena"

$Navpoint:	"amb_mp_arena_tunnelreverb10"
$Type:		"floating"
$Pos:			<34.525482 -0.343540 38.978546>
$Orient:		[I]
+Chunk:		"mp_arena"

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

$Ambient:	"amb_mp_arena_int"
	$Navpoint:	"amb_mp_arena_int"
	$Shape:	"Cylinder"
		$Inner Radius:	157.50
		$Outer Radius:	158.00
		$Inner Height:	20.75
		$Outer Height:	223.25
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
		+File:	"amb_int_room_large_3.wav"

// ---------------
#Negative Regions
// ---------------

// ----------
#DSP Regions
// ----------

$DSP:	"amb_mp_arena_largereverb"
	$Navpoint:	"amb_mp_arena_largereverb"
	$Shape:	"Sphere"
		$Inner Radius:	174.63
		$Outer Radius:	227.38
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.650

$DSP:	"amb_mp_arena_tunnelreverb1"
	$Navpoint:	"amb_mp_arena_tunnelreverb1"
	$Shape:	"Sphere"
		$Inner Radius:	2.88
		$Outer Radius:	4.88
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb2"
	$Navpoint:	"amb_mp_arena_tunnelreverb2"
	$Shape:	"Sphere"
		$Inner Radius:	3.00
		$Outer Radius:	5.75
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb3"
	$Navpoint:	"amb_mp_arena_tunnelreverb3"
	$Shape:	"Sphere"
		$Inner Radius:	2.50
		$Outer Radius:	4.63
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb4"
	$Navpoint:	"amb_mp_arena_tunnelreverb4"
	$Shape:	"Sphere"
		$Inner Radius:	2.88
		$Outer Radius:	5.50
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb5"
	$Navpoint:	"amb_mp_arena_tunnelreverb5"
	$Shape:	"Sphere"
		$Inner Radius:	2.88
		$Outer Radius:	4.38
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb6"
	$Navpoint:	"amb_mp_arena_tunnelreverb6"
	$Shape:	"Sphere"
		$Inner Radius:	3.13
		$Outer Radius:	5.75
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb7"
	$Navpoint:	"amb_mp_arena_tunnelreverb7"
	$Shape:	"Sphere"
		$Inner Radius:	3.88
		$Outer Radius:	6.13
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb8"
	$Navpoint:	"amb_mp_arena_tunnelreverb8"
	$Shape:	"Sphere"
		$Inner Radius:	3.13
		$Outer Radius:	5.75
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb9"
	$Navpoint:	"amb_mp_arena_tunnelreverb9"
	$Shape:	"Sphere"
		$Inner Radius:	3.00
		$Outer Radius:	4.75
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

$DSP:	"amb_mp_arena_tunnelreverb10"
	$Navpoint:	"amb_mp_arena_tunnelreverb10"
	$Shape:	"Sphere"
		$Inner Radius:	3.88
		$Outer Radius:	5.75
	$Inner Offset:	<0 0 0>
	$Reverb Send Level:	0.150

// -------------
#Audio Cluders
// -------------

// -------
#Nodes
// -------


#End
