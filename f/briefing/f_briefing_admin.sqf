// F3 - Briefing
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
// ADD MISSION MAKER NOTES SECTIONS
// All text added to f_var_CustomNotes will only be visible to the current admin

f_var_isAdmin = true; // Allows the player to exit the spectator menu in fn_spectateInit.sqf

if (isNil "f_var_CustomNotes") then {
	f_var_CustomNotes = "";
};

player createDiarySubject ["ZeuAdmin","** Admin **"];

// ====================================================================================

// ADD ZEUS SUPPORT SECTION
_missionZeus = format["
<font size='18' color='#EA2E2E'>ZEUS SUPPORT</font><br/>
<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {
	[player,'basic'] remoteExec ['f_fnc_zeusInit',2];
};"">Assign ZEUS to %1</execute></font><br/>
Creates and assigns a Zeus Curator to your in-game unit. This step must be executed BEFORE any other options can be ran.<br/>
<br/>
",profileName];

_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player] remoteExec ['f_fnc_zeusTerm',2];
};"">Disable ZEUS</execute></font><br/>
Disables and removes the Zeus Curator from the player.<br/>
<br/>
<br/>";

_missionZeus = _missionZeus + "<font size='18' color='#EA2E2E'>Objects</font><br/>";

// Sides
_missionZeus = _missionZeus + "
Add all by Side <font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,west] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Side: West'
};"">West</execute></font> | 
<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,east] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Side: East'
};"">East</execute></font> | 
<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,resistance] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Side: Independent'
};"">Guer</execute></font> | 
<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,civilian] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Side: Civilian'
};"">Civ</execute></font> | 
<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,sideLogic] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Side: Logic'
};"">Logic</execute></font><br/>
<br/>";

// Everything
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,true] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Add All Objects.'
};"">Add Everything</execute></font> <font color='#FF0000'>(MAY CAUSE DESYNC)</font><br/>
Use with caution - ALL mission objects will be added to Zeus, including units, waypoints, triggers and modules.<br/>
<br/>";

// Nothing
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,false] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Removed All Objects.'
};"">Remove Everything</execute></font><br/>
Control over all mission objects is effectively reset and removed from Zeus. This includes players, units and props.<br/>
<br/>";

_missionZeus = _missionZeus + "<font size='16' color='#72E500'>AI Units</font><br/>";

// AI Leaders
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,'ai',true] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'AI Leaders Added'
};"">Leaders</execute></font> Add only infantry AI Leaders, vehicles are not included.<br/>";

// AI All
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,'ai'] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'All AI Added'
};"">All</execute></font> Add every AI unit present in the world to Zeus, includes vehicles.<br/>
<br/>";

_missionZeus = _missionZeus + "<font size='16' color='#72E500'>Players</font><br/>Adding any player to Zeus will allow the unit to PING you!<br/>";

// Players - Leaders
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,(playableUnits + switchableUnits),true] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Player Leaders Added'
};"">Leaders</execute></font> Add all player leads to Zeus.<br/>";

// Players - All
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,(playableUnits + switchableUnits)] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'All Players Added'
};"">All</execute></font> Add every player to Zeus.<br/>
<br/>";

_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player] remoteExec ['f_fnc_zeusRemovePlayers',2];
};"">Remove</execute></font> Remove all players from Zeus.<br/>
<br/>";


_missionZeus = _missionZeus + "<font size='16' color='#72E500'>Vehicles / Props</font><br/>";

// Vehicles
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign yourself as ZEUS first!'} else {
	[player,'vehicles'] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Vehicles'
};"">Vehicles Only</execute></font> Add all vehicles to Zeus.<br/>";

// Props
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,'empty'] remoteExec ['f_fnc_zeusAddObjects',2];
	hintSilent 'Added Objects / Props'
};"">Add Objects</execute></font> Add empty objects and props to Zeus.<br/>
<br/>
<br/>";

_missionZeus = _missionZeus + "<font size='18' color='#EA2E2E'>Addons</font><br/>Do not use if 3rd Party Addons are running (ACE3 etc).<br/><br/>";

// None
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,false] remoteExec ['f_fnc_zeusAddAddons',2];
	hintSilent 'Removed Addons'
};"">Remove All</execute></font><br/>Removes any addons present from the Zeus Interface.<br/>
<br/>";

// Basic
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,'basic'] remoteExec ['f_fnc_zeusAddAddons',2];
	hintSilent 'Basic Addons Enabled'
};"">Add Basic Addons</execute></font><br/>Assigns a basic set of module addons to Zeus. Ability to spawn units are not included.<br/>
<br/>";

// Everything
_missionZeus = _missionZeus + "<font color='#66B2FF'><execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintSilent 'Assign ZEUS first!'} else {
	[player,true] remoteExec ['f_fnc_zeusAddAddons',2];
	hintSilent 'All Addons Enabled'
};"">Add All Addons</execute></font><br/>Assigns all addons from cfgPatches. Allowing Zeus to access and place ALL units and modules.<br/>
<br/>
<br/>";

player createDiaryRecord ["ZeuAdmin", ["Zeus",_missionZeus]];

// ====================================================================================

// SAFE START SECTION
_missionSafe = "<br/><font size='18' color='#EA2E2E'>SAFE START CONTROL</font><br/><br/>
<font color='#66B2FF'><execute expression=""f_param_safe_start = f_param_safe_start + 1; publicVariable 'f_param_safe_start'; hintSilent format ['Mission Timer: %1',f_param_safe_start];"">Increase Timer by 1 minute</execute></font><br/>
<font color='#66B2FF'><execute expression=""f_param_safe_start = f_param_safe_start - 1; publicVariable 'f_param_safe_start'; hintSilent format ['Mission Timer: %1',f_param_safe_start];"">Decrease Timer by 1 minute</execute></font><br/>
Adjusts the Safe Start timer. If Safe Start is not running, it will need restarted using the command below.<br/>
<br/>
<font color='#66B2FF'><execute expression=""[[[],'f\safeStart\f_safeStart.sqf'],'BIS_fnc_execVM',true] call BIS_fnc_MP; hintSilent 'Safe Start Running!';"">Begin Safe Start timer</execute></font><br/>
Restarts the Safe Start timer for all players, if the timer has previously expired it will need additional time added to it using the Safe Start command above.<br/>
<br/>
<font color='#66B2FF'><execute expression=""f_param_safe_start = -1; publicVariable 'f_param_safe_start';
['SafeStartMissionStarting',['Safe Start Ended!']] remoteExec ['bis_fnc_showNotification',0];
[false] remoteExec ['f_fnc_safety',0,true]; hintSilent 'Safe Start ended!';"">
End Safe Start timer</execute></font><br/>
Immediately ends the Safe Start timer for all players.<br/>
<br/>
<br/>";

player createDiaryRecord ["ZeuAdmin", ["Safe Start",_missionSafe]];

// ====================================================================================

// DEBUG SECTION
_missionDebug = "<font size='18' color='#EA2E2E'>DEBUG OPTIONS</font><br/><br/>
<font color='#66B2FF'><execute expression=""(findDisplay 12) createDisplay 'RscDisplayDebugPublic';hintSilent 'Displaying Debug Window';"">Show Debug Window</execute></font><br/>
<br/>
<font color='#66B2FF'><execute expression=""[1,0,false] execVM 'f\mapClickTeleport\f_mapClickTeleportAction.sqf';hintSilent 'Use Scroll-wheel to Teleport';"">Map Click Teleport</execute></font><br/>
<br/>
<font color='#66B2FF'><execute expression=""f_param_debugMode = 0; publicVariable 'f_param_debugMode';hintSilent 'Logging: Off';"">Logging Off</execute></font> | 
<font color='#66B2FF'><execute expression=""f_param_debugMode = 1; publicVariable 'f_param_debugMode';hintSilent 'Logging: On';"">Logging On</execute></font><br/>
Toggles the internal F3 Debug feature, which logs actions within the framework into the report log.<br/>
<br/>
<font color='#66B2FF'><execute expression=""diag_log text '*** Active SQF Scripts Start ***';{diag_log _x} forEach diag_activeSQFScripts;diag_log text '*** Active SQF Scripts End ***';hintSilent 'Logging Scripts to local RPT';"">SQF Debug</execute></font><br/>
Uses diag_activeSQFScripts to list all running SQF Scripts to your LOCAL report.<br/>
<br/>
<font color='#66B2FF'><execute expression=""[[true],'f\misc\f_debug.sqf'] remoteExec ['BIS_fnc_execVM',2];hintSilent 'Starting Debug';"">Checking Script</execute></font><br/>
This performs a basic check for any mission related logic issues and problems. It is automatically called at the start of the mission in single player.<br/>
<br/>
<font color='#66B2FF'><execute expression=""[true] call f_fnc_spectateInit;"">Spectator Start</execute></font> - Initialises the BIS Spectator Script.<br/>
<font color='#66B2FF'><execute expression=""[false] call f_fnc_spectateInit;"">Spectator Stop</execute></font> - Terminates the BIS Spectator Script if it is running.<br/>
<br/>
";

player createDiaryRecord ["ZeuAdmin", ["Debug",_missionDebug]];

// ====================================================================================

// WEATHER CONTROL
f_var_trans = 300; // Transiton time in seconds
_missionWeather = "<font size='18' color='#EA2E2E'>TIME / WEATHER</font><br/>
<br/><font color='#EA2E2E'>TIME</font>
<br/>Instantly skip time forward a given number of hours/minutes:
<br/>
<font color='#66B2FF'><execute expression=""0.5 remoteExec ['skipTime', 2]; hintSilent 'Time: +30 Minutes';"">+30 Minutes</execute></font> | 
<font color='#66B2FF'><execute expression=""1 remoteExec ['skipTime', 2]; hintSilent 'Time: +1 hour';"">+1 Hour</execute></font> | 
<font color='#66B2FF'><execute expression=""6 remoteExec ['skipTime', 2]; hintSilent 'Time: +6 hours';"">+6 Hours</execute></font> | 
<font color='#66B2FF'><execute expression=""12 remoteExec ['skipTime', 2]; hintSilent 'Time: +12 hours';"">+12 Hours</execute></font> | 
<font color='#66B2FF'><execute expression=""24 remoteExec ['skipTime', 2]; hintSilent 'Time: +24 hours';"">+24 Hours</execute></font>
<br/>
<br/><font color='#EA2E2E'>DELAY</font>
<br/>The following applies to both WIND and CLOUD/RAIN settings. Use the below to adjust the delay to allow for gradual weather changes (e.g thick fog forms in 10 minutes):
<br/>
<font color='#66B2FF'><execute expression=""f_var_trans = 0; hintSilent format['Delay set to: %1',f_var_trans];"">Reset to Zero</execute></font> | 
<font color='#66B2FF'><execute expression=""f_var_trans = 300; hintSilent format['Delay set to: %1',f_var_trans];"">Reset to 5 Minutes</execute></font> | 
<font color='#66B2FF'><execute expression=""f_var_trans = f_var_trans + 60; hintSilent format['Delay increased to %1',f_var_trans];"">+60 Secs</execute></font> | 
<font color='#66B2FF'><execute expression=""if (f_var_trans <= 60) then { f_var_trans = 0; } else { f_var_trans = f_var_trans - 60; }; hintSilent format['Delay decreased to %1',f_var_trans];"">-60 Secs</execute></font>
<br/>
<br/><font color='#EA2E2E'>FOG</font>
<br/>Fog is applied across the server according to the DELAY chosen above (default: 5 minutes). A zero delay means the change will be instant.
<br/>
<br/>Any value greater than a delay of 0 will gradually adjust the conditions and appear more natural:<br/>
<font color='#66B2FF'><execute expression=""[-1, 0, [0,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Removing Fog', f_var_trans];"">Disable Fog (Instant)</execute></font>
<br/>
<br/>
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [-1, f_var_trans, [0,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Fog: None (%1 secs)', f_var_trans];"">None</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [-1, f_var_trans, [0.1,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Fog: Very Light (%1 secs)', f_var_trans];"">Very Light</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [-1, f_var_trans, [0.2,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Fog: Light (%1 secs)', f_var_trans];"">Light</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [-1, f_var_trans, [0.4,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Fog: Medium (%1 secs)', f_var_trans];"">Medium</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [-1, f_var_trans, [0.6,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Fog: Thick (%1 secs)', f_var_trans];"">Thick</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [-1, f_var_trans, [0.8,0,0]] remoteExec ['f_fnc_setFog',2]; hintSilent format['Fog: Very Thick (%1 secs)', f_var_trans];"">Very Thick</execute></font>
<br/>
<br/><font color='#66B2FF'><execute expression=""hintSilent format['Fog is: %1',fog];"">Check Fog Setting</execute></font>
<br/>
<br/><font color='#EA2E2E'>CLOUDS/RAIN</font>
<br/>Weather is applied across the server according to the DELAY chosen above (default: 5 minutes). If a delay is selected, the engine will take UP TO ONE HOUR to fully change conditions. 
<br/>
<br/>If the delay is set to zero, weather settings will INSTANTLY be applied:
<br/>
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [1, f_var_trans] remoteExec ['f_fnc_setWeather',2]; hintSilent format['Weather: Clear (%1 secs)', f_var_trans];"">Clear</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [2, f_var_trans] remoteExec ['f_fnc_setWeather',2]; hintSilent format['Weather: Light Cloud (%1 secs)', f_var_trans];"">Light</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [3, f_var_trans] remoteExec ['f_fnc_setWeather',2]; hintSilent format['Weather: Overcast (%1 secs)', f_var_trans];"">Overcast</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [4, f_var_trans] remoteExec ['f_fnc_setWeather',2]; hintSilent format['Weather: Light Rain (%1 secs)', f_var_trans];"">Rain</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [5, f_var_trans] remoteExec ['f_fnc_setWeather',2]; hintSilent format['Weather: Rainy (%1 secs)', f_var_trans];"">Heavy Rain</execute></font> | 
<font color='#66B2FF'><execute expression=""publicVariable 'f_var_trans'; [6, f_var_trans] remoteExec ['f_fnc_setWeather',2]; hintSilent format['Weather: Stormy (%1 secs)', f_var_trans];"">Storm</execute></font>
<br/>
<br/><font color='#66B2FF'><execute expression=""hintSilent format['Clouds are: %1',overcast];"">Check Cloud Setting</execute></font><br/>
<br/>
<font color='#EA2E2E'>WIND</font>
<br/>The wind settings below will override those determined by the Cloud/Rain settings. Altering any cloud settings will reset all wind values:
<br/>
<font color='#66B2FF'><execute expression=""[0] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: None';"">None</execute></font> | 
<font color='#66B2FF'><execute expression=""[2] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: Very Low';"">Very Low</execute></font> | 
<font color='#66B2FF'><execute expression=""[4] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: Low';"">Low</execute></font> | 
<font color='#66B2FF'><execute expression=""[6] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: Medium';"">Medium</execute></font> | 
<font color='#66B2FF'><execute expression=""[8] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: High';"">Strong</execute></font> | 
<font color='#66B2FF'><execute expression=""[10] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: Very High';"">Very Strong</execute></font> | 
<font color='#66B2FF'><execute expression=""[20] remoteExec ['f_fnc_setWind',2]; hintSilent 'Wind: Hurricane';"">Hurricane</execute></font>
<br/>
<br/><font color='#66B2FF'><execute expression=""hintSilent format['Wind Speed is: %1',wind];"">Check Wind Speed</execute></font>
<br/>
";

player createDiaryRecord ["ZeuAdmin", ["Time & Weather",_missionWeather]];

// ====================================================================================

// ENDINGS SECTION
// This block of code collects all valid endings and formats them properly

_title = [];
_ending = [];
_endings = [];

_i = 1;
while {true} do {
	_title = getText (missionConfigFile >> "CfgDebriefing" >> format ["end%1",_i] >> "title");
	_description = getText (missionConfigFile >> "CfgDebriefing" >> format ["end%1",_i] >> "description");
	if (_title == "") exitWith {};
	_ending = [_i,_title,_description];
	_endings append ([_ending]);
	_i = _i + 1;
};

// Create the briefing section to display the endings

_missionEndings = "<font size='18' color='#EA2E2E'>ENDINGS</font><br/><br/>These endings are available. To trigger an ending click on its link - It will take a few seconds to synchronise across all clients.<br/><br/>";

{
	_missionEndings = _missionEndings + format [
	"<font color='#66B2FF'><execute expression=""'End%1' remoteExec ['BIS_fnc_endMissionServer',2];"">Ending #%1</execute></font> - %2:<br/>%3<br/><br/>"
	,_x select 0,_x select 1,_x select 2];
} forEach _endings;

player createDiaryRecord ["ZeuAdmin", ["Endings",_missionEndings]];

// ====================================================================================

// MISSION-MAKER NOTES
// This section displays notes made by the mission-maker for the ADMIN

if (f_var_CustomNotes != "") then {
	_missionNotes = "<br/><font size='18' color='#EA2E2E'>MISSION-MAKER NOTES</font><br/>";
	_missionNotes = _missionNotes + f_var_CustomNotes + "<br/><br/>";
	
	player createDiaryRecord ["ZeuAdmin", ["Mission Notes",_missionNotes]];
};

// ====================================================================================

// ADMIN BRIEFING
// This is a generic section displayed only to the ADMIN
_adminIntro ="<br/><font size='18' color='#EA2E2E'>ADMIN SECTION</font><br/><br/>This briefing section can only be seen by server administrators.<br/><br/>";

player createDiaryRecord ["ZeuAdmin", ["Admin Menu",_adminIntro]];