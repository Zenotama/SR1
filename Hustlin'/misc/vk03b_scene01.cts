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

$Navpoint: "CS_$root_controller_chair01_1"
$Type:		"ground"
$Pos:		<9.547 0.0 -10.037>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_chair02_1"
$Type:		"ground"
$Pos:		<7.394 0.0 -9.696>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_chair03_1"
$Type:		"ground"
$Pos:		<10.614 0.0 -9.028>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_king_1"
$Type:		"ground"
$Pos:		<9.549 0.0 -10.031>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_tanya01_1"
$Type:		"ground"
$Pos:		<-2.722 0.0 2.742>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_warren_1"
$Type:		"ground"
$Pos:		<7.393 0.0 -9.691>
$Orient:	[I]
+Uses_Slate:	"slate_vkboardroom"

$Navpoint: "CS_$root_controller_anthony01_1"
$Type:		"ground"
$Pos:		<10.658 0.0 -9.054>
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

$Human:	"CS_chair01"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_chair01_1"

$Human:	"CS_chair02"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_chair02_1"

$Human:	"CS_chair03"
$Char type:	"CS_VKchair"
$Start nav:	"CS_$root_controller_chair03_1"

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_king_1"

$Human:	"CS_tanya"
$Char type:	"AC_A_F_TanyaWinters"
$Start nav:	"CS_$root_controller_tanya01_1"

$Human:	"CS_warren"
$Char type:	"VK_B_M_WWilliams"
$Start nav:	"CS_$root_controller_warren_1"

$Human:	"CS_anthony"
$Char type:	"VK_B_M_AnthonyGreen"
$Start nav:	"CS_$root_controller_anthony01_1"

// -------
#Effects
// -------


#End
