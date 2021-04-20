// -------
#Navpoints
// -------

$Navpoint: "JS_$CharacterNav01"
$Type:		"ground"
$Pos:		<-72.969 0.14 -15.531>
$Orient:	[3.13736]
+Chunk:	"phasefive"

$Navpoint: "JS_$exec_combat_trigger"
$Type:		"ground"
$Pos:		<-72.295 0.87 -19.659>
$Orient:	[I]
+Chunk:	"phasefive"

// -------
#Triggers
// -------

$Trigger:	"JS_exec_combat_trigger"
$Trigger type:	"bounding box"
$Trigger action:	"execute lua script"
$Trigger max fires:	1
$Trigger delay:	1000
$Start nav:	"JS_$exec_combat_trigger"
$Box size:	-2.51068 -0.737067 -0.436204 2.51068 0.737067 0.436204

// -------
#Vehicles
// -------


#End
