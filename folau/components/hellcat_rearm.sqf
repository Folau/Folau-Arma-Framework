_aafAmmo = allMissionObjects "Box_IND_AmmoVeh_F";
_aafAmmoVic = allMissionObjects "I_Truck_02_ammo_F";

_aafObjects = _aafAmmo + _aafAmmoVic;

hint format ["Boxes found %1", _aafObjects];

{
	[
		_x,											// Object the action is attached to
		"<t color='#ea2e2e'>Rearm (8 x Scalpel)</t>",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",							// Condition for the action to be shown
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{		
			(vehicle _caller) setPylonLoadOut [1, "", true]; 
			(vehicle _caller) setPylonLoadOut [1, "PylonRack_4Rnd_LG_scalpel", true]; 
			(vehicle _caller) setPylonLoadOut [2, "", true];
			(vehicle _caller) setPylonLoadOut [2, "PylonRack_4Rnd_LG_scalpel", true];
		},													// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation
	
	[
		_x,											// Object the action is attached to
		"<t color='#ea2e2e'>Rearm (20mm Canons)</t>",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",						// Condition for the action to be shown
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{(vehicle _caller) setPylonLoadOut [1, "PylonWeapon_300Rnd_20mm_shells"]; (vehicle _caller) setPylonLoadOut [2, "PylonWeapon_300Rnd_20mm_shells"];},													// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation
	
	[
		_x,											// Object the action is attached to
		"<t color='#ea2e2e'>Rearm (24 x DAR)</t>",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",						// Condition for the action to be shown
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{(vehicle _caller) setPylonLoadOut [1, "PylonRack_12Rnd_missiles"]; (vehicle _caller) setPylonLoadOut [2, "PylonRack_12Rnd_missiles"];},													// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation
	
	[
		_x,											// Object the action is attached to
		"<t color='#ea2e2e'>Rearm (2 x ASRAAM)</t>",										// Title of the action
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",							// Condition for the action to be shown
		"_this distance _target < 20 && getPos vehicle _this select 2 < 2 && (typeOf (vehicle _this)) == ""I_Heli_light_03_dynamicLoadout_F""",						// Condition for the action to progress
		{},													// Code executed when action starts
		{},													// Code executed on every progress tick
		{(vehicle _caller) setPylonLoadOut [1, "PylonRack_1Rnd_AAA_missiles"]; (vehicle _caller) setPylonLoadOut [2, "PylonRack_1Rnd_AAA_missiles"];},													// Code executed on completion
		{},													// Code executed on interrupted
		[],													// Arguments passed to the scripts as _this select 3
		1,													// Action duration [s]
		0,													// Priority
		false,												// Remove on completion
		false												// Show in unconscious state 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _x];	// MP compatible implementation
	
} forEach _aafObjects;

// I_Heli_light_03_dynamicLoadout_F