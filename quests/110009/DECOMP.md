# Quest 110009 (man0u0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man0u0.lua (352 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0;  -- On the Merchant Strip in Ul'dah; contains the basic tutorial.
SEQ_005 = 5;  -- Combat on the Sapphire Avenue Exchange
SEQ_010 = 10; -- Back on the Merchant Strip in Ul'dah
```

## NPCs/Actors
```
ASCILIA                 = 1000042;
WARBURTON               = 1000186;
RURURAJI                = 1000840;
BIG_BELLIED_BARKER      = 1001490;
FRETFUL_FARMHAND        = 1001491;
DEBAUCHED_DEMONESS      = 1001492;
DAPPER_DAN              = 1001493;
LOUTISH_LAD             = 1001494;
GIL_DIGGING_MISTRESS    = 1001495;
TWITTERING_TOMBOY       = 1001496;
STOCKY_STRANGER         = 1001644;
EXIT_TRIGGER            = 1090372;
OPENING_STOPER_ULDAH    = 1090373;
KEEN_EYED_MERCHANT      = 1000401;
HIGH_SPIRITED_FELLOW    = 1001042;
DISREPUTABLE_MIDLANDER  = 1001044;
LONG_LEGGED_LADY        = 1001112;
LARGE_LUNGED_LABORER    = 1001645;
TOOTH_GRINDING_TRAVELER = 1001646;
FULL_LIPPED_FILLE       = 1001647;
YAYATOKI                = 1500129;
BLOCKER                 = 1090372;
ULDAH_OPENING_EXIT      = 1099046;
CROWD_HYUR_M            = 1001114;
CROWD_HYUR_F            = 1001115;
CROWD_ELEZEN_M          = 1001116;
CROWD_ELEZEN_F          = 1001117;
CROWD_LALAFELL_M        = 1001118;
CROWD_LALAFELL_F        = 1001119;
CROWD_MIQOTE            = 1001120;
CROWD_ROEGADYN          = 1001121;
GUILD_KIORA             = 1000780;
GUILD_OPONDHAO          = 1000781;
GUILD_BERTRAM           = 1000782;
GUILD_MINERVA           = 1000783;
GUILD_ZOENGTERBIN       = 1000784;
GUILD_STYRMOEYA         = 1000785;
GUILD_YHAH_AMARIYO      = 1000786;
GUILD_HILDIE            = 1000787;
GUILD_LETTICE           = 1000788;
GUILD_TYON              = 1000789;
GUILD_OTOPA_POTTOPA     = 1000864;
GUILD_THAISIE           = 1000865;
GUILD_SESEBARU          = 1001182;
GUILD_TOTONAWA          = 1001371;
GUILD_EUSTACE           = 1001372;
MRKR_YAYATOKI               = 11000901;
MRKR_ASCILIA                = 11000902;
MRKR_FRETFUL_FARMHAND       = 11000903;
MRKR_GIL_DIGGING_MISTRESS   = 11000904;
MRKR_COMBAT_TUTORIAL        = 11000905;
MRKR_ADV_GUILD              = 11000906;
```

## Markers
```
MRKR_YAYATOKI               = 11000901;
MRKR_ASCILIA                = 11000902;
MRKR_FRETFUL_FARMHAND       = 11000903;
MRKR_GIL_DIGGING_MISTRESS   = 11000904;
MRKR_COMBAT_TUTORIAL        = 11000905;
MRKR_ADV_GUILD              = 11000906;
```

## Flags/Counters
```
FLAG_SEQ000_MINITUT0    = 0;    -- PushEvent ASCILIA
FLAG_SEQ000_MINITUT1    = 1;    -- TalkEvent ASCILIA
FLAG_SEQ000_MINITUT2    = 2;    -- TalkEvent FRETFUL_FARMHAND
FLAG_SEQ000_MINITUT3    = 3;    -- TalkEvent GIL_DIGGING_MISTRESS
FLAG_SEQ010_TALK0       = 0;    -- TalkEvent YAYATOKI
FLAG_SEQ000_TARGET_STARTED = 4; -- Target tutorial dispatched, or Ascilia already targeted by a talk event.
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onNotice(player, quest, target)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function onPush(player, quest, npc)
function seq000_onTalk(player, quest, npc, classId)
function seq010_onTalk(player, quest, npc, classId)
function getJournalMapMarkerList(player, quest)
function doExitTrigger(player, quest, npc)
```

## Cutscenes / processEvents
```
--MUMPISH_MIQOTE          = 1000992; -- Unused on this client version.  Calls processEvent020_6
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");
callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001");
callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml002");
callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml003");
callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini001");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002_first");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003_first");
callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_13");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_12");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_14");
callClientFunction(player, "delegateEvent", player, quest, "processEtc003");
callClientFunction(player, "delegateEvent", player, quest, "processEtc001");
callClientFunction(player, "delegateEvent", player, quest, "processEtc002");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
```

## Items / rewards
```

```

## Instance entry/exit
```
local contentArea = player.CurrentArea:CreateContentAreaForAllDisciplines(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0u01", "SimpleContent30079", "Quest/QuestDirectorMan0u001");
GetWorldManager():DoZoneChangeContent(player, contentArea, -17.7, 192, 37.7, 0.93, 16);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110009, 'Flowers for All', 'Man0u0', 0, 1)
REWARDS:
(110009, 1, 'Gil', 1000001, 2000, 0, 'dat-old', 1),
```


