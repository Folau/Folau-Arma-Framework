// F3 Zeus Support  - Termination
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !isServer exitWith {};

params [["_unit",objNull]];

// Exit if no unit was passed or not player
if (!isPlayer _unit) exitWith {};

_curator = missionNamespace getVariable [format["f_zeusCurator_%1",getPlayerUID _unit],objNull];

// If curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	format["[Zeus] Curator returned null for %1, nothing to remove?", name _unit] remoteExec ["systemChat",_unit];
};

// Break connection and delete
missionNamespace setVariable [format["f_zeusCurator_%1",getPlayerUID _unit],objNull];
unassignCurator _curator;
deleteVehicle _curator;

format["[Zeus] Curator Terminated for %1", name _unit] remoteExec ["systemChat",_unit];