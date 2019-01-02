///////////////////////////////////////////////
// FolAI/spawning_Vic.sqf
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	01/03/2018
	
	Description:	Spawns vehicles from the array to engage players.

	Parameters:

	Use:			null = execVM "folau\FolAI\spawning_Vic.sqf"
*/

sleep 60; // balance - give the guys a bit of time before technicals come screaming in

_spawnpoints = ["spawn_v1", "spawn_v2", "spawn_v3"];
_vehicle_list = ["B_G_Offroad_01_Armed_F"]; // FIA only have technicals, can I get the FIA Gorgons somehow?

while {time < (f_param_timelimit - 120)} do {
	_group = createGroup west;
	_chosen_spawn = selectRandom _spawnpoints;

	_vehicle_type = selectRandom _vehicle_list;	
	[getMarkerPos _chosen_spawn, 180, _vehicle_type, _group] call bis_fnc_spawnvehicle;
	
	_wp = _group addWaypoint [getMarkerPos "attack_marker_vic", 0];
	_wp setWaypointType "GUARD";
	sleep random [240, 300, 600]; // Should be an input really
	
};