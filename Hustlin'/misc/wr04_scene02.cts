// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <326.988 33.9335 -2098.45>
$Orient: [I]


// Slate: slate_smansion_main

$Navpoint: "CS_slate_smansion_main_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_smansion_main"

$Navpoint: "CS_$root_controller_price_1"
$Type: "ground"
$Pos: <7.164 0.0 -2.111>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

$Navpoint: "CS_$root_controller_donnie_1"
$Type: "ground"
$Pos: <1.76 0.0 0.839>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

$Navpoint: "CS_$root_controller_sharp01_1"
$Type: "ground"
$Pos: <6.185 0.0 -2.667>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

$Navpoint: "CS_$root_controller_lin01_1"
$Type: "ground"
$Pos: <2.627 0.0 0.83>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

$Navpoint: "CS_$root_controller_couch01_1"
$Type: "ground"
$Pos: <3.029 0.0 0.576>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

$Navpoint: "CS_$root_controller_blnt01_1"
$Type: "ground"
$Pos: <1.859 0.0 1.272>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

$Navpoint: "CS_area_wr04_scene02_1"
$Type: "ground"
$Pos: <1.721 1.633 -0.315>
$Orient: [I]
+Uses_Slate: "slate_smansion_main"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_wr04_scene02"
$Start nav: "CS_area_wr04_scene02_1"
$Box size: -7.8466 -3.69875 -5.87729 7.8466 3.69875 5.87729

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_price"
$Char type: "WR_W_M_JosephPrice"
$Start nav: "CS_$root_controller_price_1"

$Human: "CS_donnie"
$Char type: "WR_A_M_Donnie-01"
$Start nav: "CS_$root_controller_donnie_1"

$Human: "CS_sharp"
$Char type: "WR_W_M_Sharp"
$Start nav: "CS_$root_controller_sharp01_1"

$Human: "CS_lin"
$Char type: "TS_A_F_Lin"
$Start nav: "CS_$root_controller_lin01_1"

$Human: "CS_couch"
$Char type: "CS_pricecouch"
$Start nav: "CS_$root_controller_couch01_1"

$Human: "CS_blunt"
$Char type: "CS_joint"
$Start nav: "CS_$root_controller_blnt01_1"

#End
