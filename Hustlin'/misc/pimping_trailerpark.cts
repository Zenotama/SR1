// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<923.6725 -3.9070 80.5545>
$Orient:	[I]



$Navpoint: "CS_slate_pimp_trailer_1"
$Type:		"ground"
$Pos:		<-0.001 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_pimp_trailer"

$Navpoint: "CS_$root_controller_BeerCan01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_pimp_trailer"

$Navpoint: "CS_$root_controller_CanPyramid01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_pimp_trailer"

$Navpoint: "CS_$root_controller_PatioChair01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_pimp_trailer"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<3.773 0.081 -0.095>
$Orient:	[I]
+Uses_Slate:	"slate_pimp_trailer"

$Navpoint: "CS_Brian01_$root_controller_HVY2_1"
$Type:		"ground"
$Pos:		<-0.571 0.632 2.121>
$Orient:	[I]
+Uses_Slate:	"slate_pimp_trailer"

$Navpoint: "CS_area_pimping_trailerpark_1"
$Type:		"ground"
$Pos:		<0.413 2.966 -0.119>
$Orient:	[I]
+Uses_Slate:	"slate_pimp_trailer"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_pimping_trailerpark"
$Start nav:	"CS_area_pimping_trailerpark_1"
$Box size:	-5.39735 -5.39735 -5.39735 5.39735 5.39735 5.39735

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_beercan"
$Char type:	"cs_beercan"
$Start nav:	"CS_$root_controller_BeerCan01_1"

$Human:	"CS_CanPyramid"
$Char type:	"cs_canpyramid"
$Start nav:	"CS_$root_controller_CanPyramid01_1"

$Human:	"CS_chair"
$Char type:	"cs_trailerchair"
$Start nav:	"CS_$root_controller_PatioChair01_1"

$Human:	"CS_brian"
$Char type:	"AC_W_M_Pimping-Brian"
$Start nav:	"CS_Brian01_$root_controller_HVY2_1"

// -------
#Effects
// -------


#End
