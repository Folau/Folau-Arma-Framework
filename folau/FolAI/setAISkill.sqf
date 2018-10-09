/* 
Folau's AI Skill Script

Sets the skill of all AI units based on a parameter setting.

 */

_playersSideFnc = missionNamespace getVariable ["playerSideFolau",0];
_skill = f_param_aiSkill / 10.0;

{
	if ((side _x) != _playersSideFnc) then
	{
		_x setSkill _skill;
	};
} forEach allUnits;

