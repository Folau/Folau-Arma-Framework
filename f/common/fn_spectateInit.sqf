params [["_enable",true,[true]]];

if (_enable) then {
	["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

	if (missionNamespace getVariable ["f_var_isAdmin",false]) then {
		[] spawn {
			sleep 5;
			systemChat "*** Press TeamSwitch at any time to disable spectator and access the Admin Menu ***";
			(findDisplay 60492) displayAddEventHandler ["keydown", "if((_this select 1) In actionKeys ""TeamSwitch"") then {['Terminate'] call BIS_fnc_EGSpectator; setPlayerRespawnTime 5;};"];
		};
	};
	
	if ("task_force_radio" in activatedAddons) then { [player, true] call TFAR_fnc_forceSpectator; };
	if ("acre_main" in activatedAddons) then { [true] call acre_api_fnc_setSpectator; };
} else {
	["Terminate"] call BIS_fnc_EGSpectator;
	if ("task_force_radio" in activatedAddons) then { [player, false] call TFAR_fnc_forceSpectator; };
	if ("acre_main" in activatedAddons) then { [false] call acre_api_fnc_setSpectator; };
};