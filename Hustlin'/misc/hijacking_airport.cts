// -------
#Navpoints
// -------


// Slate: slate_hijacking_airport

$Navpoint: "CS_slate_hijacking_airport_1"
$Type: "ground"
$Pos: <0.0 0.0 -0.001>
$Orient: [I]
+Slate_Name: "slate_hijacking_airport"

$Navpoint: "CS_$root_controller_Ralph01_1"
$Type: "ground"
$Pos: <-0.043 0.0 -0.93>
$Orient: [I]
+Uses_Slate: "slate_hijacking_airport"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <-0.054 0.0 0.854>
$Orient: [I]
+Uses_Slate: "slate_hijacking_airport"

$Navpoint: "CS_area_hijacking_airport_1"
$Type: "ground"
$Pos: <0.526 3.12 -1.014>
$Orient: [I]
+Uses_Slate: "slate_hijacking_airport"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_hijacking_airport"
$Start nav: "CS_area_hijacking_airport_1"
$Box size: -17.5234 -4.22666 -17.5234 17.5234 4.22666 17.5234

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_ralph"
$Char type: "AC_W_M_Hijacking-Ralph"
$Start nav: "CS_$root_controller_Ralph01_1"

#End
