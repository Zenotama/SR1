// -------
#Navpoints
// -------


// Slate: slate_finalcutscene_2

$Navpoint: "CS_slate_finalcutscene_2_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_finalcutscene_2"

$Navpoint: "CS_KingCar_1"
$Type: "ground"
$Pos: <-155.896 0.0 436.703>
$Orient: [1.01543]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_$root_controller_PC01_1"
$Type: "ground"
$Pos: <0.001 0.0 1.34>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_$root_controller_Huges01_1"
$Type: "ground"
$Pos: <-2.393 0.0 -0.006>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_Johnny01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <51.669 -154.501 -5.402>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_Aisha01_$root_controller_FEM1_1"
$Type: "ground"
$Pos: <51.125 -154.501 -5.718>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_Donny01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <46.303 -138.926 -182.827>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_$root_controller_Luz01_1"
$Type: "ground"
$Pos: <161.61 0.0 49.821>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_Troy01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-306.949 0.0 -252.358>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_King01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-156.154 -16.607 438.021>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_Julius01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-34.86 0.0 -132.362>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_HThug01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <0.577 0.0 4.506>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_HThug02_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <0.71 0.0 0.542>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_HThug03_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <0.857 0.0 2.249>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_HThug04_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <1.059 0.0 0.6>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

$Navpoint: "CS_CutsceneArea_finalpart2_1"
$Type: "ground"
$Pos: <-106.711 0.0 46.879>
$Orient: [I]
+Uses_Slate: "slate_finalcutscene_2"

// -------
#Cutscene
// -------

$Cutscene: "CS_CutsceneArea_finalpart2"
$Start nav: "CS_CutsceneArea_finalpart2_1"
$Box size: -827.597 -946.068 -827.597 827.597 946.068 827.597

// -------
#Vehicles
// -------

$Vehicle: "CS_KingCar"
$Vehicle Type: "car_2dr_luxury04"
$Start nav: "CS_KingCar_1"
$Stream Distance: 50.000
+Variant: "undefined"

// -------
#Humans
// -------

$Human: "CS_huges"
$Char type: "ac_w_m_hughes"
$Start nav: "CS_$root_controller_Huges01_1"

$Human: "CS_johnny"
$Char type: "ts_a_m_johnnygatmecha"
$Start nav: "CS_Johnny01_$root_controller_MAL2_1"

$Human: "CS_aisha"
$Char type: "vk_b_f_aisha"
$Start nav: "CS_Aisha01_$root_controller_FEM1_1"

$Human: "CS_donny"
$Char type: "wr_a_m_donnie-01"
$Start nav: "CS_Donny01_$root_controller_MAL2_1"

$Human: "CS_luz"
$Char type: "lc_l_f_luz"
$Start nav: "CS_$root_controller_Luz01_1"

$Human: "CS_troy"
$Char type: "ts_w_m_troy-01"
$Start nav: "CS_Troy01_$root_controller_MAL2_1"
+Item: "badge_police"
+Rank: 0

$Human: "CS_king"
$Char type: "vk_b_m_benjaminking"
$Start nav: "CS_King01_$root_controller_MAL2_1"

$Human: "CS_julius"
$Char type: "ts_b_m_julius"
$Start nav: "CS_Julius01_$root_controller_MAL2_1"

$Human: "CS_HThug01"
$Char type: "vk_x_m_pthug-01"
$Start nav: "CS_HThug01_$root_controller_MAL2_1"

$Human: "CS_HThug02"
$Char type: "vk_x_m_pthug-01"
$Start nav: "CS_HThug02_$root_controller_MAL2_1"

$Human: "CS_HThug03"
$Char type: "vk_x_m_pthug-01"
$Start nav: "CS_HThug03_$root_controller_MAL2_1"
+Variant: "PThugWhite"

$Human: "CS_HThug04"
$Char type: "vk_x_m_pthug-01"
$Start nav: "CS_HThug04_$root_controller_MAL2_1"
+Variant: "PThugBlack"

#End
