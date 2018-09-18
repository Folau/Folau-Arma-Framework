/* 
Folau's No Loot Script

Prevents players from accessing the inventory of non-side units (including civilians)

NB:

> Does not include vehicles/containers - make sure these only have what you want the players to have!
> Players can still grab rifles/AT off the ground, but not go hunting for additional ammo.

The latter could be improved by checking classes and weapons etc, but I'm not overly fussed atm.
 */
player addEventHandler ["InventoryOpened",{

	_playersSideFnc = missionNamespace getVariable ["playerSideFolau",0];
  
        if (_this select 1 isKindOf "Man") then {
			_thing = _this select 1;
			// hint format["DEBUG PRINT: %1",(side group _thing)];
			// if (side group _thing == east || side group _thing == independent) then {
			if (side group _thing != _playersSideFnc) then {
				closeDialog 602; true
			};

		
		};
}];