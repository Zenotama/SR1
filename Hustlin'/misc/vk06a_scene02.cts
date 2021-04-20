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

$Navpoint: "CS_$root_controller_blackphone_1"
$Type:		"ground"
$Pos:		<9.233 0.0 -9.782>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_gun_1"
$Type:		"ground"
$Pos:		<9.678 0.0 -6.701>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_kchair_1"
$Type:		"ground"
$Pos:		<9.611 0.0 -10.281>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_KING_1"
$Type:		"ground"
$Pos:		<9.611 0.0 -10.117>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_wchair_1"
$Type:		"ground"
$Pos:		<9.591 0.0 -6.655>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_WRRN_1"
$Type:		"ground"
$Pos:		<9.644 0.0 -6.562>
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

$Human:	"CS_phone"
$Char type:	"cs_blackphone"
$Start nav:	"CS_$root_controller_blackphone_1"

$Human:	"CS_gun"
$Char type:	"CS_SFalcon"
$Start nav:	"CS_$root_controller_gun_1"

$Human:	"CS_kchair"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_kchair_1"

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_KING_1"

$Human:	"CS_wchair"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_wchair_1"

$Human:	"CS_warren"
$Char type:	"VK_B_M_WWilliams"
$Start nav:	"CS_$root_controller_WRRN_1"

// -------
#Effects
// -------


#End
