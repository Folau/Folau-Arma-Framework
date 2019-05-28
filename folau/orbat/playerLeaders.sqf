/* sleep 2;

[
	configFile >> "CfgORBAT" >> "dogcompany" >> "alpha", 
	"Platoon", 
	"Infantry", 
	"West", 
	"Bingpot", 
	"Bing", 
	"b_air", 
	3,
	"", 
	[0,0,0,1], 
	"TestString", 
	"Corporal", 
	"New Description", 
	[ ["B_MRAP_01_F",1], ["B_MRAP_01_F",1] ] 
]  call BIS_fnc_ORBATSetGroupParams; */


/* 		0: NUMBER or STRING - ID (e.g., 1 to result in "1st", or a specific string)
		1: STRING - size as a class from CfgChainOfCommand > Sizes (e.g., "Platoon")
		2: STRING - type as a class from CfgChainOfCommand > Types (e.g., "Infantry")
		3: STRING - side as a class from CfgChainOfCommand > Sides (e.g., "West")
		4: STRING - name. Passed arguments are: %1 - ID, %2 - type, %3 - size)
		5: STRING - short name. Passed arguments are: %1 - ID, %2 - type, %3 - size)
		6: STRING - texture. Can be link to a file or a class from CfgMarkers
		7: NUMBER - texture size coeficient. 1 is the default size
		8: STRING - insignia displayed in tooltip and in the ORBAT viewer background
		9: ARRAY - texture color in format RGBA
		10: STRING - commander name. Can be the name directly or a class from CfgWorlds > GenericNames
		11: STRING - commander rank.
		12: STRING - description
		13: ARRAY - assets. Items are ARRAYs in format [vehicleClass:STRING,count:NUMBER] */
