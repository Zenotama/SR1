// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-766.9233 3.3019 857.8353>
$Orient:	[I]



$Navpoint: "CS_slate_chopshop_seaport_1"
$Type:		"ground"
$Pos:		<-0.211 0.0 -0.079>
$Orient:	[I]
+Slate_Name:	"slate_chopshop_seaport"

$Navpoint: "CS_$root_controller_Jenny_1"
$Type:		"ground"
$Pos:		<3.068 0.0 8.722>
$Orient:	[I]
+Uses_Slate:	"slate_chopshop_seaport"

$Navpoint: "CS_$root_controller_Miguel_1"
$Type:		"ground"
$Pos:		<1.307 0.0 5.146>
$Orient:	[I]
+Uses_Slate:	"slate_chopshop_seaport"

$Navpoint: "CS_$root_controller_Player01_1"
$Type:		"ground"
$Pos:		<-3.442 0.0 2.96>
$Orient:	[I]
+Uses_Slate:	"slate_chopshop_seaport"

$Navpoint: "CS_VehicleNav01_1"
$Type:		"ground"
$Pos:		<-2.305 0.947 3.796>
$Orient:	[2.71237]
+Uses_Slate:	"slate_chopshop_seaport"

$Navpoint: "CS_chop_sea_area_1"
$Type:		"ground"
$Pos:		<-1.925 3.426 0.437>
$Orient:	[I]
+Uses_Slate:	"slate_chopshop_seaport"

// -------
#Cutscene
// -------

$Cutscene:	"CS_chop_sea_area"
$Start nav:	"CS_chop_sea_area_1"
$Box size:	-20.0967 -4.81821 -20.0967 20.0967 4.81821 20.0967

// -------
#Vehicles
// -------

$Vehicle:	"CS_VehicleNav01"
$Vehicle type:	"car_2dr_muscle03"
$Start nav:	"CS_VehicleNav01_1"
$Stream Distance:	50.000
+Variant: "Standard"

// -------
#Humans
// -------

$Human:	"CS_jenny"
$Char type:	"AC_L_F_Chopshop-Jenny"
$Start nav:	"CS_$root_controller_Jenny_1"

$Human:	"CS_miguel"
$Char type:	"AC_L_M_Chopshop-Miguel"
$Start nav:	"CS_$root_controller_Miguel_1"

// -------
#Effects
// -------


#End
