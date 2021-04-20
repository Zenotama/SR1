// -------
#Navpoints
// -------


// Slate: slate_druglab_museum

$Navpoint: "CS_slate_druglab_museum_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_druglab_museum"

$Navpoint: "CS_$root_controller_player_1"
$Type: "ground"
$Pos: <5.671 -0.007 0.89>
$Orient: [I]
+Uses_Slate: "slate_druglab_museum"

$Navpoint: "CS_$root_controller_marvin_1"
$Type: "ground"
$Pos: <1.921 0.04 0.703>
$Orient: [I]
+Uses_Slate: "slate_druglab_museum"

$Navpoint: "CS_area_drugtraffic_museum_1"
$Type: "ground"
$Pos: <-2.097 3.116 1.567>
$Orient: [I]
+Uses_Slate: "slate_druglab_museum"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_drugtraffic_museum"
$Start nav: "CS_area_drugtraffic_museum_1"
$Box size: -13.4253 -3.54405 -13.4253 13.4253 3.54405 13.4253

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_marvin"
$Char type: "AC_B_M_Drugs-Marvin"
$Start nav: "CS_$root_controller_marvin_1"

#End
