/* 
Folau's AI Skill Script

Sets the skill of all AI units based on a parameter setting.

 */

_skill = f_param_aiSkill / 10.0;

{
	if (!(isPlayer _x)) then
	{
		_x setSkill _skill;
	};
} forEach allUnits;

