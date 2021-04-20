// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-752.3709 -1.7098 79.9113>
$Orient:	[I]



$Navpoint: "CS_slate_church_main_1"
$Type:		"ground"
$Pos:		<-0.001 0.0 -0.001>
$Orient:	[I]
+Slate_Name:	"slate_church_main"

$Navpoint: "CS_cs_lc08_scene01_shot_1"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_dex_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<-2.748 0.0 -0.275>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_troy_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
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

// -------
#Effects
// -------

#End
