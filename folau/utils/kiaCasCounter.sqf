// Preallocate - might not be required...
{
	_x params ["_sideVar","_markerVar"];
	missionNamespace setVariable [format["f_var_casualtyCount_%1",_sideVar],0,true];
	missionNamespace setVariable [format["fol_var_kia_counter_%1",_sideVar],0,true];
	// _markerVar setMarkerText format["Casualties: %1, KIA: %2",0,0];
	
} forEach [
	[west,"respawn_west"],
	[east,"respawn_east"],
	[resistance,"respawn_guerrila"],
	[civilian,"respawn_civilian"]
];

// Check if casualty/KIA caps have been reached for each side		
while {true} do {
	scopeName "main";
	{
		_x params ["_sideVar"];
		
		_casVar = missionNamespace getVariable [format["f_var_casualtyCount_%1",_sideVar],0];
		_kiaVar = missionNamespace getVariable [format["fol_var_kia_counter_%1",_sideVar],0];
		
		if (_casVar > f_param_caslimit) then {
			'end4' call BIS_fnc_endMissionServer;
			breakOut "main"
		};				
		
		if (_kiaVar > f_param_kialimit) then {
			'end4' call BIS_fnc_endMissionServer;
			breakOut "main"
		};
		
	} forEach [west, east, resistance, civilian];
	
	sleep 1;
};