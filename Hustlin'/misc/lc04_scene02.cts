// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <494.312 1.8218 957.505>
$Orient: [I]


// Slate: slate_hmansion_byard

$Navpoint: "CS_slate_hmansion_byard_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_hector01_1"
$Type: "ground"
$Pos: <2.941 0.0 -0.579>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_manuel01_1"
$Type: "ground"
$Pos: <4.014 0.0 -2.03>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_luz01_1"
$Type: "ground"
$Pos: <-10.747 0.737 -3.753>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_angelo01_1"
$Type: "ground"
$Pos: <-13.433 0.736 -4.83>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairA01_1"
$Type: "ground"
$Pos: <2.807 0.0 -0.538>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairB01_1"
$Type: "ground"
$Pos: <3.975 0.0 -1.974>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_Table01_1"
$Type: "ground"
$Pos: <3.946 0.0 -0.806>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairC01_1"
$Type: "ground"
$Pos: <4.453 0.0 0.088>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairD01_1"
$Type: "ground"
$Pos: <4.995 0.0 -0.814>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

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

$Human: "CS_hec"
$Char type: "LC_L_M_HectorLopez"
$Start nav: "CS_$root_controller_hector01_1"

$Human: "CS_man"
$Char type: "LC_L_M_ManuelOrejuela"
$Start nav: "CS_$root_controller_manuel01_1"

$Human: "CS_luz"
$Char type: "lc_l_f_luz"
$Start nav: "CS_$root_controller_luz01_1"

$Human: "CS_ang"
$Char type: "lc_l_m_angelolopez-01"
$Start nav: "CS_$root_controller_angelo01_1"

$Human: "CS_chaira"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairA01_1"

$Human: "CS_chairb"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairB01_1"

$Human: "CS_table"
$Char type: "cs_umbtable"
$Start nav: "CS_$root_controller_Table01_1"

$Human: "CS_chairc"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairC01_1"

$Human: "CS_chaird"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairD01_1"

#End
