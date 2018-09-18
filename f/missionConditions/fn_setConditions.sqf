// F3 - SetWeather
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// RUN ONLY ON THE SERVER
// This function does never need to run on a client
if !isServer exitWith {};

waitUntil{ !isNil "f_var_missionLoaded"; };

f_fnc_setFog = compileFinal preprocessFileLineNumbers "f\missionConditions\f_setFog.sqf";
f_fnc_setWeather = compileFinal preprocessFileLineNumbers "f\missionConditions\f_setWeather.sqf";
f_fnc_setWind = compileFinal preprocessFileLineNumbers "f\missionConditions\f_setWind.sqf";
f_fnc_setTime = compileFinal preprocessFileLineNumbers "f\missionConditions\f_setTime.sqf";

// Only run if TOD parameter has not been set.
if (isNil "f_var_timeOfDay") then {
	if (!isNil "f_param_timeOfDay") then {
		[f_param_timeOfDay] call f_fnc_setTime;
	};

	// Only run if fog parameter and TOD has been set.
	if (!isNil "f_param_fog") then {
		[f_param_fog] call f_fnc_setFog;
	};
	
	// Only run if weather parameter and TOD has been set.
	if (!isNil "f_param_weather") then {
		[f_param_weather] call f_fnc_setWeather;
	};

	forceWeatherChange;
	publicVariable "f_var_timeOfDay";
};