// -------
#Navpoints
// -------


// Slate: slate_church_dexroom

$Navpoint: "CS_slate_church_dexroom_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_dex_1"
$Type: "ground"
$Pos: <-1.826 0.0 -0.477>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_saint1_1"
$Type: "ground"
$Pos: <-9.24 -2.066 0.585>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_pc01_1"
$Type: "ground"
$Pos: <-6.076 0.0 -0.793>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_PIST01_1"
$Type: "ground"
$Pos: <-89.007 -4.336 -113.781>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_PIST02_1"
$Type: "ground"
$Pos: <-87.858 -4.337 -112.949>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"


// Slate: slate_lc03_s01_row

$Navpoint: "CS_slate_lc03_s01_row_10"
$Type: "ground"
$Pos: <-87.326 -4.219 -111.226>
$Orient: [I]
+Slate_Name: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_ang_10"
$Type: "ground"
$Pos: <-88.039 -4.224 -113.184>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_vic_10"
$Type: "ground"
$Pos: <-90.107 -4.241 -113.244>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_saint1_10"
$Type: "ground"
$Pos: <-4.804 0.051 -0.759>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_saint2_10"
$Type: "ground"
$Pos: <-89.463 -4.335 -118.037>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_saint3_10"
$Type: "ground"
$Pos: <-84.941 -4.336 -115.541>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_saint4_10"
$Type: "ground"
$Pos: <-85.989 -4.224 -113.69>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_saint5_10"
$Type: "ground"
$Pos: <-99.254 -4.335 -506.517>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_PIST01_10"
$Type: "ground"
$Pos: <-88.684 -4.336 -113.351>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_PIST02_10"
$Type: "ground"
$Pos: <-87.586 -4.337 -112.531>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"

$Navpoint: "CS_$root_controller_car_10"
$Type: "ground"
$Pos: <-86.972 -4.232 -113.808>
$Orient: [I]
+Uses_Slate: "slate_lc03_s01_row"


// Slate: slate_church_dexroom

$Navpoint: "CS_slate_church_dexroom_43"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_dex_43"
$Type: "ground"
$Pos: <-3.279 0.0 -0.369>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_saint1_43"
$Type: "ground"
$Pos: <-4.767 0.05 -0.798>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_pc01_43"
$Type: "ground"
$Pos: <-3.984 0.0 0.855>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_PIST01_43"
$Type: "ground"
$Pos: <-86.531 -4.336 -114.192>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$root_controller_PIST02_43"
$Type: "ground"
$Pos: <-87.481 -4.337 -109.507>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_church_dexroom"

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

$Human: "CS_dex"
$Char type: "ts_b_m_dex-01"
$Start nav: "CS_$root_controller_dex_1"

$Human: "CS_snt1"
$Char type: "ts_x_m_cutscenekilla"
$Start nav: "CS_$root_controller_saint1_1"
+Variant: "Lc03"

$Human: "CS_pist01"
$Char type: "cs_cs_pistol"
$Start nav: "CS_$root_controller_PIST01_1"

$Human: "CS_pist02"
$Char type: "cs_cs_pistol"
$Start nav: "CS_$root_controller_PIST02_1"

$Human: "CS_ang"
$Char type: "lc_l_m_angelolopez-01"
$Start nav: "CS_$root_controller_ang_10"

$Human: "CS_vic"
$Char type: "lc_l_m_victorrodriguez"
$Start nav: "CS_$root_controller_vic_10"

$Human: "CS_snt2"
$Char type: "ts_x_m_thug1-01"
$Start nav: "CS_$root_controller_saint2_10"

$Human: "CS_snt3"
$Char type: "ts_x_m_thug2-01b"
$Start nav: "CS_$root_controller_saint3_10"

$Human: "CS_snt4"
$Char type: "ts_x_m_thug2-01"
$Start nav: "CS_$root_controller_saint4_10"

$Human: "CS_snt5"
$Char type: "ts_x_m_thug1-01"
$Start nav: "CS_$root_controller_saint5_10"

$Human: "CS_car"
$Char type: "cs_lc03_std06"
$Start nav: "CS_$root_controller_car_10"

#End
