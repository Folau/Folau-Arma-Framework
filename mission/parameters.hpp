class f_ParamSpacer_title
{
	title = "---- ADMIN Options - System -----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class f_param_debugMode			// F3 - Debug Mode
{
	title = "Debug Testing";
	values[] = {0,1};
	texts[] = {"Off","On"};
	default = 0;
};
class f_param_caching			// F3 - Caching
{
	title = "Cache AI";
	values[] = {0,600,800,1000,1500,2000};
	texts[] = {"Off","Outside 600m","Outside 800m","Outside 1km","Outside 1.5km","Outside 2km"};
	default = 1500;
};
class f_param_virtualArsenal
{
		title = "Virtual Arsenal";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
};
class f_ParamSpacer_title1
{
	title = "---- GAME Options - Environment ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class f_param_weather
{
	title = "Weather";
	values[] = {0};
	texts[] = {"Mission Default"};
	/*
	values[] = {0,1,2,3,4,5,6,7};
	texts[] = {"Mission Default","Calm","Light Cloud","Overcast","Light Rain","Rain","Storm","Random"};
	*/
	default = 0;
};
class f_param_fog
{
	title = "Fog";
	values[] = {0};
	texts[] = {"Mission Default"};
	/*
	values[] = {0,1,2,3,4};
	texts[] = {"Mission Default","None","Light","Heavy","Random"};
	*/
	default = 0;

};
class f_param_timeOfDay
{
	title = "Time of Day";
	values[] = {0};
	texts[] = {"Mission Default"};

	/* values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
	texts[] = {"Mission Default","1hr to First Light","30m to First Light","First Light","30m after First Light","Morning","Late Morning","Noon","Afternoon","1hr to Last Light","30m to Last Light","Last Light","Night","Midnight","Random"};
	*/
	default = 0;
};

class f_ParamSpacer_title2
{
	title = "---- GAME Options - Medical ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};

class f_param_medical
{
		title = "Medical System";
		values[] = {6};
		texts[] = {"Folau Medical"};
		default = 6;
};

class f_param_kiaChance
{
		title = "High-Damage KIA Chance (Folau Medical)";
		values[] = {0, 10, 25, 50, 100};
		texts[] = {"None", "Low", "Normal", "High", "Always"};
		default = 25;
};

class f_param_bleedout
{
	title = "Bleedout Timer";
	values[] = {60, 120, 180, 300, 600};
	texts[] = {"1 Minute", "2 Minutes", "3 Minutes", "5 Minutes", "10 Minutes"};
	default = 180;
};

class f_param_CasualtiesCap		// F3 - Casualty Limit - Can override by calling f_fnc_CasualtiesCapCheck.
{
	title = "Casualty Counter - % of dead units";
	values[] = {0,40,50,60,70,80,90};
	texts[] = {"Disabled","40%","50%","60%","70%","80%","90%"};
	default = 70;
};
class f_param_jipTeleport
{
		title = "JIP / Respawn Teleport";
		values[] = {0, 1, 2, 3};
		texts[] = {"Disable", "AddAction Only", "FlagPole Only", "Both"};
		default = 1;
};

class f_param_respawn
{
	title = "Respawn";
	values[] = {600};
	texts[] = {"Wave 10 Minutes"};

/* 	values[] = {0,30,60,300,600,900,1200,1,2,5,10};
	texts[] = {"Disabled","Timer 30 Seconds","Timer 1 Minute","Wave 5 Minutes","Wave 10 Minutes","Wave 15 Minutes","Wave 20 Minutes","2 Tickets","3 Tickets","5 Tickets","10 Tickets"};
 */	
	default = 600;
};

class f_ParamSpacer_title4
{
	title = "---- GAME Options - Difficulty ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};

class f_param_aiSkill
{
	title = "AI Skill";
	values[] = {4, 5, 6, 7, 8};
	texts[] = {"Reserve (0.4)", "Regular (0.5)", "Hardened (0.6)", "Veteren (0.7)", "Elite (0.8)"};
	default = 5;
};

/* class f_param_defenceTimelimit
{
	title = "Defence Duration";
	values[] = {1800, 2700, 3600}; // 1800, 2700, 3600
	texts[] = {"Short (30 Minutes)", "Medium (45 Minutes)", "Long (60 Minutes)"};
	default = 1800;
}; */

class f_param_kialimit
{
	title = "KIA Limit";
	values[] = {20, 30, 40, 50};
	texts[] = {"Low (20)", "Normal (30)", "High (40)", "Very High (50)"};
	default = 30;
};

class f_param_timelimit
{
	title = "Time Limit (leave NONE if not set)";
	values[] = {1800, 2700, 3600, 0}; // 1800, 2700, 3600
	texts[] = {"30 Minutes", "45 Minutes", "60 Minutes", "None"};
	default = 0;
	
};

class f_ParamSpacer_title3
{
	title = "---- GAME Options - Immersion (Initial Options Advised) ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};

class f_param_artilleryComputer
{
		title = "Artillery Computer";
		values[] = {0, 1};
		texts[] = {"Disabled", "Enabled"};
		default = 0;
};

class f_param_fireTeamMarkers
{
		title = "Fire Team Markers";
		values[] = {0, 1};
		texts[] = {"Disabled", "Enabled"};
		default = 0;
};

class f_param_groupMarkers
{
		title = "Group Markers";
		values[] = {0, 1, 2, 3, 4, 5};
		texts[] = {"Disable", "On Map", "On Map + Screen", "Map + Squad Stats", "Commander Map Only", "Commander Map + Squad Stats"};
		default = 4;
};

class f_param_lawsOfWar
{
		title = "Laws of War";
		values[] = {0, 1};
		texts[] = {"Disabled", "Enabled"};
		default = 1;
};

class f_param_looting
{
		title = "Looting Enemy";
		values[] = {0, 1};
		texts[] = {"Disabled", "Enabled"};
		default = 0;
};

class f_param_shiftClick
{
		title = "Shift-Click Waypoints";
		values[] = {0, 1};
		texts[] = {"Disabled", "Enabled"};
		default = 0;
};

class f_param_thirdPerson
{
		title = "Third Person";
		values[] = {2, 1, 0};
		texts[] = {"Disabled", "Vehicles Only", "Enabled"};
		default = 2;
};


