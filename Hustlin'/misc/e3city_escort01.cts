// -------
#Groups
// -------

$Group:	"e3city_escort01"

// -------
#Navpoints
// -------

$Navpoint:	"e3city_escort01$start"
$Type:		"ground"
$Pos:			<-110.531288 15.582300 -239.224701>
$Orient:		[I]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01_$nav000"
$Type:		"ground"
$Pos:			<-76.824532 13.593200 -185.152298>
$Orient:		[3.246315]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01_$nav001"
$Type:		"ground"
$Pos:			<-75.550735 13.593199 -187.015640>
$Orient:		[2.530729]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01$pickup1"
$Type:		"ground"
$Pos:			<-36.565929 9.308689 -174.147873>
$Orient:		[4.223698]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01_$vehicle000"
$Type:		"ground"
$Pos:			<-76.442894 13.593197 -189.893555>
$Orient:		[2.513276]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01$pickup2"
$Type:		"ground"
$Pos:			<18.551567 12.947889 -261.807587>
$Orient:		[-0.593412]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01_warp"
$Type:		"ground"
$Pos:			<-73.160011 13.593200 -189.707199>
$Orient:		[4.642576]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01_$drop2"
$Type:		"ground"
$Pos:			<15.327053 12.873594 -257.546082>
$Orient:		[0.558505]
+Chunk:		"e3_chunk02"

$Navpoint:	"e3city_escort01_$drop1"
$Type:		"ground"
$Pos:			<-43.505463 9.032936 -177.406616>
$Orient:		[I]
+Chunk:		"e3_chunk02"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

// -------
#Vehicles
// -------

$Vehicle:		"e3city_escort01$limo1"
$Vehicle type:	"car_4dr_luxury01"
$Start nav:		"e3city_escort01_$vehicle000"
$Group:			"e3city_escort01"
$Stream Distance:			50.000
+Variant: "Escort"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"e3city_escort01$stripper"
$Char type:				"Stripper-Black"
$Start nav:				"e3city_escort01_$nav000"
+Hit points:			150
+Knockdown points:	50
+Skill level:			1
+Aggressiveness:		0
+Self-preservation:	3
+Hearing distance:	0.00
+Leash distance:		0.00
+Team:					"Civilian"
+StreamLoadDistance:	50.000000
+Group:					"e3city_escort01"

$Human:					"e3city_escort01$client1"
$Char type:				"PD_X_M_HighIncome"
$Start nav:				"e3city_escort01$pickup2"
+Hit points:			100
+Knockdown points:	40
+Skill level:			1
+Aggressiveness:		0
+Self-preservation:	2
+Hearing distance:	0.00
+Leash distance:		0.00
+Team:					"Civilian"
+StreamLoadDistance:	50.000000
+Group:					"e3city_escort01"

// -------
#Shopkeeper
// -------

// -------
#Spawn NPC Regions
// -------

// -------
#Racing
// -------

// -------
#Strongholds
// -------

// -------
#Special Spawns
// -------

// -------
#Parking
// -------

// -------
#Chunk Streaming Test Cases
// -------

// -------
#Ambients
// -------

// -------
#Nodes
// -------

#End
