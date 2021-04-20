// -------
#Navpoints
// -------


// Slate: slate_pimping_redlight

$Navpoint: "CS_slate_pimping_redlight_1"
$Type: "ground"
$Pos: <0.0 -0.107 0.0>
$Orient: [I]
+Slate_Name: "slate_pimping_redlight"

$Navpoint: "CS_$root_controller_John01_1"
$Type: "ground"
$Pos: <-2.387 -0.04 -4.661>
$Orient: [I]
+Uses_Slate: "slate_pimping_redlight"

$Navpoint: "CS_$root_controller_Vikki01_1"
$Type: "ground"
$Pos: <-2.054 0.0 -5.059>
$Orient: [I]
+Uses_Slate: "slate_pimping_redlight"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <1.25 -0.039 3.426>
$Orient: [I]
+Uses_Slate: "slate_pimping_redlight"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 -0.107 0.0>
$Orient: [I]
+Uses_Slate: "slate_pimping_redlight"

// -------
#Cutscene
// -------

$Cutscene: "CS_$Auto_Generated_Area_Node"
$Start nav: "CS_$Auto_Generated_Area_Node_Nav"
$Box size: -30.0 -30.0 -30.0 30.0 30.0 30.0

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_john"
$Char type: "PD_X_M_HighIncome"
$Start nav: "CS_$root_controller_John01_1"
+Variant: "whiteGuy"

$Human: "CS_vikki"
$Char type: "AC_B_Madame"
$Start nav: "CS_$root_controller_Vikki01_1"

#End
