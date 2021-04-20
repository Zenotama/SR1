// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-752.3552 -1.6848 79.8737>
$Orient:	[I]



$Navpoint: "CS_slate_church_main_1"
$Type:		"ground"
$Pos:		<-5.834 0.317 3.525>
$Orient:	[3.57743]
+Slate_Name:	"slate_church_main"

$Navpoint: "CS_$root_controller_julius_1"
$Type:		"ground"
$Pos:		<-0.698 0.0 -2.273>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<-0.217 0.0 -0.001>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"

$Navpoint: "CS_$root_controller_pccell01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_main"



$Navpoint: "CS_slate_wr_poolhall_room_6"
$Type:		"ground"
$Pos:		<99.687 0.125 1.196>
$Orient:	[3.14159]
+Slate_Name:	"slate_wr_poolhall_room"

$Navpoint: "CS_$root_controller_cell0201_6"
$Type:		"ground"
$Pos:		<100.243 0.0 0.315>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall_room"

$Navpoint: "CS_$root_controller_sharp01_6"
$Type:		"ground"
$Pos:		<99.629 0.0 0.294>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall_room"

$Navpoint: "CS_$root_controller_lin_6"
$Type:		"ground"
$Pos:		<100.45 0.0 0.232>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall_room"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_julius"
$Char type:	"TS_B_M_Julius"
$Start nav:	"CS_$root_controller_julius_1"

$Human:	"CS_pccell"
$Char type:	"cs_cellphone"
$Start nav:	"CS_$root_controller_pccell01_1"

$Human:	"CS_cell"
$Char type:	"cs_cs_cell02"
$Start nav:	"CS_$root_controller_cell0201_6"

$Human:	"CS_sharp"
$Char type:	"WR_W_M_Sharp"
$Start nav:	"CS_$root_controller_sharp01_6"

$Human:	"CS_lin"
$Char type:	"TS_A_F_Lin"
$Start nav:	"CS_$root_controller_lin_6"

// -------
#Effects
// -------


#End
