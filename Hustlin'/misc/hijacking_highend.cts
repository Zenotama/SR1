// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]


// Slate: slate_hijacking_highend

$Navpoint: "CS_slate_hijacking_highend_1"
$Type: "ground"
$Pos: <-8.304 -0.225 -3.211>
$Orient: [I]
+Slate_Name: "slate_hijacking"

$Navpoint: "CS_$root_controller_Sam01_1"
$Type: "ground"
$Pos: <-0.835 0.0 -1.039>
$Orient: [I]
+Uses_Slate: "slate_hijacking"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <2.238 0.0 0.757>
$Orient: [I]
+Uses_Slate: "slate_hijacking"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-8.304 -0.225 -3.211>
$Orient: [I]
+Uses_Slate: "slate_hijacking"

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

$Human: "CS_sam"
$Char type: "AC_B_M_Hijacking-Sam"
$Start nav: "CS_$root_controller_Sam01_1"

#End
