// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]


// Slate: slate_church_main

$Navpoint: "CS_slate_church_main_1"
$Type: "ground"
$Pos: <-0.001 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_church_main"

$Navpoint: "CS_$root_controller_dex01_1"
$Type: "ground"
$Pos: <0.42 -0.322 -2.233>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_dedvic01_1"
$Type: "ground"
$Pos: <1.201 -0.323 -3.474>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_troy01_1"
$Type: "ground"
$Pos: <-0.644 -0.352 -2.932>
$Orient: [I]
+Uses_Slate: "slate_church_main"


// Slate: slate_angelo_bedroom

$Navpoint: "CS_slate_angelo_bedroom_2"
$Type: "ground"
$Pos: <-55.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_PIST01_2"
$Type: "ground"
$Pos: <-54.243 0.0 -0.575>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_luz01_2"
$Type: "ground"
$Pos: <-52.919 0.0 -0.409>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_angelo01_2"
$Type: "ground"
$Pos: <-54.252 0.0 -0.263>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_area_lc07_scene02_church_1"
$Type: "ground"
$Pos: <0.827 1.327 -1.605>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_area_lc07_scene02_angelo_1"
$Type: "ground"
$Pos: <-54.273 1.27 -0.272>
$Orient: [I]
+Uses_Slate: "slate_church_main"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc07_scene02_church"
$Start nav: "CS_area_lc07_scene02_church_1"
$Box size: -4.17333 -2.41083 -4.17333 4.17333 2.41083 4.17333

$Cutscene: "CS_area_lc07_scene02_angelo"
$Start nav: "CS_area_lc07_scene02_angelo_1"
$Box size: -4.17333 -2.5754 -3.68447 4.17333 2.5754 3.68447

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_dex01_1"

$Human: "CS_dedvic"
$Char type: "lc_l_m_victorrodriguez"
$Start nav: "CS_$root_controller_dedvic01_1"

$Human: "CS_troy"
$Char type: "ts_w_m_troy-01"
$Start nav: "CS_$root_controller_troy01_1"

$Human: "CS_pistol"
$Char type: "CS_CS_Pistol"
$Start nav: "CS_$root_controller_PIST01_2"

$Human: "CS_luz"
$Char type: "lc_l_f_luz"
$Start nav: "CS_$root_controller_luz01_2"

$Human: "CS_angelo"
$Char type: "lc_l_m_angelolopez-01"
$Start nav: "CS_$root_controller_angelo01_2"

#End
