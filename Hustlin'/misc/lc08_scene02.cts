// -------
#Navpoints
// -------


// Slate: slate_airport_stripclub

$Navpoint: "CS_slate_airport_stripclub_1"
$Type: "ground"
$Pos: <7.194 -0.135 1.66>
$Orient: [1.56556]
+Slate_Name: "slate_airport_stripclub"

$Navpoint: "CS_CharNav_sit01_1"
$Type: "ground"
$Pos: <9.683 -0.055 -5.099>
$Orient: [2.73353]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CharNav_bartender_1"
$Type: "ground"
$Pos: <10.52 -0.501 -1.814>
$Orient: [2.33733]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CharNav_sit02_1"
$Type: "ground"
$Pos: <10.277 -0.055 1.264>
$Orient: [1.33519]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CharNav_sit03_1"
$Type: "ground"
$Pos: <9.858 -0.465 3.695>
$Orient: [3.89703]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_CharNav_strip01_1"
$Type: "ground"
$Pos: <10.073 0.326 -6.126>
$Orient: [5.09375]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_player01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <3.597 -0.556 -0.312>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_manuel01_1"
$Type: "ground"
$Pos: <4.133 -0.557 -1.711>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_dex_1"
$Type: "ground"
$Pos: <4.751 -0.557 -0.187>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_ped_1"
$Type: "ground"
$Pos: <6.23 -2.484 0.408>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_julius01_1"
$Type: "ground"
$Pos: <4.179 -0.556 -0.772>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_NAPK01_1"
$Type: "ground"
$Pos: <4.371 0.0 -1.712>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_car01_1"
$Type: "ground"
$Pos: <-11.771 -0.001 -1.936>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_pist01_1"
$Type: "ground"
$Pos: <4.159 0.0 -1.296>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_pist02_1"
$Type: "ground"
$Pos: <3.614 0.0 -0.324>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_falc01_1"
$Type: "ground"
$Pos: <4.331 0.0 -1.883>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_tbl01_1"
$Type: "ground"
$Pos: <4.426 -0.575 0.601>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_$root_controller_angelo01_1"
$Type: "ground"
$Pos: <-6.017 -0.557 -2.187>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

$Navpoint: "CS_area_lc08_scene02_1"
$Type: "ground"
$Pos: <-2.276 0.873 -2.685>
$Orient: [I]
+Uses_Slate: "slate_airport_stripclub"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc08_scene02"
$Start nav: "CS_area_lc08_scene02_1"
$Box size: -9.76944 -3.51046 -6.12444 9.76944 3.51046 6.12444

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_sit01"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_sit01_1"

$Human: "CS_bartender"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_bartender_1"

$Human: "CS_sit02"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_sit02_1"

$Human: "CS_sit03"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_sit03_1"

$Human: "CS_strip01"
$Char type: "stripper-white"
$Start nav: "CS_CharNav_strip01_1"

$Human: "CS_manuel"
$Char type: "LC_L_M_ManuelOrejuela"
$Start nav: "CS_$root_controller_manuel01_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_dex_1"
+Item: "desert eagle"
+Rank: 0

$Human: "CS_ped"
$Char type: "TS_X_M_Thug1-01b"
$Start nav: "CS_$root_controller_ped_1"

$Human: "CS_julius"
$Char type: "TS_B_M_Julius"
$Start nav: "CS_$root_controller_julius01_1"
+Item: "mac10"
+Rank: 0

$Human: "CS_napkin"
$Char type: "CS_napkin"
$Start nav: "CS_$root_controller_NAPK01_1"

$Human: "CS_car"
$Char type: "cs_Car_Angelo"
$Start nav: "CS_$root_controller_car01_1"

$Human: "CS_pist01"
$Char type: "CS_CS_Pistol"
$Start nav: "CS_$root_controller_pist01_1"

$Human: "CS_pist02"
$Char type: "CS_CS_Pistol"
$Start nav: "CS_$root_controller_pist02_1"

$Human: "CS_falc01"
$Char type: "CS_SFalcon"
$Start nav: "CS_$root_controller_falc01_1"

$Human: "CS_table"
$Char type: "CS_turbtable"
$Start nav: "CS_$root_controller_tbl01_1"

$Human: "CS_angelo"
$Char type: "LC_L_M_AngeloLopez-01"
$Start nav: "CS_$root_controller_angelo01_1"
+Item: "ak47"
+Rank: 0

#End
