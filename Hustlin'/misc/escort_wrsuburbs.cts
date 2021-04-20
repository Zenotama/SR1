// -------
#Navpoints
// -------


// Slate: slate_escort_sub

$Navpoint: "CS_slate_escort_sub_1"
$Type: "ground"
$Pos: <-0.034 0.0 -0.682>
$Orient: [I]
+Slate_Name: "slate_escort_sub"

$Navpoint: "CS_charnav-sitter01_1"
$Type: "ground"
$Pos: <10.681 0.339 1.884>
$Orient: [2.26117]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_charnav-dancer01_1"
$Type: "ground"
$Pos: <11.415 1.2 -0.208>
$Orient: [4.62825]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_charnav-dancer03_1"
$Type: "ground"
$Pos: <-8.241 1.105 5.895>
$Orient: [3.00946]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_charnav-sitter02_1"
$Type: "ground"
$Pos: <-6.853 0.508 2.227>
$Orient: [5.427]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$root_controller_Player_1"
$Type: "ground"
$Pos: <-1.886 0.0 -0.487>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$root_controller_Jenna_1"
$Type: "ground"
$Pos: <0.564 0.0 -0.59>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$root_controller_JennasCig01_1"
$Type: "ground"
$Pos: <0.564 0.0 -0.59>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$root_controller_Ashtray01_1"
$Type: "ground"
$Pos: <0.333 0.0 -0.01>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$root_controller_BlackBook01_1"
$Type: "ground"
$Pos: <0.218 0.0 -0.113>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$root_controller_PCChair01_1"
$Type: "ground"
$Pos: <-0.281 0.0 -0.302>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-0.034 0.0 -0.682>
$Orient: [I]
+Uses_Slate: "slate_escort_sub"

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

$Human: "CS_sitter01"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_charnav-sitter01_1"
+Variant: "Black"

$Human: "CS_dancer01"
$Char type: "stripper-white"
$Start nav: "CS_charnav-dancer01_1"
+Variant: "Cutscene"

$Human: "CS_dancer03"
$Char type: "stripper-latina"
$Start nav: "CS_charnav-dancer03_1"
+Variant: "Cutscene"

$Human: "CS_sitter02"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_charnav-sitter02_1"
+Variant: "Latino"

$Human: "CS_jen"
$Char type: "AC_W_F_escort-Jenna"
$Start nav: "CS_$root_controller_Jenna_1"

$Human: "CS_ciga"
$Char type: "CS_cigarette01"
$Start nav: "CS_$root_controller_JennasCig01_1"

$Human: "CS_tray"
$Char type: "CS_ashtray"
$Start nav: "CS_$root_controller_Ashtray01_1"

$Human: "CS_book"
$Char type: "CS_blackbook"
$Start nav: "CS_$root_controller_BlackBook01_1"

$Human: "CS_chair"
$Char type: "cs_escortbarchair"
$Start nav: "CS_$root_controller_PCChair01_1"

#End
