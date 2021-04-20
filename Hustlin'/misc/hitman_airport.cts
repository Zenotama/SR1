// -------
#Navpoints
// -------


// Slate: slate_hitman_airport

$Navpoint: "CS_slate_hitman_airport_1"
$Type: "ground"
$Pos: <-0.001 0.038 -3.942>
$Orient: [I]
+Slate_Name: "hitman_airport"

$Navpoint: "CS_CharNav_sit02_1"
$Type: "ground"
$Pos: <-5.065 -0.193 -1.275>
$Orient: [4.21297]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_CharNav_talk01_1"
$Type: "ground"
$Pos: <0.197 0.0 3.315>
$Orient: [1.64871]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_CharNav_talk02_1"
$Type: "ground"
$Pos: <-4.56 0.0 -2.453>
$Orient: [1.08208]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_CharNav_sit04_1"
$Type: "ground"
$Pos: <-4.455 -0.169 -3.878>
$Orient: [4.20041]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_Deb01_1"
$Type: "ground"
$Pos: <2.887 -0.311 -1.329>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_PC01 cBotm_casBagyPant_NH_1"
$Type: "ground"
$Pos: <0.877 0.0 -5.526>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_Martini01_1"
$Type: "ground"
$Pos: <2.83 0.0 -1.619>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_Case01_1"
$Type: "ground"
$Pos: <0.394 0.0 -3.625>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_Photo01_1"
$Type: "ground"
$Pos: <0.414 0.0 -3.391>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_DebCouch01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_PcCouch01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_$root_controller_Table01_1"
$Type: "ground"
$Pos: <0.0 0.0 -3.966>
$Orient: [I]
+Uses_Slate: "hitman_airport"

$Navpoint: "CS_area_hit_airport_1"
$Type: "ground"
$Pos: <1.194 1.364 -4.032>
$Orient: [I]
+Uses_Slate: "hitman_airport"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_hit_airport"
$Start nav: "CS_area_hit_airport_1"
$Box size: -7.57344 -2.0301 -8.03222 7.57344 2.0301 8.03222

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_sit02"
$Char type: "pd_x_m_oldman-01"
$Start nav: "CS_CharNav_sit02_1"
+Variant: "asian"

$Human: "CS_talk01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_talk01_1"

$Human: "CS_talk02"
$Char type: "pd_x_f_businesswoman-01"
$Start nav: "CS_CharNav_talk02_1"

$Human: "CS_sit04"
$Char type: "pd_x_m_highincome"
$Start nav: "CS_CharNav_sit04_1"
+Variant: "whiteGuy"

$Human: "CS_deb"
$Char type: "AC_W_F_Hitman-Deborah"
$Start nav: "CS_$root_controller_Deb01_1"

$Human: "CS_martini"
$Char type: "cs_martini"
$Start nav: "CS_$root_controller_Martini01_1"

$Human: "CS_case"
$Char type: "cs_casemoney"
$Start nav: "CS_$root_controller_Case01_1"

$Human: "CS_photo"
$Char type: "cs_hitman_photo"
$Start nav: "CS_$root_controller_Photo01_1"
+Variant: "PhotoOfGuy"

$Human: "CS_DebCouch"
$Char type: "cs_airportcouch"
$Start nav: "CS_$root_controller_DebCouch01_1"

$Human: "CS_PcCouch"
$Char type: "cs_airportcouch"
$Start nav: "CS_$root_controller_PcCouch01_1"

$Human: "CS_airporttable"
$Char type: "cs_airporttable"
$Start nav: "CS_$root_controller_Table01_1"

#End
