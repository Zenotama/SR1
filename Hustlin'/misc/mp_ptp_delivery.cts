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

$Navpoint:	"pimpexit2"
$Type:		"ground"
$Pos:			<136.3727 0.005053149 -34.32225>
$Orient:		[1.414026]
+Chunk:         "mp_bac_01"

$Navpoint:	"pimpexit"
$Type:		"ground"
$Pos:			<148.9156 0.005002606 -20.32066>
$Orient:		[-1.742478]
+Chunk:         "mp_coop_delivery"

$Navpoint:	"T2P6"
$Type:		"ground"
$Pos:			<127.7409 0.005084471 -11.01527>
$Orient:		[-1.691698]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P5"
$Type:		"ground"
$Pos:			<90.12518 1.265572 22.90591>
$Orient:		[-3.099878]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P4"
$Type:		"ground"
$Pos:			<64.0659 0.005155522 -48.56579>
$Orient:		[-1.153607]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P3"
$Type:		"ground"
$Pos:			<0.8860961 -0.1449374 13.38533>
$Orient:		[0.01362417]
+Chunk:         "mp_bac_01"

$Navpoint:	"T2P2"
$Type:		"ground"
$Pos:			<56.97743 0.005078109 135.7875>
$Orient:		[-1.75401]
+Chunk:		"mp_bac_01"

$Navpoint:	"T2P1"
$Type:		"ground"
$Pos:			<29.99146 -0.1450011 104.9934>
$Orient:		[-1.568782]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P6"
$Type:		"ground"
$Pos:			<-8.620467 0.05411322 174.5932>
$Orient:		[-3.13517]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P5"
$Type:		"ground"
$Pos:			<-14.13181 0.05411322 174.927>
$Orient:		[1.533983]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P4"
$Type:		"ground"
$Pos:			<-14.84322 0.05411322 172.4145>
$Orient:		[1.484903]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P3"
$Type:		"ground"
$Pos:			<6.037053 0.05411343 175.0849>
$Orient:		[3.100556]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P2"
$Type:		"ground"
$Pos:			<9.47938 0.05411365 175.0818>
$Orient:		[-1.597118]
+Chunk:		"mp_bac_01"

$Navpoint:	"T1P1"
$Type:		"ground"
$Pos:			<9.21049 0.05411365 172.8374>
$Orient:		[-1.55344]
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
$Start nav:				"pimpexit2"
$Sphere radius:			.7

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
