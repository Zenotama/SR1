// -------
#Groups
// -------

$Group:	"vk_escort01"

// -------
#Navpoints
// -------

$Navpoint:	"vk_escort01$start"
$Type:		"ground"
$Pos:			<-59.381, -2.133, -220.581>
$Orient:		[I]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_$nav000"
$Type:		"ground"
$Pos:			<-81.998 -3.950, -178.315>
$Orient:		[-2.932152]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_$nav002"
$Type:		"ground"
$Pos:			<-89.160507 -3.850002 -179.463501>
$Orient:		[I]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_$vehicle001"
$Type:		"ground"
$Pos:			<-83.441879 -3.999998 -181.035568>
$Orient:		[2.478368]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_$warp"
$Type:		"ground"
$Pos:			<-80.121643 -4 -180.434372>
$Orient:		[-1.623157]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_strip_club"
$Type:		"ground"
$Pos:			<-18.057245 -4 -249.780106>
$Orient:		[I]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_sex_shop"
$Type:		"ground"
$Pos:			<-53.110840 -4.000001 -71.120193>
$Orient:		[I]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_theater"
$Type:		"ground"
$Pos:			<71.714317 -4.000001 -240.676971>
$Orient:		[I]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_pickup_3"
$Type:		"ground"
$Pos:			<101.773323 -3.879999 -98.543053>
$Orient:		[0.837758]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_drop_3"
$Type:		"ground"
$Pos:			<109.966721 -3.999999 -89.208755>
$Orient:		[I]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_pickup_5"
$Type:		"ground"
$Pos:			<-3.545525 -3.861176 -23.737232>
$Orient:		[1.169371]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_drop_5"
$Type:		"ground"
$Pos:			<1.555175 -4.000002 -21.004250>
$Orient:		[I]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_pickup_7"
$Type:		"ground"
$Pos:			<5.219800 -3.842298 -344.088135>
$Orient:		[2.897245]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_drop_6"
$Type:		"ground"
$Pos:			<15.760117 -4 -257.201294>
$Orient:		[I]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_pickup_6"
$Type:		"ground"
$Pos:			<19.011261 -3.806498 -261.828796>
$Orient:		[-1.675516]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_drop_7"
$Type:		"ground"
$Pos:			<0.681027 -4 -348.168823>
$Orient:		[I]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_river"
$Type:		"ground"
$Pos:			<260.783997 -4.000100 -528.180237>
$Orient:		[I]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_brothel"
$Type:		"ground"
$Pos:			<8.999138 -4 -292.364716>
$Orient:		[I]
+Chunk:		"sr_chunk07"

$Navpoint:	"vk_escort01_puke"
$Type:		"ground"
$Pos:			<-33.328506 -4.000001 106.536255>
$Orient:		[I]
+Chunk:		"sr_chunk06"

$Navpoint:	"vk_escort01_river_2"
$Type:		"ground"
$Pos:			<258.600861 -3.949228 -531.151672>
$Orient:		[I]
+Chunk:		"sr_chunk07b"

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

$Vehicle:		"vk_escort01_car"
$Vehicle type:	"car_4dr_luxury01"
$Start nav:		"vk_escort01_$vehicle001"
$Group:			"vk_escort01"
$Stream Distance:			50.000
+Variant: "Escort"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"vk_escort01_stripper"
$Char type:				"Stripper-Latina"
$Start nav:				"vk_escort01_$nav000"
+Personality:			"civilian normal"
+Group:					"vk_escort01"

$Human:					"vk_escort01_client"
$Char type:				"PD_X_F_BigGeneric"
$Start nav:				"vk_escort01_pickup_3"
+Personality:			"civilian normal"
+Group:					"vk_escort01"

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

// -------
#Movers
// -------



#End
