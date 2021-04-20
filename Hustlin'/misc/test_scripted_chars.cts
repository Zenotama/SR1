// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]



$Navpoint: "CS_$slate_test_scriptchars_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_test_scriptchars"

$Navpoint: "CS_$root_controller_PC01_1"
$Type:		"ground"
$Pos:		<-2.041 0.002 -2.664>
$Orient:	[I]
+Uses_Slate:	"slate_test_scriptchars"

$Navpoint: "CS_$CharacterNav01_1"
$Type:		"ground"
$Pos:		<-0.099 0.0 -2.869>
$Orient:	[5.93412]
+Uses_Slate:	"slate_test_scriptchars"

$Navpoint: "CS_$pathNav-walker01-01_1"
$Type:		"ground"
$Pos:		<-2.241 0.0 1.105>
$Orient:	[0.698132]
+Uses_Slate:	"slate_test_scriptchars"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_walker01"
$Char type:	"PD_X_M_HighIncome"
$Start nav:	"CS_$CharacterNav01_1"
+Item:	"ak47"

// -------
#Effects
// -------


#End
