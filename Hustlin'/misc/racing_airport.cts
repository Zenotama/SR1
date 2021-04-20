// -------
#Navpoints
// -------


// Slate: slate_racing_airport

$Navpoint: "CS_slate_racing_airport_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_racing_airport"

$Navpoint: "CS_charnav-walker01_1"
$Type: "ground"
$Pos: <1.247 -0.011 13.791>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_charnav-walker02_1"
$Type: "ground"
$Pos: <10.233 -0.011 15.001>
$Orient: [1.69946]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_charnav-walker03_1"
$Type: "ground"
$Pos: <24.294 -0.011 12.868>
$Orient: [1.69946]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_pathnav-walker01_1"
$Type: "ground"
$Pos: <2.307 0.0 45.836>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_pathnav-walker02_1"
$Type: "ground"
$Pos: <22.522 0.0 14.03>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_pathnav-walker03_1"
$Type: "ground"
$Pos: <35.113 0.0 12.704>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_$root_controller_pc_1"
$Type: "ground"
$Pos: <-0.259 0.0 0.709>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_$root_controller_lorenzo_1"
$Type: "ground"
$Pos: <-0.316 0.121 -1.461>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_$root_controller_GayPorn01_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Uses_Slate: "slate_racing_airport"

$Navpoint: "CS_area_racing_airport_1"
$Type: "ground"
$Pos: <-1.141 1.492 6.133>
$Orient: [0.0900707]
+Uses_Slate: "slate_racing_airport"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_racing_airport"
$Start nav: "CS_area_racing_airport_1"
$Box size: -20.3196 -4.61457 -27.5589 20.3196 4.61457 27.5589

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_walker01"
$Char type: "pd_x_m_poorheavy-01"
$Start nav: "CS_charnav-walker01_1"

$Human: "CS_walker02"
$Char type: "pd_x_m_garbageman"
$Start nav: "CS_charnav-walker02_1"

$Human: "CS_walker03"
$Char type: "pd_x_m_utilityworker"
$Start nav: "CS_charnav-walker03_1"
+Variant: "black"

$Human: "CS_lorenzo"
$Char type: "ac_l_m_racing-lorenzo"
$Start nav: "CS_$root_controller_lorenzo_1"

$Human: "CS_porn"
$Char type: "cs_gayporn"
$Start nav: "CS_$root_controller_GayPorn01_1"

#End
