// -------
#Navpoints
// -------


// Slate: slate_angelo_livingroom

$Navpoint: "CS_slate_angelo_livingroom_1"
$Type: "ground"
$Pos: <0.0 0.0 -0.001>
$Orient: [I]
+Slate_Name: "slate_angelo_livingroom"

$Navpoint: "CS_$root_controller_PC01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <-0.317 0.003 -0.033>
$Orient: [I]
+Uses_Slate: "slate_angelo_livingroom"

$Navpoint: "CS_Dex01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-0.37 0.001 0.032>
$Orient: [I]
+Uses_Slate: "slate_angelo_livingroom"

$Navpoint: "CS_$root_controller_Angelo01_1"
$Type: "ground"
$Pos: <-0.669 0.006 -2.144>
$Orient: [I]
+Uses_Slate: "slate_angelo_livingroom"

$Navpoint: "CS_$root_controller_A_Car01_1"
$Type: "ground"
$Pos: <34.036 -7.959 -0.86>
$Orient: [I]
+Uses_Slate: "slate_angelo_livingroom"

$Navpoint: "CS_$root_controller_D_01_1"
$Type: "ground"
$Pos: <-0.001 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_angelo_livingroom"

$Navpoint: "CS_$root_controller_Dcar_01_1"
$Type: "ground"
$Pos: <14.156 -0.102 30.982>
$Orient: [I]
+Uses_Slate: "slate_angelo_livingroom"

$Navpoint: "CS_area_lc09_scene02_01_1"
$Type: "ground"
$Pos: <9.89 0.006 4.107>
$Orient: [5.44799]
+Uses_Slate: "slate_angelo_livingroom"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc09_scene02_01"
$Start nav: "CS_area_lc09_scene02_01_1"
$Box size: -26.9855 -7.89189 -28.406 26.9855 7.89189 28.406

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_Dex01_$root_controller_MAL2_1"

$Human: "CS_angelo"
$Char type: "LC_L_M_AngeloLopez-01"
$Start nav: "CS_$root_controller_Angelo01_1"

$Human: "CS_a_car"
$Char type: "cs_Car_Angelo"
$Start nav: "CS_$root_controller_A_Car01_1"

$Human: "CS_pistal"
$Char type: "CS_CS_Pistol"
$Start nav: "CS_$root_controller_D_01_1"

$Human: "CS_d_car"
$Char type: "cs_lc_4dr_std06"
$Start nav: "CS_$root_controller_Dcar_01_1"

#End
