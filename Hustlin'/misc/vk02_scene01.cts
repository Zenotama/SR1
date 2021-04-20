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

$Navpoint: "CS_$root_controller_Aisha01_1"
$Type:		"ground"
$Pos:		<-2.31 -0.037 -0.63>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_johnny_1"
$Type:		"ground"
$Pos:		<-3.613 -0.07 -4.666>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Lchair_1"
$Type:		"ground"
$Pos:		<-3.622 0.0 -4.687>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<-2.95 -0.041 1.008>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Wchair01_1"
$Type:		"ground"
$Pos:		<-3.277 0.0 -1.919>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Wchair02_1"
$Type:		"ground"
$Pos:		<-2.276 0.0 -2.716>
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

$Human:	"CS_aisha"
$Char type:	"vk_b_f_aisha"
$Start nav:	"CS_$root_controller_Aisha01_1"

$Human:	"CS_johnny"
$Char type:	"TS_A_M_JohnnyGat"
$Start nav:	"CS_$root_controller_johnny_1"

$Human:	"CS_leather_chair"
$Char type:	"CS_chair_leather"
$Start nav:	"CS_$root_controller_Lchair_1"

$Human:	"CS_wood_chair01"
$Char type:	"CS_chair_wood_church"
$Start nav:	"CS_$root_controller_Wchair01_1"

$Human:	"CS_wood_chair02"
$Char type:	"CS_chair_wood_church"
$Start nav:	"CS_$root_controller_Wchair02_1"

// -------
#Effects
// -------


#End
