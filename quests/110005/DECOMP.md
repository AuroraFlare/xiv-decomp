# Quest 110005 (man0g0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man0g0.lua (250 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0;  -- Intro with Yda & Papalymo
SEQ_005 = 5;  -- Combat tutorial
SEQ_010 = 10; -- Gridania section
```

## NPCs/Actors
```
YDA                 = 1000009;
PAPALYMO            = 1000010;
FARRIMOND           = 1000017;
CECILIA             = 1000683;
SWETHYNA            = 1000680;
TKEBBE              = 1000876;
LONSYGG             = 1000951;
PUSH_ADV_GUILD      = 1099046;
BLOCKER1            = 1099047;
GUILD_ANENE         = 1000427;
GUILD_SYLBERT       = 1000428; -- No source
GUILD_HONGA_VUNGA   = 1000429;
GUILD_NONCO_MENANCO = 1000430;
GUILD_LTANDHAA      = 1000431;
GUILD_POFUFU        = 1000432;
GUILD_ODILIE        = 1000434; -- No source
GUILD_BASEWIN       = 1000435; -- No source
GUILD_SEIKFRAE      = 1000436; -- No source
GUILD_EDASSHYM      = 1000437;
GUILD_TIERNEY       = 1000456;
GUILD_GONTRANT      = 1000457;
GUILD_VKOROLON      = 1000458;
GUILD_EMONI         = 1001183;
GUILD_GYLES         = 1001184;
GUILD_PENELOPE      = 1700001; -- No source
MRKR_LONSYGG        = 11000501;  -- Obsolete.  Pre-1.19 location for this npc
MRKR_YDA            = 11000502;
MRKR_PAPALYMO       = 11000503;
MRKR_GUILD          = 11000504;
```

## Markers
```
MRKR_LONSYGG        = 11000501;  -- Obsolete.  Pre-1.19 location for this npc
MRKR_YDA            = 11000502;
MRKR_PAPALYMO       = 11000503;
MRKR_GUILD          = 11000504;
```

## Flags/Counters
```
FLAG_SEQ000_MINITUT0        = 0; -- Talked to Yda.
FLAG_SEQ000_MINITUT1        = 1; -- Talked to Papalymo.
FLAG_SEQ000_MINITUT2        = 2; -- Talked to Yda again.
FLAG_SEQ000_TARGET_STARTED  = 3; -- Target tutorial dispatched, or Yda already targeted by a talk event.
FLAG_SEQ010_TKEBBE          = 0; -- Talked to T'kebbe (optional)
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
function doContentArea(player, quest, npc)
```

## Cutscenes / processEvents
```
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");
callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001");
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010_1");
```

## Items / rewards
```

```

## Instance entry/exit
```
local contentArea = player.CurrentArea:CreateContentAreaForAllDisciplines(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0g01", "SimpleContent30010", "Quest/QuestDirectorMan0g001");
GetWorldManager():DoZoneChangeContent(player, contentArea, 362.4087, 4, -703.8168, 1.5419, 16);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110005, 'Sundered Skies', 'Man0g0', 0, 1)
REWARDS:
(110005, 1, 'Gil', 1000001, 2000, 0, 'dat-old', 1),
```


