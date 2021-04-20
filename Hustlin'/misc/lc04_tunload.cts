// -------
#Navpoints
// -------


// Slate: slate_truck_unload

$Navpoint: "CS_slate_truck_unload_1"
$Type: "ground"
$Pos: <21.499 0.17 26.352>
$Orient: [3.41185]
+Slate_Name: "slate_truck_unload"

$Navpoint: "CS_$root_controller_carnalesA01_1"
$Type: "ground"
$Pos: <-0.028 0.0 -0.019>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_WBThug01_1"
$Type: "ground"
$Pos: <-0.702 0.0 0.914>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_AHThug01_1"
$Type: "ground"
$Pos: <-1.476 0.0 0.351>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_FatThug01_1"
$Type: "ground"
$Pos: <-0.114 0.0 -0.544>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_FatThug02_1"
$Type: "ground"
$Pos: <-0.226 0.0 -0.004>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <10.863 0.0 4.628>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_Truck01_1"
$Type: "ground"
$Pos: <12.075 0.0 6.178>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_RunnerThug01_1"
$Type: "ground"
$Pos: <-0.465 0.0 -0.683>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_$root_controller_WBThugFem01_1"
$Type: "ground"
$Pos: <-1.47 0.0 -0.16>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

$Navpoint: "CS_area_lc04_truckload_1"
$Type: "ground"
$Pos: <2.45 0.0 -0.614>
$Orient: [I]
+Uses_Slate: "slate_truck_unload"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc04_truckload"
$Start nav: "CS_area_lc04_truckload_1"
$Box size: -42.3252 -12.151 -50.8943 42.3252 12.151 50.8943

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_hthug"
$Char type: "TS_X_M_Thug1-01b"
$Start nav: "CS_$root_controller_carnalesA01_1"
+Item: "ak47"
+Rank: 0
+Variant: "asian"

$Human: "CS_wbthug01"
$Char type: "TS_X_M_Thug1-01"
$Start nav: "CS_$root_controller_WBThug01_1"
+Item: "beretta"
+Rank: 0
+Variant: "black"

$Human: "CS_ahthug"
$Char type: "TS_X_M_Thug1-01b"
$Start nav: "CS_$root_controller_AHThug01_1"
+Variant: "lc_truck"

$Human: "CS_fthug01"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_$root_controller_FatThug01_1"
+Variant: "White"

$Human: "CS_fthug02"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_$root_controller_FatThug02_1"
+Item: "pump_action_shotgun"
+Rank: 0
+Variant: "Black"

$Human: "CS_truck"
$Char type: "cs_Truck_Mover"
$Start nav: "CS_$root_controller_Truck01_1"

$Human: "CS_rthug"
$Char type: "TS_X_M_Thug1-01"
$Start nav: "CS_$root_controller_RunnerThug01_1"
+Item: "beretta"
+Rank: 0
+Variant: "black"

$Human: "CS_fem"
$Char type: "TS_X_F_Thug-01"
$Start nav: "CS_$root_controller_WBThugFem01_1"
+Item: "baseball_bat"
+Rank: 0
+Variant: "white"

#End
