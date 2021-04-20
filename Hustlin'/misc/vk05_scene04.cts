// -------
#Navpoints
// -------


// Slate: slate_anthony_condo

$Navpoint: "CS_slate_anthony_condo_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_anthony_condo"

$Navpoint: "CS_$root_controller_player01_1"
$Type: "ground"
$Pos: <1.259 -0.032 -5.549>
$Orient: [I]
+Uses_Slate: "slate_anthony_condo"

$Navpoint: "CS_$root_controller_tanya_1"
$Type: "ground"
$Pos: <-1.016 -0.023 -2.098>
$Orient: [I]
+Uses_Slate: "slate_anthony_condo"

$Navpoint: "CS_area_vk05_scene04_1"
$Type: "ground"
$Pos: <0.764 6.018 4.101>
$Orient: [I]
+Uses_Slate: "slate_anthony_condo"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk05_scene04"
$Start nav: "CS_area_vk05_scene04_1"
$Box size: -9.35895 -6.70109 -18.9436 9.35895 6.70109 18.9436

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_tanya"
$Char type: "AC_A_F_TanyaWinters"
$Start nav: "CS_$root_controller_tanya_1"

#End
