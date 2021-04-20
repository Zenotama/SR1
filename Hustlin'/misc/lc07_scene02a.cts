// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-752.3707 28.3456 79.9121>
$Orient:	[I]

$Navpoint: "CS_$slate_lc07_scene02a"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]

$Navpoint: "CS_$root_controller_dex01"
$Type:		"ground"
$Pos:		<0.377 -0.327 -2.316>
$Orient:	[I]

$Navpoint: "CS_$root_controller_troy01"
$Type:		"ground"
$Pos:		<-0.728 -0.327 -2.981>
$Orient:	[I]

$Navpoint: "CS_$root_controller_corpse01"
$Type:		"ground"
$Pos:		<1.107 -0.223 -3.447>
$Orient:	[I]

// -------
#Cutscene
// -------

$Offset Nav: "CS_$slate_lc07_scene02a"
$Level nav: "slate_church_main"

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_dex"
$Char type:	"Stripper-Asian"
$Start nav:	"CS_$root_controller_dex01"
+Item:	"ak47"
$Human:	"CS_troy"
$Char type:	"Stripper-Asian"
$Start nav:	"CS_$root_controller_troy01"
+Item:	"ak47"
$Human:	"CS_corpse"
$Char type:	"Stripper-Asian"
$Start nav:	"CS_$root_controller_corpse01"
+Item:	"ak47"

#End
