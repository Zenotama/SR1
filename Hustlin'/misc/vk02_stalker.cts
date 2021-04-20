// -------
#Navpoints
// -------


// Slate: slate_samsons_street

$Navpoint: "CS_slate_samsons_street_1"
$Type: "ground"
$Pos: <0.0 -0.235 0.0>
$Orient: [I]
+Slate_Name: "slate_samsons_street"

$Navpoint: "CS_CharNav-walker01_1"
$Type: "ground"
$Pos: <-5.829 -0.088 1.908>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_CharNav-walker02_1"
$Type: "ground"
$Pos: <4.29 -0.103 57.583>
$Orient: [3.54302]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_CharNav-walker03_1"
$Type: "ground"
$Pos: <-2.048 -0.103 28.716>
$Orient: [0.296706]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_PathNav-walker01-01_1"
$Type: "ground"
$Pos: <-5.267 -0.127 15.005>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_PathNav-walker02-01_1"
$Type: "ground"
$Pos: <-4.024 -0.144 25.952>
$Orient: [3.19395]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_PathNav-walker03-01_1"
$Type: "ground"
$Pos: <4.128 -0.144 53.533>
$Orient: [0.0174532]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_$root_controller_PC_1"
$Type: "ground"
$Pos: <-10.293 0.0 -7.302>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_$root_controller_aish_1"
$Type: "ground"
$Pos: <-10.218 0.0 -6.491>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_$root_controller_stlk_1"
$Type: "ground"
$Pos: <-0.225 0.0 13.135>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_$root_controller_caraisha01_1"
$Type: "ground"
$Pos: <-10.143 -0.32 -6.895>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_$root_controller_stalkervan01_1"
$Type: "ground"
$Pos: <-0.765 -0.266 13.705>
$Orient: [I]
+Uses_Slate: "slate_samsons_street"

$Navpoint: "CS_area_vk02_stalker_1"
$Type: "ground"
$Pos: <2.95 0.0 5.325>
$Orient: [0.0872664]
+Uses_Slate: "slate_samsons_street"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk02_stalker"
$Start nav: "CS_area_vk02_stalker_1"
$Box size: -82.625 -10.6953 -79.9746 82.625 10.6953 79.9746

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_walker01"
$Char type: "pd_x_f_middleage-02"
$Start nav: "CS_CharNav-walker01_1"

$Human: "CS_walker02"
$Char type: "pd_x_m_mailman-01"
$Start nav: "CS_CharNav-walker02_1"

$Human: "CS_walker03"
$Char type: "pd_x_m_poorheavy-01"
$Start nav: "CS_CharNav-walker03_1"

$Human: "CS_aish"
$Char type: "vk_b_f_aisha"
$Start nav: "CS_$root_controller_aish_1"

$Human: "CS_stlk"
$Char type: "ac_w_m_paparrazi"
$Start nav: "CS_$root_controller_stlk_1"
+Variant: "Stalker"

$Human: "CS_caraish"
$Char type: "cs_car_aisha"
$Start nav: "CS_$root_controller_caraisha01_1"

$Human: "CS_van"
$Char type: "cs_van_news"
$Start nav: "CS_$root_controller_stalkervan01_1"

#End
