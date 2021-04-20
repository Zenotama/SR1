// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <330.531 34.188 -2094.4>
$Orient: [I]


// Slate: slate_smansion_living

$Navpoint: "CS_slate_smansion_living_1"
$Type: "ground"
$Pos: <0.0 0.0 -0.001>
$Orient: [I]
+Slate_Name: "slate_smansion_living"

$Navpoint: "CS_$root_controller_prce01_1"
$Type: "ground"
$Pos: <4.058 0.0 0.631>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_lin01_1"
$Type: "ground"
$Pos: <13.341 0.0 6.332>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_donn01_1"
$Type: "ground"
$Pos: <8.957 0.0 5.376>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_shrp01_1"
$Type: "ground"
$Pos: <0.327 0.0 -1.712>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_Couch01_1"
$Type: "ground"
$Pos: <3.501 0.0 -0.192>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_Chair01_1"
$Type: "ground"
$Pos: <4.615 0.0 2.501>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_ChairB01_1"
$Type: "ground"
$Pos: <0.324 0.0 -1.727>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_AutoMag01_1"
$Type: "ground"
$Pos: <4.102 0.0 1.137>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 -0.001>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

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

$Human: "CS_priceh"
$Char type: "WR_W_M_JosephPrice"
$Start nav: "CS_$root_controller_prce01_1"

$Human: "CS_lin"
$Char type: "TS_A_F_Lin"
$Start nav: "CS_$root_controller_lin01_1"

$Human: "CS_donnie"
$Char type: "WR_A_M_Donnie-01"
$Start nav: "CS_$root_controller_donn01_1"

$Human: "CS_sharp"
$Char type: "WR_W_M_Sharp"
$Start nav: "CS_$root_controller_shrp01_1"

$Human: "CS_Couch"
$Char type: "cs_pricecouch"
$Start nav: "CS_$root_controller_Couch01_1"

$Human: "CS_Chair"
$Char type: "cs_pricechair"
$Start nav: "CS_$root_controller_Chair01_1"

$Human: "CS_ChairB"
$Char type: "cs_pricechair"
$Start nav: "CS_$root_controller_ChairB01_1"

$Human: "CS_AutoMag"
$Char type: "cs_cs_automag"
$Start nav: "CS_$root_controller_AutoMag01_1"

#End
