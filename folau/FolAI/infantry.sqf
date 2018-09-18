///////////////////////////////////////////////
// File Description
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	21/02/2018
	
	Description:	Makes a unit abandon its job and reinforce a nearby one in contact.	

	Parameters:
					this select 0:		unit					The group this is applied to.
					this select 1:		radius					The radius to allow reinforcement.
					

	Use:			null = [this] execVM "folau\FolAI\reinforce.sqf"
*/

params
[
	"_unit", "_radius", "_trigger", "_base_pos", "_fall_back"
];

sleep 10;

while { alive leader _unit } do {
	scopeName "Test";

	// Reinforce a nearby squad
	{
		if (behaviour _x == "COMBAT" && leader _unit distance _x < _radius) then
		{
			while {(count (waypoints _unit)) > 0} do {
				deleteWaypoint ((waypoints _unit) select 0);
			};
			
			// Create the guard waypoint
			waypoint1 = _unit addWaypoint [getpos _x, 0];
			[group leader _unit, 0] setWaypointType "GUARD";
			_unit setSpeedMode "FULL";
			_unit setBehaviour "AWARE"; 
			_unit setFormation "WEDGE";
			breakout "Test"
		};
	} 
	foreach (allunits select {side _x isEqualTo side leader _unit});
	
	// Fall back if needed
	if (_fall_back == 1) then {
		if (triggerActivated _trigger) then {
			// Remove all waypoints
			while {(count (waypoints _unit)) > 0} do {
				deleteWaypoint ((waypoints _unit) select 0);
			};
			
			// Create the guard waypoint
			waypoint1 = _unit addWaypoint [getpos _base_pos, 0];
			[group leader _unit, 0] setWaypointType "GUARD";
			_unit setSpeedMode "FULL";
			_unit setBehaviour "AWARE"; 
			breakout "Test"
		};
	};
	sleep 1;
	
};
