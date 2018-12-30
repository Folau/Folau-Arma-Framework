/* 
Name: 		AI Item Removal
Author: 	Folau
Date:		15th December 2018
 */

params ["_aiSide"];

{
if(side _x == _aiSide) then {
    _x unassignItem "NVGoggles_INDEP";
    _x removeItem "NVGoggles_INDEP";
	
	_x removePrimaryWeaponItem "acc_pointer_IR";
	_x addPrimaryWeaponItem "acc_flashlight";
	// _x enableGunLights "AUTO"; Needs further investigating to determine what AI states allow this
	
};
} foreach (allUnits); 
