// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<15.5208 23.5846 -431.0059>
$Orient:	[I]



$Navpoint: "CS_slate_drawbridge_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_drawbridge"

$Navpoint: "CS_$root_controller_CAR4_1"
$Type:		"ground"
$Pos:		<105.211 -28.918 140.306>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_$root_controller_gang01_1"
$Type:		"ground"
$Pos:		<174.373 -28.395 69.118>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_$root_controller_pcCar01_1"
$Type:		"ground"
$Pos:		<33.568 -13.556 36.202>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<106.499 -28.87 148.024>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_angelo01_$root_controller_MAL2_1"
$Type:		"ground"
$Pos:		<104.958 -28.851 140.023>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_dex01_$root_controller_MAL2_1"
$Type:		"ground"
$Pos:		<105.518 -28.851 148.088>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_CargoShip01_$root_controller_ITEM_1"
$Type:		"ground"
$Pos:		<-79.714 37.413 -252.359>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

$Navpoint: "CS_lc09_scene03_area_1"
$Type:		"ground"
$Pos:		<-39.844 0.0 -216.385>
$Orient:	[I]
+Uses_Slate:	"slate_drawbridge"

// -------
#Cutscene
// -------

$Cutscene:	"CS_lc09_scene03_area"
$Start nav:	"CS_lc09_scene03_area_1"
$Box size:	-235.461 -187.737 -465.14 235.461 187.737 465.14

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_angcar"
$Char type:	"cs_Car_Angelo"
$Start nav:	"CS_$root_controller_CAR4_1"

$Human:	"CS_gang"
$Char type:	"cs_LC_4dr_Std06"
$Start nav:	"CS_$root_controller_gang01_1"

$Human:	"CS_pccar"
$Char type:	"cs_lc_4dr_std06"
$Start nav:	"CS_$root_controller_pcCar01_1"
+Variant:	"LC09"

$Human:	"CS_angelo"
$Char type:	"LC_L_M_AngeloLopez-01"
$Start nav:	"CS_angelo01_$root_controller_MAL2_1"

$Human:	"CS_dex"
$Char type:	"TS_B_M_Dex-01"
$Start nav:	"CS_dex01_$root_controller_MAL2_1"

$Human:	"CS_CargoShip"
$Char type:	"cs_cargoship"
$Start nav:	"CS_CargoShip01_$root_controller_ITEM_1"

// -------
#Effects
// -------


#End
