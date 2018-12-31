// F3 - Folk ARPS Assign Gear Script - NATO
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ================================
// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES
// ATTACHMENTS - PRIMARY


// FOLAU VERSION WIP

// ================================
// EASY BOOLEANS
// A set of toggles for standard changes
// ================================

_stealth_bool = False;
_GPS_bool = True;
_NVG_bool = True;

// ================================
// ATTACHMENTS
// ================================
_scope_frontline = ["optic_MRCO", "optic_ACO", "optic_Holosight_blk_F"]; // Standard choice for infantry - give them the chance for med range.
_scope_support = ["optic_ACO", "optic_Holosight_blk_F"]; // Support infantry don't get extra options
_scope_dm = ["optic_dms", "optic_SOS", "optic_MRCO"]; // Designated Marksman Night
_scope_sniper = ["optic_LRPS"]; // Sniper

_attach1 = ["acc_pointer_IR","acc_flashlight"];
// _attach1 = ["acc_flashlight"];
_attach2 = "";

_flashHider = "";
_silencer1 = "muzzle_snds_M"; // 6.5 silencer (black)
_silencer2 = "muzzle_snds_H"; // .338 silencer (black)
_silencerdm = "muzzle_snds_B"; // 7.62 silencer (black)

_bipod1 = ["bipod_03_F_blk"];

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1, _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "";
_hg_scope1 = "";

// Default setup
_attachments = [_attach1, _scope_frontline]; // The default attachment set for most units, overwritten in the individual unitType

// Predefined Class Attachment Setup
_attach_mg = [_attach1, _scope_frontline, _bipod1]; // MMG
_attach_ar = [_attach1, _scope_frontline, _bipod1];	// Autorifle
_attach_dm = [_attach1, _scope_dm, _bipod1];		// Designated Marksman
_attach_sp = [_attach1, _scope_support];			// "Support" Roles
_attach_sn = [_scope_sniper, _bipod1];				// Snipers

_attach_recon = [_attach1, _scope_frontline, _silencer1];
_attach_recon_dm = [_attach1, _scope_dm, _bipod1, _silencerdm];

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType

// ================================
// WEAPONS
// ================================

// Basic magazine counts given to most infantry, MMG etc get _defMags_tr as default count.
_defMags = 6;
_defMags_tr = 2;

// Standard-Issue Pistol (All Units)
_pistol = "hgun_ACPC2_F";
_pistolmag = "9Rnd_45ACP_Mag";

// Standard-issue Rifle (All front-line roles)
_rifle = ["arifle_Mk20_F"];
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

// Standard-issue Carbine (All support roles)
_carbine = ["arifle_Mk20C_F"];
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = ["arifle_Mk20_GL_F"];
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmoke = "1Rnd_Smoke_Grenade_shell";
_glsmokealt1 = "1Rnd_SmokeYellow_Grenade_shell";
_glsmokealt2 = "1Rnd_SmokePurple_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflare = "UGL_FlareWhite_F";
_glflarealt = "UGL_FlareYellow_F";
_glflarealt2 = "UGL_FlareRed_F";
_glflarealt3 = "UGL_FlareGreen_F";

// Automatic Rifleman
_AR = "LMG_Mk200_F";
_ARmag = "200Rnd_65x39_cased_Box";
_ARmag_tr = "200Rnd_65x39_cased_Box_Tracer";

// Medium MG
_MMG = "MMG_02_black_F";
_MMGmag = "130Rnd_338_Mag";
_MMGmag_tr = "130Rnd_338_Mag";

// Marksman rifle
_DMrifle = "srifle_EBR_F";
_DMriflemag = "20Rnd_762x51_Mag";
_DMriflemag_tr = "20Rnd_762x51_Mag";

// Rifleman AT
_RAT = "launch_NLAW_F";
_RATmag = "NLAW_F";
_RATmag2 = "NLAW_F";

// Medium AT
_MAT = "launch_MRAWS_olive_rail_F";
_MATmag1 = "MRAWS_HEAT_F";
_MATmag2 = "MRAWS_HE_F";

// Surface Air
_SAM = "launch_I_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_I_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = ["srifle_GM6_F"];
_SNrifleMag = "5Rnd_127x108_Mag";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "hgun_PDW2000_F";
_smgmag = "30Rnd_9x21_Mag";
_smgmag_tr = "30Rnd_9x21_Yellow_Mag";


// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "20Rnd_556x45_UW_mag";

// ================================
// EQUIPMENT
// ================================

// Grenades
_grenade = "HandGrenade";
_grenadealt = "MiniGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadealt = "SmokeShellYellow";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Binoculars
_binos1 = "Binocular";
_binos2 = "Rangefinder";
_binos3 = "Laserdesignator_03";

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles_INDEP";

// UAV Terminal
_uavterminal = "I_UavTerminal";	  // BLUFOR - FIA

// Chemlights
_chem =  "Chemlight_yellow";
_chemalt = "Chemlight_red";

// Engineer items
_ATmine = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ================================
// BACKBACKS
// ================================

// Infantry
_bagsmall 	= 		["B_AssaultPack_dgtl"];
_bagmedium 	= 		["B_FieldPack_oli"];
_bagday 	=		["B_Kitbag_rgr"];
_baglarge 	=  		["B_Carryall_oli"];

// Diver
_bagmediumdiver =  	"B_AssaultPack_blk";				// used by divers

// UAV
_baguav = 			"B_UAV_03_backpack_F";				// used by UAV operator

// Remote Designator
_bagremote = 		""; 	// Used by Forward Observer

// Support
_baghmgg 	= 	"I_HMG_01_weapon_F";				// used by Heavy MG gunner
_baghmgag 	= 	"I_HMG_01_support_F";				// used by Heavy MG assistant gunner
_baghatg 	= 	"I_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag 	= 	"I_HMG_01_support_F";				// used by Heavy AT assistant gunner
_bagmtrg 	= 	"I_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag 	= 	"I_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg 	= 	"I_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag 	= 	"I_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ================================
// FACE, CLOTHES AND UNIFORMS
// ================================

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific uniform
// FACE, CLOTHES AND UNIFORMS
_vlight = ["mtrag", "mtrg", "hsamag", "hsamg", "msamag", "mmgag", "matag", "log"];
_light = ["co", "dc", "jtac", "fo", "leng", "mmgg", "matg", "uav", "msamg", "eng"];
_heavy =  ["exp"];
_special = ["plm", "m"];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit
_baseUniform = ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"];
_baseHelmet = ["H_HelmetIA"];
_baseGlasses = ["", "G_Combat", "G_LowProfile", "G_Tactical_Clear", "G_Shades_Black", "G_Sport_Blackred", "G_Shades_Red", "G_Shades_Blue", "G_Shades_Green", "G_Tactical_Black"];

// Vests
_vlightRig = "V_Chestrig_oli";
_lightRig = "V_PlateCarrierIA1_dgtl";
_mediumRig = "V_PlateCarrierIA2_dgtl"; 	// default for all infantry classes
_heavyRig = "V_PlateCarrierIAGL_dgtl";
_specialRig = "V_PlateCarrierIA1_dgtl";

// Lighter / Support Objects
_lightHelmet = ["H_HelmetIA"];
_lightUniform = ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"];

// Crewman
_crew = ["vc","vg","vd"];

_crewUniform = ["U_I_CombatUniform"];
_crewHelmet = ["H_HelmetCrew_I"];
_crewRig = ["V_BandollierB_oli"];
_crewGlasses = _baseGlasses;

// Diver
_diver = ["div"];

_diverUniform =  "U_I_Wetsuit";
_diverHelmet = [];
_diverRig = "V_RebreatherIA";
_diverGlasses = "G_Diving";

// Heli
_heli = ["hp", "hc"];

_heliUniform = "U_I_HeliPilotCoveralls";
_heliHelmet = "H_PilotHelmetHeli_I";
_heliCrewHelmet = "H_CrewHelmetHeli_I";
_heliRig = "V_TacChestrig_grn_F";
_heliGlasses = [];

// Pilot
_pilot = ["p"];

_pilotUniform = "U_I_pilotCoveralls";
_pilotHelmet = "H_PilotHelmetFighter_I";
_pilotRig = [];
_pilotGlasses = [];

// Ghillie
_ghillie = ["sn","sp"];

_ghillieUniform = ["U_I_GhillieSuit"];
_ghillieHelmet = ["H_HelmetB_camo"];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = ["G_Bandanna_khk"];

// Recon
_specOp = ["rsl", "rm", "rgren", "rrat", "rsc", "rdm"];

_sfuniform = _lightUniform;
_sfhelmet = ["H_Cap_blk", "H_Cap_oli", "H_Watchcap_blk", "H_Watchcap_cbr", "H_Watchcap_khk", "H_Watchcap_camo", "H_Cap_tan_specops_US", "H_Bandanna_khk", "H_Booniehat_khk", "H_Booniehat_mcamo"];
_sfRig = _vlightReg;
_sfGlasses = ["", "G_Tactical_Clear", "G_Lowprofile", "G_Shades_Black", "G_Sport_Blackred", "G_Shades_Red", "G_Shades_Blue", "G_Shades_Green", "G_Tactical_Black"];

// MARSOC

// ================================

// This block needs only to be run on an infantry unit
if (_isMan) then {
	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

	// Add Toolequipment
	_unit linkItem "ItemMap";		// Add and equip the map
	_unit linkItem "ItemCompass";	// Add and equip a compass
	_unit linkItem "ItemRadio";		// Add and equip A3's default radio
	_unit linkItem "ItemWatch";		// Add and equip a watch
	_unit linkItem "ItemGPS"; 		// Add and equip a GPS
	
	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.
	#include "..\..\f\assignGear\f_assignGear_clothes.sqf";

	// ADD UNIVERSAL ITEMS
	// Add items universal to all units of this faction

	_unit linkItem _nvg;			// Add and equip the faction's nvg
	_unit addItem _firstaid;		// Add a single first aid kit (FAK)
	_unit addItem _firstaid;		// Add a single first aid kit (FAK)
	// _unit addItem "H_Booniehat_mcamo";// Free Hat!
};

// SETUP BACKPACKS
// Include the correct backpack file for the faction

_backpack = {
	_typeOfBackPack = _this select 0;
	_loadout = f_param_backpacks;
	if (count _this > 1) then {_loadout = _this select 1};
	switch (_typeOfBackPack) do
	{
		#include "f_backpack.sqf";
	};
};

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeOfUnit) do
{	

	// ================================
	// HQ
	// ================================

	// LOADOUT: COMMANDER
	case "co":
	{
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: DEPUTY COMMANDER  / PLATOON SERGEANT
	case "dc":
	{
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};
		
	// LOADOUT: JTAC
	case "jtac":
	{
		["small"] call _backpack;
		_unit addMagazines [_glriflemag,_defMags];
		_unit addMagazines [_glriflemag_tr,_defMags_tr];
		_unit addMagazines [_glsmoke,2];
		_unit addMagazines [_glsmokealt1,2];
		_unit addMagazines [_glsmokealt2,2];
		_unit addMagazines [_glflare,2];
		_unit addMagazines [_glflarealt,2];
		[_unit, _glrifle] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,4];
		_unit addMagazines [_smokegrenadealt,4];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos3] call f_fnc_addWeapon;
		_unit addMagazines ["Laserbatteries",4];
		_attachments = _attach_sp;
	};
	
	// LOADOUT: UAV OPERATOR
	case "uav":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
		_unit linkItem _uavterminal;
		_unit addMagazines ["Laserbatteries",4];	// Batteries added for the F3 UAV Recharging component
	};	
	
	// LOADOUT: Forward Observer
	case "fo":
	{
		// [_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos3] call f_fnc_addWeapon;
		_unit addMagazines ["Laserbatteries",4];
		_attachments = _attach_sp;
	};	
	
	// LOADOUT: NAVY
	case "nav":
	{
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos1] call f_fnc_addWeapon;
		_unit linkItem _uavterminal;
	};	
	
	// ================================
	// MEDICS
	// ================================
	
	// LOADOUT: PLATOON MEDIC
	case "plm":
	{
		[_typeOfUnit] call _backpack;
		_unit setUnitTrait ["medic",1];
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,8];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};
	
	// LOADOUT: COMBAT LIFE SAVER
	case "cls":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,8];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
	};
	
	// LOADOUT: MEDIC
	case "m":
	{
		[_typeOfUnit] call _backpack;
		_unit setUnitTrait ["medic",1];
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,8];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};	
	
	// LOADOUT: UAV MEDIC
	case "uavm":
	{
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,8];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
		_unit linkItem _uavterminal;
	};	
	
	// ================================
	// INFANTRY
	// ================================
		
	// LOADOUT: SQUAD LEADER
	case "sl":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
	};
		
	// LOADOUT: FIRE TEAM LEADER
	case "ftlr":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
	};
	
	// LOADOUT: FIRE TEAM LEADER
	case "ftlg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_glriflemag,_defMags];
		_unit addMagazines [_glriflemag_tr,_defMags_tr];
		_unit addMagazines [_glmag,5];
		[_unit, _glrifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
	};
	
	// LOADOUT: RIFLEMAN
	case "r":
	{
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
	};

	// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_ARmag,_defMags_tr];
		_unit addMagazines [_ARmag_tr,1];
		[_unit, _AR] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_ar;
	};

	// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos1] call f_fnc_addWeapon;
	};

	// LOADOUT: RIFLEMAN (AT)
	case "rat":
	{
		[_typeOfUnit] call _backpack;	
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _RAT] call f_fnc_addWeapon;
	};

	// LOADOUT: DESIGNATED MARKSMAN
	case "dm":
	{
		// [_typeOfUnit] call _backpack;
		_unit addMagazines [_DMriflemag,4];
		_unit addMagazines [_DMriflemag_tr,4];
		[_unit, _DMrifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_dm;
	};
	
	// LOADOUT: AMMOBEARER
	case "ammo":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];;
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
	};
	
	// LOADOUT: GRENADIER
	case "gren":
	{
		["g"] call _backpack;
		_unit addMagazines [_glriflemag,_defMags];
		_unit addMagazines [_glriflemag_tr,_defMags_tr];
		[_unit, _glrifle] call f_fnc_addWeapon;
		_unit addMagazines [_glmag,5];
		_unit addMagazines [_smokegrenade,3];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
	};

	// ================================
	// SUPPORT
	// ================================
	
	// LOADOUT: MEDIUM MG GUNNER
	case "mmgg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_MMGmag,2];
		[_unit, _MMG] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_mg;
	};

	// LOADOUT: MEDIUM MG ASSISTANT GUNNER
	case "mmgag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
	};

	// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _MAT] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];;
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: MEDIUM AT ASSISTANT GUNNER
	case "matag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _HAT] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: HEAVY AT ASSISTANT GUNNER
	case "hatag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: MEDIUM SAM GUNNER
	case "msamg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _SAM] call f_fnc_addWeapon;
		_attachments = _attach_sp;
		
	};

	// LOADOUT: MEDIUM SAM ASSISTANT GUNNER
	case "msamag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: HEAVY SAM GUNNER
	case "hsamg":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: HEAVY SAM ASSISTANT GUNNER
	case "hsamag":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: SNIPER
	case "sn":
	{
		_unit addMagazines [_SNrifleMag,5];
		[_unit, _SNrifle] call f_fnc_addWeapon;
		[_unit, _pistol] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		_attachments = _attach_sn;
	};

	// LOADOUT: SPOTTER
	case "sp":
	{
		["small"] call _backpack;
		_unit addMagazines [_glriflemag,_defMags];
		_unit addMagazines [_SNrifleMag,_defMags];
		_unit addMagazines [_glriflemag_tr,_defMags_tr];
		_unit addMagazines [_glmag,5];
		_unit addMagazines [_glsmoke,5];
		[_unit, _glrifle] call f_fnc_addWeapon;
		[_unit, _pistol] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _binos2] call f_fnc_addWeapon;
	};
	
	// LOADOUT: LOGISTICS
	case "log":
	{
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};	
	
	// ================================
	// VEHICLE CREW
	// ================================

	// LOADOUT: VEHICLE COMMANDER
	case "vc":
	{
		_unit addMagazines [_smgmag,_defMags];
		[_unit, _smg] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		[_unit, _binos2] call f_fnc_addWeapon;
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: VEHICLE DRIVER
	case "vd":
	{
		_unit addMagazines [_smgmag,_defMags];
		[_unit, _smg] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: VEHICLE GUNNER
	case "vg":
	{
		_unit addMagazines [_smgmag,_defMags];
		[_unit, _smg] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// ================================
	// AIR CREW
	// ================================
 	// LOADOUT: AIR VEHICLE PILOTS
	
	case "p":
	{
		["para"] call _backpack;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_unit addHeadgear _pilotHelmet;
	};	
	
 	// LOADOUT: AIR VEHICLE PILOTS
	case "hp":
	{
		_unit addMagazines [_smgmag,_defMags];
		[_unit, _smg] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};
	
 	// LOADOUT: AIR VEHICLE PILOTS
	case "hc":
	{
		_unit addMagazines [_smgmag,_defMags];
		[_unit, _smg] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_unit addHeadGear _heliCrewHelmet;
		_attachments = _attach_sp;
	};
	
	// ================================
	// ENGINEERS
	// ================================
	
	// LOADOUT: ENGINEER (DEMO)
	case "eng":
	{
		[_typeOfUnit] call _backpack;
		_unit setUnitTrait ["engineer",1];
		_unit addItem "MineDetector";
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};
	
	// LOADOUT: ENGINEER (DEMO)
	case "exp":
	{
		[_typeOfUnit] call _backpack;
		_unit setUnitTrait ["explosiveSpecialist",1];
		_unit addItem "MineDetector";
		_unit addMagazines [_carbinemag,_defMags];
		_unit addMagazines [_carbinemag_tr,_defMags_tr];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};

	// LOADOUT: ENGINEER (MINES)
	case "engm":
	{
		[_typeOfUnit] call _backpack;
		_unit setUnitTrait ["engineer",1];
		_unit setUnitTrait ["explosiveSpecialist",1];
		_unit addItem "MineDetector";
		_unit addMagazines [_carbinemag,_defMags];
		[_unit, _carbine] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_grenade,1];
		_unit addMagazines [_APmine2,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_sp;
	};
	
	// LOADOUT: Diver
	case "div":
	{
		[_typeOfUnit] call _backpack;
		_unit addMagazines [_diverMag1,_defMags];
		_unit addMagazines [_diverMag2,_defMags_tr];
		[_unit, _diverWep] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,3];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_grenade,2];
	};
	
	// ================================
	// RECON
	// ================================
	
	case "rsl":
	{
		["sl"] call _backpack;
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos2] call f_fnc_addWeapon;
		_attachments = _attach_recon;
	};
	
	case "rm":
	{
		["m"] call _backpack;
		_unit setUnitTrait ["medic",1];
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenadealt,8];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		_attachments = _attach_recon;		
	};
	
	case "rrat":
	{
		["rat"] call _backpack;	
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _RAT] call f_fnc_addWeapon;
		_attachments = _attach_recon;			
	};
	
	case "rgren":
	{
		["g"] call _backpack;
		_unit addMagazines [_glriflemag,_defMags];
		_unit addMagazines [_glriflemag_tr,_defMags_tr];
		[_unit, _glrifle] call f_fnc_addWeapon;
		_unit addMagazines [_glmag,5];
		_unit addMagazines [_smokegrenade,3];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;	
		_attachments = _attach_recon;	
	};
	
	case "rsc":
	{
		_unit addMagazines [_riflemag,_defMags];
		_unit addMagazines [_riflemag_tr,_defMags_tr];
		[_unit, _rifle] call f_fnc_addWeapon;
		_unit addMagazines [_smokegrenade,3];
		_unit addMagazines [_chem,2];
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;
		[_unit, _binos3] call f_fnc_addWeapon;
		_unit addMagazines ["Laserbatteries",4];
		_attachments = _attach_recon;			
	};
	
	case "rdm":
	{
		_unit addMagazines [_DMriflemag,4];
		_unit addMagazines [_DMriflemag_tr,4];
		[_unit, _DMrifle] call f_fnc_addWeapon;
		_unit addMagazines [_grenade,2];
		_unit addMagazines [_smokegrenade,2];
		_unit addMagazines [_smokegrenadealt,2];
		_unit addMagazines [_chem,1];
		_unit addMagazines [_pistolmag,2];
		[_unit, _pistol] call f_fnc_addWeapon;	
		_attachments = _attach_recon_dm;	
	};
		
	case "empty": 
	{
		_skipCheck = true;
	};
	
	// #include "f_vehicle_loadout.sqf";

	// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit addMagazines [_riflemag,_defMags];
		[_unit, _rifle] call f_fnc_addWeapon;

		_unit selectWeapon primaryWeapon _unit;

		if (true) exitWith {diag_log text format ["[F3] DEBUG (f_loadout_a3_ctrg.sqf): Unit = %1. Gear template %2 does not exist!",_unit,_typeOfUnit]};
   };

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// Handle weapon attachments
#include "..\..\f\assignGear\f_assignGear_attachments.sqf";


// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectWeapon primaryWeapon _unit;