fol_var_kia_counter = 0;
fol_var_kia_limit = 30;

scopeName "main";
while {true} do {

	if (fol_var_kia_counter > fol_var_kia_limit) then {
		'end4' call BIS_fnc_endMissionServer;
		breakOut "main"
	};

	sleep 1;
};