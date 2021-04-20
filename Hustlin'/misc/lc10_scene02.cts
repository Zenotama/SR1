// -------
#Navpoints
// -------


// Slate: slate_airport_hanger

$Navpoint: "CS_slate_airport_hanger_1"
$Type: "ground"
$Pos: <0.103 0.621 3.337>
$Orient: [1.50098]
+Slate_Name: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_angelo01_1"
$Type: "ground"
$Pos: <0.692 0.0 -0.326>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_carnalesA01_1"
$Type: "ground"
$Pos: <-2.243 0.0 3.95>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_carnalesB01_1"
$Type: "ground"
$Pos: <-1.359 0.0 -1.29>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_guardA01_1"
$Type: "ground"
$Pos: <56.314 0.0 254.295>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_guardB01_1"
$Type: "ground"
$Pos: <37.19 0.0 256.651>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_carDex01_1"
$Type: "ground"
$Pos: <-7.856 -0.013 18.572>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_dex_1"
$Type: "ground"
$Pos: <-8.32 0.0 17.919>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_player01_1"
$Type: "ground"
$Pos: <-7.489 0.0 17.919>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_Luggage101_1"
$Type: "ground"
$Pos: <-2.065 0.0 3.849>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_Luggage201_1"
$Type: "ground"
$Pos: <-3.036 0.0 0.106>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_Plane01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_$root_controller_AngCar01_1"
$Type: "ground"
$Pos: <-3.57 -0.017 0.217>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

$Navpoint: "CS_lc10_scene02_area_1"
$Type: "ground"
$Pos: <34.469 9.9 175.769>
$Orient: [I]
+Uses_Slate: "slate_airport_hanger"

// -------
#Cutscene
// -------

$Cutscene: "CS_lc10_scene02_area"
$Start nav: "CS_lc10_scene02_area_1"
$Box size: -86.53 -13.0464 -228.86 86.53 13.0464 228.86

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_angelo"
$Char type: "LC_L_M_AngeloLopez-01"
$Start nav: "CS_$root_controller_angelo01_1"
+Item: "cellphone"
+Rank: 0

$Human: "CS_carnalesA"
$Char type: "LC_X_M_Killa1-01"
$Start nav: "CS_$root_controller_carnalesA01_1"
+Variant: "HispanicDiamondShirt"

$Human: "CS_carnalesB"
$Char type: "LC_X_M_Killa2-01"
$Start nav: "CS_$root_controller_carnalesB01_1"
+Variant: "hispanic1"

$Human: "CS_guardA"
$Char type: "LC_X_M_Thug2-02"
$Start nav: "CS_$root_controller_guardA01_1"
+Variant: "lc10"

$Human: "CS_guardB"
$Char type: "LC_X_M_Thug1-01"
$Start nav: "CS_$root_controller_guardB01_1"
+Variant: "lc10"

$Human: "CS_carDex"
$Char type: "cs_Car_Dex"
$Start nav: "CS_$root_controller_carDex01_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_dex_1"

$Human: "CS_lug101"
$Char type: "cs_luggage"
$Start nav: "CS_$root_controller_Luggage101_1"

$Human: "CS_lug201"
$Char type: "cs_luggage"
$Start nav: "CS_$root_controller_Luggage201_1"

$Human: "CS_plane"
$Char type: "cs_plane"
$Start nav: "CS_$root_controller_Plane01_1"

$Human: "CS_acar"
$Char type: "cs_car_angelo"
$Start nav: "CS_$root_controller_AngCar01_1"

#End
