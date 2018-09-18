/*
Author 2600K

FEATURE
Zeus - Auto-Administration Fill-in - Parses a bunch of parameters and puts them into the briefing,

RETURNS
DIARY HTML STRING

PARAMETERS
None
*/

waitUntil{!isNil "f_var_timeOfDay"; !isNil "f_var_missionLoaded"};

uiSleep 1;

params [["_diaryText", "", [""]]];

// ENVIRONMENT
_diaryText = _diaryText + "<br/><font size='18' color='#FF7F00'>ENVIRONMENT</font>";

private _sunriseHr = 4;
private _sunriseMin = 40;
private _sunsetHr = 19;
private _sunsetMin = 10;

// CALCULATE SUNSET/SUNRISE
private _sunsetSunrise = date call BIS_fnc_sunriseSunsetTime;

if !(_sunsetSunrise in [[-1,0],[0,-1]]) then {
	_sunriseHr = floor (_sunsetSunrise select 0);
	_sunriseMin = floor (((_sunsetSunrise select 0) % 1) * 60);
	_sunsetHr = floor (_sunsetSunrise select 1);
	_sunsetMin = floor (((_sunsetSunrise select 1) % 1) * 60);
};

_diaryText = _diaryText + format["<br/>Start Time: <font color='#72E500'>%1:%2</font><br/>Sunrise: <font color='#e50072'>%3:%4</font><br/>Sunset: <font color='#e50072'>%5:%6</font><br/>",
		if (floor daytime < 10) then { format["0%1", floor daytime] } else { floor daytime },
		if (floor ((daytime - (floor daytime)) * 60) < 10) then { format["0%1", floor ((daytime - (floor daytime)) * 60)] } else { floor ((daytime - (floor daytime)) * 60) },
		if (_sunriseHr < 10) then { format["0%1", _sunriseHr] } else { _sunriseHr },
		if (_sunriseMin < 10) then { format["0%1", _sunriseMin] } else { _sunriseMin },
		if (_sunsetHr < 10) then { format["0%1", _sunsetHr] } else { _sunsetHr },
		if (_sunsetMin < 10) then { format["0%1", _sunsetMin] } else { _sunsetMin }
	];

_diaryText = _diaryText + format["<br/>Fog: <font color='#72E500'>%1</font> (%2 %3)",
		switch (floor (fog * 10)) do {
			case 0: { "Clear" };
			case 1: { "Light" };
			case 2: { "Medium" };
			case 3: { "Thick" };
			default { "Very Thick" };
		},
		(round floor (fog * 10)) / 10,
		fogParams
	];

_diaryText = _diaryText + format["<br/>Forecast: <font color='#72E500'>%1</font> skies (%2)<br/>",
		switch (floor (overcast * 10)) do {
			case 0; case 1: { "Clear" };
			case 2; case 3: { "Light, cloudy" };
			case 4: { "Overcast" };
			case 5: { "Light showers with overcast" };
			case 6; case 7: { "Rain with cloudy" };
			case 8; case 9: { "Heavy rain and cloudy" };
			default { "Very heavy rain and stormy" };
		},
		overcast
	];

// MARKERS
if (missionNamespace getVariable["f_param_groupMarkers",0] > 0) then {
	switch (f_param_groupMarkers) do {
		case 4;
		case 5: { 
			_diaryText = _diaryText + "<br/><br/><font size='18' color='#FF7F00'>MARKERS</font>";
			_diaryText = _diaryText + "<br/>Group markers are displayed on the map for the <font color='#72E500'>Commander</font> only.<br/>"; 
		};
	};
};

// RESPAWN / JIP
_diaryText = _diaryText + "<br/><br/><font size='18' color='#FF7F00'>JIP / RESPAWN</font>";

if (!isNil "f_param_respawn") then {
	if (f_param_respawn == 0) then {
		_diaryText = _diaryText + "<br/>Respawn is <font color='#72E500'>Disabled</font><br/>";
	} else {
		if (f_param_respawn <= 10) then {
			_diaryText = _diaryText + format["<br/>LIMITED TICKETS: <font color='#72E500'>%1</font><br/>",f_param_respawn];
		} else {
			if (f_param_respawn in [30,60]) then {
				_diaryText = _diaryText + format["<br/>RESPAWN TIMER: <font color='#72E500'>%1</font> Seconds<br/>",f_param_respawn];
			} else {
				_diaryText = _diaryText + format["<br/>WAVE RESPAWN: <font color='#72E500'>%1</font> Minutes<br/>",[f_param_respawn,"MM"] call BIS_fnc_secondsToString];
				_diaryText = _diaryText + "<br/>Spectating the game is a privilege, not a right! NEVER inform players of enemy locations in-game/after respawn etc.<br/>";
			};
		};
	};
};

if (missionNamespace getVariable["f_param_jipTeleport",0] > 0) then {
	switch (f_param_jipTeleport) do {
		case 1: { _diaryText = _diaryText + "<br/>JIP players have an <font color='#72E500'>Action Menu</font> available to teleport to their squad.<br/>"; };
		case 2: { _diaryText = _diaryText + "<br/>JIP players have a <font color='#72E500'>Flag Pole</font> at base to teleport to their squad.<br/>"; };
		case 3: { _diaryText = _diaryText + "<br/>JIP players may use either the <font color='#72E500'>Action Menu</font> or <font color='#72E500'>Flag Pole</font> at base to teleport to their squad.<br/>"; };
	};
};

// MEDICAL
_diaryText = _diaryText + "<br/><br/><font size='18' color='#FF7F00'>MEDICAL</font>";

if (f_var_medical_level  > 0) then {
	switch (f_var_medical_level) do {
		case 1: { // ACE BASIC
			if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {		
				waitUntil{missionNamespace getVariable ["ace_common_settingsinitfinished",false]};	
			};
			
			_diaryText = _diaryText + "<br/>Medical Level: <font color='#72E500'><b>ACE Basic</b></font><br/>";
			_diaryText = _diaryText + format["<br/><font color='#FF7F00'>Settings</font>
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
		
			_diaryText = _diaryText + "<br/>Medical Level: <font color='#72E500'><b>ACE Advanced</b></font><br/>";
			_diaryText = _diaryText + format["<br/><font color='#FF7F00'>Settings</font>
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
				_diaryText = _diaryText + format["<br/><font color='#FF7F00'>Personal First-Aid Kits (PAK)</font>
				<br/>%1 may use a PAK %2, %3. The PAK %4 be removed upon treatment.<br/>",
				(["Anyone","Any trained Medic","Doctors"] select ace_medical_medicSetting_PAK),
				(["anywhere","only in a medical vehicle","only at medical facility","in a medical vehicle/medical facility"] select ace_medical_useLocation_PAK),
				(["in any condition","only when stable"] select ace_medical_useCondition_PAK),
				(["will not", "will"] select ace_medical_consumeItem_PAK)];
			} else {
				_diaryText = _diaryText + "<br/><font color='#FF7F00'>Personal First-Aid Kits (PAK)</font><br/>PAKs are not permitted.";
			};
			
			// SURGICAL KIT OR NOT
			if (ace_medical_useLocation_SurgicalKit != 4 && ace_medical_enableAdvancedWounds) then {
				_diaryText = _diaryText + format["<br/><font color='#FF7F00'>Surgical Kits</font>
				<br/>%1 may use a Surgical Kit %2, %3. The Kit %4 be removed upon treatment.<br/>",
				(["Anyone","Any trained Medic","Doctors"] select ace_medical_medicSetting_SurgicalKit),
				(["anywhere","only in a medical vehicle","only at medical facility","in a medical vehicle/medical facility"] select ace_medical_useLocation_SurgicalKit),
				(["in any condition","only when stable"] select ace_medical_useCondition_SurgicalKit),
				(["will not", "will"] select ace_medical_consumeItem_SurgicalKit)];
			} else {
				_diaryText = _diaryText + format["<br/><font color='#FF7F00'>Surgical Kits</font><br/>Wounds do not re-open -Surgical Kits are not %1.",(["required","permitted"] select ace_medical_enableAdvancedWounds)];
			};
		};

		case 3: { // FAROOQ
			waitUntil{!isNil "FAR_ReviveMode"};
			
			_diaryText = _diaryText + "<br/>Medical System: <font color='#72E500'><b>FAR / Folau Revive</b></font><br/>";
			_diaryText = _diaryText + "<br/>See Mechanical Notes for a full description of the Medical System";
		};
	};
} else {
	_diaryText = _diaryText + "<br/>Medical Level: <font color='#72E500'>Vanilla</font><br/> - Anything could happen!";
};

// RETURN
_diaryText;