/* 
Folau's Laws of War Script

Uses end6 to end the mission if the players kill too many civilians.
This covers 90% of the LoW violation in Arma.

Params:

_maxCivs		"Int" Number of civilians before the mission fails
 */

params["_maxCivs"];

missionNamespace setVariable ["maxCivKilled", _maxCivs];
missionNameSpace setVariable ["MyCivKillCounter", 0, true];

addMissionEventHandler ["EntityKilled", {
  params ["_killedUnit","_killer","_triggerMan"];
  
  _playersSideFnc = missionNamespace getVariable ["playerSideFolau",0];
  
  if (side group _killedUnit isEqualTo civilian && _killedUnit isKindOf "CAManBase" && side _triggerMan isEqualTo   _playersSideFnc) then {
  
    if (isNil {missionNameSpace getVariable "MyCivKillCounter"}) then {
      missionNameSpace setVariable ["MyCivKillCounter",0,true];
    };
	
    missionNameSpace setVariable ["MyCivKillCounter", (missionNameSpace getVariable ["MyCivKillCounter",0]) + 1, true];
	
	format ["Civilian (%1) killed by %2", name _killedUnit, name _killer] remoteExec ["systemChat"];
	
    if (missionNameSpace getVariable ["MyCivKillCounter",0] >= missionNameSpace getVariable ["maxCivKilled",0]) then {
      "end6" call BIS_fnc_endMissionServer;
    };
	
  };
}];