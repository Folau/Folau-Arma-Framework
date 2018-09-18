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
	title = "Weather (Locked)";
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
	title = "Fog (Locked)";
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
	title = "Time of Day (Locked)";
	values[] = {0};
	texts[] = {"Mission Default"};

	/* values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
	texts[] = {"Mission Default","1hr to First Light","30m to First Light","First Light","30m after First Light","Morning","Late Morning","Noon","Afternoon","1hr to Last Light","30m to Last Light","Last Light","Night","Midnight","Random"};
	*/
	default = 0;
};
class f_ParamSpacer_title2
{
	title = "---- GAME Options - Immersion ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class f_param_CasualtiesCap		// F3 - Casualty Limit - Can override by calling f_fnc_CasualtiesCapCheck.
{
	title = "System - Casualty Counter - % of dead units";
	values[] = {0,40,50,60,70,80,90};
	texts[] = {"Disabled","40%","50%","60%","70%","80%","90%"};
	default = 70;
};	
class f_param_respawn
{
	title = "System - Respawn";
	values[] = {600};
	texts[] = {"Wave 10 Minutes"};

/* 	values[] = {0,30,60,300,600,900,1200,1,2,5,10};
	texts[] = {"Disabled","Timer 30 Seconds","Timer 1 Minute","Wave 5 Minutes","Wave 10 Minutes","Wave 15 Minutes","Wave 20 Minutes","2 Tickets","3 Tickets","5 Tickets","10 Tickets"};
 */	
	default = 600;
};
class f_param_medical
{
		title = "System - Medical";
		values[] = {6};
		texts[] = {"Farooq (Folau Edit)"};
		default = 6;
};
/*class f_ParamSpacer_title3
/* class f_param_timelimit
{
	title = "Defence Duration";
	values[] = {1800, 2700, 3600}; // 1800, 2700, 3600
	texts[] = {"Short (30 Minutes)", "Medium (45 Minutes)", "Long (60 Minutes)"};
	default = 1800;
}; */

// Optional below for timed missions - be sure to add to briefing.
/* {
	title = "---- GAME Options - Difficulty ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class f_param_timelimit
{
	title = "Time Limit";
	values[] = {1800, 2700, 3600, 59940}; // 1800, 2700, 3600
	texts[] = {"Dream Team (30 Minutes)", "Hard (45 Minutes)", "Medium (60 Minutes)", "Easy (None)"};
	default = 3600;
}; */