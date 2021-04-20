// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-885.6000 152.6447 -1246.0571>
$Orient:	[I]



$Navpoint: "CS_slate_vkboardroom_1"
$Type:		"ground"
$Pos:		<4.243 0.143 13.683>
$Orient:	[0.488692]
+Slate_Name:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_AK4701_1"
$Type:		"ground"
$Pos:		<8.972 0.0 6.268>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_BigHo01_1"
$Type:		"ground"
$Pos:		<9.679 0.0 7.645>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_BigHo201_1"
$Type:		"ground"
$Pos:		<9.997 0.0 3.428>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_chair_1"
$Type:		"ground"
$Pos:		<9.31 0.0 5.918>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_DoorL01_1"
$Type:		"ground"
$Pos:		<-0.464 0.0 -1.971>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_DoorR01_1"
$Type:		"ground"
$Pos:		<-2.336 0.0 -2.133>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_johnny01_1"
$Type:		"ground"
$Pos:		<-0.682 0.001 -5.156>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_king01_1"
$Type:		"ground"
$Pos:		<-2.43 0.003 -4.998>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_PISTOL_player01_1"
$Type:		"ground"
$Pos:		<-1.189 0.0 -3.998>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<-1.616 0.003 -4.331>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_regho01_1"
$Type:		"ground"
$Pos:		<11.352 0.0 2.985>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_skinho01_1"
$Type:		"ground"
$Pos:		<0.288 0.0 0.433>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_skinho02_1"
$Type:		"ground"
$Pos:		<12.919 0.0 8.841>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_skinho03_1"
$Type:		"ground"
$Pos:		<12.758 0.0 3.794>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_tanya01_1"
$Type:		"ground"
$Pos:		<9.427 0.519 5.958>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_area_vk09_scene03_1"
$Type:		"ground"
$Pos:		<5.148 2.054 4.473>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_vk09_scene03"
$Start nav:	"CS_area_vk09_scene03_1"
$Box size:	-13.7895 -3.75934 -13.7895 13.7895 3.75934 13.7895

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_AK47"
$Char type:	"CS_AK47"
$Start nav:	"CS_$root_controller_AK4701_1"

$Human:	"CS_bigho01"
$Char type:	"pd_x_f_bigho-01"
$Start nav:	"CS_$root_controller_BigHo01_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_bigho201"
$Char type:	"pd_x_f_bigho-01"
$Start nav:	"CS_$root_controller_BigHo201_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_chair"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_chair_1"

$Human:	"CS_doorL"
$Char type:	"cs_boardroomdoor"
$Start nav:	"CS_$root_controller_DoorL01_1"

$Human:	"CS_doorR"
$Char type:	"cs_boardroomdoor"
$Start nav:	"CS_$root_controller_DoorR01_1"

$Human:	"CS_johnny"
$Char type:	"ts_a_m_johnnygatmecha"
$Start nav:	"CS_$root_controller_johnny01_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_king01_1"
+Item:	"pump_action_shotgun"
+Rank: 0

$Human:	"CS_PISTOL"
$Char type:	"cs_sfalcon"
$Start nav:	"CS_$root_controller_PISTOL_player01_1"

$Human:	"CS_regho01"
$Char type:	"pd_x_f_ho-03"
$Start nav:	"CS_$root_controller_regho01_1"
+Item:	"pump_action_shotgun"
+Rank: 0

$Human:	"CS_skho01"
$Char type:	"pd_x_f_skinnyho"
$Start nav:	"CS_$root_controller_skinho01_1"
+Item:	"mac10"
+Rank: 0

$Human:	"CS_skho02"
$Char type:	"pd_x_f_skinnyho"
$Start nav:	"CS_$root_controller_skinho02_1"
+Item:	"twelve_gauge"
+Rank: 0

$Human:	"CS_skho03"
$Char type:	"pd_x_f_skinnyho"
$Start nav:	"CS_$root_controller_skinho03_1"
+Item:	"twelve_gauge"
+Rank: 0

$Human:	"CS_tanya"
$Char type:	"AC_A_F_TanyaWinters"
$Start nav:	"CS_$root_controller_tanya01_1"

// -------
#Effects
// -------


#End
