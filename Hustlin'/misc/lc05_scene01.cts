// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-672.4294 -3.8129 124.2739>
$Orient:	[I]



$Navpoint: "CS_slate_friendlyFire_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_friendlyFire"

$Navpoint: "CS_$root_controller_player01 cShoe_sneakers_1"
$Type:		"ground"
$Pos:		<1.926 0.0 -0.507>
$Orient:	[I]
+Uses_Slate:	"slate_friendlyFire"

$Navpoint: "CS_$root_controller_Salesgirl01_1"
$Type:		"ground"
$Pos:		<4.802 0.0 -0.198>
$Orient:	[I]
+Uses_Slate:	"slate_friendlyFire"

$Navpoint: "CS_$root_controller_Troy01_1"
$Type:		"ground"
$Pos:		<3.567 0.0 0.524>
$Orient:	[I]
+Uses_Slate:	"slate_friendlyFire"

$Navpoint: "CS_area_lc05_scene01_1"
$Type:		"ground"
$Pos:		<2.43 1.685 -0.099>
$Orient:	[I]
+Uses_Slate:	"slate_friendlyFire"

$Navpoint: "CS_$root_controller_dex_1"
$Type:		"ground"
$Pos:		<3.542 0.0 -0.075>
$Orient:	[I]
+Uses_Slate:	"slate_friendlyFire"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_lc05_scene01"
$Start nav:	"CS_area_lc05_scene01_1"
$Box size:	-7.58282 -2.22063 -6.27805 7.58282 2.22063 6.27805

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_saleslady"
$Char type:	"ac_w_f_lc05-salesgirl"
$Start nav:	"CS_$root_controller_Salesgirl01_1"
+Item:	"sniper_rifle_cs"
+Rank: 0

$Human:	"CS_troy"
$Char type:	"ts_w_m_troy-01"
$Start nav:	"CS_$root_controller_Troy01_1"

$Human:	"CS_dex"
$Char type:	"TS_B_M_Dex-01"
$Start nav:	"CS_$root_controller_dex_1"

// -------
#Effects
// -------


#End
