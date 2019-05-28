/* 
Name: 		Loot Prevention Script
Author: 	Folau
Date:		15th December 2018

Description:

Prevents players from accessing the inventory of non-side units (including civilians)

NB:

> Does not include vehicles/containers - make sure these only have what you want the players to have!
> Players can still grab rifles/AT off the ground, but not go hunting for additional ammo.

The latter could be improved by checking classes and weapons etc, but I'm not overly fussed atm.

Usage:
		
null = execVM "folau\utils\noLoot.sqf";				// Prevent looting of enemies

 */
 
addMissionEventHandler ["EntityKilled", {
	params ["_killedUnit"];
	 
	_playersSideFnc = missionNamespace getVariable ["playerSideFolau",0];
	  
	if !(side group _killedUnit isEqualTo _playersSideFnc || side group _killedUnit isEqualTo civilian) then 
	{
		// hint format ["UNIT KILLED SIDE %1", (side group _killedUnit)];
		// _killedUnit setVariable ["notLootable", true];
		removeAllWeapons _killedUnit;
		
		switch (side _killedUnit) do {
				case west: { 		
					_killedUnit unassignItem "NVGoggles";
					_killedUnit removeItem "NVGoggles";
					_killedUnit unassignItem "NVGoggles_tna_F";
					_killedUnit removeItem "NVGoggles_tna_F";
				};
				case east: {			
					_killedUnit unassignItem "NVGoggles_OPFOR";
					_killedUnit removeItem "NVGoggles_OPFOR";
				};
				case independent: {			
					_killedUnit unassignItem "NVGoggles_INDEP";
					_killedUnit removeItem "NVGoggles_INDEP";
				};
				default { };
			};
		removeBackpack _killedUnit;
		_killedUnit unassignItem "ItemGPS";
		_killedUnit removeItem "ItemGPS";
		
/* 		removeBackpack _killedUnit; */
	}

}];
 
/* player addEventHandler ["InventoryOpened",{

	_playersSideFnc = missionNamespace getVariable ["playerSideFolau",0];
  
        if (_this select 1 isKindOf "Man") then {
		
			_thing = _this select 1;
			_lootBoolean = _thing getVariable "notLootable";
			
			// hint format["DEBUG PRINT: Side (Obj) %1 Side (Player)",(side group _thing), (_playersSideFnc)];
			
			// if (side group _thing == east || side group _thing == independent) then {
			
			if (_lootBoolean) then {
				// hint "YOU CANNAE LOOT HIM CAPTAIN";
				closeDialog 602; true
			};

		
		};
}]; */