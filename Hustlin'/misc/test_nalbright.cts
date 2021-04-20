// -------
#Navpoints
// -------

$Navpoint: "CS_$Cutscene_Offset"
$Type:		"ground"
$Pos:		<2.538 0.0 -1.523>
$Orient:	[I]

$Navpoint: "CS_$root_controller_MAL2"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]

$Navpoint: "test_effect_navpoint"
$Type:		"ground"
$Pos:		<5.0 0.0 0.0>
$Orient:	[I]

// -------
#Cutscene
// -------

$Offset nav: "CS_$Cutscene_Offset"
$Level nav: "cutsceneInfo01"

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_testName"
$Char type:	"LW_X_M_Officer_01"
$Start nav:	"CS_$root_controller_MAL2"
+Item:	"stun_gun"

#End
