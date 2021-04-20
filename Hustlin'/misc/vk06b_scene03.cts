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
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_bphone_1"
$Type:		"ground"
$Pos:		<9.167 0.0 -9.68>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_chair_1"
$Type:		"ground"
$Pos:		<9.823 0.0 -10.258>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_king_1"
$Type:		"ground"
$Pos:		<9.739 0.0 -10.225>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_tanya_1"
$Type:		"ground"
$Pos:		<0.01 0.0 -0.009>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_vk01_1"
$Type:		"ground"
$Pos:		<-3.357 0.0 5.708>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_vkb01_1"
$Type:		"ground"
$Pos:		<-4.648 0.0 6.133>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_warren_1"
$Type:		"ground"
$Pos:		<-0.595 0.0 -0.111>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_DoorL01_1"
$Type:		"ground"
$Pos:		<-2.499 0.0 2.849>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_DoorR01_1"
$Type:		"ground"
$Pos:		<-1.313 0.0 3.592>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_bphone"
$Char type:	"cs_blackphone"
$Start nav:	"CS_$root_controller_bphone_1"

$Human:	"CS_chair"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_chair_1"

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_king_1"

$Human:	"CS_tanya"
$Char type:	"AC_A_F_TanyaWinters"
$Start nav:	"CS_$root_controller_tanya_1"

$Human:	"CS_thug"
$Char type:	"VK_X_M_killa1-02"
$Start nav:	"CS_$root_controller_vk01_1"

$Human:	"CS_thug02"
$Char type:	"VK_X_M_killa1-02"
$Start nav:	"CS_$root_controller_vkb01_1"

$Human:	"CS_warren"
$Char type:	"VK_B_M_WWilliams"
$Start nav:	"CS_$root_controller_warren_1"

$Human:	"CS_doorL"
$Char type:	"cs_boardroomdoor"
$Start nav:	"CS_$root_controller_DoorL01_1"

$Human:	"CS_doorR"
$Char type:	"cs_boardroomdoor"
$Start nav:	"CS_$root_controller_DoorR01_1"

// -------
#Effects
// -------


#End
