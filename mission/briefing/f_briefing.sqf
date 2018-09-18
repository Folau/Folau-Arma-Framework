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
<br/>Framework Creator: <font color='#72E500'>2600K</font color>.
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
<br/><font size='18' color='#FF7F00'>Medical System</font>
<br/>The medical system for this mission uses the following rules:
<br/>
<br/>Instant Kill: <font color='#72E500'>On</font> / <font color='#72E500'>High Damage Only</font>
<br/>
<br/>Stablise: <font color='#72E500'>FAK</font>
<br/>
<br/>Revive: <font color='#72E500'>Medkit used by Medic</font> OR <font color='#72E500'>FAK on a Stablised Unit</font>
<br/>
<br/>Respawn: <font color='#72E500'>10 Minute Wave Respawn</font> / <font color='#72E500'>No Teleport To Squad</font>
<br/>
<br/><font size='18' color='#FF7F00'>Looting</font>
<br/>No enemy units can be looted for equipment, however vehicles and storage can be looted. The platoon will have enough equipment available to complete the mission without looting, though may need to resupply if Logistics roles are available. 
<br/>
<br/><font size='18' color='#FF7F00'>Repairs</font>
<br/>Vehicles can be repaired by: <font color='#72E500'>Engineers Only</font>
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["",format["",f_param_CasualtiesCap]]];

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
<br/>Describe the enemy capability. 
<br/>
<br/><font size='18' color='#FF7F00'>Enemy Intent</font>
<br/>Roughly what the enemy are likely to do.
<br/>
<br/><font size='18' color='#FF7F00'>Location</font>
<br/>Describe the location / terrain.
<br/>
<br/><font size='18' color='#FF7F00'>Weather</font>
<br/>Describe the weather.
<br/>
",f_param_CasualtiesCap]]];

// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["",format["",f_param_CasualtiesCap]]];

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
<br/>Ensure KIA total is kept below %2.
<br/>
<br/>Ensure simultaneous casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap, fol_var_kia_limit]]];

/* // Below - version for timed missions
_mis = player createDiaryRecord ["diary", ["Mission",format["
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
<br/><font size='18' color='#FF7F00'>Civilian Presence</font>
<br/>Brief overview of whether civilians are present.
<br/>
",f_param_CasualtiesCap]]];
