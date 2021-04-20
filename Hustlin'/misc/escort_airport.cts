// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <409.935 -3.4309 1298.54>
$Orient: [I]


// Slate: slate_airport_stripclub

$Navpoint: "CS_slate_airport_stripclub_1"
$Type: "ground"
$Pos: <1.08 0.455 2.517>
$Orient: [1.33918]
+Slate_Name: "slate_airport_stripclub"

$Navpoint: "CS_CSCharnav-stander03_1"
$Type: "ground"
$Pos: <4.043 0.0 -4.572>
$Orient: [1.65343]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CSCharnav-sitter01_1"
$Type: "ground"
$Pos: <2.941 0.469 -6.893>
$Orient: [1.72097]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CSCharnav-dancer01_1"
$Type: "ground"
$Pos: <-0.463 1.057 -7.854>
$Orient: [0.398268]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CSCharnav-stander01_1"
$Type: "ground"
$Pos: <-0.381 0.0 -6.132>
$Orient: [3.02256]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <0.792 0.0 -2.127>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_Stripper01_1"
$Type: "ground"
$Pos: <6.477 0.701 -4.919>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_JACK01_1"
$Type: "ground"
$Pos: <-0.035 0.0 2.101>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_100A01_1"
$Type: "ground"
$Pos: <0.0 0.022 1.36>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_100B01_1"
$Type: "ground"
$Pos: <0.0 0.022 1.36>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_100C01_1"
$Type: "ground"
$Pos: <0.0 0.022 1.36>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_100D01_1"
$Type: "ground"
$Pos: <0.0 0.022 1.36>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_TableChair01_1"
$Type: "ground"
$Pos: <0.25 0.0 1.612>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_Stack10001_1"
$Type: "ground"
$Pos: <0.238 0.0 1.103>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_StackB01_1"
$Type: "ground"
$Pos: <0.238 0.0 1.103>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_StackC01_1"
$Type: "ground"
$Pos: <0.238 0.0 1.103>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <1.08 0.455 2.517>
$Orient: [1.33918]
+Uses_Slate: "slate_airport_stripclub"

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

$Human: "CS_stander03"
$Char type: "pd_w_m_cowboy-01"
$Start nav: "CS_CSCharnav-stander03_1"

$Human: "CS_sitter01"
$Char type: "pd_x_m_genericyoung-02"
$Start nav: "CS_CSCharnav-sitter01_1"

$Human: "CS_dancer01"
$Char type: "stripper-white"
$Start nav: "CS_CSCharnav-dancer01_1"

$Human: "CS_stander01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CSCharnav-stander01_1"

$Human: "CS_stripper"
$Char type: "Stripper-White"
$Start nav: "CS_$root_controller_Stripper01_1"

$Human: "CS_jack"
$Char type: "AC_W_M_Escort-Jack"
$Start nav: "CS_$root_controller_JACK01_1"

$Human: "CS_100a"
$Char type: "cs_100bill"
$Start nav: "CS_$root_controller_100A01_1"

$Human: "CS_100b"
$Char type: "cs_100bill"
$Start nav: "CS_$root_controller_100B01_1"

$Human: "CS_100c"
$Char type: "cs_100bill"
$Start nav: "CS_$root_controller_100C01_1"

$Human: "CS_100d"
$Char type: "cs_100bill"
$Start nav: "CS_$root_controller_100D01_1"

$Human: "CS_TableChair"
$Char type: "cs_escorttablechair"
$Start nav: "CS_$root_controller_TableChair01_1"

$Human: "CS_Stack1"
$Char type: "cs_stack100"
$Start nav: "CS_$root_controller_Stack10001_1"

$Human: "CS_Stack2"
$Char type: "cs_stack100"
$Start nav: "CS_$root_controller_StackB01_1"

$Human: "CS_Stack3"
$Char type: "cs_stack100"
$Start nav: "CS_$root_controller_StackC01_1"

#End
