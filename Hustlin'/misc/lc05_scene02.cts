// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-740.875 -0.8641 1692.84>
$Orient: [I]


// Slate: slate_docks

$Navpoint: "CS_slate_docks_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_docks"

$Navpoint: "CS_CS_CSCharnav-stander01_1"
$Type: "ground"
$Pos: <7.317 0.0 -4.8>
$Orient: [4.37497]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_CS_CSCharnav-stander02_1"
$Type: "ground"
$Pos: <6.651 0.0 -5.935>
$Orient: [5.89089]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_VehicleNav_Policecar_1"
$Type: "ground"
$Pos: <3.024 0.0 -2.249>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_$root_controller_Vict01_1"
$Type: "ground"
$Pos: <0.094 0.0 0.023>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_$root_controller_carn01_1"
$Type: "ground"
$Pos: <2.571 0.0 -3.043>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_$root_controller_Carn201_1"
$Type: "ground"
$Pos: <0.154 0.0 -1.421>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_mCop201_$root_controller_MAL2_1"
$Type: "ground"
$Pos: <2.235 0.0 -1.461>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_$root_controller_mCop01_1"
$Type: "ground"
$Pos: <1.59 0.0 -0.142>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_$root_controller_femCop01_1"
$Type: "ground"
$Pos: <1.517 0.0 0.621>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_$root_controller_cont01_1"
$Type: "ground"
$Pos: <11.581 0.0 2.367>
$Orient: [I]
+Uses_Slate: "slate_docks"

$Navpoint: "CS_pathNav-stander02_01_1"
$Type:		"ground"
$Pos:		<4.903 0.0 -2.186>
$Orient:	[5.66761]
+Uses_Slate:	"slate_docks"


// Slate: slate_angelo_bedroom

$Navpoint: "CS_slate_angelo_bedroom_2"
$Type: "ground"
$Pos: <6.29 0.0 162.394>
$Orient: [I]
+Slate_Name: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_Angl01_2"
$Type: "ground"
$Pos: <3.748 0.0 163.795>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_luz01_2"
$Type: "ground"
$Pos: <3.963 0.0 163.226>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_phn01_2"
$Type: "ground"
$Pos: <3.862 0.0 164.373>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_$root_controller_Teacup01_2"
$Type: "ground"
$Pos: <3.534 -0.01 164.247>
$Orient: [I]
+Uses_Slate: "slate_angelo_bedroom"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_docks"

// -------
#Cutscene
// -------

$Cutscene: "CS_$Auto_Generated_Area_Node"
$Start nav: "CS_$Auto_Generated_Area_Node_Nav"
$Box size: -30.0 -30.0 -30.0 30.0 30.0 30.0

// -------
#Vehicles
// -------

$Vehicle: "CS_VehicleNav_Policecar"
$Vehicle Type: "car_4dr_police01"
$Start nav: "CS_VehicleNav_Policecar_1"
$Stream Distance: 50.000
+Variant: "undefined"

// -------
#Humans
// -------

$Human: "CS_stander01"
$Char type: "lw_w_m_swat01"
$Start nav: "CS_CS_CSCharnav-stander01_1"
+Variant: "goggles up"

$Human: "CS_stander02"
$Char type: "lw_w_m_swat01"
$Start nav: "CS_CS_CSCharnav-stander02_1"
+Variant: "goggles up"

$Human: "CS_Vict"
$Char type: "LC_L_M_VictorRodriguez"
$Start nav: "CS_$root_controller_Vict01_1"

$Human: "CS_carn"
$Char type: "LC_X_M_Killa1-01"
$Start nav: "CS_$root_controller_carn01_1"

$Human: "CS_Carn2"
$Char type: "LC_X_M_Thug1-01"
$Start nav: "CS_$root_controller_Carn201_1"

$Human: "CS_mCop2"
$Char type: "LW_X_M_Officer_01"
$Start nav: "CS_mCop201_$root_controller_MAL2_1"

$Human: "CS_mCop"
$Char type: "lw_x_m_officer_01b"
$Start nav: "CS_$root_controller_mCop01_1"
+Variant: "latin cop"

$Human: "CS_femCop"
$Char type: "LW_X_F_Officer"
$Start nav: "CS_$root_controller_femCop01_1"
+Variant: "whiteshortSleeveTie"

$Human: "CS_cont"
$Char type: "cs_big_container"
$Start nav: "CS_$root_controller_cont01_1"

$Human: "CS_Angl"
$Char type: "LC_L_M_AngeloLopez-01"
$Start nav: "CS_$root_controller_Angl01_2"

$Human: "CS_luz"
$Char type: "LC_L_F_Luz"
$Start nav: "CS_$root_controller_luz01_2"

$Human: "CS_phn"
$Char type: "cs_blackphone"
$Start nav: "CS_$root_controller_phn01_2"

$Human: "CS_teacup"
$Char type: "cs_teacup"
$Start nav: "CS_$root_controller_Teacup01_2"

#End
