// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-183.5826 -3.7361 800.2640>
$Orient:	[I]



$Navpoint: "CS_slate_pawnshop_barrio_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_pawnshop_barrio"

$Navpoint: "CS_$root_controller_Javier01_1"
$Type:		"ground"
$Pos:		<2.777 -0.048 0.026>
$Orient:	[I]
+Uses_Slate:	"slate_pawnshop_barrio"

$Navpoint: "CS_$root_controller_Playa01_1"
$Type:		"ground"
$Pos:		<1.465 -0.049 -0.676>
$Orient:	[I]
+Uses_Slate:	"slate_pawnshop_barrio"

$Navpoint: "CS_$root_controller_Spreadsheet01_1"
$Type:		"ground"
$Pos:		<2.372 0.0 0.001>
$Orient:	[I]
+Uses_Slate:	"slate_pawnshop_barrio"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_jav"
$Char type:	"AC_L_M_Theft-Javier"
$Start nav:	"CS_$root_controller_Javier01_1"

$Human:	"CS_sheet"
$Char type:	"cs_spreadsheet"
$Start nav:	"CS_$root_controller_Spreadsheet01_1"

// -------
#Effects
// -------


#End
