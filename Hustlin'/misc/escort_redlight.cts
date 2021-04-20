// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-90.6536 -1.9465 -240.89>
$Orient: [I]


// Slate: slate_escort_redlight

$Navpoint: "CS_slate_escort_redlight_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_escort_redlight"

$Navpoint: "CS_CharNav_strip01_1"
$Type: "ground"
$Pos: <12.419 -0.164 -1.699>
$Orient: [5.75523]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_talker01_1"
$Type: "ground"
$Pos: <5.377 -1.11 -3.351>
$Orient: [0.611596]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_talker02_1"
$Type: "ground"
$Pos: <-0.27 -0.081 4.737>
$Orient: [0.437126]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_stand01_1"
$Type: "ground"
$Pos: <-6.708 -0.046 10.874>
$Orient: [2.06699]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_stand02_1"
$Type: "ground"
$Pos: <-5.721 -0.049 10.187>
$Orient: [5.54293]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_strip02_1"
$Type: "ground"
$Pos: <22.082 -0.116 19.445>
$Orient: [4.01364]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_bar01_1"
$Type: "ground"
$Pos: <5.579 -0.795 11.729>
$Orient: [3.71569]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_stand03_1"
$Type: "ground"
$Pos: <-2.231 -0.072 5.667>
$Orient: [0.0378933]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_sit01_1"
$Type: "ground"
$Pos: <10.913 -0.872 0.173>
$Orient: [1.91682]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_sit02_1"
$Type: "ground"
$Pos: <15.395 -0.872 2.543>
$Orient: [3.74547]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_talker03_1"
$Type: "ground"
$Pos: <6.983 -1.11 -0.746>
$Orient: [1.58059]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_CharNav_talker04_1"
$Type: "ground"
$Pos: <18.014 -1.11 14.995>
$Orient: [0.357303]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_$root_controller_Bruno01_1"
$Type: "ground"
$Pos: <-1.357 -0.064 -0.292>
$Orient: [I]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_$root_controller_Paparazzi01_1"
$Type: "ground"
$Pos: <-3.556 0.0 0.871>
$Orient: [I]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_$root_controller_Stripper01_1"
$Type: "ground"
$Pos: <2.031 -0.064 -2.677>
$Orient: [I]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <-0.015 -0.064 -2.491>
$Orient: [I]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_$root_controller_Camera01_1"
$Type: "ground"
$Pos: <-3.15 0.0 0.451>
$Orient: [I]
+Uses_Slate: "slate_escort_redlight"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_escort_redlight"

// -------
#Cutscene
// -------

$Cutscene: "CS_$Auto_Generated_Area_Node"
$Start nav: "CS_$Auto_Generated_Area_Node_Nav"
$Box size: -30.0 -30.0 -30.0 30.0 30.0 30.0

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_strip01"
$Char type: "stripper-latina"
$Start nav: "CS_CharNav_strip01_1"

$Human: "CS_talker01"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_talker01_1"

$Human: "CS_talker02"
$Char type: "pd_x_m_highincome"
$Start nav: "CS_CharNav_talker02_1"

$Human: "CS_stand01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_stand01_1"

$Human: "CS_stand02"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_stand02_1"

$Human: "CS_strip02"
$Char type: "stripper-asian"
$Start nav: "CS_CharNav_strip02_1"

$Human: "CS_bar01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_bar01_1"

$Human: "CS_stand03"
$Char type: "pd_x_m_highincome"
$Start nav: "CS_CharNav_stand03_1"

$Human: "CS_sit01"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_sit01_1"

$Human: "CS_sit02"
$Char type: "pd_x_m_middleage-01"
$Start nav: "CS_CharNav_sit02_1"

$Human: "CS_talker03"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_talker03_1"

$Human: "CS_talker04"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_talker04_1"

$Human: "CS_bruno"
$Char type: "AC_W_M_Escort-Bruno"
$Start nav: "CS_$root_controller_Bruno01_1"

$Human: "CS_papparazzi"
$Char type: "AC_W_M_Escort-Papparraz"
$Start nav: "CS_$root_controller_Paparazzi01_1"

$Human: "CS_stripper"
$Char type: "AC_W_F_Stripper"
$Start nav: "CS_$root_controller_Stripper01_1"

$Human: "CS_camera"
$Char type: "cs_camera"
$Start nav: "CS_$root_controller_Camera01_1"

#End
