// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-919.3527 15.5942 -339.9524>
$Orient:	[I]



$Navpoint: "CS_slate_wr09_scene04_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_wr09_scene04"

$Navpoint: "CS_cs_wr09_scene04_shot_1"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]
+Uses_Slate:	"slate_wr09_scene04"

$Navpoint: "CS_$root_controller_cell01_1"
$Type:		"ground"
$Pos:		<1.391 0.0 -0.793>
$Orient:	[I]
+Uses_Slate:	"slate_wr09_scene04"

$Navpoint: "CS_$root_controller_keys01_1"
$Type:		"ground"
$Pos:		<-7.436 0.0 -1.447>
$Orient:	[I]
+Uses_Slate:	"slate_wr09_scene04"

$Navpoint: "CS_$root_controller_player01_1"
$Type:		"ground"
$Pos:		<1.394 0.318 -0.787>
$Orient:	[I]
+Uses_Slate:	"slate_wr09_scene04"

$Navpoint: "CS_$root_controller_price01_1"
$Type:		"ground"
$Pos:		<-7.673 -0.125 -1.584>
$Orient:	[I]
+Uses_Slate:	"slate_wr09_scene04"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_cellphone"
$Char type:	"cs_cellphone"
$Start nav:	"CS_$root_controller_cell01_1"

$Human:	"CS_keys"
$Char type:	"cs_keys"
$Start nav:	"CS_$root_controller_keys01_1"

$Human:	"CS_Price"
$Char type:	"WR_W_M_JosephPrice"
$Start nav:	"CS_$root_controller_price01_1"

// -------
#Effects
// -------

#End
