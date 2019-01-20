/*
	Title: 			folAIinit.sqf
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	01/01/2019
	
	Description:	Main init function for all FolAI functions
	
	Use:			null = [this] execVM "folau\FolAI\folAIinit.sqf"
*/

params ["_aiSide", "_keyPoints"];

// systemChat format["Initialising FolAI Behaviour for Side %1", _aiSide];

_selection = allGroups select {side _x isEqualTo _aiSide}; //returns all east groups

{
	// systemChat format["Group Found %1: Size %2, Vehicle %3", _x, count units _x, vehicle leader _x];
	
	_unitSize = count units _x;
	_isOnFoot = isNull objectParent leader _x;
	
	// Unit is by itself, so either has a special role is a sentry.
	if (_unitSize == 1) then {
		_manType = typeOf leader _x;
		
		_sniperBool = (["sniper", _manType] call BIS_fnc_inString || ["ghille", _manType] call BIS_fnc_inString);
		_spotterBool = ["spotter", _manType] call BIS_fnc_inString;
		_officerBool = ["officer", _manType] call BIS_fnc_inString;
		_statBool = ["unarmed", _manType] call BIS_fnc_inString;
		
		// Sniper - stay still and be good
		if (_sniperBool) then {
			null = [_x, random [500, 750, 1000]] execVM "folau\folAI\behaviour\infantry\sniper.sqf"
		};
		
		// Not a special case, regular infantry
		if (!(_sniperBool || _spotterBool || _officerBool || _statBool)) then {
			null = [_x] execVM "folau\folAI\behaviour\infantry\sentry.sqf";
		};
	} else
	{
	
		if (_isOnFoot) then {
			null = [_x, _keyPoints] execVM "folau\folAI\behaviour\infantry\infantry.sqf";
		}
		else
		{	
			_vehicle = typeOf vehicle leader _x;
			_leaderRole = assignedVehicleRole leader _x;		
			// systemChat format["VEHICLE DETECTED CLASS %1 ROLE %2", _vehicle, _leaderRole];
			
			if (_leaderRole select 0 isEqualTo "cargo") then {
				// systemChat "UNIT IN CARGO";
				null = [_x, _keyPoints] execVM "folau\folAI\behaviour\infantry\infantry.sqf";
			}
			else{
			
				// Trucks and unarmed MRAPs
				if ((["Truck", _vehicle] call BIS_fnc_inString || 
					["MRAP", _vehicle] call BIS_fnc_inString || 
					["LSV", _vehicle] call BIS_fnc_inString || 
					["offroad", _vehicle] call BIS_fnc_inString) && 
					!(["armed", _vehicle] call BIS_fnc_inString || 
					["at", _vehicle] call BIS_fnc_inString || 
					["hmg", _vehicle] call BIS_fnc_inString || 
					["gmg", _vehicle] call BIS_fnc_inString)) then {
					null = [_x, _keyPoints] execVM "folau\folAI\behaviour\vehicles\transport.sqf";
				};
				
				// Armed MRAPs / Technicals
				if ((["MRAP", _vehicle] call BIS_fnc_inString || 
					["LSV", _vehicle] call BIS_fnc_inString || 
					["offroad", _vehicle] call BIS_fnc_inString) && 
					(["armed", _vehicle] call BIS_fnc_inString || 
					["at", _vehicle] call BIS_fnc_inString || 
					["hmg", _vehicle] call BIS_fnc_inString || 
					["gmg", _vehicle] call BIS_fnc_inString)) then {
					null = [_x, _keyPoints] execVM "folau\folAI\behaviour\vehicles\mrap.sqf";
				};	
				
				// APC
				if (["APC", _vehicle] call BIS_fnc_inString) then {
					null = [_x, _keyPoints] execVM "folau\folAI\behaviour\vehicles\apc.sqf";
				};
				
				// MBT
				if (["MBT", _vehicle] call BIS_fnc_inString) then {
					null = [_x, _keyPoints] execVM "folau\folAI\behaviour\vehicles\mbt.sqf";
				};	
				
			};
		};
	};
	
} forEach (_selection);