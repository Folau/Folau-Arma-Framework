///////////////////////////////////////////////
// File Description
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	24/01/2018
	
	Description:	Makes convoy ambushes slightly more reactive	

	Parameters:
					this select 0:		leadDriver					Group leader of the drivers' group.	

	Use:			null = [this] execVM "ambush.sqf"
*/

// Read Parameters
params
[
	["_leadDriver", objNull]
];

while {true} do {
	scopeName "Test";
	// If the group doesn't think it is safe.
	if (behaviour _leadDriver == "COMBAT") then {
		// Remove all waypoints, then create an unload waypoint.
		while {(count (waypoints group _leadDriver)) > 0} do {
			deleteWaypoint ((waypoints group _leadDriver) select 0);
		};
		waypoint1 = group _leadDriver addWaypoint [getpos _leadDriver, 0];
		[group _leadDriver, 0] setWaypointType "TR UNLOAD";
		waypoint2 = group _leadDriver addWaypoint [getpos _leadDriver, 0];
		[group _leadDriver, 1] setWaypointType "GUARD";
		breakout "Test"
	};
	sleep 1
};