// -------
#Navpoints
// -------

$Navpoint: "CS_$cutsceneInfo01"
$Type:		"ground"
$Pos:		<0 0 0>
$Orient:	[I]

$Navpoint: "CS_$Paparazzi01_$root_controller_MAL2"
$Type:		"ground"
$Pos:		<-0.032 0.0 -0.038>
$Orient:	[I]

// -------
#Cutscene
// -------

$Offset Nav: "CS_$cutsceneInfo01"
$Level nav: "cutPosition"

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_pappa"
$Char type:	"AC_W_M_Escort-Papparraz"
$Start nav:	"CS_$Paparazzi01_$root_controller_MAL2"
+Item:	"Camera"

#End
