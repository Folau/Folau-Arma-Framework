// Wait until trigger is activated before executing
waitUntil(sleep 1; triggerActivated "trigger1");

// Params
_side = West;
_count = (count units side code);

// While loop to keep checking
while (true) do {
	scopeName "loop1";
	_count = (count units side);
	
	// If units are sufficiently low execute damage/whatever
	if (_count < N) then {
		obj setDamage 1;
		breakOut "loop1";
	};
	sleep 1;
};	