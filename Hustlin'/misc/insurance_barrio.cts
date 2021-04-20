// -------
#Navpoints
// -------


// Slate: slate_lawoffice_barrio

$Navpoint: "CS_slate_lawoffice_barrio_1"
$Type: "ground"
$Pos: <2.137 0.0 9.753>
$Orient: [I]
+Slate_Name: "slate_lawoffice_barrio"

$Navpoint: "CS_$root_controller_PC01_1"
$Type: "ground"
$Pos: <0.69 0.0 0.214>
$Orient: [I]
+Uses_Slate: "slate_lawoffice_barrio"

$Navpoint: "CS_$root_controller_Raymond01_1"
$Type: "ground"
$Pos: <-0.361 0.0 -2.238>
$Orient: [I]
+Uses_Slate: "slate_lawoffice_barrio"

$Navpoint: "CS_$root_controller_ChairA01_1"
$Type: "ground"
$Pos: <-1.768 0.0 -2.73>
$Orient: [I]
+Uses_Slate: "slate_lawoffice_barrio"

$Navpoint: "CS_$root_controller_ChairB01_1"
$Type: "ground"
$Pos: <-1.703 0.0 0.171>
$Orient: [I]
+Uses_Slate: "slate_lawoffice_barrio"

$Navpoint: "CS_area_insurance_barrio_1"
$Type: "ground"
$Pos: <-1.25 3.14 2.643>
$Orient: [I]
+Uses_Slate: "slate_lawoffice_barrio"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_insurance_barrio"
$Start nav: "CS_area_insurance_barrio_1"
$Box size: -15.505 -5.55963 -15.505 15.505 5.55963 15.505

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_raymond"
$Char type: "AC_B_M_Fraud-Raymond"
$Start nav: "CS_$root_controller_Raymond01_1"

$Human: "CS_ChairA"
$Char type: "cs_insbarriochair"
$Start nav: "CS_$root_controller_ChairA01_1"

$Human: "CS_ChairB"
$Char type: "cs_insbarriochair"
$Start nav: "CS_$root_controller_ChairB01_1"

#End
