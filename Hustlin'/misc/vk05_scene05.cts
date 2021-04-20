// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-222.7034 37.1626 -1734.6270>
$Orient:	[I]



$Navpoint: "CS_slate_anthony_2nd_fl_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_anthony_2nd_fl"

$Navpoint: "CS_$root_controller_grn_1"
$Type:		"ground"
$Pos:		<-3.863 0.0 0.282>
$Orient:	[I]
+Uses_Slate:	"slate_anthony_2nd_fl"

$Navpoint: "CS_$root_controller_jnny_1"
$Type:		"ground"
$Pos:		<-0.059 0.0 -4.422>
$Orient:	[I]
+Uses_Slate:	"slate_anthony_2nd_fl"

$Navpoint: "CS_$root_controller_pc_1"
$Type:		"ground"
$Pos:		<-3.114 0.0 0.211>
$Orient:	[I]
+Uses_Slate:	"slate_anthony_2nd_fl"

$Navpoint: "CS_$root_controller_chair_1"
$Type:		"ground"
$Pos:		<0.018 0.0 -4.911>
$Orient:	[I]
+Uses_Slate:	"slate_anthony_2nd_fl"

$Navpoint: "CS_$root_controller_Pistol01_1"
$Type:		"ground"
$Pos:		<-3.253 0.0 0.253>
$Orient:	[I]
+Uses_Slate:	"slate_anthony_2nd_fl"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_grn"
$Char type:	"vk_b_m_anthonygreen"
$Start nav:	"CS_$root_controller_grn_1"

$Human:	"CS_jnny"
$Char type:	"TS_A_M_JohnnyGat"
$Start nav:	"CS_$root_controller_jnny_1"

$Human:	"CS_chair"
$Char type:	"cs_vk5chair"
$Start nav:	"CS_$root_controller_chair_1"

$Human:	"CS_pist"
$Char type:	"cs_cs_pistol"
$Start nav:	"CS_$root_controller_Pistol01_1"

// -------
#Effects
// -------


#End
