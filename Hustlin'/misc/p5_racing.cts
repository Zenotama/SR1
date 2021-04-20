// -------
#Navpoints
// -------

$Navpoint: "JH_$CharacterNav01"
$Type:		"ground"
$Pos:		<-100.358 0.0 -32.096>
$Orient:	[I]

$Navpoint: "JH_$root_controller_tyrell01"
$Type:		"ground"
$Pos:		<-102.218 0.011 -32.556>
$Orient:	[I]

$Navpoint: "JH_$root_controller_player01"
$Type:		"ground"
$Pos:		<-91.864 -0.024 -32.107>
$Orient:	[I]

$Navpoint:	"JH_$vehicle000"
$Type:		"ground"
$Pos:			<-102.802330 0.000300 -35>
$Orient:		[I]
+Chunk:		"phasefive"

$Navpoint:	"phasefive_$vehicle000"
$Type:		"ground"
$Pos:			<-93.109726 0.000301 -36.824848>
$Orient:		[1.413730]
+Chunk:		"phasefive"

$Navpoint: "JH_$CutsceneArea01"
$Type:		"ground"
$Pos:		<-96.944 2.123 -31.954>
$Orient:	[I]


// -------
#Cutscene
// -------

$Cutscene:	"JH_CutsceneArea01"
$Start nav:	"JH_$CutsceneArea01"
$Box size:	-10.2998 -2.14961 -4.54195 10.2998 2.14961 4.54195


// -------
#Vehicles
// -------

$Vehicle:		"JH_car_2dr_compact04#000"
$Vehicle type:	"car_2dr_compact04"
$Start nav:		"JH_$vehicle000"
$Stream Distance:			50.000


$Vehicle:		"phasefive_car_2dr_muscle02#000"
$Vehicle type:	"car_2dr_muscle02"
$Start nav:		"phasefive_$vehicle000"
$Stream Distance:			50.000
+Persistent


// -------
#Humans
// -------

$Human:	"JH_tyrell"
$Char type:	"PCLvl2_Black"
$Start nav:	"JH_$CharacterNav01"
+Hit points:	250
+Knockdown points:	40
+Item:	"cellphone"
+Notoriety:	0
+Skill Level:	2
+Aggressiveness:	1
+Self-preservation:	0
+StreamLoadDistance:	50.000000


#End
