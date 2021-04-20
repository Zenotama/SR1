// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-752.3552 -1.6848 79.8737>
$Orient:	[I]



$Navpoint: "CS_slate_church_main_1"
$Type:		"ground"
$Pos:		<-0.001 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_church_main"

$Navpoint: "CS_$root_controller_dex_1"
$Type:		"ground"
$Pos:		<-11.488 0.0 -0.939>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_pc_1"
$Type:		"ground"
$Pos:		<-9.858 0.0 -13.328>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_troy_1"
$Type:		"ground"
$Pos:		<-9.561 0.0 -1.348>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_DexDesk01_1"
$Type:		"ground"
$Pos:		<-10.48 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_Photo01_1"
$Type:		"ground"
$Pos:		<-10.745 0.0 -1.169>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

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
$Start nav:	"CS_$root_controller_dex_1"

$Human:	"CS_troy"
$Char type:	"TS_W_M_Troy-01"
$Start nav:	"CS_$root_controller_troy_1"

$Human:	"CS_desk"
$Char type:	"cs_dexdesk"
$Start nav:	"CS_$root_controller_DexDesk01_1"

$Human:	"CS_photo"
$Char type:	"cs_photomanuel"
$Start nav:	"CS_$root_controller_Photo01_1"

// -------
#Effects
// -------


#End
