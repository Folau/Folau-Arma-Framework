FAR_Player_Actions = {
	params ["_unit","_newUnit"];
	
	if (!isNil "_newUnit") then {_unit = _newUnit}; // SP Team Switch Fix
	
	if (alive _unit && _unit isKindOf "Man") then {
		if (!isNil "FAR_addActionRevive") then { _unit removeAction FAR_addActionRevive };
		if (!isNil "FAR_addActionReviveNonMedic") then { _unit removeAction FAR_addActionReviveNonMedic };
		if (!isNil "FAR_addActionStabilise") then { _unit removeAction FAR_addActionStabilise };
		if (!isNil "FAR_addActionDrag") then { _unit removeAction FAR_addActionDrag };
		if (!isNil "FAR_addActionBag") then { _unit removeAction FAR_addActionBag };
		// addAction [title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition, radius, unconscious] 
		
		FAR_addActionRevive = _unit addAction ["<t color=""#23a4f3"">" + "Revive (Medkit)" + "</t>", FAR_HandleRevive,[], 11, true, true, "", "call FAR_Check_Revive && {(cursorTarget distance player) <= 2.8}",2.8];
		
		_unit setUserActionText [FAR_addActionRevive, "<img size='2' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/><t color=""#23a4f3"">" + "Revive (Medkit)" + "</t>"];
		
		FAR_addActionStabilise = _unit addAction ["<t color=""#FF0000"">" + "Stabilize (1 FAK)" + "</t>", FAR_HandleStabilize, [], 10, true, true, "", "(call FAR_Check_Stabilize) && {(cursorTarget distance player) <= 2.5}",2.5];
		
		_unit setUserActionText [FAR_addActionStabilise, "<img size='2' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/><t color=""#FF0000"">" + "Stabilize (1 FAK)" + "</t>"];
		
		FAR_addActionDrag = _unit addAction ["Drag", FAR_Drag, [], 9, false, true, "", "(call FAR_Check_Dragging) && {(cursorTarget distance player) <= 2.5}",2.5];
				
		FAR_addActionReviveNonMedic = _unit addAction ["<t color=""#FF0000"">" + "Revive (1 FAK)" + "</t>", FAR_HandleRevive,[], 11, true, true, "", "call FAR_Check_Revive_NonM && {(cursorTarget distance player) <= 2.8}",2.8];
		
		_unit setUserActionText [FAR_addActionReviveNonMedic, "<img size='2' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/><t color=""#FFFF00"">" + "Revive (1 FAK)" + "</t>"];
		
		if (_unit getUnitTrait "Medic") then {
			FAR_addActionBag = _unit addAction ["<t color=""#FF0000"">" + "Bag Body" + "</t>", FAR_Bag, [], 8, false, true, "", "(call FAR_Check_Bag) && {(cursorObject distance player) <= 2.8}",2.8];
		};
	};
};

FAR_HandleDamage_EH = {
	params ["_unit","_bodyPart","_amountOfDamage","_killer"];
	
	_kia_chance = missionNamespace getVariable["kiaChance",0];
	
	if (alive _unit && 
		_amountOfDamage >= 0.8 && 
		!(lifeState _unit == "INCAPACITATED") && 
		_bodyPart in ["","head","face_hub","neck","spine1","spine2","spine3","pelvis","body"]
	) then {
		if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
			diag_log text format["[FAR] DEBUG (FAR_HandleDamage_EH): Fired for %1",_unit]; 
		};
		/*if (_amountOfDamage > 1.5) then {
			systemChat "Critical Damage!";
		};*/
		
		_saveRoll = random 100;
		
		// systemChat format["Save Roll: %1 / Limit %2", _saveRoll, _kia_chance];
		
		if (_amountOfDamage >= 1 && _kia_chance > _saveRoll && _bodyPart in ["","head","face_hub","neck"]) then {
		
			1 fadeSound 0.2; 
			_amountOfDamage = _amountOfDamage;
			_unit allowDamage false;
			_unit setDamage 1;
			
			// Death message
			if (FAR_EnableDeathMessages && !isNil "_killer" && _killer != _unit) then {	
				// Never announce enemy or Zeus kills.
				if (
					!([side (group _unit), side (group _killer)] call BIS_fnc_sideIsEnemy) && 
					!([getAssignedCuratorLogic _killer] call BIS_fnc_isCurator) &&
					((isPlayer _unit && isPlayer _killer) || !isMultiPlayer)
				) then {
					if (vehicle _killer != _killer) then {
						format["[TeamKill] %1 was killed by %2 (%3)", name _unit, name _killer, getText(configFile >> "CfgVehicles" >> typeOf vehicle _killer >> "displayName")] remoteExec ["systemChat"];
					} else {
						format["[TeamKill] %1 was killed by %2", name _unit, name _killer] remoteExec ["systemChat"];
					};
				};
			};
					
			// Casualty Count Update
			[_unit] spawn {
				_unitSide = if (isPlayer (_this select 0)) then {playerSide} else {side (group (_this select 0))};
			
				// Random sleep to allow network sync if multiple casualties.
				sleep random 10;
				{
					_x params ["_sideVar","_markerVar"];
					
					// systemChat format["Unit Side %1 Side Var %1", _unitSide, _sideVar];
					
					if (_unitSide == _sideVar) exitWith {
						_casVar = missionNamespace getVariable [format["f_var_casualtyCount_%1",_sideVar],0];
						_kiaVar = missionNamespace getVariable [format["fol_var_kia_counter_%1",_sideVar],0];
						
						missionNamespace setVariable [format["f_var_casualtyCount_%1",_sideVar],_casVar + 1,true];
						missionNamespace setVariable [format["fol_var_kia_counter_%1",_sideVar],_kiaVar + 1,true];
						
						_markerVar setMarkerText format["Casualties: %1, KIA: %2",(_casVar + 1), (_kiaVar + 1)];
						// _markerVar setMarkerText format["Casualties: %1",(_casVar + 1)];
					};
				} forEach [
					[west,"respawn_west"],
					[east,"respawn_east"],
					[resistance,"respawn_guerrila"],
					[civilian,"respawn_civilian"]
				];
			};		
				
		}
		else
		{
			1 fadeSound 0.2;
			_unit setDamage 0;
			_unit allowDamage false;
			_amountOfDamage = 0;
			[_unit, _killer] spawn FAR_Player_Unconscious;
		};
	};
	_amountOfDamage;
};


FAR_public_EH = {
	if(count _this < 2) exitWith {};
	
	params ["_EH", "_target"];
	
	// FAR_deathMessage
	if (_EH == "FAR_deathMessage") then {

	};
};

FAR_Player_Unconscious = {
	params ["_unit", "_killer"];

	// Eject unit if inside vehicle
	if (vehicle _unit != _unit) then {
		moveOut _unit;
		_unit action ["getOut", vehicle _unit];
		//_unit action ["Eject", vehicle _unit];
		sleep 0.5;
	};
	
	_unit switchMove "";
	_unit setUnconscious true;
	
	// Death message
	if (FAR_EnableDeathMessages && !isNil "_killer" && _killer != _unit) then {	
		// Never announce enemy or Zeus kills.
		if (
			!([side (group _unit), side (group _killer)] call BIS_fnc_sideIsEnemy) && 
			!([getAssignedCuratorLogic _killer] call BIS_fnc_isCurator) &&
			((isPlayer _unit && isPlayer _killer) || !isMultiPlayer)
		) then {
			if (vehicle _killer != _killer) then {
				format["[TeamKill] %1 was injured by %2 (%3)", name _unit, name _killer, getText(configFile >> "CfgVehicles" >> typeOf vehicle _killer >> "displayName")] remoteExec ["systemChat"];
			} else {
				format["[TeamKill] %1 was injured by %2", name _unit, name _killer] remoteExec ["systemChat"];
			};
		};
	};

	// Casualty Count Update
	[_unit] spawn {
		_unitSide = if (isPlayer (_this select 0)) then {playerSide} else {side (group (_this select 0))};
	
		// Random sleep to allow network sync if multiple casualties.
		sleep random 25;
		{
			_x params ["_sideVar","_markerVar"];
			if (_unitSide == _sideVar) exitWith {
				_casVar = missionNamespace getVariable [format["f_var_casualtyCount_%1",_sideVar],0];
				_kiaVar = missionNamespace getVariable [format["fol_var_kia_counter_%1",_sideVar],0];
				missionNamespace setVariable [format["f_var_casualtyCount_%1",_sideVar],_casVar + 1,true];
				_markerVar setMarkerText format["Casualties: %1, KIA: %2",(_casVar + 1), (_kiaVar)];
				// _markerVar setMarkerText format["Casualties: %1",(_casVar + 1)];
			};
		} forEach [
			[west,"respawn_west"],
			[east,"respawn_east"],
			[resistance,"respawn_guerrila"],
			[civilian,"respawn_civilian"]
		];
	};
				
	if (isPlayer _unit) then {
		disableUserInput true;
		titleText ["", "BLACK FADED"];
		disableUserInput false;
		disableUserInput true;
		disableUserInput false;
		

		
		FAR_revive_ppVig ppEffectAdjust [1,1,0,[0.15,0,0,1],[1.0,0.5,0.5,1],[0.587,0.199,0.114,0],[1,1,0,0,0,0.2,1]];
		FAR_revive_ppBlur ppEffectAdjust [0];
		
		{
			_x ppEffectCommit 0;
			_x ppEffectEnable true;
			_x ppEffectForceInNVG true;
		} forEach [FAR_revive_ppVig, FAR_revive_ppBlur];
		
		91 cutText ["", "BLACK IN", 5, True];
		92 cutRsc ["RscInterlacing", "PLAIN", 0.1, True];
		{_x cutRsc ["RscCommonBackground", "PLAIN", 0.1, True];} forEach [93,94,95];//,95,96];
		
		[100] call BIS_fnc_bloodEffect;
	};
	
	_hudStatus = shownHUD;
	showHUD [false,false,false,false,false,false,false,false];	
		
	//_unit setVelocity [0,0,0];
    _unit allowDamage false;
	_unit setCaptive true;
	
	sleep 4;
	
	private _bPool = createSimpleObject [selectRandom ["BloodSpray_01_New_F","BloodSplatter_01_Medium_New_F"], getPosWorld _unit]; 
	_bPool setDir random 360; 
	_bPool setVectorUp surfaceNormal getPosWorld _unit;
    
	if (isPlayer _unit) then {
		titleText ["", "BLACK IN", 1];
		
		if (FAR_BleedOut > 600) then {
			["Initialize", [_unit, [playerSide], false, false]] call BIS_fnc_EGSpectator;
		};
	};
	
	_bleedOut = time + FAR_BleedOut;
	
	// Deduct 1m from bleed-out timer.
	if (FAR_BleedOut > 60 && FAR_BleedOut <= 600) then {
		FAR_BleedOut = FAR_BleedOut - 60;
	};
	
	private _tick = 0;
	
	while { !isNull _unit && 
			alive _unit && 
			(lifeState _unit == "INCAPACITATED") &&
			!(_unit getVariable ["FAR_isStabilized",false]) && 
			(FAR_BleedOut < 0 || time < _bleedOut) 
	} do {
		if (isPlayer _unit) then  {
			if (FAR_BleedOut > 600) then {
				hintSilent format["Waiting for a medic\n\n%1", call FAR_CheckFriendlies];
			} else { 
				//titleText [format["Bleedout in %1 seconds\n\n%2", round (_bleedOut - time), call FAR_CheckFriendlies], "PLAIN", 0.1];
				titleText [format["Bleedout in %1 Seconds...", round (_bleedOut - time)], "PLAIN"];
				// titleText [format["<img size='2' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/>" + "\n" + "Bleedout in %1 Seconds", round (_bleedOut - time)], "PLAIN"];
				
				//[format["Bleedout in %1 seconds\n\n%2", round (_bleedOut - time), call FAR_CheckFriendlies], "PLAIN", 0.1] remoteExec ["TitleText", _unit];
				// hintSilent format["Bleedout in %1 seconds\n\n%2", round (_bleedOut - time), call FAR_CheckFriendlies];
			};
		};
		
		if (_tick % ((round random 5) + 5) == 0) then { [100] call BIS_fnc_bloodEffect; };
		
		/*
		// TOFIX: Floating blood when dragging.
		if (random 1 > 0.75 && {_unit getVariable ["FAR_isDragged",false]}) then {
			private _bSplash = createSimpleObject [selectRandom ["BloodSplatter_01_Small_New_F","a3\characters_f\data\slop_00.p3d"], getPosWorld _unit]; 
			_bSplash setDir random 360; 
			_bSplash setVectorUp surfaceNormal getPosWorld _unit;
		};
		*/
		_tick = _tick + 1;		
		sleep 1;
	};
	
	if (_unit getVariable ["FAR_isStabilized",false]) then {
		//Unit has been stabilized. Disregard bleedout timer.
		while { !isNull _unit && 
				alive _unit && 
				(lifeState _unit == "INCAPACITATED")
		} do {
			if (isPlayer _unit) then  {
				titleText ["You have been Stabilized.", "PLAIN"];			
				// hintSilent format["You have been stabilized\n\n%1", call FAR_CheckFriendlies];	
			};
			sleep 1;
		};
	};
	
	{_x ppEffectEnable false} forEach [FAR_revive_ppVig, FAR_revive_ppBlur];	
	showHUD _hudStatus;
	for "_n" from 91 to 96 do {_n cutFadeOut 0.1;};
	
	// Bled out
	if (FAR_BleedOut > 0 && 
			{time > _bleedOut} && 
			(lifeState _unit == "INCAPACITATED") &&
			!(_unit getVariable ["FAR_isStabilized",false])
	) then {
		// Kill player, stop the camera.
		["Terminate"] call BIS_fnc_EGSpectator;
		1 fadeSound 1;
		_unit setCaptive false;
		_unit allowDamage true;
		_unit setDamage 1;
		
		[_unit] spawn {
			_unitSide = if (isPlayer (_this select 0)) then {playerSide} else {side (group (_this select 0))};
			{
					_x params ["_sideVar","_markerVar"];	
					if (_unitSide == _sideVar) exitWith {
					_casVar = missionNamespace getVariable [format["f_var_casualtyCount_%1",_sideVar],0];
					_kiaVar = missionNamespace getVariable [format["fol_var_kia_counter_%1",_sideVar],0];
					missionNamespace setVariable [format["fol_var_kia_counter_%1",_sideVar],_kiaVar + 1,true];	
					_markerVar setMarkerText format["Casualties: %1, KIA: %2",(_casVar), (_kiaVar + 1)];
					};
			} forEach [
				[west,"respawn_west"],
				[east,"respawn_east"],
				[resistance,"respawn_guerrila"],
				[civilian,"respawn_civilian"]];
		};	
		
	} else {	// Player got revived		
		["Terminate"] call BIS_fnc_EGSpectator;
		sleep 3;
		
		// Clear the "medic nearby" hint
		titleText["", "PLAIN"];
		1 fadeSound 1;
		_unit allowDamage true;
		_unit setCaptive false;


	};
	
	// Reset variables
	_unit setVariable ["FAR_isStabilized", false, true];
	_unit setVariable ["FAR_isDragged", false, true];
};

FAR_Check_Revive = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!
	_return = false;
	
	// Unit that will excute the action
	_isMedic = getNumber (configFile >> "CfgVehicles" >> typeOf player >> "attendant");

	if !(_target isKindOf 'Man') exitWith { false };

	// Make sure player is alive and target is an injured unit
	if (!alive player ||
		(lifeState player == "INCAPACITATED") ||
		!(lifeState _target == "INCAPACITATED") ||
		FAR_isDragging ||
		([side (group _target), playerSide] call BIS_fnc_sideIsEnemy)
	) exitWith { false };
		
	// Make sure target is unconscious and player is a medic 
	if ((lifeState _target == "INCAPACITATED") && (player getUnitTrait "Medic"))
	then {
		// [ReviveMode] Check if player has a Medikit
		if ("Medikit" in (items player)) then {
			_return = true;
		};
	};
	
	_return
};

FAR_Check_Revive_NonM = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!
	_return = false;
	
	// Unit that will excute the action
	_isMedic = getNumber (configFile >> "CfgVehicles" >> typeOf player >> "attendant");

	if !(_target isKindOf 'Man') exitWith { false };

	// Make sure player is alive and target is an injured unit
	if (!alive player ||
		(lifeState player == "INCAPACITATED") ||
		!(lifeState _target == "INCAPACITATED") ||
		FAR_isDragging ||
		([side (group _target), playerSide] call BIS_fnc_sideIsEnemy)
	) exitWith { false };
		
	// Make sure target is unconscious and player is a medic 
	if ((_target getVariable ["FAR_isStabilized",false]) && 
	!(player getUnitTrait "Medic" && "Medikit" in (items player))
	) 
	then {
		// [ReviveMode] Check if player has a Medikit
		if ((("FirstAidKit" in (items player)) || ("FirstAidKit" in (items _target))))
		then {
				_return = true;
			}
		else {
				_return = false;
		};
	};
	
	_return
};

FAR_HandleRevive = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!
	
	if (alive _target) then {
		private _stance = if (stance player == "PRONE") then {"pne"} else {"knl"};
		private _weapon = if (currentWeapon player isEqualTo "") then {"non"} else {if (currentWeapon player isEqualTo handgunWeapon player) then {"pst"} else {"rfl"};};
		
		player playMove format["AinvP%1MstpSlayW%2Dnon_medicOther",_stance,_weapon];
		
		private _simpleObj = createSimpleObject [selectRandom [
			"MedicalGarbage_01_1x1_v1_F",
			"MedicalGarbage_01_1x1_v2_F",
			"MedicalGarbage_01_1x1_v3_F"
		], getPosWorld player];
		_simpleObj setDir random 360;
		_simpleObj setVectorUp surfaceNormal getPosWorld player;
		
		_target setVariable ["FAR_isDragged", false, true];
		
		sleep 4;
		// If player was taken out while performing revive, exit.
		if (lifeState player != "INCAPACITATED") then {
			[_target,false] remoteExec ["setUnconscious",_target];
			sleep 1;
			
			if !(player getUnitTrait "Medic" && "Medikit" in (items player)) then {
				if !("FirstAidKit" in (items player)) then {
					_target removeItem "FirstAidKit";
					[[format["%1 used a FAK from your inventory to revive you",name player],"PLAIN DOWN"]] remoteExec ["TitleText",_target];
				} else {
					player removeItem "FirstAidKit";
					[[format["You were revived by %1",name player],"PLAIN DOWN"]] remoteExec ["TitleText",_target];			
				};
			}
			else {
				[[format["You were revived by %1",name player],"PLAIN DOWN"]] remoteExec ["TitleText",_target];			
			};

			if (currentWeapon _target != "") then {
				[_target,["SwitchWeapon", _target, _target, 0]] remoteExec ["action",_target];
			} else {
				[_target,"Civil"] remoteExec ["playAction",_target];
			};
		};
	};
};

FAR_Check_Stabilize = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!
	
	if !(_target isKindOf 'Man') exitWith { false };
	
	// Make sure player is alive and target is an injured unit
	if( !alive player ||
		(lifeState player == "INCAPACITATED") ||
		FAR_isDragging ||
		([side (group _target), playerSide] call BIS_fnc_sideIsEnemy)
	) exitWith {
		false
	};

	// Make sure target is unconscious and hasn't been stabilized yet, and player has a FAK/Medikit 
	if ((lifeState _target == "INCAPACITATED") && 
		!(player getUnitTrait "Medic" && "Medikit" in (items player)) &&
		!( _target getVariable ["FAR_isDragged",false]) && 
		!(_target getVariable ["FAR_isStabilized",false]) &&
		( ("FirstAidKit" in (items player)) || ("FirstAidKit" in (items _target)))
	) exitWith {
		true;
	};
	
	false
};

FAR_HandleStabilize = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!

	if (alive _target) then {
		private _stance = if (stance player == "PRONE") then {"pne"} else {"knl"};
		private _weapon = if (currentWeapon player isEqualTo "") then {"non"} else {if (currentWeapon player isEqualTo handgunWeapon player) then {"pst"} else {"rfl"};};

		player playMove format["AinvP%1MstpSlayW%2Dnon_medicOther",_stance,_weapon];

		if !("Medikit" in (items player)) then {
			if !("FirstAidKit" in (items player)) then {
				_target removeItem "FirstAidKit";
				[[format["%1 used a FAK from your inventory to stabilise you",name player],"PLAIN DOWN", 2]] remoteExec ["TitleText",_target];
			} else {
				player removeItem "FirstAidKit";
			};
		};
		
		private _simpleObj = createSimpleObject ["MedicalGarbage_01_FirstAidKit_F", getPosWorld player];
		_simpleObj setDir random 360;
		_simpleObj setVectorUp surfaceNormal getPosWorld player;
		

		if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {
			diag_log text format["[FAR] DEBUG (%1): STABILISE BY %2",_target,player]; 
		};
		
		_target setVariable ["FAR_isStabilized", true, true];
	};
};

FAR_Check_Dragging = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!
	
	if !(_target isKindOf 'Man') exitWith { false };

	if( !alive player || 
		(lifeState player == "INCAPACITATED") ||
		FAR_isDragging || 
		(primaryWeapon player == "")
	) exitWith { false };
	
	// Target of the action
	if((lifeState _target == "INCAPACITATED") && !(_target getVariable ["FAR_isDragged",false])) exitWith { true };
		
	false
};

FAR_Drag = {
	private _target = cursorTarget; // Can't be passed in addAction arguments!
		
	FAR_isDragging = true;
	player playActionNow "grabDrag";
		
	_target attachTo [player, [0, 1.1, 0.092]];
	[_target,180] remoteExec ["setDir",_target];
	_target setPos (getPos _target);
	_target setVariable ["FAR_isDragged", true, true];
		
	// Add release action and save its id so it can be removed
	private _id = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", { 	
			player switchMove "";
			FAR_isDragging = false;
		}, [], 10, true, true, "", "true"];
		titleText [format ["Dragging %1 - Press 'C' if you can't move.",name _target], "PLAIN DOWN", 2];

	// Wait until release action is used
	waitUntil { 
		sleep 0.1;
		!alive player || 
		(lifeState player == "INCAPACITATED") ||
		!(lifeState _target == "INCAPACITATED") ||
		!FAR_isDragging || 
		!(_target getVariable ["FAR_isDragged",false])
	};

	// Handle release action if _target was dropped by other means.
	if (FAR_isDragging && lifeState player != "INCAPACITATED") then {
		player switchMove "";
	};
		
	FAR_isDragging = false;
	
	if (!isNull _target && alive _target) then {
		_target setVariable ["FAR_isDragged", false, true];
		detach _target;
		_target setPosATL getposATL player;
	};
	
	player removeAction _id;
};

FAR_IsFriendlyMedic = {
	private ["_unit"];
	_unit = _this;
				
	if ((_unit getUnitTrait "Medic" || (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "attendant") == 1)) &&
		alive _unit && 
		(isPlayer _unit || !isMultiPlayer) && 
		side (group _unit) == playerSide && 
		!(lifeState _unit == "INCAPACITATED")
	) exitWith { true };
	
	false
};

FAR_CheckFriendlies = {
	private ["_unit", "_units", "_medics", "_hintMsg"];

	_units = (position player) nearEntities [["Man", "Air", "Car"], 300];
	//_units = nearestObjects [getPos player, ["Man", "Car", "Air", "Ship"], 300];
	_medics = [];
	_dist = 300;
	_hintMsg = "";
	
	// Find nearby friendly medics
	if (count _units > 1) then {
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then {
				if (alive _x && count (crew _x) > 0) then {
					{
						if (_x call FAR_IsFriendlyMedic) then {
							_medics = _medics + [_x];
							
							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			} else {
				if (_x call FAR_IsFriendlyMedic) then {
					_medics = _medics + [_x];
				};
			};
		} forEach _units;
	};
	
	// Sort medics by distance
	if (count _medics > 0) then {
		{
			if (player distance _x < _dist) then {
				_unit = _x;
				_dist = player distance _x;
			};
		
		} forEach _medics;
		
		if (!isNull _unit) then {
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);
			
			_hintMsg = format["Nearby Medic:\n%1 is %2m away.", _unitName, _distance];
		};
	} else {
		_hintMsg = "No medics within 300m.";
	};
	
	_hintMsg
};

FAR_Check_Bag = {
	private _target = cursorObject; // Can't be passed in addAction arguments!	
	if !(_target isKindOf "Man") exitWith { false };
	if (getNumber (configFile >> "CfgFactionClasses" >> (faction player) >> "side") != getNumber (configFile >> "CfgFactionClasses" >> (faction _target) >> "side") ||
		{lifeState _target != 'DEAD'} || 
		{!(_target isKindOf 'Man')}
	) exitWith { false };
	
	true
};

FAR_Bag = {
	private _target = cursorObject; // Can't be passed in addAction arguments!
		
	private _hasWeapon = (currentWeapon player isEqualTo primaryWeapon player);
	
	private _stance = if (stance player == "PRONE") then {"pne"} else {"knl"};
	private _weapon = if (currentWeapon player isEqualTo "") then {"non"} else {if (currentWeapon player isEqualTo handgunWeapon player) then {"pst"} else {"rfl"};};
		
	player playMove format["AinvP%1MstpSlayW%2Dnon_medicOther",_stance,_weapon];

	private _simpleObj = createSimpleObject ["Land_Bodybag_01_black_F", getPosWorld _target];
	_simpleObj setDir getDir _target;
	_simpleObj setVectorUp surfaceNormal getPosWorld _target;
	
	[_target, true] remoteExec ["hideObject"];
};