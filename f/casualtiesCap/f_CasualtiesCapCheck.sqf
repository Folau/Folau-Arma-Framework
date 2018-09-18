// F3 - Casualties Cap
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// Up to 5 variables are passed to the function:
// 0: = Side (e.g. BLUFOR), or group name(s) as string array (e.g. ["mrGroup1","myGroup2"])
// 1: = Ending or code to be executed on limit being hit.
// 2: = OPTIONAL - Percentage of casualties, if not used the global parameter will be taken instead.
// 3: = OPTIONAL - If only groups with a playable leader slot will be included (default is true)
// 4: = OPTIONAL - What faction(s) to filter for if the first variable is a side  (e.g. ["blu_f"])
// ====================================================================================
// SERVER CHECK
// Ensure this script only executes on the server:
if !isServer exitWith {};

waitUntil{sleep 2;!isNil "f_var_setParams"};

if (isNil "f_param_CasualtiesCap") then {f_param_CasualtiesCap = 80;};

params["_grpstemp",
		"_end",
       ["_pc",f_param_CasualtiesCap],
       ["_onlyPlayers",true],
       ["_faction",[]]];
	   
// Fix for when 2600K decided to switch the params around .-.
if (_end isEqualType 0) then {
	if (_end >= 10) then {
		f_param_CasualtiesCap = _end;
		if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
			diag_log text "[F3] CasualtiesCap uses old format - Consider updating!";
			systemChat "[F3] CasualtiesCap uses old format - Consider updating!";
		};
		_pc = _end;
		_pc = f_param_CasualtiesCap; 
	};
};
	   
	   
if (_pc == 0) exitWith {
	if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
		diag_log text format ["[F3] DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): %2_started = %1",_started,_grpstemp];
	};
};
	   
// ====================================================================================

// COLLECT GROUPS TO CHECK
// If a side variable was passed we collect all relevant groups

private _grps = [];

if(_grpstemp isEqualType west) then { // if the variable is any of the side variables use it to construct a list of groups in that faction.
	{
		if(_onlyPlayers) then {
			if((side _x == _grpstemp) && (leader _x in (switchableUnits + playableUnits))) then
			{
				_grps pushBack _x; // Add group to array
			};
		} else {
			if (side _x == _grpstemp) then {
				_grps pushBack _x; // Add group to array
			};
		};

	} forEach allGroups;

	// Filter the created group array for the factions

	if(count _faction > 0) then {
		{
			if !(faction (leader _x) in _faction) then {
				_grps = _grps - [_x];
			};
		} forEach _grps;
	};
} else {
	sleep 1;
	{
		_Tgrp = call compile format ["%1",_x];
		if(!isNil "_Tgrp") then {
			_grps pushBack _Tgrp;
		};
	} forEach _grpstemp;
};

// ====================================================================================

// FAULT CHECK
// 10 seconds into the mission we check if any groups were found. If not, exit with an error message

sleep 10;

if (count _grps == 0) exitWith {
	diag_log text format ["[F3] DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): No groups found, _grpstemp = %1, _grps = %2",_grpstemp,_grps];
};

// ====================================================================================

// CREATE STARTING VALUES
// A count is made of units in the groups listed in _grps.

private _started = 0;
{_started = _started + (count (units _x))} forEach _grps;

// DEBUG
if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
	diag_log text format ["[F3] DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): %2_started = %1",_started,_grpstemp];
};

// ====================================================================================

// CHECK IF CASUALTIES CAP HAS BEEN REACHED OR EXCEEDED
// Every 6 seconds the server will check to see if the number of casualties sustained
// within the group(s) has reached the percentage specificed in the variable _pc. If
// the cap has been reached, the loop will exit to trigger the ending.

while {true} do {
private  _remaining = 0;

// Calculate how many units in the groups are still alive
{
	private _grp = _x;
	private _alive = {	alive _x && 
		!(_x getVariable ["ACE_isUnconscious", false]) &&
		(lifeState _x != "INCAPACITATED")
	} count (units _grp); 
	
	if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
		diag_log text format ["[F3] DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): Processing %1_%2 (%6) - %3 %4 %5",
			_grpstemp,
			_grp,
			({ alive _x } count (units _grp)),
			({ !(_x getVariable ["ACE_isUnconscious", false]) } count (units _grp)),
			({ lifeState _x != "INCAPACITATED" } count (units _grp)),
			count (units _grp)
		];
	};
	_remaining = _remaining + _alive;
} forEach _grps;

	// DEBUG
	if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
		diag_log text format ["[F3] DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): %2_remaining = %1",_remaining,_grpstemp];
	};

	if (_remaining == 0 || ((_started - _remaining) / _started) >= (_pc / 100)) exitWith {};

	sleep 6;
};

// ====================================================================================

// END CASCAP
// Depending on input, either MPEnd or the parsed code itself is called

if (_end isEqualType 0) exitWith {
	format["End%1",_end] call BIS_fnc_endMissionServer;
};

if (_end isEqualType {}) exitWith {
	_end remoteExec["bis_fnc_spawn"];
};

diag_log text format ["[F3] WARNING (fn_CasualtiesCapCheck.sqf): Ending didn't fire, expecting code or scalar. _end = %1, typeName _end: %2",_end,typeName _end];