params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
if (isNull _oldUnit) exitWith {};

// Disable Spectator
[false] call f_fnc_spectateInit;

// Assign the unit their gear. or gear from death
if (_newUnit getVariable ["f_var_assignGear","x"] != "x") then {
	[(_newUnit getVariable ["f_var_assignGear",""]),_newUnit] call f_fnc_assignGear;
} else {
	[_newUnit, [missionNamespace, "f_var_savedGear"]] call BIS_fnc_loadInventory;
};

[_newUnit] execVM "folau\utils\groupAction.sqf";

// CREATING A BETTER JIP MECHANIC

// if (side _newUnit == west && !(isNil "med_west")) then {
if (side _newUnit == west) then {
	_nObject = nearestObjects [_oldUnit, ["B_Truck_01_medical_F", "B_T_Truck_01_medical_F"], 5000] select 0;
	if !(isNil "_nObject") then {
		_newUnit moveInCargo _nObject;
		};
	};

// ---------------------------------- EAST FORCES -------------------------------------
if (side _newUnit == east) then {
	_nObject = nearestObjects [_oldUnit, ["O_Truck_02_medical_F", "O_T_Truck_03_medical_ghex_F", "O_Truck_03_medical_F"], 5000] select 0;
	if !(isNil "_nObject") then {
		_newUnit moveInCargo _nObject;
		};
	};
// ---------------------------------- INDP FORCES -------------------------------------

if (side _newUnit == independent) then {
	_nObject = nearestObjects [_oldUnit, ["I_Truck_02_medical_F"], 5000] select 0;
	if !(isNil "_nObject") then {
		_newUnit moveInCargo _nObject;
		};
	};