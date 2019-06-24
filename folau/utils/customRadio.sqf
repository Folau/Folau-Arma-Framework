/* 
Name: 		Custom Radio Channels Script
Author: 	Folau
Date:		15th December 2018

Description:

Credit to tonic-_- for the majority of this work:

https://forums.bohemia.net/forums/topic/152785-scripting-radio-channel-for-arma-3/


 */

2 enableChannel [false, false];

if(isServer) then
	{
	radio_channel_1 = radioChannelCreate [[0, 0.95, 1, 0.8], "Radio One", "%UNIT_NAME", []];
	radio_channel_2 = radioChannelCreate [[0, 0.95, 1, 0.8], "Radio Two", "%UNIT_NAME", []];
	radio_channel_3 = radioChannelCreate [[0, 0.95, 1, 0.8], "Radio Three", "%UNIT_NAME", []];

	RADIO_fnc_manage =
	{
		private["_unit","_channel","_bool"];
		_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
		_bool = [_this,1,false,[false]] call BIS_fnc_param;
		_channel = [_this,2,0,[0]] call BIS_fnc_param;

		//Series of checks?
		if(isNull _unit) exitWith {}; //Null unit
		if(_channel < 1) exitWith {}; //No channels below 1 should be passed.

		switch (_channel) do
		{
			case 1: { if(_bool) then {radio_channel_1 radioChannelAdd [_unit];} else {radio_channel_1 radioChannelRemove [_unit];};};
			case 2: { if(_bool) then {radio_channel_2 radioChannelAdd [_unit];} else {radio_channel_2 radioChannelRemove [_unit];};};
			case 3: { if(_bool) then {radio_channel_3 radioChannelAdd [_unit];} else {radio_channel_3 radioChannelRemove [_unit];};};
		};
	};
};

while {true} do { 
	{
		_var = _x getVariable ["radioOperator",-1];
		
		if (_var != -1) then 
		{		
			[[_x,true,1],"RADIO_fnc_manage",false,false] spawn BIS_fnc_MP;
		}; 

	} forEach allUnits;
	
	sleep 5;
	
};