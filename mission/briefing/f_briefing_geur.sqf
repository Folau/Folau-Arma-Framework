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
_exe = player createDiaryRecord ["diary", ["",format["",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Mechanical Notes",format["
<br/>This section highlights any areas where mission mechanics may not be obvious and require out-of-character explanation.
<br/>
<br/>Nothing Noted
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Laws of War",format["
<br/>All personnel are to abide by the rules of combat for this mission. HQ is to remind all units of their responsibilities:
<br/>
<br/><font size='18' color='#FF7F00'>I) Harm of Civilians</font>
<br/>In the conduct of military operations, constant care must be taken to spare the civilian population, civilians, and civilian objects. All feasible precautions must be taken to avoid, and in any event to minimize, incidental loss of civilian life, injury to civilians, and damage to civilian objects. 
<br/>
<br/><font size='18' color='#FF7F00'>II) Damage to Property</font>
<br/>Loss of life and damage to property incidental to attacks must not be excessive in relation to the concrete and direct military advantage expected to be gained. 
<br/>
<br/><font size='18' color='#FF7F00'>III) Non-Active Combatants</font>
<br/>International Humanitarian Law also restricts and regulates the conduct of war, protecting those that are not participating in hostilities. This includes defenseless combatants - individuals who are either in the power of an adverse part, injured, sick, shipwrecked, unconscious, or expressing a clear intention to surrender.
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Intel",format["
<br/><font size='18' color='#FF7F00'>Enemy Capability</font>
<br/>As noted, the enemy are comprised of light infantry, technicals, and a small number of IFV. There are reinforcements of a similar available outside the AO which may react to AAF operations. 
<br/>
<br/><font size='18' color='#FF7F00'>Enemy Intent</font>
<br/>The enemy will attempt to hold their ground at all costs, and may bring in reinforcements to achieve this.
<br/>
<br/><font size='18' color='#FF7F00'>Location</font>
<br/>Orino sits on the South East side of a large range of hills, however the approach from Agios Dionysios is relatively flat.
<br/>
<br/><font size='18' color='#FF7F00'>Weather</font>
<br/>It is early morning, after first light, and is overcast with a fog in low-lying areas. This is expected to clear later in the day. 
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["",format["",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/><font size='18' color='#FF7F00'>COMMANDERS INTENT</font>
<br/>As directed by the Platoon Commander.
<br/>
<br/><font size='18' color='#FF7F00'>MOVEMENT PLAN</font>
<br/>As directed by the Platoon Commander.
<br/>
<br/><font size='18' color='#FF7F00'>FIRE SUPPORT</font>
<br/>N/A
<br/>
<br/><font size='18' color='#FF7F00'>SPECIAL TASKS</font>
<br/>N/A
<br/>
",f_param_CasualtiesCap]]];


_mis = player createDiaryRecord ["diary", ["Mission",format["
<br/><font size='18' color='#FF7F00'>MISSION</font>
<br/>Your mission is to capture the village of Orino from FIA forces.
<br/>
<br/>Ensure casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap]]];

/* <br/>You have %2 minutes to complete this mission.
<br/> */

_test = player createDiaryRecord ["diary", ["Situation",format["
<br/><font size='18' color='#FF7F00'>OVERVIEW</font>
<br/>The FIA have recently occupied the village of Orino and are using it as a base to raid the main road to its south. 1 Platoon have been deployed to retake it, and have formed up just outside Agios Dionysios.
<br/>
<br/><font size='18' color='#FF7F00'>FRIENDLY FORCES</font>
<br/>Friendly forces are as follows:
<br/>
<br/>> Platoon Command
<br/>> 3 x 8 Man Infantry Sections
<br/>> 1 x Mortar Team
<br/>
<br/>A NATO adviser is present to provide support to platoon command where needed. 
<br/>
<br/><font size='18' color='#FF7F00'>ENEMY FORCES</font>
<br/>FIA forces are comprised of light infantry, technicals, statics, and a small number of IFV. These will be concentrated around the town with smaller patrols further away. 
<br/>
<br/><font size='18' color='#FF7F00'>CIVILIAN PRESENCE</font>
<br/>There are civilians in the AO, and significant casualties (5) as a result of AAF actions will lead to a failed mission.
<br/>
",f_param_CasualtiesCap]]];
