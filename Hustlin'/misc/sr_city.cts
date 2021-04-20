// -------
#Includes
// -------

$Include: "amb_airport.cts"
$Include: "amb_apts.cts"
$Include: "amb_barrio.cts"
$Include: "amb_chinatown.cts"
$Include: "amb_docks.cts"
$Include: "amb_downtown.cts"
$Include: "amb_factory.cts"
$Include: "amb_highend.cts"
$Include: "amb_museum.cts"
$Include: "amb_projects.cts"
$Include: "amb_racetrack.cts"
$Include: "amb_redlight.cts"
$Include: "amb_saintsrow.cts"
$Include: "amb_truckyard.cts"
$Include: "amb_wrsuburb.cts"
$Include: "parking.cts"
$Include: "lc_chop01.cts"
$Include: "lc_drug01.cts"
$Include: "lc_escort01.cts"
$Include: "lc_fraud01.cts"
$Include: "lc_hitman01.cts"
$Include: "lc_hijack01.cts"
$Include: "lc_racing01.cts"
$Include: "lc_tagging.cts"
$Include: "lc_vandal01.cts"
$Include: "lc_pimp01.cts"
$Include: "tss_pimp01.cts"
$Include: "vk_chop01.cts"
$Include: "vk_drug01.cts"
$Include: "vk_escort01.cts"
$Include: "vk_fraud01.cts"
$Include: "vk_hitman01.cts"
$Include: "vk_hijack01.cts"
$Include: "vk_pimp01.cts"
$Include: "vk_racing01.cts"
$Include: "vk_tagging.cts"
$Include: "vk_vandal01.cts"
$Include: "wr_chop01.cts"
$Include: "wr_drug01.cts"
$Include: "wr_escort01.cts"
$Include: "wr_fraud01.cts"
$Include: "wr_hijack01.cts"
$Include: "wr_hitman01.cts"
$Include: "wr_pimp01.cts"
$Include: "wr_racing01.cts"
$Include: "wr_tagging.cts"
$Include: "wr_vandal01.cts"
$Include: "demo_derby.cts"
$Include: "escort_sr_city.cts"
$Include: "garage_sr_city.cts"
$Include: "hostage_sr_city.cts"
$Include: "hijack_sr_city.cts"
$Include: "loan_sr_city.cts"
$Include: "shops_sr_city.cts"
$Include: "theft_sr_city.cts"
$Include: "airport.cts"
$Include: "apts.cts"
$Include: "barrio.cts"
$Include: "chinatown.cts"
$Include: "docks.cts"
$Include: "downtown.cts"
$Include: "factory.cts"
$Include: "highend.cts"
$Include: "museum.cts"
$Include: "projects.cts"
$Include: "racetrack.cts"
$Include: "redlight.cts"
$Include: "saintsrow.cts"
$Include: "screenshot.cts"
$Include: "trainyard.cts"
$Include: "truckyard.cts"
$Include: "vksuburb.cts"
$Include: "wrsuburb.cts"
$Include: "heli_land_sr_city.cts"
$Include: "shore_sr_city.cts"
$Include: "mission_start.cts"
$Include: "drawbridge.cts"
$Include: "sspawn_sr_city.cts"
$Include: "pb_sr_city.cts"

// -------
#Activities
// -------

$Activity:				"lc_chop01"
$Activity:				"lc_drug01"
$Activity:				"lc_pimp01"
$Activity:				"lc_escort01"
$Activity:				"lc_fraud01"
$Activity:				"lc_hitman01"
$Activity:				"lc_hijack01"
$Activity:				"lc_racing01"
$Activity:				"lc_tagging"
$Activity:				"lc_vandal01"
$Activity:				"tss_pimp01"
$Activity:				"vk_chop01"
$Activity:				"vk_drug01"
$Activity:				"vk_escort01"
$Activity:				"vk_fraud01"
$Activity:				"vk_hijack01"
$Activity:				"vk_hitman01"
$Activity:				"vk_pimp01"
$Activity:				"vk_racing01"
$Activity:				"vk_tagging"
$Activity:				"vk_vandal01"
$Activity:				"wr_chop01"
$Activity:				"wr_drug01"
$Activity:				"wr_escort01"
$Activity:				"wr_fraud01"
$Activity:				"wr_hijack01"
$Activity:				"wr_hitman01"
$Activity:				"wr_pimp01"
$Activity:				"wr_racing01"
$Activity:				"wr_tagging"
$Activity:				"wr_vandal01"
$Activity:				"demo_derby"
$Activity:				"escort_sr_city"
$Activity:				"garage_sr_city"
$Activity:				"hostage_sr_city"
$Activity:				"loan_sr_city"
$Activity:				"shops_sr_city"
$Activity:				"theft_sr_city"

// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"sr_city_$execute lua script000"
$Type:		"ground"
$Pos:			<-111.287308 -4 14.151851>
$Orient:		[I]

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

// -------
#Respawns
// -------

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

// -------
#Movers
// -------

$Mover:		"sr_city_lc10_LearJet"
$Object UID:	236
$Chunk:		"sr_chunk24"

$Mover:		"sr_city_train1"
$Object UID:	18619
$Chunk:		"sr_chunk23"

$Mover:		"sr_city_statue"
$Object Name:	"GlobeManA02"
$Chunk:		"sr_chunk34"

$Mover:		"sr_city_globe"
$Object Name:	"GlobeA01"
$Chunk:		"sr_chunk34"

$Mover:		"sr_city_LotGateMover0"
$Object UID:	580
$Chunk:		"sr_chunk03"


// -------
#Interiors
// -------



#End
