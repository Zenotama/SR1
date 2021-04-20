// -------
#Navpoints
// -------


// Slate: slate_brothel_barrio

$Navpoint: "CS_slate_brothel_barrio_1"
$Type: "ground"
$Pos: <-4.932 1.062 -2.021>
$Orient: [I]
+Slate_Name: "slate_brothel_barrio"

$Navpoint: "CS_$root_controller_lor_1"
$Type: "ground"
$Pos: <-0.419 0.049 -0.267>
$Orient: [I]
+Uses_Slate: "slate_brothel_barrio"

$Navpoint: "CS_$root_controller_Player_1"
$Type: "ground"
$Pos: <0.038 0.049 -0.168>
$Orient: [I]
+Uses_Slate: "slate_brothel_barrio"

$Navpoint: "CS_$root_controller_Chair_1"
$Type: "ground"
$Pos: <-0.468 0.0 -3.45>
$Orient: [I]
+Uses_Slate: "slate_brothel_barrio"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-4.932 1.062 -2.021>
$Orient: [I]
+Uses_Slate: "slate_brothel_barrio"

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

$Human: "CS_Loreana"
$Char type: "AC_L_F_Madam-loreana"
$Start nav: "CS_$root_controller_lor_1"

$Human: "CS_chair"
$Char type: "cs_loreana_chair"
$Start nav: "CS_$root_controller_Chair_1"

#End
