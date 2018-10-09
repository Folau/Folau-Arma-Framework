_ref_gap = player createDiarySubject ["gap", ""];
_ref_page = player createDiarySubject ["refPage", "Reference Material"];

// The code below creates the execution sub-section of notes.
_spacer = player createDiaryRecord ["refPage", ""];

_mortarRangeTable = player createDiaryRecord ["refPage", ["Mortar Range Table", "
<br/><font size='20'>82mm MORTAR RANGE TABLE</font>
<br/><font size='15' color='#72E500'>Range         ->     Charge Type | Elevation       Travel Time | Spread Radius</font>
<br/>
<br/><font color='#A7A7A7'>50m             ->              close    |   87.13                   14s        |        14m</font>
<br/>100m           ->              close    |   84.23                   14s        |        14m
<br/><font color='#A7A7A7'>150m           ->              close    |   81.26                   14s        |        13m</font>
<br/>200m           ->              close    |   78.20                   13s        |        13m
<br/><font color='#A7A7A7'>250m           ->              close    |   74.98                   13s        |        13m</font>
<br/>300m           ->              close    |   71.54                   13s        |        13m
<br/><font color='#A7A7A7'>350m           ->              close    |   67.76                   13s        |        13m</font>
<br/>400m           ->              close    |   63.40                   13s        |        12m
<br/><font color='#A7A7A7'>450m           ->              close    |   57.86                   12s        |        11m</font>
<br/>500m           ->              close    |   45.00                   12s        |        10m
<br/>
<br/>500m           ->           medium   |   82.75                   28s        |        27m
<br/><font color='#A7A7A7'>550m           ->           medium   |   82.01                   28s        |        27m</font>
<br/>600m           ->           medium   |   81.26                   28s        |        27m
<br/><font color='#A7A7A7'>650m           ->           medium   |   80.51                   28s        |        27m</font>                   
<br/>700m           ->           medium   |   79.75                   28s        |        27m
<br/><font color='#A7A7A7'>750m           ->           medium   |   78.98                   28s        |        27m</font>
<br/>800m           ->           medium   |   78.20                   27s        |        27m
<br/><font color='#A7A7A7'>850m           ->           medium   |   77.41                   26s        |        26m</font>
<br/>900m           ->           medium   |   76.61                   27s        |        26m
<br/><font color='#A7A7A7'>950m           ->           medium   |   75.80                   27s        |        26m</font>
<br/>1000m         ->           medium   |   74.98                   27s        |        26m
<br/>1100m         ->           medium   |   73.30                   27s        |        26m
<br/>1200m         ->           medium   |   71.54                   27s        |        26m
<br/>1300m         ->           medium   |   69.70                   26s        |        25m
<br/>1400m         ->           medium   |   67.76                   26s        |        25m
<br/>1500m         ->           medium   |   65.67                   26s        |        25m
<br/>1600m         ->           medium   |   63.40                   25s        |        24m
<br/>1700m         ->           medium   |   60.85                   24s        |        24m
<br/>1800m         ->           medium   |   57.86                   24s        |        23m
<br/>1900m         ->           medium   |   54.01                   23s        |        22m
<br/>2000m         ->           medium   |   45.00                   22s        |        19m
<br/>
<br/>2000m         ->                   far   |   75.31                   39s        |        37m   
<br/>2100m         ->                   far   |   74.50                   39s        |        37m
<br/>2200m         ->                   far   |   73.67                   39s        |        37m
<br/>2300m         ->                   far   |   72.83                   38s        |        37m
<br/>2400m         ->                   far   |   71.97                   38s        |        37m
<br/>2500m         ->                   far   |   71.09                   38s        |        37m
<br/>2600m         ->                   far   |   70.19                   38s        |        36m
<br/>2700m         ->                   far   |   69.27                   38s        |        36m
<br/>2800m         ->                   far   |   68.32                   37s        |        36m
<br/>2900m         ->                   far   |   67.33                   37s        |        36m
<br/>3000m         ->                   far   |   66.31                   37s        |        35m
<br/>3100m         ->                   far   |   65.26                   37s        |        35m
<br/>3200m         ->                   far   |   64.15                   36s        |        35m
<br/>3300m         ->                   far   |   62.98                   36s        |        35m
<br/>3400m         ->                   far   |   61.75                   35s        |        34m
<br/>3500m         ->                   far   |   60.43                   35s        |        34m
<br/>3600m         ->                   far   |   59.00                   34s        |        33m
<br/>3700m         ->                   far   |   57.42                   34s        |        33m
<br/>3800m         ->                   far   |   55.63                   33s        |        32m
<br/>3900m         ->                   far   |   53.48                   32s        |        31m
<br/>4000m         ->                   far   |   50.59                   31s        |        30m
<br/>
<br/><font size='18' color='#ea2e2e'>Adjustment of Fire Guide</font>
<br/>
<br/><font size='15' color='#72E500'>Range                      ->         add 10m   |   minus 10m</font>
<br/>
<br/>50m - 250m             ->               -0.60   |   +0.60
<br/>250m - 500m           ->               -1.20   |   +1.20
<br/>
<br/>500m - 1250m         ->               -0.20   |   +0.20
<br/>1250m - 2000m       ->               -0.30   |   +0.30
<br/>
<br/>2000m - 3000m       ->               -0.10   |   +0.10
<br/>3000m - 4000m       ->               -0.20   |   +0.20
"]];

// The code below creates the execution sub-section of notes.
_ref_title = player createDiaryRecord ["refPage", ["-- Fire Support --","
<br/>"]];

// The code below creates the execution sub-section of notes.
_spacer = player createDiaryRecord ["refPage", ""];

// The code below creates the execution sub-section of notes.
_nato_markers = player createDiaryRecord ["refPage", ["NATO Unit Markers","
<br/><font size='20'>NATO UNIT MARKERS</font>
<br/><img image='unit_markers_2.jpg' width='300' height='655'/>
"]];
// The code below creates the execution sub-section of notes.
_exe = player createDiaryRecord ["refPage", ["Laws of War","
<br/><font size='20'>LAWS OF WAR</font>
<br/>All personnel are to abide by the rules of combat for this mission. HQ is to remind all units of their responsibilities:
<br/>
<br/><font size='18' color='#ea2e2e'>I) HARM OF CIVILIANS</font>
<br/>In the conduct of military operations, constant care must be taken to spare the civilian population, civilians, and civilian objects. All feasible precautions must be taken to avoid, and in any event to minimize, incidental loss of civilian life, injury to civilians, and damage to civilian objects. 
<br/>
<br/><font size='18' color='#ea2e2e'>II) DAMAGE TO PROPERTY</font>
<br/>Loss of life and damage to property incidental to attacks must not be excessive in relation to the concrete and direct military advantage expected to be gained. 
<br/>
<br/><font size='18' color='#ea2e2e'>III) NON-ACTIVE COMBATANTS</font>
<br/>International Humanitarian Law also restricts and regulates the conduct of war, protecting those that are not participating in hostilities. This includes defenseless combatants - individuals who are either in the power of an adverse part, injured, sick, shipwrecked, unconscious, or expressing a clear intention to surrender.
<br/>"
]];

// The code below creates the execution sub-section of notes.
_acronyms = player createDiaryRecord ["refPage", ["Common Acronyms","
<br/><font size='20'>COMMON ACRONYMS</font>
<br/>The following glossary defines widely-used acronyms:
<br/>
<br/><font size='18' color='#ea2e2e'>MAP MARKERS</font>
<br/><font color='#72E500'>ASR</font color>: Alternate Supply Route
<br/><font color='#72E500'>BOF</font color>: Base Of Fire
<br/><font color='#72E500'>DZ</font color>: Drop Zone
<br/><font color='#72E500'>FOB</font color>: Forward Operating Base
<br/><font color='#72E500'>FUP</font color>: Form-Up Point
<br/><font color='#72E500'>LOA</font color>: Limit Of Advance
<br/><font color='#72E500'>MSR</font color>: Main Supply Route
<br/><font color='#72E500'>OP</font color>:  Observation Point
<br/><font color='#72E500'>RV</font color>:  Rondevouz
<br/>> <font color='#72E500'>ERV</font color>: Emergency Rondevouz
<br/>> <font color='#72E500'>FRV</font color>: Final Rondevouz
<br/>> <font color='#72E500'>ORV</font color>: Objective Rondevouz
<br/><font color='#72E500'>TRP</font color>: Target Reference Point
<br/><font color='#72E500'>WP</font color>: Waypoint
<br/>
<br/><font size='18' color='#ea2e2e'>UNIT TYPES / ROLES</font>
<br/><font color='#72E500'>AAA</font color>: Anti-Aircraft Artillery
<br/><font color='#72E500'>CAS</font color>: Close Air Support
<br/><font color='#72E500'>EOD</font color>: Explosive Ordnance Disposal
<br/><font color='#72E500'>FO</font color>: Forward Observer
<br/><font color='#72E500'>IFV</font color>: Infantry Fighting Vehicle
<br/><font color='#72E500'>JTAC</font color>: Joint Terminal Attack Controller
<br/><font color='#72E500'>LSV</font color>: Light Strike Vehicle
<br/><font color='#72E500'>MBT</font color>: Main Battle Tank
<br/>
<br/><font size='18' color='#ea2e2e'>OTHER</font>
<br/><font color='#72E500'>ROE</font color>: Rules Of Engagement
<br/><font color='#72E500'>QRF</font color>: Quick Reaction Force
<br/><font color='#72E500'>UXO</font color>: Unexploded Ordnance
<br/>"
]];

// The code below creates the execution sub-section of notes.
_ref_title = player createDiaryRecord ["refPage", ["-- For Reference --","
<br/>"]];
