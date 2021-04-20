// -------
#Navpoints
// -------

$Navpoint: "JS_$root_controller_Johnny01"
$Type:		"ground"
$Pos:		<-72.91 0.142 -13.803>
$Orient:	[I]

$Navpoint: "JS_$root_controller_Player01"
$Type:		"ground"
$Pos:		<-72.762 0.112 -18.901>
$Orient:	[6.27921]

$Navpoint: "JS_$root_controller_Player02"
$Type:		"ground"
$Pos:		<-72.3 0.112 -16.278>
$Orient:	[6.28313]

$Navpoint: "JH_$CutsceneArea01"
$Type:		"ground"
$Pos:		<-75.336 6.545 -12.206>
$Orient:	[I]

// -------
#Cutscene
// -------

$Cutscene:	"JH_CutsceneArea01"
$Start nav:	"JH_$CutsceneArea01"
$Box size:	-11.061 -6.38398 -9.26895 11.061 6.38398 9.26895

// -------
#Humans
// -------

$Human:	"JS_JohnnyNavpoint"
$Char type:	"RollerLvl3a"
$Start nav:	"JS_$CharacterNav01"
+Hit points:	25000
+Knockdown points:	40
+Item:	"ak47"
+Notoriety:	0
+Skill Level:	2
+Aggressiveness:	1
+Self-preservation:	0
+Team:					"Playas"
+StreamLoadDistance:	50.000000

#End
