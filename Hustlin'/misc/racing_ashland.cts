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
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_Car101_1"
$Type:		"ground"
$Pos:		<4.833 -0.121 2.05>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_Car201_1"
$Type:		"ground"
$Pos:		<-0.384 -0.127 8.575>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_Car301_1"
$Type:		"ground"
$Pos:		<-4.642 -0.115 -12.898>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_Car401_1"
$Type:		"ground"
$Pos:		<-7.507 -0.129 6.794>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_libby_1"
$Type:		"ground"
$Pos:		<-1.706 0.0 -5.755>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_$root_controller_player_1"
$Type:		"ground"
$Pos:		<-3.398 -0.222 6.908>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

$Navpoint: "CS_area_racing_ashland_1"
$Type:		"ground"
$Pos:		<-1.929 2.028 0.754>
$Orient:	[I]
+Uses_Slate:	"slate_racing_ashland"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_racing_ashland"
$Start nav:	"CS_area_racing_ashland_1"
$Box size:	-60.5725 -4.48805 -59.5936 60.5725 4.48805 59.5936

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_car1"
$Char type:	"cs_2dr_compact_riced"
$Start nav:	"CS_$root_controller_Car101_1"

$Human:	"CS_car2"
$Char type:	"cs_2dr_sports_riced"
$Start nav:	"CS_$root_controller_Car201_1"

$Human:	"CS_car3"
$Char type:	"cs_4dr_sports_riced"
$Start nav:	"CS_$root_controller_Car301_1"

$Human:	"CS_car4"
$Char type:	"cs_2dr_exotic_riced"
$Start nav:	"CS_$root_controller_Car401_1"

$Human:	"CS_Libby"
$Char type:	"AC_W_F_Racing-Libby"
$Start nav:	"CS_$root_controller_libby_1"

// -------
#Effects
// -------


#End
