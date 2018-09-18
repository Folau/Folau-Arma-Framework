// Iterates task modules and highlights any potential problems.
// Basically, stuff I usually forget when copying mission info!
private ["_arr","_module","_moduleID","_unitsWest","_unitsEast","_unitsResi","_unitsCiv"];
params[["_limitDebug",true]];
		
// Count units on various sides.
_unitsWest = {side _x == west && alive _x && !isPlayer _x} count allUnits;
_unitsEast = {side _x == east && alive _x && !isPlayer _x} count allUnits;
_unitsResi = {side _x == resistance && alive _x && !isPlayer _x} count allUnits;
_unitsCiv = {side _x == civilian && alive _x && !isPlayer _x} count allUnits;

diag_log text format ["Players: %1, AI: BLU/%2, OPF/%3, RES/%4, CIV/%5",count (playableUnits + switchableUnits),_unitsWest,_unitsEast,_unitsResi,_unitsCiv];

// Don't run in full unless it's been called from the Administrator Menu.
if (isMultiplayer && _limitDebug) exitWith {};

_arr = [];

{	// Module Check
	//diag_log text format["[F3] INFO (fn_moduleCheck.sqf): Checking Module %1 - %2",_x,typeOf _x];
	if (["module", format ["%1",typeOf _x]] call BIS_fnc_inString) then {
		_module = _x;
		_moduleID = "";
		
		if ("id" in allVariables _module) then {
			_moduleID = _module getVariable "id";
			
			if (_moduleID in _arr) then {
				_mkr = createMarkerLocal[format["%1_dupMarker",_module],getPos _module];
				_mkr setMarkerShapeLocal "ICON";
				_mkr setMarkerColorLocal "ColorRed";
				_mkr setMarkerSizeLocal [0.8,0.8];
				_mkr setMarkerTypeLocal "mil_dot";
				["f_debug.sqf",format["<font color='#0080FF'><marker name='%3'>%1</marker></font color> in %2 has already been defined in another module! IDs cannot be the same.<br/>",_moduleID,typeOf _module,_mkr]] call f_fnc_logIssue;
				diag_log text format["[F3] WARNING (f_debug.sqf): ID %1 in %2 has already been defined in another module!",_moduleID,typeOf _module];
			} else { _arr pushBack _moduleID; }; // Add to checking array.
		};
		
		if ("owner" in allVariables _module) then {
				switch (_module getVariable "owner") do {
					case 4: {
						if ({side _x == west} count (playableUnits + switchableUnits) == 0) then {
							_mkr = createMarkerLocal[format["%1_marker",_module],getPos _module];
							_mkr setMarkerShapeLocal "ICON";
							_mkr setMarkerColorLocal "ColorOrange";
							_mkr setMarkerSizeLocal [0.8,0.8];
							_mkr setMarkerTypeLocal "mil_dot";
							["f_debug.sqf",format["<font color='#0080FF'><marker name='%2'>Task %1</marker></font color> has owner assigned as BLUFOR but no playable units.",_moduleID,_mkr]] call f_fnc_logIssue;
							diag_log text format["[F3] WARNING (f_debug.sqf): Task ID %1 has owner assigned as BLUFOR but no playable units!",_moduleID];
						};
					};
					case 5: {
						if ({side _x == east} count (playableUnits + switchableUnits) == 0) then {
							_mkr = createMarkerLocal[format["%1_marker",_module],getPos _module];
							_mkr setMarkerShapeLocal "ICON";
							_mkr setMarkerColorLocal "ColorOrange";
							_mkr setMarkerSizeLocal [0.8,0.8];
							_mkr setMarkerTypeLocal "mil_dot";
							["f_debug.sqf",format["<font color='#0080FF'><marker name='%2'>Task %1</marker></font color> has owner assigned as OPFOR but no playable units.",_moduleID,_mkr]] call f_fnc_logIssue;
							diag_log text format["[F3] WARNING (f_debug.sqf): Task ID %1 has owner assigned as OPFOR but no playable units!",_moduleID];
						};
					};
					case 6: {
						if ({side _x == resistance} count (playableUnits + switchableUnits) == 0) then {
							_mkr = createMarkerLocal[format["%1_marker",_module],getPos _module];
							_mkr setMarkerShapeLocal "ICON";
							_mkr setMarkerColorLocal "ColorOrange";
							_mkr setMarkerSizeLocal [0.8,0.8];
							_mkr setMarkerTypeLocal "mil_dot";
							["f_debug.sqf",format["<font color='#0080FF'><marker name='%2'>Task %1</marker></font color> has owner assigned as INDFOR but no playable units.",_moduleID,_mkr]] call f_fnc_logIssue;
							diag_log text format["[F3] WARNING (f_debug.sqf): Task ID %1 has owner assigned as INDFOR but no playable units!",_moduleID];
						};
					};
				};
		};
	};
} forEach allMissionObjects "Module_F";

{	// Trigger Check
	//diag_log text format["[F3] INFO (fn_moduleCheck.sqf): Checking Trigger %1 - %2",_x,typeOf _x];
	if (triggerStatements _x find "this" >= 0) then {
		private ["_mkr"];
		switch (toUpper((triggerActivation _x) select 0)) do {
			case "WEST": {
				if ({side _x == west} count allUnits == 0) then {
					_mkr = createMarkerLocal[format["%1_marker",_x],getPos _x];
					_mkr setMarkerShapeLocal "ICON";
					_mkr setMarkerColorLocal "ColorBlue";
					_mkr setMarkerSizeLocal [0.8,0.8];
					_mkr setMarkerTypeLocal "mil_dot";
					["f_debug.sqf",format["<font color='#0080FF'><marker name='%1'>Trigger</marker></font color> has activation type as BLUFOR but no units present.",_mkr]] call f_fnc_logIssue;
					diag_log text format["[F3] WARNING (f_debug.sqf): Trigger ID %1:%2 has activation type as BLUFOR but no playable units!",_x,vehicleVarName _x];
				};
			};
			case "EAST": {
				if ({side _x == east} count allUnits == 0) then {
					_mkr = createMarkerLocal[format["%1_marker",_x],getPos _x];
					_mkr setMarkerShapeLocal "ICON";
					_mkr setMarkerColorLocal "ColorBlue";
					_mkr setMarkerSizeLocal [0.8,0.8];
					_mkr setMarkerTypeLocal "mil_dot";
					["f_debug.sqf",format["<font color='#0080FF'><marker name='%1'>Trigger</marker></font color> has activation type as OPFOR but no units present.",_mkr]] call f_fnc_logIssue;
					diag_log text format["[F3] WARNING (f_debug.sqf): Trigger ID %1:%2 has activation type as OPFOR but no playable units!",_x,vehicleVarName _x];
				};
			};
			case "GUER": {
				if ({side _x == resistance} count allUnits == 0) then {
					_mkr = createMarkerLocal[format["%1_marker",_x],getPos _x];
					_mkr setMarkerShapeLocal "ICON";
					_mkr setMarkerColorLocal "ColorBlue";
					_mkr setMarkerSizeLocal [0.8,0.8];
					_mkr setMarkerTypeLocal "mil_dot";
					["f_debug.sqf",format["<font color='#0080FF'><marker name='%1'>Trigger</marker></font color> has activation type as INDFOR but no units present.",_mkr]] call f_fnc_logIssue;
					diag_log text format["[F3] WARNING (f_debug.sqf): Trigger ID %1:%2 has activation type as INDFOR but no playable units!",_x,vehicleVarName _x];
				};
			};
		};
	};

	/*diag_log text str [
		_x,
		triggerText _x,
		triggerType _x,
		triggerArea _x,
		triggerActivation _x,
		triggerStatements _x,
		triggerTimeout _x,
		triggerActivated _x,
		list _x,
		triggerAttachedVehicle _x
	];*/
} forEach allMissionObjects "EmptyDetector";
		
if !hasInterface exitWith {};
player globalChat format ["Players: %1, AI: BLU/%2, OPF/%3, RES/%4, CIV/%5",count (playableUnits + switchableUnits),_unitsWest,_unitsEast,_unitsResi,_unitsCiv];

//Radio triggers to assist with debugging
/*z_day = createTrigger["EmptyDetector",[0,0,0]];
z_day setTriggerArea[0,0,0,false];
z_day setTriggerActivation["BRAVO","PRESENT",true];
z_day setTriggerStatements["this", "skipTime (12 - daytime + 24 ) % 24;", ""];
z_day setTriggerText "Time: Noon";

z_night = createTrigger["EmptyDetector",[0,0,0]];
z_night setTriggerArea[0,0,0,false];
z_night setTriggerActivation["CHARLIE","PRESENT",true];
z_night setTriggerStatements["this", "skipTime (1 - daytime + 24 ) % 24;", ""];
z_night setTriggerText "Time: Night";*/

// MISSION ISSUES	
if (count (missionNamespace getVariable["f_var_missionIssues",[]]) > 0) then {
	private _issuesList = "";
	{_issuesList = _issuesList + _x} forEach (missionNamespace getVariable "f_var_missionIssues");
	player createDiaryRecord ["diary", ["*** ISSUES ***",_issuesList]];
	player globalChat "WARNING - Issues detected, check 'Issues' under briefing.";
};