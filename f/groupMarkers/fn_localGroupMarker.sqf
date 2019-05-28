// F3 - Folk Group Markers
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// DECLARE PRIVATE VARIABLES
private ["_grp","_mkr"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:
params ["_grpName","_unused","_mkrType","_mkrText","_mkrColor"];

_grp = missionNamespace getVariable [_grpName,grpNull];

// CREATE MARKER
if !(isNull _grp) then {
	//diag_log format ["fn_localGroupMarker.sqf Creating %1",_grpName];
	while {true} do {
		if (f_param_groupMarkers == 6 && !(("ItemGPS" in (assigneditems player)) || ("B_UavTerminal" in (assigneditems player)) || ("O_UavTerminal" in (assigneditems player)) || ("I_UavTerminal" in (assigneditems player)) || ("C_UavTerminal" in (assigneditems player))))then {
			
			setGroupIconsVisible [False, False]; 
			}
		else
			{
			setGroupIconsVisible [True, False]; 
			clearGroupIcons _grp;
			_mkr = _grp addGroupIcon [_mkrType,[0,0]];
			
			_cnt = count units _grp;
			
			if (_cnt > 4) then {
				_cntMkr = _grp addGroupIcon ["group_2",[0,0]];
			};

			if (_cnt > 2 && _cnt <= 4) then {
				_cntMkr = _grp addGroupIcon ["group_1",[0,0]];
			};

			if (_cnt < 3 && _cnt >= 1) then {
				_cntMkr = _grp addGroupIcon ["group_0",[0,0]];
			};	
				
			_grp setgroupIconParams [_mkrColor,_mkrText,0.8,TRUE];
		};
		sleep 1;
	};
};

/* while {true} do {
	if !(isNil "_cntMkr") then {
		_grp removeGroupIcon _cntMkr;

		_cnt = count units _grp;
		
		if (_cnt > 4) then {
			_cntMkr = _grp addGroupIcon ["group_2",[0,0]];
		};

		if (_cnt > 2 && _cnt <= 4) then {
			_cntMkr = _grp addGroupIcon ["group_1",[0,0]];
		};

		if (_cnt < 3 && _cnt > 1) then {
			_cntMkr = _grp addGroupIcon ["group_0",[0,0]];
		};	
		
		_target removeGroupIcon _cntMkr;
		
		sleep 5;
	};
}; */