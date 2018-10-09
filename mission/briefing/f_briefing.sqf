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
<br/>Mortar Range Table: <font color='#72E500'>Wombat</font color>.
<br/>
<br/>Testers: <font color='#72E500'>Lawman</font color>, <font color='#72E500'>Lynx</font color>, <font color='#72E500'>Milki30</font color>, <font color='#72E500'>SeaCaptainJim</font color>.
<br/>
<br/>A custom-made mission for ArmA 3 and Zeus Community
<br/>http://zeus-community.net/
<br/>
",f_param_CasualtiesCap]]];

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
<br/>(More detailed breakdown of the enemy units that may be encountered)
<br/>
<br/><font size='18' color='#ea2e2e'>ENEMY INTENT</font>
<br/>(What are the enemy doing, what are they likely to do)
<br/>
<br/><font size='18' color='#ea2e2e'>LOCATION</font>
<br/>(Any specific location information, minefields etc)
<br/>
<br/><font size='18' color='#ea2e2e'>WEATHER</font>
<br/>(Describe the weather)
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/><font size='18' color='#ea2e2e'>COMMANDERS INTENT</font>
<br/>The platoon is to deploy to the AO and carry out the mission as directed by the Platoon Commander.
<br/>
<br/><font size='18' color='#ea2e2e'>MOVEMENT PLAN</font>
<br/>All units are motorised, to be deployed as directed by the Platoon Commander. 
<br/>
<br/><font size='18' color='#ea2e2e'>FIRE SUPPORT</font>
<br/>As directed by the Forward Observer.
<br/>
<br/>See ""Reference Material"" for Fire Support SOPs and other resources.
<br/>
<br/><font size='18' color='#ea2e2e'>SPECIAL TASKS</font>
<br/>Nothing noted.
<br/>
",f_param_CasualtiesCap]]];

_mis1 = format["
<br/><font size='18' color='#ea2e2e'>MISSION</font>
<br/>(1 Line Mission Description)
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
<br/>(Few lines about what the situation leading up to the mission is. DON'T WAFFLE)
<br/>
<br/><font size='18' color='#ea2e2e'>FRIENDLY FORCES</font>
<br/>NATO's strength for this mission is as follows:
<br/>
<br/>> N x Unit (Strength) | Transport
<br/>
<br/><font size='18' color='#ea2e2e'>ENEMY FORCES</font>
<br/>(Note enemy forces, very short)
<br/>
<br/>For a more detailed breakdown see the ""Intel"" tab.
<br/>
<br/><font size='18' color='#ea2e2e'>CIVILIAN PRESENCE</font>
<br/>(Note civilian presence)
<br/>
<br/>See ""Reference Material"" for a reminder on the Laws of War. 
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_misSpace = player createDiaryRecord ["diary", ["-- Mission Details --","
<br/>"]];
