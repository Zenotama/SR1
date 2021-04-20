// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-768.7840 12.8731 286.0918>
$Orient:	[I]



$Navpoint: "CS_slate_pawnshop_saintsrow_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_pawnshop_saintsrow"

$Navpoint: "CS_$root_controller_Beerstein_1"
$Type:		"ground"
$Pos:		<-3.784 0.0 -1.612>
$Orient:	[I]
+Uses_Slate:	"slate_pawnshop_saintsrow"

$Navpoint: "CS_$root_controller_matt01_1"
$Type:		"ground"
$Pos:		<-3.503 0.098 -1.933>
$Orient:	[I]
+Uses_Slate:	"slate_pawnshop_saintsrow"

$Navpoint: "CS_$root_controller_pc01_1"
$Type:		"ground"
$Pos:		<-3.525 0.003 2.085>
$Orient:	[I]
+Uses_Slate:	"slate_pawnshop_saintsrow"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_beerstein"
$Char type:	"cs_beerstein"
$Start nav:	"CS_$root_controller_Beerstein_1"

$Human:	"CS_matt"
$Char type:	"AC_W_M_Theft-Matt"
$Start nav:	"CS_$root_controller_matt01_1"
+Item:	"liquorbottle"
+Rank: 0

// -------
#Effects
// -------


#End
