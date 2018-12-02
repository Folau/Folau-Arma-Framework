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
<br/>Testing & More: <font color='#72E500'>Lawman</font color>, <font color='#72E500'>SeaCaptainJim</font color>.
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
_exe = player createDiaryRecord ["diary", ["Intel",format["
<br/><font size='18' color='#ea2e2e'>ENEMY CAPABILITY</font>
<br/>Detail what friendly intel believe to be the enemy capability.
<br/>
<br/><font size='18' color='#ea2e2e'>ENEMY INTENT</font>
<br/>What the likely enemy reaction will be - what are they going to do?
<br/>
<br/><font size='18' color='#ea2e2e'>LOCATION</font>
<br/>Any particular notes about the AO (terrain, exclusions, etc).
<br/>
<br/><font size='18' color='#ea2e2e'>WEATHER</font>
<br/>If weather is locked describe it (and the forecast) here.
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/><font size='18' color='#ea2e2e'>COMMANDERS INTENT</font>
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
",f_param_CasualtiesCap]]];

_mis1 = format["
<br/><font size='18' color='#ea2e2e'>MISSION</font>
<br/>Your mission is to X.
<br/>
<br/>Ensure KIA total is kept below %2.
<br/>
<br/>Ensure simultaneous casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap, f_param_kialimit];

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

_test = player createDiaryRecord ["diary", ["Situation",format["
<br/><font size='18' color='#ea2e2e'>OVERVIEW</font>
<br/>Stick to three paragraphs - what has happened, what is going to happen, and a snappy summary.
<br/>
<br/><font size='18' color='#ea2e2e'>FRIENDLY FORCES</font>
<br/>Strength of friendly forces in the following format.
<br/>
<br/>> Platoon Command + Hunter + Quad Bike
<br/>> 3 x Rifle Squads (8) + HEMTT
<br/>> 1 x Medic Squad (4) + Hunter, attached Medical UAV
<br/>> 1 x Engineer Squad (4) + Hunter
<br/>> 1 x Mortar (1) + Quad Bike
<br/>
<br/>List the armament for any vehicles to aid mission planning.
<br/>
<br/><font size='18' color='#ea2e2e'>ENEMY FORCES</font>
<br/>Very brief description of enemy forces.
<br/>
<br/>For a more detailed breakdown see the ""Intel"" tab.
<br/>
<br/><font size='18' color='#ea2e2e'>CIVILIAN PRESENCE</font>
<br/>Where civilians are (or if there are none).
<br/>
<br/>See ""Reference Material"" for a reminder on the Laws of War. 
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_misSpace = player createDiaryRecord ["diary", ["-- Mission Details --","
<br/>"]];
