///////////////////////////////////////////////
// FolAI/spawning_AI.sqf
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Gerenic
	Version:		0.1
	Last edited:	01/03/2018
	
	Description:	Spawns AI at the given markers - very hardcoded at the moment.

	Parameters:

	Use:			null = execVM "folau\objectives\defence.sqf"
*/

sleep 5;
_spawnpoints = ["spawn_1", "spawn_2", "spawn_3", "spawn_4", "spawn_5", "spawn_6", "spawn_7", "spawn_8"];

// Main loop
while {time < (f_param_timelimit - 120)} do { // 180 for testing - will be pulled from an f_param
	// Work out unit limits
	_total_spawned = west countSide allUnits;
	_player_count = east countSide allUnits;
	
	if (_total_spawned < (3 * _player_count) ) then {
		_k = 0;
		_group_count = random [2, 4, 8];
		_group = createGroup west;
		_chosen_spawn = selectRandom _spawnpoints;
		while {_k < _group_count} do {
			_unit_type = selectRandom [
				"B_G_Soldier_F",
				"B_G_Soldier_lite_F",
				"B_G_Soldier_SL_F",
				"B_G_Soldier_TL_F",
				"B_G_Soldier_AR_F",
				"B_G_medic_F",
				"B_G_engineer_F",
				"B_G_Soldier_exp_F",
				"B_G_Soldier_GL_F",
				"B_G_Soldier_M_F",
				"B_G_Soldier_LAT_F",
				"B_G_Soldier_A_F",
				"B_G_officer_F"
			];
			_group createUnit [_unit_type, getMarkerPos _chosen_spawn, [], 1, "FORM"];
			_k = _k + 1;
		};
		_wp = _group addWaypoint [getMarkerPos "attack_marker", 0];
		_wp setWaypointType "GUARD";
		_erv = _group addWaypoint [getMarkerPos _chosen_spawn, 1];
		_erv setWaypointType "MOVE";
		_erv setWaypointBehaviour "AWARE";
		_erv setWaypointSpeed "FULL";
		sleep 5;
	}
	else
	{
	sleep 5
	};
};