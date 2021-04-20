// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-910.0310 -3.7071 59.6719>
$Orient:	[I]



$Navpoint: "CS_slate_samsons_garage_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_samsons_garage"

$Navpoint: "CS_$root_controller_dex_1"
$Type:		"ground"
$Pos:		<4.284 0.006 5.242>
$Orient:	[I]
+Uses_Slate:	"slate_samsons_garage"

$Navpoint: "CS_$root_controller_pc_1"
$Type:		"ground"
$Pos:		<-7.813 -0.011 0.604>
$Orient:	[I]
+Uses_Slate:	"slate_samsons_garage"

$Navpoint: "CS_$root_controller_Troy01_1"
$Type:		"ground"
$Pos:		<2.076 0.003 0.163>
$Orient:	[I]
+Uses_Slate:	"slate_samsons_garage"

$Navpoint: "CS_lc04_scene01_area_1"
$Type:		"ground"
$Pos:		<-3.588 3.788 0.611>
$Orient:	[I]
+Uses_Slate:	"slate_samsons_garage"

// -------
#Cutscene
// -------

$Cutscene:	"CS_lc04_scene01_area"
$Start nav:	"CS_lc04_scene01_area_1"
$Box size:	-21.8947 -5.47356 -21.8947 21.8947 5.47356 21.8947

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
$Char type:	"ts_w_m_troy-01"
$Start nav:	"CS_$root_controller_Troy01_1"

// -------
#Effects
// -------


#End
