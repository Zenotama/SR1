// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-885.8810 152.6447 -1246.3688>
$Orient:	[I]



$Navpoint: "CS_slate_vkboardroom_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_deskphone01_1"
$Type:		"ground"
$Pos:		<9.885 0.0 -9.2>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_king_1"
$Type:		"ground"
$Pos:		<10.244 0.0 -9.753>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_kingchair_1"
$Type:		"ground"
$Pos:		<10.24 0.0 -9.716>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_wrn_1"
$Type:		"ground"
$Pos:		<12.891 0.0 -10.25>
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

$Human:	"CS_deskphone"
$Char type:	"CS_blackphone"
$Start nav:	"CS_$root_controller_deskphone01_1"

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_king_1"

$Human:	"CS_kingchair"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_kingchair_1"

$Human:	"CS_warren"
$Char type:	"VK_B_M_WWilliams"
$Start nav:	"CS_$root_controller_wrn_1"

// -------
#Effects
// -------


#End
