///////////////////////////////////////////////
// File Description
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	21/02/2018
	
	Description:	Makes a unit abandon a patrol and hunt for enemy	

	Parameters:
					this select 0:		unit					Group leader of the drivers' group.	
					this select 1:		trigger					The trigger to call units back to base.
					this select 2:		ojbect					An object back at base.

	Use:			null = [this] execVM "ambush.sqf"
*/

// Read Parameters
params
[
	"_unit", "_trigger", "_base_pos"
];

while {true} do {
	scopeName "Test";
	// If the group doesn't think it is safe.
	if (triggerActivated _trigger) then {
		// Remove all waypoints
		while {(count (waypoints _unit)) > 0} do {
			deleteWaypoint ((waypoints _unit) select 0);
		};
		
		// Create the guard waypoint
		waypoint1 = _unit addWaypoint [getpos _base_pos, 0];
		[group leader _unit, 0] setWaypointType "GUARD";
		_unit setSpeedMode "NORMAL";
		_unit setBehaviour "AWARE"; 
		breakout "Test"
	};
	sleep 1
};