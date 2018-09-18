// F3 - Folk Group Markers
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
if (!hasInterface || playerSide == sideLogic) exitWith {};

waitUntil{!isNil "f_var_setGroupsIDs"};

if (missionNamespace getVariable["f_param_groupMarkers",0] == 0) exitWith {}; // If 0 do nothing.

f_fnc_localGroupMarker = compileFinal preprocessFileLineNumbers "f\groupMarkers\fn_localGroupMarker.sqf";

// If Commander-Only markers are selected, exit here
if ((rank player) in ["PRIVATE", "CORPORAL", "SERGEANT"] && f_param_groupMarkers in [4,5]) exitWith {};

// DECLARE VARIABLES AND FUNCTIONS
private ["_unitSide"];

// INCLUDE GROUP LIST
private ["_grpBLU", "_grpOPF", "_grpIND"];
_grpBLU = []; _grpOPF = []; _grpIND = [];
#include "..\..\mission\groups.sqf";

// DETECT PLAYER SIDE
// The following code detects what side the player's slot belongs to.
_unitSide = side player;

// If the unit side is different from the group leader's side, the latter side is used
if (_unitSide != side (leader group player)) then {_unitSide = side (leader group player)};

switch (_unitSide) do {
	// MARKERS: WEST
	case west: {
		if (count _grpBLU > 0) then {
			{
				_x spawn f_fnc_localGroupMarker;
			} forEach _grpBLU;
		};
	};
	// MARKERS: EAST
	case east: {
		if (count _grpOPF > 0) then {
			{
				_x spawn f_fnc_localGroupMarker;
			} forEach _grpOPF;
		};
	};
	// MARKERS: INDEPEDENT
	case independent: {
		if (count _grpIND > 0) then {
			{
				_x spawn f_fnc_localGroupMarker;
			} forEach _grpIND;
		};
	};
};

// Set icons to show in-game also if chosen
if (f_param_groupMarkers == 2) then { 
	setGroupIconsVisible [TRUE,TRUE]; 
} else {
	setGroupIconsVisible [TRUE,FALSE];
};

// Extended Group Info - Stop here if not enabled.
if (f_param_groupMarkers in [1,2,4]) exitWith {};

setGroupIconsSelectable true;

f_var_showGroup = true;

// Wait until in mission
sleep 0.5;

// Used to display fire-team colours.
f_fnc_getIconColor = {
	if (_this select 0 == "RED") exitWith {"#FF4646"};
	if (_this select 0 == "GREEN") exitWith {"#46FF46"};
	if (_this select 0 == "BLUE") exitWith {"#4646FF"};
	if (_this select 0 == "YELLOW") exitWith {"#FFFF46"};
	"#FFFFFF"
};

// Provides the player with a summary of the groups status and make-up.
onGroupIconOverEnter {
	if (f_var_showGroup &&  !(_this select 0)) then {
		f_var_showGroup = false;
		private ["_group","_text","_iconParams"];
		
		_group = _this select 1;
		
		_iconParams = getGroupIconParams _group;	
		
		f_var_groupText = _iconParams select 1;
		
		_group setGroupIconParams [_iconParams select 0,groupId _group,_iconParams select 2,TRUE]; 
		
		_text = format["<br/><t size='1.25' font='TahomaB' color='#72E500'>%1 Group</t><br/>",groupId _group];
		_text = _text + "<t align='left'>";
		{
			if (alive _x) then {
				_unitIco = (getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "icon") call bis_fnc_textureVehicleIcon);
				if ((_x getVariable["ACE_isUnconscious",false])
				|| {(lifeState _x) == "INCAPACITATED"}
				) then {
					_text = _text + format["<br/><t color='#550000'><img image='%2'/></t> <t color='#990000'>%1</t> <t color='#770000'>(%3)</t>",
						name _x,
						_unitIco,
						getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName")
						];
				} else {
					_text = _text + format["<br/><t color='%3'><img image='%2'/></t> %1 <t color='#888888'>(%4)</t>",
						name _x,
						_unitIco,
						[assignedTeam _x] call f_fnc_getIconColor,
						getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName")
						];
				};
				
				if (leader _group == _x) then {
					_text = _text + " (<t color='#72E500'>Lead</t>)";
				};
			};
		} forEach units _group;
		
		_text = _text + "</t><br/><br/>";
		
		hintSilent parseText _text;
	};
};

onGroupIconOverLeave {
	if (f_var_showGroup || (_this select 0)) exitWith {};
	private ["_group","_iconParams"];
	
	f_var_showGroup = true;
	_group = _this select 1;
	
	_iconParams = getGroupIconParams _group;
	
	//_groupText = if (count (groupId _group) >= 5 || groupId _group == "Echo") then [{toString [toArray (groupId _group) select 0]},{groupId _group}];
	
	_group setGroupIconParams [_iconParams select 0,f_var_groupText,_iconParams select 2,TRUE]; 
	hintSilent "";
};