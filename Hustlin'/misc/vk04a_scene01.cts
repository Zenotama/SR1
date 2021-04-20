// -------
#Navpoints
// -------

	//--The following is a Hard coded Name
$Navpoint: "CS_$IngamePos"
$Type:		"ground"
$Pos:		<-754.4744 -1.8832 95.0652>
$Orient:	[I]



$Navpoint: "CS_slate_church_johnnyroom_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Slate_Name:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_jnny_1"
$Type:		"ground"
$Pos:		<-3.587 -6.601 -4.841>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_PC01_1"
$Type:		"ground"
$Pos:		<-4.244 0.0 1.561>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Bat01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Pistol01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Shotgun01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_SwitchBlade01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Table01_1"
$Type:		"ground"
$Pos:		<0.0 0.0 0.0>
$Orient:	[I]
+Uses_Slate:	"slate_church_johnnyroom"

// -------
#Cutscene
// -------

// -------
#Vehicles
// -------


// -------
#Humans
// -------

$Human:	"CS_jnny"
$Char type:	"TS_A_M_JohnnyGat"
$Start nav:	"CS_$root_controller_jnny_1"

$Human:	"CS_bat"
$Char type:	"cs_bat"
$Start nav:	"CS_$root_controller_Bat01_1"

$Human:	"CS_pistol"
$Char type:	"cs_slidepistol"
$Start nav:	"CS_$root_controller_Pistol01_1"

$Human:	"CS_shotgun"
$Char type:	"cs_pumpshotgun"
$Start nav:	"CS_$root_controller_Shotgun01_1"

$Human:	"CS_blade"
$Char type:	"cs_switchblade"
$Start nav:	"CS_$root_controller_SwitchBlade01_1"

$Human:	"CS_table"
$Char type:	"cs_johnnytable"
$Start nav:	"CS_$root_controller_Table01_1"

// -------
#Effects
// -------


#End
