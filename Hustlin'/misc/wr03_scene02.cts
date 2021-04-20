// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<718.7262 -3.5945 338.1851>
$Orient:	[I]



$Navpoint: "CS_slate_wr03_scene02_1"
$Type:		"ground"
$Pos:		<0.0 -0.161 0.0>
$Orient:	[I]
+Slate_Name:	"slate_wr03_scene02"

$Navpoint: "CS_$root_controller_don01_1"
$Type:		"ground"
$Pos:		<-0.077 -0.203 -12.065>
$Orient:	[I]
+Uses_Slate:	"slate_wr03_scene02"

$Navpoint: "CS_$root_controller_lin01_1"
$Type:		"ground"
$Pos:		<6.299 0.0 4.528>
$Orient:	[I]
+Uses_Slate:	"slate_wr03_scene02"

$Navpoint: "CS_$root_controller_lincar01_1"
$Type:		"ground"
$Pos:		<6.356 -0.576 4.995>
$Orient:	[I]
+Uses_Slate:	"slate_wr03_scene02"

$Navpoint: "CS_$root_controller_pc01_1"
$Type:		"ground"
$Pos:		<1.081 -0.418 -12.065>
$Orient:	[I]
+Uses_Slate:	"slate_wr03_scene02"

$Navpoint: "CS_wr03_scene02_area_1"
$Type:		"ground"
$Pos:		<1.566 2.723 -11.341>
$Orient:	[I]
+Uses_Slate:	"slate_wr03_scene02"

$Navpoint: "CS_$root_controller_Door01_1"
$Type:		"ground"
$Pos:		<-1.716 -0.282 -11.848>
$Orient:	[I]
+Uses_Slate:	"slate_wr03_scene02"

// -------
#Cutscene
// -------

$Cutscene:	"CS_wr03_scene02_area"
$Start nav:	"CS_wr03_scene02_area_1"
$Box size:	-31.3318 -5.28517 -31.3318 31.3318 5.28517 31.3318

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_donnie"
$Char type:	"WR_A_M_Donnie-01"
$Start nav:	"CS_$root_controller_don01_1"

$Human:	"CS_lin"
$Char type:	"TS_A_F_Lin"
$Start nav:	"CS_$root_controller_lin01_1"
+Item:	"mac10l"
+Rank: 0

$Human:	"CS_linscar"
$Char type:	"cs_LinsCar"
$Start nav:	"CS_$root_controller_lincar01_1"

$Human:	"CS_door"
$Char type:	"cs_warehousedoor"
$Start nav:	"CS_$root_controller_Door01_1"

// -------
#Effects
// -------


#End
