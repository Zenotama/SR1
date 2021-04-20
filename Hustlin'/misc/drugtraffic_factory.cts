// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-724.0682 7.7610 607.3065>
$Orient:	[I]



$Navpoint: "CS_slate_drug_factory_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_drug_factory"

$Navpoint: "CS_$root_controller_billy_1"
$Type:		"ground"
$Pos:		<0.58 0.0 1.403>
$Orient:	[I]
+Uses_Slate:	"slate_drug_factory"

$Navpoint: "CS_$root_controller_Player01 cShoe_sneakers_1"
$Type:		"ground"
$Pos:		<1.603 0.0 -3.633>
$Orient:	[I]
+Uses_Slate:	"slate_drug_factory"

$Navpoint: "CS_$root_controller_tobias_1"
$Type:		"ground"
$Pos:		<1.299 0.0 1.915>
$Orient:	[I]
+Uses_Slate:	"slate_drug_factory"

$Navpoint: "CS_drug_factory_area_1"
$Type:		"ground"
$Pos:		<0.973 1.633 -1.811>
$Orient:	[I]
+Uses_Slate:	"slate_drug_factory"

// -------
#Cutscene
// -------

$Cutscene:	"CS_drug_factory_area"
$Start nav:	"CS_drug_factory_area_1"
$Box size:	-16.6728 -2.4089 -16.6728 16.6728 2.4089 16.6728

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_billy"
$Char type:	"PD_X_M_Hustler-01"
$Start nav:	"CS_$root_controller_billy_1"
+Variant:	"white_collar"

$Human:	"CS_tobias"
$Char type:	"AC_W_M_Drugs-Tobias"
$Start nav:	"CS_$root_controller_tobias_1"
+Item:	"beretta"
+Rank: 0

// -------
#Effects
// -------


#End
