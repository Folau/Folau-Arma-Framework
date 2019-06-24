// F3 - Briefing
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// FACTION: EAST
// <font color='#0080FF'><marker name='respawn_east'>XXX</marker></font color>
// Green #72E500
// Orange #ea2e2e
// Blue #0080FF

if (isNil "f_param_CasualtiesCap") then { f_param_CasualtiesCap = 100 };

// Credits tab

// The code below creates the execution sub-section of notes.
_cre = player createDiaryRecord ["diary", ["Mission Credits",format["
<br/>Mission Author: <font color='#72E500'>Folau</font color>. 
<br/>
<br/>Framework Creator: <font color='#72E500'>2600K</font color>.
<br/>Mortar Guide and Range Table: <font color='#72E500'>Wombat</font color>.
<br/>
<br/>Testing and More: <font color='#72E500'>Lawman</font color>, <font color='#72E500'>SeaCaptainJim</font color>.
<br/>
<br/>A custom-made mission for ArmA 3 and Zeus Community
<br/>http://zeus-community.net/
<br/>
",f_param_CasualtiesCap]]];

// <br/>Framework Edits: <font color='#72E500'>Folau</font color> IF USED BY SOMEONE ELSE PLEASE :)

/* // The code below creates the administration sub-section of notes.
_adm = player createDiaryRecord ["diary", ["Administration",["
<br/><font size='18' color='#ea2e2e'>ADMINISTRATION</font>
<br/>The following text has been auto-generated from the mission modules and parameters.
<br/>
"] call f_fnc_fillAdministration]]; */

// Add the mechanical notes section
#include "mechNotes.sqf"

// Add the Reference section
#include "briefingReference.sqf"

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["",format["",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Enemy Forces",format["
<br/><font size='18' color='#ea2e2e'>ENEMY FORCES</font>
<br/>Detail what friendly intel believe to be the enemy capability.
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Friendly Forces",format["
<br/><font size='18' color='#ea2e2e'>FRIENDLY FORCES</font>
<br/>The following forces are available for this mission:
<br/>
<br/><font color='#72E500'>COMMAND</font>
<br/>- Platoon Commander
<br/>- Platoon Sergeant
<br/>- Platoon Medic
<br/>- Engineer / Logistics
<br/>- Strider MRAP
<br/>
<br/><font color='#72E500'>ALPHA / BRAVO / CHARLIE</font>
<br/>- Mechanised Rifle Section [2 x Grenadier, 1 x PCML, 2 x Autoriflemen]
<br/>- FV510 Mora
<br/>
<br/><font color='#72E500'>DELTA</font>
<br/>- MAT Team [2 x MAAWS Mk4 Mod 0]
<br/>- Strider MRAP
<br/>
<br/><font color='#72E500'>ECHO</font>
<br/>- MMG Team [2 x SPMG]
<br/>- Strider MRAP
<br/>
<br/><font color='#72E500'>FOXTROT</font>
<br/>- SAM Team [2 x Titan MPRL]
<br/>- Strider MRAP
<br/>
<br/><font color='#72E500'>GOOSE</font>
<br/>- WY-55 Hellcat
<br/>
<br/>(More detailed loadout information can be found on the ORBAT tab)
<br/>
<br/><font size='18' color='#ea2e2e'>SUPPORT / LOGISTICS</font>
<br/>The following Support / Logistics elements are available:
<br/>
<br/><font color='#72E500'>Zamak Ammo</font> - Vehicle + Infantry Ammo Resupply
<br/><font color='#72E500'>Zamak Fuel</font> - Vehicle Refueling
<br/><font color='#72E500'>Zamak Medical</font> - Infantry Respawn Point
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/><font size='18' color='#ea2e2e'>EXECUTION</font>
<br/>The platoon is to deploy to the AO and carry out the mission as directed by the Platoon Commander. OR detail steps if needed.
<br/>
<br/><font size='18' color='#ea2e2e'>MOVEMENT PLAN</font>
<br/>Give details about transport available.
<br/>
<br/><font size='18' color='#ea2e2e'>FIRE SUPPORT</font>
<br/>(As directed by the Forward Observer/Flight Air Controller)
<br/>
<br/>See ""Reference Material"" for Fire Support SOPs and other resources.
<br/>
<br/><font size='18' color='#ea2e2e'>SPECIAL TASKS</font>
<br/>Any secondary objectives.
<br/>
<br/><font color='#72E500'>Signals:</font>
<br/>
",f_param_CasualtiesCap]]];


/* <br/><font size='18' color='#ea2e2e'>MISSION</font> */
_mis1 = format["
<br/>Your mission is to X.
<br/>
<br/>Ensure Casualty/KIA totals are kept below %3/%2.
<br/>
<br/>Ensure simultaneous casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap, f_param_kialimit, f_param_caslimit];

// Below - addition for timed missions
_mis2 = format["
<br/>You have %1 minutes to complete this mission.
<br/>", f_param_timelimit/60];

if (f_param_timelimit == 0) then 
{
	misText = _mis1;
}
else
{
	misText = _mis1 + _mis2;
};

_mis = player createDiaryRecord ["diary", ["Mission", misText]];

// <br/><font size='18' color='#ea2e2e'>SITUATION</font>

_test = player createDiaryRecord ["diary", ["Situation",format["
<br/>Stick to three paragraphs - what has happened, what is going to happen, and a snappy summary.
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_misSpace = player createDiaryRecord ["diary", ["-- Mission Briefing --","
<br/>"]];
