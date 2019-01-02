///////////////////////////////////////////////
// File Description
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	23/02/2018
	
	Description:	Makes a group containing a HVT flee

	Parameters:
					this select 0:		_hvt				The HVT themself
					this select 1:		_escapepoint		The point the HVT is fleeing to
					this select 2:		_escape_dist		The distance the HVT needs to flee
					this select 3:		_centre_point		The object at the centre point of the distance

	Use:			null = [this, 1000, object] execVM "FolAI\hvtFlee.sqf"
*/

// Read Parameters
params
	[
		["_hvt", null],
		["_escapePoint", null],
		["_escapeVic", null],
		["_escapeDistance", null]
	];

_selected_flee = _escapePoint call BIS_fnc_selectRandom;
_start_pos = getpos _hvt;	

sleep 5;

while {alive _hvt} do {
	scopeName "Test";
	// If the group doesn't think it is safe.
	if (behaviour _hvt == "COMBAT") then {
		// Remove all waypoints, then create an unload waypoint.
		
		while {(count (waypoints group _hvt)) > 0} do {
			deleteWaypoint ((waypoints group _hvt) select 0);
		};
		
		group _hvt setBehaviour "CARELESS";
		group _hvt setSpeedMode "FULL";
		// {_x moveInAny _escapeVic;} forEach units group _hvt;
		waypoint0 = group _hvt addWaypoint [getpos _escapeVic, 0];
		[group _hvt, 0] setWaypointType "MOVE";
		waypoint1 = group _hvt addWaypoint [getpos _escapeVic, 0];
		[group _hvt, 1] setWaypointType "GETIN NEAREST";
		waypoint2 = group _hvt addWaypoint [getpos _selected_flee, 0];
		[group _hvt, 2] setWaypointType "MOVE";
		breakout "Test"
	};
	// hint "I'm Safe";
	sleep 1
};

while {alive _hvt} do {
	scopeName "Run Away";
	_distance = _hvt distance _start_pos;
	hint format ["%1", _distance]; 
	if (_distance > _escapeDistance) then {
		"end3" call BIS_fnc_endMissionServer;
		breakout "Run Away"
	};
	sleep 1
};