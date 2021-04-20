// -------
#Groups
// -------

$Group:	"vk02_Group"
$Group:	"vk02_chasers"

// -------
#Navpoints
// -------

$Navpoint:	"vk02_record_studio"
$Type:		"ground"
$Pos:			<-423.014435 16.664320 -944.952576>
$Orient:		[0.625582]
+Chunk:		"sr_chunk32"

$Navpoint:	"vk02_garage"
$Type:		"ground"
$Pos:			<-918.151184 -3.882923 58.458561>
$Orient:		[1.448624]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_$n_pos_on_road"
$Type:		"ground"
$Pos:			<-873.164490 -4.000031 64.458527>
$Orient:		[2.967062]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_chase_van"
$Type:		"ground"
$Pos:			<-876.165039 -4 76.958725>
$Orient:		[2.949616]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_player_post_cutscene"
$Type:		"ground"
$Pos:			<-411.444244 16.850616 -957.066528>
$Orient:		[-0.715585]
+Chunk:		"sr_chunk32"

$Navpoint:	"vk02_det_car"
$Type:		"ground"
$Pos:			<-721.903748 -3.855099 89.178741>
$Orient:		[2.146758]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_$nav000"
$Type:		"ground"
$Pos:			<-738.462585 -3.855007 91.072197>
$Orient:		[1.036550]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_$nav001"
$Type:		"ground"
$Pos:			<-741.328735 -2.056798 85.403076>
$Orient:		[0.806458]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_garage_cam"
$Type:		"floating"
$Pos:			<-893.141235 2.098648 54.410343>
$Orient:		[<0.388010 0 0.921655> <-0.215736 0.972219 0.090823> <-0.896050 -0.234075 0.377231>]

$Navpoint:	"vk02_van_driver"
$Type:		"ground"
$Pos:			<-873.256165 -4.000015 127.511612>
$Orient:		[3.089241]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_samson_gps"
$Type:		"ground"
$Pos:			<-872.384338 -4 57.614723>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"vk02_studio_gps"
$Type:		"ground"
$Pos:			<-417.417908 16.649633 -946.492676>
$Orient:		[I]
+Chunk:		"sr_chunk32"

$Navpoint:	"vk02_garage_open"
$Type:		"ground"
$Pos:			<-910.849365 -3.735559 59.549252>
$Orient:		[-0.109193]
+Chunk:		"sr_chunk02_mec"

$Navpoint:	"vk02_$v000"
$Type:		"ground"
$Pos:			<-604.846497 -3.129150 -238.107773>
$Orient:		[1.663939]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$v001"
$Type:		"ground"
$Pos:			<-599.168335 -3.232117 -239.245895>
$Orient:		[1.732165]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$v002"
$Type:		"ground"
$Pos:			<-615.400574 -3.515568 -229.497116>
$Orient:		[2.539263]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$v003"
$Type:		"ground"
$Pos:			<-596.573730 -2.500278 -243.674393>
$Orient:		[1.256637]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$c000"
$Type:		"ground"
$Pos:			<-607.974060 -3.888880 -230.797501>
$Orient:		[2.775072]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$c001"
$Type:		"ground"
$Pos:			<-596.192139 -3.990368 -233.329742>
$Orient:		[-2.040593]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$c002"
$Type:		"ground"
$Pos:			<-601.627258 -3.933752 -232.936249>
$Orient:		[-2.617992]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$n000"
$Type:		"ground"
$Pos:			<-616.073486 -3.283289 -231.395981>
$Orient:		[I]
+Chunk:		"sr_chunk04b"

$Navpoint:	"vk02_$n001"
$Type:		"ground"
$Pos:			<-615.679016 -3.261393 -231.646194>
$Orient:		[I]
+Chunk:		"sr_chunk04b"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"vk02_garage"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		0
$Start nav:				"vk02_garage"
+Disabled
$Box size:				-3.009827 -0.045094 -2.968163 3.009827 5.000000 2.968163

$Trigger:				"vk02_record_studio"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"vk02_record_studio"
+Disabled
$Sphere radius:		5.150033

$Trigger:				"vk02_garage_open"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"vk02_garage_open"
+Disabled
$Box size:				-18.937500 0.000000 -15.250000 18.937500 8.250000 15.250000

// -------
#Vehicles
// -------

$Vehicle:		"vk02_chase_van"
$Vehicle type:	"van_4dr_news01"
$Start nav:		"vk02_chase_van"
$Group:			"vk02_chasers"
$Stream Distance:			50.000
+Hit Points:			80000
+Variant: "CS_Van"

$Vehicle:		"vk02_det_car"
$Vehicle type:	"car_4dr_luxury01"
$Start nav:		"vk02_det_car"
$Group:			"vk02_Group"
$Stream Distance:			50.000
+Hit Points:			7500
+Variant: "Aisha"

$Vehicle:		"vk02_$v000"
$Vehicle type:	"sp_trailer_tank1"
$Start nav:		"vk02_$v000"
$Group:			"vk02_chasers"
$Stream Distance:			50.000

$Vehicle:		"vk02_$v001"
$Vehicle type:	"truck_2dr_semi01"
$Start nav:		"vk02_$v001"
$Group:			"vk02_chasers"
$Stream Distance:			50.000

$Vehicle:		"vk02_$v002"
$Vehicle type:	"car_4dr_police01"
$Start nav:		"vk02_$v002"
$Group:			"vk02_chasers"
$Stream Distance:			50.000

$Vehicle:		"vk02_$v003"
$Vehicle type:	"car_4dr_police01"
$Start nav:		"vk02_$v003"
$Group:			"vk02_chasers"
$Stream Distance:			50.000

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"vk02_rap_artist"
$Char type:				"VK_B_F_Aisha"
$Start nav:				"vk02_$nav001"
+Hit points:			1000
+Knockdown points:	30
+Team:					"Playas"
+Undismissable
+StreamLoadDistance:	50.000000
+Group:					"vk02_Group"

$Human:					"vk02_van_driver"
$Char type:				"AC_W_M_Paparrazi"
$Start nav:				"vk02_van_driver"
+Hit points:			3000
+Knockdown points:	40
+Item:					"beretta"
+Rank:					1
+Team:					"Civilian"
+AttackPlayerOnSight
+StreamLoadDistance:	50.000000
+Group:					"vk02_chasers"
+Variant:					"Stalker"

$Human:					"vk02_$c000"
$Char type:				"LW_X_M_Officer_01"
$Start nav:				"vk02_$c000"
+Group:					"vk02_chasers"

$Human:					"vk02_$c001"
$Char type:				"LW_X_M_Officer_01"
$Start nav:				"vk02_$c001"
+Group:					"vk02_chasers"

$Human:					"vk02_$c002"
$Char type:				"PD_X_M_Trucker-02"
$Start nav:				"vk02_$c002"
+Group:					"vk02_chasers"

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

$Mover:		"vk02_garage_door"
$Object Name:	"G_garageDoor01"
$Chunk:		"sr_chunk02"


// -------
#Interiors
// -------



#End
