// -------
#Includes
// -------

$Include: "amb_mp_bor_02.cts"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"mp_bor_02_$respawn000"
$Type:		"ground"
$Pos:			<10.273738 -0.149979 40.514751>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn001"
$Type:		"ground"
$Pos:			<16.057026 -0.149979 45.514751>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn002"
$Type:		"ground"
$Pos:			<19.057026 -0.149979 40.514751>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn003"
$Type:		"ground"
$Pos:			<23.057026 -0.149979 45.514751>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn007"
$Type:		"ground"
$Pos:			<-38.700665 -8.000017 139.272949>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn008"
$Type:		"ground"
$Pos:			<70.032669 -8.000017 136.928101>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn009"
$Type:		"ground"
$Pos:			<155.254730 0.000009 75.955032>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$respawn010"
$Type:		"ground"
$Pos:			<-78.103554 -0.149970 66.161934>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_$t_dropoff"
$Type:		"ground"
$Pos:			<10.385029 -0.149990 314.081384>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_team1_p5"
$Type:		"ground"
$Pos:			<0.273738  -0.149979 40.514751>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_team1_p6"
$Type:		"ground"
$Pos:			<28.273738 -0.149979 40.514751>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_team2_p5"
$Type:		"ground"
$Pos:			<10.385029 0.000009 305.981384>
$Orient:		[I]
+Chunk:		"mp_bor_02"

$Navpoint:	"mp_bor_02_team2_p6"
$Type:		"ground"
$Pos:			<15.385029 0.000009 250.081384>
$Orient:		[I]
+Chunk:		"mp_bor_02"


// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"mp_bor_02_$t_dropoff"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_bor_02_$t_dropoff"
$Sphere radius:		0.700000

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

$Respawn:		"mp_bor_02_team1_p1"
$Start nav:		"mp_bor_02_$respawn000"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_02_team1_p2"
$Start nav:		"mp_bor_02_$respawn001"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_02_team1_p3"
$Start nav:		"mp_bor_02_$respawn002"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_02_team1_p4"
$Start nav:		"mp_bor_02_$respawn003"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_02_team2_p1"
$Start nav:		"mp_bor_02_$respawn007"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_02_team2_p2"
$Start nav:		"mp_bor_02_$respawn008"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_02_team2_p3"
$Start nav:		"mp_bor_02_$respawn009"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_02_team2_p4"
$Start nav:		"mp_bor_02_$respawn010"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_02_team1_p5"
$Start nav:		"mp_bor_02_team1_p5"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_02_team1_p6"
$Start nav:		"mp_bor_02_team1_p6"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_02_team2_p5"
$Start nav:		"mp_bor_02_team2_p5"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_02_team2_p6"
$Start nav:		"mp_bor_02_team2_p6"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

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

// ---------------
#Negative Regions
// ---------------

// ----------
#DSP Regions
// ----------

// -------------
#Audio Cluders
// -------------

// -------
#Nodes
// -------

// -------
#Movers
// -------


#End
