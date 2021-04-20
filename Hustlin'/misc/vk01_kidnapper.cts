// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<65.5276 -4.0762 -161.6364>
$Orient:	[I]



$Navpoint: "CS_slate_vk01_warehouse_1"
$Type:		"ground"
$Pos:		<0.064 0.025 -0.059>
$Orient:	[I]
+Slate_Name:	"slate_vk01_warehouse"

$Navpoint: "CS_$root_controller_CAR4_1"
$Type:		"ground"
$Pos:		<-1.578 -0.211 -2.259>
$Orient:	[I]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_$root_controller_sis_1"
$Type:		"ground"
$Pos:		<-1.09 0.0 -2.366>
$Orient:	[I]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_$root_controller_thug01_1"
$Type:		"ground"
$Pos:		<-1.292 0.0 -1.62>
$Orient:	[I]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_Charnav_walker01_1"
$Type:		"ground"
$Pos:		<-11.763 -0.289 -24.342>
$Orient:	[1.52478]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_PathNav_walker01_01_1"
$Type:		"ground"
$Pos:		<1.495 -0.289 -24.243>
$Orient:	[I]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_CharNav_talker01_1"
$Type:		"ground"
$Pos:		<-0.605 -0.264 -28.245>
$Orient:	[4.90131]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_CharNav_talker02_1"
$Type:		"ground"
$Pos:		<-1.226 -0.264 -28.205>
$Orient:	[1.54837]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_$root_controller_Door01_1"
$Type:		"ground"
$Pos:		<4.202 0.0 -1.16>
$Orient:	[I]
+Uses_Slate:	"slate_vk01_warehouse"

$Navpoint: "CS_area_vk01_kidnap_1"
$Type:		"ground"
$Pos:		<-12.036 9.059 -18.245>
$Orient:	[I]
+Uses_Slate:	"slate_vk01_warehouse"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_vk01_kidnap"
$Start nav:	"CS_area_vk01_kidnap_1"
$Box size:	-72.0504 -13.3049 -72.0504 72.0504 13.3049 72.0504

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_car"
$Char type:	"cs4drStd_vk"
$Start nav:	"CS_$root_controller_CAR4_1"

$Human:	"CS_sis"
$Char type:	"PD_X_F_GenericYoung-03"
$Start nav:	"CS_$root_controller_sis_1"
+Variant:	"aisha"

$Human:	"CS_thug"
$Char type:	"VK_X_M_Thug1-01"
$Start nav:	"CS_$root_controller_thug01_1"
+Item:	"beretta"
+Rank: 0
+Variant:	"vk_kidnapper"

$Human:	"CS_walker01"
$Char type:	"pd_x_m_dockworker"
$Start nav:	"CS_Charnav_walker01_1"

$Human:	"CS_talker01"
$Char type:	"pd_x_f_businesswoman-01"
$Start nav:	"CS_CharNav_talker01_1"
+Item:	"40oz"
+Rank: 0

$Human:	"CS_talker02"
$Char type:	"pd_x_m_businessman-01"
$Start nav:	"CS_CharNav_talker02_1"
+Item:	"40oz"
+Rank: 0

$Human:	"CS_door"
$Char type:	"cs_kidnapdoor"
$Start nav:	"CS_$root_controller_Door01_1"

// -------
#Effects
// -------


#End
