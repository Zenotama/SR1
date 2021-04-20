// -------
#Navpoints
// -------


// Slate: slate_arena

$Navpoint: "CS_slate_arena_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_arena"

$Navpoint: "CS_$root_controller_player01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <5.51 -3.471 -4.195>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_larry02_1"
$Type: "ground"
$Pos: <-0.48 0.0 0.206>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_garry02_1"
$Type: "ground"
$Pos: <33.487 0.0 -12.673>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_bDerby1a01_1"
$Type: "ground"
$Pos: <22.976 -3.005 -19.445>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_bDerby2a01_1"
$Type: "ground"
$Pos: <12.668 0.007 -41.525>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_bDerby2b01_1"
$Type: "ground"
$Pos: <6.878 -2.17 11.143>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_garryCar01_1"
$Type: "ground"
$Pos: <33.555 -3.678 -12.227>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_$root_controller_larryCar01_1"
$Type: "ground"
$Pos: <-0.289 0.0 -9.536>
$Orient: [I]
+Uses_Slate: "slate_arena"

$Navpoint: "CS_area_demoderby_1"
$Type: "ground"
$Pos: <1.901 4.435 -0.337>
$Orient: [I]
+Uses_Slate: "slate_arena"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_demoderby"
$Start nav: "CS_area_demoderby_1"
$Box size: -49.7396 -13.7182 -49.7396 49.7396 13.7182 49.7396

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_larry"
$Char type: "PD_X_M_Demolition-01"
$Start nav: "CS_$root_controller_larry02_1"
+Variant: "white"

$Human: "CS_garry"
$Char type: "PD_X_M_Demolition-01"
$Start nav: "CS_$root_controller_garry02_1"
+Variant: "white_helmet"

$Human: "CS_bDerby1a01"
$Char type: "CS_derbyCar01_a"
$Start nav: "CS_$root_controller_bDerby1a01_1"

$Human: "CS_bDerby2a01"
$Char type: "cs_derbycar02_a"
$Start nav: "CS_$root_controller_bDerby2a01_1"

$Human: "CS_bDerby2b01"
$Char type: "cs_derbycar02_b"
$Start nav: "CS_$root_controller_bDerby2b01_1"

$Human: "CS_garrycar"
$Char type: "CS_DerbyCar01va"
$Start nav: "CS_$root_controller_garryCar01_1"

$Human: "CS_larrycar"
$Char type: "CS_DerbyCar02va"
$Start nav: "CS_$root_controller_larryCar01_1"

#End
