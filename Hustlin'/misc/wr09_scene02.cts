// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <479.87 22.5414 -1797.14>
$Orient: [I]


// Slate: slate_wr09_scene02

$Navpoint: "CS_slate_wr09_scene02_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_wr09_scene02"

$Navpoint: "CS_$root_controller_Semi01_1"
$Type: "ground"
$Pos: <-48.028 -6.679 -69.933>
$Orient: [I]
+Uses_Slate: "slate_wr09_scene02"

$Navpoint: "CS_$root_controller_Trailer01_1"
$Type: "ground"
$Pos: <-57.56 -6.842 -78.639>
$Orient: [I]
+Uses_Slate: "slate_wr09_scene02"

$Navpoint: "CS_$root_controller_PC01_1"
$Type: "ground"
$Pos: <5.835 0.0 -5.505>
$Orient: [I]
+Uses_Slate: "slate_wr09_scene02"

$Navpoint: "CS_$root_controller_price_1"
$Type: "ground"
$Pos: <-68.149 0.0 -75.782>
$Orient: [I]
+Uses_Slate: "slate_wr09_scene02"

$Navpoint: "CS_area_wr09_scene02_1"
$Type: "ground"
$Pos: <-16.096 0.0 -25.704>
$Orient: [0.70328]
+Uses_Slate: "slate_wr09_scene02"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_wr09_scene02"
$Start nav: "CS_area_wr09_scene02_1"
$Box size: -15.9626 -4.52338 -53.0423 15.9626 4.52338 53.0423

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_truck"
$Char type: "cs_truck_price"
$Start nav: "CS_$root_controller_Semi01_1"

$Human: "CS_trailer"
$Char type: "cs_trailer_price"
$Start nav: "CS_$root_controller_Trailer01_1"

$Human: "CS_price"
$Char type: "wr_w_m_josephprice"
$Start nav: "CS_$root_controller_price_1"

#End
