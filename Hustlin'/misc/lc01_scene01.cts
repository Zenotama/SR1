// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-761.6723 -2.0685 75.2462>
$Orient:	[I]



$Navpoint: "CS_slate_church_dexroom_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_church_dexroom"

$Navpoint: "CS_$root_controller_dex_1"
$Type:		"ground"
$Pos:		<-1.333 0.0 -1.89>
$Orient:	[I]
+Uses_Slate:	"slate_church_dexroom"

$Navpoint: "CS_$root_controller_player01 cShoe_sneakers_1"
$Type:		"ground"
$Pos:		<-4.152 0.0 -1.53>
$Orient:	[I]
+Uses_Slate:	"slate_church_dexroom"

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
$Start nav:	"CS_$root_controller_dex_1"

// -------
#Effects
// -------


#End
