// -------
#Navpoints
// -------


// Slate: slate_record_outside01

$Navpoint: "CS_slate_record_outside01_1"
$Type: "ground"
$Pos: <25.284 -0.719 -15.719>
$Orient: [I]
+Slate_Name: "slate_vk05_scene02"

$Navpoint: "CS_$root_controller_tanya01_1"
$Type: "ground"
$Pos: <27.594 -0.755 -18.545>
$Orient: [I]
+Uses_Slate: "slate_vk05_scene02"

$Navpoint: "CS_$root_controller_worker01_1"
$Type: "ground"
$Pos: <21.977 -0.873 -14.533>
$Orient: [I]
+Uses_Slate: "slate_vk05_scene02"

$Navpoint: "CS_$root_controller_driver01_1"
$Type: "ground"
$Pos: <31.188 -0.977 -20.136>
$Orient: [I]
+Uses_Slate: "slate_vk05_scene02"

$Navpoint: "CS_$root_controller_limo01_1"
$Type: "ground"
$Pos: <30.087 -0.991 -11.564>
$Orient: [I]
+Uses_Slate: "slate_vk05_scene02"

$Navpoint: "CS_area_vk05_scene02_1"
$Type: "ground"
$Pos: <24.688 3.422 -16.85>
$Orient: [I]
+Uses_Slate: "slate_vk05_scene02"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk05_scene02"
$Start nav: "CS_area_vk05_scene02_1"
$Box size: -63.6725 -8.03767 -63.6725 63.6725 8.03767 63.6725

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_tanya"
$Char type: "AC_A_F_TanyaWinters"
$Start nav: "CS_$root_controller_tanya01_1"

$Human: "CS_worker"
$Char type: "PD_X_M_Construction-01"
$Start nav: "CS_$root_controller_worker01_1"
+Variant: "white"

$Human: "CS_driver"
$Char type: "PD_X_M_Chauffeur-01"
$Start nav: "CS_$root_controller_driver01_1"
+Variant: "VK05var"

$Human: "CS_limo"
$Char type: "CS_VK_Tanya_Limo"
$Start nav: "CS_$root_controller_limo01_1"

#End
