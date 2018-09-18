// F3 - Medical Systems Support initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for parameter to be initialised - NOTE: Not handled like other params!!
// f_param_medical - Chosen via Params
// f_var_medical_level - Sets the ACE3 Level (if any)
// We MUST wait for it in case ACE is running.
waitUntil{!isNil "f_var_setParams" && !isNil "f_var_medical_level"};

if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text format["[F3] DEBUG (fn_medical_init.sqf): Running for %1",([player,"Server"] select isServer)]; };

if (f_var_medical_level == 0) exitWith {}; // Vanilla parameter chosen.

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each medical modification requires a different set of scripts to be used, and so we
// split into a separate script file for initialisation of each mod.
if (isServer && (f_var_medical_level in [1,2])) then { // Iterate all the missions vehicles and convert their gear.
	{
		_unit = _x;
		// Check if the unit was already touched by the F3 Assign Gear Component
		if (!(_unit getVariable ["f_var_assignGear_done", false]) && alive _unit) then {
			[_unit] spawn f_fnc_ace_medicGearConverter;
			_unit setVariable ["f_var_assignGear_done",true];
		};
	} forEach vehicles;
};

call {
	if (hasInterface && f_var_medical_level == 1) exitWith { execVM "f\ace3\f_ace_clientInit_basic.sqf"; }; 		// Advanced Combat Environment 3 Basic
	if (hasInterface && f_var_medical_level == 2) exitWith { execVM "f\ace3\f_ace_clientInit_advanced.sqf"; };		// Advanced Combat Environment 3 Advanced		
	if (hasInterface && f_var_medical_level == 3) exitWith { execVM "f\medical\FAR_revive\FAR_revive_init.sqf"; }; 	// Farooq Revive
};