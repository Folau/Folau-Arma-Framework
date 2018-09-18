// F3 - Briefing
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// FACTION: CIV
// <font color='#0080FF'><marker name='XXX'>XXX</marker></font color>
// Green #72E500
// Orange #FF7F00
// Blue #0080FF

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration",["
<br/><font size='18' color='#FF7F00'>ADMINISTRATION</font>
<br/>The following text has been auto-generated from the mission modules and parameters.
<br/>
"] call f_fnc_fillAdministration]];

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Mission",format["
<br/><font size='18' color='#FF7F00'>OBJECTIVES</font>
<br/>*** Insert the mission here. ***
<br/>
<br/>Ensure casualties are kept below %1 percent.
<br/>
<br/><font size='18' color='#FF7F00'>COMMANDER'S INTENT</font>
<br/>*** Insert very short summary of plan here. ***
<br/>
<br/><font size='18' color='#FF7F00'>MOVEMENT PLAN</font>
<br/>*** Insert movement instructions here. ***
<br/>
<br/><font size='18' color='#FF7F00'>FIRE SUPPORT PLAN</font>
<br/>*** Insert fire support instructions here. ***
<br/>
<br/><font size='18' color='#FF7F00'>SPECIAL TASKS</font>
<br/>*** Insert instructions for specific units here. ***
<br/>
<br/>
",f_param_CasualtiesCap]]];

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Situation","
<br/><font size='18' color='#FF7F00'>BACKGROUND</font>
<br/>*** Insert general information about the situation here.***
<br/>
<br/><font size='18' color='#FF7F00'>FRIENDLY FORCES</font>
<br/>*** Insert information about friendly forces here.***
<br/>
<br/><font size='18' color='#FF7F00'>ENEMY FORCES</font>
<br/>*** Insert information about enemy forces here.***
<br/>
<br/><font size='18' color='#FF7F00'>CREDITS</font>
<br/>Created by <font color='#72E500'>?</font color>
<br/>
<br/>A custom-made mission for ArmA 3 and Zeus Community
<br/>http://zeus-community.net/
<br/>
"]];