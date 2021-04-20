// -------
#Navpoints
// -------


// Slate: slate_barrio_police

$Navpoint: "CS_slate_barrio_police_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_barrio_police"

$Navpoint: "CS_CharNav_look01_1"
$Type: "ground"
$Pos: <19.737 0.117 -1.411>
$Orient: [4.83296]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_CharNav_look02_1"
$Type: "ground"
$Pos: <19.047 0.11 -4.003>
$Orient: [4.90935]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_$root_controller_PC01_1"
$Type: "ground"
$Pos: <-0.575 0.0 -1.547>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_$root_controller_saint101_1"
$Type: "ground"
$Pos: <1.356 0.632 2.631>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_$root_controller_saint201_1"
$Type: "ground"
$Pos: <1.249 0.634 1.533>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_$root_controller_saint0301_1"
$Type: "ground"
$Pos: <1.338 0.634 1.954>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_$root_controller_saint0401_1"
$Type: "ground"
$Pos: <1.342 0.632 2.4>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_$root_controller_bigtruck01_1"
$Type: "ground"
$Pos: <4.66 0.044 2.16>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

$Navpoint: "CS_area_lc08_police_1"
$Type: "ground"
$Pos: <-1.474 5.691 1.47>
$Orient: [I]
+Uses_Slate: "slate_barrio_police"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc08_police"
$Start nav: "CS_area_lc08_police_1"
$Box size: -33.6356 -8.27329 -33.6356 33.6356 8.27329 33.6356

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_look01"
$Char type: "pd_x_f_genericyoung-01"
$Start nav: "CS_CharNav_look01_1"

$Human: "CS_look02"
$Char type: "pd_x_m_genericyoung-01"
$Start nav: "CS_CharNav_look02_1"

$Human: "CS_saint01"
$Char type: "TS_X_M_Thug1-01b"
$Start nav: "CS_$root_controller_saint101_1"

$Human: "CS_saint02"
$Char type: "TS_X_M_Thug1-01"
$Start nav: "CS_$root_controller_saint201_1"

$Human: "CS_saint03"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_$root_controller_saint0301_1"

$Human: "CS_saint04"
$Char type: "TS_X_M_Thug1-01"
$Start nav: "CS_$root_controller_saint0401_1"

$Human: "CS_truck"
$Char type: "cs_Truck_Mover"
$Start nav: "CS_$root_controller_bigtruck01_1"

#End
