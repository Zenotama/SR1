// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-754.4744 -1.8832 95.0652>
$Orient:	[I]



$Navpoint: "CS_slate_church_johnnyroom_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_MAL2_Gat01_1"
$Type:		"ground"
$Pos:		<-3.081 0.004 -4.442>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_MAL2_KING01_1"
$Type:		"ground"
$Pos:		<-4.365 0.006 1.647>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_PC01 cBotm_casBagyPant_NH_1"
$Type:		"ground"
$Pos:		<-2.854 -0.006 -1.739>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_MAL2_1"
$Type:		"ground"
$Pos:		<-3.305 0.0 -3.355>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Chair01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_gat"
$Char type:	"ts_a_m_johnnygatmecha"
$Start nav:	"CS_$root_controller_MAL2_Gat01_1"

$Human:	"CS_king"
$Char type:	"VK_B_M_benjaminKing"
$Start nav:	"CS_$root_controller_MAL2_KING01_1"
+Item:	"pump_action_shotgun"
+Rank: 0

$Human:	"CS_csAKchar"
$Char type:	"VK_X_M_AK47"
$Start nav:	"CS_$root_controller_MAL2_1"

$Human:	"CS_chair"
$Char type:	"cs_chair_leather"
$Start nav:	"CS_$root_controller_Chair01_1"

// -------
#Effects
// -------


#End
