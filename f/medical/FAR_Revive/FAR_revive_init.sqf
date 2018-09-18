// Farooq's Revive 2.0 (2600K Edit)

// Parameters - Feel free to edit these
if (isNil "f_param_bleedout") then {
	f_param_bleedout = 600;
	diag_log text "[F3] WARNING (FAR_revive_init.sqf): f_param_bleedout was not defined! Defaulting to 600";
};


FAR_BleedOut = f_param_bleedout;	// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
FAR_EnableDeathMessages = true;		// Enable teamkill notifications
FAR_ReviveMode = 2;					// 0 = Only medics can revive	1 = All units can revive 	2 = Same as 1 but a medikit is required to revive

call compileFinal preprocessFileLineNumbers "f\medical\FAR_revive\FAR_revive_funcs.sqf";

if isDedicated exitWith {};

// Player Initialization
[] spawn {
    waitUntil { !isNull player };

	[] spawn FAR_Player_Init;

	// Event Handlers
	player addEventHandler [
		"Respawn", { 
			player setVariable ["FAR_isDragged", false, true];
			[] spawn FAR_Player_Init;
		}
	];
};

FAR_Player_Init = {
	// Clear event handler before adding it
	player removeAllEventHandlers "HandleDamage";
	player addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
	player setVariable ["FAR_isDragged", false, true];

	FAR_isDragging = false;
	[player] spawn FAR_Player_Actions;
};

// [Debugging] Add revive to playable AI units
if (isMultiplayer) exitWith {};

{
	if (!isPlayer _x) then {
		_x addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
		_x addEventHandler ["TeamSwitch", FAR_Player_Actions];
		_x setVariable ["FAR_isDragged", false, true];
	};
} forEach switchableUnits;