// -------
#Groups
// -------

$Group:	"lc_escort01"

// -------
#Navpoints
// -------

$Navpoint:	"lc_escort01_start"
$Type:		"ground"
$Pos:			<409.433258 -3.792290 1285.669434>
$Orient:		[I]
+Chunk:		"sr_chunk14_sc"

$Navpoint:	"lc_escort01_vehicle"
$Type:		"ground"
$Pos:			<387.002136 -4 1305.985474>
$Orient:		[-2.530727]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_warp"
$Type:		"ground"
$Pos:			<390.868378 -3.850000 1298.885132>
$Orient:		[-0.789922]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_strpper"
$Type:		"ground"
$Pos:			<390.143616 -4 1305.450073>
$Orient:		[-1.500984]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_client"
$Type:		"ground"
$Pos:			<398.836823 -4 1300.068604>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_strip_club"
$Type:		"ground"
$Pos:			<400.944580 -3.999999 1295.543945>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_motel"
$Type:		"ground"
$Pos:			<247.269608 -4.081964 1260.434082>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_puke"
$Type:		"ground"
$Pos:			<-134.387299 -3.850103 1076.907837>
$Orient:		[I]
+Chunk:		"sr_chunk15"

$Navpoint:	"lc_escort01_sex_shop"
$Type:		"ground"
$Pos:			<503.008514 -3.850500 467.669342>
$Orient:		[I]
+Chunk:		"sr_chunk12"

$Navpoint:	"lc_escort01_brothel"
$Type:		"ground"
$Pos:			<-174.500000 -4 614.700012>
$Orient:		[I]
+Chunk:		"sr_chunk16"

$Navpoint:	"lc_escort01_pickup_1"
$Type:		"ground"
$Pos:			<123.219101 -3.850269 553.885498>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_drop_1"
$Type:		"ground"
$Pos:			<120.161316 -3.999930 557.739380>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_pickup_2"
$Type:		"ground"
$Pos:			<191.324783 -3.849998 260.427307>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_drop_2"
$Type:		"ground"
$Pos:			<197.656906 -4.000001 261.815552>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_pickup_3"
$Type:		"ground"
$Pos:			<216.739914 -3.796324 587.363403>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_drop_3"
$Type:		"ground"
$Pos:			<225.630722 -3.999857 588.340149>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_pickup_4"
$Type:		"ground"
$Pos:			<141.435394 -3.849892 713.808411>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_drop_4"
$Type:		"ground"
$Pos:			<133.999634 -4 715.712646>
$Orient:		[I]
+Chunk:		"sr_chunk13"

$Navpoint:	"lc_escort01_pickup_5"
$Type:		"ground"
$Pos:			<47.966568 -3.850000 949.861267>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_drop_5"
$Type:		"ground"
$Pos:			<47.747017 -4.000001 955.793152>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_pickup_6"
$Type:		"ground"
$Pos:			<-69.984779 -3.850101 1019.182068>
$Orient:		[I]
+Chunk:		"sr_chunk15"

$Navpoint:	"lc_escort01_drop_6"
$Type:		"ground"
$Pos:			<-70.158379 -4.000001 1011.631653>
$Orient:		[I]
+Chunk:		"sr_chunk15"

$Navpoint:	"lc_escort01_pickup_7"
$Type:		"ground"
$Pos:			<222.702408 -3.850001 1035.454712>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_drop_7"
$Type:		"ground"
$Pos:			<223.336121 -4 1040.106079>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_pickup_9"
$Type:		"ground"
$Pos:			<240.918350 -3.932227 1263.608032>
$Orient:		[I]
+Chunk:		"sr_chunk14"

$Navpoint:	"lc_escort01_drop_9"
$Type:		"ground"
$Pos:			<245.151291 -4.081964 1258.805054>
$Orient:		[I]
+Chunk:		"sr_chunk14"

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

$Vehicle:		"lc_escort01_vehicle"
$Vehicle type:	"car_4dr_exoticluxury01"
$Start nav:		"lc_escort01_vehicle"
$Group:			"lc_escort01"
$Stream Distance:			50.000
+Variant: "Escort"

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"lc_escort01_strpper"
$Char type:				"Stripper-White"
$Start nav:				"lc_escort01_strpper"
+Group:					"lc_escort01"

$Human:					"lc_escort01_client"
$Char type:				"PD_X_M_HighIncome"
$Start nav:				"lc_escort01_client"
+Group:					"lc_escort01"

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

// ---------------
#Negative Regions
// ---------------

// ----------
#DSP Regions
// ----------

// -------------
#Audio Cluders
// -------------

// -------
#Nodes
// -------

// -------
#Movers
// -------


// -------
#Interiors
// -------



#End
