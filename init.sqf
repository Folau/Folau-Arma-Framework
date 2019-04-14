// Full Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// *** Do NOT edit this file! If you need to add something, add it in "mission\scripts.sqf" - It'll still run here! ***
waitUntil { isServer || !isNull player };
// ====================================================================================
// MISSION SPECIFIC SCRIPTS AND VARIABLES
#include "mission\scripts.sqf";
// ====================================================================================
// SHARED SCRIPTS - Both client and server
execVM "f\safeStart\f_safeStart.sqf"; 	// F3 - Safe Start
execVM "f\cache\f_cInit.sqf";			// F3 - Unit Caching
// ====================================================================================
// SERVER ONLY SCRIPTS!
if isServer then {
	execVM "f\setGroupID\f_setGroupIDs.sqf";			// F3 - Group IDs
	execVM "f\misc\f_stayInVehicle.sqf"; 				// Zeus - Stubborn Crew
	
	// Clear DCd player bodies at start
	[] spawn {
		sleep 0.1;
		{if (_x isKindOf "Man" && (_x getVariable["f_var_assignGear",""] != "")) then {deleteVehicle _x}} forEach allDead;
	};
	
	// Folau Stuff
	
	if (f_param_aiVersion == 1) then {
	
		// Params
		_folAISides = [east];
		_keyPoints = ["keypos1"];

		// Call Init
		null = [
			_folAISides, 
			_keyPoints
		] execVM "folau\folAI\folAIinit.sqf";
	};
	
	if (f_param_lawsOfWar == 1) then {					
		null = [10] execVM "folau\utils\lawsOfWar.sqf";		// Set up Laws of War
	};	

	null = execVM "folau\utils\kiaCasCounter.sqf";			// Set up the KIA Counter
	// execVM "folau\components\hellcat_rearm.sqf";
	
/* 	if (f_param_timelimit != 0) then {
		null = execVM "folau\utils\timeLimit.sqf";			// If a time limit is required (end5)
	};
	
	// Setting up time limit
	if (_timeLimitType in [1,2]) then {
		null = [_timeLimitType, _timeLimitValue] execVM "folau\utils\timeLimit.sqf";
	}; */
		
	// Performance Counter / Debug
	[] spawn {
		sleep 1;
		execVM "f\misc\f_debug.sqf";
		waitUntil {
			sleep 30;
			diag_log text format ["[F3] PERFORMANCE --- Elapsed time: %1 --- Server FPS: %2 --- Server Min FPS: %3",[(round time)] call BIS_fnc_secondsToString,round (diag_fps),round (diag_fpsmin)];
			!isNil "f_var_stopLogging";
		};
	};
	missionNamespace setVariable ["f_var_missionLoaded", true, true];
};
// ====================================================================================
// CLIENT ONLY SCRIPTS - Typically controlled via MISSION PARAMETERS.
if hasInterface then { 
	execVM "f\briefing\f_drawAO.sqf";					// Draws border around AO.
	execVM "f\common\f_clientIntro.sqf";				// Zeus - Client Intro
	execVM "f\setTeamColours\f_setTeamColours.sqf";		// F3 - Team Colors
	execVM "f\groupMarkers\f_setLocGroupMkr.sqf";		// F3 - Group Markers
	execVM "f\thirdPerson\f_thirdPerson.sqf";			// Zeus - Third Person
	execVM "f\misc\f_vas.sqf";							// Zeus - VAS Crate
	execVM "f\JIP\f_teleportOption.sqf";				// Zeus - JIP Teleport Flag/Action
	
	f_sqf_brief = execVM "f\briefing\briefing.sqf";		// F3 - Briefing
	f_sqf_orbat = execVM "f\briefing\f_showOrbat.sqf";	// F3 - ORBAT (f_sqf_brief required)
	f_sqf_gearSel = execVM "f\briefing\f_showLoadoutSelect.sqf";	// Zeus - Gear Selection (f_sqf_orbat required)
};

// Any other things that need executing
sleep 1;
