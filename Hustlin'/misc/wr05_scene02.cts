// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<329.8028 34.3223 -2097.5488>
$Orient:	[I]



$Navpoint: "CS_slate_smansion_main_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_smansion_main"

$Navpoint: "CS_$root_controller_CELL01_1"
$Type:		"ground"
$Pos:		<-0.974 0.0 3.435>
$Orient:	[I]
+Uses_Slate:	"slate_smansion_main"

$Navpoint: "CS_$root_controller_price01_1"
$Type:		"ground"
$Pos:		<0.682 0.0 3.213>
$Orient:	[I]
+Uses_Slate:	"slate_smansion_main"

$Navpoint: "CS_$root_controller_sharp01_1"
$Type:		"ground"
$Pos:		<0.934 0.0 4.781>
$Orient:	[I]
+Uses_Slate:	"slate_smansion_main"

$Navpoint: "CS_$root_controller_Chair01_1"
$Type:		"ground"
$Pos:		<0.866 0.0 4.739>
$Orient:	[I]
+Uses_Slate:	"slate_smansion_main"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_cell"
$Char type:	"CS_cellphone"
$Start nav:	"CS_$root_controller_CELL01_1"

$Human:	"CS_Price"
$Char type:	"WR_W_M_JosephPrice"
$Start nav:	"CS_$root_controller_price01_1"

$Human:	"CS_Sharp"
$Char type:	"WR_W_M_Sharp"
$Start nav:	"CS_$root_controller_sharp01_1"

$Human:	"CS_chair"
$Char type:	"cs_pricechair"
$Start nav:	"CS_$root_controller_Chair01_1"

// -------
#Effects
// -------


#End
