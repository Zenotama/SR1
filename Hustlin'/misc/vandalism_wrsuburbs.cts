// -------
#Navpoints
// -------


// Slate: slate_popclub

$Navpoint: "CS_slate_popclub_1"
$Type: "ground"
$Pos: <2.432 -0.569 -1.749>
$Orient: [I]
+Slate_Name: "slate_popclub"

$Navpoint: "CS_CSCharnav-stander01_1"
$Type: "ground"
$Pos: <-4.912 0.0 -3.675>
$Orient: [5.34868]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_CSCharnav-walker03_1"
$Type: "ground"
$Pos: <-5.871 0.0 -2.439>
$Orient: [2.14498]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_$root_controller_player_1"
$Type: "ground"
$Pos: <-2.953 0.0 -0.84>
$Orient: [I]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_jackson01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <-2.102 0.0 -0.33>
$Orient: [I]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_reno01_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <2.793 0.0 1.869>
$Orient: [I]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_$root_controller_SkinnyHoA01_1"
$Type: "ground"
$Pos: <2.315 0.0 2.356>
$Orient: [I]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_$root_controller_SkinnyHoB01_1"
$Type: "ground"
$Pos: <3.127 0.0 1.434>
$Orient: [I]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_$root_controller_Table01_1"
$Type: "ground"
$Pos: <2.145 0.0 0.395>
$Orient: [I]
+Uses_Slate: "slate_popclub"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <2.432 -0.569 -1.749>
$Orient: [I]
+Uses_Slate: "slate_popclub"

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

$Human: "CS_stander01"
$Char type: "pd_x_f_genericyoung-02"
$Start nav: "CS_CSCharnav-stander01_1"

$Human: "CS_walker03"
$Char type: "pd_x_f_genericyoung-01"
$Start nav: "CS_CSCharnav-walker03_1"

$Human: "CS_jackson"
$Char type: "AC_B_M_Vandalism-Jack"
$Start nav: "CS_jackson01_$root_controller_MAL2_1"

$Human: "CS_reno"
$Char type: "AC_B_M_Vandalism-Reno"
$Start nav: "CS_reno01_$root_controller_MAL2_1"

$Human: "CS_skinnyHoA"
$Char type: "pd_x_f_skinnyho"
$Start nav: "CS_$root_controller_SkinnyHoA01_1"
+Variant: "white ho"

$Human: "CS_skinnyHoB"
$Char type: "pd_x_f_ho-03"
$Start nav: "CS_$root_controller_SkinnyHoB01_1"
+Variant: "asian ho"

$Human: "CS_table"
$Char type: "cs_reno_table"
$Start nav: "CS_$root_controller_Table01_1"

#End
