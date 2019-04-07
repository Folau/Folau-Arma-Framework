// Either use (_faction in ["blu_f"]) or (side == "west") etc...
// Note - Always lower case!
// ---------------------------------- WEST FORCES -------------------------------------

if (_side == "west") then {
	#include "f_loadout_folau_fia.sqf"
	};

// ---------------------------------- EAST FORCES -------------------------------------
if (_side == "east") then {
	#include "f_loadout_folau_csat_car95.sqf"
	};
// ---------------------------------- INDP FORCES -------------------------------------

if(_side == "guer") then {
	#include "f_loadout_folau_aaf.sqf"
};