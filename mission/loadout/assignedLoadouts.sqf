// Either use (_faction in ["blu_f"]) or (side == "west") etc...
// Note - Always lower case!
// ---------------------------------- WEST FORCES -------------------------------------

if (_side == "west") then {
	#include "f_loadout_folau_us_mtp.sqf"
	};

// ---------------------------------- EAST FORCES -------------------------------------
if (_side == "east") then {
	#include "f_loadout_folau_csat_iran.sqf"
	};
// ---------------------------------- INDP FORCES -------------------------------------

if(_side == "guer") then {
	#include "f_loadout_folau_aaf.sqf"
};

// Bravo UID List
_uidList = ["_SP_PLAYER_", "76561198007179126"]; //76561198007179126

if ((getPlayerUID player) in _uidList) then {
	#include "preference.sqf"
};