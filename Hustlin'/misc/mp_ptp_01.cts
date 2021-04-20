// -------
#Includes
// -------

$Include: "amb_mp_ptp_01.cts"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"mp_ptp_01_$respawn000"
$Type:		"ground"
$Pos:			<0.897728 0.005472 -10.343414>
$Orient:		[-3.141592]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn001"
$Type:		"ground"
$Pos:			<10.115193 11.562992 -26.443052>
$Orient:		[-0.052198]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn002"
$Type:		"ground"
$Pos:			<5.959805 4.644818 4.121165>
$Orient:		[-1.553343]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn003"
$Type:		"ground"
$Pos:			<16.847515 11.789814 -2.390433>
$Orient:		[-2.443461]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$pimp enter000"
$Type:		"ground"
$Pos:			<0.002723 0.005472 41.553207>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn004"
$Type:		"ground"
$Pos:			<-3.698338 11.437391 -49.823166>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn005"
$Type:		"ground"
$Pos:			<-6.242814 11.562998 -49.465794>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn006"
$Type:		"ground"
$Pos:			<-0.537614 11.437391 -49.912937>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$respawn007"
$Type:		"ground"
$Pos:			<5.357308 11.437391 -49.778687>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$pimp enter001"
$Type:		"ground"
$Pos:			<32.892258 -4.339729 -17.291853>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$r000"
$Type:		"ground"
$Pos:			<-8.901868 6.004615 -45.779358>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$r001"
$Type:		"ground"
$Pos:			<13.474981 6.004614 -2.923135>
$Orient:		[1.567680]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$r002"
$Type:		"ground"
$Pos:			<8.126465 11.437390 -49.734303>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

$Navpoint:	"mp_ptp_01_$r003"
$Type:		"ground"
$Pos:			<2.420061 11.437391 -50.020813>
$Orient:		[I]
+Chunk:		"mp_ptp_01"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"mp_ptp_01_$pimp enter000"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_ptp_01_$pimp enter000"
+Disabled
$Sphere radius:			.7

$Trigger:				"mp_ptp_01_$pimp enter001"
$Trigger type:			"sphere"
$Trigger action:		"pimp enter"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_ptp_01_$pimp enter001"
+Disabled
$Sphere radius:			.7

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

$Respawn:		"mp_ptp_01_respawn000"
$Start nav:		"mp_ptp_01_$respawn000"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_01_respawn001"
$Start nav:		"mp_ptp_01_$respawn001"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_01_respawn002"
$Start nav:		"mp_ptp_01_$respawn002"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_01_respawn003"
$Start nav:		"mp_ptp_01_$respawn003"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_01_respawn004"
$Start nav:		"mp_ptp_01_$respawn004"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_01_respawn005"
$Start nav:		"mp_ptp_01_$respawn005"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_01_respawn006"
$Start nav:		"mp_ptp_01_$respawn006"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_01_respawn007"
$Start nav:		"mp_ptp_01_$respawn007"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_01_$r000"
$Start nav:		"mp_ptp_01_$r000"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_01_$r001"
$Start nav:		"mp_ptp_01_$r001"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam2

$Respawn:		"mp_ptp_01_$r002"
$Start nav:		"mp_ptp_01_$r002"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

$Respawn:		"mp_ptp_01_$r003"
$Start nav:		"mp_ptp_01_$r003"
$Box size:		-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000
+MPTeam1

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
