// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<581.3188 -4.2994 -569.8168>
$Orient:	[I]



$Navpoint: "CS_slate_wr_poolhall_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_wr_poolhall"

$Navpoint: "CS_$root_controller_BAT_rollerz01_1"
$Type:		"ground"
$Pos:		<-5.493 0.0 0.226>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall"

$Navpoint: "CS_$root_controller_CHAIR01_1"
$Type:		"ground"
$Pos:		<-1.576 0.0 -0.198>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall"

$Navpoint: "CS_$root_controller_lin_1"
$Type:		"ground"
$Pos:		<-1.686 0.0 -0.172>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<1.927 0.0 -1.375>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall"

$Navpoint: "CS_$root_controller_rollerz01_1"
$Type:		"ground"
$Pos:		<-5.498 0.0 0.375>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall"

$Navpoint: "CS_$root_controller_sharp01_1"
$Type:		"ground"
$Pos:		<-5.408 0.0 -0.787>
$Orient:	[I]
+Uses_Slate:	"slate_wr_poolhall"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_bat_rollerz"
$Char type:	"CS_Bat"
$Start nav:	"CS_$root_controller_BAT_rollerz01_1"

$Human:	"CS_chair"
$Char type:	"CS_chair_wood_church"
$Start nav:	"CS_$root_controller_CHAIR01_1"

$Human:	"CS_lin"
$Char type:	"TS_A_F_Lin"
$Start nav:	"CS_$root_controller_lin_1"

$Human:	"CS_rollerz"
$Char type:	"WR_X_M_Thug1-01"
$Start nav:	"CS_$root_controller_rollerz01_1"

$Human:	"CS_sharp"
$Char type:	"WR_W_M_Sharp"
$Start nav:	"CS_$root_controller_sharp01_1"

// -------
#Effects
// -------


#End
