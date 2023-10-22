// Created by Crowbar 0.74

$modelname "weapons/vinson/ptpov_vinson.mdl"

//$fadedist -1

$bodygroup "vinson"
{
	studio "v_vinson.smd"
}
$bodygroup "sight_hcog"
{
	blank
	studio "v_hcog.smd"
}
$bodygroup "sight_acgs"
{
	blank
	studio "v_acgs.smd"
}
$bodygroup "sight_cro"
{
	blank
	studio "v_cro.smd"
}
$bodygroup "proscreen"
{
	blank
	studio "v_proscreen.smd"
}
$bodygroup "sight_rear_on"
{
	blank
	studio "v_vinson_sight_rear.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models\weapons\attachments"
$cdmaterials "models\Weapons_R2\attachments"
$cdmaterials "models\weapons\vinson"
$cdmaterials ""

$texturegroup "skinfamilies"
{
	{ "vinson_rifle"          }
	{ "vinson_rifle_skin31"   }
	{ "vinson_rifle_prime_01" }
	{ "vinson_rifle_prime_02" }
	{ "vinson_rifle_prime_03" }
	{ "vinson_rifle_prime_04" }
	{ "vinson_rifle_prime_05" }
	{ "vinson_rifle_prime_06" }
	{ "vinson_rifle_prime_07" }
}

$attachment "CAMERA_BASE" "jx_c_pov" 0 0 0 rotate -90 -90 0
$attachment "CAMERA" "jx_c_camera" 0 0 0 rotate -90 -90 0
$attachment "L_HAND" "ja_l_propHand" 0 0 0 rotate -90 -90 0
$attachment "R_HAND" "ja_r_propHand" 0 0 0 rotate -90 -90 0
$attachment "SWAY_ROTATE" "weapon_bone" 0 0 0 rotate -90 90 0
$attachment "SWAY_ROTATE_ZOOMED" "muzzle_flash" 196.85 0 0 rotate 0 0 90
$attachment "L_BACKHAND" "def_l_wrist" 1.7 1.25 0.7 rotate 0 0 -90
$attachment "__illumPosition" "def_c_base" 0 0 0 rotate 0 0 0
$attachment "shell" "shell" 0 0 0 rotate 0 0 0
$attachment "muzzle_flash" "muzzle_flash" 0 0 0 rotate 0 0 0
$attachment "l_hand_ik" "l_hand_ik" 0 0 0 rotate 0 0 0
$attachment "r_hand_ik" "r_hand_ik" 0 0 0 rotate 0 0 0
$attachment "hcog" "def_c_hcog" 0 0 0 rotate -90 -90 0
$attachment "acgs" "def_c_acgs" 0 0 0 rotate -90 -90 0
$attachment "cro" "def_c_cro" 0 0 0 rotate -90 -90 0
$attachment "HCOG_FRONT" "def_c_hcog" 0 1.61 3.54 rotate -90 -90 0
$attachment "HCOG_REAR" "def_c_hcog" 0 1.61 1.56 rotate -90 -90 0
$attachment "ACGS_FRONT" "def_c_acgs" 0 1.22 1.69 rotate -90 -90 0
$attachment "ACGS_REAR" "def_c_acgs" 0 1.22 -1.74 rotate -90 -90 0
$attachment "SCR_BL_ACGS" "def_c_acgs" 0.75 0.75 0.33 rotate 0 -180 -180
$attachment "SCR_TR_ACGS" "def_c_acgs" -0.75 1.68 0.33 rotate 0 -180 -180
$attachment "CRO_FRONT" "def_c_cro" 0 1.24 1.4 rotate -90 -90 0
$attachment "CRO_REAR" "def_c_cro" 0 1.24 -0.32 rotate -90 -90 0
$attachment "SCR_BL_CRO" "def_c_cro" 0.62 0.78 0.33 rotate 0 -180 -180
$attachment "SCR_TR_CRO" "def_c_cro" -0.6 1.68 0.33 rotate 0 -180 -180
$attachment "proscreen" "def_c_proscreen" 0 0 0 rotate -90 -90 0
$attachment "HOLO_FRONT" "muzzle_flash" 196.85 3.33 -0.08 rotate 0 0 0
$attachment "HOLO_REAR" "muzzle_flash" -16.8 3.35 0 rotate 0 0 -90
$attachment "flyout" "def_c_base" 0.36 3.3 2.7 rotate -90 -90 0
$attachment "MENU_ROTATE" "weapon_bone" 0 0.79 4.72 rotate -90 -90 0

$cbox 0 0 0 0 0 0

$bbox -11.096 -1.579 -68.699 20.735 2.279 -55.946

$hboxset "emptyhitboxset"

$definebone "jx_c_delta" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "jx_c_pov" "jx_c_delta" 0 62.992001 0 0 0 0 0 0 0 0 0 0
$definebone "jx_c_camera" "jx_c_pov" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_hip" "jx_c_delta" 0 39.369999 0 0 0 0 0 0 0 0 0 0
$definebone "jx_c_start" "jx_c_delta" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_spineA" "def_c_hip" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_spineB" "def_c_spineA" 0 5.590542 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_spineC" "def_c_spineB" 0 5.55117 0 0 0 0 0 0 0 0 0 0
$definebone "ja_c_propGun" "def_c_spineC" 0 -7.204712 9.8425 0 0 0 0 0 0 0 0 0
$definebone "def_c_neckA" "def_c_spineC" 0 8.503922 -0.23622 0 0 0 0 0 0 0 0 0
$definebone "jx_c_neckB" "def_c_neckA" 0 4.370071 0.94488 0 0 0 0 0 0 0 0 0
$definebone "def_c_neckB" "jx_c_neckB" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_head" "def_c_neckB" 0 3.936996 0 0 0 0 0 0 0 0 0 0
$definebone "def_l_clav" "def_c_spineC" 1.176218 6.023808 -0.588109 6.983374 3.661928 0.44582 0 0 0 0 0 0
$definebone "def_l_shoulder" "def_l_clav" 5.448854 0.000011 0 -4.860232 -48.915267 4.890265 0 0 0 0 0 0
$definebone "def_l_shoulderTwist" "def_l_shoulder" 0 0 0 0 0.000002 0 0 0 0 0 0 0
$definebone "def_l_elbowB" "def_l_shoulder" 11.630213 -0.000008 0.000027 -44.997331 -0.027096 0.877916 0 0 0 0 0 0
$definebone "def_l_shoulderMid" "def_l_shoulder" 4.890762 0.000004 0 -2.688722 -0.057131 0.006099 0 0 0 0 0 0
$definebone "def_l_elbow" "def_l_shoulderMid" 6.444214 -0.000004 0 -37.014561 0.164812 0.006865 0 0 0 0 0 0
$definebone "def_l_forearm" "def_l_elbow" 4.63045 0.000011 0.000002 -5.291108 -0.116958 0.007797 0 0 0 0 0 0
$definebone "def_l_wrist" "def_l_elbow" 9.956749 -0.010864 0.493276 -5.403714 -0.039456 -0.000075 0 0 0 0 0 0
$definebone "def_l_finIndexA" "def_l_wrist" 3.077315 -0.138939 1.24732 -3.532782 -45.109219 3.539624 0 0 0 0 0 0
$definebone "def_l_finIndexB" "def_l_finIndexA" 1.748371 0 0.000002 -0.001187 -45.000005 0.001192 0 0 0 0 0 0
$definebone "def_l_finIndexC" "def_l_finIndexB" 1.19545 -0.000003 0.000002 0.000615 -45.000008 -0.000614 0 0 0 0 0 0
$definebone "def_l_finMidA" "def_l_wrist" 3.080781 -0.067951 0.349253 6.351203 -45.354918 -6.390478 0 0 0 0 0 0
$definebone "def_l_finMidB" "def_l_finMidA" 1.836349 0.000002 0.000002 0.000002 -45.000005 0.000002 0 0 0 0 0 0
$definebone "def_l_finMidC" "def_l_finMidB" 1.309196 -0.000001 0.000008 -0.002988 -45.000008 0.00298 0 0 0 0 0 0
$definebone "def_l_finThumbA" "def_l_wrist" 0.504171 -0.563503 0.770155 -42.349748 -57.483275 126.990511 0 0 0 0 0 0
$definebone "def_l_finThumbB" "def_l_finThumbA" 2.132282 0.000006 0.000004 3.259416 -22.647167 2.460338 0 0 0 0 0 0
$definebone "def_l_finThumbC" "def_l_finThumbB" 1.240841 -0.000003 0 0.074487 -45.185656 0.008913 0 0 0 0 0 0
$definebone "def_l_finRingCarpal" "def_l_wrist" 2.513066 -0.138184 -0.333538 17.995868 0.000025 0.000075 0 0 0 0 0 0
$definebone "def_l_finRingA" "def_l_finRingCarpal" 0.316793 0.000004 -0.000001 0.003163 -44.999994 -0.003168 0 0 0 0 0 0
$definebone "def_l_finRingB" "def_l_finRingA" 1.966316 0.000002 -0.000002 0.000002 -45.000001 0.000001 0 0 0 0 0 0
$definebone "def_l_finRingC" "def_l_finRingB" 1.00687 0.000001 0.000008 0.000598 -45.000008 -0.000594 0 0 0 0 0 0
$definebone "def_l_finPinkyA" "def_l_finRingCarpal" -0.030562 -0.172359 -0.590865 18.727351 -48.299806 -19.816788 0 0 0 0 0 0
$definebone "def_l_finPinkyB" "def_l_finPinkyA" 1.644444 -0.000002 0 0 -45.000005 0 0 0 0 0 0 0
$definebone "def_l_finPinkyC" "def_l_finPinkyB" 0.763287 -0.000002 0 0 -45.000005 0 0 0 0 0 0 0
$definebone "def_r_clav" "def_c_spineC" -1.176218 6.024002 -0.588109 -6.983374 -3.661928 -179.554171 0 0 0 0 0 0
$definebone "def_r_shoulder" "def_r_clav" -5.448845 0.000145 0 -4.860235 -48.915264 4.890268 0 0 0 0 0 0
$definebone "def_r_shoulderTwist" "def_r_shoulder" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_r_elbowB" "def_r_shoulder" -11.630196 0.000011 -0.000028 -44.997327 -0.027091 0.877916 0 0 0 0 0 0
$definebone "def_r_shoulderMid" "def_r_shoulder" -4.890709 -0.000069 -0.000002 -2.688722 -0.057138 0.006099 0 0 0 0 0 0
$definebone "def_r_elbow" "def_r_shoulderMid" -6.444286 0.00013 0.000005 -37.014561 0.164812 0.006865 0 0 0 0 0 0
$definebone "def_r_forearm" "def_r_elbow" -4.630386 -0.000137 -0.000053 -5.291104 -0.116958 0.007796 0 0 0 0 0 0
$definebone "def_r_wrist" "def_r_elbow" -9.956816 0.010937 -0.493216 -5.403711 -0.039457 -0.000077 0 0 0 0 0 0
$definebone "def_r_finIndexA" "def_r_wrist" -3.077376 0.138977 -1.247286 -3.532781 -45.109219 3.539621 0 0 0 0 0 0
$definebone "def_r_finIndexB" "def_r_finIndexA" -1.748192 0.000002 -0.000114 -0.001197 -45.000001 0.001184 0 0 0 0 0 0
$definebone "def_r_finIndexC" "def_r_finIndexB" -1.195347 0.00008 -0.000078 0.000611 -45.000005 -0.000613 0 0 0 0 0 0
$definebone "def_r_finMidA" "def_r_wrist" -3.08066 0.067764 -0.349348 6.351203 -45.354908 -6.390478 0 0 0 0 0 0
$definebone "def_r_finMidB" "def_r_finMidA" -1.836304 -0.000002 -0.00005 -0.000003 -44.999994 0.000005 0 0 0 0 0 0
$definebone "def_r_finMidC" "def_r_finMidB" -1.309258 -0.000061 0.000052 -0.002987 -45.000008 0.002984 0 0 0 0 0 0
$definebone "def_r_finThumbA" "def_r_wrist" -0.504133 0.563412 -0.770212 -42.349741 -57.483255 126.990511 0 0 0 0 0 0
$definebone "def_r_finThumbB" "def_r_finThumbA" -2.132332 0.000069 -0.00008 3.25942 -22.647166 2.460342 0 0 0 0 0 0
$definebone "def_r_finThumbC" "def_r_finThumbB" -1.240768 -0.000023 0.00005 0.074482 -45.185656 0.008905 0 0 0 0 0 0
$definebone "def_r_finRingCarpal" "def_r_wrist" -2.513052 0.138145 0.333541 17.995867 0.000031 0.000083 0 0 0 0 0 0
$definebone "def_r_finRingA" "def_r_finRingCarpal" -0.316674 -0.000145 -0.000084 0.003161 -45.000001 -0.003161 0 0 0 0 0 0
$definebone "def_r_finRingB" "def_r_finRingA" -1.966396 0.000031 0.000019 0.000002 -45.000005 0.000004 0 0 0 0 0 0
$definebone "def_r_finRingC" "def_r_finRingB" -1.006874 -0.000014 -0.000002 0.000599 -45.000005 -0.000595 0 0 0 0 0 0
$definebone "def_r_finPinkyA" "def_r_finRingCarpal" 0.030523 0.172421 0.590875 18.727346 -48.299795 -19.816788 0 0 0 0 0 0
$definebone "def_r_finPinkyB" "def_r_finPinkyA" -1.644104 -0.000021 0.00001 0 -45.000005 0 0 0 0 0 0 0
$definebone "def_r_finPinkyC" "def_r_finPinkyB" -0.763535 -0.000238 -0.000006 0 -45.000001 0 0 0 0 0 0 0
$definebone "def_l_thigh" "def_c_hip" 5.219006 -1.00618 -0.600196 -0.050695 -90.000003 90.000003 0 0 0 0 0 0
$definebone "def_l_knee" "def_l_thigh" 18.098003 0 0 0 -3.72269 0 0 0 0 0 0 0
$definebone "def_l_ankle" "def_l_knee" 17.311804 0 0 -3.795738 61.268573 0 0 0 0 0 0 0
$definebone "def_l_ball" "def_l_ankle" 5.292377 0 0 0.427673 29.592491 1.875762 0 0 0 0 0 0
$definebone "def_l_kneeB" "def_l_thigh" 18.246761 1.130153 0 0 -7.498168 0 0 0 0 0 0 0
$definebone "def_r_thigh" "def_c_hip" -5.219006 -1.00618 -0.600196 0.050695 90.000003 -90.000003 0 0 0 0 0 0
$definebone "def_r_knee" "def_r_thigh" -18.098003 0 0 0 -3.72269 0 0 0 0 0 0 0
$definebone "def_r_ankle" "def_r_knee" -17.311804 0 0 -3.795738 61.268573 0 0 0 0 0 0 0
$definebone "def_r_ball" "def_r_ankle" -5.292377 0 0 0.427673 29.592491 1.875761 0 0 0 0 0 0
$definebone "def_r_kneeB" "def_r_thigh" -18.246761 -1.130153 0 0 -7.498168 -0.000001 0 0 0 0 0 0
$definebone "ja_l_propHand" "def_l_wrist" 4.441361 -1.883156 0.77133 0.000002 0 -0.000002 0 0 0 0 0 0
$definebone "ja_r_propHand" "def_r_wrist" -4.441751 1.88372 -0.770998 0.000002 0 0.000003 0 0 0 0 0 0
$definebone "weapon_bone" "ja_c_propGun" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_front_top" "weapon_bone" 0 3.458828 10.61481 0 0 0 0 0 0 0 0 0
$definebone "ja_ads_attachment" "def_front_top" 0 1.416672 -1.965265 0 0 0 0 0 0 0 0 0
$definebone "def_c_acgs" "ja_ads_attachment" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_base" "weapon_bone" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_proscreen" "def_c_base" 0.256599 3.994209 12.348687 0 0 0 0 0 0 0 0 0
$definebone "def_options" "def_c_base" 0 2.031845 1.608554 0 0 0 0 0 0 0 0 0
$definebone "def_link_top" "def_c_base" 0 4.519615 2.946275 0 0 0 0 0 0 0 0 0
$definebone "def_link_mid" "def_c_base" 0 4.077068 5.705955 0 0 0 0 0 0 0 0 0
$definebone "def_release" "def_c_base" 0 3.385818 1.515664 0 0 0 0 0 0 0 0 0
$definebone "def_buttstock" "def_c_base" -0.483078 1.734535 -7.100667 0 0 0 0 0 0 0 0 0
$definebone "def_magazine" "def_c_base" 0 -2.081329 -4.974728 0 0 0 0 0 0 0 0 0
$definebone "def_c_cro" "ja_ads_attachment" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_hcog" "ja_ads_attachment" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_front_end" "def_c_base" 0 2.362202 10.739722 0 0 0 0 0 0 0 0 0
$definebone "def_barrel" "def_c_base" 0 2.362202 16.183918 0 0 0 0 0 0 0 0 0
$definebone "muzzle_flash" "def_barrel" 0 0.039063 4.496695 -89.999962 0 0 0 0 0 0 0 0
$definebone "shell" "def_c_base" -0.308629 3.222576 -0.175123 -28.696944 -178.606141 -16.332154 0 0 0 0 0 0
$definebone "def_sight" "def_c_base" 0 5.644188 4.067344 0 0 0 0 0 0 0 0 0
$definebone "l_hand_ik" "def_c_base" 1.036289 -1.179802 -2.654382 -78.171679 47.298374 -133.096481 0 0 0 0 0 0
$definebone "r_hand_ik" "def_c_base" -1.677939 -0.147198 4.908691 81.334063 165.511097 -125.028156 0 0 0 0 0 0

$bonemerge "jx_c_delta"
$bonemerge "jx_c_pov"
$bonemerge "jx_c_camera"
$bonemerge "def_c_hip"
$bonemerge "jx_c_start"
$bonemerge "def_c_spineA"
$bonemerge "def_c_spineB"
$bonemerge "def_c_spineC"
$bonemerge "ja_c_propGun"
$bonemerge "def_c_neckA"
$bonemerge "jx_c_neckB"
$bonemerge "def_c_neckB"
$bonemerge "def_c_head"
$bonemerge "def_l_clav"
$bonemerge "def_l_shoulder"
$bonemerge "def_l_shoulderTwist"
$bonemerge "def_l_elbowB"
$bonemerge "def_l_shoulderMid"
$bonemerge "def_l_elbow"
$bonemerge "def_l_forearm"
$bonemerge "def_l_wrist"
$bonemerge "def_l_finIndexA"
$bonemerge "def_l_finIndexB"
$bonemerge "def_l_finIndexC"
$bonemerge "def_l_finMidA"
$bonemerge "def_l_finMidB"
$bonemerge "def_l_finMidC"
$bonemerge "def_l_finThumbA"
$bonemerge "def_l_finThumbB"
$bonemerge "def_l_finThumbC"
$bonemerge "def_l_finRingCarpal"
$bonemerge "def_l_finRingA"
$bonemerge "def_l_finRingB"
$bonemerge "def_l_finRingC"
$bonemerge "def_l_finPinkyA"
$bonemerge "def_l_finPinkyB"
$bonemerge "def_l_finPinkyC"
$bonemerge "def_r_clav"
$bonemerge "def_r_shoulder"
$bonemerge "def_r_shoulderTwist"
$bonemerge "def_r_elbowB"
$bonemerge "def_r_shoulderMid"
$bonemerge "def_r_elbow"
$bonemerge "def_r_forearm"
$bonemerge "def_r_wrist"
$bonemerge "def_r_finIndexA"
$bonemerge "def_r_finIndexB"
$bonemerge "def_r_finIndexC"
$bonemerge "def_r_finMidA"
$bonemerge "def_r_finMidB"
$bonemerge "def_r_finMidC"
$bonemerge "def_r_finThumbA"
$bonemerge "def_r_finThumbB"
$bonemerge "def_r_finThumbC"
$bonemerge "def_r_finRingCarpal"
$bonemerge "def_r_finRingA"
$bonemerge "def_r_finRingB"
$bonemerge "def_r_finRingC"
$bonemerge "def_r_finPinkyA"
$bonemerge "def_r_finPinkyB"
$bonemerge "def_r_finPinkyC"
$bonemerge "def_l_thigh"
$bonemerge "def_l_knee"
$bonemerge "def_l_ankle"
$bonemerge "def_l_ball"
$bonemerge "def_l_kneeB"
$bonemerge "def_r_thigh"
$bonemerge "def_r_knee"
$bonemerge "def_r_ankle"
$bonemerge "def_r_ball"
$bonemerge "def_r_kneeB"
$bonemerge "ja_l_propHand"
$bonemerge "ja_r_propHand"

$jigglebone "def_link_top"
{
	is_flexible
	{
		length 35
		tip_mass 300
		pitch_stiffness 800
		pitch_damping 20
		yaw_stiffness 100
		yaw_damping 0
		along_stiffness 100
		along_damping 0
		pitch_constraint -30.000001 5
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint 0 0
		yaw_friction 0
		yaw_bounce 0
	}
}
$jigglebone "def_link_mid"
{
	is_flexible
	{
		length 35
		tip_mass 300
		pitch_stiffness 800
		pitch_damping 20
		yaw_stiffness 100
		yaw_damping 0
		along_stiffness 100
		along_damping 0
		pitch_constraint -25 10
		pitch_friction 0
		pitch_bounce 0
		yaw_constraint 0 0
		yaw_friction 0
		yaw_bounce 0
	}
}

$sectionframes 30 190

$poseparameter "sprintfrac" 0 1 loop 0
$poseparameter "velocity" 0 173 loop 0
$poseparameter "ads_blend" 0 1 loop 0

$weightlist "weights_optic_layer" {
	 "jx_c_delta" 0
	 "jx_c_pov" 0
	 "jx_c_camera" 0
	 "def_c_hip" 0
	 "jx_c_start" 0
	 "def_c_spineA" 0
	 "def_c_spineB" 0
	 "def_c_spineC" 0
	 "ja_c_propGun" 0
	 "def_c_neckA" 0
	 "jx_c_neckB" 0
	 "def_c_neckB" 0
	 "def_c_head" 0
	 "def_l_clav" 0
	 "def_l_shoulder" 0
	 "def_l_shoulderTwist" 0
	 "def_l_elbowB" 0
	 "def_l_shoulderMid" 0
	 "def_l_elbow" 0
	 "def_l_forearm" 0
	 "def_l_wrist" 0
	 "def_l_finIndexA" 0
	 "def_l_finIndexB" 0
	 "def_l_finIndexC" 0
	 "def_l_finMidA" 0
	 "def_l_finMidB" 0
	 "def_l_finMidC" 0
	 "def_l_finThumbA" 0
	 "def_l_finThumbB" 0
	 "def_l_finThumbC" 0
	 "def_l_finRingCarpal" 0
	 "def_l_finRingA" 0
	 "def_l_finRingB" 0
	 "def_l_finRingC" 0
	 "def_l_finPinkyA" 0
	 "def_l_finPinkyB" 0
	 "def_l_finPinkyC" 0
	 "def_r_clav" 0
	 "def_r_shoulder" 0
	 "def_r_shoulderTwist" 0
	 "def_r_elbowB" 0
	 "def_r_shoulderMid" 0
	 "def_r_elbow" 0
	 "def_r_forearm" 0
	 "def_r_wrist" 0
	 "def_r_finIndexA" 0
	 "def_r_finIndexB" 0
	 "def_r_finIndexC" 0
	 "def_r_finMidA" 0
	 "def_r_finMidB" 0
	 "def_r_finMidC" 0
	 "def_r_finThumbA" 0
	 "def_r_finThumbB" 0
	 "def_r_finThumbC" 0
	 "def_r_finRingCarpal" 0
	 "def_r_finRingA" 0
	 "def_r_finRingB" 0
	 "def_r_finRingC" 0
	 "def_r_finPinkyA" 0
	 "def_r_finPinkyB" 0
	 "def_r_finPinkyC" 0
	 "def_l_thigh" 0
	 "def_l_knee" 0
	 "def_l_ankle" 0
	 "def_l_ball" 0
	 "def_l_kneeB" 0
	 "def_r_thigh" 0
	 "def_r_knee" 0
	 "def_r_ankle" 0
	 "def_r_ball" 0
	 "def_r_kneeB" 0
	 "ja_l_propHand" 0
	 "ja_r_propHand" 0
	 "weapon_bone" 0
	 "def_front_top" 0
	 "ja_ads_attachment" 2
	 "def_c_acgs" 2
	 "def_c_base" 0
	 "def_c_proscreen" 2
	 "def_options" 0
	 "def_link_top" 0
	 "def_link_mid" 0
	 "def_release" 0
	 "def_buttstock" 0
	 "def_magazine" 0
	 "def_c_cro" 2
	 "def_c_hcog" 2
	 "def_front_end" 0
	 "def_barrel" 0
	 "muzzle_flash" 0
	 "shell" 0
	 "def_sight" 0
	 "l_hand_ik" 0
	 "r_hand_ik" 0
}

$weightlist "weights_wind_loop_layer" {
	 "jx_c_delta" 0
	 "jx_c_pov" 1
	 "jx_c_camera" 1
	 "def_c_hip" 0
	 "jx_c_start" 0
	 "def_c_spineA" 0
	 "def_c_spineB" 0
	 "def_c_spineC" 0
	 "ja_c_propGun" 0
	 "def_c_neckA" 0
	 "jx_c_neckB" 0
	 "def_c_neckB" 0
	 "def_c_head" 0
	 "def_l_clav" 1
	 "def_l_shoulder" 1
	 "def_l_shoulderTwist" 1
	 "def_l_elbowB" 1
	 "def_l_shoulderMid" 1
	 "def_l_elbow" 1
	 "def_l_forearm" 1
	 "def_l_wrist" 1
	 "def_l_finIndexA" 1
	 "def_l_finIndexB" 1
	 "def_l_finIndexC" 1
	 "def_l_finMidA" 1
	 "def_l_finMidB" 1
	 "def_l_finMidC" 1
	 "def_l_finThumbA" 1
	 "def_l_finThumbB" 1
	 "def_l_finThumbC" 1
	 "def_l_finRingCarpal" 1
	 "def_l_finRingA" 1
	 "def_l_finRingB" 1
	 "def_l_finRingC" 1
	 "def_l_finPinkyA" 1
	 "def_l_finPinkyB" 1
	 "def_l_finPinkyC" 1
	 "def_r_clav" 0
	 "def_r_shoulder" 0
	 "def_r_shoulderTwist" 0
	 "def_r_elbowB" 0
	 "def_r_shoulderMid" 0
	 "def_r_elbow" 0
	 "def_r_forearm" 0
	 "def_r_wrist" 0
	 "def_r_finIndexA" 0
	 "def_r_finIndexB" 0
	 "def_r_finIndexC" 0
	 "def_r_finMidA" 0
	 "def_r_finMidB" 0
	 "def_r_finMidC" 0
	 "def_r_finThumbA" 0
	 "def_r_finThumbB" 0
	 "def_r_finThumbC" 0
	 "def_r_finRingCarpal" 0
	 "def_r_finRingA" 0
	 "def_r_finRingB" 0
	 "def_r_finRingC" 0
	 "def_r_finPinkyA" 0
	 "def_r_finPinkyB" 0
	 "def_r_finPinkyC" 0
	 "def_l_thigh" 0
	 "def_l_knee" 0
	 "def_l_ankle" 0
	 "def_l_ball" 0
	 "def_l_kneeB" 0
	 "def_r_thigh" 0
	 "def_r_knee" 0
	 "def_r_ankle" 0
	 "def_r_ball" 0
	 "def_r_kneeB" 0
	 "ja_l_propHand" 1
	 "ja_r_propHand" 0
	 "weapon_bone" 0
	 "def_front_top" 0
	 "ja_ads_attachment" 0
	 "def_c_acgs" 0
	 "def_c_base" 0
	 "def_c_proscreen" 0
	 "def_options" 0
	 "def_link_top" 0
	 "def_link_mid" 0
	 "def_release" 0
	 "def_buttstock" 0
	 "def_magazine" 0
	 "def_c_cro" 0
	 "def_c_hcog" 0
	 "def_front_end" 0
	 "def_barrel" 0
	 "muzzle_flash" 0
	 "shell" 0
	 "def_sight" 0
	 "l_hand_ik" 0
	 "r_hand_ik" 0
}

$weightlist "weights_idle_seq" {
	 "jx_c_delta" 0
	 "jx_c_pov" 0
	 "jx_c_camera" 0
	 "def_c_hip" 0
	 "jx_c_start" 0
	 "def_c_spineA" 0
	 "def_c_spineB" 0
	 "def_c_spineC" 0
	 "ja_c_propGun" 0
	 "def_c_neckA" 0
	 "jx_c_neckB" 0
	 "def_c_neckB" 0
	 "def_c_head" 0
	 "def_l_clav" 0
	 "def_l_shoulder" 0
	 "def_l_shoulderTwist" 0
	 "def_l_elbowB" 0
	 "def_l_shoulderMid" 0
	 "def_l_elbow" 0
	 "def_l_forearm" 0
	 "def_l_wrist" 0
	 "def_l_finIndexA" 0
	 "def_l_finIndexB" 0
	 "def_l_finIndexC" 0
	 "def_l_finMidA" 0
	 "def_l_finMidB" 0
	 "def_l_finMidC" 0
	 "def_l_finThumbA" 0
	 "def_l_finThumbB" 0
	 "def_l_finThumbC" 0
	 "def_l_finRingCarpal" 0
	 "def_l_finRingA" 0
	 "def_l_finRingB" 0
	 "def_l_finRingC" 0
	 "def_l_finPinkyA" 0
	 "def_l_finPinkyB" 0
	 "def_l_finPinkyC" 0
	 "def_r_clav" 0
	 "def_r_shoulder" 0
	 "def_r_shoulderTwist" 0
	 "def_r_elbowB" 0
	 "def_r_shoulderMid" 0
	 "def_r_elbow" 0
	 "def_r_forearm" 0
	 "def_r_wrist" 0
	 "def_r_finIndexA" 0
	 "def_r_finIndexB" 0
	 "def_r_finIndexC" 0
	 "def_r_finMidA" 0
	 "def_r_finMidB" 0
	 "def_r_finMidC" 0
	 "def_r_finThumbA" 0
	 "def_r_finThumbB" 0
	 "def_r_finThumbC" 0
	 "def_r_finRingCarpal" 0
	 "def_r_finRingA" 0
	 "def_r_finRingB" 0
	 "def_r_finRingC" 0
	 "def_r_finPinkyA" 0
	 "def_r_finPinkyB" 0
	 "def_r_finPinkyC" 0
	 "def_l_thigh" 0
	 "def_l_knee" 0
	 "def_l_ankle" 0
	 "def_l_ball" 0
	 "def_l_kneeB" 0
	 "def_r_thigh" 0
	 "def_r_knee" 0
	 "def_r_ankle" 0
	 "def_r_ball" 0
	 "def_r_kneeB" 0
	 "ja_l_propHand" 0
	 "ja_r_propHand" 0
	 "weapon_bone" 0
	 "def_front_top" 0
	 "ja_ads_attachment" 0
	 "def_c_acgs" 0
	 "def_c_base" 0
	 "def_c_proscreen" 0
	 "def_options" 0
	 "def_link_top" 0
	 "def_link_mid" 0
	 "def_release" 0
	 "def_buttstock" 0
	 "def_magazine" 0
	 "def_c_cro" 0
	 "def_c_hcog" 0
	 "def_front_end" 0
	 "def_barrel" 0
	 "muzzle_flash" 0
	 "shell" 0
	 "def_sight" 0
	 "l_hand_ik" 0
	 "r_hand_ik" 0
}

$animation "ads_in_anim" "ptpov_vinson_anims\ads_in_anim.smd" {
	fps 30
}

$animation "ads_out_anim" "ptpov_vinson_anims\ads_out_anim.smd" {
	fps 30
}

$animation "ads_in_anim_alt1" "ptpov_vinson_anims\ads_in_anim_alt1.smd" {
	fps 30
}

$animation "ads_out_anim_alt1" "ptpov_vinson_anims\ads_out_anim_alt1.smd" {
	fps 30
}

$animation "ads_in_anim_alt2" "ptpov_vinson_anims\ads_in_anim_alt2.smd" {
	fps 30
}

$animation "ads_out_anim_alt2" "ptpov_vinson_anims\ads_out_anim_alt2.smd" {
	fps 30
}

$animation "ads_in_anim_alt3" "ptpov_vinson_anims\ads_in_anim_alt3.smd" {
	fps 30
}

$animation "ads_out_anim_alt3" "ptpov_vinson_anims\ads_out_anim_alt3.smd" {
	fps 30
}

$animation "ads_in_slide_anim" "ptpov_vinson_anims\ads_in_slide_anim.smd" {
	fps 30
}

$animation "ads_out_slide_anim" "ptpov_vinson_anims\ads_out_slide_anim.smd" {
	fps 30
}

$animation "ads_in_slide_hcog_anim" "ptpov_vinson_anims\ads_in_slide_hcog_anim.smd" {
	fps 30
}

$animation "ads_out_slide_hcog_anim" "ptpov_vinson_anims\ads_out_slide_hcog_anim.smd" {
	fps 30
}

$animation "ads_in_slide_holo_anim" "ptpov_vinson_anims\ads_in_slide_holo_anim.smd" {
	fps 30
}

$animation "ads_out_slide_holo_anim" "ptpov_vinson_anims\ads_out_slide_holo_anim.smd" {
	fps 30
}

$animation "ads_in_slide_aog_anim" "ptpov_vinson_anims\ads_in_slide_aog_anim.smd" {
	fps 30
}

$animation "ads_out_slide_aog_anim" "ptpov_vinson_anims\ads_out_slide_aog_anim.smd" {
	fps 30
}

$animation "ads_in_anim_air" "ptpov_vinson_anims\ads_in_anim_air.smd" {
	fps 30
}

$animation "ads_out_anim_air" "ptpov_vinson_anims\ads_out_anim_air.smd" {
	fps 30
}

$animation "ads_in_onehanded_anim" "ptpov_vinson_anims\ads_in_onehanded_anim.smd" {
	fps 30
}

$animation "ads_out_onehanded_anim" "ptpov_vinson_anims\ads_out_onehanded_anim.smd" {
	fps 30
}

$animation "ads_in_onehanded_anim_alt1" "ptpov_vinson_anims\ads_in_onehanded_anim_alt1.smd" {
	fps 30
}

$animation "ads_out_onehanded_anim_alt1" "ptpov_vinson_anims\ads_out_onehanded_anim_alt1.smd" {
	fps 30
}

$animation "ads_in_onehanded_anim_alt2" "ptpov_vinson_anims\ads_in_onehanded_anim_alt2.smd" {
	fps 30
}

$animation "ads_out_onehanded_anim_alt2" "ptpov_vinson_anims\ads_out_onehanded_anim_alt2.smd" {
	fps 30
}

$animation "ads_in_onehanded_anim_alt3" "ptpov_vinson_anims\ads_in_onehanded_anim_alt3.smd" {
	fps 30
}

$animation "ads_out_onehanded_anim_alt3" "ptpov_vinson_anims\ads_out_onehanded_anim_alt3.smd" {
	fps 30
}

$animation "run_anim_static" "ptpov_vinson_anims\run_anim_static.smd" {
	fps 36
	loop
}

$animation "run_anim" "ptpov_vinson_anims\run_anim.smd" {
	fps 36
	loop
}

$animation "run_anim_layer" "ptpov_vinson_anims\run_anim_layer.smd" {
	fps 33
	loop
}

$animation "walk_anim_static" "ptpov_vinson_anims\walk_anim_static.smd" {
	fps 35
	loop
}

$animation "walk_anim" "ptpov_vinson_anims\walk_anim.smd" {
	fps 35
	loop
}

$animation "walk_ads_anim" "ptpov_vinson_anims\walk_ads_anim.smd" {
	fps 35
	loop
}

$animation "walk_anim_nocam" "ptpov_vinson_anims\walk_anim_nocam.smd" {
	fps 35
	loop
}

$animation "idle_anim_autoplay" "ptpov_vinson_anims\idle_anim_autoplay.smd" {
	fps 30
	loop
}

$animation "idle_ads_anim_autoplay" "ptpov_vinson_anims\idle_ads_anim_autoplay.smd" {
	fps 30
	loop
}

$animation "idle_anim_air" "ptpov_vinson_anims\idle_anim_air.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_anim" "ptpov_vinson_anims\idle_anim.smd" {
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$animation "idle_ads_anim" "ptpov_vinson_anims\idle_ads_anim.smd" {
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$animation "idle_ads_anim_alt1" "ptpov_vinson_anims\idle_ads_anim_alt1.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_ads_anim_alt2" "ptpov_vinson_anims\idle_ads_anim_alt2.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_ads_anim_alt3" "ptpov_vinson_anims\idle_ads_anim_alt3.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_onehanded_anim" "ptpov_vinson_anims\idle_onehanded_anim.smd" {
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$animation "idle_onehanded_ads_anim" "ptpov_vinson_anims\idle_onehanded_ads_anim.smd" {
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$animation "idle_onehanded_ads_anim_alt1" "ptpov_vinson_anims\idle_onehanded_ads_anim_alt1.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_onehanded_ads_anim_alt2" "ptpov_vinson_anims\idle_onehanded_ads_anim_alt2.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_onehanded_ads_anim_alt3" "ptpov_vinson_anims\idle_onehanded_ads_anim_alt3.smd" {
	fps 30
	loop
	noanimation
}

$animation "idle_check_anim" "ptpov_vinson_anims\idle_check_anim.smd" {
	fps 30
}

$animation "idle_check_ads_anim" "ptpov_vinson_anims\idle_check_ads_anim.smd" {
	fps 30
}

$animation "idle_check_anim_nod" "ptpov_vinson_anims\idle_check_anim_nod.smd" {
	fps 30
}

$animation "attack_anim" "ptpov_vinson_anims\attack_anim.smd" {
	fps 30
}

$animation "attack_ads_anim" "ptpov_vinson_anims\attack_ads_anim.smd" {
	fps 30
}

$animation "attack_ads_anim_alt1" "ptpov_vinson_anims\attack_ads_anim_alt1.smd" {
	fps 30
}

$animation "attack_ads_anim_alt2" "ptpov_vinson_anims\attack_ads_anim_alt2.smd" {
	fps 30
}

$animation "attack_ads_anim_alt3" "ptpov_vinson_anims\attack_ads_anim_alt3.smd" {
	fps 30
}

$animation "attack_slide_anim" "ptpov_vinson_anims\attack_slide_anim.smd" {
	fps 30
}

$animation "attack_onehanded_anim" "ptpov_vinson_anims\attack_onehanded_anim.smd" {
	fps 30
}

$animation "attack_onehanded_ads_anim" "ptpov_vinson_anims\attack_onehanded_ads_anim.smd" {
	fps 30
}

$animation "attack_onehanded_ads_anim_alt1" "ptpov_vinson_anims\attack_onehanded_ads_anim_alt1.smd" {
	fps 30
}

$animation "attack_onehanded_ads_anim_alt2" "ptpov_vinson_anims\attack_onehanded_ads_anim_alt2.smd" {
	fps 30
}

$animation "attack_onehanded_ads_anim_alt3" "ptpov_vinson_anims\attack_onehanded_ads_anim_alt3.smd" {
	fps 30
}

$animation "reload_late1_anim" "ptpov_vinson_anims\reload_late1_anim.smd" {
	fps 30
}

$animation "reload_empty_late1_anim" "ptpov_vinson_anims\reload_empty_late1_anim.smd" {
	fps 30
}

$animation "reload_empty_late2_anim" "ptpov_vinson_anims\reload_empty_late2_anim.smd" {
	fps 30
}

$animation "reload_onehanded_late1_anim" "ptpov_vinson_anims\reload_onehanded_late1_anim.smd" {
	fps 30
}

$animation "reload_empty_onehanded_late1_anim" "ptpov_vinson_anims\reload_empty_onehanded_late1_anim.smd" {
	fps 30
}

$animation "reload_empty_onehanded_late2_anim" "ptpov_vinson_anims\reload_empty_onehanded_late2_anim.smd" {
	fps 30
}

$animation "reload_late1_crouch_anim" "ptpov_vinson_anims\reload_late1_crouch_anim.smd" {
	fps 30
}

$animation "reload_empty_late1_crouch_anim" "ptpov_vinson_anims\reload_empty_late1_crouch_anim.smd" {
	fps 30
}

$animation "reload_empty_late2_crouch_anim" "ptpov_vinson_anims\reload_empty_late2_crouch_anim.smd" {
	fps 30
}

$animation "reload_onehanded_late1_crouch_anim" "ptpov_vinson_anims\reload_onehanded_late1_crouch_anim.smd" {
	fps 30
}

$animation "reload_empty_onehanded_late1_crouch_anim" "ptpov_vinson_anims\reload_empty_onehanded_late1_crouch_anim.smd" {
	fps 30
}

$animation "reload_empty_onehanded_late2_crouch_anim" "ptpov_vinson_anims\reload_empty_onehanded_late2_crouch_anim.smd" {
	fps 30
}

$animation "switch_to_onehanded_anim" "ptpov_vinson_anims\switch_to_onehanded_anim.smd" {
	fps 30
}

$animation "switch_to_twohanded_anim" "ptpov_vinson_anims\switch_to_twohanded_anim.smd" {
	fps 30
}

$animation "switch_to_jump_anim" "ptpov_vinson_anims\switch_to_jump_anim.smd" {
	fps 30
}

$animation "switch_to_land_anim" "ptpov_vinson_anims\switch_to_land_anim.smd" {
	fps 30
}

$animation "switch_to_jump_crouch_anim" "ptpov_vinson_anims\switch_to_jump_crouch_anim.smd" {
	fps 30
}

$animation "switch_to_land_crouch_anim" "ptpov_vinson_anims\switch_to_land_crouch_anim.smd" {
	fps 30
}

$animation "switch_to_jump_ads_anim" "ptpov_vinson_anims\switch_to_jump_ads_anim.smd" {
	fps 30
}

$animation "switch_to_land_ads_anim" "ptpov_vinson_anims\switch_to_land_ads_anim.smd" {
	fps 30
}

$animation "iron_anim" "ptpov_vinson_anims\iron_anim.smd" {
	fps 30
}

$animation "iron_anim_nod" "ptpov_vinson_anims\iron_anim_nod.smd" {
	fps 30
}

$animation "holo_anim" "ptpov_vinson_anims\holo_anim.smd" {
	fps 30
}

$animation "hcog_anim" "ptpov_vinson_anims\hcog_anim.smd" {
	fps 30
}

$animation "aog_anim" "ptpov_vinson_anims\aog_anim.smd" {
	fps 30
}

$animation "sprintraise_onehanded_slide_anim" "ptpov_vinson_anims\sprintraise_onehanded_slide_anim.smd" {
	fps 30
}

$animation "optic_anim_layer" "ptpov_vinson_anims\optic_anim_layer.smd" {
	fps 40
	loop
	weightlist "weights_optic_layer"
}

$animation "optic_anim_layer_ads" "ptpov_vinson_anims\optic_anim_layer_ads.smd" {
	fps 30
	loop
	noanimation
	weightlist "weights_optic_layer"
}

$animation "wind_loop_anim_layer" "ptpov_vinson_anims\wind_loop_anim_layer.smd" {
	fps 30
	loop
	weightlist "weights_wind_loop_layer"
}

$animation "wind_loop_ads_anim_layer" "ptpov_vinson_anims\wind_loop_ads_anim_layer.smd" {
	fps 30
	loop
	weightlist "weights_wind_loop_layer"
}

$sequence "ref" {
	"ptpov_vinson_anims\ref.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "walk_seq" {
	"walk_anim_static"
	"walk_anim"
	"walk_anim_static"
	"walk_ads_anim"
	blend "velocity" 0 173
	blend "ads_blend" 0 1
	delta
	fadein 0.2
	fadeout 0.2
	realtime
	fps 35
	loop
}

$sequence "walk_seq_nocam" {
	"walk_anim_static"
	"walk_anim_nocam"
	"walk_anim_static"
	"walk_ads_anim"
	blend "velocity" 0 173
	blend "ads_blend" 0 1
	delta
	fadein 0.2
	fadeout 0.2
	realtime
	fps 35
	loop
}

$sequence "attack_onehanded_slide_manual_seq" {
	"attack_slide_anim"
	"attack_ads_anim"
	activity "ACT_VM_ONEHANDED_PRIMARYATTACK" 6000
	activitymodifier sliding
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "attack_onehanded_crouch_manual_seq" {
	"attack_slide_anim"
	"attack_ads_anim"
	activity "ACT_VM_PRIMARYATTACK" 1
	activitymodifier crouch
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "attack_onehanded_slide_manual_seq_alt1" {
	"attack_slide_anim"
	"attack_ads_anim_alt1"
	activity "ACT_VM_ONEHANDED_PRIMARYATTACK_ALT1" 6000
	activitymodifier sliding
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "attack_onehanded_crouch_manual_seq_alt1" {
	"attack_slide_anim"
	"attack_ads_anim_alt1"
	activity "ACT_VM_PRIMARYATTACK_ALT1" 1
	activitymodifier crouch
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "reload_seq" {
	"ptpov_vinson_anims\reload_seq.smd"
	activity "ACT_VM_RELOAD" 1
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 13 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 42 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 45 "" }
	{ event AE_WPN_READYTOFIRE 60 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_late1_seq" {
	"reload_late1_anim"
	activity "ACT_VM_RELOAD_LATE1" 1
	{ event AE_CL_PLAYSOUND 2 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 8 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 11 "" }
	{ event AE_WPN_READYTOFIRE 26 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_empty_seq" {
	"ptpov_vinson_anims\reload_empty_seq.smd"
	activity "ACT_VM_RELOADEMPTY" 1
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_WPN_RELOAD_MILESTONE_2 45 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 54 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 13 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 42 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 58 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 62 "" }
	{ event AE_WPN_READYTOFIRE 76 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_empty_late1_seq" {
	"reload_empty_late1_anim"
	activity "ACT_VM_RELOADEMPTY_LATE1" 1
	{ event AE_WPN_RELOAD_MILESTONE_2 11 "" }
	{ event AE_CL_PLAYSOUND 2 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 20 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 8 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 24 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 28 "" }
	{ event AE_WPN_READYTOFIRE 42 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_empty_late2_seq" {
	"reload_empty_late2_anim"
	activity "ACT_VM_RELOADEMPTY_LATE2" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 3 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 7 "" }
	{ event AE_WPN_READYTOFIRE 21 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_onehanded_seq" {
	"ptpov_vinson_anims\reload_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_RELOAD" 1
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 12 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 40 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 45 "" }
	{ event AE_WPN_READYTOFIRE 60 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "reload_onehanded_late1_seq" {
	"reload_onehanded_late1_anim"
	activity "ACT_VM_ONEHANDED_RELOAD_LATE1" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 3 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 11 "" }
	{ event AE_WPN_READYTOFIRE 26 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "reload_empty_onehanded_seq" {
	"ptpov_vinson_anims\reload_empty_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_RELOADEMPTY" 1
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_WPN_RELOAD_MILESTONE_2 45 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 54 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 13 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 40 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 58 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 62 "" }
	{ event AE_WPN_READYTOFIRE 76 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "reload_empty_onehanded_late1_seq" {
	"reload_empty_onehanded_late1_anim"
	activity "ACT_VM_ONEHANDED_RELOADEMPTY_LATE1" 1
	{ event AE_WPN_RELOAD_MILESTONE_2 11 "" }
	{ event AE_CL_PLAYSOUND 2 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 20 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 6 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 24 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 28 "" }
	{ event AE_WPN_READYTOFIRE 42 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "reload_empty_onehanded_late2_seq" {
	"reload_empty_onehanded_late2_anim"
	activity "ACT_VM_ONEHANDED_RELOADEMPTY_LATE2" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 3 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 7 "" }
	{ event AE_WPN_READYTOFIRE 21 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "reload_crouch_seq" {
	"ptpov_vinson_anims\reload_crouch_seq.smd"
	activity "ACT_VM_RELOAD" 1
	activitymodifier crouch
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 13 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 42 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 45 "" }
	{ event AE_WPN_READYTOFIRE 60 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "reload_late1_crouch_seq" {
	"reload_late1_crouch_anim"
	activity "ACT_VM_RELOAD_LATE1" 1
	activitymodifier crouch
	{ event AE_CL_PLAYSOUND 2 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 8 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 11 "" }
	{ event AE_WPN_READYTOFIRE 26 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_empty_crouch_seq" {
	"ptpov_vinson_anims\reload_empty_crouch_seq.smd"
	activity "ACT_VM_RELOADEMPTY" 1
	activitymodifier crouch
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_WPN_RELOAD_MILESTONE_2 45 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 54 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 13 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 42 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 58 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 62 "" }
	{ event AE_WPN_READYTOFIRE 46 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_empty_late1_crouch_seq" {
	"reload_empty_late1_crouch_anim"
	activity "ACT_VM_RELOADEMPTY_LATE1" 1
	activitymodifier crouch
	{ event AE_WPN_RELOAD_MILESTONE_2 11 "" }
	{ event AE_CL_PLAYSOUND 2 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 20 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 8 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 24 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 28 "" }
	{ event AE_WPN_READYTOFIRE 42 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_empty_late2_crouch_seq" {
	"reload_empty_late2_crouch_anim"
	activity "ACT_VM_RELOADEMPTY_LATE2" 1
	activitymodifier crouch
	{ event AE_CL_PLAYSOUND 0 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 3 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 7 "" }
	{ event AE_WPN_READYTOFIRE 21 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer_reload" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "reload_onehanded_crouch_seq" {
	"ptpov_vinson_anims\reload_onehanded_crouch_seq.smd"
	activity "ACT_VM_ONEHANDED_RELOAD" 1
	activitymodifier sliding
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 12 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 40 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 45 "" }
	{ event AE_WPN_READYTOFIRE 60 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_onehanded_late1_crouch_seq" {
	"reload_onehanded_late1_crouch_anim"
	activity "ACT_VM_ONEHANDED_RELOAD_LATE1" 1
	activitymodifier sliding
	{ event AE_CL_PLAYSOUND 0 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_WPN_RUMBLE 3 "reload_pilot_large" }
	{ event AE_WPN_FILLAMMO 11 "" }
	{ event AE_WPN_READYTOFIRE 26 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_empty_onehanded_crouch_seq" {
	"ptpov_vinson_anims\reload_empty_onehanded_crouch_seq.smd"
	activity "ACT_VM_ONEHANDED_RELOADEMPTY" 1
	activitymodifier sliding
	{ event AE_WPN_RELOAD_MILESTONE_1 16 "" }
	{ event AE_WPN_RELOAD_MILESTONE_2 45 "" }
	{ event AE_CL_PLAYSOUND 9 "Weapon_Vinson_Reload_MagOut" }
	{ event AE_CL_PLAYSOUND 36 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 54 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 13 "reload_pilot_small" }
	{ event AE_WPN_RUMBLE 40 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 58 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 62 "" }
	{ event AE_WPN_READYTOFIRE 46 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_empty_onehanded_late1_crouch_seq" {
	"reload_empty_onehanded_late1_crouch_anim"
	activity "ACT_VM_ONEHANDED_RELOADEMPTY_LATE1" 1
	activitymodifier sliding
	{ event AE_WPN_RELOAD_MILESTONE_2 11 "" }
	{ event AE_CL_PLAYSOUND 2 "Weapon_Vinson_Reload_MagIn" }
	{ event AE_CL_PLAYSOUND 20 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 6 "reload_pilot_large" }
	{ event AE_WPN_RUMBLE 24 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 28 "" }
	{ event AE_WPN_READYTOFIRE 42 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_empty_onehanded_late2_crouch_seq" {
	"reload_empty_onehanded_late2_crouch_anim"
	activity "ACT_VM_ONEHANDED_RELOADEMPTY_LATE2" 1
	activitymodifier sliding
	{ event AE_CL_PLAYSOUND 0 "Weapon_Vinson_ReloadEmpty_Charge" }
	{ event AE_WPN_RUMBLE 3 "reload_pilot_small" }
	{ event AE_WPN_FILLAMMO 7 "" }
	{ event AE_WPN_READYTOFIRE 21 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "drawfirst_seq" {
	"ptpov_vinson_anims\drawfirst_seq.smd"
	activity "ACT_VM_DRAWFIRST" 1
	{ event AE_CL_PLAYSOUND 6 "Weapon_Vinson_FirstPullout" }
	{ event AE_WPN_READYTOFIRE 25 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "drawfirst_crouch_seq" {
	"ptpov_vinson_anims\drawfirst_crouch_seq.smd"
	activity "ACT_VM_DRAWFIRST" 1
	activitymodifier crouch
	{ event AE_CL_PLAYSOUND 6 "Weapon_Vinson_FirstPullout" }
	{ event AE_WPN_READYTOFIRE 25 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "draw_seq" {
	"ptpov_vinson_anims\draw_seq.smd"
	activity "ACT_VM_DRAW" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 10 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "draw_onehanded_seq" {
	"ptpov_vinson_anims\draw_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_DRAW" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 10 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "onehanded"
	fps 30
}

$sequence "draw_crouch_seq" {
	"ptpov_vinson_anims\draw_crouch_seq.smd"
	activity "ACT_VM_DRAW" 1
	activitymodifier crouch
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 10 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "draw_onehanded_crouch_seq" {
	"ptpov_vinson_anims\draw_onehanded_crouch_seq.smd"
	activity "ACT_VM_ONEHANDED_DRAW" 1
	activitymodifier sliding
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 10 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "onehanded"
	fps 30
}

$sequence "holster_seq" {
	"ptpov_vinson_anims\holster_seq.smd"
	activity "ACT_VM_HOLSTER" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_UnEquip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "holster_onehanded_seq" {
	"ptpov_vinson_anims\holster_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_HOLSTER" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_UnEquip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_seq" {
	"ptpov_vinson_anims\raise_seq.smd"
	activity "ACT_VM_RAISE" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 7 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_onehanded_seq" {
	"ptpov_vinson_anims\raise_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_RAISE" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 7 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_frommelee_seq" {
	"ptpov_vinson_anims\raise_frommelee_seq.smd"
	activity "ACT_VM_RAISE_FROM_MELEE" 1
	{ event AE_WPN_READYTOFIRE 5 "" }
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_crouch_seq" {
	"ptpov_vinson_anims\raise_crouch_seq.smd"
	activity "ACT_VM_RAISE" 1
	activitymodifier crouch
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 7 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_onehanded_crouch_seq" {
	"ptpov_vinson_anims\raise_onehanded_crouch_seq.smd"
	activity "ACT_VM_ONEHANDED_RAISE" 1
	activitymodifier sliding
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	{ event AE_WPN_READYTOFIRE 7 "" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_frommelee_crouch_seq" {
	"ptpov_vinson_anims\raise_frommelee_crouch_seq.smd"
	activity "ACT_VM_RAISE_FROM_MELEE" 1
	activitymodifier crouch
	{ event AE_WPN_READYTOFIRE 5 "" }
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "raise_frommelee_sliding_seq" {
	"ptpov_vinson_anims\raise_frommelee_sliding_seq.smd"
	activity "ACT_VM_RAISE_FROM_MELEE" 1
	activitymodifier sliding
	{ event AE_WPN_READYTOFIRE 5 "" }
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "lower_seq" {
	"ptpov_vinson_anims\lower_seq.smd"
	activity "ACT_VM_LOWER" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_UnEquip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "lower_onehanded_seq" {
	"ptpov_vinson_anims\lower_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_LOWER" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_UnEquip" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	fps 30
}

$sequence "sprint_seq" {
	"ptpov_vinson_anims\sprint_seq.smd"
	activity "ACT_VM_SPRINT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "sprintraise_seq" {
	"ptpov_vinson_anims\sprintraise_seq.smd"
	activity "ACT_VM_RAISE_FROM_SPRINT" 1
	{ event AE_WPN_READYTOFIRE 7 "" }
	{ event AE_CL_PLAYSOUND 0 "weapon_r101_raise" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "sprintraise_seq_regrip" {
	"ptpov_vinson_anims\sprintraise_seq_regrip.smd"
	activity "ACT_VM_RAISE_FROM_SPRINT" 1
	{ event AE_WPN_READYTOFIRE 7 "" }
	{ event AE_CL_PLAYSOUND 0 "weapon_r101_raise" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "fire"
	fps 30
}

$sequence "sprintraise_seq_air" {
	"ptpov_vinson_anims\sprintraise_seq_air.smd"
	activity "ACT_VM_RAISE_FROM_SPRINT" 1
	activitymodifier air
	{ event AE_WPN_READYTOFIRE 10 "" }
	{ event AE_CL_PLAYSOUND 0 "weapon_r101_raise" }
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "sprintdraw_seq" {
	"ptpov_vinson_anims\sprintdraw_seq.smd"
	activity "ACT_VM_DRAW_TO_SPRINT" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	fadein 0.2
	fadeout 0.2
	node "twohanded"
	fps 30
}

$sequence "sprintholster_seq" {
	"ptpov_vinson_anims\sprintholster_seq.smd"
	activity "ACT_VM_HOLSTER_FROM_SPRINT" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_UnEquip" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "sprint_onehanded_seq" {
	"ptpov_vinson_anims\sprint_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_SPRINT" 1
	fadein 0.2
	fadeout 0.2
	node "onehanded"
	fps 30
	loop
}

$sequence "sprintraise_onehanded_seq" {
	"ptpov_vinson_anims\sprintraise_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_RAISE_FROM_SPRINT" 1
	{ event AE_WPN_READYTOFIRE 7 "" }
	{ event AE_CL_PLAYSOUND 0 "weapon_r101_raise" }
	fadein 0.2
	fadeout 0.2
	node "onehanded"
	fps 30
}

$sequence "sprintdraw_onehanded_seq" {
	"ptpov_vinson_anims\sprintdraw_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_DRAW_TO_SPRINT" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_Equip" }
	fadein 0.2
	fadeout 0.2
	node "onehanded"
	fps 30
}

$sequence "sprintholster_onehanded_seq" {
	"ptpov_vinson_anims\sprintholster_onehanded_seq.smd"
	activity "ACT_VM_ONEHANDED_HOLSTER_FROM_SPRINT" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_R101_UnEquip" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "sprintraise_onehanded_seq_slide" {
	"sprintraise_onehanded_slide_anim"
	activity "ACT_VM_ONEHANDED_RAISE_FROM_SPRINT" 1
	activitymodifier sliding
	{ event AE_WPN_READYTOFIRE 5 "" }
	{ event AE_CL_PLAYSOUND 0 "weapon_r101_raise" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "ads_in_seq" {
	"ads_in_anim"
	activity "ACT_VM_ADS_IN" 1
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "ads_in_crouch_seq" {
	"ads_in_slide_anim"
	activity "ACT_VM_ADS_IN" 1
	activitymodifier crouch
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "ads_in_seq_air" {
	"ads_in_anim"
	activity "ACT_VM_ADS_IN" 1
	activitymodifier air
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "ads_out_seq" {
	"ads_out_anim"
	activity "ACT_VM_ADS_OUT" 1
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "twohanded"
	fps 30
}

$sequence "ads_out_crouch_seq" {
	"ads_out_slide_anim"
	activity "ACT_VM_ADS_OUT" 1
	activitymodifier crouch
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "ads_out_seq_air" {
	"ads_out_anim"
	activity "ACT_VM_ADS_OUT" 1
	activitymodifier air
	activitymodifier crouch
	fadein 0.2
	fadeout 0.2
	node "jump"
	fps 30
}

$sequence "ads_in_onehanded_seq" {
	"ads_in_onehanded_anim"
	activity "ACT_VM_ONEHANDED_ADS_IN" 1
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "ads_in_onehanded_seq_sliding" {
	"ads_in_slide_anim"
	activity "ACT_VM_ONEHANDED_ADS_IN" 1
	activitymodifier sliding
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "ads_in_onehanded_seq_air" {
	"ads_in_onehanded_anim"
	activity "ACT_VM_ONEHANDED_ADS_IN" 1
	activitymodifier air
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "ads_out_onehanded_seq" {
	"ads_out_onehanded_anim"
	activity "ACT_VM_ONEHANDED_ADS_OUT" 1
	fadein 0.2
	fadeout 0.2
	blendlayer "run_layer" 0 0 0 0 poseparameter sprintfrac
	node "onehanded"
	fps 30
}

$sequence "ads_out_onehanded_seq_sliding" {
	"ads_out_slide_anim"
	activity "ACT_VM_ONEHANDED_ADS_OUT" 1
	activitymodifier sliding
	activitymodifier wallrun
	fadein 0.2
	fadeout 0.2
	node "land_crouch"
	fps 30
}

$sequence "ads_out_onehanded_seq_wallrun" {
	"ads_out_onehanded_anim"
	activity "ACT_VM_ONEHANDED_ADS_OUT" 1
	activitymodifier wallrun
	activitymodifier sliding
	fadein 0.2
	fadeout 0.2
	node "onehanded"
	fps 30
}

$sequence "run_layer" {
	"run_anim_static"
	"run_anim"
	blend "velocity" 0 173
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	fps 36
	loop
}

$sequence "run_layer_reload" {
	"run_anim_layer"
	delta
	fadein 0.2
	fadeout 0.2
	fps 33
	loop
}

$sequence "optic_layer" {
	"optic_anim_layer"
	"optic_anim_layer_ads"
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	fps 40
	loop
	weightlist "weights_optic_layer"
}

$sequence "wind_loop_layer" {
	"wind_loop_anim_layer"
	fadein 0.2
	fadeout 0.2
	realtime
	fps 30
	loop
	weightlist "weights_wind_loop_layer"
}

$sequence "wind_loop_ads_layer" {
	"wind_loop_ads_anim_layer"
	fadein 0.2
	fadeout 0.2
	realtime
	fps 30
	loop
	weightlist "weights_wind_loop_layer"
}

$sequence "idle_seq_autoplay" {
	"idle_anim_autoplay"
	"idle_ads_anim_autoplay"
	autoplay
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "idle_seq" {
	"idle_anim"
	"idle_ads_anim"
	activity "ACT_VM_IDLE" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	node "land"
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$sequence "idle_seq_air" {
	"idle_anim"
	"idle_ads_anim"
	activity "ACT_VM_IDLE" 1
	activitymodifier air
	activitymodifier crouch
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	node "jump"
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$sequence "idle_seq_crouch_air" {
	"idle_anim"
	"idle_ads_anim"
	activity "ACT_VM_IDLE" 1
	activitymodifier crouch
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	node "jump_crouch"
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$sequence "idle_seq_crouch" {
	"idle_anim"
	"idle_ads_anim"
	activity "ACT_VM_IDLE" 1
	activitymodifier crouch
	activitymodifier air
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	node "land_crouch"
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$sequence "idle_onehanded_seq" {
	"idle_onehanded_anim"
	"idle_onehanded_ads_anim"
	activity "ACT_VM_ONEHANDED_IDLE" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	node "land_crouch"
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$sequence "idle_onehanded_seq_air" {
	"idle_onehanded_anim"
	"idle_onehanded_ads_anim"
	activity "ACT_VM_ONEHANDED_IDLE" 1
	activitymodifier sliding
	activitymodifier air
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	node "jump_crouch"
	fps 30
	loop
	noanimation
	weightlist "weights_idle_seq"
}

$sequence "attack_seq" {
	"attack_anim"
	"attack_ads_anim"
	activity "ACT_VM_PRIMARYATTACK" 2
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "ammo_update" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "attack_seq_regrip" {
	"attack_anim"
	"attack_ads_anim"
	activity "ACT_VM_PRIMARYATTACK" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "ammo_update" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	node "fire"
	fps 30
}

$sequence "attack_onehanded_seq" {
	"attack_onehanded_anim"
	"attack_onehanded_ads_anim"
	activity "ACT_VM_ONEHANDED_PRIMARYATTACK" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "ammo_update" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "attack_onehanded_slide_seq" {
	"attack_anim"
	"attack_ads_anim"
	activity "ACT_VM_ONEHANDED_PRIMARYATTACK" 1
	activitymodifier sliding
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "ammo_update" }
	fadein 0.05
	fadeout 0.2
	addlayer "optic_layer"
	fps 30
}

$sequence "idle_check_seq" {
	"idle_check_anim"
	"iron_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	transition "fire" "land"
	fps 30
}

$sequence "crouch2idle_seq" {
	"idle_check_anim_nod"
	"iron_anim_nod"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	fadein 0.2
	fadeout 0.2
	transition "crouch" "twohanded"
	fps 30
}

$sequence "regrip" {
	"idle_check_anim"
	"iron_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	transition "land_crouch" "land"
	fps 30
}

$sequence "regrip_02" {
	"idle_check_anim"
	"idle_check_ads_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	transition "land" "land_crouch"
	fps 30
}

$sequence "switch_to_jump_iron" {
	"switch_to_jump_anim"
	"switch_to_jump_ads_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	transition "land" "jump"
	fps 30
}

$sequence "switch_to_land_iron" {
	"switch_to_land_anim"
	"switch_to_land_ads_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.05
	fadeout 0.2
	transition "jump" "land"
	fps 30
}

$sequence "idle_check_crouch_seq" {
	"idle_check_anim"
	"iron_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	transition "fire" "land_crouch"
	fps 30
}

$sequence "switch_to_jump_iron_crouch" {
	"switch_to_jump_crouch_anim"
	"switch_to_jump_ads_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.2
	fadeout 0.2
	transition "land_crouch" "jump_crouch"
	fps 30
}

$sequence "switch_to_land_iron_crouch" {
	"switch_to_land_crouch_anim"
	"switch_to_land_ads_anim"
	activity "ACT_TRANSITION" 1
	blend "ads_blend" 0 1
	blendwidth 2
	delta
	fadein 0.05
	fadeout 0.2
	transition "jump_crouch" "land_crouch"
	fps 30
}

$sequence "switch_to_onehanded" {
	"switch_to_onehanded_anim"
	activity "ACT_TRANSITION" 1
	fadein 0.2
	fadeout 0.35
	transition "twohanded" "onehanded"
	fps 30
}

$sequence "switch_to_twohanded" {
	"switch_to_twohanded_anim"
	activity "ACT_TRANSITION" 1
	fadein 0.2
	fadeout 0.35
	transition "onehanded" "twohanded"
	fps 30
}

$sequence "switch_to_onehanded_jump" {
	"switch_to_onehanded_anim"
	activity "ACT_TRANSITION" 1
	fadein 0.2
	fadeout 0.2
	transition "jump" "onehanded"
	fps 30
}

$sequence "switch_to_onehanded_land" {
	"switch_to_onehanded_anim"
	activity "ACT_TRANSITION" 1
	fadein 0.2
	fadeout 0.2
	transition "land" "onehanded"
	fps 30
}
