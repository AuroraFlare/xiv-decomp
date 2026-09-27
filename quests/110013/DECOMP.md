# Quest 110013 (man200.lua)
Source: FF14-Memory/Data/scripts/quests/man/man200.lua (479 lines, full body read)

## Stages (SEQ)
```
SEQ_000	= 0;  	-- Go to the event door
SEQ_005	= 5;  	-- Talk to Minfilia to use the echo on her.
SEQ_010	= 10;  	-- Talk to Minfilia to join the Path of the Twelve.
SEQ_020	= 20;  	-- Path companion selection sequence.
SEQ_025	= 25;  	-- Wait for the linkpearl message.
SEQ_027	= 27;	-- Pray return to the Waking Sands
```

## NPCs/Actors
```
MINFILIA				= 1000843;
TATARU					= 1001046;
SATZFLOH				= 1001228;
PERCEVAINS				= 1001229;
UNA_TAYUUN				= 1001230;
ROUGH_SPOKEN_FELLOW		= 1001274;
RED_SHOED_RASCAL		= 1001275;
ABSTRACTED_GLADIATOR	= 1001276;
CHAPEAUED_CHAP			= 1001277;
BARRATROUS_BUCCANEER	= 1001278;
SOFTHEARTED_SEPTUAGEN	= 1001279;
INDIGO_EYED_ARCHER		= 1001280;
LOAM_SCENETED_LADY		= 1001281;
UNCOMFORTABLE_BRUTE		= 1001282;
SAHJA_ZHWAN				= 1001373;
NENEKANI				= 1001374;
GODFREY					= 1001375;
FENANA					= 1001376;
NONORU					= 1001377;
SERANELIEN				= 1001378;
SNPC_START				= 1070000;
SNPC_END				= 1070166;
MARKET_ENTRANCE			= 1090265;
EVENT_DOOR_EXIT			= 1090160;
EVENT_DOOR_OFFICE_W		= 1090161;
EVENT_DOOR_OFFICE_E		= 1090162;
MOMODI					= 1000841;
MRKR_MINFILIA			= 11001301;
MRKR_TATARU				= 11001303;
MRKR_MARKETENTRANCE		= 11001305;
MRKR_MOMODI				= 11001306;
```

## Markers
```
MRKR_MINFILIA			= 11001301;
MRKR_TATARU				= 11001303;
MRKR_MARKETENTRANCE		= 11001305;
MRKR_MOMODI				= 11001306;
```

## Flags/Counters
```
FLAG_VISITED			= 0;
FLAG_TALKED_TATARU		= 1;
FLAG_DUTY_COMPLETE		= 2;
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function seq000_onTalkOtherNpcs(player, quest, npc)
function seq010_onTalkOtherNpcs(player, quest, npc)
function onPush(player, quest, npc)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
function startMan20001Content(player, quest, npc)
```

## Cutscenes / processEvents
```
[SERANELIEN] = "processEvent000_3",
[SAHJA_ZHWAN] = "processEvent000_4",
[NENEKANI] = "processEvent000_5",
[GODFREY] = "processEvent000_6",
[FENANA] = "processEvent000_7",
[LOAM_SCENETED_LADY] = "processEvent000_11",
[SOFTHEARTED_SEPTUAGEN] = "processEvent000_12",
[INDIGO_EYED_ARCHER] = "processEvent000_13",
[BARRATROUS_BUCCANEER] = "processEvent000_14",
[UNCOMFORTABLE_BRUTE] = "processEvent000_15",
[RED_SHOED_RASCAL] = "processEvent000_16",
[ABSTRACTED_GLADIATOR] = "processEvent000_17",
[SERANELIEN] = "processEvent020_3",
[SAHJA_ZHWAN] = "processEvent020_4",
[NENEKANI] = "processEvent020_5",
[GODFREY] = "processEvent020_6",
[FENANA] = "processEvent020_7",
[LOAM_SCENETED_LADY] = "processEvent020_8",
[SOFTHEARTED_SEPTUAGEN] = "processEvent020_9",
[INDIGO_EYED_ARCHER] = "processEvent020_10",
[BARRATROUS_BUCCANEER] = "processEvent020_11",
[UNCOMFORTABLE_BRUTE] = "processEvent020_12",
[RED_SHOED_RASCAL] = "processEvent020_13",
[ABSTRACTED_GLADIATOR] = "processEvent020_14",
[NONORU] = "processEvent000_8",
[CHAPEAUED_CHAP] = "processEvent000_9",
[ROUGH_SPOKEN_FELLOW] = "processEvent000_10",
[SATZFLOH] = "processEvent000_18",
[PERCEVAINS] = "processEvent000_19",
[UNA_TAYUUN] = "processEvent000_20",
scenarioHelpers.delegateEvent(player, quest, "processEvent000_2");
scenarioHelpers.delegateEvent(player, quest, "processEvent000_2");
scenarioHelpers.delegateEvent(player, quest, "processEvent020_2");
scenarioHelpers.delegateEvent(player, quest, "processEvent040_2");
local name = scenarioHelpers.delegateEvent(player, quest, "pEN", scenarioHelpers.getSnpcPersonality(player));
local result = scenarioHelpers.delegateEvent(player, quest, "contentsJoinAskInBasaClass");
```

## Items / rewards
```
quest:SetENpc(MOMODI, QFLAG_REWARD);
-- Reward slots: skill points, gil, and the classic Chocobo Whistle.
-- HasItem makes retries harmless if delivery succeeded earlier.
if (not player:HasItem(CHOCOBO_WHISTLE)) then
scenarioHelpers.addItem(player, CHOCOBO_WHISTLE, 1);
if (not player:HasItem(CHOCOBO_WHISTLE)) then
scenarioHelpers.addItem(player, 1000001, 45000);
```

## Instance entry/exit
```
GetWorldManager():WarpToPosition(player, -142.75, 1, -160, -1.6);
--				GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 11, 15, -200.262, 0, -159.890, -1.568);
GetWorldManager():WarpToPosition(player, -126.2, 1.2, -160, 1.6);
local contentArea = player.CurrentArea:CreateContentAreaForAllDisciplines(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man20001", "SimpleContent30080", "Quest/QuestDirectorEventMan20001");
GetWorldManager():DoZoneChangeContent(player, contentArea, -200.262, 0, -159.890, -1.568);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110013, 'Fade to White', 'Man200', 0, 18)
(110013, 1, 110004)
(110013, 1, 110008)
(110013, 1, 110012)
REWARDS:
none found in gamedata_quest_rewards.sql
```


