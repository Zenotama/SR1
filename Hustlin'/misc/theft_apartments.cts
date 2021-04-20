// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<820.0830 -3.8036 339.1236>
$Orient:	[I]



$Navpoint: "CS_slate_theft_apts_1"
$Type:		"ground"
$Pos:		<0.0 0.0 -0.001>
$Orient:	[I]
+Slate_Name:	"slate_theft_apts"

$Navpoint: "CS_$root_controller_Aden01_1"
$Type:		"ground"
$Pos:		<-0.106 0.0 -1.804>
$Orient:	[I]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_$root_controller_PC01_1"
$Type:		"ground"
$Pos:		<2.837 0.002 0.928>
$Orient:	[I]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_CharacterNav-walker01_1"
$Type:		"ground"
$Pos:		<4.861 0.0 4.703>
$Orient:	[4.675]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_PathNav-walker01-01_1"
$Type:		"ground"
$Pos:		<-1.785 0.0 4.659>
$Orient:	[4.69582]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_CharacterNav-walker02_1"
$Type:		"ground"
$Pos:		<13.705 -0.204 36.222>
$Orient:	[1.59985]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_PathNav-walker02_1"
$Type:		"ground"
$Pos:		<25.002 -0.204 36.113>
$Orient:	[1.36346]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_CharacterNav-walker03_1"
$Type:		"ground"
$Pos:		<19.022 -0.204 35.197>
$Orient:	[1.59985]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_PathNav-walker03_1"
$Type:		"ground"
$Pos:		<12.035 -0.204 35.444>
$Orient:	[4.44472]
+Uses_Slate:	"slate_theft_apts"

$Navpoint: "CS_$root_controller_Phone01_1"
$Type:		"ground"
$Pos:		<0.262 0.0 -1.324>
$Orient:	[I]
+Uses_Slate:	"slate_theft_apts"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_aden"
$Char type:	"AC_W_M_Theft-Aiden"
$Start nav:	"CS_$root_controller_Aden01_1"

$Human:	"CS_walker01"
$Char type:	"pd_x_m_mailman-01"
$Start nav:	"CS_CharacterNav-walker01_1"

$Human:	"CS_walker02"
$Char type:	"pd_x_f_poor-01"
$Start nav:	"CS_CharacterNav-walker02_1"

$Human:	"CS_walker03"
$Char type:	"pd_x_m_businessman-01"
$Start nav:	"CS_CharacterNav-walker03_1"

$Human:	"CS_phone"
$Char type:	"cs_deskphone"
$Start nav:	"CS_$root_controller_Phone01_1"

// -------
#Effects
// -------


#End
