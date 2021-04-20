// -------
#Groups
// -------

$Group:	"tss01a_troy"
$Group:	"tss01a_vks"

// -------
#Navpoints
// -------

$Navpoint:	"tss01a_leave_gun"
$Type:		"ground"
$Pos:			<-678.442383 -3.850000 119.608047>
$Orient:		[0.510915]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_leave_clothing"
$Type:		"ground"
$Pos:			<-398.037689 -3.798966 97.522850>
$Orient:		[-0.767185]
+Chunk:		"sr_chunk04"

$Navpoint:	"tss01a_troy"
$Type:		"ground"
$Pos:			<-751.929321 -2.060195 89.832527>
$Orient:		[1.846351]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk1"
$Type:		"ground"
$Pos:			<-760.738647 -3.850065 129.605804>
$Orient:		[-2.619688]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk2"
$Type:		"ground"
$Pos:			<-763.589722 -3.850066 128.280914>
$Orient:		[1.705356]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_freckle_bitches"
$Type:		"ground"
$Pos:			<-1022.895386 -3.797266 -135.440002>
$Orient:		[I]
+Chunk:		"sr_chunk01"

$Navpoint:	"tss01a_troycar"
$Type:		"ground"
$Pos:			<-385.735657 -4 81.815506>
$Orient:		[-0.022536]
+Chunk:		"sr_chunk04"

$Navpoint:	"tss01a_troydest"
$Type:		"ground"
$Pos:			<-391.020752 -3.849999 96.679466>
$Orient:		[I]
+Chunk:		"sr_chunk04"

$Navpoint:	"tss01a_camera"
$Type:		"floating"
$Pos:			<-400.734131 -2.826849 99.795113>
$Orient:		[<-0.573973 0 -0.818874> <0.058192 0.997472 -0.040789> <0.816804 -0.071063 -0.572522>]

$Navpoint:	"tss01a_troydest2"
$Type:		"ground"
$Pos:			<-394.326874 -3.850000 96.680054>
$Orient:		[I]
+Chunk:		"sr_chunk04"

$Navpoint:	"tss01a_vk3"
$Type:		"ground"
$Pos:			<-853.251892 -3.855000 149.438721>
$Orient:		[-2.619688]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk4"
$Type:		"ground"
$Pos:			<-855.694397 -3.855001 148.015045>
$Orient:		[1.705356]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk6"
$Type:		"ground"
$Pos:			<-853.037231 -4.000001 98.026360>
$Orient:		[-1.141179]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk5"
$Type:		"ground"
$Pos:			<-855.957886 -4 96.455658>
$Orient:		[-0.038019]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_leave_gun2"
$Type:		"ground"
$Pos:			<-654.638733 -3.424075 116.707253>
$Orient:		[0.510915]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_gun_gps"
$Type:		"ground"
$Pos:			<-684.854980 -4 123.660118>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk1_gps"
$Type:		"ground"
$Pos:			<-754.302551 -3.999999 129.966721>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk2_gps"
$Type:		"ground"
$Pos:			<-845.934082 -4.000001 158.283859>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_vk3_gps"
$Type:		"ground"
$Pos:			<-873.376038 -4 96.888840>
$Orient:		[I]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_fnf_gps"
$Type:		"ground"
$Pos:			<-1004.855713 3.965021 -32.905441>
$Orient:		[I]
+Chunk:		"sr_chunk01"

$Navpoint:	"tss01a_fb_gps"
$Type:		"ground"
$Pos:			<-1009.009766 -4 -150.934998>
$Orient:		[I]
+Chunk:		"sr_chunk01"

$Navpoint:	"tss01a_vk_car"
$Type:		"ground"
$Pos:			<-861.935364 -3.999999 97.831360>
$Orient:		[-1.345447]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01a_troy_walk"
$Type:		"ground"
$Pos:			<-738.892334 -3.855008 92.219910>
$Orient:		[0.506877]
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

$Trigger:				"tss01a_leave_gun"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"tss01a_leave_gun"
+Disabled
$Box size:				-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000

$Trigger:				"tss01a_leave_clothing"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"tss01a_leave_clothing"
+Disabled
$Box size:				-1.000000 0.000000 -2.312500 1.000000 2.125000 2.312500

$Trigger:				"tss01a_freckle_bitches"
$Trigger type:			"sphere"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		0
$Start nav:				"tss01a_freckle_bitches"
+Disabled
$Sphere radius:		2.000000

$Trigger:				"tss01a_clothing_store"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"shops_sr_city_$clothing store000"
+Disabled
$Box size:				-4.000000 0.000000 -4.562500 4.000000 2.000000 4.562500

$Trigger:				"tss01a_gun_store"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"shops_sr_city_$weapon store001"
+Disabled
$Box size:				-3.062500 0.000000 -1.029190 3.062500 2.000000 1.029266

$Trigger:				"tss01a_leave_gun2"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"tss01a_leave_gun2"
+Disabled
$Box size:				-1.000000 0.000000 -1.000000 1.000000 2.000000 1.000000

// -------
#Vehicles
// -------

$Vehicle:		"tss01a_troycar"
$Vehicle type:	"car_2dr_muscle02"
$Start nav:		"tss01a_troycar"
$Group:			"tss01a_troy"
$Stream Distance:			50.000

$Vehicle:		"tss01a_vk_car"
$Vehicle type:	"car_4dr_lowrider01"
$Start nav:		"tss01a_vk_car"
$Group:			"tss01a_vks"
$Stream Distance:			50.000
+Variant: "Gang_VK"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"tss01a_troy"
$Char type:				"TS_W_M_Troy-01"
$Start nav:				"tss01a_troy"
+Hit points:			4000
+Item:					"beretta"
+Rank:					3
+Undismissable
+Group:					"tss01a_troy"

$Human:					"tss01a_vk1"
$Char type:				"VK_X_M_Thug1-02"
$Start nav:				"tss01a_vk1"
+Item:					"beretta"
+Rank:					1
+Group:					"tss01a_vks"

$Human:					"tss01a_vk2"
$Char type:				"VK_X_M_Thug1-02"
$Start nav:				"tss01a_vk2"
+Item:					"beretta"
+Rank:					1
+Group:					"tss01a_vks"

$Human:					"tss01a_vk3"
$Char type:				"VK_X_M_Thug1-02"
$Start nav:				"tss01a_vk3"
+Item:					"beretta"
+Rank:					1
+Group:					"tss01a_vks"

$Human:					"tss01a_vk4"
$Char type:				"VK_X_M_Thug1-02"
$Start nav:				"tss01a_vk4"
+Item:					"beretta"
+Rank:					1
+Group:					"tss01a_vks"

$Human:					"tss01a_vk6"
$Char type:				"VK_X_M_Thug1-02"
$Start nav:				"tss01a_vk6"
+Item:					"beretta"
+Rank:					1
+Group:					"tss01a_vks"

$Human:					"tss01a_vk5"
$Char type:				"VK_X_M_Thug1-02"
$Start nav:				"tss01a_vk5"
+Item:					"beretta"
+Rank:					1
+Group:					"tss01a_vks"

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
