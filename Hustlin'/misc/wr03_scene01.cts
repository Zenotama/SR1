// -------
#Navpoints
// -------


// Slate: slate_tea_chinatown

$Navpoint: "CS_slate_tea_chinatown_1"
$Type: "ground"
$Pos: <-1.074 0.0 0.0>
$Orient: [4.11898]
+Slate_Name: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_bar01_1"
$Type: "ground"
$Pos: <13.544 0.401 -3.351>
$Orient: [1.60088]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_bar02_1"
$Type: "ground"
$Pos: <13.493 0.401 0.658>
$Orient: [1.60088]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_bar03_1"
$Type: "ground"
$Pos: <13.493 0.401 -0.567>
$Orient: [1.60088]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_booth01_1"
$Type: "ground"
$Pos: <4.223 0.269 4.247>
$Orient: [1.55731]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_booth02_1"
$Type: "ground"
$Pos: <8.292 0.269 4.051>
$Orient: [4.64852]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_booth03_1"
$Type: "ground"
$Pos: <6.751 0.269 4.051>
$Orient: [1.53091]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_stand01_1"
$Type: "ground"
$Pos: <9.027 -0.002 -2.879>
$Orient: [5.99218]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_stand02_1"
$Type: "ground"
$Pos: <8.807 -0.002 -2.078>
$Orient: [2.8677]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_CharNav_walk01_1"
$Type: "ground"
$Pos: <-3.714 0.019 3.388>
$Orient: [2.22687]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_PathNav_walk01_01_1"
$Type: "ground"
$Pos: <5.475 0.019 1.335>
$Orient: [2.39401]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_pc01_1"
$Type: "ground"
$Pos: <8.719 0.0 -0.847>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_lin01_1"
$Type: "ground"
$Pos: <12.1 0.0 -1.406>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_pot01_1"
$Type: "ground"
$Pos: <12.959 0.0 -1.187>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_cup01_1"
$Type: "ground"
$Pos: <12.638 0.0 -1.479>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_male01_1"
$Type: "ground"
$Pos: <12.055 0.0 -2.026>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_light01_1"
$Type: "ground"
$Pos: <12.611 0.0 -2.076>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_cig01_1"
$Type: "ground"
$Pos: <12.524 0.0 -1.393>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_area_wr03_scene01_1"
$Type: "ground"
$Pos: <-0.244 0.853 0.018>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_wr03_scene01"
$Start nav: "CS_area_wr03_scene01_1"
$Box size: -3.15485 -1.82246 -4.30972 3.15485 1.82246 4.30972

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_bar01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_bar01_1"

$Human: "CS_bar02"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_bar02_1"

$Human: "CS_bar03"
$Char type: "pd_x_m_highincome"
$Start nav: "CS_CharNav_bar03_1"

$Human: "CS_booth01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_booth01_1"

$Human: "CS_booth02"
$Char type: "pd_x_m_highincome"
$Start nav: "CS_CharNav_booth02_1"

$Human: "CS_booth03"
$Char type: "pd_x_f_businesswoman-01"
$Start nav: "CS_CharNav_booth03_1"

$Human: "CS_stand01"
$Char type: "pd_x_f_businesswoman-01"
$Start nav: "CS_CharNav_stand01_1"

$Human: "CS_stand02"
$Char type: "pd_x_m_highincome"
$Start nav: "CS_CharNav_stand02_1"

$Human: "CS_walk01"
$Char type: "pd_x_f_businesswoman-01"
$Start nav: "CS_CharNav_walk01_1"

$Human: "CS_lin"
$Char type: "TS_A_F_Lin"
$Start nav: "CS_$root_controller_lin01_1"

$Human: "CS_pot"
$Char type: "CS_teapot"
$Start nav: "CS_$root_controller_pot01_1"

$Human: "CS_cup"
$Char type: "CS_teacup"
$Start nav: "CS_$root_controller_cup01_1"

$Human: "CS_man"
$Char type: "PD_X_M_BusinessMan-01"
$Start nav: "CS_$root_controller_male01_1"
+Variant: "cutscene"

$Human: "CS_lighter"
$Char type: "CS_lighter"
$Start nav: "CS_$root_controller_light01_1"

$Human: "CS_cig"
$Char type: "CS_cigarette01"
$Start nav: "CS_$root_controller_cig01_1"

#End
