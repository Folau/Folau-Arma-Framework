fol_var_kia_counter = 0;

scopeName "main";
while {true} do {

	if (fol_var_kia_counter > f_param_kialimit) then {
		'end4' call BIS_fnc_endMissionServer;
		breakOut "main"
	};

	sleep 1;
};