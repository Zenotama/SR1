// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <131.43 -3.9004 546.696>
$Orient: [I]


// Slate: slate_vand_train

$Navpoint: "CS_slate_vand_train_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_vand_train"

$Navpoint: "CS_CharNav_bartender_1"
$Type: "ground"
$Pos: <5.887 0.0 7.689>
$Orient: [0.487679]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_CharNav_dance01_1"
$Type: "ground"
$Pos: <11.146 -0.408 -1.008>
$Orient: [1.72272]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_CharNav_dance02_1"
$Type: "ground"
$Pos: <12.207 -0.408 -2.759>
$Orient: [0.375041]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_CharNav_dance03_1"
$Type: "ground"
$Pos: <13.74 -0.389 -5.411>
$Orient: [2.97295]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_CharNav_sit01_1"
$Type: "ground"
$Pos: <7.678 0.454 6.735>
$Orient: [I]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_CharNav_dance04_1"
$Type: "ground"
$Pos: <21.601 0.705 -0.971>
$Orient: [4.73825]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_CharNav_sit02_1"
$Type: "ground"
$Pos: <4.07 0.161 6.281>
$Orient: [6.09262]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_$root_controller_FEM1_1"
$Type: "ground"
$Pos: <4.279 0.0 -2.225>
$Orient: [I]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <4.929 0.0 -2.644>
$Orient: [I]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_$root_controller_PC01_1"
$Type: "ground"
$Pos: <0.77 0.0 -0.638>
$Orient: [I]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_$root_controller_Table01_1"
$Type: "ground"
$Pos: <3.693 0.0 -1.883>
$Orient: [I]
+Uses_Slate: "slate_vand_train"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_vand_train"

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

$Human: "CS_bartender"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_CharNav_bartender_1"

$Human: "CS_dance01"
$Char type: "pd_x_f_genericyoung-01"
$Start nav: "CS_CharNav_dance01_1"

$Human: "CS_dance02"
$Char type: "pd_x_f_genericyoung-02"
$Start nav: "CS_CharNav_dance02_1"

$Human: "CS_dance03"
$Char type: "pd_x_m_genericyoung-01"
$Start nav: "CS_CharNav_dance03_1"

$Human: "CS_sit01"
$Char type: "pd_x_m_genericyoung-01"
$Start nav: "CS_CharNav_sit01_1"

$Human: "CS_dance04"
$Char type: "pd_x_f_skinnyho"
$Start nav: "CS_CharNav_dance04_1"
+Variant: "hispanic"

$Human: "CS_sit02"
$Char type: "pd_x_m_genericyoung-01"
$Start nav: "CS_CharNav_sit02_1"

$Human: "CS_ho"
$Char type: "AC_A_F_Vandilism-Girl"
$Start nav: "CS_$root_controller_FEM1_1"

$Human: "CS_rico"
$Char type: "AC_L_M_Vandalism-Rico"
$Start nav: "CS_$root_controller_MAL2_1"

$Human: "CS_table"
$Char type: "cs_ac_tablecloth"
$Start nav: "CS_$root_controller_Table01_1"

#End
