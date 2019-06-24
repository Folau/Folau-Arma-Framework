// Array of all groups that need IDs/Markers.
// FORMAT: [groupID,groupName,markerType,markerName,markerColor]
// * Don't change the names of the variables - anything beginning with '_'!
// * Markers are NEVER shared between sides.
// * You can edit the RGBA values to change the colours.
// * You can delete any groups you're not using (e.g. remove '_grpBLU = [ ... ];' if you're OPFOR).
// ====================================================================================
private ["_red", "_blue", "_green", "_yellow", "_orange", "_purple", "_black", "_white"];
_red = 		[0.5, 0,	  0,	  1] ;
_blue = 	 	[0,0.3,0.6,1] ;
_green = 	 	[0,0.5,0,1] ;
_yellow = 	[1,   1,   0,   1	];
_orange = 	[1,   0.6, 0,   1	];
_purple	=	[0.5, 0,   0.5, 1 	];
_black =	[0,   0,   0,   1	];
_white =	[1,   1,   1,   1	];

_grpBLU = [
	// HQ
	["GrpBLU_CO","Platoon Commander","b_hq","CO",_blue],
	["GrpBLU_XO","Platoon Sergeant","b_hq","XO",_blue],
	["GrpBLU_FO","Forward Observer","b_hq","FO",_blue],
	["GrpBLU_PLM1","Platoon Medic","b_med","PLT M1",_blue],
	["GrpBLU_PLM2","PLT M2","b_med","PLT M2",_blue],
	["GrpBLU_JTAC","JTAC","b_hq","JTAC",_blue],
	["GrpBLU_NAV","NAVY","b_naval","NAVY",_blue],
	
	// RIFLES
	["GrpBLU_ASL","Alpha","b_inf","A",_blue],
	["GrpBLU_BSL","Bravo","b_inf","B",_blue],
	["GrpBLU_CSL","Charlie","b_inf","C",_blue],
	["GrpBLU_DSL","Delta","b_inf","D",_blue],
	["GrpBLU_ESL","Echo","b_inf","E",_blue],
	
	// Recon
	["GrpBLU_ST1","ST","b_recon","ST1",_blue],
	
	// SPECIALISTS
	["GrpBLU_MTR1","Mortar","b_mortar","MTR1",_blue],
	["GrpBLU_MTR2","MTR 2","b_mortar","MTR2",_blue],
	
	["GrpBLU_MMG1","MMG","b_inf","MMG1",_blue],
	["GrpBLU_HMG1","HMG","b_inf","HMG1",_blue],

	["GrpBLU_MAT1","MAT","b_inf","MAT1",_blue],
	["GrpBLU_HAT1","HAT","b_inf","HAT1",_blue],
	
	["GrpBLU_MSAM1","MSAM","b_antiair","MSAM1",_blue],
	["GrpBLU_HSAM1","HSAM","b_antiair","HSAM1",_blue],
	
	// Support
	["GrpBLU_ENG","ENG","b_maint","ENG",_blue],	
	["GrpBLU_CLS1","CLS1","b_med","CLS1",_blue],	
	["GrpBLU_CLS2","CLS2","b_med","CLS2",_blue],	
	["GrpBLU_LOG1","LOG1","b_support","LOG1",_blue],
	["GrpBLU_LOG2","LOG2","b_support","LOG2",_blue],
	
	// IFV
	["GrpBLU_IFV1","IFV1","b_mech_inf","IFV1",_blue],
	["GrpBLU_IFV2","IFV2","b_mech_inf","IFV2",_blue],
	["GrpBLU_IFV3","IFV3","b_mech_inf","IFV3",_blue],
	["GrpBLU_IFV4","IFV4","b_mech_inf","IFV4",_blue],
	
	// MBT
	["GrpBLU_TNK1","Thunder 1","b_armor","THU1",_blue],
	["GrpBLU_TNK2","Thunder 2","b_armor","THU2",_blue],
	["GrpBLU_TNK3","Thunder 3","b_armor","THU3",_blue],
	["GrpBLU_TNK4","Thunder 4","b_armor","THU4",_blue],
	
	// Artillery
	["GrpBLU_XRAY","XRay","b_art","XRay",_blue],
	
	// AIR
	["GrpBLU_TH1","Vector1","b_air","V1",_blue],
	["GrpBLU_TH2","Vector2","b_air","V2",_blue],
	["GrpBLU_TH3","Vector3","b_air","V3",_blue],
	["GrpBLU_TH4","Vector4","b_air","V4",_blue],
	
	["GrpBLU_AH1","Hawk","b_air","Hawk",_blue],
	
	["GrpBLU_P1","Eagle","b_plane","Eagle",_blue],
	["GrpBLU_P2","Falcon","b_plane","Falcon",_blue]
	
	// Always make sure there's no comma after the last entry!
];

// Group Variable Name, ORBAT Name, Icon Type, Icon Text, Icon Color, Make Channel (default true)
_grpOPF = [
	// HQ
	["GrpOPF_CO","CO","o_hq","CO",_red],
	["GrpOPF_XO","XO","o_hq","XO",_red],
	["GrpOPF_FO","FO","o_hq","FO",_red],
	["GrpOPF_PLM1","PLT M1","o_med","PLT M1",_red],
	["GrpOPF_PLM2","PLT M2","o_med","PLT M2",_red],
	["GrpOPF_JTAC","JTAC","o_hq","JTAC",_red],
	["GrpOPF_FAC","FAC","o_hq","FAC",_red],
	["GrpOPF_NAV","NAVY","o_naval","NAVY",_red],
	
	// RIFLES
	["GrpOPF_ASL","Alpha","o_inf","A",_red],
	["GrpOPF_BSL","Bravo","o_inf","B",_red],
	["GrpOPF_CSL","Charlie","o_inf","C",_red],
	["GrpOPF_DSL","Delta","o_inf","D",_red],
	["GrpOPF_ESL","Echo","o_inf","E",_red],
	
	// Recon
	["GrpOPF_RSL","Romeo","o_recon","R",_red],
	["GrpOPF_SSL","Sierra","o_recon","S",_red],
	["GrpOPF_ST1","Sniper 1","o_recon","ST1",_red],
	
	// SPECIALISTS
	["GrpOPF_MTR1","MTR 1","o_mortar","MTR1",_red],
	["GrpOPF_MTR2","MTR 2","o_mortar","MTR2",_red],
	
	["GrpOPF_MMG1","MMG","o_inf","MMG1",_red],
	["GrpOPF_HMG1","HMG","o_inf","HMG1",_red],

	["GrpOPF_MAT1","MAT","o_inf","MAT1",_red],
	["GrpOPF_HAT1","HAT","o_inf","HAT1",_red],
	
	["GrpOPF_MSAM1","MSAM","o_antiair","MSAM1",_red],
	["GrpOPF_HSAM1","HSAM","o_antiair","HSAM1",_red],
	
	// Support
	["GrpOPF_ENG","ENG","o_maint","ENG",_red],	
	["GrpOPF_CLS1","CLS1","o_med","CLS1",_red],	
	["GrpOPF_CLS2","CLS2","o_med","CLS2",_red],	
	["GrpOPF_LOG1","LOG1","o_support","LOG1",_red],
	["GrpOPF_LOG2","LOG2","o_support","LOG2",_red],
	
	// IFV
	["GrpOPF_IFVC","IFV-CO","o_mech_inf","IFV-CO",_red],
	["GrpOPF_IFV1","IFV-1","o_mech_inf","IFV-1",_red],
	["GrpOPF_IFV2","IFV-2","o_mech_inf","IFV-2",_red],
	["GrpOPF_IFV3","IFV-3","o_mech_inf","IFV-3",_red],
	["GrpOPF_IFV4","IFV-4","o_mech_inf","IFV-4",_red],
	
	// MBT
	["GrpOPF_TNK1","Thunder 1","o_armor","THU1",_red],
	["GrpOPF_TNK2","Thunder 2","o_armor","THU2",_red],
	["GrpOPF_TNK3","Thunder 3","o_armor","THU3",_red],
	["GrpOPF_TNK4","Thunder 4","o_armor","THU4",_red],
	
	// Artillery
	["GrpOPF_XRAY","XRay","o_art","XRay",_red],
	
	// AIR
	["GrpOPF_TH1","Vector1","o_air","V1",_red],
	["GrpOPF_TH2","Vector2","o_air","V2",_red],
	["GrpOPF_TH3","Vector3","o_air","V3",_red],
	["GrpOPF_TH4","Vector4","o_air","V4",_red],
	
	["GrpOPF_AH1","Hawk","o_air","Hawk",_red],
	
	["GrpOPF_P1","Eagle","o_plane","Eagle",_red],
	["GrpOPF_P2","Falcon","o_plane","Falcon",_red]

	// Always make sure there's no comma after the last entry!
];

_grpIND = [	
	// HQ
	["GrpIND_CO","CO","n_hq","CO",_green],
	["GrpIND_1PLT","1PLT","n_hq","1Plt",_green],
	["GrpIND_2PLT","2PLT","n_hq","2Plt",_green],
	["GrpIND_XO","XO","n_hq","XO",_green],
	["GrpIND_FO","FO","n_hq","FO",_green],
	["GrpIND_PLM1","PLT M1","n_med","PLT M1",_green],
	["GrpIND_PLM2","PLT M2","n_med","PLT M2",_green],
	["GrpIND_JTAC","JTAC","n_hq","JTAC",_green],
	["GrpIND_NAV","NAVY","n_naval","NAVY",_green],
	
	// Infantry
	["GrpIND_ASL","Alpha","n_inf","A",_green],
	["GrpIND_BSL","Bravo","n_inf","B",_green],
	["GrpIND_CSL","Charlie","n_inf","C",_green],
	["GrpIND_DSL","Delta","n_inf","D",_green],
	["GrpIND_ESL","Echo","n_inf","E",_green],
	
	// Motorized Infantry
	["GrpIND_MoASL","Alpha (Motor)","n_motor_inf","A",_green],
	["GrpIND_MoBSL","Bravo (Motor)","n_motor_inf","B",_green],
	["GrpIND_MoCSL","Charlie (Motor)","n_motor_inf","C",_green],
	["GrpIND_MoDSL","Delta (Motor)","n_motor_inf","D",_green],
	["GrpIND_MoESL","Echo (Motor)","n_motor_inf","E",_green],
	
	// Mechanised Infantry
	["GrpIND_MeASL","Alpha (Mech)","n_mech_inf","A",_green],
	["GrpIND_MeBSL","Bravo (Mech)","n_mech_inf","B",_green],
	["GrpIND_MeCSL","Charlie (Mech)","n_mech_inf","C",_green],
	["GrpIND_MeDSL","Delta (Mech)","n_mech_inf","D",_green],
	["GrpIND_MeESL","Echo (Mech)","n_mech_inf","E",_green],	
	
	// Recon
	["GrpIND_ST1","ST","n_recon","ST1",_green],
	
	// SPECIALISTS
	["GrpIND_MTR1","MTR 1","n_mortar","MTR1",_green],
	["GrpIND_MTR2","MTR 2","n_mortar","MTR2",_green],
	
	["GrpIND_MMG1","MMG","n_inf","MMG1",_green],
	["GrpIND_HMG1","HMG","n_inf","HMG1",_green],

	["GrpIND_MAT1","MAT","n_inf","MAT1",_green],
	["GrpIND_HAT1","HAT","n_inf","HAT1",_green],
	
	["GrpIND_MSAM1","MSAM","n_antiair","MSAM1",_green],
	["GrpIND_HSAM1","HSAM","n_antiair","HSAM1",_green],
	
	// Support
	["GrpIND_ENG","ENG","n_maint","ENG",_green],	
	["GrpIND_CLS1","CLS1","n_med","CLS1",_green],	
	["GrpIND_CLS2","CLS2","n_med","CLS2",_green],	
	["GrpIND_LOG1","LOG1","n_support","LOG1",_green],
	["GrpIND_LOG2","LOG2","n_support","LOG2",_green],
	["GrpIND_SUP","Support","n_support","SUPPORT",_green],
	
	// IFV
	["GrpIND_IFV1","IFV1","n_mech_inf","IFV1",_green],
	["GrpIND_IFV2","IFV2","n_mech_inf","IFV2",_green],
	["GrpIND_IFV3","IFV3","n_mech_inf","IFV3",_green],
	["GrpIND_IFV4","IFV4","n_mech_inf","IFV4",_green],
	
	// MBT
	["GrpIND_TNK1","Thunder 1","n_armor","THU1",_green],
	["GrpIND_TNK2","Thunder 2","n_armor","THU2",_green],
	["GrpIND_TNK3","Thunder 3","n_armor","THU3",_green],
	["GrpIND_TNK4","Thunder 4","n_armor","THU4",_green],
	
	// Artillery
	["GrpIND_XRAY","XRay","n_art","XRay",_green],
	
	// AIR
	["GrpIND_TH1","Vector1","n_air","V1",_green],
	["GrpIND_TH2","Vector2","n_air","V2",_green],
	["GrpIND_TH3","Vector3","n_air","V3",_green],
	["GrpIND_TH4","Vector4","n_air","V4",_green],
	
	["GrpIND_AH1","Hawk","n_air","Hawk",_green],
	
	["GrpIND_P1","Eagle","n_plane","Eagle",_green],
	["GrpIND_P2","Falcon","n_plane","Falcon",_green],
	
	["GrpIND_1SQDN","1 Squadron","n_plane","1 SQDN",_green],	
	["GrpIND_2SQDN","2 Squadron","n_air","2 SQDN",_green]
];
	// Always make sure there's no comma after the last entry!];