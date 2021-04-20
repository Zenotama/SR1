// -------
#Groups
// -------

$Group:	"lc08_Group"
$Group:	"lc08_Truck"

// -------
#Navpoints
// -------

$Navpoint:	"lc08_police_station"
$Type:		"ground"
$Pos:			<120.836037 -3.850000 934.007202>
$Orient:		[1.588250]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc08_garage"
$Type:		"ground"
$Pos:			<-913.212402 -3.735559 59.135437>
$Orient:		[1.431171]
+Chunk:		"sr_chunk02_mec"

$Navpoint:	"lc08_defense_perimeter"
$Type:		"ground"
$Pos:			<120.555504 -3.850001 932.246460>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc08_truck"
$Type:		"ground"
$Pos:			<121.012138 -3.850008 929.758362>
$Orient:		[3.106685]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc08_truck_driver"
$Type:		"ground"
$Pos:			<124.345871 -4.000006 926.761719>
$Orient:		[2.063928]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc08_player_post_cut"
$Type:		"ground"
$Pos:			<132.732590 -4.000006 929.202454>
$Orient:		[-1.413661]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc08_open_garage"
$Type:		"ground"
$Pos:			<-906.870361 -3.727217 62.993023>
$Orient:		[-0.124642]
+Chunk:		"sr_chunk02"

$Navpoint:	"lc08_garage_gps"
$Type:		"ground"
$Pos:			<-871.500916 -4 55.197533>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"lc08_station_gps"
$Type:		"ground"
$Pos:			<97.883682 -4.000011 935.325439>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc08_garage_cam"
$Type:		"floating"
$Pos:			<-897.157532 2.468722 57.568249>
$Orient:		[<0.321537 0 0.946897> <-0.410084 0.901355 0.139252> <-0.853490 -0.433082 0.289819>]

$Navpoint:	"lc08_det_car"
$Type:		"ground"
$Pos:			<-722.583801 -3.855099 90.572884>
$Orient:		[2.024585]
+Chunk:		"sr_chunk02"

$Navpoint:	"lc08_player_port"
$Type:		"ground"
$Pos:			<-905.692383 -3.877912 55.509781>
$Orient:		[1.291699]
+Chunk:		"sr_chunk02"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"lc08_garage"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		1000
$Start nav:				"lc08_garage"
+Disabled
$Box size:				-1.625000 -0.045094 -1.750000 1.625000 5.000000 1.750000

$Trigger:				"lc08_police_station"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		1000
$Start nav:				"lc08_police_station"
+Disabled
$Box size:				-1.748112 0.000000 -1.471619 1.748112 5.000000 1.471619

$Trigger:				"lc08_defense_perimeter"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		1000
$Start nav:				"lc08_defense_perimeter"
+Disabled
$Sphere radius:		35.162491

$Trigger:				"lc08_open_garage"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"lc08_open_garage"
+Disabled
$Box size:				-22.375000 0.000000 -21.062500 22.375000 3.375000 21.062500

// -------
#Vehicles
// -------

$Vehicle:		"lc08_truck"
$Vehicle type:	"truck_2dr_mover01"
$Start nav:		"lc08_truck"
$Group:			"lc08_Truck"
$Stream Distance:			50.000
+Hit Points:			60000
+Variant: "MissionVan"

$Vehicle:		"lc08_det_car"
$Vehicle type:	"car_4dr_standard05"
$Start nav:		"lc08_det_car"
$Group:			"lc08_Group"
$Stream Distance:			50.000
+Variant: "Gang_3SS_lvl1"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"lc08_truck_driver"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"lc08_truck_driver"
+Team:					"Playas"
+Group:					"lc08_Truck"
+MinRank:				2

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

$Mover:		"lc08_garage_door"
$Object UID:	1113
$Chunk:		"sr_chunk02"

$Mover:		"lc08_fakewall"
$Object UID:	1996
$Chunk:		"sr_chunk14"


// -------
#Interiors
// -------



#End
