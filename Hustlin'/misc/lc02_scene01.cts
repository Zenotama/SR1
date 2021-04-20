// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-995.1368 -3.4716 -215.4608>
$Orient:	[I]



$Navpoint: "CS_slate_gasstation_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_gasstation"

$Navpoint: "CS_$root_controller_dex01_1"
$Type:		"ground"
$Pos:		<-2.009 -0.462 0.08>
$Orient:	[I]
+Uses_Slate:	"slate_gasstation"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<-4.183 -0.463 -1.737>
$Orient:	[I]
+Uses_Slate:	"slate_gasstation"

$Navpoint: "CS_$root_controller_troy01_1"
$Type:		"ground"
$Pos:		<-1.294 -0.465 0.868>
$Orient:	[I]
+Uses_Slate:	"slate_gasstation"

$Navpoint: "CS_$root_controller_CAR4_1"
$Type:		"ground"
$Pos:		<-3.872 -0.463 1.263>
$Orient:	[I]
+Uses_Slate:	"slate_gasstation"

$Navpoint: "CS_$root_controller_Map01_1"
$Type:		"ground"
$Pos:		<-1.994 -0.463 0.756>
$Orient:	[I]
+Uses_Slate:	"slate_gasstation"

$Navpoint: "CS_area_lc02_scene01_1"
$Type:		"ground"
$Pos:		<-1.991 2.564 -0.38>
$Orient:	[I]
+Uses_Slate:	"slate_gasstation"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_lc02_scene01"
$Start nav:	"CS_area_lc02_scene01_1"
$Box size:	-32.4009 -5.22201 -32.4009 32.4009 5.22201 32.4009

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_dex"
$Char type:	"TS_B_M_Dex-01"
$Start nav:	"CS_$root_controller_dex01_1"

$Human:	"CS_troy"
$Char type:	"ts_w_m_troy-01"
$Start nav:	"CS_$root_controller_troy01_1"

$Human:	"CS_Car"
$Char type:	"cs_car_2dr_muscle_saints"
$Start nav:	"CS_$root_controller_CAR4_1"

$Human:	"CS_map"
$Char type:	"cs_map"
$Start nav:	"CS_$root_controller_Map01_1"

// -------
#Effects
// -------


#End
