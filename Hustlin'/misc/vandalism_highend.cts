// -------
#Navpoints
// -------


// Slate: slate_vand_highend

$Navpoint: "CS_slate_vand_highend_1"
$Type: "ground"
$Pos: <0.0 0.0 0.0>
$Orient: [I]
+Slate_Name: "slate_vand_highend"

$Navpoint: "CS_charnav-dancer-01_1"
$Type: "ground"
$Pos: <-8.926 -2.515 -6.063>
$Orient: [4.89309]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_charnav-dancer-02_1"
$Type: "ground"
$Pos: <-9.611 -2.515 -8.126>
$Orient: [0.795791]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_charnav-sitter-01_1"
$Type: "ground"
$Pos: <-9.585 -2.404 -10.968>
$Orient: [1.50013]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_charnav-sitter-02_1"
$Type: "ground"
$Pos: <-9.742 -1.998 -12.561>
$Orient: [6.24695]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_charnav-sitter-03_1"
$Type: "ground"
$Pos: <-13.819 -2.434 -9.855>
$Orient: [4.76786]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_charnav-walker-01_1"
$Type: "ground"
$Pos: <-16.958 -2.515 -8.119>
$Orient: [1.71608]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_$root_controller_player01 cShoe_sneakers_1"
$Type: "ground"
$Pos: <2.73 0.0 3.881>
$Orient: [I]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_$root_controller_mary_1"
$Type: "ground"
$Pos: <-3.474 0.0 -1.585>
$Orient: [I]
+Uses_Slate: "slate_vand_highend"

$Navpoint: "CS_area_vand_highend_1"
$Type: "ground"
$Pos: <-2.111 2.101 -3.512>
$Orient: [I]
+Uses_Slate: "slate_vand_highend"

// -------
#Cutscene
// -------

$Cutscene: "CS_area_vand_highend"
$Start nav: "CS_area_vand_highend_1"
$Box size: -10.4577 -5.50433 -9.84024 10.4577 5.50433 9.84024

// -------
#Vehicles
// -------

// -------
#Humans
// -------

$Human: "CS_dancer01"
$Char type: "pd_x_f_skinnyho"
$Start nav: "CS_charnav-dancer-01_1"
+Variant: "asian ho"

$Human: "CS_dancer02"
$Char type: "pd_x_f_genericyoung-01"
$Start nav: "CS_charnav-dancer-02_1"
+Variant: "white"

$Human: "CS_sitter01"
$Char type: "pd_x_m_middleage-01b"
$Start nav: "CS_charnav-sitter-01_1"
+Variant: "asian"

$Human: "CS_sitter02"
$Char type: "pd_x_m_businessman-01"
$Start nav: "CS_charnav-sitter-02_1"
+Variant: "Latino"

$Human: "CS_sitter03"
$Char type: "pd_x_m_middleage-03"
$Start nav: "CS_charnav-sitter-03_1"
+Variant: "white"

$Human: "CS_walker01"
$Char type: "pd_x_f_skinnyho"
$Start nav: "CS_charnav-walker-01_1"
+Variant: "white ho"

$Human: "CS_mary"
$Char type: "AC_W_F_Vandalism-Mary"
$Start nav: "CS_$root_controller_mary_1"

#End
