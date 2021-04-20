// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-720.539 -3.4164 49.4642>
$Orient: [I]


// Slate: slate_sr_liquorstore

$Navpoint: "CS_slate_sr_liquorstore_1"
$Type: "ground"
$Pos: <-0.619 0.0 4.56>
$Orient: [I]
+Slate_Name: "slate_sr_liquorstore"

$Navpoint: "CS_$root_controller_dex_1"
$Type: "ground"
$Pos: <-2.987 0.0 -17.014>
$Orient: [I]
+Uses_Slate: "slate_sr_liquorstore"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <0.619 0.0 -1.144>
$Orient: [I]
+Uses_Slate: "slate_sr_liquorstore"

$Navpoint: "CS_$root_controller_DexCar01_1"
$Type: "ground"
$Pos: <-2.609 -0.617 -16.442>
$Orient: [I]
+Uses_Slate: "slate_sr_liquorstore"

$Navpoint: "CS_area_lc10_scene01_1"
$Type: "ground"
$Pos: <-7.268 4.129 0.298>
$Orient: [I]
+Uses_Slate: "slate_sr_liquorstore"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc10_scene01"
$Start nav: "CS_area_lc10_scene01_1"
$Box size: -21.3112 -5.45259 -40.6036 21.3112 5.45259 40.6036

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_dex_1"

$Human: "CS_dexCar"
$Char type: "cs_Car_Dex"
$Start nav: "CS_$root_controller_DexCar01_1"

#End
