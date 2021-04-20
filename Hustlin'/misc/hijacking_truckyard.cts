// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-138.6742 -2.8100 370.0863>
$Orient:	[I]



$Navpoint: "CS_slate_hijack_truck_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_hijack_truck"

$Navpoint: "CS_$root_controller_BNCH_1"
$Type:		"ground"
$Pos:		<4.634 0.0 -4.048>
$Orient:	[I]
+Uses_Slate:	"slate_hijack_truck"

$Navpoint: "CS_$root_controller_Phil01_1"
$Type:		"ground"
$Pos:		<-0.786 0.008 5.221>
$Orient:	[I]
+Uses_Slate:	"slate_hijack_truck"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<2.4 0.031 -9.385>
$Orient:	[I]
+Uses_Slate:	"slate_hijack_truck"

$Navpoint: "CS_$root_controller_CAR4_1"
$Type:		"ground"
$Pos:		<-1.745 0.0 3.194>
$Orient:	[I]
+Uses_Slate:	"slate_hijack_truck"

$Navpoint: "CS_$root_controller_wrench_1"
$Type:		"ground"
$Pos:		<3.514 0.0 -4.121>
$Orient:	[I]
+Uses_Slate:	"slate_hijack_truck"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_workBench"
$Char type:	"CS_workBench"
$Start nav:	"CS_$root_controller_BNCH_1"

$Human:	"CS_Phil"
$Char type:	"AC_W_M_Hijacking-Phil"
$Start nav:	"CS_$root_controller_Phil01_1"

$Human:	"CS_smallCar"
$Char type:	"csCompact04"
$Start nav:	"CS_$root_controller_CAR4_1"

$Human:	"CS_wrench"
$Char type:	"CS_wrench"
$Start nav:	"CS_$root_controller_wrench_1"

// -------
#Effects
// -------


#End
