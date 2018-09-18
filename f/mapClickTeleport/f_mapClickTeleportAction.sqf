// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
// Only run this for players
if (!hasInterface) exitWith {};

f_fnc_mapClickTeleportGroup = compileFinal preprocessFileLineNumbers "f\mapClickTeleport\fn_mapClickTeleportGroup.sqf";
f_fnc_mapClickTeleportUnit = compileFinal preprocessFileLineNumbers "f\mapClickTeleport\fn_mapClickTeleportUnit.sqf";
f_fnc_mapClickHaloEffect = compileFinal preprocessFileLineNumbers "f\mapClickTeleport\fn_mapClickHaloEffect.sqf";

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player};
};

params [["_uses",1,[1]],["_timeLimit",0,[0]],["_groupTP",true,[true]],["_unitList",[],[[]]],["_dropHeight",0,[0]]];

// How often the TP action can be used. 0 = infinite usage.
if (isNil "f_var_mapClickTeleport_Uses") then {f_var_mapClickTeleport_Uses = _uses};

// If higher than 0 the action will be removed after the given time.
if (isNil "f_var_mapClickTeleport_TimeLimit") then {f_var_mapClickTeleport_TimeLimit = _timeLimit};	

// False: everyone can TP. True: Only group leaders can TP and will move their entire group.
if (isNil "f_var_mapClickTeleport_GroupTeleport") then {f_var_mapClickTeleport_GroupTeleport = _groupTP};

// Restrict map click TP to these units
if (isNil "f_var_mapClickTeleport_Units") then {f_var_mapClickTeleport_Units = _unitList};

// If > 0 map click TP will act as a HALO drop and automatically assign parachutes to units
if (isNil "f_var_mapClickTeleport_Height") then {f_var_mapClickTeleport_Height = _dropHeight};

// Allow all group leaders or those of senior rank access to Teleport.
if (f_var_mapClickTeleport_GroupTeleport && player != leader group player && rank player in ["PRIVATE","CORPORAL"]) exitWith {};
		
// Make sure that no non-existing units have been parsed
{
	if (isNil _x) then {
		f_var_mapClickTeleport_Units set [_forEachIndex,objNull];
	} else {
		f_var_mapClickTeleport_Units set [_forEachIndex,call compile format ["%1",_x]];
	};
} forEach f_var_mapClickTeleport_Units;

// Reduce the array to valid units only
f_var_mapClickTeleport_Units = f_var_mapClickTeleport_Units - [objNull];

// CHECK IF COMPONENT SHOULD BE ENABLED
// We end the script if it is not running on a server or if only group leaders can use
// the action and the player is not the leader of his/her group
if (count f_var_mapClickTeleport_Units > 0 && !(player in f_var_mapClickTeleport_Units)) exitWith {};

_string = if (f_var_mapClickTeleport_Height == 0) then {"Fast Travel"} else {"HALO Drop"};

// Add briefing for SLs
private _tel = player createDiaryRecord ["diary", [_string, format["
	<br/><font size='18' color='#FF7F00'>%2</font>
	<br/>You may use the <font color='#72E500'>%1</font color> option to initiate the %2%3%4%5%6",
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then { "ACE Team Management" } else { "Action Menu" },
	_string,
	if (f_var_mapClickTeleport_Uses > 1) then { format[", this option may be used <font color='#72d4bb'>%1</font color> times.", f_var_mapClickTeleport_Uses] } else { ", once used this action will be removed." },
	if (f_var_mapClickTeleport_TimeLimit > 0) then { format["<br/><br/>This option will EXPIRE after <font color='#72d4bb'>%1</font color> seconds.", f_var_mapClickTeleport_TimeLimit] } else { "" },
	if (f_var_mapClickTeleport_GroupTeleport) then { "<br/><br/>Using this command will also move your entire team, so ensure they are ready!" } else { "<br/><br/>Using this command will move only your unit, it will not affect other players." },
	if (f_var_mapClickTeleport_Height > 0) then { format["<br/><br/>You will be dropping from a height of around <font color='#72d4bb'>%1m</font color>.", f_var_mapClickTeleport_Height] } else { "<br/><br/>If you are inside a vehicle, that vehicle will also be transported." }
]]];

if (f_var_mapClickTeleport_GroupTeleport) then {
	_string = _string + " (Whole Squad)";
};

f_var_mapClickTeleport_textAction = format["<t color='#FF2266'>%1</t>",_string];

// ADD TELEPORT ACTION TO PLAYER ACTION MENU
// Whilst the player is alive we add the teleport action to the player's action menu.
// If the player dies we wait until he is alive again and re-add the action.

if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
		[_string] spawn { sleep 8; player groupChat format["Use ACE Team Management to begin %1.",_this select 0]; };
		ace_par_action = ['PAR',format["%1",_string],'\a3\Ui_f\data\Map\VehicleIcons\iconparachute_ca.paa',{[] spawn f_fnc_mapClickTeleportUnit},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","ACE_TeamManagement"], ace_par_action] call ace_interact_menu_fnc_addActionToObject;
		if (f_var_mapClickTeleport_TimeLimit > 0) then {
			sleep f_var_mapClickTeleport_TimeLimit;
			[player, 1, ["ACE_SelfActions","ACE_TeamManagement","PAR"]] call ace_interact_menu_fnc_removeActionFromObject;
		};
} else {
	[_string] spawn { sleep 8; player groupChat format["Use Action Menu to begin %1.",_this select 0]; };
	f_mapClickTeleportAction = player addAction [f_var_mapClickTeleport_textAction,{[] spawn f_fnc_mapClickTeleportUnit},"", 0, false,true,"","_this == player"];	
	if (f_var_mapClickTeleport_TimeLimit > 0) then {
		sleep f_var_mapClickTeleport_TimeLimit;
		player removeAction f_mapClickTeleportAction;
	};
};