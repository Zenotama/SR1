// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-752.355 -1.6848 79.8737>
$Orient: [I]


// Slate: slate_church_main

$Navpoint: "CS_slate_church_main_1"
$Type: "ground"
$Pos: <-0.001 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_church_main"

$Navpoint: "CS_Julius01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-14.169 0.526 -0.221>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_Dex01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-4.268 -0.414 0.784>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_Player01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <-2.893 -0.413 -0.176>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_TSSThug101_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-10.121 -0.478 -1.585>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_TSSThug201_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-6.952 -0.369 2.356>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_Johnny01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-2.935 -0.412 -1.552>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_TSSFatThug101_$root_controller_HVY2_1"
$Type: "ground"
$Pos: <-6.183 -0.447 -3.054>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_TSSFatThug201_$root_controller_HVY2_1"
$Type: "ground"
$Pos: <-9.449 -0.46 0.747>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_TSSThug301_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-4.599 -0.434 -2.036>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_Troy01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-3.57 -0.41 1.333>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$root_controller_Lin01_1"
$Type: "ground"
$Pos: <-4.961 -2.999 -3.859>
$Orient: [I]
+Uses_Slate: "slate_church_main"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-0.001 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_main"

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

$Human: "CS_julius"
$Char type: "TS_B_M_Julius"
$Start nav: "CS_Julius01_$root_controller_MAL2_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_Dex01_$root_controller_MAL2_1"

$Human: "CS_thug101"
$Char type: "TS_X_M_Thug1-01"
$Start nav: "CS_TSSThug101_$root_controller_MAL2_1"
+Persistent
+Variant: "whitecut"

$Human: "CS_thug201"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_TSSThug201_$root_controller_MAL2_1"
+Persistent
+Variant: "Black"

$Human: "CS_johnny"
$Char type: "TS_A_M_JohnnyGat"
$Start nav: "CS_Johnny01_$root_controller_MAL2_1"

$Human: "CS_fatthug101"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_TSSFatThug101_$root_controller_HVY2_1"

$Human: "CS_fatthug201"
$Char type: "TS_X_M_Thug2-01b"
$Start nav: "CS_TSSFatThug201_$root_controller_HVY2_1"
+Persistent

$Human: "CS_thug301"
$Char type: "TS_X_M_Thug1-01b"
$Start nav: "CS_TSSThug301_$root_controller_MAL2_1"
+Persistent

$Human: "CS_troy"
$Char type: "TS_W_M_Troy-01"
$Start nav: "CS_Troy01_$root_controller_MAL2_1"

$Human: "CS_lin"
$Char type: "TS_A_F_Lin"
$Start nav: "CS_$root_controller_Lin01_1"

#End
