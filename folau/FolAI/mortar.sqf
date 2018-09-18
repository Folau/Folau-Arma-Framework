///////////////////////////////////////////////
// FolAI/mortar.sqf
///////////////////////////////////////////////

/*
	Author:			Folau
	Mission:		Generic
	Version:		0.1
	Last edited:	01/03/2018
	
	Description:	Used to make a mortar target specific locations - defence missions

	Parameters:
					this select 0:		unit				mortar group
					this select 1:		location array		locations to be hit
					this select 2: 		cooldown			time between salvos
					this select 3:		cooldown deviation	deviation of the cooldown

	Use:			null = execVM "folau\objectives\defence.sqf"
*/

// Read Parameters
params
	[
		["_unit", null],
		["_positions", null],
		["_cooldown", 265],
		["_cooldown_deviation", 45]
	];

sleep random [_cooldown - _cooldown_deviation, _cooldown, _cooldown + _cooldown_deviation];
_marked = False;

while {alive _unit} do {
	_round_count = random [2, 3, 4];
	_chosen_position = selectRandom _positions;
	
	_nearestunits = nearestObjects [_chosen_position, ["Man","Car","Tank"],25];
	
	if (east countSide _nearestunits > 0 and west countSide _nearestunits < 3) then 
	{
		_unit commandArtilleryFire [_chosen_position, "8Rnd_82mm_Mo_Smoke_white", 1]; // This line doesn't actually work ¯\_(ツ)_/¯
		_unit commandArtilleryFire [_chosen_position, "8Rnd_82mm_Mo_shells", _round_count];
		if ( _marked isEqualTo False ) then {
			_alpha_marker = createMarker["marker1", position _unit];
			"marker1" setMarkerType "hd_dot";
			"marker1" setMarkerText "Mortar Position";
			"marker1" setMarkerColor "ColorRed";
			_marked = True;
			[playerSide, "OPF"] commandChat "Incoming Fire - Type: 83mm mortar -  Detected. New origin position marked.";
		}
		else
		{
			_detect_chance = random [1, 5, 10];
			if (_detect_chance > 4) then {
				[playerSide, "OPF"] commandChat "Incoming Fire - Type: 83mm mortar - Detected. Previous origin position valid.";
			};
		};
		sleep random [_cooldown - _cooldown_deviation, _cooldown, _cooldown + _cooldown_deviation];
		
	}
	else
	{
		sleep 15;
	};
	
};