// -------
#Includes
// -------

$Include: "amb_mp_ptp_02.cts"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"mp_ptp_02_$r000"
$Type:		"ground"
$Pos:			<173.257935 0.153430 -92.787857>
$Orient:		[-3.019421]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r001"
$Type:		"ground"
$Pos:			<187.797119 0.153428 -94.307632>
$Orient:		[-2.129303]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r002"
$Type:		"ground"
$Pos:			<177.886963 0.153430 -98.761002>
$Orient:		[-2.583089]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r003"
$Type:		"ground"
$Pos:			<184.112549 0.153428 -98.741776>
$Orient:		[-2.321290]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r004"
$Type:		"ground"
$Pos:			<20.668716 -0.000005 -58.428501>
$Orient:		[-0.593412]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r005"
$Type:		"ground"
$Pos:			<4.767696 4.456005 72.908463>
$Orient:		[3.089234]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r006"
$Type:		"ground"
$Pos:			<33.569389 4.456000 -17.458046>
$Orient:		[-1.710423]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r007"
$Type:		"ground"
$Pos:			<-5.307632 0.000011 128.528427>
$Orient:		[2.984513]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$t000"
$Type:		"ground"
$Pos:			<-21.615774 -2.050750 140.903992>
$Orient:		[-0.023630]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r008"
$Type:		"ground"
$Pos:			<181.666977 -0.000009 -106.744057>
$Orient:		[-0.964561]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r009"
$Type:		"ground"
$Pos:			<173.297516 -0.000009 -103.222176>
$Orient:		[-1.202083]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r010"
$Type:		"ground"
$Pos:			<13.521132 4.456005 3.060793>
$Orient:		[-3.049171]
+Chunk:		"mp_ptp_02"

$Navpoint:	"mp_ptp_02_$r011"
$Type:		"ground"
$Pos:			<36.003868 8.815725 70.655807>
$Orient:		[-1.652998]
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

$Trigger:				"mp_ptp_02_$t000"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_ptp_02_$t000"
$Sphere radius:			.7

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

$Respawn:		"mp_ptp_02_$r000"
$Start nav:		"mp_ptp_02_$r000"
$Box size:		-0.937500 0.000000 -1.312500 0.937500 2.000000 1.312500
+MPTeam1

$Respawn:		"mp_ptp_02_$r001"
$Start nav:		"mp_ptp_02_$r001"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_02_$r002"
$Start nav:		"mp_ptp_02_$r002"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_02_$r003"
$Start nav:		"mp_ptp_02_$r003"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_02_$r004"
$Start nav:		"mp_ptp_02_$r004"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_02_$r005"
$Start nav:		"mp_ptp_02_$r005"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_02_$r006"
$Start nav:		"mp_ptp_02_$r006"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_02_$r007"
$Start nav:		"mp_ptp_02_$r007"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_02_$r008"
$Start nav:		"mp_ptp_02_$r008"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_02_$r009"
$Start nav:		"mp_ptp_02_$r009"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_02_$r010"
$Start nav:		"mp_ptp_02_$r010"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_ptp_02_$r011"
$Start nav:		"mp_ptp_02_$r011"
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
