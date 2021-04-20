// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<259.0204 23.3843 -1923.9430>
$Orient:	[I]



$Navpoint: "CS_$slate_drug_suburbs_1"
$Type:		"ground"
$Pos:		<-0.001 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_drug_suburbs"

$Navpoint: "CS_$root_controller_FEM1_1"
$Type:		"ground"
$Pos:		<-0.128 0.157 5.351>
$Orient:	[I]
+Uses_Slate:	"slate_drug_suburbs"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<0.084 0.166 3.416>
$Orient:	[I]
+Uses_Slate:	"slate_drug_suburbs"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_laura"
$Char type:	"AC_W_F_Drugs-laura"
$Start nav:	"CS_$root_controller_FEM1_1"
+Item:	"ak47"

// -------
#Effects
// -------


#End
