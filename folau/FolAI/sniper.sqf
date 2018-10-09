///////////////////////////////////////////////
// File Description
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	21/02/2018
	
	Description:	Makes a unit abandon a patrol and hunt for enemy	

	Parameters:
					this select 0:		unit					Group leader of the drivers' group.	

	Use:			null = [this] execVM "ambush.sqf"
*/

// Read Parameters
params
[
	"_unit", "_range"
];

_leader = leader _unit;
_enemySides = [side _leader] call BIS_fnc_enemySides;


while {alive _leader} do {
	sleep 5;
	_enemies = allUnits select {side _x in _enemySides AND getposasl _x distance getposasl _leader <= _range};
	
	{
																										   
		_leader reveal [_x,4];
																										   
	} forEach _enemies;
};

