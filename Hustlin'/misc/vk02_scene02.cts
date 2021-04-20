// -------
#Navpoints
// -------


// Slate: slate_record_studio

$Navpoint: "CS_slate_record_studio_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_record_studio01"

$Navpoint: "CS_$root_controller_aisha_1"
$Type: "ground"
$Pos: <5.078 0.055 -4.07>
$Orient: [I]
+Uses_Slate: "slate_record_studio01"

$Navpoint: "CS_$root_controller_employee01_1"
$Type: "ground"
$Pos: <-1.135 0.084 6.053>
$Orient: [I]
+Uses_Slate: "slate_record_studio01"

$Navpoint: "CS_$root_controller_phone_1"
$Type: "ground"
$Pos: <-0.476 0.0 5.741>
$Orient: [I]
+Uses_Slate: "slate_record_studio01"

$Navpoint: "CS_$root_controller_Doors01_1"
$Type: "ground"
$Pos: <-20.182 0.0 -9.104>
$Orient: [I]
+Uses_Slate: "slate_record_studio01"

$Navpoint: "CS_area_vk02_scene02_1"
$Type: "ground"
$Pos: <0.877 7.64 -5.309>
$Orient: [I]
+Uses_Slate: "slate_record_studio01"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vk02_scene02"
$Start nav: "CS_area_vk02_scene02_1"
$Box size: -44.8476 -12.7535 -44.8476 44.8476 12.7535 44.8476

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_aisha"
$Char type: "VK_B_F_Aisha"
$Start nav: "CS_$root_controller_aisha_1"

$Human: "CS_employee"
$Char type: "PD_X_M_BusinessMan-01"
$Start nav: "CS_$root_controller_employee01_1"
+Variant: "cutscene"

$Human: "CS_phone"
$Char type: "cs_blackphone"
$Start nav: "CS_$root_controller_phone_1"

$Human: "CS_doors"
$Char type: "cs_kingdomcome_doors"
$Start nav: "CS_$root_controller_Doors01_1"

#End
