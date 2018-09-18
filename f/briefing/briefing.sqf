// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if !hasInterface exitWith {};
if (!isDedicated && (isNull player)) then {waitUntil {sleep 0.1; !isNull player};};

// Wait until server has set parameters.
waitUntil{ (!isNil "f_var_setParams" && !isNil "f_var_medical_level") };

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitSide","_incAdmin","_uidList"];

f_fnc_fillAdministration = compileFinal preprocessFileLineNumbers "f\briefing\fn_fillAdministration.sqf";

if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text format ["[F3] DEBUG (briefing.sqf): Running for: %1",player]; };

// ====================================================================================

// DETECT PLAYER SIDE
// The following code detects what side the player's slot belongs to, and stores
// it in the private variable _unitSide

_unitSide = side player;
_incAdmin = false;
_uidList = ["76561197970695190"]; // 2600K

// DEBUG
if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text format ["[F3] DEBUG (briefing.sqf): %1 side: %2",player,_unitSide]; };

// ====================================================================================

// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

// Get Author ID if present
if (!isNil "f_var_AuthorUID") then {
	_uidList pushBack f_var_AuthorUID;
};

// Get Server Admin List if present (f_zeusAdminNames from f\common\fn_processParamsArray.sqf)
if (!isNil "f_zeusAdminNames") then {
	if (f_zeusAdminNames isEqualType []) then {
		_uidList append f_zeusAdminNames;
	};
};

// Check if player is authorised admin (or 2600K) ;)
if ((getPlayerUID player) in _uidList) then { _incAdmin = true;};

if (serverCommandAvailable "#kick" || !isMultiplayer || _incAdmin) then {
	#include "f_briefing_admin.sqf";
	if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { diag_log text "[F3] DEBUG (briefing.sqf): Briefing for admin included."; };	// DEBUG
};

// ====================================================================================

player createDiaryRecord ["diary", ["",""]];

// ====================================================================================

// BRIEFING: PLAYER SIDE
// The following block of code executes only if the player is in a side it
// automatically includes a file which contains the appropriate briefing data.

#include "..\..\mission\briefing\f_briefing.sqf";

/* switch (_unitSide) do {	
	case west : {
		#include "..\..\mission\briefing\f_briefing_west.sqf";
	};
	case east : {
		#include "..\..\mission\briefing\f_briefing_east.sqf";
	};
	case resistance : {
		#include "..\..\mission\briefing\f_briefing_geur.sqf";
	};
	case civilian : {
		#include "..\..\mission\briefing\f_briefing_civ.sqf";
	};
	case sideLogic : {
		#include "..\..\mission\briefing\f_briefing_zeus.sqf";
	};
	default { diag_log text format ["[F3] DEBUG (briefing.sqf): Side %1 is not defined.",_unitSide];	};
}; */

player createDiaryRecord ["diary", ["",""]];