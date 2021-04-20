// -------
#Navpoints
// -------


// Slate: slate_hmansion_byard

$Navpoint: "CS_slate_hmansion_byard_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_hector01_1"
$Type: "ground"
$Pos: <2.918 0.0 -0.566>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_victor01_1"
$Type: "ground"
$Pos: <5.184 0.0 -0.468>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_manuel01_1"
$Type: "ground"
$Pos: <4.2 0.002 -1.774>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_angelo01_1"
$Type: "ground"
$Pos: <3.979 0.0 0.106>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_Table01_1"
$Type: "ground"
$Pos: <4.068 0.0 -0.674>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_Chair01_1"
$Type: "ground"
$Pos: <2.905 0.0 -0.558>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairB01_1"
$Type: "ground"
$Pos: <3.957 0.0 0.37>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairC01_1"
$Type: "ground"
$Pos: <5.228 0.0 -0.463>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_ChairD01_1"
$Type: "ground"
$Pos: <4.216 0.0 -1.809>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_SunChair01_1"
$Type: "ground"
$Pos: <0.477 0.0 -4.203>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_$root_controller_luz01_1"
$Type: "ground"
$Pos: <0.528 0.011 -4.17>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

$Navpoint: "CS_area_lc02_scene02_1"
$Type: "ground"
$Pos: <0.646 0.0 -3.414>
$Orient: [I]
+Uses_Slate: "slate_hmansion_byard"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_lc02_scene02"
$Start nav: "CS_area_lc02_scene02_1"
$Box size: -20.2864 -5.69444 -21.5855 20.2864 5.69444 21.5855

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_hector"
$Char type: "LC_L_M_HectorLopez"
$Start nav: "CS_$root_controller_hector01_1"

$Human: "CS_victor"
$Char type: "LC_L_M_VictorRodriguez"
$Start nav: "CS_$root_controller_victor01_1"

$Human: "CS_manuel"
$Char type: "lc_l_m_manuelorejuela"
$Start nav: "CS_$root_controller_manuel01_1"

$Human: "CS_angelo"
$Char type: "lc_l_m_angelolopez-01"
$Start nav: "CS_$root_controller_angelo01_1"

$Human: "CS_table"
$Char type: "cs_umbtable"
$Start nav: "CS_$root_controller_Table01_1"

$Human: "CS_chair1"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_Chair01_1"

$Human: "CS_chairB"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairB01_1"

$Human: "CS_chairC"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairC01_1"

$Human: "CS_chairD"
$Char type: "cs_lcchair"
$Start nav: "CS_$root_controller_ChairD01_1"

$Human: "CS_sunchair"
$Char type: "cs_sunchair"
$Start nav: "CS_$root_controller_SunChair01_1"

$Human: "CS_luz"
$Char type: "lc_l_f_luz-bikini"
$Start nav: "CS_$root_controller_luz01_1"

#End
