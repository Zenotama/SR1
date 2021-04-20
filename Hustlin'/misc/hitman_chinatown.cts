// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]


// Slate: slate_tea_chinatown

$Navpoint: "CS_slate_tea_chinatown_1"
$Type: "ground"
$Pos: <1.084 0.0 0.911>
$Orient: [I]
+Slate_Name: "slate_tea_chinatown"

$Navpoint: "CS_Charnav-walker01_1"
$Type: "ground"
$Pos: <1.62 -0.01 5.649>
$Orient: [2.09301]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_charnav-talker01_1"
$Type: "ground"
$Pos: <-6.826 -0.013 -8.715>
$Orient: [2.26277]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_charnav-talker02_1"
$Type: "ground"
$Pos: <-5.72 -0.013 -9.577>
$Orient: [5.36209]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_charnav-walker02_1"
$Type: "ground"
$Pos: <-8.374 -0.013 -5.598>
$Orient: [2.26277]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_Server01_1"
$Type: "ground"
$Pos: <3.852 -0.001 2.804>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_wong01_1"
$Type: "ground"
$Pos: <-5.231 0.566 -0.865>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_Player01_1"
$Type: "ground"
$Pos: <3.941 -0.002 3.181>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_WongTable01_1"
$Type: "ground"
$Pos: <-3.374 0.0 1.782>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_WongChair01_1"
$Type: "ground"
$Pos: <-5.25 0.0 -0.916>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_WongChair02_1"
$Type: "ground"
$Pos: <-1.431 0.0 4.706>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_WongTeacup01_1"
$Type: "ground"
$Pos: <-5.086 0.0 -0.698>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_HitmanPhoto01_1"
$Type: "ground"
$Pos: <-1.966 0.0 3.952>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_HitmanPhoto02_1"
$Type: "ground"
$Pos: <-1.966 0.0 4.048>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$root_controller_HitmanPhoto03_1"
$Type: "ground"
$Pos: <-1.874 0.0 3.887>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <1.084 0.0 0.911>
$Orient: [I]
+Uses_Slate: "slate_tea_chinatown"

$Navpoint: "CS_PathNav-walker02-01_1"
$Type:		"ground"
$Pos:		<-3.362 -0.013 -9.167>
$Orient:	[2.19775]
+Uses_Slate:	"slate_tea_chinatown"

$Navpoint: "CS_pathnav-walker01-01_1"
$Type:		"ground"
$Pos:		<5.446 0.0 5.569>
$Orient:	[2.13791]
+Uses_Slate:	"slate_tea_chinatown"

// -------
#Cutscene
// -------

$Cutscene: "CS_$Auto_Generated_Area_Node"
$Start nav: "CS_$Auto_Generated_Area_Node_Nav"
$Box size: -30.0 -30.0 -30.0 30.0 30.0 30.0

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_walker01"
$Char type: "pd_x_f_middleage-01"
$Start nav: "CS_Charnav-walker01_1"

$Human: "CS_talker01"
$Char type: "pd_x_m_poor-01"
$Start nav: "CS_charnav-talker01_1"
+Item: "liquorbottle"
+Rank: 0

$Human: "CS_talker02"
$Char type: "pd_x_m_middleage-02"
$Start nav: "CS_charnav-talker02_1"

$Human: "CS_walker02"
$Char type: "pd_b_m_bouncer-01"
$Start nav: "CS_charnav-walker02_1"

$Human: "CS_server"
$Char type: "AC_A_M_Hitman_Ser"
$Start nav: "CS_$root_controller_Server01_1"

$Human: "CS_wong"
$Char type: "AC_A_M_Hitman-Wong"
$Start nav: "CS_$root_controller_wong01_1"
+Item: "magnuml"
+Rank: 0
+Variant: "cutscene"

$Human: "CS_table"
$Char type: "cs_wong_table"
$Start nav: "CS_$root_controller_WongTable01_1"

$Human: "CS_chair"
$Char type: "cs_wong_chair"
$Start nav: "CS_$root_controller_WongChair01_1"

$Human: "CS_chair2"
$Char type: "cs_wong_chair"
$Start nav: "CS_$root_controller_WongChair02_1"

$Human: "CS_teacup"
$Char type: "cs_wong_teacup"
$Start nav: "CS_$root_controller_WongTeacup01_1"

$Human: "CS_Photo01"
$Char type: "cs_hitman_photo"
$Start nav: "CS_$root_controller_HitmanPhoto01_1"
+Variant: "PhotoOfGuy2"

$Human: "CS_Photo2"
$Char type: "cs_hitman_photo"
$Start nav: "CS_$root_controller_HitmanPhoto02_1"
+Variant: "PhotoOfGuy3"

$Human: "CS_Photo3"
$Char type: "cs_hitman_photo"
$Start nav: "CS_$root_controller_HitmanPhoto03_1"
+Variant: "PhotoOfGuy6"

#End
