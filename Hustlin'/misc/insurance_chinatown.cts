// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<472.3755 -3.6164 694.0983>
$Orient:	[I]



$Navpoint: "CS_slate_ins_china_1"
$Type:		"ground"
$Pos:		<0.0 0.0 -0.001>
$Orient:	[I]
+Slate_Name:	"slate_ins_china"

$Navpoint: "CS_$root_controller_PC01_1"
$Type:		"ground"
$Pos:		<-3.359 0.065 -0.995>
$Orient:	[I]
+Uses_Slate:	"slate_ins_china"

$Navpoint: "CS_$root_controller_SETH_1"
$Type:		"ground"
$Pos:		<-5.396 0.069 -1.303>
$Orient:	[I]
+Uses_Slate:	"slate_ins_china"

$Navpoint: "CS_$root_controller_chair_1"
$Type:		"ground"
$Pos:		<-5.153 0.0 -0.679>
$Orient:	[I]
+Uses_Slate:	"slate_ins_china"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_seth"
$Char type:	"AC_W_M_Fraud-Seth"
$Start nav:	"CS_$root_controller_SETH_1"

$Human:	"CS_chair"
$Char type:	"cs_inschinachair"
$Start nav:	"CS_$root_controller_chair_1"

// -------
#Effects
// -------


#End
