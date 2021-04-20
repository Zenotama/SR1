// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-736.321 -3.8436 102.398>
$Orient: [I]


// Slate: slate_chruch_yard

$Navpoint: "CS_slate_chruch_yard_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander02_1"
$Type: "ground"
$Pos: <5.781 0.118 5.255>
$Orient: [5.97184]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander03_1"
$Type: "ground"
$Pos: <6.343 0.0 7.237>
$Orient: [5.85544]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander04_1"
$Type: "ground"
$Pos: <3.988 0.0 5.441>
$Orient: [0.840569]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_julius01_1"
$Type: "ground"
$Pos: <6.279 0.0 10.576>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_player01_1"
$Type: "ground"
$Pos: <7.96 0.0 8.426>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_troy01_1"
$Type: "ground"
$Pos: <5.136 0.0 7.033>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"


// Slate: slate_smansion_enter

$Navpoint: "CS_slate_smansion_enter_3"
$Type: "ground"
$Pos: <78.506 0.0 -0.483>
$Orient: [I]
+Slate_Name: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_price01_3"
$Type: "ground"
$Pos: <85.998 0.0 2.756>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_rolc01_3"
$Type: "ground"
$Pos: <87.297 0.0 6.823>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_pricecar01_3"
$Type: "ground"
$Pos: <85.215 0.043 0.045>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_rolacar01_3"
$Type: "ground"
$Pos: <83.367 0.027 7.355>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_rolccar01_3"
$Type: "ground"
$Pos: <89.593 0.033 9.271>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_rolbcar01_3"
$Type: "ground"
$Pos: <81.376 0.006 3.421>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_rolb01_3"
$Type: "ground"
$Pos: <85.283 0.0 4.423>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"

$Navpoint: "CS_$root_controller_rola01_3"
$Type: "ground"
$Pos: <86.362 0.0 5.892>
$Orient: [I]
+Uses_Slate: "slate_smansion_enter"


// Slate: slate_chruch_yard01

$Navpoint: "CS_slate_chruch_yard01_14"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_julius01_14"
$Type: "ground"
$Pos: <6.281 0.0 10.578>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_player01_14"
$Type: "ground"
$Pos: <6.576 0.0 9.98>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_troy01_14"
$Type: "ground"
$Pos: <5.136 0.0 7.033>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

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

$Human: "CS_stander02"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_CSCharnav-stander02_1"

$Human: "CS_stander03"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_CSCharnav-stander03_1"

$Human: "CS_stander04"
$Char type: "TS_X_M_Thug2-01b"
$Start nav: "CS_CSCharnav-stander04_1"

$Human: "CS_julius"
$Char type: "TS_B_M_Julius"
$Start nav: "CS_$root_controller_julius01_1"

$Human: "CS_troy"
$Char type: "TS_W_M_Troy-01"
$Start nav: "CS_$root_controller_troy01_1"

$Human: "CS_price"
$Char type: "WR_W_M_JosephPrice"
$Start nav: "CS_$root_controller_price01_3"

$Human: "CS_rolc"
$Char type: "WR_X_M_Killa2-02"
$Start nav: "CS_$root_controller_rolc01_3"

$Human: "CS_pricecar"
$Char type: "CS_Car_JPrice"
$Start nav: "CS_$root_controller_pricecar01_3"

$Human: "CS_rolacar"
$Char type: "cs_WR_4dr_sports"
$Start nav: "CS_$root_controller_rolacar01_3"

$Human: "CS_rolccar"
$Char type: "cs_WR_4dr_standard"
$Start nav: "CS_$root_controller_rolccar01_3"

$Human: "CS_rolbcar"
$Char type: "cs_WR_4dr_luxury"
$Start nav: "CS_$root_controller_rolbcar01_3"

$Human: "CS_rolb"
$Char type: "wr_x_m_thug1-02"
$Start nav: "CS_$root_controller_rolb01_3"

$Human: "CS_rola"
$Char type: "wr_x_m_thug1-01"
$Start nav: "CS_$root_controller_rola01_3"

#End
