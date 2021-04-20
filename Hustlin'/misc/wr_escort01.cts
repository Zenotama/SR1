// -------
#Groups
// -------

$Group:	"wr_escort01_group"

// -------
#Navpoints
// -------

$Navpoint:	"wr_escort01_start"
$Type:		"ground"
$Pos:			<408.255920 20.424698 -1731.994507>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_$vehicle000"
$Type:		"ground"
$Pos:			<407.463379 20.280926 -1734.976318>
$Orient:		[-1.466076]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_$nav000"
$Type:		"ground"
$Pos:			<409.534 20.321 -1738.6870>
$Orient:		[-0.418879]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_food"
$Type:		"ground"
$Pos:			<522.989380 17.676823 -1615.131714>
$Orient:		[1.734695]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_pickup_1"
$Type:		"ground"
$Pos:			<345.297577 22.354900 -1828.296387>
$Orient:		[-1.431171]
+Chunk:		"sr_chunk40"

$Navpoint:	"wr_escort01_pickup_2"
$Type:		"ground"
$Pos:			<476.829742 22.354900 -1789.296997>
$Orient:		[1.483531]
+Chunk:		"sr_chunk40"

$Navpoint:	"wr_escort01_hotel"
$Type:		"ground"
$Pos:			<260.260681 6.434953 -1320.888062>
$Orient:		[I]
+Chunk:		"sr_chunk30"

$Navpoint:	"wr_escort01_pickup_4"
$Type:		"ground"
$Pos:			<532.156860 17.914898 -1607.158569>
$Orient:		[-1.431170]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_drop_4"
$Type:		"ground"
$Pos:			<524.677734 17.705231 -1606.903320>
$Orient:		[-1.326450]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_$nav001"
$Type:		"ground"
$Pos:			<413.201508 20.424700 -1732.902466>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_drop_5"
$Type:		"ground"
$Pos:			<380.691101 16.044895 -1562.625977>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_warp"
$Type:		"ground"
$Pos:			<406.049683 20.242455 -1737.684937>
$Orient:		[0.628319]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_pickup_5"
$Type:		"ground"
$Pos:			<379.473999 16.799000 -1568.478882>
$Orient:		[-0.017453]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_strip_club"
$Type:		"ground"
$Pos:			<405.990967 20.237490 -1735.685791>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_puke"
$Type:		"ground"
$Pos:			<372.971954 22.354900 -1832.193848>
$Orient:		[I]
+Chunk:		"sr_chunk40"

$Navpoint:	"wr_escort01_river"
$Type:		"ground"
$Pos:			<266.268433 17.099983 -1731.589722>
$Orient:		[I]
+Chunk:		"sr_chunk40"

$Navpoint:	"wr_escort01_dance_club"
$Type:		"ground"
$Pos:			<588.301331 18.674751 -1687.418213>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_pickup_6"
$Type:		"ground"
$Pos:			<547.698914 6.648939 -1401.782959>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_dropoff_6"
$Type:		"ground"
$Pos:			<547.403870 6.565713 -1395.851563>
$Orient:		[I]
+Chunk:		"sr_chunk39"

$Navpoint:	"wr_escort01_pickup_7"
$Type:		"ground"
$Pos:			<316.727661 5.929578 -1331.308350>
$Orient:		[I]
+Chunk:		"sr_chunk30"

$Navpoint:	"wr_escort01_dropoff_7"
$Type:		"ground"
$Pos:			<313.069489 5.753611 -1338.630859>
$Orient:		[I]
+Chunk:		"sr_chunk30"

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

$Vehicle:		"wr_escort01_car"
$Vehicle type:	"car_4dr_luxury04"
$Start nav:		"wr_escort01_$vehicle000"
$Group:			"wr_escort01_group"
$Stream Distance:			50.000
+Variant:		"Escort"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"wr_escort01_stripper"
$Char type:				"Stripper-Asian"
$Start nav:				"wr_escort01_$nav000"
+Group:					"wr_escort01_group"

$Human:					"wr_escort01_client"
$Char type:				"PD_X_F_BigGeneric"
$Start nav:				"wr_escort01_pickup_4"
+Group:					"wr_escort01_group"

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
