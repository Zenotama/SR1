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
$Pos:		<3.008 0.0 -1.125>
$Orient:	[I]
+Slate_Name:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_jnny_1"
$Type:		"ground"
$Pos:		<-1.167 0.0 -8.022>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_jul_1"
$Type:		"ground"
$Pos:		<-8.076 1.757 -16.075>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_player_1"
$Type:		"ground"
$Pos:		<3.156 0.001 -3.648>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_snta_1"
$Type:		"ground"
$Pos:		<1.373 0.0 -6.389>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_sntb_1"
$Type:		"ground"
$Pos:		<0.585 -0.003 -4.635>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_sntc_1"
$Type:		"ground"
$Pos:		<-0.611 -0.003 -4.707>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_sntd_1"
$Type:		"ground"
$Pos:		<-2.386 -0.005 -7.242>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_$root_controller_troy_1"
$Type:		"ground"
$Pos:		<-7.539 1.78 -11.905>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_charnav-stander01_1"
$Type:		"ground"
$Pos:		<1.028 0.062 -2.928>
$Orient:	[3.84785]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_charnav-stander02_1"
$Type:		"ground"
$Pos:		<2.789 0.0 -3.008>
$Orient:	[4.0873]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_Charnav-stander03_1"
$Type:		"ground"
$Pos:		<3.758 0.0 -4.372>
$Orient:	[4.26481]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_Charnav-Stander04_1"
$Type:		"ground"
$Pos:		<2.912 0.0 -6.491>
$Orient:	[4.44326]
+Uses_Slate:	"slate_chruch_yard"

$Navpoint: "CS_tss01_scene01_area_1"
$Type:		"ground"
$Pos:		<-0.789 2.909 -4.677>
$Orient:	[I]
+Uses_Slate:	"slate_chruch_yard"

// -------
#Cutscene
// -------

$Cutscene:	"CS_tss01_scene01_area"
$Start nav:	"CS_tss01_scene01_area_1"
$Box size:	-18.1481 -3.35354 -18.1481 18.1481 3.35354 18.1481

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_jnny"
$Char type:	"TS_A_M_JohnnyGat"
$Start nav:	"CS_$root_controller_jnny_1"

$Human:	"CS_jul"
$Char type:	"TS_B_M_Julius"
$Start nav:	"CS_$root_controller_jul_1"

$Human:	"CS_snta"
$Char type:	"TS_X_M_Thug2-01"
$Start nav:	"CS_$root_controller_snta_1"

$Human:	"CS_sntb"
$Char type:	"TS_X_M_Thug1-01b"
$Start nav:	"CS_$root_controller_sntb_1"

$Human:	"CS_sntc"
$Char type:	"TS_X_M_Thug1-01"
$Start nav:	"CS_$root_controller_sntc_1"
+Variant:	"black"

$Human:	"CS_sntd"
$Char type:	"TS_X_M_Thug2-01"
$Start nav:	"CS_$root_controller_sntd_1"
+Variant:	"White"

$Human:	"CS_troy"
$Char type:	"TS_W_M_Troy-01"
$Start nav:	"CS_$root_controller_troy_1"

$Human:	"CS_stander01"
$Char type:	"ts_x_m_thug1-01b"
$Start nav:	"CS_charnav-stander01_1"

$Human:	"CS_stander02"
$Char type:	"ts_x_m_thug2-01"
$Start nav:	"CS_charnav-stander02_1"
+Variant:	"undefined"

$Human:	"CS_stander03"
$Char type:	"ts_x_m_thug2-01"
$Start nav:	"CS_Charnav-stander03_1"
+Variant:	"White"

$Human:	"CS_stander04"
$Char type:	"ts_x_m_thug2-01b"
$Start nav:	"CS_Charnav-Stander04_1"
+Variant:	"Asian"

// -------
#Effects
// -------


#End
