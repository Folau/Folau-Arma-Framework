// F3 - Radio Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
waitUntil{!isNil "f_var_setParams"};
if (isNil "f_param_radios") exitWith {
	diag_log text "[F3] INFO (fn_radio_init.sqf): No radio parameters defined, exiting.";
};

// If any radio system selected
// Check which system to use

if (f_param_radios == 1) exitWith {
	if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text "[F3] DEBUG (fn_radio_init.sqf): Starting with TFAR";};
	[] execVM "f\radios\tfr\tfr_init.sqf";
};
if (f_param_radios == 2) exitWith {
	if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text "[F3] DEBUG (fn_radio_init.sqf): Starting with ACRE";};
	[] execVM "f\radios\acre2\acre2_init.sqf"; // F3 Default
};

[] execVM "f\radios\custom_init.sqf"; // Vanilla Channels