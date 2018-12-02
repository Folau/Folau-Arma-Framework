_mechanicsText = "<br/>This section highlights any areas where mission mechanics may require explanation.";

// MEDICAL
_mechanicsText = _mechanicsText + "<br/><br/><font size='18' color='#ea2e2e'>MEDICAL</font>";
if (f_param_medical  > 0) then {
	switch (f_param_medical) do {
		case 1: { // ACE BASIC
			if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {		
				waitUntil{missionNamespace getVariable ["ace_common_settingsinitfinished",false]};	
			};
			
			_mechanicsText = _mechanicsText + "<br/>Medical Level: <font color='#72E500'><b>ACE Basic</b></font><br/>";
			_mechanicsText = _mechanicsText + format["<br/><font color='#ea2e2e'>Settings</font>
			<br/>Medic Training: <font color='#72E500'>%1</font>
			<br/>Prevent Instant Death: <font color='#72E500'>%2</font>
			<br/>Damage Threshold: <font color='#72E500'>%3</font>
			<br/>",
			(["Anyone","Medic Only","Medic Only"] select ace_medical_medicSetting),
			(["Off", "On"] select ace_medical_preventInstaDeath),
			ace_medical_playerdamagethreshold];
		};
		
		case 2: { // ACE ADVANCED
			if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {		
				waitUntil{missionNamespace getVariable ["ace_common_settingsinitfinished",false]};	
			};
		
			_mechanicsText = _mechanicsText + "<br/>Medical Level: <font color='#72E500'><b>ACE Advanced</b></font><br/>";
			_mechanicsText = _mechanicsText + format["<br/><font color='#ea2e2e'>Settings</font>
			<br/>Medic Training: <font color='#72E500'>%1</font>
			<br/>Prevent Instant Death: <font color='#72E500'>%2</font>
			<br/>Prevent Crippled Limbs: <font color='#72E500'>%3</font>
			<br/>Damage Threshold: <font color='#72E500'>%4</font>
			<br/>",
			(["Anyone","Medic Basic","Medic Advanced"] select ace_medical_medicSetting),
			(["Off", "On"] select ace_medical_preventInstaDeath),
			(["No", "Yes"] select ace_medical_healHitPointAfterAdvBandage),
			ace_medical_playerdamagethreshold];
			
			// PAK OR NOT
			if (ace_medical_useLocation_PAK != 4) then {
				_mechanicsText = _mechanicsText + format["<br/><font color='#FF7F00'>Personal First-Aid Kits (PAK)</font>
				<br/>%1 may use a PAK %2, %3. The PAK %4 be removed upon treatment.<br/>",
				(["Anyone","Any trained Medic","Doctors"] select ace_medical_medicSetting_PAK),
				(["anywhere","only in a medical vehicle","only at medical facility","in a medical vehicle/medical facility"] select ace_medical_useLocation_PAK),
				(["in any condition","only when stable"] select ace_medical_useCondition_PAK),
				(["will not", "will"] select ace_medical_consumeItem_PAK)];
			} else {
				_mechanicsText = _mechanicsText + "<br/><font color='#FF7F00'>Personal First-Aid Kits (PAK)</font><br/>PAKs are not permitted.";
			};
			
			// SURGICAL KIT OR NOT
			if (ace_medical_useLocation_SurgicalKit != 4 && ace_medical_enableAdvancedWounds) then {
				_mechanicsText = _mechanicsText + format["<br/><font color='#FF7F00'>Surgical Kits</font>
				<br/>%1 may use a Surgical Kit %2, %3. The Kit %4 be removed upon treatment.<br/>",
				(["Anyone","Any trained Medic","Doctors"] select ace_medical_medicSetting_SurgicalKit),
				(["anywhere","only in a medical vehicle","only at medical facility","in a medical vehicle/medical facility"] select ace_medical_useLocation_SurgicalKit),
				(["in any condition","only when stable"] select ace_medical_useCondition_SurgicalKit),
				(["will not", "will"] select ace_medical_consumeItem_SurgicalKit)];
			} else {
				_mechanicsText = _mechanicsText + format["<br/><font color='#FF7F00'>Surgical Kits</font><br/>Wounds do not re-open -Surgical Kits are not %1.",(["required","permitted"] select ace_medical_enableAdvancedWounds)];
			};
		};

		case 6: { // FAROOQ
			waitUntil{!isNil "FAR_ReviveMode"};
			
			_mechanicsText = _mechanicsText + "<br/>Medical System: <font color='#72E500'><b>FAR / Folau Revive</b></font><br/>";
			_mechanicsText = _mechanicsText + "<br/>This mission uses a modification of the FAR Revive system with the following rules:
				<br/>
				<br/>Stablise: <font color='#72E500'>FAK</font>
				<br/>
				<br/>Revive: <font color='#72E500'>Medkit used by Medic</font> OR <font color='#72E500'>FAK on a Stablised Unit</font>";
		};
	};
};	

if (missionNamespace getVariable["f_param_kiaChance",0] > 0) then {
	_mechanicsText = _mechanicsText + "
	<br/><br/>Instant Kill: <font color='#72E500'>On</font>
	<br/>For large damage to a critical area there is a chance of KIA.";
};

// RESPAWN / JIP
_mechanicsText = _mechanicsText + "<br/><br/><font size='18' color='#ea2e2e'>JIP / RESPAWN</font>";
if (!isNil "f_param_respawn") then {
	if (f_param_respawn == 0) then {
		_mechanicsText = _mechanicsText + "<br/>Respawn is <font color='#72E500'>Disabled</font><br/>";
	} else {
		if (f_param_respawn <= 10) then {
			_mechanicsText = _mechanicsText + format["<br/>Limited Tickets: <font color='#72E500'>%1</font><br/>",f_param_respawn];
		} else {
			if (f_param_respawn in [30,60]) then {
				_mechanicsText = _mechanicsText + format["<br/>Respawn Timer: <font color='#72E500'>%1</font> Seconds<br/>",f_param_respawn];
			} else {
				_mechanicsText = _mechanicsText + format["<br/>Wave Respawn: <font color='#72E500'>%1</font> Minutes<br/>",[f_param_respawn,"MM"] call BIS_fnc_secondsToString];
				_mechanicsText = _mechanicsText + "<br/>Spectating the game is a privilege, not a right! NEVER inform players of enemy locations in-game/after respawn etc.<br/>";
			};
		};
	};
};

if (missionNamespace getVariable["f_param_jipTeleport",0] > 0) then {
	switch (f_param_jipTeleport) do {
		case 1: { _mechanicsText = _mechanicsText + "<br/>JIP players have an <font color='#72E500'>Action Menu</font> available to teleport to their squad.<br/>"; };
		case 2: { _mechanicsText = _mechanicsText + "<br/>JIP players have a <font color='#72E500'>Flag Pole</font> at base to teleport to their squad.<br/>"; };
		case 3: { _mechanicsText = _mechanicsText + "<br/>JIP players may use either the <font color='#72E500'>Action Menu</font> or <font color='#72E500'>Flag Pole</font> at base to teleport to their squad.<br/>"; };
	};
};

// ENGINEERING
_mechanicsText = _mechanicsText + 
"<br/><font size='18' color='#ea2e2e'>ENGINEERING / EOD</font>
<br/>Vehicles can be repaired by: <font color='#72E500'>Engineers Only</font>
<br/>Mines can be defused by: <font color='#72E500'>EOD Only</font>
<br/>";

if (missionNamespace getVariable["f_param_looting",0] == 0) then {
	 _mechanicsText = _mechanicsText + 
	 "<br/><font size='18' color='#ea2e2e'>LOOTING</font>
	<br/>No <font color='#72E500'>enemy units</font> can be looted for equipment, however KIA friendlies, all vehicles and all storage can be looted. The platoon will have enough equipment available to complete the mission without looting, though may need to resupply if Logistics roles are available. 
	<br/>";
};

_mechanicsText = _mechanicsText + 
"<br/><font size='18' color='#ea2e2e'>IMMERSION</font>";
if (missionNamespace getVariable["f_param_artilleryComputer",0] == 0) then {
	 _mechanicsText = _mechanicsText + 
	 "<br/>Artillery Computer: <font color='#72E500'>Disabled</font>";
}
else
{
	 _mechanicsText = _mechanicsText + 
	 "<br/>Artillery Computer: <font color='#72E500'>Enabled</font>";
};

if (missionNamespace getVariable["f_param_groupMarkers",0] > 0) then {
	switch (f_param_groupMarkers) do {
		case 4;
		case 5: { 
			_mechanicsText = _mechanicsText + "<br/>Group Markers: <font color='#72E500'>Commander Only</font>"; 
		};
		case 1;
		case 2: { 
			_mechanicsText = _mechanicsText + "<br/>Group Markers: <font color='#72E500'>Enabled</font>"; 
		};
	};
};

if (missionNamespace getVariable["f_param_fireTeamMarkers",0] == 0) then {
	 _mechanicsText = _mechanicsText + 
	 "<br/>Fireteam Markers: <font color='#72E500'>Disabled</font>";
}
else
{
	 _mechanicsText = _mechanicsText + 
	 "<br/>Fireteam Markers: <font color='#72E500'>Enabled</font>";
};

if (missionNamespace getVariable["f_param_shiftClick",0] == 0) then {
	 _mechanicsText = _mechanicsText + 
	 "<br/>Shift-Click Marker: <font color='#72E500'>Disabled</font>";
}
else
{
	 _mechanicsText = _mechanicsText + 
	 "<br/>Shift-Click Marker: <font color='#72E500'>Enabled</font>";
};

switch (f_param_thirdPerson) do {
	case 0: { 
		_mechanicsText = _mechanicsText + "<br/>Third Person: <font color='#72E500'>Enabled</font>"; 
	};
	case 1: { 
		_mechanicsText = _mechanicsText + "<br/>Third Person: <font color='#72E500'>Vehicles Only</font>"; 
	};
	case 2: { 
		_mechanicsText = _mechanicsText + "<br/>Third Person: <font color='#72E500'>Disabled</font>"; 
	};
};


// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["diary", ["Mechanical Notes", _mechanicsText]];

// The code below creates the execution sub-section of notes.
_spacer = player createDiaryRecord ["diary", ["-- Mission Admin --","
<br/>"]];

// OLD

