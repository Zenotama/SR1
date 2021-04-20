// -------
#Includes
// -------

$Include: "amb_mplobby_01.cts"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"pimpexit"
$Type:		"ground"
$Pos:			<-24.06614 4.48811 -10.40638>
$Orient:		[1.570638]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P6"
$Type:		"ground"
$Pos:			<-3.854261 -0.1448649 -44.96217>
$Orient:		[-0.03657575]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P5"
$Type:		"ground"
$Pos:			<-0.02488065 -0.1448486 -43.7565>
$Orient:		[-0.008721051]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P4"
$Type:		"ground"
$Pos:			<3.549365 -0.1448639 -44.54756>
$Orient:		[0.03846889]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P3"
$Type:		"ground"
$Pos:			<-3.384635 -0.1448667 -46.8323>
$Orient:		[0.01253687]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P2"
$Type:		"ground"
$Pos:			<-0.05947912 -0.1448657 -49.10852>
$Orient:		[-0.003357346]
+Chunk:		"mp_bac_01"

$Navpoint:	"T2P1"
$Type:		"ground"
$Pos:			<3.53972 -0.1448666 -46.41213>
$Orient:		[0.05973896]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P6"
$Type:		"ground"
$Pos:			<-0.05500457 -0.1448485 44.14319>
$Orient:		[3.055156]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P5"
$Type:		"ground"
$Pos:			<1.916826 -0.1448596 46.48761>
$Orient:		[3.061859]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P4"
$Type:		"ground"
$Pos:			<-1.687488 -0.1448598 46.79162>
$Orient:		[3.119493]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P3"
$Type:		"ground"
$Pos:			<3.528603 -0.1448682 47.37178>
$Orient:		[-3.069197]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P2"
$Type:		"ground"
$Pos:			<-0.091378 -0.1448627 48.78771>
$Orient:		[-3.12674]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P1"
$Type:		"ground"
$Pos:			<-3.430068 -0.1448663 46.74182>
$Orient:		[-3.087192]
+Chunk:		"mp_bac_01"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"mp_ptp_03_$t0000"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"pimpexit"
$Sphere radius:			.7

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

$Respawn:		"T1P1"
$Start nav:		"T1P1"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"T1P2"
$Start nav:		"T1P2"
$Box size:		-1.250000 0.000000 -1.250000 1.250000 2.000000 1.250000
+MPTeam1

$Respawn:		"T1P3"
$Start nav:		"T1P3"
$Box size:		-1.312500 0.000000 -1.562500 1.312500 2.000000 1.562500
+MPTeam1

$Respawn:		"T1P4"
$Start nav:		"T1P4"
$Box size:		-1.187500 0.000000 -1.625000 1.187500 2.000000 1.625000
+MPTeam1

$Respawn:		"T1P5"
$Start nav:		"T1P5"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"T1P6"
$Start nav:		"T1P6"
$Box size:		-1.437500 0.000000 -1.562500 1.437500 2.000000 1.562500
+MPTeam1

$Respawn:		"T2P1"
$Start nav:		"T2P1"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"T2P2"
$Start nav:		"T2P2"
$Box size:		-1.437500 0.000000 -1.250000 1.437500 2.000000 1.250000
+MPTeam2

$Respawn:		"T2P3"
$Start nav:		"T2P3"
$Box size:		-1.562500 0.000000 -2.000000 1.562500 2.000000 2.000000
+MPTeam2

$Respawn:		"T2P4"
$Start nav:		"T2P4"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"T2P5"
$Start nav:		"T2P5"
$Box size:		-1.437500 0.000000 -1.312500 1.437500 2.000000 1.312500
+MPTeam2

$Respawn:		"T2P6"
$Start nav:		"T2P6"
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


#End
