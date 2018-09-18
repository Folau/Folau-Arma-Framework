// F3 - Process ParamsArray
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
if !isServer exitWith {};

_paramsLoaded = false;

// Iterate the parameters and compile/run any necessary code.
if (isNil "f_var_setParams") then {
	if (isNil "paramsArray") then {
		if (isClass(missionConfigFile >> "Params")) then {
			{
				_paramName = (configName _x);
				_paramValue = (getNumber (missionConfigFile >> "Params" >> _paramName >> "default"));
				diag_log text format["[F3] INFO (fn_processParamsArray.sqf): paramsArray (defaults) parsing %1 (%2).",_paramName,_paramValue];
				_paramCode = (getText (missionConfigFile >> "Params" >> _paramName >> "code"));
				_code = format[_paramCode, _paramValue];
				try {
					call compile _code;
				} catch {
					diag_log text format["[F3] ERROR (fn_processParamsArray.sqf): Error compiling code in %1.",_paramName];
				};
				missionNamespace setVariable [_paramName,_paramValue];
				publicVariable _paramName;
				_paramsLoaded = true;
			} forEach ("true" configClasses (missionConfigFile >> "Params"));
		};
	} else {
		diag_log text "[F3] INFO (fn_processParamsArray.sqf): Parameters Array is not Nil";
		{
			_paramName =(configName ((missionConfigFile >> "Params") select _forEachIndex));
			diag_log text format["[F3] INFO (fn_processParamsArray.sqf): paramsArray parsing %1 (%2).",_paramName,_x];
			_paramCode = (getText (missionConfigFile >> "Params" >> _paramName >> "code"));
			_code = format[_paramCode, _x];
			try {
				call compile _code;
			} catch {
				diag_log text format["[F3] ERROR (fn_processParamsArray.sqf): Error compiling code in %1.",_paramName];
			};
			missionNamespace setVariable [_paramName,_x];
			publicVariable _paramName;
			_paramsLoaded = true;
		} forEach paramsArray;
	};

	// Did the parameters get processed?
	if (_paramsLoaded) then {
		// Mission authors get automatic debug mode in single-player.
		if isNil "f_param_debugMode" then { missionNamespace setVariable ["f_param_debugMode",0, true] };
		if (profileName == missionNamespace getVariable["f_debugProfile","2600K"]) then { missionNamespace setVariable ["f_param_debugMode",1]; };
			
		// Check AUTO or ACE is wanted
		private _medicalVar = missionNamespace getVariable["f_param_medical",-1];
		if (_medicalVar in [0,6]) then {
			if (_medicalVar == 6) then { 
				// Farooq
				missionNamespace setVariable ["f_var_medical_level",3,true];
			} else {
				// Default to Vanilla.
				missionNamespace setVariable ["f_var_medical_level",0,true];
			};
		} else {
			if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {	
				// ace_medical_level: 0 = "Disabled", 1 = "Basic", 2 = "Advanced"
				// ace_medical_medicSetting: 0 = Everyone is a medic, 1 = Medics are medics, doctors have to be assigned with module, 2 = medics are doctors
				switch (_medicalVar) do {
					// ACE3 Basic - Normal Medic Rules
					case 1: {
						missionNamespace setVariable ["f_var_medical_level",1,true];						
						["ace_medical_level",1,true,true] call ace_common_fnc_setSetting; 
						["ace_medical_medicSetting",1,true,true] call ace_common_fnc_setSetting;
					};
					// ACE3 Advanced - Medics are Doctors
					case 2: {
						missionNamespace setVariable ["f_var_medical_level",2,true];
						["ace_medical_level",2,true,true] call ace_common_fnc_setSetting;
						["ace_medical_medicSetting",2,true,true] call ace_common_fnc_setSetting;
					};
					// ACE3 Advanced Stitching - Medics are Doctors + Wounds Open
					case 3: {
						missionNamespace setVariable ["f_var_medical_level",2,true];
						["ace_medical_level",2,true,true] call ace_common_fnc_setSetting;
						["ace_medical_medicSetting",2,true,true] call ace_common_fnc_setSetting;
						["ace_medical_enableAdvancedWounds",true,true,true] call ace_common_fnc_setSetting; // Enable Advanced wounds
					};
					// ACE3 Basic Lite - Everyone is Medic
					case 4: {
						missionNamespace setVariable ["f_var_medical_level",1,true];
						["ace_medical_level",1,true,true] call ace_common_fnc_setSetting;
						["ace_medical_medicSetting",0,true,true] call ace_common_fnc_setSetting;
					};
					// ACE3 Advanced Lite - Everyone is a Doctor
					case 5: {
						missionNamespace setVariable ["f_var_medical_level",2,true];
						["ace_medical_level",2,true,true] call ace_common_fnc_setSetting;
						["ace_medical_medicSetting",0,true,true] call ace_common_fnc_setSetting;
					};
					// Default to Advanced without stitching
					default {
						missionNamespace setVariable ["f_var_medical_level",2,true];
						["ace_medical_level",2,true,true] call ace_common_fnc_setSetting;
						["ace_medical_medicSetting",2,true,true] call ace_common_fnc_setSetting;
						["ace_medical_enableAdvancedWounds",true,true,true] call ace_common_fnc_setSetting; // Enable Advanced wounds
					};
				};
			} else {	
				// No ACE was found - Use Farooq (#3) if coop and nothing else has been previously set.
				if (_medicalVar in [1,2,3,4,5]) then {
					diag_log text "[F3] ERROR (fn_processParamsArray.sqf): ACE3 was specified but addon NOT found!";
				};
				
				if (toUpper (getText ((getMissionConfig "Header") >> "gameType")) == "COOP") then {
					missionNamespace setVariable ["f_var_medical_level",3,true];
				} else {
					missionNamespace setVariable ["f_var_medical_level",0,true];
				};
			};
		};
		
		// Auto-detect Radio Type
		if (isNil "f_param_radios") then {
			if ("task_force_radio" in activatedAddons) then {
				missionNamespace setVariable ["f_param_radios",1,true]; // TFAR Radio
			} else { 
				if ("acre_main" in activatedAddons) then {
					missionNamespace setVariable ["f_param_radios",2,true]; // ACRE Radio
				} else { 
					missionNamespace setVariable ["f_param_radios",0,true]; // Vanilla Radio
				};
			};
		};
			
		// Add Zeus administrators for client-side comparison
		if (!isNil "ZEU_ADMIN_fGetPlayerRegister") then {
			_playerRegister = [] call ZEU_ADMIN_fGetPlayerRegister;
		
			// Make sure array was returned
			if (_playerRegister isEqualType []) then {
				if (count _playerRegister > 1) then {
					missionNamespace setVariable ["f_zeusAdminNames",(_playerRegister select 1),true];
				};
			};
		};
				
		if (_paramsLoaded) then {
			missionNamespace setVariable ["f_var_setParams",true,true]; // Lets the client know params are set.
			
			if (missionNamespace getVariable["f_param_debugMode",0] == 1) then { 
				diag_log text format["[F3] DEBUG (fn_processParamsArray.sqf): f_var_setParams: %1",f_var_setParams];
			};
		};
	};
};