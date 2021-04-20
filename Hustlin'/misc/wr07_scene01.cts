// -------
#Navpoints
// -------


// Slate: slate_wr07_scene01

$Navpoint: "CS_slate_wr07_scene01_1"
$Type: "ground"
$Pos: <-0.001 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_Sharp01_1"
$Type: "ground"
$Pos: <-3.308 0.0 -2.164>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_Lin01_1"
$Type: "ground"
$Pos: <-3.501 0.0 -0.154>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_Donnie01_1"
$Type: "ground"
$Pos: <-5.874 0.0 3.9>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <-7.669 -12.661 -23.169>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_linsCar01_1"
$Type: "ground"
$Pos: <-3.977 -0.006 -1.918>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_SUV01_1"
$Type: "ground"
$Pos: <-0.002 -0.014 0.025>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_$root_controller_trunk01_1"
$Type: "ground"
$Pos: <-3.088 0.0 -0.672>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

$Navpoint: "CS_area_wr07_scene01_1"
$Type: "ground"
$Pos: <-3.831 -3.893 -7.225>
$Orient: [I]
+Uses_Slate: "slate_wr07_scene01"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_wr07_scene01"
$Start nav: "CS_area_wr07_scene01_1"
$Box size: -26.8927 -9.00098 -26.8927 26.8927 9.00098 26.8927

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_sharp"
$Char type: "WR_W_M_Sharp"
$Start nav: "CS_$root_controller_Sharp01_1"
+Item: "magnum"
+Rank: 0

$Human: "CS_lin"
$Char type: "TS_A_F_Lin"
$Start nav: "CS_$root_controller_Lin01_1"

$Human: "CS_donnie"
$Char type: "WR_A_M_Donnie-01"
$Start nav: "CS_$root_controller_Donnie01_1"

$Human: "CS_lincar"
$Char type: "cs_linscar"
$Start nav: "CS_$root_controller_linsCar01_1"

$Human: "CS_donniecar"
$Char type: "cs_SUV_Donnie"
$Start nav: "CS_$root_controller_SUV01_1"

$Human: "CS_trunk"
$Char type: "CS_LinsTrunk"
$Start nav: "CS_$root_controller_trunk01_1"

#End
