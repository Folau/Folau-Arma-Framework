// F3 - SetWeather
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
params [["_weather",0],["_delay",0]];

if (!isServer || isNil "_weather") exitWith {};

// If weather is mission-defined exit.
if (_weather == 0) exitWith {};

// If time-setting is disabled or missing, use mission time.
if (isNil "f_var_timeOfDay") then { f_var_timeOfDay = daytime; };

// Preselect random weather
if (_weather == 7) then {
	// If its night and if we should make the night clear.
	_sunrise = 4;
	_sunset = 19;
	_sunsetSunrise = date call BIS_fnc_sunriseSunsetTime;

	if !(_sunsetSunrise in [[-1,0],[0,-1]]) then {
		_sunrise = floor (_sunsetSunrise select 0);
		_sunset = floor (_sunsetSunrise select 1);
	};
	
	if (f_var_timeOfDay < _sunrise || f_var_timeOfDay >= _sunset) then { 
		_weather = 1;
	} else {
		_weather = selectRandom [1,1,1,1,1,1,1,1,1,1,2,2,3,3,4,4,5,5,6];
	};
};

// SELECT MISSION WEATHER
// Using the value of _weather, new weather conditions are set.

// ACE SETTINGS
// ACE_RAIN_PARAMS = [lastRain, newRain, transitionTime];
// ACE_MISC_PARAMS = [lightnings, rainbow, fogParams, temperatureShift, badWeatherShift, humidityShift];

switch (_weather) do {
// Clear (Calm)
	case 1:
	{
		_delay setOvercast 0;
		missionNamespace setVariable ["ACE_RAIN_PARAMS",[0,0,60],true];
		missionNamespace setVariable ["ACE_MISC_PARAMS",[0, 0, fogParams, 0.5, 0, 0],true];
		[1] call f_fnc_setWind;
	};
// Light Cloud
	case 2:
	{
		_delay setOvercast 0.3;
		missionNamespace setVariable ["ACE_RAIN_PARAMS",[0,0,60],true];
		missionNamespace setVariable ["ACE_MISC_PARAMS",[0, random 0.2, fogParams, 1.5, 0, 0],true];
		[1] call f_fnc_setWind;
	};
// Overcast
	case 3:
	{
		_delay setOvercast 0.5;
		_delay setRain 0;
		missionNamespace setVariable ["ACE_RAIN_PARAMS",[0,0,60],true];
		missionNamespace setVariable ["ACE_MISC_PARAMS",[0, random 0.2, fogParams, 1.5, 0, 0],true];
		[2] call f_fnc_setWind;
	};
// Light Rain
	case 4:
	{
		_delay setOvercast 0.7;
		_delay setRain 0.3;
		missionNamespace setVariable ["ACE_RAIN_PARAMS",[0,0.5,60],true];
		missionNamespace setVariable ["ACE_MISC_PARAMS",[0, random 0.2, fogParams, 0.5, random 0.5, 0],true];
		[2] call f_fnc_setWind;
	};
// Rain
	case 5:
	{
		_delay setOvercast 0.9;
		_delay setRain 0.7;
		missionNamespace setVariable ["ACE_RAIN_PARAMS",[0,1,60],true];
		missionNamespace setVariable ["ACE_MISC_PARAMS",[0, random 0.6, fogParams, 0.5, random 1.5, 0],true];
		[3] call f_fnc_setWind;
	};
// Storm
	case 6:
	{
		_delay setOvercast 1;
		_delay setRain 1;
		_delay setLightnings 1;
		missionNamespace setVariable ["ACE_RAIN_PARAMS",[0,1,60],true];
		missionNamespace setVariable ["ACE_MISC_PARAMS",[1, 0, fogParams, 0.5, 0, 0],true];
		[5] call f_fnc_setWind;
	};
};

f_param_weather = _weather;
publicVariable "f_param_weather";

diag_log text format["[F3] INFO: Weather %1 in %2s",_weather, _delay];

if (_delay == 0) then { forceWeatherChange; };