// -------
#Groups
// -------

$Group:	"tss01_fighters"
$Group:	"tss01_gun_rob"

// -------
#Navpoints
// -------

$Navpoint:	"tss01_player_church_start"
$Type:		"ground"
$Pos:			<-734.855835 -3.855001 103.277054>
$Orient:		[-2.705262]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#001"
$Type:		"ground"
$Pos:			<-737.279663 -3.855008 99.944023>
$Orient:		[0.629183]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#002"
$Type:		"ground"
$Pos:			<-737.121399 -3.760009 107.861282>
$Orient:		[2.427908]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#003"
$Type:		"ground"
$Pos:			<-729.752441 -3.760008 104.154739>
$Orient:		[-1.605699]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#004"
$Type:		"ground"
$Pos:			<-733.326965 -3.752467 110.267342>
$Orient:		[2.852510]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#005"
$Type:		"ground"
$Pos:			<-732.338989 -3.760005 99.915009>
$Orient:		[-0.977385]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#006"
$Type:		"ground"
$Pos:			<-733.523621 -3.855009 107.396790>
$Orient:		[-2.709058]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#007"
$Type:		"ground"
$Pos:			<-740.303284 -3.760004 103.285103>
$Orient:		[1.256637]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug1-01#008"
$Type:		"ground"
$Pos:			<-740.951660 -3.760004 107.351753>
$Orient:		[2.024583]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_Ts_x_m_thug2-01#000"
$Type:		"ground"
$Pos:			<-740.916138 -2.644010 90.111153>
$Orient:		[0.174533]

$Navpoint:	"tss01_Ts_x_m_thug2-01#001"
$Type:		"ground"
$Pos:			<-742.974182 -2.441771 90.576027>
$Orient:		[-0.034907]

$Navpoint:	"tss01_Ts_x_m_thug2-01#002"
$Type:		"ground"
$Pos:			<-743.283264 -2.842899 91.518570>
$Orient:		[0.767945]

$Navpoint:	"tss01_Ts_x_m_thug2-01#003"
$Type:		"ground"
$Pos:			<-742.804321 -2.057826 88.938293>
$Orient:		[0.488692]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_$nav000"
$Type:		"ground"
$Pos:			<-730.256409 -3.855004 103.258842>
$Orient:		[-1.850050]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator000"
$Type:		"ground"
$Pos:			<-741.075684 -3.760009 108.555824>
$Orient:		[2.042036]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator001"
$Type:		"ground"
$Pos:			<-737.579529 -3.760006 113.006638>
$Orient:		[2.914702]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator002"
$Type:		"ground"
$Pos:			<-731.356079 -3.855007 110.156036>
$Orient:		[-2.834751]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator003"
$Type:		"ground"
$Pos:			<-728.195984 -3.760007 102.450195>
$Orient:		[-1.570797]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator004"
$Type:		"ground"
$Pos:			<-729.454651 -3.760004 100.116402>
$Orient:		[-0.942478]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator005"
$Type:		"ground"
$Pos:			<-734.310303 -3.855005 94.776382>
$Orient:		[-0.209440]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator006"
$Type:		"ground"
$Pos:			<-739.402222 -3.855005 96.478081>
$Orient:		[0.767945]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_spectator007"
$Type:		"ground"
$Pos:			<-742.924072 -3.760006 105.021996>
$Orient:		[1.605703]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_after_gun"
$Type:		"ground"
$Pos:			<-671.516724 -3.810422 122.925568>
$Orient:		[0.523599]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_robber_dest"
$Type:		"ground"
$Pos:			<-674.472229 -3.810422 119.014076>
$Orient:		[0.453786]
+Chunk:		"sr_chunk02"

$Navpoint:	"tss01_robber"
$Type:		"ground"
$Pos:			<-681.636658 -3.849999 114.831268>
$Orient:		[0.733038]
+Chunk:		"sr_chunk02"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

$Trigger:				"tss01_after_gun"
$Trigger type:			"bounding box"
$Trigger action:		"execute lua script"
$Trigger max fires:	0
$Trigger delay:		10000
$Start nav:				"tss01_after_gun"
+Disabled
$Box size:				-3.125000 0.000000 -1.000000 3.125000 2.000000 1.000000

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

// -------
#Humans
// -------

$Human:					"tss01_thug1"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#001"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug2"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#002"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug3"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#003"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug4"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#004"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug5"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#005"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug6"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#006"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug7"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#007"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_thug8"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_Ts_x_m_thug1-01#008"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec1"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_spectator000"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec2"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_spectator001"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec3"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_spectator002"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec4"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_spectator003"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec5"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_spectator004"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec6"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_spectator005"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec7"
$Char type:				"TS_X_M_Thug1-01"
$Start nav:				"tss01_spectator006"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_spec8"
$Char type:				"TS_X_M_Thug2-01"
$Start nav:				"tss01_spectator007"
+Rank:					1
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_troy"
$Char type:				"TS_W_M_Troy-01"
$Start nav:				"tss01_Ts_x_m_thug2-01#000"
+Hit points:			10000
+Rank:					1
+Cower/Flee:			"never cower or flee"
+IgnoreAI
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_dex"
$Char type:				"TS_B_M_Dex-01"
$Start nav:				"tss01_Ts_x_m_thug2-01#001"
+Hit points:			10000
+Rank:					1
+Cower/Flee:			"never cower or flee"
+IgnoreAI
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_gat"
$Char type:				"TS_A_M_JohnnyGat"
$Start nav:				"tss01_Ts_x_m_thug2-01#002"
+Hit points:			10000
+Rank:					1
+Cower/Flee:			"never cower or flee"
+IgnoreAI
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_julius"
$Char type:				"TS_B_M_Julius"
$Start nav:				"tss01_Ts_x_m_thug2-01#003"
+Hit points:			10000
+Rank:					1
+Cower/Flee:			"never cower or flee"
+IgnoreAI
+DontDropCash
+Group:					"tss01_fighters"

$Human:					"tss01_robber"
$Char type:				"PD_B_M_Bouncer-01"
$Start nav:				"tss01_robber"
+Item:					"beretta"
+Team:					"Neutral Gang"
+Personality:			"gang tough"
+Cower/Flee:			"never cower or flee"
+DontEffectNotoriety
+Group:					"tss01_gun_rob"
+Variant:					"black"
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
#Audio Barriers
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
