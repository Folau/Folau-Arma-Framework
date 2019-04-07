// Slammer ATGM Add

params
[
	"_tank"
];

// hint "INITIALISING";

_turretPaths = allTurrets _tank;

_tank addMagazineTurret ["2Rnd_GAT_missiles", [0], 2];
_tank addMagazineTurret ["2Rnd_GAT_missiles", [0], 2];		
_tank addWeaponTurret ["missiles_titan", [0]];

//_mortar = "I_static_AT_F" createVehicle position _tank;
//_mortar lock 2;
//_mortar attachTo [_tank, [0, 0, 3], "vez" ]; 

//_mortar enableWeaponDisassembly false;
// _tank addMagazines ["4Rnd_120mm_LG_cannon_missiles", 1]; 

//hint format["%1", _turretPaths];

/* _tank addWeaponTurret ["Laserdesignator_vehicle", [0,0]];
_tank addMagazineTurret ["Laserbatteries", [0,0]];

_tank enableVehicleSensor ["LaserSensorComponent" , True];
_tank enableVehicleSensor ["DataLinkSensorComponent" , True];

_sensors = listVehicleSensors (_tank);
// hint str _sensors;

[_tank, [0]] enableInfoPanelComponent ["SensorsDisplayComponent", "SensorDisplay", true];
[_tank, [0,0]] enableInfoPanelComponent ["SensorsDisplayComponent", "SensorDisplay", true]; */