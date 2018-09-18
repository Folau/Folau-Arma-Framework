// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_pos","_units","_textDone","_dispersion"];
params["_unit","_pos"];

_dispersion = 500; // The maximum dispersion for units when HALO jumping

// ====================================================================================

// LOCALITY CHECK
// The component should not run anywhere else but where the unit is local by default
// This check is a redundancy to ensure this

if !(local _unit) exitWith {};

// ====================================================================================

// TELEPORT UNITS
// Loop through the group's units (excluding the leader) and check if they are local, if true teleport
// them next to the leader and display a notification for players

if (f_var_mapClickTeleport_Height == 0) then {
	_unit setPos [((_pos select 0) + 5 + random 5),((_pos select 1) + 5 + random 5),(_pos select 2)];
} else {
	cutText ["", "BLACK FADED",999];
	_unit setPos [((_pos select 0) + random _dispersion - random _dispersion),((_pos select 1) + random _dispersion - random _dispersion),(_pos select 2) + random 15 - random 15];
	[_unit] spawn f_fnc_mapClickHaloEffect;
};