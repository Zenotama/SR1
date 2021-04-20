// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<363.4744 -4.0595 1246.9589>
$Orient:	[I]



$Navpoint: "CS_$slate_strip_lot_1"
$Type:		"ground"
$Pos:		<0.0 0.0 -0.001>
$Orient:	[I]
+Slate_Name:	"slate_strip_lot"

$Navpoint: "CS_$root_controller_DEX01_1"
$Type:		"ground"
$Pos:		<-9.324 0.209 0.499>
$Orient:	[I]
+Uses_Slate:	"slate_strip_lot"

$Navpoint: "CS_$root_controller_PC01_1"
$Type:		"ground"
$Pos:		<-10.187 0.209 0.637>
$Orient:	[I]
+Uses_Slate:	"slate_strip_lot"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_dex"
$Char type:	"TS_B_M_Dex-01"
$Start nav:	"CS_$root_controller_DEX01_1"
+Item:	"ak47"

// -------
#Effects
// -------


#End
