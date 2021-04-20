// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-735.11 -4.0 -204.24>
$Orient: [I]


// Slate: slate_johnny_apartment

$Navpoint: "CS_slate_johnny_apartment_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_johnny_apartment"

$Navpoint: "CS_johnny01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-0.104 0.0 -0.932>
$Orient: [I]
+Uses_Slate: "slate_johnny_apartment"

$Navpoint: "CS_dex01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-0.23 0.0 2.952>
$Orient: [I]
+Uses_Slate: "slate_johnny_apartment"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <0.541 0.0 3.555>
$Orient: [I]
+Uses_Slate: "slate_johnny_apartment"

$Navpoint: "CS_$root_controller_JohnnysCar01_1"
$Type: "ground"
$Pos: <1.183 -0.048 0.758>
$Orient: [I]
+Uses_Slate: "slate_johnny_apartment"

$Navpoint: "CS_$root_controller_RocketBox01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_johnny_apartment"

$Navpoint: "CS_area_vk06b_scene01_1"
$Type: "ground"
$Pos: <0.471 5.148 0.192>
$Orient: [I]
+Uses_Slate: "slate_johnny_apartment"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk06b_scene01"
$Start nav: "CS_area_vk06b_scene01_1"
$Box size: -11.7324 -6.80098 -11.7324 11.7324 6.80098 11.7324

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_johnny"
$Char type: "ts_a_m_johnnygatmecha"
$Start nav: "CS_johnny01_$root_controller_MAL2_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_dex01_$root_controller_MAL2_1"

$Human: "CS_johncar"
$Char type: "cs_4dr_std06"
$Start nav: "CS_$root_controller_JohnnysCar01_1"

$Human: "CS_rocketbox"
$Char type: "cs_rocketbox"
$Start nav: "CS_$root_controller_RocketBox01_1"

#End
