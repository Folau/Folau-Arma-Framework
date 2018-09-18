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