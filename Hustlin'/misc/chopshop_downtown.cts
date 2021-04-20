// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<20.7963 21.2178 -1306.2878>
$Orient:	[I]



$Navpoint: "CS_slate_chopsop_downtown_1"
$Type:		"ground"
$Pos:		<0.604 0.141 0.0>
$Orient:	[I]
+Slate_Name:	"slate_chopsop_downtown"

$Navpoint: "CS_$root_controller_pc01 cShoe_basketball_1"
$Type:		"ground"
$Pos:		<0.104 0.003 -2.429>
$Orient:	[I]
+Uses_Slate:	"slate_chopsop_downtown"

$Navpoint: "CS_$root_controller_Samson01_1"
$Type:		"ground"
$Pos:		<-2.547 0.013 1.84>
$Orient:	[I]
+Uses_Slate:	"slate_chopsop_downtown"

$Navpoint: "CS_$root_controller_plate01_1"
$Type:		"ground"
$Pos:		<-2.243 0.0 1.103>
$Orient:	[I]
+Uses_Slate:	"slate_chopsop_downtown"

$Navpoint: "CS_$root_controller_NewCar01_1"
$Type:		"ground"
$Pos:		<-2.163 0.066 -1.122>
$Orient:	[I]
+Uses_Slate:	"slate_chopsop_downtown"

$Navpoint: "CS_$root_controller_Rag01_1"
$Type:		"ground"
$Pos:		<-2.307 0.0 1.218>
$Orient:	[I]
+Uses_Slate:	"slate_chopsop_downtown"

$Navpoint: "CS_area_chop_down_1"
$Type:		"ground"
$Pos:		<-2.43 3.277 0.422>
$Orient:	[I]
+Uses_Slate:	"slate_chopsop_downtown"

// -------
#Cutscene
// -------

$Cutscene:	"CS_area_chop_down"
$Start nav:	"CS_area_chop_down_1"
$Box size:	-15.7052 -4.17376 -15.7052 15.7052 4.17376 15.7052

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_samson"
$Char type:	"AC_B_M_ChopShop-Sampson"
$Start nav:	"CS_$root_controller_Samson01_1"

$Human:	"CS_plate"
$Char type:	"CS_lisplate"
$Start nav:	"CS_$root_controller_plate01_1"

$Human:	"CS_car"
$Char type:	"cs_4dr_sports_riced"
$Start nav:	"CS_$root_controller_NewCar01_1"
+Variant:	"Riced"

$Human:	"CS_Rag"
$Char type:	"cs_rag"
$Start nav:	"CS_$root_controller_Rag01_1"

// -------
#Effects
// -------


#End
