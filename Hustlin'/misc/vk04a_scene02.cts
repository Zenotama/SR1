// -------
#Navpoints
// -------


// Slate: slate_vkpolice

$Navpoint: "CS_slate_vkpolice_1"
$Type: "ground"
$Pos: <-1.636 0.0 0.285>
$Orient: [5.75959]
+Slate_Name: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_jnny_1"
$Type: "ground"
$Pos: <-1.018 0.0 -11.202>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_anth_1"
$Type: "ground"
$Pos: <-2.369 0.0 -4.401>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_tnya_1"
$Type: "ground"
$Pos: <0.081 0.0 0.435>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_pist_jnny_1"
$Type: "ground"
$Pos: <7.477 0.0 -5.928>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_sgun_jnny_1"
$Type: "ground"
$Pos: <-0.603 0.0 -11.034>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_sgun_ant_1"
$Type: "ground"
$Pos: <-2.009 0.0 -4.453>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_snta_1"
$Type: "ground"
$Pos: <18.379 -8.623 -40.607>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_sntb_1"
$Type: "ground"
$Pos: <17.832 -7.779 -39.844>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_pc_1"
$Type: "ground"
$Pos: <-1.899 0.033 -10.889>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_VKdumpster01_1"
$Type: "ground"
$Pos: <3.556 -8.002 8.075>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_$root_controller_car_1"
$Type: "ground"
$Pos: <66.29 -7.924 -88.239>
$Orient: [I]
+Uses_Slate: "slate_vkpolice01"

$Navpoint: "CS_area_vk04a_scene02_1"
$Type: "ground"
$Pos: <13.432 -0.129 -14.579>
$Orient: [0.711405]
+Uses_Slate: "slate_vkpolice01"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk04a_scene02"
$Start nav: "CS_area_vk04a_scene02_1"
$Box size: -32.5739 -7.41323 -17.3203 32.5739 7.41323 17.3203

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_jnny"
$Char type: "TS_A_M_JohnnyGat"
$Start nav: "CS_$root_controller_jnny_1"
+Item: "knife"
+Rank: 0

$Human: "CS_anth"
$Char type: "VK_B_M_AnthonyGreen"
$Start nav: "CS_$root_controller_anth_1"

$Human: "CS_tnya"
$Char type: "AC_A_F_TanyaWinters"
$Start nav: "CS_$root_controller_tnya_1"

$Human: "CS_pistjnny"
$Char type: "CS_SFalcon"
$Start nav: "CS_$root_controller_pist_jnny_1"

$Human: "CS_sgunjnny"
$Char type: "CS_shotgun"
$Start nav: "CS_$root_controller_sgun_jnny_1"

$Human: "CS_sgunant"
$Char type: "CS_shotgun"
$Start nav: "CS_$root_controller_sgun_ant_1"

$Human: "CS_snta"
$Char type: "TS_X_M_Thug1-01"
$Start nav: "CS_$root_controller_snta_1"

$Human: "CS_sntb"
$Char type: "TS_X_M_Thug2-01"
$Start nav: "CS_$root_controller_sntb_1"
+Variant: "Black"

$Human: "CS_dump"
$Char type: "cs_vk_dumpster"
$Start nav: "CS_$root_controller_VKdumpster01_1"

$Human: "CS_car"
$Char type: "cscopcar"
$Start nav: "CS_$root_controller_car_1"

#End
