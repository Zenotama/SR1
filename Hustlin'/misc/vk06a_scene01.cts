// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-406.89 -3.7893 95.6271>
$Orient: [I]


// Slate: slate_clothing_store

$Navpoint: "CS_slate_clothing_store_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_clothing_store"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <-1.632 0.0 -0.514>
$Orient: [I]
+Uses_Slate: "slate_clothing_store"

$Navpoint: "CS_$root_controller_Johnny_1"
$Type: "ground"
$Pos: <1.065 0.0 -0.485>
$Orient: [I]
+Uses_Slate: "slate_clothing_store"

$Navpoint: "CS_$root_controller_DEX_1"
$Type: "ground"
$Pos: <0.918 0.0 1.315>
$Orient: [I]
+Uses_Slate: "slate_clothing_store"

$Navpoint: "CS_$root_controller_TshirtProp01_1"
$Type: "ground"
$Pos: <0.249 0.0 1.286>
$Orient: [I]
+Uses_Slate: "slate_clothing_store"

$Navpoint: "CS_$root_controller_ShoppingBag01_1"
$Type: "ground"
$Pos: <0.255 0.0 1.286>
$Orient: [I]
+Uses_Slate: "slate_clothing_store"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_clothing_store"

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
$Start nav: "CS_$root_controller_Johnny_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_DEX_1"

$Human: "CS_Tshirt"
$Char type: "CS_VK_Shirt"
$Start nav: "CS_$root_controller_TshirtProp01_1"

$Human: "CS_shopppingbag"
$Char type: "CS_ShoppingBag"
$Start nav: "CS_$root_controller_ShoppingBag01_1"

#End
