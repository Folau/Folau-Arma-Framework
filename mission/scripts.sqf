// ====================================================================================
// MISSION VARAIBLES
f_var_AuthorUID = '76561198007179126';

player addRating 100000;
player setSpeaker "NoVoice";
showSubtitles false;  
CBA_display_ingame_warnings = false;
"Group" setDynamicSimulationDistance 800;

//f_var_fogOverride = [[0,0,0],[0.1,0.005,100],[0.1,0.04,100],[0.1,random 0.02,100]]; // Override default fog settings [[none],[Light],[heavy],[rand]].
 // Allows GUID to access Admin/Zeus features in MP.
//[] spawn {sleep 1; tao_foldmap_isOpen = true;}; // Disable TAO Folding Map
//[] spawn {sleep 5; ZEU_tkLog_mpKilledEH = {};}; // Disable Zeus TK Spam
// ====================================================================================
// OPTIONALS
execVM "f\earplug\f_earplugs.sqf";				// Zeus - Earplugs
execVM "f\nametag\f_nametags.sqf";				// F3 - Nametags
execVM "f\FTMemberMarkers\f_initFTMarkers.sqf";	// F3 - FT Markers
// ====================================================================================
// F3 - Casualty Cap - Sides: west | east | resistance - Format: [SIDE,ENDING,<PERCENT>]
[west,2] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
//[east,2] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
//[resistance,2] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
//[west,{f_var_casualtyLimitHit = true;}] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf"; // Alternative use with trigger.
// ====================================================================================
// F3 - Map Click Teleport
// [1,600,true,[],3000] execVM "f\mapClickTeleport\f_mapClickTeleportAction.sqf";	// Set for HALO (3000m Height)
// [] execVM "f\mapClickTeleport\f_mapClickTeleportAction.sqf"; 					// Use Defaults (Land Teleport, Leaders Only)
// ====================================================================================
// [RESISTANCE,"acc_flashlight"] execVM "scripts\flashLight.sqf";			// AI Flashlights
// call compile preprocessFileLineNumbers "scripts\UPS\Init_UPSMON.sqf"; 	// UPSMON FULL
// DAC_Basic_Value = 0; execVM "scripts\DAC\DAC_Config_Creator.sqf";		// DAC
// [] execVM "scripts\civPopulation.sqf";									// Civ Spawner
// ====================================================================================
// Post-process effects
/* if (hasInterface) then {
	_hdl = ppEffectCreate ["colorCorrections", 1501];
	_hdl ppEffectEnable true;			
		// Pick One:
		//_hdl ppEffectAdjust [1, 0.4, 0, [0.8,0.9,1,-0.1], [1,1,1,1.66], [-0.5,0,-1,5]]; // Arma2 Tones
		//_hdl ppEffectAdjust [.6, 1.0, 0.0, [0.84, 0.67, 0.44, 0.22], [0.81, 0.76, 0.64, 0.43], [0.81, 0.77, 0.62, 0.31]]; // light beige/dessert
		//_hdl ppEffectAdjust [1,1,0,[0.1,0.2,0.3,-0.3],[1,1,1,0.5],[0.5,0.2,0,1]]; // Real Is Brown 2
		//_hdl ppEffectAdjust [1, 1.1, 0.0, [0.0, 0.0, 0.0, 0.0], [1.0,0.7, 0.6, 0.60], [0.200, 0.600, 0.100, 0.0]]; // Nightstalkers
		//_hdl ppEffectAdjust [1.0, 1.0, 0.0,[1.0, 1.0, 1.0, 0.0],[1.0, 1.0, 0.9, 0.35],[0.3,0.3,0.3,-0.1]]; // Gray Tone
		//_hdl ppEffectAdjust [1.0, 1.0, 0.0,[0.2, 0.2, 1.0, 0.0],[0.4, 0.75, 1.0, 0.60],[0.5,0.3,1.0,-0.1]]; // Cold Tone
		//_hdl ppEffectAdjust [0.9, 1, 0, [0.1, 0.1, 0.1, -0.1], [1, 1, 0.8, 0.528],  [1, 0.2, 0, 0]]; // Takistan
	_hdl ppEffectCommit 0;
}; */
// ====================================================================================
// Move JIP players to spawn flag (TvT).
[] spawn {
	sleep 0.1;
	if (!hasInterface || time < (f_param_safe_start * 60)) exitWith {};
	waitUntil {sleep 0.1; !isNull player};
	_dest = "";
	
	// Get the destination.
	switch (playerSide) do { 
		case west: 			{ _dest = "respawn_west"; }; 
		case east:			{ _dest = "respawn_east"; }; 
		case independent: 	{ _dest = "respawn_guerrila"; }; 
		case civilian: 		{ _dest = "respawn_civilian"; }; 
	};

	if (getMarkerColor _dest != "") then {
		// Move the person 5 meters away from the destination, random direction
		player setPos [(getMarkerPos _dest select 0)-5*sin(random 360),(getMarkerPos _dest select 1)-5*cos(random 360)];
	};
};
// Vehicle View Distances
[] spawn {
	sleep 1;
	switch (player getVariable ["f_var_assignGear","r"]) do {
		case "hp"; case "hc"; case "p": { setViewDistance 5000; systemChat "View Distance Increased (Air) - Check Settings" };
		case "vc"; case "vd"; case "vg"; case "uav": { setViewDistance 3000; systemChat "View Distance Increased (Vehicle) - Check Settings" };
	};
};

// ====================================================================================
/* 
FOLAU'S SECTION

Any scripts that need to be executed during startup i.e. LoW, AI Commander, etc.
 */

// Setup Params

missionNamespace setVariable ["playerSideFolau", west];
missionNameSpace setVariable ["MyCivKillCounter", 0, true];
missionNamespace setVariable ["kiaChance", f_param_kiaChance];

// Executing Util Scripts
null = execVM "folau\utils\kiaCasCounter.sqf";			// Set up the KIA Counter

if (f_param_lawsOfWar == 1) then {					
	null = [20] execVM "folau\utils\lawsOfWar.sqf";		// Set up Laws of War NOTE Zeus server double-counts civilian kills
};

if (f_param_looting == 0) then {					
	null = execVM "folau\utils\noLoot.sqf";				// Prevent looting of enemies
};

if (f_param_shiftClick == 0) then {					
	onMapSingleClick {_shift};							// Disable map shift-click
};

null = execVM "folau\FolAI\setAISkill.sqf";				// Set AI Skill

if (f_param_timelimit != 0) then {
	null = execVM "folau\utils\timeLimit.sqf";			// If a time limit is required (end5)
};

// Disable Artillery Computer
if (f_param_artilleryComputer == 1) then {				// Disable/Enable Artillery Computer
	enableEngineArtillery true;
}
else
{
	enableEngineArtillery false;
};
	