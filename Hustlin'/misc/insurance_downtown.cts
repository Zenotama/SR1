// -------
#Navpoints
// -------


// Slate: slate_ins_down

$Navpoint: "CS_slate_ins_down_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_ins_down"

$Navpoint: "CS_$root_controller_PC01_1"
$Type: "ground"
$Pos: <0.051 0.0 1.638>
$Orient: [I]
+Uses_Slate: "slate_ins_down"

$Navpoint: "CS_$root_controller_lee_1"
$Type: "ground"
$Pos: <0.756 0.0 -2.912>
$Orient: [I]
+Uses_Slate: "slate_ins_down"

$Navpoint: "CS_$root_controller_LeatherChair01_1"
$Type: "ground"
$Pos: <0.732 0.0 -2.893>
$Orient: [I]
+Uses_Slate: "slate_ins_down"

$Navpoint: "CS_$root_controller_LeatherChair02_1"
$Type: "ground"
$Pos: <-0.197 0.0 -0.839>
$Orient: [I]
+Uses_Slate: "slate_ins_down"

$Navpoint: "CS_$root_controller_phone_1"
$Type: "ground"
$Pos: <1.074 0.0 -2.376>
$Orient: [I]
+Uses_Slate: "slate_ins_down"

$Navpoint: "CS_area_insurance_downtown_1"
$Type: "ground"
$Pos: <0.19 1.094 2.934>
$Orient: [I]
+Uses_Slate: "slate_ins_down"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_insurance_downtown"
$Start nav: "CS_area_insurance_downtown_1"
$Box size: -5.61614 -3.0582 -15.5009 5.61614 3.0582 15.5009

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_lee"
$Char type: "AC_B_M_Fraud-Lee"
$Start nav: "CS_$root_controller_lee_1"

$Human: "CS_chair02"
$Char type: "cs_chair_leather"
$Start nav: "CS_$root_controller_LeatherChair01_1"

$Human: "CS_chair01"
$Char type: "cs_chair_leather"
$Start nav: "CS_$root_controller_LeatherChair02_1"

$Human: "CS_phone"
$Char type: "cs_blackphone"
$Start nav: "CS_$root_controller_phone_1"

#End
