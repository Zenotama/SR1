// -------
#Includes
// -------

$Include: "amb_mp_ptp_03.cts"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"mp_ptp_03_$t0000"
$Type:		"ground"
$Pos:			<-45.593353 0 5.310101>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$t0001"
$Type:		"ground"
$Pos:			<38.032532 -0.062500 32.338066>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0000"
$Type:		"ground"
$Pos:			<-16.359966 10 16.092766>
$Orient:		[1.592411]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0001"
$Type:		"ground"
$Pos:			<-6.042326 10 23.445456>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0002"
$Type:		"ground"
$Pos:			<-10.630318 10 26.811455>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0003"
$Type:		"ground"
$Pos:			<-15.781167 9.999999 26.848234>
$Orient:		[-3.027054]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0004"
$Type:		"ground"
$Pos:			<-21.039244 5 7.134446>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0005"
$Type:		"ground"
$Pos:			<-15.304996 0 -1.611636>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0006"
$Type:		"ground"
$Pos:			<21.320322 0 14.164260>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r0007"
$Type:		"ground"
$Pos:			<-6.978421 10 -18.178398>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r000"
$Type:		"ground"
$Pos:			<-16.309179 10.000001 22.324177>
$Orient:		[3.113914]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r001"
$Type:		"ground"
$Pos:			<-10.218933 10.000002 16.570520>
$Orient:		[1.608495]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r002"
$Type:		"ground"
$Pos:			<8.356755 4.999998 -18.433075>
$Orient:		[I]
+Chunk:		"mp_ptp_03"

$Navpoint:	"mp_ptp_03_$r003"
$Type:		"ground"
$Pos:			<16.057617 4.999994 -5.077310>
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

$Trigger:				"mp_ptp_03_$t0000"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_ptp_03_$t0000"
$Sphere radius:			.7

$Trigger:				"mp_ptp_03_$t0001"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_ptp_03_$t0001"
$Sphere radius:			.7

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

$Respawn:		"mp_ptp_03_$r0000"
$Start nav:		"mp_ptp_03_$r0000"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_03_$r0001"
$Start nav:		"mp_ptp_03_$r0001"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_03_$r0002"
$Start nav:		"mp_ptp_03_$r0002"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_03_$r0003"
$Start nav:		"mp_ptp_03_$r0003"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_03_$r0004"
$Start nav:		"mp_ptp_03_$r0004"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_ptp_03_$r0005"
$Start nav:		"mp_ptp_03_$r0005"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_ptp_03_$r0006"
$Start nav:		"mp_ptp_03_$r0006"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_ptp_03_$r0007"
$Start nav:		"mp_ptp_03_$r0007"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_ptp_03_$r000"
$Start nav:		"mp_ptp_03_$r000"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_03_$r001"
$Start nav:		"mp_ptp_03_$r001"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam1

$Respawn:		"mp_ptp_03_$r002"
$Start nav:		"mp_ptp_03_$r002"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000
+MPTeam2

$Respawn:		"mp_ptp_03_$r003"
$Start nav:		"mp_ptp_03_$r003"
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
#Audio Barriers
// -------------

// -------
#Nodes
// -------


#End
