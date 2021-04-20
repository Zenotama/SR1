// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-770.587 -2.0614 88.1786>
$Orient: [I]


// Slate: slate_church_juliusroom

$Navpoint: "CS_slate_church_juliusroom_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_johnny_1"
$Type: "ground"
$Pos: <1.655 0.0 1.384>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_PC01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <-0.601 0.0 2.698>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_king_1"
$Type: "ground"
$Pos: <-2.568 0.0 1.261>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_julius_1"
$Type: "ground"
$Pos: <-2.888 0.0 2.201>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_kchair_1"
$Type: "ground"
$Pos: <-2.495 0.0 1.265>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_pchair_1"
$Type: "ground"
$Pos: <0.144 0.0 2.507>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_juchair_1"
$Type: "ground"
$Pos: <-1.1 0.0 2.37>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$root_controller_jochair_1"
$Type: "ground"
$Pos: <1.711 0.0 1.324>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_juliusroom"

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

$Human: "CS_johnny"
$Char type: "ts_a_m_johnnygatmecha"
$Start nav: "CS_$root_controller_johnny_1"
+Item: "desert eagle"
+Rank: 0

$Human: "CS_king"
$Char type: "VK_B_M_benjaminKing"
$Start nav: "CS_$root_controller_king_1"

$Human: "CS_julius"
$Char type: "TS_B_M_Julius"
$Start nav: "CS_$root_controller_julius_1"

$Human: "CS_kchair"
$Char type: "cs_cs_churchchair"
$Start nav: "CS_$root_controller_kchair_1"

$Human: "CS_pchair"
$Char type: "cs_cs_churchchair"
$Start nav: "CS_$root_controller_pchair_1"

$Human: "CS_juchair"
$Char type: "cs_cs_churchchair"
$Start nav: "CS_$root_controller_juchair_1"

$Human: "CS_jochair"
$Char type: "cs_cs_churchchair"
$Start nav: "CS_$root_controller_jochair_1"

#End
