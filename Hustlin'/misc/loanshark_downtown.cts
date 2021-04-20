// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-480.2952 55.5065 -758.5252>
$Orient:	[I]



$Navpoint: "CS_slate_loanshark_downtown_1"
$Type:		"ground"
$Pos:		<0.532 0.01 -0.787>
$Orient:	[I]
+Slate_Name:	"slate_loanshark_downtown"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<0.564 -0.002 0.936>
$Orient:	[I]
+Uses_Slate:	"slate_loanshark_downtown"

$Navpoint: "CS_$root_controller_Vinnie01_1"
$Type:		"ground"
$Pos:		<-1.886 0.051 -1.713>
$Orient:	[I]
+Uses_Slate:	"slate_loanshark_downtown"

$Navpoint: "CS_BlackPhone01_$root_controller_ITEM_1"
$Type:		"ground"
$Pos:		<-1.227 0.0 -1.642>
$Orient:	[I]
+Uses_Slate:	"slate_loanshark_downtown"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_vinnie"
$Char type:	"AC_W_M_LoanShark_Vin"
$Start nav:	"CS_$root_controller_Vinnie01_1"

$Human:	"CS_blackphone"
$Char type:	"cs_blackphone"
$Start nav:	"CS_BlackPhone01_$root_controller_ITEM_1"

// -------
#Effects
// -------


#End
