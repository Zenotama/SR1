// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-736.3210 -3.8436 102.3981>
$Orient:	[I]



$Navpoint: "CS_slate_chruch_yard_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_dex_1"
$Type:		"ground"
$Pos:		<0.826 0.0 2.561>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_jnny_1"
$Type:		"ground"
$Pos:		<2.466 0.0 0.146>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_player_1"
$Type:		"ground"
$Pos:		<1.295 0.0 2.39>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_snta_1"
$Type:		"ground"
$Pos:		<1.468 0.0 2.774>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_sntb_1"
$Type:		"ground"
$Pos:		<0.445 0.0 1.925>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_sntc_1"
$Type:		"ground"
$Pos:		<0.567 0.0 1.481>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_Julius01_1"
$Type:		"ground"
$Pos:		<0.425 0.0 -2.741>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_Troy01_1"
$Type:		"ground"
$Pos:		<-0.32 0.0 -1.705>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander01_1"
$Type:		"ground"
$Pos:		<2.885 0.0 -1.769>
$Orient:	[5.60251]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander02_1"
$Type:		"ground"
$Pos:		<-1.684 0.0 2.021>
$Orient:	[2.32129]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander03_1"
$Type:		"ground"
$Pos:		<1.359 0.0 5.42>
$Orient:	[3.03687]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_CSCharnav-stander04_1"
$Type:		"ground"
$Pos:		<3.766 0.0 4.456>
$Orient:	[3.76991]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_tss01_scene02_area_1"
$Type:		"ground"
$Pos:		<-0.789 2.909 -4.677>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

// -------
#Cutscene
// -------

$Cutscene:	"CS_tss01_scene02_area"
$Start nav:	"CS_tss01_scene02_area_1"
$Box size:	-18.1481 -3.35354 -18.1481 18.1481 3.35354 18.1481

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_dex"
$Char type:	"TS_B_M_Dex-01"
$Start nav:	"CS_$root_controller_dex_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_jnny"
$Char type:	"TS_A_M_JohnnyGat"
$Start nav:	"CS_$root_controller_jnny_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_snta"
$Char type:	"TS_X_M_Thug1-01b"
$Start nav:	"CS_$root_controller_snta_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_sntb"
$Char type:	"TS_X_M_Thug2-01b"
$Start nav:	"CS_$root_controller_sntb_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_sntc"
$Char type:	"TS_X_M_Thug1-01b"
$Start nav:	"CS_$root_controller_sntc_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_jul"
$Char type:	"TS_B_M_Julius"
$Start nav:	"CS_$root_controller_Julius01_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_troy"
$Char type:	"TS_W_M_Troy-01"
$Start nav:	"CS_$root_controller_Troy01_1"
+Item:	"ak47"
+Rank: 0

$Human:	"CS_stander01"
$Char type:	"TS_X_M_Thug1-01b"
$Start nav:	"CS_CSCharnav-stander01_1"
$Human:	"CS_stander02"
$Char type:	"TS_X_M_Thug2-01"
$Start nav:	"CS_CSCharnav-stander02_1"
$Human:	"CS_stander03"
$Char type:	"TS_X_M_Thug2-01"
$Start nav:	"CS_CSCharnav-stander03_1"
$Human:	"CS_stander04"
$Char type:	"TS_X_M_Thug2-01b"
$Start nav:	"CS_CSCharnav-stander04_1"

// -------
#Effects
// -------


#End
