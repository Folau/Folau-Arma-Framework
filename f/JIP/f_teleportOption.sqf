// 	Zeus - Join-In-Progress Teleport Option
//  Description: Allows players to quickly teleport to their team.
//  Parameters
//		1. Boolean - Create a local spawn flag for the player with JIP Action.
//		2. Boolean - Add a JIP action for the player.
//	Returns:
//		Nothing.
// 	Example:
// 		[true, false] execVM "f\JIP\f_teleportOption.sqf";
//
// ====================================================================================
// Give player time to get in-game.
sleep 5;

// Exit if player is dead, non-player or not enabled.
if (!alive player || !hasInterface || playerSide == sideLogic || missionNamespace getVariable ["f_param_jipTeleport",0] == 0) exitWith {};

// Set defaults.
_spawnAction = false;
_spawnFlag = false;

// Override defaults.
switch (f_param_jipTeleport) do {
    case 1: { _spawnAction = true; };
	case 2: { _spawnFlag = true; };
    case 3: { _spawnFlag = true; _spawnAction = true; };
};

// If both flag and action has been disabled, exit.
if (!_spawnFlag && !_spawnAction) exitWith {};

// Set up move player function
if (isNil "f_fnc_teleportPlayer") then { f_fnc_teleportPlayer = compileFinal preprocessFileLineNumbers "f\JIP\fn_teleportPlayer.sqf"; };

// ====================================================================================

// Create JIP Flag
if _spawnFlag then {
	private ["_flagType","_flagMarker"];

	_flagType = "Flag_AltisColonial_F";
	_flagMarker = "respawn_civilian";

	switch (side (group player)) do {
		case west		: { _flagType = "Flag_Blue_F"; 	_flagMarker = "respawn_west"; };
		case east		: { _flagType = "Flag_Red_F"; 	_flagMarker = "respawn_east"; };
		case resistance	: { _flagType = "Flag_Green_F"; _flagMarker = "respawn_guerrila"; };
	};

	if (_flagMarker in allMapMarkers) then {
		if (isNil "f_obj_BaseFlag") then {
			f_obj_BaseFlag = _flagType createVehicleLocal [getMarkerPos _flagMarker select 0, (getMarkerPos _flagMarker select 1) - 5, 0];
			sleep 0.5;
			
			// Don't spawn on seabed.
			if (underwater f_obj_BaseFlag) then {
				f_obj_BaseFlag setPosASL [position f_obj_BaseFlag select 0,position f_obj_BaseFlag select 1,0];
				_flagStone = "Land_W_sharpStone_02" createVehicleLocal [0,0,0];
				_flagStone setPosASL [getMarkerPos _flagMarker select 0, (getMarkerPos _flagMarker select 1) - 5,-1];
			};
		};
			
		f_obj_BaseFlag addAction ["<t color='#FF7F00'>Spawn on Team</t>",f_fnc_teleportPlayer];
	} else {
		["f_teleportOption.sqf",format["No respawn marker found for %1.",side (group player)]] call f_fnc_logIssue;
	};
};

// ====================================================================================

// Create Action
if _spawnAction then {
	// Re-add the action for respawn.
	if (missionNamespace getVariable ["f_param_respawn",0] > 0 && isNil "f_var_respawnEH") then {
		f_var_respawnEH = true;
		player addEventHandler ["Respawn",{execVM "f\JIP\f_teleportOption.sqf";}];
	};
	
	// Don't run if mission has just started.
	if (time < 10) exitWith {};

	private ["_teleAction","_preText","_postText","_timer"];
	
	_timer = 900;
	_preText = "<br/><t size='1.4' color='#72E500'>Spawn On Team</t><br/><br/>This mission has JIP Teleport enabled.<br/><br/>";
	_postText = format["This option will automatically be removed after %1 minutes, if not used.<br/><br/>",round(_timer / 60)];

	// If client has ACE, use ACE Interact Menu
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
		hintSilent parseText (_preText + "To use this feature open your <t color='#FF7F00'>ACE Self-Interaction</t> menu <t color='#777777'>(Windows Key + Left Ctrl)</t> then go to <t color='#FF7F00'>Team Management</t><br/> and select <t color='#FF7F00'>Spawn on Team</t><br/><br/><br/>" + _postText);
		systemChat "Spawn On Team is ENABLED - Use: ACE Self-Interact > Team Management";
		ace_jip_action = ['JIP','Spawn on Team','\a3\Ui_f\data\Map\Diary\Icons\unitgroupplayable_ca.paa',f_fnc_teleportPlayer,{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","ACE_TeamManagement"], ace_jip_action] call ace_interact_menu_fnc_addActionToObject;
		sleep _timer;
		[player, 1, ["ACE_SelfActions","ACE_TeamManagement","JIP"]] call ace_interact_menu_fnc_removeActionFromObject;
	} else {
		// Vanilla Action Menu
		hintSilent parseText (_preText + "Use <t color='#FF7F00'>Action Menu</t> <t color='#777777'>(Mouse Wheel)</t> to spawn near your teams current location.<br/><br/><br/>" + _postText);
		systemChat "Spawn On Team is ENABLED - Check Action Menu";
		_teleAction = player addAction ["<t color='#FF7F00'>Spawn on Team</t>",f_fnc_teleportPlayer];
		sleep _timer;
		player removeAction _teleAction;
	};
};