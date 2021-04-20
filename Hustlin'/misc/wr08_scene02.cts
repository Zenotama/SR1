// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-787.2802 0.0000 246.9183>
$Orient:	[I]



$Navpoint: "CS_slate_wr08_scene02_1"
$Type:		"ground"
$Pos:		<-787.28 0.0 246.918>
$Orient:	[I]
+Slate_Name:	"slate_wr08_scene02"

$Navpoint: "CS_cs_wr08_scene02_shot_1"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

$Navpoint: "CS_$root_controller_julcar01_1"
$Type:		"ground"
$Pos:		<-603.31 6.752 188.198>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

$Navpoint: "CS_$root_controller_julius_1"
$Type:		"ground"
$Pos:		<-603.434 6.811 187.794>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

$Navpoint: "CS_$root_controller_pc01_1"
$Type:		"ground"
$Pos:		<-603.057 6.772 188.618>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

$Navpoint: "CS_$root_controller_pist01_1"
$Type:		"ground"
$Pos:		<-603.057 6.772 188.618>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

$Navpoint: "CS_$root_controller_price_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

$Navpoint: "CS_$root_controller_pricecar01_1"
$Type:		"ground"
$Pos:		<-626.665 6.768 191.265>
$Orient:	[I]
+Uses_Slate:	"slate_wr08_scene02"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_julcar"
$Char type:	"cs_Car_Julius"
$Start nav:	"CS_$root_controller_julcar01_1"

$Human:	"CS_julius"
$Char type:	"TS_B_M_Julius"
$Start nav:	"CS_$root_controller_julius_1"

$Human:	"CS_pist"
$Char type:	"CS_SFalcon"
$Start nav:	"CS_$root_controller_pist01_1"

$Human:	"CS_price"
$Char type:	"WR_W_M_JosephPrice"
$Start nav:	"CS_$root_controller_price_1"

$Human:	"CS_pricecar"
$Char type:	"CS_Car_JPrice"
$Start nav:	"CS_$root_controller_pricecar01_1"

// -------
#Effects
// -------

$Effect: "cs_wr08_scene02"

#End
