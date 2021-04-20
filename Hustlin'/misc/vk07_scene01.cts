// -------
#Navpoints
// -------

$Navpoint: "CS_$IngamePos"
$Type: "ground"
$Pos: <-754.474 -1.8832 95.0652>
$Orient: [I]


// Slate: slate_church_johnnyroom

$Navpoint: "CS_slate_church_johnnyroom_1"
$Type: "ground"
$Pos: <-0.317 0.14 -0.304>
$Orient: [I]
+Slate_Name: "slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_PC01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <-3.476 0.0 -2.409>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Jules01_1"
$Type: "ground"
$Pos: <-6.152 0.0 3.302>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Pad01_1"
$Type: "ground"
$Pos: <-3.515 0.0 -2.743>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"


// Slate: slate_vkboardroom

$Navpoint: "CS_slate_vkboardroom_6"
$Type: "ground"
$Pos: <0.062 0.001 -18.658>
$Orient: [5.26658]
+Slate_Name: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_King01_6"
$Type: "ground"
$Pos: <14.093 0.0 -17.598>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Warren01_6"
$Type: "ground"
$Pos: <19.958 0.0 -42.766>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Killa01_6"
$Type: "ground"
$Pos: <5.451 0.0 -19.808>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Thug_01_6"
$Type: "ground"
$Pos: <11.289 0.0 -20.392>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_ThugT01_6"
$Type: "ground"
$Pos: <7.583 0.0 -20.639>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_ThugK01_6"
$Type: "ground"
$Pos: <0.593 0.0 -16.145>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Killa201_6"
$Type: "ground"
$Pos: <12.455 0.0 -12.763>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Thug201_6"
$Type: "ground"
$Pos: <10.806 0.0 -12.036>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Thug301_6"
$Type: "ground"
$Pos: <8.738 0.0 -12.34>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Thug401_6"
$Type: "ground"
$Pos: <4.577 0.0 -12.934>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Bat01_6"
$Type: "ground"
$Pos: <11.509 0.0 -20.225>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Chair01_6"
$Type: "ground"
$Pos: <9.682 0.0 -17.438>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_Chair02_6"
$Type: "ground"
$Pos: <8.63 0.0 -17.549>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_doorL01_6"
$Type: "ground"
$Pos: <-3.595 0.0 -19.285>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"

$Navpoint: "CS_$root_controller_doorR01_6"
$Type: "ground"
$Pos: <-3.599 0.0 -17.879>
$Orient: [I]
+Uses_Slate: "slate_vkboardroom"


// Slate: slate_church_johnnyroom01

$Navpoint: "CS_slate_church_johnnyroom01_21"
$Type: "ground"
$Pos: <-0.317 0.14 -0.304>
$Orient: [I]
+Slate_Name: "slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_PC01 cShoe_sneakers_21"
$Type: "ground"
$Pos: <-3.639 0.0 -2.421>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Jules01_21"
$Type: "ground"
$Pos: <-3.037 0.0 1.703>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"

$Navpoint: "CS_$root_controller_Pad01_21"
$Type: "ground"
$Pos: <-3.525 0.0 -1.868>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"

$Navpoint: "CS_$Auto_Generated_Area_Node_Nav"
$Type: "ground"
$Pos: <-0.317 0.14 -0.304>
$Orient: [I]
+Uses_Slate: "slate_church_johnnyroom"

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

$Human: "CS_julius"
$Char type: "TS_B_M_Julius"
$Start nav: "CS_$root_controller_Jules01_1"

$Human: "CS_pad"
$Char type: "CS_NotePad"
$Start nav: "CS_$root_controller_Pad01_1"

$Human: "CS_king"
$Char type: "VK_B_M_benjaminKing"
$Start nav: "CS_$root_controller_King01_6"

$Human: "CS_warren"
$Char type: "VK_B_M_WWilliams"
$Start nav: "CS_$root_controller_Warren01_6"
+Item: "beretta"
+Rank: 0

$Human: "CS_killa01"
$Char type: "VK_X_M_killa1-01"
$Start nav: "CS_$root_controller_Killa01_6"

$Human: "CS_thug01"
$Char type: "VK_X_M_Thug2-02"
$Start nav: "CS_$root_controller_Thug_01_6"

$Human: "CS_thugt01"
$Char type: "VK_X_M_Thug1-01"
$Start nav: "CS_$root_controller_ThugT01_6"

$Human: "CS_thugk01"
$Char type: "VK_X_M_Thug1-02"
$Start nav: "CS_$root_controller_ThugK01_6"

$Human: "CS_killa201"
$Char type: "VK_X_M_killa1-01"
$Start nav: "CS_$root_controller_Killa201_6"

$Human: "CS_thug201"
$Char type: "VK_X_M_Thug1-01"
$Start nav: "CS_$root_controller_Thug201_6"

$Human: "CS_thug301"
$Char type: "VK_X_M_Thug1-02"
$Start nav: "CS_$root_controller_Thug301_6"

$Human: "CS_thug401"
$Char type: "VK_X_M_Thug2-02"
$Start nav: "CS_$root_controller_Thug401_6"

$Human: "CS_bat"
$Char type: "CS_Bat"
$Start nav: "CS_$root_controller_Bat01_6"

$Human: "CS_chair01"
$Char type: "CS_VKchair"
$Start nav: "CS_$root_controller_Chair01_6"

$Human: "CS_chair02"
$Char type: "CS_VKchair"
$Start nav: "CS_$root_controller_Chair02_6"

$Human: "CS_doorL"
$Char type: "cs_boardroomdoor"
$Start nav: "CS_$root_controller_doorL01_6"

$Human: "CS_doorR"
$Char type: "cs_boardroomdoor"
$Start nav: "CS_$root_controller_doorR01_6"

#End
