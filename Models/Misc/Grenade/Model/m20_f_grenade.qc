// Created by Crowbar 0.68

$modelname "Weapons\grenades\m20_f_grenade.mdl"

$bodygroup "body"
{
	studio "w_m20_f_grenade_LOD0.smd"
}

$surfaceprop "grenade"

$jointsurfaceprop "ja_c_propGun" ""
$jointsurfaceprop "weapon_bone" ""
$jointsurfaceprop "def_c_base" ""
$jointsurfaceprop "def_c_twist" ""
$jointsurfaceprop "w_grenade" ""
$jointsurfaceprop "muzzle_flash" ""

$contents "solid"

$jointcontents "ja_c_propGun" "notsolid"
$jointcontents "weapon_bone" "notsolid"
$jointcontents "def_c_base" "notsolid"
$jointcontents "def_c_twist" "notsolid"
$jointcontents "w_grenade" "notsolid"
$jointcontents "muzzle_flash" "notsolid"

$illumposition -0.003 0.504 1.565

$cdmaterials "models\weapons\grenades"
$cdmaterials ""

$attachment "muzzle_flash" "muzzle_flash" 0 0 0 rotate 0 0 0
$attachment "fuse" "w_grenade" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -3.884 -2.623 -2.148 2.623 2.623 4.231

$definebone "ja_c_propGun" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "weapon_bone" "ja_c_propGun" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_base" "weapon_bone" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "def_c_twist" "def_c_base" 0 1.822517 0 0 0 0 0 0 0 0 0 0
$definebone "w_grenade" "def_c_base" 0 1.822517 0 0 0 0 0 0 0 0 0 0
$definebone "muzzle_flash" "def_c_base" 0 0 0 0 0 0 0 0 0 0 0 0


$sequence "ref" {
	"m20_f_grenade_anims\ref.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "m20_f_grenade_physics.smd"
{
	$mass 500
	$inertia -2
	$damping 0.75
	$rotdamping 0.75
	$rootbone " "

}
