// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]


// Slate: slate_hitman_sunnyvale

$Navpoint: "CS_slate_hitman_sunnyvale_1"
$Type: "ground"
$Pos: <-0.001 0.015 0.0>
$Orient: [I]
+Slate_Name: "slate_hitman_sunnyvale"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <1.344 0.0 1.23>
$Orient: [I]
+Uses_Slate: "slate_hitman_sunnyvale"

$Navpoint: "CS_$root_controller_Marcel_1"
$Type: "ground"
$Pos: <-0.552 0.0 1.775>
$Orient: [I]
+Uses_Slate: "slate_hitman_sunnyvale"

$Navpoint: "CS_$root_controller_BeerBottle01_1"
$Type: "ground"
$Pos: <-0.207 0.0 1.607>
$Orient: [I]
+Uses_Slate: "slate_hitman_sunnyvale"

$Navpoint: "CS_$root_controller_Photo01_1"
$Type: "ground"
$Pos: <0.179 0.0 1.91>
$Orient: [I]
+Uses_Slate: "slate_hitman_sunnyvale"

$Navpoint: "CS_area_hitman_sunny_1"
$Type: "ground"
$Pos: <-0.04 2.837 0.662>
$Orient: [I]
+Uses_Slate: "slate_hitman_sunnyvale"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_hitman_sunny"
$Start nav: "CS_area_hitman_sunny_1"
$Box size: -7.41021 -3.67503 -7.41021 7.41021 3.67503 7.41021

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_marcel"
$Char type: "AC_B_M_Hitman-Marcel"
$Start nav: "CS_$root_controller_Marcel_1"

$Human: "CS_beer"
$Char type: "CS_BeerBottle"
$Start nav: "CS_$root_controller_BeerBottle01_1"

$Human: "CS_photo"
$Char type: "cs_hitman_photo"
$Start nav: "CS_$root_controller_Photo01_1"

#End
