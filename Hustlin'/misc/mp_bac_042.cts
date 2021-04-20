// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"mp_bac_042_$item000"
$Type:		"ground"
$Pos:			<14.27429 0.00499978 14.13339>
$Orient:		[-1.782391]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$item001"
$Type:		"ground"
$Pos:			<-13.90819 0.00499978 14.32898>
$Orient:		[3.065592]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$item002"
$Type:		"ground"
$Pos:			<-13.50542 0.004999892 -13.64934>
$Orient:		[1.474031]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$item003"
$Type:		"ground"
$Pos:			<0.1117473 0.004999892 0.5664187>
$Orient:		[3.009008]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$item004"
$Type:		"ground"
$Pos:			<13.81662 0.004999892 -14.61398>
$Orient:		[-0.1349205]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn000"
$Type:		"ground"
$Pos:			<23.44374 0.004999986 -28.63797>
$Orient:		[-0.1057861]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn001"
$Type:		"ground"
$Pos:			<34.54469 0.004999986 -0.03306849>
$Orient:		[-1.643983]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn002"
$Type:		"ground"
$Pos:			<23.07046 0.004999895 28.46927>
$Orient:		[2.926448]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn003"
$Type:		"ground"
$Pos:			<-0.1095353 0.004999986 34.85157>
$Orient:		[3.064143]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn004"
$Type:		"ground"
$Pos:			<-28.55088 0.004999986 23.33753>
$Orient:		[1.524281]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn005"
$Type:		"ground"
$Pos:			<-33.89597 0.004999895 0.1495623>
$Orient:		[1.511698]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn006"
$Type:		"ground"
$Pos:			<-23.96604 0.005000003 -27.97941>
$Orient:		[-0.02842995]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$respawn007"
$Type:		"ground"
$Pos:			<-0.04453464 0.005000003 -25.6433>
$Orient:		[-0.06183789]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$big ass chains drop off000"
$Type:		"ground"
$Pos:			<43.989925 -0.636098 58.166893>
$Orient:		[I]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$big ass chains drop off001"
$Type:		"ground"
$Pos:			<-31.485790 3.164259 42.671329>
$Orient:		[I]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$big ass chains drop off002"
$Type:		"ground"
$Pos:			<-42.590111 -0.179451 -65.816559>
$Orient:		[I]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$big ass chains drop off003"
$Type:		"ground"
$Pos:			<54.185631 -0.234088 -55.873180>
$Orient:		[I]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$r0000"
$Type:		"ground"
$Pos:			<42.16263 0.004999986 -41.49391>
$Orient:		[-0.7890052]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$r0001"
$Type:		"ground"
$Pos:			<-40.52931 0.004999894 41.0848>
$Orient:		[2.368416]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$v0000"
$Type:		"ground"
$Pos:			<15.028091 1.134424 -76.914726>
$Orient:		[I]
+Chunk:		"mp_bac_042"

$Navpoint:	"mp_bac_042_$v0001"
$Type:		"ground"
$Pos:			<-67.306152 -0.123400 21.549381>
$Orient:		[I]
+Chunk:		"mp_bac_042"

// -------
#Cameras
// -------

// -------
#Items
// -------

$Item:		"mp_bac_042_rpg_launcher000"
$Item type:	"m16"
$Start nav:	"mp_bac_042_$item000"

$Item:		"mp_bac_042_sniper_rifle000"
$Item type:	"sniper_rifle"
$Start nav:	"mp_bac_042_$item001"

$Item:		"mp_bac_042_pump_action_shotgun000"
$Item type:	"pump_action_shotgun"
$Start nav:	"mp_bac_042_$item002"

$Item:		"mp_bac_042_ak47000"
$Item type:	"ak47"
$Start nav:	"mp_bac_042_$item003"

$Item:		"mp_bac_042_tec9000"
$Item type:	"tec9b"
$Start nav:	"mp_bac_042_$item004"

// -------
#Triggers
// -------

$Trigger:				"mp_bac_042_$big ass chains drop off000"
$Trigger type:			"bounding box"
$Trigger action:		"chains drop off"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_bac_042_$big ass chains drop off000"
$Box size:				-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Trigger:				"mp_bac_042_$big ass chains drop off001"
$Trigger type:			"bounding box"
$Trigger action:		"chains drop off"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_bac_042_$big ass chains drop off001"
$Box size:				-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Trigger:				"mp_bac_042_$big ass chains drop off002"
$Trigger type:			"bounding box"
$Trigger action:		"chains drop off"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_bac_042_$big ass chains drop off002"
$Box size:				-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Trigger:				"mp_bac_042_$big ass chains drop off003"
$Trigger type:			"bounding box"
$Trigger action:		"chains drop off"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"mp_bac_042_$big ass chains drop off003"
$Box size:				-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

// -------
#Vehicles
// -------

$Vehicle:		"mp_bac_042_$v0000"
$Vehicle type:	"sp_metermaid01"
$Start nav:		"mp_bac_042_$v0000"
$Stream Distance:			50.000

$Vehicle:		"mp_bac_042_$v0001"
$Vehicle type:	"sp_metermaid01"
$Start nav:		"mp_bac_042_$v0001"
$Stream Distance:			50.000

// -------
#Respawns
// -------

$Respawn:		"mp_bac_042_respawn000"
$Start nav:		"mp_bac_042_$respawn000"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn001"
$Start nav:		"mp_bac_042_$respawn001"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn002"
$Start nav:		"mp_bac_042_$respawn002"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn003"
$Start nav:		"mp_bac_042_$respawn003"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn004"
$Start nav:		"mp_bac_042_$respawn004"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn005"
$Start nav:		"mp_bac_042_$respawn005"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn006"
$Start nav:		"mp_bac_042_$respawn006"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_respawn007"
$Start nav:		"mp_bac_042_$respawn007"
$Box size:		-2.000000 0.000000 -2.000000 2.000000 2.000000 2.000000

$Respawn:		"mp_bac_042_$r0000"
$Start nav:		"mp_bac_042_$r0000"
$Box size:		-2.625000 0.000000 -3.125000 2.625000 4.000000 3.125000
+Vehicle

$Respawn:		"mp_bac_042_$r0001"
$Start nav:		"mp_bac_042_$r0001"
$Box size:		-2.125000 0.000000 -2.250000 2.125000 4.000000 2.250000
+Vehicle

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

// -------------
#Audio Barriers
// -------------

// -------
#Nodes
// -------


#End
