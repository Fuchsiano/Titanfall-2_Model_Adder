// Created by Crowbar 0.68

$modelname "weapons/car101/w_car101.mdl"

$bodygroup "car101"
{
	studio "w_car101_lod0.smd"
}
$bodygroup "sight_holo"
{
	blank
	studio "w_car101_w_holo_lod0.smd"
}
$bodygroup "sight_acgs"
{
	blank
	studio "w_car101_w_acgs_lod0.smd"
}
$bodygroup "sight_cro"
{
	blank
	studio "w_car101_w_cro_lod0.smd"
}
$bodygroup "proscreen"
{
	blank
	studio "w_car101_w_proscreen_lod0.smd"
}
$bodygroup "car101_sight_on"
{
	blank
	studio "w_car101_sight_on_lod0.smd"
}

$surfaceprop "weapon"

$jointsurfaceprop "ja_c_propGun" ""
$jointsurfaceprop "weapon_bone" ""
$jointsurfaceprop "def_c_proscreen" ""
$jointsurfaceprop "ja_ads_attachment" ""
$jointsurfaceprop "def_c_acgs" ""
$jointsurfaceprop "def_c_base" ""
$jointsurfaceprop "def_c_cro" ""
$jointsurfaceprop "def_c_sight_on" ""
$jointsurfaceprop "muzzle_flash" ""
$jointsurfaceprop "def_c_holo" ""
$jointsurfaceprop "shell" ""
$jointsurfaceprop "shell_fp" ""
$jointsurfaceprop "l_hand_ik" ""
$jointsurfaceprop "r_hand_ik" ""

$contents "solid"

$jointcontents "ja_c_propGun" "notsolid"
$jointcontents "weapon_bone" "notsolid"
$jointcontents "def_c_proscreen" "notsolid"
$jointcontents "ja_ads_attachment" "notsolid"
$jointcontents "def_c_acgs" "notsolid"
$jointcontents "def_c_base" "notsolid"
$jointcontents "def_c_cro" "notsolid"
$jointcontents "def_c_sight_on" "notsolid"
$jointcontents "muzzle_flash" "notsolid"
$jointcontents "def_c_holo" "notsolid"
$jointcontents "shell" "notsolid"
$jointcontents "shell_fp" "notsolid"
$jointcontents "l_hand_ik" "notsolid"
$jointcontents "r_hand_ik" "notsolid"

$illumposition 0.158 -6.216 4.416

$cdmaterials "models\weapons\attachments"
$cdmaterials "models\Weapons_R2\attachments"
$cdmaterials "models\Weapons_R2\car_smg"
$cdmaterials ""

$texturegroup "skinfamilies"
{
	{ "CAR_smg"          }
	{ "CAR_smg_skin_31"  }
	{ "CAR_smg_prime_01" }
	{ "CAR_smg_prime_02" }
	{ "CAR_smg_prime_03" }
	{ "CAR_smg_prime_04" }
	{ "CAR_smg_prime_05" }
	{ "CAR_smg_prime_06" }
	{ "CAR_smg_prime_07" }
}

$attachment "CAMERA_BASE" "weapon_bone" 0 0 0 rotate -90 -90 0
$attachment "CAMERA" "weapon_bone" 0 0 0 rotate -90 -90 0
$attachment "L_HAND" "weapon_bone" 0 0 0 rotate -90 -90 0
$attachment "R_HAND" "weapon_bone" 0 0 0 rotate -90 -90 0
$attachment "SWAY_ROTATE" "weapon_bone" 0 0 0 rotate -90 90 0
$attachment "SWAY_ROTATE_ZOOMED" "muzzle_flash" 196.85 0 0 rotate 0 0 90
$attachment "muzzle_flash" "muzzle_flash" 0 0 0 rotate 0 0 0
$attachment "shell" "shell" 0 0 0 rotate 0 0 0
$attachment "shell_fp" "shell_fp" 0 0 0 rotate 0 0 0
$attachment "l_hand_ik" "l_hand_ik" 0 0 0 rotate 0 0 0
$attachment "r_hand_ik" "r_hand_ik" 0 0 0 rotate 0 0 0
$attachment "holo" "def_c_holo" 0 0 0 rotate -90 -90 0
$attachment "acgs" "def_c_acgs" 0 0 0 rotate -90 -90 0
$attachment "cro" "def_c_cro" 0 0 0 rotate -90 -90 0
$attachment "HOLO_FRONT" "def_c_holo" 0 1.83 3.84 rotate -90 -90 0
$attachment "HOLO_REAR" "def_c_holo" 0 1.83 0.01 rotate -90 -90 0
$attachment "ACGS_FRONT" "def_c_acgs" 0 1.07 0.33 rotate -90 -90 0
$attachment "ACGS_REAR" "def_c_acgs" 0 1.07 -3.12 rotate -90 -90 0
$attachment "SCR_BL_ACGS" "def_c_acgs" 0.75 0.75 0.33 rotate 0 -180 -180
$attachment "SCR_TR_ACGS" "def_c_acgs" -0.75 1.68 0.33 rotate 0 -180 -180
$attachment "CRO_FRONT" "def_c_cro" 0 1.22 1.4 rotate -90 -90 0
$attachment "CRO_REAR" "def_c_cro" 0 1.22 -0.32 rotate -90 -90 0
$attachment "proscreen" "def_c_proscreen" 0 0 0 rotate -90 -90 0
$attachment "sight_on" "def_c_sight_on" 0 0 0 rotate -90 -90 0

$cbox 0 0 0 0 0 0

$bbox -7.493 -1.598 -2.051 19.925 1.913 7.939

$screenalign muzzle_flash "sphere"
$screenalign l_hand_ik "sphere"
$screenalign r_hand_ik "sphere"

$definebone "ja_c_propGun" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "weapon_bone" "ja_c_propGun" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_proscreen" "weapon_bone" 0.488358 3.356537 16.14053 0 0 0 0 0 0 0 0 0
$definebone "ja_ads_attachment" "def_c_proscreen" -0.487344 2.163512 -10.129557 0 0 0 0 0 0 0 0 0
$definebone "def_c_acgs" "ja_ads_attachment" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_base" "weapon_bone" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_cro" "ja_ads_attachment" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_sight_on" "def_c_base" 0 5.548656 1.533927 0 0 0 0 0 0 0 0 0
$definebone "muzzle_flash" "def_c_base" 0 3.946461 19.092899 -89.999962 0 0 0 0 0 0 0 0
$definebone "def_c_holo" "ja_ads_attachment" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "shell" "def_c_base" -0.569692 3.792237 8.887314 0 149.999956 0 0 0 0 0 0 0
$definebone "shell_fp" "def_c_base" -0.569692 3.792237 8.887314 0 149.999956 0 0 0 0 0 0 0
$definebone "l_hand_ik" "def_c_base" 0.367478 0.735352 -2.021315 -63.554644 2.439949 -86.859563 0 0 0 0 0 0
$definebone "r_hand_ik" "def_c_base" -1.597172 -1.228815 8.428386 67.552046 -127.81583 -61.581908 0 0 0 0 0 0

$bonemerge "muzzle_flash"
$bonemerge "l_hand_ik"


$bonesaveframe "muzzle_flash" rotation
$bonesaveframe "l_hand_ik" rotation
$bonesaveframe "r_hand_ik" position

$sequence "idle_seq" {
	"w_car101_anims\idle_seq.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack_seq" {
	"w_car101_anims\attack_seq.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event 3002 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack_seq_alt1" {
	"w_car101_anims\attack_seq_alt1.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event 3002 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack_seq_alt2" {
	"w_car101_anims\attack_seq_alt2.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event AE_CL_VSCRIPT_CALLBACK 0 "muzzle_flash" }
	{ event AE_CL_VSCRIPT_CALLBACK 0 "shell_eject" }
	{ event 3002 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_car101_physics.smd"
{
	$mass 10
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}

$KeyValues
{
	prop_data 
	{
		"base" "Metal.Medium"
	}
}
