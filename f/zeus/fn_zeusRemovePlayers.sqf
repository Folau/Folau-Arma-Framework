// F3 Zeus Support - Add Objects
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// DECLARE VARIABLES
private ["_curator","_mode","_objects","_getGlobalVars"];

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params [["_unit",objNull]];

// RESOLVE CURATOR VARIABLE
// If the passed unit is not in the list of all curators, check whether the curator is assigned to it

private _curator = getAssignedCuratorLogic _unit;
if (isNull _curator) then { _curator = _unit; };

// If curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	format["[Zeus] Curator could not be resolved _curator type : %2",typeOf _curator] remoteExec ["systemChat",_unit];
	diag_log text format["[F3] DEBUG (f\zeus\fn_zeusAddAddons.sqf): Could not resolve curator properly, is either null or not the correct type. IsNull = %1, _curator type : %2 (should be ModuleCurator_F)",isNull _curator,typeOf _curator];
};

// Decide which objects to add based on passed mode
private _counter = 0;
{
	if (_x in curatorEditableObjects _curator) then {
		_counter = _counter + 1;
		_curator removeCuratorEditableObjects [[_x],true];
	};

} forEach (playableUnits + switchableUnits);

format["[Zeus] Removed %1 Player Units",_counter] remoteExec ["systemChat",_unit];