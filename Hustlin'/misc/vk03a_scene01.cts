// -------
#Navpoints
// -------


// Slate: slate_freckle_bitches

$Navpoint: "CS_slate_freckle_bitches_1"
$Type: "ground"
$Pos: <4.635 0.176 3.249>
$Orient: [1.5708]
+Slate_Name: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_player_1"
$Type: "ground"
$Pos: <2.076 0.0 -1.862>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_johnny_1"
$Type: "ground"
$Pos: <-0.485 0.0 -0.879>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_burger01_1"
$Type: "ground"
$Pos: <-0.494 0.0 -0.551>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_fries01_1"
$Type: "ground"
$Pos: <-0.462 0.0 0.918>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_Aisha01_1"
$Type: "ground"
$Pos: <-0.445 0.0 1.419>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_FoodTable01_1"
$Type: "ground"
$Pos: <-1.395 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_Table101_1"
$Type: "ground"
$Pos: <2.492 0.0 -8.338>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_$root_controller_Table201_1"
$Type: "ground"
$Pos: <-3.291 0.0 -5.589>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

$Navpoint: "CS_area_vk03a_scene01_1"
$Type: "ground"
$Pos: <17.823 0.0 -38.01>
$Orient: [I]
+Uses_Slate: "slate_freckle_bitches"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk03a_scene01"
$Start nav: "CS_area_vk03a_scene01_1"
$Box size: -159.595 -37.1874 -159.595 159.595 37.1874 159.595

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_johnny"
$Char type: "TS_A_M_JohnnyGat"
$Start nav: "CS_$root_controller_johnny_1"

$Human: "CS_burger"
$Char type: "cs_hirezburger"
$Start nav: "CS_$root_controller_burger01_1"

$Human: "CS_fries"
$Char type: "cs_hirezfries"
$Start nav: "CS_$root_controller_fries01_1"

$Human: "CS_aisha"
$Char type: "vk_b_f_aisha-disguise"
$Start nav: "CS_$root_controller_Aisha01_1"

$Human: "CS_foodtable"
$Char type: "cs_foodtable"
$Start nav: "CS_$root_controller_FoodTable01_1"

$Human: "CS_table1"
$Char type: "cs_fbitchestable"
$Start nav: "CS_$root_controller_Table101_1"

$Human: "CS_table2"
$Char type: "cs_fbitchestable"
$Start nav: "CS_$root_controller_Table201_1"

#End
