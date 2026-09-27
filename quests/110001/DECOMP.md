# Quest 110001 (man0l0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man0l0.lua (332 lines, full body read)

## Stages (SEQ)
```
SEQ_000	= 0;  -- On the boat interior; contains the basics tutorial.
SEQ_005	= 5;  -- Combat on the top of the boat.
SEQ_010	= 10; -- In Limsa Lominsa's port.
```

## NPCs/Actors
```
WELLTRAVELED_MERCHANT 	= 1000438;
TIPSY_ADVENTURER 		= 1000439;
CULTIVATED_TENDER 		= 1000440;
ANXIOUS_ADVENTURER 		= 1000441;
BABYFACED_ADVENTURER 	= 1000442;
AUSTERE_ADVENTURER 		= 1000443;
UNDIGNIFIED_ADVENTURER 	= 1000444;
SHADOWY_TRAVELER 		= 1000445;
ASTUTE_MERCHANT 		= 1000446;
VOLUPTUOUS_VIXEN 		= 1000447;
INDIFFERENT_PASSERBY 	= 1000448;
PRATTLING_ADVENTURER 	= 1000449;
LANKY_TRAVELER 			= 1000450;
GRINNING_ADVENTURER 	= 1000451;
ROSTNSTHAL 				= 1001652;
EXIT_TRIGGER 			= 1090025;
HOB						= 1000151;
GERT					= 1500004;
LORHZANT				= 1500005;
MUSCLEBOUND_DECKHAND	= 1000261;
PEARLYTOOTHED_PORTER	= 1000260;
PRIVAREA_PAST_EXIT		= 1290002;
MRKR_HOB					= 11000202;
MRKR_ROSTNSTHAL 			= 11000203;
MRKR_VOLUPTUOUS_VIXEN 		= 11000204;
MRKR_BABYFACED_ADVENTURER 	= 11000205;
MRKR_TRIGGER_DOOR			= 11000206;
```

## Markers
```
MRKR_HOB					= 11000202;
MRKR_ROSTNSTHAL 			= 11000203;
MRKR_VOLUPTUOUS_VIXEN 		= 11000204;
MRKR_BABYFACED_ADVENTURER 	= 11000205;
MRKR_TRIGGER_DOOR			= 11000206;
```

## Flags/Counters
```
FLAG_SEQ000_MINITUT0	= 0;
FLAG_SEQ000_MINITUT1	= 1;
FLAG_SEQ000_MINITUT2	= 2;
FLAG_SEQ000_MINITUT3	= 3;
FLAG_SEQ000_TARGET_STARTED = 4; -- Target tutorial dispatched, or Rostnsthal already targeted by a talk event.
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function onPush(player, quest, npc)
function onNotice(player, quest, target)
function seq000_onTalk(player, quest, npc, classId)
function seq010_onTalk(player, quest, npc, classId)
function getJournalMapMarkerList(player, quest)
function doExitDoor(player, quest, npc)
```

## Cutscenes / processEvents
```
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini001");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_11");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_12");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_13");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_14");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_15");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_16");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_17");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_7");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
local choice = callClientFunction(player, "delegateEvent", player, quest, "processEvent020_9");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_10");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_11");
local choice = callClientFunction(player, "delegateEvent", player, quest, "processEventNewRectAsk", nil);
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2", nil);
```

## Items / rewards
```

```

## Instance entry/exit
```
local contentArea = player.CurrentArea:CreateContentAreaForAllDisciplines(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0l01", "SimpleContent30002", "Quest/QuestDirectorMan0l001");
GetWorldManager():DoZoneChangeContent(player, contentArea, -4.8, 16.35, 8.1, 0.2, 16);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110001, 'Shapeless Melody', 'Man0l0', 0, 1)
REWARDS:
(110001, 1, 'Gil', 1000001, 1000, 0, 'dat-new', 1),
(110001, 2, 'Currency', 1000013, 10, 0, 'dat-new', 1),
(110001, 3, 'Item', 8050110, 1, 0, 'dat-new', 1),
```


