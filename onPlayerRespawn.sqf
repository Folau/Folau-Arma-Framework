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

if (side _newUnit == west && !(isNil "med_west")) then {
	if (alive med_west) then {_newUnit moveInCargo med_west;} 
	};

// ---------------------------------- EAST FORCES -------------------------------------
if (side _newUnit == east && !(isNil "med_east")) then {
	if (alive med_east) then {_newUnit moveInCargo med_east;} 
	};
// ---------------------------------- INDP FORCES -------------------------------------

if (side _newUnit == independent && !(isNil "med_indep")) then {
	if (alive med_indep) then {_newUnit moveInCargo med_indep;} 
};