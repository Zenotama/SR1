// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<510.8795 9.3475 974.8868>
$Orient:	[I]



$Navpoint: "CS_$slate_angelo_bedroom_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_angelo01_1"
$Type:		"ground"
$Pos:		<0.547 -0.899 -0.298>
$Orient:	[I]
+Uses_Slate:	"slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_luz01_1"
$Type:		"ground"
$Pos:		<1.259 -0.9 -0.319>
$Orient:	[I]
+Uses_Slate:	"slate_angelo_bedroom"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_angelo"
$Char type:	"undefined"
$Start nav:	"CS_$root_controller_angelo01_1"
+Item:	"ak47"
$Human:	"CS_luz"
$Char type:	"undefined"
$Start nav:	"CS_$root_controller_luz01_1"
+Item:	"ak47"

// -------
#Effects
// -------


#End
