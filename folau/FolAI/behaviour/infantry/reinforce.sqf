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

hint "Initialising";


params
[
	"_unit", "_radius"
];

_k = 0;

sleep 10;

while { alive leader _unit } do {
	scopeName "Test";
	_k = _k + 1;
	hint format ["Iteration: %1", _k];
	{
		if (behaviour _x == "COMBAT" && leader _unit distance _x < _radius) then
		{
			hint "SHIT SON";
			while {(count (waypoints _unit)) > 0} do {
				deleteWaypoint ((waypoints _unit) select 0);
			};
			
			// Create the guard waypoint
			waypoint1 = _unit addWaypoint [getpos _x, 0];
			[group leader _unit, 0] setWaypointType "GUARD";
			_unit setSpeedMode "FULL";
			_unit setBehaviour "AWARE"; 
			_unit setFormation "WEDGE"
			breakout "Test"
		};
	} 
	foreach (allunits select {side _x isEqualTo side leader _unit});
	
	sleep 1;
};