// F3 - Briefing
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// FACTION: EAST
// <font color='#0080FF'><marker name='respawn_east'>XXX</marker></font color>
// Green #72E500
// Orange #FF7F00
// Blue #0080FF

if (isNil "f_param_CasualtiesCap") then { f_param_CasualtiesCap = 100 };

// Credits tab

// The code below creates the execution sub-section of notes.
_cre = player createDiaryRecord ["diary", ["Author / Credits",format["
<br/>Mission Author: <font color='#72E500'>Folau</font color>. 
<br/>
<br/>This mission uses <font color='#72E500'>2600K</font color>'s framework.
<br/>
<br/>A custom-made mission for ArmA 3 and Zeus Community
<br/>http://zeus-community.net/
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the administration sub-section of notes.
_adm = player createDiaryRecord ["diary", ["Administration",["
<br/><font size='18' color='#FF7F00'>ADMINISTRATION</font>
<br/>The following text has been auto-generated from the mission modules and parameters.
<br/>
"] call f_fnc_fillAdministration]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Mechanical Notes",format["
<br/>This section highlights any areas where mission mechanics may not be obvious and require out-of-character explanation.
<br/>
<br/><font size='18' color='#FF7F00'>Mission Element</font>
<br/>Descriptive Text
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Intel",format["
<br/><font size='18' color='#FF7F00'>Location</font>
<br/>Detail any specific intel about the area that will be used.
<br/>
<br/><font size='18' color='#FF7F00'>Enemy Capability</font>
<br/>Detail the enemy capability and vague idea of tactics. 
<br/>
<br/><font size='18' color='#FF7F00'>Enemy Intent</font>
<br/>An idea of what command believe the enemy will try and do. May not be correct!
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/><font size='18' color='#FF7F00'>COMMANDERS INTENT</font>
<br/>The mission fed down by command - could just be ""As directed by platoon commander"" 
<br/>
<br/><font size='18' color='#FF7F00'>MOVEMENT PLAN</font>
<br/>How to deploy/move (Halo, Marine landing, helo etc) - could just be ""As directed by platoon commander"" 
<br/>
<br/><font size='18' color='#FF7F00'>FIRE SUPPORT</font>
<br/>Any off-map fire support like mortars, artillery, or CAS - could just be ""As directed by platoon commander"" or ""nothing noted""
<br/>
<br/><font size='18' color='#FF7F00'>SPECIAL TASKS</font>
<br/>Detail and optional objectives - most likely ""nothing noted"".
<br/>
",f_param_CasualtiesCap]]];

_mis = player createDiaryRecord ["diary", ["Mission",format["
<br/><font size='18' color='#FF7F00'>MISSION</font>
<br/>Your mission is to...
<br/>
<br/>Ensure casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap]]];

// Below - version for timed missions
/* _mis = player createDiaryRecord ["diary", ["Mission",format["
<br/><font size='18' color='#FF7F00'>MISSION</font>
<br/>Your mission is to...
<br/>
<br/>You have %2 minutes to complete this mission.
<br/>
<br/>Ensure casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap, f_param_timelimit/60]]]; */

_test = player createDiaryRecord ["diary", ["Situation",format["
<br/><font size='18' color='#FF7F00'>OVERVIEW</font>
<br/>Put any plot justifying the mision here. Don't waffle too much.
<br/>
<br/><font size='18' color='#FF7F00'>FRIENDLY FORCES</font>
<br/>Detail friendly forces in the following format:
<br/>
<br/>> N x Unit (Stength) | Transport
<br/>
<br/><font size='18' color='#FF7F00'>ENEMY FORCES</font>
<br/>Brief overview of the enemy forces.
<br/>
<br/>For a more detailed breakdown see the ""Intel"" tab.
<br/>
",f_param_CasualtiesCap]]];
