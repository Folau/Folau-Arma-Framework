/*
	Title: 			folAIinit.sqf
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	01/01/2019
	
	Description:	Main init function for all FolAI functions
	
	Use:			null = [this] execVM "folau\FolAI\folAIinit.sqf"
*/

// Set AI Skill Level
null = execVM "folau\folAI\setAISkill.sqf"; 

// Set Loadouts
null = execVM "folau\folAI\loadout\aiLoadout.sqf";
