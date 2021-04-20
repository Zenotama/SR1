// -------
#Groups
// -------

$Group:	"lc06_DexGroup"
$Group:	"lc06_VictorGroup"

// -------
#Navpoints
// -------

$Navpoint:	"lc06_church"
$Type:		"ground"
$Pos:			<-723.026001 -3.855006 90.013969>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"lc06_stakeout"
$Type:		"ground"
$Pos:			<384.479950 -3.999997 1262.397339>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc06_Dex"
$Type:		"ground"
$Pos:			<-757.030151 -2.040864 71.319008>
$Orient:		[3.109529]
+Chunk:		"sr_chunk02"

$Navpoint:	"lc06_Victor"
$Type:		"ground"
$Pos:			<434.042328 -3.849999 1272.114258>
$Orient:		[2.863342]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc06_VictorCar"
$Type:		"ground"
$Pos:			<429.422241 -3.849998 1269.912842>
$Orient:		[-2.502034]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc06_victor_retreat"
$Type:		"ground"
$Pos:			<379.147278 -3.850002 1314.251831>
$Orient:		[-1.466077]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc06_church_gps"
$Type:		"ground"
$Pos:			<-707.571533 -4.000001 94.003799>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"lc06_club_gps"
$Type:		"ground"
$Pos:			<342.240082 -3.999999 1261.899170>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc06_car_port"
$Type:		"ground"
$Pos:			<384.162506 -4.000000 1262.082520>
$Orient:		[0.644571]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc06_camera1"
$Type:		"floating"
$Pos:			<427.379303 -2.138129 1266.463501>
$Orient:		[<0.804340 0 -0.594170> <0.011432 0.999815 0.015476> <0.594060 -0.019240 0.804191>]

$Navpoint:	"lc06_camera2"
$Type:		"floating"
$Pos:			<379.784119 -2.436435 1258.700562>
$Orient:		[<0.299200 0 -0.954190> <0.052380 0.998492 0.016425> <0.952752 -0.054895 0.298749>]

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"lc06_church"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"lc06_church"
+Disabled
$Sphere radius:		3.050000

$Trigger:				"lc06_stakeout"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"lc06_stakeout"
+Disabled
$Sphere radius:		3.925000

// -------
#Vehicles
// -------

$Vehicle:		"lc06_VictorCar"
$Vehicle type:	"suv_4dr_luxury05"
$Start nav:		"lc06_VictorCar"
$Group:			"lc06_VictorGroup"
$Stream Distance:			50.000
+Hit Points:			16000
+Variant:		"Victor"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"lc06_Dex"
$Char type:				"TS_B_M_Dex-01"
$Start nav:				"lc06_Dex"
+Team:					"Playas"
+Undismissable
+Group:					"lc06_DexGroup"

$Human:					"lc06_Victor"
$Char type:				"LC_L_M_VictorRodriguez-Game"
$Start nav:				"lc06_Victor"
+Item:					"glock"
+Rank:					3
+Team:					"Los Carnales"
+AttackPlayerOnSight
+Invulnerable
+Group:					"lc06_VictorGroup"

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


// -------
#Interiors
// -------



#End
