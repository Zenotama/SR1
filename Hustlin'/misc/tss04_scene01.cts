// -------
#Navpoints
// -------


// Slate: slate_church_main

$Navpoint: "CS_slate_church_main_1"
$Type: "ground"
$Pos: <-0.001 0.169 0.0>
$Orient: [I]
+Slate_Name: "slate_church_main"

$Navpoint: "CS_$root_controller_johnny_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_dex_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_player_1"
$Type: "ground"
$Pos: <12.9 0.0 -0.765>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_cell01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_Pew101_1"
$Type: "ground"
$Pos: <6.735 0.0 1.851>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_Pew201_1"
$Type: "ground"
$Pos: <3.114 0.0 2.592>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-0.001 0.169 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_main"

// -------
#Cutscene
// -------

$Cutscene: "CS_$Auto_Generated_Area_Node"
$Start nav: "CS_$Auto_Generated_Area_Node_Nav"
$Box size: -30.0 -30.0 -30.0 30.0 30.0 30.0

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_johnny"
$Char type: "ts_a_m_johnnygatmecha"
$Start nav: "CS_$root_controller_johnny_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_dex_1"

$Human: "CS_cell"
$Char type: "CS_cellphone"
$Start nav: "CS_$root_controller_cell01_1"

$Human: "CS_pew1"
$Char type: "cs_churchpew"
$Start nav: "CS_$root_controller_Pew101_1"

$Human: "CS_pew2"
$Char type: "cs_churchpew"
$Start nav: "CS_$root_controller_Pew201_1"

#End
