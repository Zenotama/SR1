// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <1080.83 -3.5504 1471.03>
$Orient: [I]


// Slate: slate_airport_runway

$Navpoint: "CS_slate_airport_runway_1"
$Type: "ground"
$Pos: <0.0 0.125 3.645>
$Orient: [I]
+Slate_Name: "slate_airport_runway"

$Navpoint: "CS_$root_controller_luz01_1"
$Type: "ground"
$Pos: <0.065 0.0 -4.696>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

$Navpoint: "CS_$root_controller_pc01_1"
$Type: "ground"
$Pos: <-20.142 0.0 -14.545>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

$Navpoint: "CS_$root_controller_Dex01_1"
$Type: "ground"
$Pos: <-20.554 0.0 -13.814>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

$Navpoint: "CS_$root_controller_DexCar01_1"
$Type: "ground"
$Pos: <-19.768 -0.303 -13.854>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

$Navpoint: "CS_$root_controller_LuzCar01_1"
$Type: "ground"
$Pos: <-139.643 -0.304 -3.202>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

$Navpoint: "CS_$root_controller_LuzBag01_1"
$Type: "ground"
$Pos: <3.195 0.0 -3.288>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

$Navpoint: "CS_area_lc10_scene03_1"
$Type: "ground"
$Pos: <0.039 1.582 -3.962>
$Orient: [I]
+Uses_Slate: "slate_airport_runway"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc10_scene03"
$Start nav: "CS_area_lc10_scene03_1"
$Box size: -19.9072 -9.08343 -16.1877 19.9072 9.08343 16.1877

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_luz"
$Char type: "lc_l_f_luz"
$Start nav: "CS_$root_controller_luz01_1"

$Human: "CS_dex"
$Char type: "ts_b_m_dex-01"
$Start nav: "CS_$root_controller_Dex01_1"

$Human: "CS_dcar"
$Char type: "cs_car_dex"
$Start nav: "CS_$root_controller_DexCar01_1"

$Human: "CS_lcar"
$Char type: "cs_car_luz"
$Start nav: "CS_$root_controller_LuzCar01_1"

$Human: "CS_bag"
$Char type: "cs_luzbag"
$Start nav: "CS_$root_controller_LuzBag01_1"

#End
