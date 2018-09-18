// F3 Zeus Support - Add Addons
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// DECLARE VARIABLES
private ["_curator","_mode","_addons","_cfgPatches","_class"];

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params [["_unit",objNull],["_mode",[],["",true,[]]]];

// RESOLVE CURATOR VARIABLE
// If the passed unit is not in the list of all curators, check whether the curator is assigned to it

private _curator = getAssignedCuratorLogic _unit;
if (isNull _curator) then { _curator = _unit; };

// If curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	format["[Zeus] Failed to resolve curator for %1", _unit] remoteExec ["systemChat",_unit];
	diag_log text format["[F3] ERROR (f\zeus\fn_zeusAddAddons.sqf): Could not resolve curator properly, is either null or not the correct type. IsNull = %1, _curator type : %2 (should be ModuleCurator_F)",isNull _curator,typeOf _curator];
};

// Decide which addons to add based on passed mode
_addons = [];

switch (typeName _mode) do {
	case "ARRAY";
	case "STRING": {	
			if (_mode isEqualType "") then {
				if (_mode == "basic") then {
					// Load predefined basic modules
					_mode = ["A3_Data_F","A3_Data_F_Curator","A3_Functions_F_Curator","A3_Misc_F","A3_Modules_F_EPB","A3_Ui_F_Curator","A3_Modules_F_Curator","A3_Modules_F_Curator_Misc","CuratorOnly_Modules_F_Curator_Chemlights","CuratorOnly_Modules_F_Curator_Environment","CuratorOnly_Modules_F_Curator_Flares","CuratorOnly_Modules_F_Curator_Ordnance","CuratorOnly_Modules_F_Curator_Smokeshells","A3_Modules_F_Bootcamp","A3_Modules_F_Bootcamp_Misc"];
				} else {
					// Convert to array
					_mode = [_mode];
				};
			};
						
			{
				if (isClass (configFile >> "cfgPatches" >> _x)) then {	
					_addons pushBack (configName (configFile >> "cfgPatches" >>_x));
				};
			} forEach _mode;
		};
	case "BOOL": {	
		if (_mode) then {
			
			// If true was passed, add all available addons to curator list
			_cfgPatches = configFile >> "cfgPatches";

			for "_i" from 0 to (count _cfgPatches - 1) do {
				_class = _cfgPatches select _i;
				if (isClass _class) then {	
					_addons pushBack (configName _class);
				};
			};
		} else {
			removeAllCuratorAddons _curator;
		};
	};
};

// Nothing to add!
if (count _addons == 0) exitWith {};

// Remove existing addons
removeAllCuratorAddons _curator;

//systemChat format["[ZEUS] Addons: %1",_addons];
//diag_log text format["[ZEUS] Addons: %1",_addons];
_curator addCuratorAddons _addons;

format["[Zeus] Added %1 addons",count _addons] remoteExec ["systemChat",_unit];