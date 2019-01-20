params [_"checkGroup"];

_manType = typeOf leader _checkGroup;

_sniperBool = (["sniper", _manType] call BIS_fnc_inString || ["ghille", _manType] call BIS_fnc_inString);
_spotterBool = ["spotter", _manType] call BIS_fnc_inString;
_officerBool = ["officer", _manType] call BIS_fnc_inString;

if (_sniperBool || _spotterBool || _officerBool) then {
	_specialUnit = 1;
}
else {
	_specialUnit = 0;
};

_specialUnit;