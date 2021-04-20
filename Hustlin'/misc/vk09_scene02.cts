// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-883.4318 27.6314 -1246.5162>
$Orient:	[I]



$Navpoint: "CS_slate_vk09_scene02_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_vk09_scene02"

$Navpoint: "CS_$root_controller_Johnny_1"
$Type:		"ground"
$Pos:		<1.348 -0.033 -2.256>
$Orient:	[I]
+Uses_Slate:	"slate_vk09_scene02"

$Navpoint: "CS_$root_controller_King_1"
$Type:		"ground"
$Pos:		<-0.82 -0.043 -2.014>
$Orient:	[I]
+Uses_Slate:	"slate_vk09_scene02"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<0.826 -0.042 -0.431>
$Orient:	[I]
+Uses_Slate:	"slate_vk09_scene02"

$Navpoint: "CS_$root_controller_DoorPanelA01_1"
$Type:		"ground"
$Pos:		<1.622 0.0 -3.413>
$Orient:	[I]
+Uses_Slate:	"slate_vk09_scene02"

$Navpoint: "CS_$root_controller_DoorPanelB01_1"
$Type:		"ground"
$Pos:		<1.622 0.0 -3.413>
$Orient:	[I]
+Uses_Slate:	"slate_vk09_scene02"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_johnny"
$Char type:	"ts_a_m_johnnygatmecha"
$Start nav:	"CS_$root_controller_Johnny_1"

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_King_1"

$Human:	"CS_DoorA"
$Char type:	"cs_elevatordoor"
$Start nav:	"CS_$root_controller_DoorPanelA01_1"

$Human:	"CS_doorB"
$Char type:	"cs_elevatordoor"
$Start nav:	"CS_$root_controller_DoorPanelB01_1"

// -------
#Effects
// -------


#End
