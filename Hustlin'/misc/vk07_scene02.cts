// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-961.746 21.8715 -1238.51>
$Orient: [I]


// Slate: slate_vk07_scene02

$Navpoint: "CS_slate_vk07_scene02_1"
$Type: "ground"
$Pos: <0.0 -0.055 0.0>
$Orient: [I]
+Slate_Name: "slate_vk07_scene02"

$Navpoint: "CS_$root_controller_Warren01_1"
$Type: "ground"
$Pos: <3.296 0.0 -7.866>
$Orient: [I]
+Uses_Slate: "slate_vk07_scene02"

$Navpoint: "CS_$root_controller_FEM1_1"
$Type: "ground"
$Pos: <9.364 0.011 -6.682>
$Orient: [I]
+Uses_Slate: "slate_vk07_scene02"

$Navpoint: "CS_CutsceneArea01_1"
$Type: "ground"
$Pos: <4.695 2.127 -7.257>
$Orient: [I]
+Uses_Slate: "slate_vk07_scene02"

// -------
#Cutscene
// -------

$Cutscene: "CS_CutsceneArea01"
$Start nav: "CS_CutsceneArea01_1"
$Box size: -8.74385 -3.15575 -8.74385 8.74385 3.15575 8.74385

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_warren"
$Char type: "vk_b_m_wwilliams"
$Start nav: "CS_$root_controller_Warren01_1"

$Human: "CS_tanya"
$Char type: "ac_a_f_tanyawinters-cut"
$Start nav: "CS_$root_controller_FEM1_1"
+Item: "tanya_pistol"
+Rank: 0

#End
