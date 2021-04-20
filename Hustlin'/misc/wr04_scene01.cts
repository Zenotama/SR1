// -------
#Navpoints
// -------


// Slate: slate_smansion_living

$Navpoint: "CS_slate_smansion_living_1"
$Type: "ground"
$Pos: <-0.988 -0.134 3.067>
$Orient: [0.750492]
+Slate_Name: "slate_smansion_living"

$Navpoint: "CS_$root_controller_don01_1"
$Type: "ground"
$Pos: <6.684 0.0 -1.908>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_lin01_1"
$Type: "ground"
$Pos: <7.306 0.0 -1.518>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_shrp01_1"
$Type: "ground"
$Pos: <-1.429 0.0 1.978>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_pc01_1"
$Type: "ground"
$Pos: <-6.41 0.0 6.762>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_couch01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_chair01_1"
$Type: "ground"
$Pos: <4.539 0.0 2.221>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_chair02_1"
$Type: "ground"
$Pos: <-1.842 0.0 1.95>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_$root_controller_prce01_1"
$Type: "ground"
$Pos: <2.141 0.0 0.757>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

$Navpoint: "CS_area_wr04_scene01_1"
$Type: "ground"
$Pos: <1.291 1.614 -1.624>
$Orient: [I]
+Uses_Slate: "slate_smansion_living"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_wr04_scene01"
$Start nav: "CS_area_wr04_scene01_1"
$Box size: -15.0109 -4.18937 -15.0109 15.0109 4.18937 15.0109

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_don"
$Char type: "WR_A_M_Donnie-01"
$Start nav: "CS_$root_controller_don01_1"

$Human: "CS_lin"
$Char type: "TS_A_F_Lin"
$Start nav: "CS_$root_controller_lin01_1"

$Human: "CS_shrp"
$Char type: "WR_W_M_Sharp"
$Start nav: "CS_$root_controller_shrp01_1"

$Human: "CS_couch"
$Char type: "CS_pricecouch"
$Start nav: "CS_$root_controller_couch01_1"

$Human: "CS_chaira"
$Char type: "CS_pricechair"
$Start nav: "CS_$root_controller_chair01_1"

$Human: "CS_chairb"
$Char type: "CS_pricechair"
$Start nav: "CS_$root_controller_chair02_1"

$Human: "CS_prce"
$Char type: "WR_W_M_JosephPrice"
$Start nav: "CS_$root_controller_prce01_1"

#End
