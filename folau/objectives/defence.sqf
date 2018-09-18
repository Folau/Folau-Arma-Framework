///////////////////////////////////////////////
// objectives/defence.sqf
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Tanoa Defence
	Version:		0.1
	Last edited:	01/03/2018
	
	Description:	Used for the Tanoa Defence mission - could be modified for a single defend point.	

	Parameters:
					this select 0:		unit					Group leader of the drivers' group.	

	Use:			null = execVM "folau\objectives\defence.sqf"
*/
// Preallocating variables
_csat_count = 0;
_fia_count = 0;
sleep 1;

// Main Loop
while {time < (f_param_timelimit - 120)} do { // 180 for testing - will be pulled from an f_param
	scopeName "Main";	
	// Alpha Check
	_csat_count = east countSide list areaT;
	_fia_count = west countSide list areaT;
	
	sleep 1;
	
	if (_fia_count > _csat_count) then {
		"end3" call BIS_fnc_endMissionServer; // Area is under FIA control - failed.
		breakout "Main";
	};	
};

_fia_groups = allGroups select {side _x == west;};

// Set up the smoke screen
{
  if ((side _x) == west) then
  {
	// Make the enemy throw at least 1 smoke each
	_x addMagazine "SmokeShell"; 
	_x forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
	_x addMagazine "SmokeShell"; 
	_x forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
  };
} forEach allUnits;

// Time to GTFO!
{
	// Head for the nearest erv
	_erv1_dis = leader _x distance getMarkerPos "erv1";
	_erv2_dis = leader _x distance getMarkerPos "erv2";
	if (_erv1_dis < _erv2_dis) then
	{
		_x move getMarkerPos "erv1";
	}
	else
	{
		_x move getMarkerPos "erv2";
	};
	
	// Careless breaks things, use aware
	_x setBehaviour "AWARE";
	_x setSpeedMode "FULL";
	
} forEach _fia_groups;

// Bit of time to finish off slow AI
sleep 120;
"end1" call BIS_fnc_endMissionServer;