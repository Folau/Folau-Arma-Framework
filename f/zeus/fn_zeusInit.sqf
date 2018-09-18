// F3 Zeus Support  - Initialization
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !isServer exitWith {};

if (isNil "f_fnc_zeusAddAddons") then { f_fnc_zeusAddAddons = compileFinal preprocessFileLineNumbers "f\zeus\fn_zeusAddAddons.sqf"; };
if (isNil "f_fnc_zeusAddObjects") then { f_fnc_zeusAddObjects = compileFinal preprocessFileLineNumbers "f\zeus\fn_zeusAddObjects.sqf"; };
if (isNil "f_fnc_zeusRemovePlayers") then { f_fnc_zeusRemovePlayers = compileFinal preprocessFileLineNumbers "f\zeus\fn_zeusRemovePlayers.sqf"; };
if (isNil "f_fnc_zeusTerm") then { f_fnc_zeusTerm = compileFinal preprocessFileLineNumbers "f\zeus\fn_zeusTerm.sqf"; };

params ["_unit",["_addons",[]],["_objects",[]]];

// SETUP CURATOR
// Exit if no unit was passed or not player
if (isNull _unit || !isPlayer _unit || time < 1) exitWith {};

// Exit if unit is already curator
if (!isNull (getAssignedCuratorLogic _unit)) exitWith {
	format["[Zeus] Logic already assigned to %1, remove it first",name _unit] remoteExec ["systemChat",_unit];
};

private _curator = missionNamespace getVariable [format["f_zeusCurator_%1",getPlayerUID _unit],objNull];

// Check curator exists, if not create it
if !(isNull _curator) then {
	format["[Zeus] Curator variable already assigned to %1, reassigning", name _unit] remoteExec ["systemChat",_unit];
	unassignCurator _curator;
	deleteVehicle _curator;
	sleep 1;
};

// Create side if it doesn't exist
if (isNil "f_var_sideCenter") then { f_var_sideCenter = createCenter sideLogic; };

// Create a new curator logic
_curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F",[0,0,0],[],0,""];
_curator setVariable ["owner",format["%1",getPlayerUID _unit],true];
_curator setVariable ["showNotification",false,true];
_curator setVariable ["Addons",3,true];
	
// If player dc's don't try and re-add the curator (server crash?)
missionNamespace setVariable [format["f_zeusCurator_%1",getPlayerUID _unit],_curator];

//Set Zeus Vision Modes
[_curator, [-1, -2, 0]] call bis_fnc_setcuratorvisionmodes;

// Assign the passed unit as curator
_unit assignCurator _curator;

waitUntil {sleep 1; !isNull (getAssignedCuratorUnit _curator)};

//Add desired addons
[_unit,_addons] call f_fnc_zeusAddAddons;

//Add desired objects
[_unit,_objects] call f_fnc_zeusAddObjects;

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{
	_curator setCuratorCoef [_x,0];
} forEach ["place","edit","delete","destroy","group","synchronize"];

format["[Zeus] Curator set-up complete for %1.",name _unit] remoteExec ["systemChat",_unit];
diag_log text format["[F3] [INFO] Curator assigned to %1",name _unit];