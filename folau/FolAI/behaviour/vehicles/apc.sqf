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
	"_unit", "_keyPoints"
];

sleep 1;

// A check for any specific units that should not be reinforced (lone snipers etc)
SpecialUnits = {
	params ["_checkGroup"];

	_specialUnit = false;
	_manType = typeOf leader _checkGroup;

	_sniperBool = (["sniper", _manType] call BIS_fnc_inString || ["ghille", _manType] call BIS_fnc_inString);
	_spotterBool = ["spotter", _manType] call BIS_fnc_inString;
	_officerBool = ["officer", _manType] call BIS_fnc_inString;

	if (_sniperBool || _spotterBool || _officerBool) then {
		_specialUnit = true;
	}
	else {
		_specialUnit = false;
	};

	_specialUnit;
};

NearestPointOfInterestSelect = {
	params ["_group", "_positions"];
	
	_positionOut = "None";
	_distance = 10000;
	
	{
		_meters = leader _group distance getMarkerPos _x;
		if (_meters < _distance) then {
			_distance = _meters;
			_positionOut = _x

		};
		
	} forEach _positions;
	
	_positionOut;
};

NearUnitsCombat = {
	params ["_checkGroup", "_checkPosition"];
	
	_inCombat = False;
	
	_nearObjects = nearestObjects [getMarkerPos _checkPosition,["Man"],100];
	
	{
		if (behaviour leader _x == "COMBAT") then {
			_inCombat = True;
		};
	} forEach _nearObjects;
	
	_inCombat;
};

_chosenPosition = "None";
_returnHome = false;

_chosenPosition = [_unit, _keyPoints] call NearestPointOfInterestSelect;

_radius = selectMin [leader _unit distance getMarkerPos _chosenPosition, 500];
_returnHomeRadius = selectMin [leader _unit distance getMarkerPos _chosenPosition, 300];

if (_returnHomeRadius < 300) then {
	_returnHome = true;
}
else
{
	_returnHome = false;
};

//systemChat format ["AI GROUP PARAMS: %1 %2 %3", _radius, _returnHome, _returnHomeRadius];

// Main loop
while { alive leader _unit } do {
	scopeName "Test";

	// Reinforce a nearby squad
	{
		if (behaviour _x == "COMBAT" && leader _unit distance _x < _radius && !([_x] call SpecialUnits)) then
		
		{
			while {(count (waypoints _unit)) > 0} do {
				deleteWaypoint ((waypoints _unit) select 0);
			};

			// Create the guard waypoint
			_waypoint1 = _unit addWaypoint [getpos _x, 50];
			[group leader _unit, 1] setWaypointType "MOVE";
			_unit setSpeedMode "FULL";
			_unit setBehaviour "AWARE"; 
			_unit setFormation "WEDGE";
			breakout "Test"
		};
		
	} 
	foreach (allunits select {side _x isEqualTo side leader _unit});
	
	// Fall back if needed
	if (_returnHome) then {
		if ([_unit, _chosenPosition] call NearUnitsCombat) then {
			// Remove all waypoints
			while {(count (waypoints _unit)) > 0} do {
				deleteWaypoint ((waypoints _unit) select 0);
			};
			
			// Create the guard waypoint
			_waypoint1 = _unit addWaypoint [getMarkerPos _chosenPosition, 50];
			[group leader _unit, 0] setWaypointType "GUARD";
			_unit setSpeedMode "FULL";
			_unit setBehaviour "AWARE"; 
			breakout "Test"
		};
	};
	
	sleep 5;
	
};

while { alive leader _unit } do {
	scopeName "UNLOAD";

	if (behaviour leader _unit == "COMBAT") then
			
		{
			while {(count (waypoints _unit)) > 0} do {
				deleteWaypoint ((waypoints _unit) select 0);
			};

		// Create the guard waypoint
		_waypoint1 = _unit addWaypoint [getpos leader _unit, 0];
		[_unit, 0] setWaypointType "TR UNLOAD";
		// Create the guard waypoint
		_waypoint2 = _unit addWaypoint [getpos leader _unit, 20];
		[_unit, 1] setWaypointType "GUARD";
		
		_unit setSpeedMode "FULL";
		_unit setBehaviour "AWARE"; 
		_unit setFormation "WEDGE";
		
		breakout "UNLOAD"
	};
	
	sleep 5;
	
};

while { alive leader _unit } do {
	scopeName "InContact";

	_myNearestEnemy = leader _unit findNearestEnemy position leader _unit;
	
	if !(isNull _myNearestEnemy) then {
	
		while {(count (waypoints _unit)) > 0} do {
			deleteWaypoint ((waypoints _unit) select 0);
		};
		
		// Create the guard waypoint
		_waypoint1 = _unit addWaypoint [position _myNearestEnemy, 50];
		[group leader _unit, 0] setWaypointType "GUARD";
	
	};
	
	sleep random [20, 40, 60];
};