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
<br/><font size='18' color='#FF7F00'>Fail Conditions</font>
<br/>There is no fail condition for all of the helicopters being destroyed. It is at the CO/Admin's discretion to decide whether the mission is failed or if alternative transport can be sourced for exfil.
<br/>
",f_param_CasualtiesCap]]];


// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Intel",format["
<br/><font size='18' color='#FF7F00'>Enemy Capability</font>
<br/>The red area marks the approximate area to expect patrols, with particular attention drawn to <marker name='marker_4'>Galati Military Base </marker> and <marker name='marker_3'>Krya Nera<marker> as bases CSAT have occupied. In the area expect to have a number of infantry patrols albeit spread thinly. CSAT are known to operate a variety of MRAPs, Technicals, IFVs, and Helicopters in the area, and if they feel their airspace is sufficiently threatened may bring in Air Superiority Fighters. 
<br/>
<br/><font size='18' color='#FF7F00'>Enemy Intent</font>
<br/>Upon the alarm being raised we would anticipate CSAT troops falling back towards the depot in numbers - speed will be essential here.
<br/>
<br/><font size='18' color='#FF7F00'>Location</font>
<br/>The airfield CSAT are using sits within a natural bowl surrounded by hills. These will provide good vision and intel and the risk of being detected earlier than desirable.
<br/>
<br/><font size='18' color='#FF7F00'>Weather</font>
<br/>It is currently early morning and overcast, with rain predicted later but visibility remaining good. 
<br/>
",f_param_CasualtiesCap]]];


// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/><font size='18' color='#FF7F00'>COMMANDERS INTENT</font>
<br/>As directed by the Platoon Commander.
<br/>
<br/><font size='18' color='#FF7F00'>MOVEMENT PLAN</font>
<br/>The platoon will deploy and extract by helicopter, with movement during the mission as directed by the Platoon Commander.
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
<br/>Your mission is to destroy the two Taru helicopters, destroy the CSAT ammunation caches, and extract from the area. 
<br/>
<br/>Ensure casualties are kept below %1 percent.
<br/>
",f_param_CasualtiesCap]]];


_test = player createDiaryRecord ["diary", ["Situation",format["
<br/><font size='18' color='#FF7F00'>OVERVIEW</font>
<br/>The recently-formed AAF Special Forces company has been looking for a way to prove its worth to Command, and the opportunity has presented itself to perform a daring raid on a <marker name='marker_2'>CSAT supply depot</marker>. CSAT have been using this with their heavy Taru helicopters to keep troops supplied, and being able to affect this capability will provide the AAF with much-needed respite from the current CSAT offensive. 
<br/>
<br/>Two main targets have been identified. The first of these is the pair of Taru helicopters that have been the workhorses of the CSAT supply lines, and the second is the main warehouse containing CSAT ammunition and equipment. To this end, an airborne insertion and extraction has been planned for the platoon, with armed WY-55 Hellcats supplied to be able to provide fire-support. 
<br/>
<br/>AAF forces have reached the <marker name='respawn_guerrila'>Form-Up Point</marker> and are waiting to mount the helicopters. 
<br/>
<br/><font size='18' color='#FF7F00'>FRIENDLY FORCES</font>
<br/>Friendly forces are as follows:
<br/>
<br/>> Platoon Command
<br/>> 2 x 6 Man Infantry Sections
<br/>> 1 x 6 Man Heavy Weapons (AA and AT) Section
<br/>> 2 x Helicopter Crews
<br/>
<br/>The following air assets are available:
<br/>
<br/>> 1 x CH-49 Mohawk (Unarmed - Crew + 16 Passengers)
<br/>> 1 x WY-55 Hellcat (24 x DAR - Crew + 6 Passengers)
<br/>> 1 x WY-55 Hellcat (8 x Scalpel ATGM, requires Gunner/Co-Pilot to use - Crew + 6 Passengers)
<br/>
<br/><font size='18' color='#FF7F00'>ENEMY FORCES</font>
<br/>The AAF will be conducting this operation in what is basically CSAT's back yard. Whilst there will be fewer patrols expect a robust response involving infantry, MRAPs, IFV, airborne elements, and possibly fast-movers. 
<br/>
<br/>For a more detailed breakdown see the ""Intel"" tab.
<br/>
",f_param_CasualtiesCap]]];
