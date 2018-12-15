/* 
Name: 		Paradrop Setup Script
Author: 	Folau
Date:		15th December 2018

Description:
Assuming players start in their airdrop vehicle, this will allow them to paradrop and keep backpack kits

Based on the F3 halo drop script

Usage:

{
if(side _x == west) then {
	null = [_x] execVM "folau\utils\paradropSetup.sqf";
};
} foreach (allUnits); 

*/

params ["_unit"];

// Save the original backpack and remove
_bp = backpack _unit;
_bpi = backPackItems _unit;
removeBackpack _unit;

// Give them a parachute
sleep 0.5;
_unit addBackpack "B_parachute";

waitUntil {sleep 0.1; (position _unit select 2) < 125;};

//Check if players chute is open, if not open it.
if (vehicle _unit isEqualto _unit && alive _unit) then {
	_unit action ["openParachute", _unit];
};

waitUntil {sleep 0.1; isTouchingGround _unit || (position _unit select 2) < 1 };
_unit action ["eject", vehicle _unit];
sleep 1;

removeBackpack _unit;
sleep 0.5;

_unit addBackPack _bp;
sleep 0.5;

{
	_unit addItemToBackpack _x;
} forEach _bpi;