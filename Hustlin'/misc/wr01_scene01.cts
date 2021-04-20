// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<651.7447 -3.7361 -594.9369>
$Orient:	[I]



$Navpoint: "CS_slate_racing_ashland_1"
$Type:		"ground"
$Pos:		<0.0 0.102 0.0>
$Orient:	[I]
+Slate_Name:	"slate_racing_ashland"

$Navpoint: "CS_cs_wr01_scene01_shot_1"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_carlin01_1"
$Type:		"ground"
$Pos:		<4.791 0.002 0.801>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_cig01_1"
$Type:		"ground"
$Pos:		<1.414 0.0 2.59>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_lin01_1"
$Type:		"ground"
$Pos:		<1.475 0.0 2.989>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_pc01_1"
$Type:		"ground"
$Pos:		<13.461 0.0 1.117>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_rollerA01_1"
$Type:		"ground"
$Pos:		<-0.085 0.0 3.178>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_rollerB01_1"
$Type:		"ground"
$Pos:		<0.805 0.0 2.657>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_area_racing_ashland_1"
$Type:		"ground"
$Pos:		<3.638 3.897 2.335>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_racing_ashland"
$Start nav:	"CS_area_racing_ashland_1"
$Box size:	-18.4222 -5.59467 -28.4056 18.4222 5.59467 28.4056

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_car"
$Char type:	"cs_LinsCar"
$Start nav:	"CS_$root_controller_carlin01_1"

$Human:	"CS_cig"
$Char type:	"CS_cigarette01"
$Start nav:	"CS_$root_controller_cig01_1"

$Human:	"CS_lin"
$Char type:	"TS_A_F_Lin"
$Start nav:	"CS_$root_controller_lin01_1"

$Human:	"CS_ra01"
$Char type:	"WR_X_M_Thug1-01"
$Start nav:	"CS_$root_controller_rollerA01_1"
+Variant:	"wr1cutscene"

$Human:	"CS_rb01"
$Char type:	"WR_X_M_Thug1-02"
$Start nav:	"CS_$root_controller_rollerB01_1"
+Variant:	"intro_wrc"

// -------
#Effects
// -------

#End
