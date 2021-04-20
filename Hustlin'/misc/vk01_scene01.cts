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
$Pos:		<-0.121 -0.009 -0.176>
$Orient:	[I]
+Slate_Name:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Dex_1"
$Type:		"ground"
$Pos:		<-2.451 0.0 -5.596>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Johnny_1"
$Type:		"ground"
$Pos:		<-3.901 0.0 -4.449>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<-1.359 0.0 0.281>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_JohnnyChair01_1"
$Type:		"ground"
$Pos:		<-4.119 0.0 -4.475>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_PCChair01_1"
$Type:		"ground"
$Pos:		<-2.636 0.0 -2.88>
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

$Human:	"CS_dex"
$Char type:	"TS_B_M_Dex-01"
$Start nav:	"CS_$root_controller_Dex_1"

$Human:	"CS_johnny"
$Char type:	"TS_A_M_JohnnyGat"
$Start nav:	"CS_$root_controller_Johnny_1"
+Item:	"cellphone1l"
+Rank: 0

$Human:	"CS_LeathChair"
$Char type:	"cs_chair_leather"
$Start nav:	"CS_$root_controller_JohnnyChair01_1"

$Human:	"CS_WoodChair"
$Char type:	"cs_chair_wood_church"
$Start nav:	"CS_$root_controller_PCChair01_1"

// -------
#Effects
// -------


#End
