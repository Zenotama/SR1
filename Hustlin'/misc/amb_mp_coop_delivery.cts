// -------
#Groups
// -------


// -------
#Navpoints
// -------

$Navpoint:	"amb_mp_coop_delivery_walla"
$Type:		"floating"
$Pos:			<75.223465 0.000122 51.543938>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_overhead1"
$Type:		"floating"
$Pos:			<142.888000 0.000031 -37.370361>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_overhead2"
$Type:		"floating"
$Pos:			<17.929947 12.482208 100.560715>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_stripclub"
$Type:		"floating"
$Pos:			<2.172139 -0.000001 183.368988>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_birds"
$Type:		"floating"
$Pos:			<4.964730 6.046072 147.748932>
$Orient:		[0.062731]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_sportsfans"
$Type:		"floating"
$Pos:			<52.304073 10.463217 158.386627>
$Orient:		[-0.039676]

$Navpoint:	"amb_mp_coop_delivery_baby"
$Type:		"floating"
$Pos:			<15.446021 9.894414 80.126740>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_birds2"
$Type:		"floating"
$Pos:			<117.251190 -0.149910 -6.214058>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_sex"
$Type:		"floating"
$Pos:			<69.152580 7.775723 -84.080193>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_chatter"
$Type:		"floating"
$Pos:			<143.369095 0 -65.533241>
$Orient:		[I]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_pornmusic"
$Type:		"floating"
$Pos:			<-18.972603 5.270672 -8.382935>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_liquorint"
$Type:		"floating"
$Pos:			<148.171753 -1.159901 -34.198853>
$Orient:		[0.000536]

$Navpoint:	"amb_mp_coop_delivery_chatter2"
$Type:		"floating"
$Pos:			<67.387138 -0.000008 27.018005>
$Orient:		[I]

$Navpoint:	"amb_mp_coop_delivery_stripint"
$Type:		"floating"
$Pos:			<-0.030028 0.105429 174.041626>
$Orient:		[0.008311]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_neg_strip"
$Type:		"ground"
$Pos:			<-1.266670 1.957596 173.847534>
$Orient:		[I]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_birds3"
$Type:		"floating"
$Pos:			<40.245354 0 45.043507>
$Orient:		[I]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_building"
$Type:		"floating"
$Pos:			<33.516380 17.214725 94.437119>
$Orient:		[I]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_birds4"
$Type:		"floating"
$Pos:			<-6.714593 7.051125 47.148705>
$Orient:		[I]
+Chunk:		"mp_coop_delivery"

$Navpoint:	"amb_mp_coop_delivery_neg_liquor"
$Type:		"ground"
$Pos:			<148.948242 1.974591 -26.518282>
$Orient:		[0.017727]
+Chunk:		"mp_coop_delivery"

// -------
#Cameras
// -------

// -------
#Items
// -------

// -------
#Triggers
// -------

// -------
#Vehicles
// -------

// -------
#Respawns
// -------

// -------
#Humans
// -------

// -------
#Spawn NPC Regions
// -------

// -------
#Racing
// -------

// -------
#Strongholds
// -------

// -------
#Special Spawns
// -------

// -------
#Parking
// -------

// -------
#Chunk Streaming Test Cases
// -------

// -------
#Ambients
// -------

$Ambient:	"amb_mp_coop_delivery_walla"
	$Navpoint:	"amb_mp_coop_delivery_walla"
	$Shape:	"Cylinder"
		$Inner Radius:	231.38
		$Outer Radius:	278.63
		$Inner Height:	108.00
		$Outer Height:	136.25
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.3250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_walla_quiet_mid.wav"
	$Emitter:	"plane"
		$Volume:	0.3375
		$Min Delay:	30000
		$Max Delay:	60000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_veh_flyby_plane_1.wav"
		+File:	"amb_ext_veh_flyby_plane_2.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_overhead1"
	$Navpoint:	"amb_mp_coop_delivery_overhead1"
	$Shape:	"Cylinder"
		$Inner Radius:	173.00
		$Outer Radius:	245.50
		$Inner Height:	90.25
		$Outer Height:	104.25
	$Inner Offset:	<0 0 0>
	$Emitter:	"cars"
		$Volume:	0.3875
		$Min Delay:	1000
		$Max Delay:	8000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_veh_drvby_car_1.wav"
		+File:	"amb_ext_veh_drvby_car_2.wav"
		+File:	"amb_ext_veh_drvby_car_3.wav"
	$Emitter:	"horns"
		$Volume:	0.1875
		$Min Delay:	4000
		$Max Delay:	15000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_car_horn_1.wav"
		+File:	"amb_ext_car_horn_2.wav"
		+File:	"amb_ext_car_horn_3.wav"
	$Emitter:	"dogs"
		$Volume:	0.2250
		$Min Delay:	4000
		$Max Delay:	9000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_animal_dog_c_1.wav"
		+File:	"amb_ext_animal_dog_c_2.wav"
		+File:	"amb_ext_animal_dog_c_3.wav"
	$Emitter:	"gunscarjack"
		$Volume:	0.2500
		$Min Delay:	10000
		$Max Delay:	20000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_gun_shot_1.wav"
		+File:	"amb_ext_gun_shot_3.wav"
		+File:	"amb_ext_gun_shot_5.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_overhead2"
	$Navpoint:	"amb_mp_coop_delivery_overhead2"
	$Shape:	"Cylinder"
		$Inner Radius:	182.88
		$Outer Radius:	239.50
		$Inner Height:	73.88
		$Outer Height:	89.88
	$Inner Offset:	<0 0.125000 0>
	$Emitter:	"cars"
		$Volume:	0.3500
		$Min Delay:	3000
		$Max Delay:	6000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_veh_drvby_car_1.wav"
		+File:	"amb_ext_veh_drvby_car_2.wav"
		+File:	"amb_ext_veh_drvby_car_3.wav"
	$Emitter:	"horns"
		$Volume:	0.2000
		$Min Delay:	5000
		$Max Delay:	15000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_car_horn_1.wav"
		+File:	"amb_ext_car_horn_2.wav"
		+File:	"amb_ext_car_horn_3.wav"
		+File:	"amb_ext_car_horn_4.wav"
		+File:	"amb_ext_car_horn_5.wav"
		+File:	"amb_ext_car_horn_6.wav"
	$Emitter:	"buses"
		$Volume:	0.1625
		$Min Delay:	25000
		$Max Delay:	30000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_veh_drvby_bus_1.wav"
		+File:	"amb_ext_veh_drvby_bus_2.wav"
		+File:	"amb_ext_veh_drvby_bus_3.wav"
	$Emitter:	"sirens"
		$Volume:	0.0750
		$Min Delay:	20000
		$Max Delay:	50000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_veh_siren_1.wav"
		+File:	"amb_ext_veh_siren_2.wav"
		+File:	"amb_ext_veh_siren_3.wav"
		+File:	"amb_ext_veh_siren_4.wav"
		+File:	"amb_ext_veh_siren_5.wav"
		+File:	"amb_ext_veh_siren_6.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_stripclub"
	$Navpoint:	"amb_mp_coop_delivery_stripclub"
	$Shape:	"Sphere"
		$Inner Radius:	1.00
		$Outer Radius:	15.25
	$Inner Offset:	<8.375000 0 -5.500000>
	$Emitter:	"list_0"
		$Volume:	0.3500
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_music_strip_club_1.wav"
		+File:	"amb_ext_music_strip_club_2.wav"
		+File:	"amb_ext_music_strip_club_3.wav"
		+File:	"amb_ext_music_strip_club_4.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_birds"
	$Navpoint:	"amb_mp_coop_delivery_birds"
	$Shape:	"Sphere"
		$Inner Radius:	0.13
		$Outer Radius:	27.25
	$Inner Offset:	<-12.875000 9 5.125000>
	$Emitter:	"list_0"
		$Volume:	0.1375
		$Min Delay:	400
		$Max Delay:	1000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+Silence on Weapon Fire
		+File:	"amb_ext_animal_bird_a_1.wav"
		+File:	"amb_ext_animal_bird_a_2.wav"
		+File:	"amb_ext_animal_bird_a_3.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_sportsfans"
	$Navpoint:	"amb_mp_coop_delivery_sportsfans"
	$Shape:	"Sphere"
		$Inner Radius:	10.38
		$Outer Radius:	55.13
	$Inner Offset:	<24.625000 0 5.250000>
	$Emitter:	"list_0"
		$Volume:	0.2875
		$Min Delay:	5000
		$Max Delay:	10000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_dia_sports_10.wav"
		+File:	"amb_ext_dia_sports_13.wav"
		+File:	"amb_ext_dia_sports_16.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_baby"
	$Navpoint:	"amb_mp_coop_delivery_baby"
	$Shape:	"Sphere"
		$Inner Radius:	2.00
		$Outer Radius:	28.38
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2250
		$Min Delay:	1500
		$Max Delay:	6000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_baby_cry_a_1.wav"
		+File:	"amb_int_baby_cry_a_2.wav"
		+File:	"amb_int_baby_cry_a_3.wav"
		+File:	"amb_int_baby_cry_a_4.wav"
		+File:	"amb_int_baby_cry_a_5.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_birds2"
	$Navpoint:	"amb_mp_coop_delivery_birds2"
	$Shape:	"Sphere"
		$Inner Radius:	4.88
		$Outer Radius:	44.25
	$Inner Offset:	<0 30.375000 16.750000>
	$Emitter:	"list_0"
		$Volume:	0.1250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+Silence on Weapon Fire
		+File:	"amb_ext_animal_bird_b_1.wav"
		+File:	"amb_ext_animal_bird_b_2.wav"
		+File:	"amb_ext_animal_bird_b_3.wav"
		+File:	"amb_ext_animal_bird_b_4.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_sex"
	$Navpoint:	"amb_mp_coop_delivery_sex"
	$Shape:	"Sphere"
		$Inner Radius:	0.13
		$Outer Radius:	47.38
	$Inner Offset:	<0 3.625000 0>
	$Emitter:	"list_0"
		$Volume:	0.2500
		$Min Delay:	6000
		$Max Delay:	30000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_walla_sex_2.wav"
		+File:	"amb_ext_walla_sex_3.wav"
		+File:	"amb_ext_walla_sex_4.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_chatter"
	$Navpoint:	"amb_mp_coop_delivery_chatter"
	$Shape:	"Sphere"
		$Inner Radius:	5.75
		$Outer Radius:	81.75
	$Inner Offset:	<15.250000 16.500000 -14.625000>
	$Emitter:	"list_0"
		$Volume:	0.2500
		$Min Delay:	10000
		$Max Delay:	15000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_dia_project_b_10.wav"
		+File:	"amb_ext_dia_project_b_11.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_pornmusic"
	$Navpoint:	"amb_mp_coop_delivery_pornmusic"
	$Shape:	"Sphere"
		$Inner Radius:	5.50
		$Outer Radius:	42.88
	$Inner Offset:	<0 6.750000 0>
	$Emitter:	"list_0"
		$Volume:	0.4125
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_porn_music_1.wav"
		+File:	"amb_ext_porn_music_2.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_liquorint"
	$Navpoint:	"amb_mp_coop_delivery_liquorint"
	$Shape:	"Box"
		$Inner Dimensions:	<20.375000 26.250000 26.875000>
		$Outer Dimensions:	<23.125000 28 28.125000>
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.1875
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_med_1.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_chatter2"
	$Navpoint:	"amb_mp_coop_delivery_chatter2"
	$Shape:	"Sphere"
		$Inner Radius:	4.38
		$Outer Radius:	47.88
	$Inner Offset:	<0 14.625000 2.375000>
	$Emitter:	"list_0"
		$Volume:	0.2750
		$Min Delay:	10000
		$Max Delay:	20000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_ext_walla_argue.wav"
		+File:	"amb_ext_walla_bum.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_stripint"
	$Navpoint:	"amb_mp_coop_delivery_stripint"
	$Shape:	"Box"
		$Inner Dimensions:	<34.250000 8.625000 5.750000>
		$Outer Dimensions:	<34.375000 9.375000 5.875000>
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2250
		$Min Delay:	0
		$Max Delay:	0
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_int_room_small_1.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_birds3"
	$Navpoint:	"amb_mp_coop_delivery_birds3"
	$Shape:	"Sphere"
		$Inner Radius:	4.00
		$Outer Radius:	42.13
	$Inner Offset:	<0 13.500000 0>
	$Emitter:	"list_0"
		$Volume:	0.2375
		$Min Delay:	300
		$Max Delay:	2000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+Silence on Weapon Fire
		+File:	"amb_ext_animal_bird_c_1.wav"
		+File:	"amb_ext_animal_bird_c_2.wav"
		+File:	"amb_ext_animal_bird_c_3.wav"
		+File:	"amb_ext_animal_bird_c_4.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_building"
	$Navpoint:	"amb_mp_coop_delivery_building"
	$Shape:	"Sphere"
		$Inner Radius:	8.75
		$Outer Radius:	37.13
	$Inner Offset:	<0 -3.500000 0>
	$Emitter:	"music"
		$Volume:	0.4125
		$Min Delay:	1000
		$Max Delay:	3000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"In Order"
		+File:	"amb_3hhtracks_3.wav"
	$Emitter:	"chatter"
		$Volume:	0.2500
		$Min Delay:	4000
		$Max Delay:	40000
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_dia_project_c_6.wav"
		+File:	"amb_ext_dia_project_c_7.wav"
		+File:	"amb_ext_dia_project_c_2.wav"
		+File:	"amb_ext_dia_project_c_5.wav"
	+Masked

$Ambient:	"amb_mp_coop_delivery_birds4"
	$Navpoint:	"amb_mp_coop_delivery_birds4"
	$Shape:	"Sphere"
		$Inner Radius:	4.00
		$Outer Radius:	40.00
	$Inner Offset:	<0 0 0>
	$Emitter:	"list_0"
		$Volume:	0.2625
		$Min Delay:	600
		$Max Delay:	1500
		$Min ToD:	0
		$Max ToD:	0
		$ToD Fade In:	0
		$ToD Fade Out:	0
		$Play Type:	"Random"
		+File:	"amb_ext_animal_bird_a_1.wav"
		+File:	"amb_ext_animal_bird_a_2.wav"
		+File:	"amb_ext_animal_bird_a_3.wav"
	+Masked

// ---------------
#Negative Regions
// ---------------

$Negative:	"amb_mp_coop_delivery_neg_strip"
	$Navpoint:	"amb_mp_coop_delivery_neg_strip"
	$Shape:	"Box"
		$Inner Dimensions:	<33.375000 8.875000 6.625000>
		$Outer Dimensions:	<33.875000 9.375000 9.250000>
	$Inner Offset:	<0 0 0.375000>
	$Min Volume:	0.120
	$LPF Send Level:	0.100
	$Reverb Send Level:	0.100
	+Masked

$Negative:	"amb_mp_coop_delivery_neg_liquor"
	$Navpoint:	"amb_mp_coop_delivery_neg_liquor"
	$Shape:	"Box"
		$Inner Dimensions:	<15.875000 6.750000 7.250000>
		$Outer Dimensions:	<16 8.500000 9.500000>
	$Inner Offset:	<0 0 0>
	$Min Volume:	0.400
	$LPF Send Level:	0.150
	$Reverb Send Level:	0.000
	+Masked

// ----------
#DSP Regions
// ----------

// -------------
#Audio Cluders
// -------------

// -------
#Nodes
// -------


#End
