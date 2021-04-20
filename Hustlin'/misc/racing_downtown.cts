// -------
#Navpoints
// -------


// Slate: slate_racing_downtown

$Navpoint: "CS_slate_racing_downtown_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_racing_downtown"

$Navpoint: "CS_$root_controller_tyrell01_1"
$Type: "ground"
$Pos: <-1.443 0.0 0.656>
$Orient: [I]
+Uses_Slate: "slate_racing_downtown"

$Navpoint: "CS_$root_controller_PC01 cBotm_casBagyPant_NH_1"
$Type: "ground"
$Pos: <3.309 0.0 2.592>
$Orient: [I]
+Uses_Slate: "slate_racing_downtown"

$Navpoint: "CS_$root_controller_CAR4_1"
$Type: "ground"
$Pos: <-1.671 -0.215 -2.036>
$Orient: [6.14629]
+Uses_Slate: "slate_racing_downtown"

$Navpoint: "CS_area_racing_downtown_1"
$Type: "ground"
$Pos: <-0.99 5.024 -0.497>
$Orient: [I]
+Uses_Slate: "slate_racing_downtown"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_racing_downtown"
$Start nav: "CS_area_racing_downtown_1"
$Box size: -27.2422 -4.85429 -27.2422 27.2422 4.85429 27.2422

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_tyrell"
$Char type: "AC_B_M_Racing-Tyrell"
$Start nav: "CS_$root_controller_tyrell01_1"
+Item: "cellphone1"
+Rank: 0

$Human: "CS_csDowntownRacing"
$Char type: "cs_4dr_sports_riced"
$Start nav: "CS_$root_controller_CAR4_1"

#End
