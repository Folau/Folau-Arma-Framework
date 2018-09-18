// Zeus - Attachment Choices
// Credits: TAWTonic @TAW for their config parser.
// ====================================================================================
// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!hasInterface || isNil "f_sqf_orbat" || missionNamespace getVariable ["f_param_virtualArsenal",0] == 1) exitWith {};
if (!isDedicated && (isNull player)) then {waitUntil {sleep 0.1; !isNull player};};
if ("ace_main" in activatedAddons) then {
	waitUntil{(player getVariable ["f_var_assignGear_done", false]) && (player getVariable ["f_var_ACEclientInitDone", false])};
} else {
	waitUntil{(player getVariable ["f_var_assignGear_done", false])};
};

_text = "<br/><font size='18' color='#FF7F00'>LOADOUT SELECTION</font><br/><br/>
You may change your gear from the standard load-out using the selections below. The default kit for your unit class is the first item in the list.<br/>
<br/>
You may not change equipment in the field!<br/>
<br/>
<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[player,true] call f_fnc_tidyGear;"">Night Gear</execute></font><font size='16'>]</font><br/>Quickly prep your kit for a night operation; removes any basic smoke grenades in the inventory.<br/>
<br/>
<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[player,false] call f_fnc_tidyGear;"">Daytime Gear</execute></font><font size='16'>]</font><br/>Quickly prep your kit for a day operation; removes any NVG Equipment, flares and chems in the inventory.<br/>
<br/>";

if (primaryWeapon player == "") exitWith {};

if (isNil "f_fnc_magazineCheck") then { f_fnc_magazineCheck = compileFinal preprocessFileLineNumbers "f\assignGear\fn_magazineCheck.sqf"; };
if (isNil "f_fnc_tidyGear") then { f_fnc_tidyGear = compileFinal preprocessFileLineNumbers "f\assignGear\fn_tidyGear.sqf"; };

private _gearVar = format["f_var_%1_%2_gear",side player, player getVariable ["f_var_assignGear","r"]];
private _handVar = [missionNamespace getVariable [format["f_var_%1_gear_smokeTH",side player],[]], missionNamespace getVariable [format["f_var_%1_gear_flareTH",side player],[]]];
private _launcherVar = [missionNamespace getVariable [format["f_var_%1_gear_smokeGL",side player],[]], missionNamespace getVariable [format["f_var_%1_gear_flareGL",side player],[]]];
private _grenadeVar = [missionNamespace getVariable [format["f_var_%1_gear_grenade",side player],[]]];
private  _stringFilter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_- .,";

// Gets the picture from the relevant config
_fnc_itemPicture = {
	params ["_item",["_wide",100]];
	
	private _pictureCfg = switch (true) do {
			case (getText (configFile >> "CfgWeapons" >> _item >> "picture") != ""):   { getText (configFile >> "CfgWeapons" >> _item >> "picture") };
			case (getText (configFile >> "CfgMagazines" >> _item >> "picture") != ""): { getText (configFile >> "CfgMagazines" >> _item >> "picture") };
			case (getText (configFile >> "CfgVehicles" >> _item >> "picture") != ""):  { getText (configFile >> "CfgVehicles" >> _item >> "picture") };
			case (getText (configFile >> "CfgGlasses" >> _item >> "picture") != ""):   { getText (configFile >> "CfgGlasses" >> _item >> "picture") };
			default { nil };
		};

	if (isNil "_pictureCfg") exitWith {""};	
	if (_pictureCfg find "." > 1) exitWith { format["<img image='%1' width='%2'/>",_pictureCfg,_wide]; };
	if (count _pictureCfg > 6) then { format["<img image='%1' width='%2'/>",_pictureCfg + ".paa",_wide]; };
	""
};

// Gets item texts
_fnc_itemText = {
	params ["_item"];
	private _dlcText = "";
	
	if (!(332350 in (getDLCs 1)) && getText (configFile >> "CfgWeapons" >> _item >> "DLC") == "Mark") then {_dlcText = " [DLC]";};
	if (!(395180 in (getDLCs 1)) && getText (configFile >> "CfgWeapons" >> _item >> "DLC") == "Expansion") then {_dlcText = " [APEX]";};
	
	format["<font size='16'>%1</font><font size='16' color='#FF7F00'>%2</font><br/><font color='#777777'>%3</font>",
		getText (configFile >> "CfgWeapons" >> _item >> "displayName"),
		_dlcText,
		getText (configFile >> "CfgWeapons" >> _item >> "descriptionShort")];
};

// Returns true if the player is at the starting point, or nearby.
f_fnc_inStartLocation = {
	// Player has 5 minutes set-up time if Co-Op.
	if (time < 1 || (time < 300 && toUpper (getText ((getMissionConfig "Header") >> "gameType")) == "COOP")) exitWith {true};
	
	private _playerRespawn = switch (side group player) do {
			case west: {"respawn_west"};
			case east: {"respawn_east"};
			case independent: {"respawn_guerrila"};
			default {"respawn_civilian"};
		};
		
	private _distance = if (getMarkerColor _playerRespawn != "") then { player distance2D getMarkerPos _playerRespawn; } else { 10 };

	if (_distance < 150) exitWith {true};
	
	systemChat format["[GEAR] Disabled - Too far from start point (%1m)",round _distance];
	false
};

// Adds or removes a chosen item to the maximum allowed value (Grenades etc).
f_fnc_addMagazineItem = {
	params ["_item","_willAdd","_itemNoMax"];
	
	if !([] call f_fnc_inStartLocation) exitWith {};
	
	private _itemTypeArr = [];
	
	if (_item in f_var_signalGType) then { _itemTypeArr = f_var_signalGType; };
	if (_item in f_var_signalHType) then { _itemTypeArr = f_var_signalHType; };
	if (_item in f_var_signalLType) then { _itemTypeArr = f_var_signalLType; };
	if (count _itemTypeArr == 0) then { _itemTypeArr = [_item]};
		
	if (_willAdd) then {
		if ({_x in _itemTypeArr} count (magazines player) == _itemNoMax) exitWith {
			systemChat format['[GEAR] Cannot add %1 - Limit reached (%2).', getText (configFile >> "CfgMagazines" >> _item >> "displayName"), _itemNoMax];
		};
	
		if (player canAdd _item) then {
			player addMagazine _item; 
			systemChat format['[GEAR] Added %1 - %2 Total (%3/%4)', 
				getText (configFile >> "CfgMagazines" >> _item >> "displayName"), 
				{_x == _item} count (magazines player),
				{_x in _itemTypeArr} count (magazines player),
				_itemNoMax];
		} else {
			systemChat format['[GEAR] Cannot add %1 - No space', getText (configFile >> "CfgMagazines" >> _item >> "displayName"), _itemNoMax];
		};
	} else {
		if !(_item in magazines player) exitWith {};
		
		player removeMagazine _item; 
		systemChat format['[GEAR] Removed %1 - %2 Remaining (%3/%4)',
			getText (configFile >> "CfgMagazines" >> _item >> "displayName"),
			{_x == _item} count (magazines player),
			{_x in _itemTypeArr} count (magazines player),
			_itemNoMax];
	};
};

// Shows the count of items in the provided list (Grenades etc).
f_fnc_matchingItem = {
	params ["_itemTypeArr"];
	
	private _counter = 1;
	
	systemChat format["[GEAR] ------- Inventory: %1 Matching Items -------",{_x in _itemTypeArr } count (magazines player)];
	{
		private _checkItem = _x;
		private _itemCount = {_x == _checkItem} count magazines player;
		
		if (_itemCount > 0) then {
			systemChat format["[GEAR] Item #%1 - %2x %3",_counter,_itemCount,getText (configFile >> "CfgMagazines" >> _checkItem >> "displayName")];
			_counter = _counter + 1;
		};
	} forEach _itemTypeArr;
};

// ========================
// Primary
{
	_x params ["_varID","_titleStr","_codeStr"];
	
	private _tempText = "";
	private _gearArr = missionNamespace getVariable [format["%1%2",_gearVar,_varID],[]];
	
	// Remove 'Equip' option if only one item
	if (count _gearArr == 1) then {_codeStr = ""};

	{
		_tempText = _tempText + format["%3<br/>" + _codeStr + "%4<br/><br/>",
		_x,
		[getText (configFile >> "CfgWeapons" >> _x >> "displayName"),_stringFilter] call BIS_fnc_filterString,
		if (_varID in [1,4]) then {[_x,200] call _fnc_itemPicture} else {[_x] call _fnc_itemPicture},
		[_x] call _fnc_itemText];
	} forEach _gearArr;

	if (_tempText != "") then {
		_text = _text + _titleStr + _tempText;
	};
} forEach [
	[1, "<br/><font size='18' color='#FF7F00'>PRIMARY WEAPON</font><br/><font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[getArray(configFile >> 'CfgWeapons' >> (primaryWeapon player) >> 'magazines')] call f_fnc_matchingItem"">Current Primary Magazines</execute></font><font size='16'>]</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' == primaryWeapon player) then {
				_tempItems = primaryWeaponItems player;
				[player,primaryWeapon player,'%1'] call f_fnc_magazineCheck;
				player removeWeapon (primaryWeapon player); 
				[player, '%1', 1] call BIS_fnc_addWeapon;
				{player addPrimaryWeaponItem _x} forEach _tempItems;
				player selectWeapon primaryWeapon player;
				systemChat '[GEAR] Equipped weapon %2.';
				f_var_selectPrimary = false;
			} else {systemChat '[GEAR] You have already equipped this weapon.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[301, "<br/><font size='18' color='#FF7F00'>ATTACHMENT - POINTERS</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' in primaryWeaponItems player) then {
				player addPrimaryWeaponItem '%1';
				systemChat '[GEAR] Equipped item %2.';
				f_var_selectPointer = false;
			} else {systemChat '[GEAR] You have already equipped this item.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[201, "<br/><font size='18' color='#FF7F00'>ATTACHMENT - OPTICS</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' in primaryWeaponItems player) then {
				player addPrimaryWeaponItem '%1';
				systemChat '[GEAR] Equipped item %2.';
				f_var_selectOptic = false;
			} else {systemChat '[GEAR] You have already equipped this item.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[101, "<br/><font size='18' color='#FF7F00'>ATTACHMENT - MUZZLE</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' in primaryWeaponItems player) then {
				player addPrimaryWeaponItem '%1';
				systemChat '[GEAR] Equipped item %2.';
				f_var_selectMuzzle = false;
			} else {systemChat '[GEAR] You have already equipped this item.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[302, "<br/><font size='18' color='#FF7F00'>ATTACHMENT - UNDERBARREL</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' in primaryWeaponItems player) then {
				player addPrimaryWeaponItem '%1';
				systemChat '[GEAR] Equipped item %2.';
				f_var_selectUnderBarrel = false;
			} else {systemChat '[GEAR] You have already equipped this item.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[4, "<br/><font size='18' color='#FF7F00'>SECONDARY WEAPON</font><br/><font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[getArray(configFile >> 'CfgWeapons' >> (secondaryWeapon player) >> 'magazines')] call f_fnc_matchingItem"">Current Secondary Magazines</execute></font><font size='16'>]</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' == secondaryWeapon player) then {
				_tempItems = secondaryWeaponItems player;
				player removeWeapon (secondaryWeapon player); 
				[player, '%1', 1, 1] call BIS_fnc_addWeapon;
				{player addSecondaryWeaponItem _x} forEach _tempItems;
				systemChat '[GEAR] Equipped launcher %2.';
				f_var_selectSecondary = false;
			} else {systemChat '[GEAR] You have already equipped this launcher.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[2, "<br/><font size='18' color='#FF7F00'>HANDGUN WEAPON</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' == handgunWeapon player) then {
				_tempItems = handgunItems player;
				player removeWeapon (handgunWeapon player); 
				[player, '%1', 1, 0] call BIS_fnc_addWeapon;
				{player addHandgunItem _x} forEach _tempItems;
				systemChat '[GEAR] Equipped handgun %2.';
				f_var_selectHandgun = false;
			} else {systemChat '[GEAR] You have already equipped this handgun.'};
		};"">Equip</execute></font><font size='16'>] </font>"],
	[4096, "<br/><font size='18' color='#FF7F00'>OTHER ITEMS</font><br/><br/>",
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {
			if !('%1' in (assignedItems player)) then {
				player addWeapon '%1';
				systemChat '[GEAR] Equipped item %2.';
				f_var_selectOther = false;
			} else {systemChat '[GEAR] You have already equipped this item.'};
		};"">Equip</execute></font><font size='16'>] </font>"]
	];

// ========================
// Grenades
private _textGR = "";
f_var_signalGType = (_grenadeVar select 0);
f_var_signalGMax = {_x in f_var_signalGType } count (magazines player);

if (f_var_signalGMax > 0) then {
	{
		if (count _x > 0) then {
			{
					_textGR = _textGR + format["%3<br/><font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""['%1',true,f_var_signalGMax] call f_fnc_addMagazineItem;"">Add</execute></font><font size='16'>] [</font><font size='16' color='#66B2FF'><execute expression=""['%1',false,f_var_signalGMax] call f_fnc_addMagazineItem;"">Remove</execute></font><font size='16'>] %2</font><br/><font color='#777777'>%4</font><br/><br/>",
					_x,
					[getText (configFile >> "CfgMagazines" >> _x >> "displayName"),_stringFilter] call BIS_fnc_filterString,
					[_x,30] call _fnc_itemPicture,
					getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort")];
			} forEach _x;
		};
	} forEach _grenadeVar;
};

if (_textGR != "") then {
	
	_text = _text + format["<br/><font size='18' color='#FF7F00'>GRENADES (%1 Maximum)</font><br/>Swap out your grenades for a different type, or remove them entirely to reduce your weight.<br/><br/>",f_var_signalGMax] + 
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[f_var_signalGType] call f_fnc_matchingItem"">Current Grenades</execute></font><font size='16'>]</font><br/><br/>" + _textGR;
};

// ========================
// Thrown Signal Items
private _textTS = "";

f_var_signalHType = (_handVar select 0) + (_handVar select 1);
f_var_signalHMax = {_x in f_var_signalHType } count (magazines player);

if (f_var_signalHMax > 0) then {
	private _irGrenade = switch (true) do {
			case ("B_IR_Grenade" in magazines player): {"B_IR_Grenade"};
			case ("O_IR_Grenade" in magazines player): {"O_IR_Grenade"};
			case ("I_IR_Grenade" in magazines player): {"I_IR_Grenade"};
			case ("ACE_IR_Strobe_Item" in items player): {""};
			default {switch (side group player) do { case west: {"B_IR_Grenade"}; case east: {"O_IR_Grenade"}; default {"I_IR_Grenade"};};};
		};
		
	if (_irGrenade != "") then {(_handVar select 1) pushBackUnique _irGrenade};

	{
		if (count _x > 0) then {
			{
					_textTS = _textTS + format["%3 <font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""['%1',true,f_var_signalHMax] call f_fnc_addMagazineItem;"">Add</execute></font><font size='16'>] [</font><font size='16' color='#66B2FF'><execute expression=""['%1',false,f_var_signalHMax] call f_fnc_addMagazineItem;"">Remove</execute></font><font size='16'>] %2</font><br/>",
					_x,
					[getText (configFile >> "CfgMagazines" >> _x >> "displayName"),_stringFilter] call BIS_fnc_filterString,
					[_x,30] call _fnc_itemPicture,
					getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort")];
			} forEach _x;
		};
	} forEach _handVar;
};

if (_textTS != "") then {
	_text = _text + format["<br/><font size='18' color='#FF7F00'>SIGNALLING - HAND-HELD (%1 Maximum)</font><br/>Change your signalling items for more useful ones, or remove them entirely to reduce your weight.<br/><br/>",f_var_signalHMax] + 
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[f_var_signalHType] call f_fnc_matchingItem"">Current Hand-Held Items</execute></font><font size='16'>]</font><br/><br/>" + _textTS;
};

// ========================
// GL Items
private _textGL = "";
f_var_signalLType = (_launcherVar select 0) + (_launcherVar select 1);
f_var_signalLMax = {_x in f_var_signalLType } count (magazines player);
	
// Skip if the player doesn't have GLs
if (f_var_signalLMax > 0) then {
	{
		if (count _x > 0) then {
			{
					_textGL = _textGL + format["%3 <font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""['%1',true,f_var_signalLMax] call f_fnc_addMagazineItem;"">Add</execute></font><font size='16'>] [</font><font size='16' color='#66B2FF'><execute expression=""['%1',false,f_var_signalLMax] call f_fnc_addMagazineItem;"">Remove</execute></font><font size='16'>] %2</font><br/>",
					_x,
					[getText (configFile >> "CfgMagazines" >> _x >> "displayName"),_stringFilter] call BIS_fnc_filterString,
					[_x,30] call _fnc_itemPicture,
					getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort")];
			} forEach _x;
		};
	} forEach _launcherVar;
};

if (_textGL != "") then {
	_text = _text + format["<br/><br/><font size='18' color='#FF7F00'>SIGNALLING - GRENADE LAUNCHED (%1 Maximum)</font><br/>Swap out your launcher signalling items for more useful ones, or remove them entirely to reduce your weight.<br/><br/>",f_var_signalLMax] + 
		"<font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""[f_var_signalLType] call f_fnc_matchingItem"">Current GL Items</execute></font><font size='16'>]</font><br/><br/>" + _textGL;
};

// ========================
// Uniform
private _textUN = "";

// Glasses
if (goggles player != "") then {
	_textUN = _textUN + format["%3 <font size='16'>[</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if (goggles player != '%1') then {systemChat '[GEAR] Equipped %2'; player addGoggles '%1';} else {systemChat '[GEAR] Already Equipped %2';};};"">Add</execute></font><font size='16'>] [</font><font size='16' color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if (goggles player != '') then {systemChat '[GEAR] Removed %2'; removeGoggles player;};};"">Remove</execute></font><font size='16'>] %2</font><br/>",
		goggles player,
		[getText (configFile >> "CfgGlasses" >> (goggles player) >> "displayName"),_stringFilter] call BIS_fnc_filterString,
		[goggles player,30] call _fnc_itemPicture];
};

/*if (count (missionNamespace getVariable [format["f_var_%1_gear_glasses",side player],[]]) > 0) then {
	private _textTmp = "";
	{		
		_textTmp = _textTmp + format["%3 [<font color='#66B2FF'><execute expression=""if (goggles player != '%1') then {systemChat '[GEAR] Equipped %2'; player addGoggles '%1';} else {systemChat '[GEAR] Already Equipped';};"">Add</execute></font>] [<font color='#66B2FF'><execute expression=""if (goggles player != '') then {systemChat '[GEAR] Removed'; removeGoggles player;};"">Remove</execute></font>] %2<br/>",
		_x,
		[getText (configFile >> "CfgGlasses" >> _x >> "displayName"),_stringFilter] call BIS_fnc_filterString,
		[_x,30] call _fnc_itemPicture];
	} forEach (missionNamespace getVariable format["f_var_%1_gear_glasses",side player]);
	
	_textUN = _textUN + _textTmp + "<br/><br/>";
};*/

if (headgear player != "") then { _textUN = _textUN + format["%2 %1<br/>",getText (configFile >> "CfgWeapons" >> (headgear player) >> "displayName"),[headgear player,40] call _fnc_itemPicture]; };
if (uniform player != "") then { _textUN = _textUN + format["%3 %1 <font size='16' color='#777777'>(%2&#37;)</font><br/>",getText (configFile >> "CfgWeapons" >> (uniform player) >> "displayName"),round (100*loadUniform player),[uniform player,40] call _fnc_itemPicture]; };
if (vest player != "") then { _textUN = _textUN + format["%3 %1 <font size='16' color='#777777'>(%2&#37;)</font><br/>",getText (configFile >> "CfgWeapons" >> (vest player) >> "displayName"), round (100*loadVest player),[vest player,40] call _fnc_itemPicture]; };
if (backpack player != "") then { _textUN = _textUN + format["%3 %1 <font size='16' color='#777777'>(%2&#37;)</font><br/>",getText (configFile >> "CfgVehicles" >> (backpack player) >> "displayName"), round (100*loadBackpack player),[backpack player,40] call _fnc_itemPicture]; };

if (_textUN != "") then {
		_text = _text + "<br/><br/><font size='18' color='#FF7F00'>UNIFORM (%FULL)</font><br/><br/>" + _textUN;
};

// ========================
// Misc Items
// Add lines for all other items
_text = _text + "<br/><br/><font size='18' color='#FF7F00'>MISC ITEMS (#):</font><br/>";

{
	_x params ["_item","_count"];	
	private _code = "";
	
	// Handle IR Grenades
	if (toLower _item == "ace_ir_strobe_item") then {
		f_var_gearIRMax = _count;
		_code = format["[<font color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if ({_x == '%1'} count items player < f_var_gearIRMax) then {systemChat '[GEAR] Added %2'; player addItem '%1';};};"">Add</execute></font>] [<font color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if ({_x == '%1'} count items player > 0) then {systemChat '[GEAR] Removed %2'; player removeItem '%1';};};"">Remove</execute></font>]",_item,[getText (configFile >> "CfgWeapons" >> _item >> "displayName"),_stringFilter] call BIS_fnc_filterString];
	};
	
	// Handle Flashlights
	if (toLower _item in ["ace_flashlight_xl50","ace_flashlight_ksf1","ace_flashlight_mx991"]) then {
		_code = format["[<font color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if !('%1' in items player) then {systemChat '[GEAR] Equipped %2'; player addItem '%1';};};"">Add</execute></font>] [<font color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if ('%1' in items player) then {systemChat '[GEAR] Removed %2'; player removeItem '%1';};};"">Remove</execute></font>]",_item,[getText (configFile >> "CfgWeapons" >> _item >> "displayName"),_stringFilter] call BIS_fnc_filterString];
	};	
	
	_text = _text + format["%3 %4 %1 <font color='#777777'>%2</font><br/>",getText (configFile >> "CfgWeapons" >> _item >> "displayName"),if (_count > 1) then {"(" + str _count + ")"} else {""},[_item,30] call _fnc_itemPicture,_code];
} forEach ((items player) call BIS_fnc_consolidateArray);

{
	private _code = "";
	// Handle NVGs
	if (toLower getText (configFile >> "CfgWeapons" >> _x >> "simulation") isEqualTo "nvgoggles") then {
		_code = format["[<font color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if !('%1' in assignedItems player) then {systemChat '[GEAR] Equipped %2'; player linkItem '%1';};};"">Add</execute></font>] [<font color='#66B2FF'><execute expression=""if ([] call f_fnc_inStartLocation) then {if ('%1' in assignedItems player) then {systemChat '[GEAR] Removed %2'; player unlinkItem '%1';};};"">Remove</execute></font>]",_x,[getText (configFile >> "CfgWeapons" >> _x >> "displayName"),_stringFilter] call BIS_fnc_filterString];
	};	
	_text = _text + format["%2 %3 %1<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayName"),[_x,30] call _fnc_itemPicture,_code];
} forEach (assignedItems player - ["Rangefinder","Binocular","Laserdesignator","ACE_Vector"]);

// ========================
// DONE!
// ========================

if (missionNamespace getVariable["f_param_debugMode",0] == 1) then {diag_log text "[F3] DEBUG (f_showLoadoutSelect.sqf): Loaded!"};

// ADD DIARY SECTION
waitUntil {scriptDone f_sqf_orbat};
_att = player createDiaryRecord ["diary", [format["Loadout (%1)",name player], _text]];