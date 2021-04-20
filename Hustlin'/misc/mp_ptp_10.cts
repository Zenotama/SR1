// -------
#Includes
// -------

$Include: "amb_mp_bor_01.cts"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"mp_bor_01_$r_team1_1"
$Type:		"ground"
$Pos:			<28.542990 21.380438 1.498295>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team1_2"
$Type:		"ground"
$Pos:			<-0.888093 21.380438 -12.284721>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team1_3"
$Type:		"ground"
$Pos:			<28.542990 21.380438 -12.284721>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team1_4"
$Type:		"ground"
$Pos:			<28.542990 21.380438 12.284721>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team2_1"
$Type:		"ground"
$Pos:			<-45.491684 0.107922 58.617569>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team2_2"
$Type:		"ground"
$Pos:			<-45.491684 0.107922 -58.617569>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team2_3"
$Type:		"ground"
$Pos:			<-104.583603 0.054629 -0.934500>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team2_4"
$Type:		"ground"
$Pos:			<-104.583603 0.054629 58.934500>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$t_dropoff"
$Type:		"ground"
$Pos:			<-248.588806 -0.000118 1.628778>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team1_5"
$Type:		"ground"
$Pos:			<28.542990 21.380438 30.284721>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team1_6"
$Type:		"ground"
$Pos:			<28.542990 21.380438 32.284721>
$Orient:		[I]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team2_5"
$Type:		"ground"
$Pos:			<-181.787323 -0.000109 -1.756275>
$Orient:		[3.105870]
+Chunk:		"mp_bor_01"

$Navpoint:	"mp_bor_01_$r_team2_6"
$Type:		"ground"
$Pos:			<-244.588806 -0.000118 5.628778>
$Orient:		[I]
+Chunk:		"mp_bor_01"


// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"mp_bor_01_$t_dropoff"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_bor_01_$t_dropoff"
$Sphere radius:		0.700000

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

$Respawn:		"mp_bor_01_$r_team1_1"
$Start nav:		"mp_bor_01_$r_team1_1"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_01_$r_team1_2"
$Start nav:		"mp_bor_01_$r_team1_2"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_01_$r_team1_3"
$Start nav:		"mp_bor_01_$r_team1_3"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_01_$r_team1_4"
$Start nav:		"mp_bor_01_$r_team1_4"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_01_$r_team2_1"
$Start nav:		"mp_bor_01_$r_team2_1"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_01_$r_team2_2"
$Start nav:		"mp_bor_01_$r_team2_2"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_01_$r_team2_3"
$Start nav:		"mp_bor_01_$r_team2_3"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_01_$r_team2_4"
$Start nav:		"mp_bor_01_$r_team2_4"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_01_$r_team1_5"
$Start nav:		"mp_bor_01_$r_team1_5"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_01_$r_team1_6"
$Start nav:		"mp_bor_01_$r_team1_6"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_bor_01_$r_team2_5"
$Start nav:		"mp_bor_01_$r_team2_5"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_bor_01_$r_team2_6"
$Start nav:		"mp_bor_01_$r_team2_6"
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
