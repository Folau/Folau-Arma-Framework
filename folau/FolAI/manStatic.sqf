///////////////////////////////////////////////
// File Description
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	21/02/2018
	
	Description:	Makes a unit crew a static upon contact

	Parameters:
					this select 0:		unit					The group this is applied to.
					this select 1:		target					The static target.
					

	Use:			null = [this] execVM "folau\FolAI\manStatic.sqf"
*/

params
[
	"_unit", "_target"
];

sleep 10;

while { alive leader _unit } do {
	scopeName "Test";
	
	if (behaviour _unit == "COMBAT") then
	{
		while {(count (waypoints _unit)) > 0} do {
			deleteWaypoint ((waypoints _unit) select 0);
		};
		
		// Create the guard waypoint
		waypoint1 = group _unit addWaypoint [getpos _target, 0];
		[group _unit, 0] setWaypointType "MOVE";
		_unit assignAsGunner _target; 
		[_unit] orderGetIn true;
		group _unit setSpeedMode "FULL";
		group _unit setBehaviour "AWARE"; 
		breakout "Test"
	};
};