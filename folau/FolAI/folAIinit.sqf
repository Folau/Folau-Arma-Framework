/*
	Title: 			folAIinit.sqf
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	01/01/2019
	
	Description:	Main init function for all FolAI functions
	
	Use:			null = [this] execVM "folau\FolAI\folAIinit.sqf"
*/

params ["_aiSide", "_keyPoints"];
// systemChat format["Starting FolAI for Sides %1", _aiSide];

// Set AI Skill Level
// systemChat "Setting AI Skill";
null = execVM "folau\folAI\setAISkill.sqf"; 

// Set Loadouts
// systemChat "Editing AI Loadouts";
null = execVM "folau\folAI\loadout\aiLoadout.sqf";

// Start FolAI for the selected sides
{
	null = [_x, _keyPoints] execVM "folau\folAI\behaviour\main.sqf";
} forEach (_aiSide);

systemChat "FolAI Setup Successfully";