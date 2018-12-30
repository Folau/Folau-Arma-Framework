/* 
Name: 		teleportObject.sqf
Author: 	Folau
Date:		29th December 2018

Adds a teleport action to an object.

 */
 
params ["_targetPos", "_systemChatText"];

	systemChat _systemChatText;
	player enableSimulation false;
	[0,"BLACK",3,1] call BIS_fnc_fadeEffect; 

	player SetPos [(getPos _targetPos select 0) + random [-5, 0, 5], (getPos _targetPos select 1)+ random [-5, 0, 5], (getPos _targetPos select 2)]; 
	
	player enableSimulation true;
	[1,"BLACK",3,1] call BIS_fnc_fadeEffect; 
