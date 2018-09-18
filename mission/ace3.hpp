// MEDICAL
// Prevent instant death - 0 = Instant Kills Possible, 1 = No instant kills
class ace_medical_preventInstaDeath {
	value = 1;
	typeName = "BOOL";
};
// Player Damage - What is the damage a player can take before being killed? 1.5 = 150%
class ace_medical_playerdamagethreshold {
	value = 2;
	typeName = "SCALAR";
};
// AI Damage - What is the damage an AI can take before being killed? - 0.75 = 75%
class ace_medical_AIDamageThreshold {
	value = 0.8;
	typeName = "SCALAR";
};
// No broken legs
class ace_medical_healHitPointAfterAdvBandage {
	value = 1;
	typeName = "BOOL";
};
// Enable Overdosing - Enable overdosing of medications
class ace_medical_enableoverdosing {
	value = 1;
	typeName = "BOOL";
};
// Allow PAK (Adv) - Who can use the PAK for full heal? - Anyone = 0, Medics only = 1, Doctors only (Adv) = 2
class ace_medical_medicSetting_PAK {
	value = 1;
	typeName = "SCALAR";
};
// Locations PAK (Adv) - Where can the personal aid kit be used? - Anywhere = 0, Medical Vehicles = 1, Medical facility = 2, Vehicles & facility = 3, Disabled = 4
class ace_medical_useLocation_PAK {
	value = 0;
	typeName = "SCALAR";
};
// Condition PAK (Adv) - When can the PAK be used? -  Any time = 0, Only when Stable = 1
class ace_medical_useCondition_PAK {
	value = 1;
	typeName = "SCALAR";
};
// Remove PAK on use (Adv) - Should PAK be removed on usage? - No = 0, Yes - 1
class ace_medical_consumeItem_PAK {
	value = 1;
	typeName = "BOOL";
};
// Enable Advanced wounds - Allow reopening of bandaged wounds? (Adv only) - No = 0, Yes - 1
class ace_medical_enableAdvancedWounds {
	value = 0;
	typeName = "BOOL";
};
// Allow Surgical kit (Adv) - Who can use the surgical kit? - Anyone = 0, Medics only = 1, Doctors only (Adv) = 2
class ace_medical_medicSetting_SurgicalKit {
	value = 1;
	typeName = "SCALAR";
};
// Locations Surgical kit (Adv) - Where can the Surgical kit be used? - Anywhere = 0, Medical Vehicles = 1, Medical facility = 2, Vehicles & facility = 3, Disabled = 4
class ace_medical_useLocation_SurgicalKit {
	value = 0;
	typeName = "SCALAR";
};
// Condition Surgical kit (Adv) - When can the Surgical kit be used? -  Any time = 0, Only when Stable = 1
class ace_medical_useCondition_SurgicalKit {
	value = 1;
	typeName = "SCALAR";
};
// Remove Surgical kit (Adv) - Should Surgical kit be removed on usage? - No = 0, Yes - 1
class ace_medical_consumeItem_SurgicalKit {
	value = 0;
	typeName = "BOOL";
};
// Enabled for - Select what units the medical system will be enabled for (Adv only) - Players only = 0, Players and AI = 1
class ace_medical_enableFor {
	value = 1;
	typeName = "BOOL";
};

// WEATHER
//class ace_weather_useACEWeather {
//	value = 0;
//	typeName = "BOOL";
//};

// NIGHTVISION
class ace_nightvision_disablenvgswithsights {
	value = 0;
	typeName = "BOOL";
};

// ADVANCED FATIGUE
class ace_advanced_fatigue_recoveryfactor {
	value = 1.6;
	typeName = "SCALAR";
};
class ace_advanced_fatigue_performancefactor {
	value = 1.25;
	typeName = "SCALAR";
};
class ace_advanced_fatigue_loadfactor {
	value = 0.75;
	typeName = "SCALAR";
};
class ace_advanced_fatigue_terrainGradientFactor {
	value = 0.9;
	typeName = "SCALAR";
};

// ACE3 REPSAWN
class ace_respawn_RemoveDeadBodiesDisconnected {
	value = 0;
	typeName = "BOOL";
};

// ACE3 POINTING
class ace_finger_enabled {
	value = 1;
	typeName = "BOOL";
};
class ace_finger_maxrange {
	value = 6;
	typeName = "SCALAR";
};

// CAPTIVES
class ace_captives_requireSurrender {
	value = 0;
	typeName = "BOOL";
};

// MAP
class ace_map_mapShake {
	value = 0;
	typeName = "BOOL";
};

// LOGISTICS
class ace_repair_fullRepairLocation {
	value = 0;
	typeName = "SCALAR";
};
class ace_repair_engineerSetting_fullRepair {
	value = 1;
	typeName = "BOOL";
};
class ace_rearm_level {
	value = 1;
	typeName = "BOOL";
};

// MORTAR
class ace_mk6mortar_airResistanceEnabled {
	value = 0;
	typeName = "BOOL";
};

// UI
class ace_nametags_showVehicleCrewInfo {
	value = 0;
	typeName = "BOOL";
};