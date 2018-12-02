// Slammer ATGM Add

params
[
	"_vic"
];

// hint "INITIALISING";

_mortar = "I_G_Mortar_01_F" createVehicle position _vic;

_mortar attachTo [_vic, [0, -2, 0.1] ]; 

_mortar enableWeaponDisassembly false;

_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

{_vic lockCargo [_x, true]} forEach [2,3,4,5,6,7];

_mortar addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_unit setPos [ (getPos _vehicle select 0) + 3, (getPos _vehicle select 1) + 3, 0];
}];