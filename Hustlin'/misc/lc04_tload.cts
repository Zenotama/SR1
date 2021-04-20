// -------
#Navpoints
// -------


// Slate: slate_samsons_garage

$Navpoint: "CS_slate_samsons_garage_1"
$Type: "ground"
$Pos: <13.986 0.028 28.829>
$Orient: [3.26377]
+Slate_Name: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_Runner_1"
$Type: "ground"
$Pos: <0.998 0.0 -15.447>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_HelperThug_1"
$Type: "ground"
$Pos: <0.721 0.0 -9.372>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_WBThug_1"
$Type: "ground"
$Pos: <1.419 0.0 -7.143>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_AHThug01_1"
$Type: "ground"
$Pos: <0.453 0.0 -7.204>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_FatThug01_1"
$Type: "ground"
$Pos: <1.906 0.0 -9.163>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_FatThug02_1"
$Type: "ground"
$Pos: <0.242 0.0 -8.169>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_Truck01_1"
$Type: "ground"
$Pos: <0.949 0.0 -4.533>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_$root_controller_WBThugFem01_1"
$Type: "ground"
$Pos: <0.196 0.0 -9.266>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

$Navpoint: "CS_area_lc04_tload_1"
$Type: "ground"
$Pos: <-0.234 3.897 -8.581>
$Orient: [I]
+Uses_Slate: "slate_samsons_garage"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc04_tload"
$Start nav: "CS_area_lc04_tload_1"
$Box size: -68.5893 -9.14973 -68.5893 68.5893 9.14973 68.5893

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_Runner"
$Char type: "ts_x_m_thug2-01"
$Start nav: "CS_$root_controller_Runner_1"
+Variant: "Black"

$Human: "CS_HelperThug"
$Char type: "ts_x_m_thug2-01"
$Start nav: "CS_$root_controller_HelperThug_1"
+Variant: "White"

$Human: "CS_WBThug"
$Char type: "ts_x_m_thug1-01"
$Start nav: "CS_$root_controller_WBThug_1"
+Variant: "white"

$Human: "CS_AHThug"
$Char type: "ts_x_m_thug1-01"
$Start nav: "CS_$root_controller_AHThug01_1"
+Variant: "black"

$Human: "CS_FatThug01"
$Char type: "ts_x_m_thug1-01b"
$Start nav: "CS_$root_controller_FatThug01_1"
+Variant: "lc_truck"

$Human: "CS_FatThug02"
$Char type: "ts_x_m_thug2-01b"
$Start nav: "CS_$root_controller_FatThug02_1"
+Variant: "Asian"

$Human: "CS_truck"
$Char type: "cs_truck_mover"
$Start nav: "CS_$root_controller_Truck01_1"

$Human: "CS_WBThugFem"
$Char type: "ts_x_f_thug-01"
$Start nav: "CS_$root_controller_WBThugFem01_1"
+Variant: "white"

#End
