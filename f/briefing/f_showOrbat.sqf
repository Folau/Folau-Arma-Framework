// F3 - ORBAT Notes
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!hasInterface || isNil "f_sqf_brief") exitWith {};
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

waitUntil{!isNil "f_var_setGroupsIDs";};
if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text "[F3] DEBUG (f_showOrbatNotes.sqf): Running."; };

private _orbatText = "<br/><font size='18' color='#FF7F00'>ORDER OF BATTLE</font><br/><br/>The ORBAT below is <b>ONLY</b> accurate at mission start.<br/><br/>";
private _groups = [];
private _hiddenGroups = missionNamespace getVariable["f_var_hiddenGroups",[]]; // Add hidden groups if param is set.

{
	// Add to ORBAT if side matches, group isn't already listed, group has players and isn't in the hidden groups.
	if ((side _x == side group player) && !(_x in _groups) && ({_x in playableUnits + switchableUnits} count units _x) > 0 && !(_x in _hiddenGroups)) then {
		_groups pushBack _x;
	};
} forEach allGroups;

// Loop through the group, print out group ID, leader name and medics.
// If group is players group, expand to incude all units and their weapons.
{
	private _groupName = groupId _x;
	private _color = "#397200";
	
	// Highlight the player's group with a different color (based on the player's side)	
	if (_x == group player) then { _color = "#72E500"; };
	
	_orbatText = _orbatText + format ["<font color='%3'>%1</font> - %2",_groupName, name leader _x,_color] + "<br />";
	
	{
		if (_x getVariable ["f_var_assignGear",""] == "m" && {_x != leader group _x}) then {
			_orbatText = _orbatText + format["<i><font color='%3'>%1 Medic</font></i> - %2",_groupName,name _x,_color] + "<br />";
		};
	} forEach units _x;
} forEach _groups;

// Show all members of the group and their weapons.
_orbatText = _orbatText + format["<br /><font size='18' color='#FF7F00'>%1 GROUP</font><br />",toUpper(groupId group player)];
_orbatText = _orbatText + "Assume leadership of your squad by clicking the below when in-mission:<br/>";
_orbatText = _orbatText + "<font color='#66B2FF'><execute expression=""
	if (leader group player != player and time > 0 and alive player) then {
		[group player, player] remoteExec ['selectLeader',group player];
		format['%1 has taken lead of %2',name player,groupId (group player)] remoteExec ['systemChat',group player];
	};
	"">";
_orbatText = _orbatText + format["Take Leadership of %1</execute></font><br/>",groupId (group player)];
{		
	private _color = "#999999";
	if (_x == player) then { _color = "#72E500"; };
		_orbatText = _orbatText + format["<br/><img image='%4' height='16'/> <font color='%3'>%1</font> (%2)",
			name _x,
			([getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"),"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_- "] call BIS_fnc_filterString),
			_color,
			(getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "icon") call bis_fnc_textureVehicleIcon)
		];

	// All weapons minus the field glasses				
	{
		if (_x != "") then {
			_orbatText = _orbatText + format[" <font color='#666666'>+ %1</font>",getText (configFile >> "CfgWeapons" >> _x >> "displayName")];
		};
	} forEach [primaryWeapon _x,secondaryWeapon _x];

} forEach units group player;


// Show vehicle crew and cargo.
_veharray = [];
{

	if ({vehicle _x != _x} count units _x > 0 ) then {
		{
			if (vehicle _x != _x && {!(vehicle _x in _veharray)}) then {
			_veharray pushBack (vehicle _x);
			};
		} forEach units _x;
	};

} forEach _groups;

if (count _veharray > 0) then {
	_orbatText = _orbatText + "<br/><br/><font size='18' color='#FF7F00'>VEHICLE CREWS + PASSENGERS</font><br/>";

	{
		 // Filter all characters which might break the diary entry (such as the & in Orca Black & White)
		private _vehName = [getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname"),"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_- "] call BIS_fnc_filterString;
		private _vehIcon = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "icon");
		_orbatText = _orbatText + "<br />" + format["<img image='%1' width='16' height='16'/> <font color='#72E500'>%2</font> ",_vehIcon,_vehName];

		// Workaround for http://feedback.arma3.com/view.php?id=21602
		private _maxSlots = getNumber(configFile >> "CfgVehicles" >> typeOf _x >> "transportSoldier") + (count allTurrets [_x, true] - count allTurrets _x);
		private _freeSlots = _x emptyPositions "cargo";

		if (_maxSlots > 0) then {
			_orbatText = _orbatText + format ["<font color='#777777'>(%1/%2)</font>",(_maxSlots-_freeSlots),_maxSlots];
		};

		_orbatText = _orbatText  + "<br/>";

		{
			if ((assignedVehicleRole _x select 0) != "CARGO") then {

				private _veh = vehicle _x;
				private _crewrole = switch (true) do {
					case (driver _veh == _x && !((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" <font color='#777777'>Driver:</font>"};
					case (driver _veh == _x && ((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" <font color='#777777'>Pilot:</font>"};
					case (commander _veh == _x):{" <font color='#777777'>Commander:</font>"};
					case (gunner _veh == _x):{" <font color='#777777'>Gunner:</font>"};
					case (assignedVehicleRole _x select 0 == "Turret" && commander _veh != _x && gunner _veh != _x && driver _veh != _x):{" <font color='#777777'>Co-Pilot:</font>"};
					default {" <font color='#777777'>Crew:</font>"};
				};
				_orbatText = _orbatText + format["%1 %2<br/>",_crewrole,name _x];
			};
		} forEach crew _x;

		private _groupList = [];

		{
			if (!(group _x in _groupList) && {(assignedVehicleRole _x select 0) == "CARGO"} count (units group _x) > 0) then {
				_groupList pushBack (group _x);
			};
		} forEach crew _x;

		if (count _groupList > 0) then {
			{
				_orbatText =_orbatText + format["<font color='#777777'>In Cargo:</font> %1",groupId _x] + "<br/>";
			} forEach _groupList;
		};

	} forEach _veharray;
};

if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text "[F3] DEBUG (f_showOrbatNotes.sqf): Loaded."; };

// Insert final result into subsection ORBAT of section Notes
waitUntil {scriptDone f_sqf_brief};
_orb = player createDiaryRecord ["diary", ["ORBAT", _orbatText]];