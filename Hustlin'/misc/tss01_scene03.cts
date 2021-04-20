// -------
#Navpoints
// -------


// Slate: slate_chruch_yard

$Navpoint: "CS_slate_chruch_yard_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander01_1"
$Type: "ground"
$Pos: <4.066 0.0 1.264>
$Orient: [4.53967]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander02_1"
$Type: "ground"
$Pos: <-1.242 0.0 1.94>
$Orient: [2.32129]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander03_1"
$Type: "ground"
$Pos: <1.359 0.0 5.42>
$Orient: [3.03687]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander04_1"
$Type: "ground"
$Pos: <3.766 0.0 4.456>
$Orient: [3.76991]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_johnny01_1"
$Type: "ground"
$Pos: <2.596 0.0 -1.066>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_player01_1"
$Type: "ground"
$Pos: <1.773 0.0 1.404>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_saintsd01_1"
$Type: "ground"
$Pos: <0.203 0.0 2.163>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_dex01_1"
$Type: "ground"
$Pos: <2.652 0.0 2.665>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_$root_controller_sanitsa01_1"
$Type: "ground"
$Pos: <1.366 0.0 3.404>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_julius01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <1.243 0.0 -3.208>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_Troy01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <0.552 0.0 -1.713>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_SaintC01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-95.901 0.0 1.559>
$Orient: [I]
+Uses_Slate: "slate_chruch_yard"

$Navpoint: "CS_tss01_scene03_area_1"
$Type: "ground"
$Pos: <3.802 2.909 3.814>
$Orient: [3.49913]
+Uses_Slate: "slate_chruch_yard"

// -------
#Cutscene
// -------

$Cutscene: "CS_tss01_scene03_area"
$Start nav: "CS_tss01_scene03_area_1"
$Box size: -22.1865 -7.32294 -22.1865 22.1865 7.32294 22.1865

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_stander01"
$Char type: "TS_X_M_Thug1-01b"
$Start nav: "CS_CSCharnav-stander01_1"

$Human: "CS_stander02"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_CSCharnav-stander02_1"

$Human: "CS_stander03"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_CSCharnav-stander03_1"

$Human: "CS_stander04"
$Char type: "TS_X_M_Thug2-01b"
$Start nav: "CS_CSCharnav-stander04_1"

$Human: "CS_johnny"
$Char type: "TS_A_M_JohnnyGat"
$Start nav: "CS_$root_controller_johnny01_1"

$Human: "CS_saintsd"
$Char type: "ts_x_m_thug2-01b"
$Start nav: "CS_$root_controller_saintsd01_1"

$Human: "CS_dex"
$Char type: "TS_B_M_Dex-01"
$Start nav: "CS_$root_controller_dex01_1"

$Human: "CS_saintsa"
$Char type: "ts_x_m_thug2-01"
$Start nav: "CS_$root_controller_sanitsa01_1"

$Human: "CS_julius"
$Char type: "TS_B_M_Julius"
$Start nav: "CS_julius01_$root_controller_MAL2_1"

$Human: "CS_troy"
$Char type: "TS_W_M_Troy-01"
$Start nav: "CS_Troy01_$root_controller_MAL2_1"

$Human: "CS_SaintC"
$Char type: "ts_x_m_thug1-01b"
$Start nav: "CS_SaintC01_$root_controller_MAL2_1"

#End
