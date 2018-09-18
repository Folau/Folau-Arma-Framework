
// Set up the time limit trigger
_trg = createTrigger ["EmptyDetector", [0,0,0]];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trg setTriggerArea [100000, 100000, 100000, false];
_trg setTriggerTimeout [f_param_timelimit, f_param_timelimit, f_param_timelimit, false];
_trg setTriggerStatements ["this", "'end5' call BIS_fnc_endMissionServer", ""]