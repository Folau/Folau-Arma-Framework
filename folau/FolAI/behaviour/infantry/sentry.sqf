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
					

	Use:			null = [this] execVM "folau\FolAI\reinforce.sqf"
*/

params
[
	"_unit"
];

sleep 5;

while { alive leader _unit } do {
	scopeName "Test";

	// Reinforce a nearby squad

	if (behaviour leader _unit == "COMBAT") then
	{
		while {(count (waypoints _unit)) > 0} do {
			deleteWaypoint ((waypoints _unit) select 0);
		};
		
		// Create the guard waypoint
		waypoint1 = _unit addWaypoint [getpos leader _unit, 0];
		[group leader _unit, 0] setWaypointType "GUARD";
		_unit setSpeedMode "FULL";
		_unit setBehaviour "AWARE"; 
		_unit setFormation "WEDGE";
		breakout "Test"
	};

	sleep 5;
	
};
