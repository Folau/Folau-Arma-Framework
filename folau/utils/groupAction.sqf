
params ["_unit"];

_unit addAction [    
	"<t color='#EA9942'>Join Group</t>", 
	{
		_this joinSilent group cursorTarget;
	},
	[],
	1.5, 
	true, 
	true, 
	"",
	"(cursorTarget distance _this) < 4 && (count units group _this) == 1 && side cursorTarget == side _this && isFormationLeader cursorTarget", // _target, _this, _originalTarget
	50,
	false,
	"",
	""
];
	
/* _unit addAction [    
	"<t color='#EA9942'>Leave Group</t>", 
	{
		_this joinSilent objNull;
	},
	[],
	1.5, 
	true, 
	true, 
	"",
	"(count units group _this) > 1", // _target, _this, _originalTarget
	50,
	false,
	"",
	""
];
 */