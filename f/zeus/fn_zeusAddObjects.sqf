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

params [["_unit",objNull],["_mode",[]],["_onlyLeaders",false]];

// RESOLVE CURATOR VARIABLE
// If the passed unit is not in the list of all curators, check whether the curator is assigned to it

private _curator = getAssignedCuratorLogic _unit;
if (isNull _curator) then { _curator = _unit; };

// If curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	format["[Zeus] Failed to resolve curator for %1", _unit] remoteExec ["systemChat",_unit];
	diag_log text format["[F3] DEBUG (f\zeus\fn_zeusAddAddons.sqf): Could not resolve curator properly, is either null or not the correct type. IsNull = %1, _curator type : %2 (should be ModuleCurator_F)",isNull _curator,typeOf _curator];
};

// Decide which objects to add based on passed mode

_objects = [];

switch (typeName _mode) do {
	case "STRING": {
		switch (toLower _mode) do {
			case "ai": {
				{ 
					if (!isPlayer _x && alive _x) then {
						_objects pushBack _x;
					};
				} forEach entities "AllVehicles";
			};
			case "vehicles": {
				{ 
					if (side _x in [east,west,resistance,civilian] && alive _x && !(_x isKindOf "CAManbase")) then {
						_objects pushBack _x;
					};
				} forEach entities "AllVehicles";
			};
			case "empty": {
				{ 
					if !(side group _x in [east,west,resistance,civilian,sideLogic]) then {
						_objects pushBack _x;
					};
				} forEach allMissionObjects ""; // Includes buildings
			};
		};
	};
	case "ARRAY": {_objects = _mode};
	case "OBJECT": {_objects = [_mode]};
	case "SIDE": {
		{
			if ((side group _x) == _mode) then {
				_objects pushBack _x;
			};
		} forEach allMissionObjects "";
	};
	case "BOOL": {
		 if _mode then {
		 	_objects = allMissionObjects "";

		 	//To prevent unnecessary stress on the network compare the the new _objects array to the existing curator objects. If they are identical, reset _objects to an empty array
		 	if (_objects isEqualTo (curatorEditableObjects _curator)) then {
		 		_objects = [];
		 	};
		 } else {
		 	_curator removeCuratorEditableObjects [curatorEditableObjects _curator,true];
		 };
	 };
};

// Reduce list to; Group-Leaders, Vehicles or Empty vehicles
_leaders = [];

if _onlyLeaders then {
	{		
		if (_x == leader group _x) then {
			_leaders pushBack _x;
		};
	} forEach _objects;
	_objects = _leaders;
};

// Nothing to add!
if (count _objects == 0) exitWith {};

// Add all selected objects to curator lists
_curator addCuratorEditableObjects [_objects,true];

//systemChat format["[ZEUS] Objects: %1",_objects];
format["[Zeus] Added %1 objects",count _objects] remoteExec ["systemChat",_unit];