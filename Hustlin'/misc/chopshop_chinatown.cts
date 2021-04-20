// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <277.1562 -3.7239 324.6017>
$Orient: [I]


// Slate: slate_chopshop_chinatown

$Navpoint: "CS_slate_chopshop_chinatown_1"
$Type: "ground"
$Pos: <-0.047 0.0 -0.152>
$Orient: [I]
+Slate_Name: "slate_chpshp_ct_01"

$Navpoint: "CS_VehicleNav01_1"
$Type: "ground"
$Pos: <-4.616 -0.003 -6.525>
$Orient: [6.00952]
+Uses_Slate: "slate_chpshp_ct_01"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <0.342 -0.076 -5.589>
$Orient: [I]
+Uses_Slate: "slate_chpshp_ct_01"

$Navpoint: "CS_$root_controller_MAL2_Dennis_01_1"
$Type: "ground"
$Pos: <-3.553 -0.001 -3.357>
$Orient: [I]
+Uses_Slate: "slate_chpshp_ct_01"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-0.047 0.0 -0.152>
$Orient: [I]
+Uses_Slate: "slate_chpshp_ct_01"

// -------
#Cutscene
// -------

$Cutscene: "CS_$Auto_Generated_Area_Node"
$Start nav: "CS_$Auto_Generated_Area_Node_Nav"
$Box size: -30.0 -30.0 -30.0 30.0 30.0 30.0

// -------
#Vehicles
// -------

$Vehicle: "CS_VehicleNav01"
$Vehicle Type: "SP_derbycar02"
$Start nav: "CS_VehicleNav01_1"
$Stream Distance: 50.000
+Variant: "Dex"

// -------
#Humans
// -------

$Human: "CS_dennis"
$Char type: "AC_A_M_Chopshop-Dennis"
$Start nav: "CS_$root_controller_MAL2_Dennis_01_1"

#End
