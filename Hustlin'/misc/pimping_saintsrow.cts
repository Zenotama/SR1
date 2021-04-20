// -------
#Navpoints
// -------


// Slate: slate_pimping_saintsrow

$Navpoint: "CS_slate_pimping_saintsrow_1"
$Type: "ground"
$Pos: <0.0 0.0 -0.354>
$Orient: [I]
+Slate_Name: "slate_pimping_saintsrow"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <1.279 0.019 1.168>
$Orient: [I]
+Uses_Slate: "slate_pimping_saintsrow"

$Navpoint: "CS_$root_controller_Fat Girl01_1"
$Type: "ground"
$Pos: <1.246 0.049 -1.445>
$Orient: [I]
+Uses_Slate: "slate_pimping_saintsrow"

$Navpoint: "CS_$root_controller_Will01_1"
$Type: "ground"
$Pos: <-1.057 0.017 -2.166>
$Orient: [I]
+Uses_Slate: "slate_pimping_saintsrow"

$Navpoint: "CS_$root_controller_joint01_1"
$Type: "ground"
$Pos: <-1.057 0.017 -2.166>
$Orient: [I]
+Uses_Slate: "slate_pimping_saintsrow"

$Navpoint: "CS_area_pimping_saintsrow_1"
$Type: "ground"
$Pos: <2.374 10.375 -0.3>
$Orient: [I]
+Uses_Slate: "slate_pimping_saintsrow"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_pimping_saintsrow"
$Start nav: "CS_area_pimping_saintsrow_1"
$Box size: -12.9666 -12.9666 -12.9666 12.9666 12.9666 12.9666

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_fugly"
$Char type: "pd_x_f_bigho-01"
$Start nav: "CS_$root_controller_Fat Girl01_1"
+Variant: "shortsOn"

$Human: "CS_will"
$Char type: "AC_B_M_Pimping-Will"
$Start nav: "CS_$root_controller_Will01_1"
+Item: "pimpcup"
+Rank: 0

$Human: "CS_joint"
$Char type: "CS_joint"
$Start nav: "CS_$root_controller_joint01_1"

#End
