# Quest 110002 (man0l1.lua)
Source: FF14-Memory/Data/scripts/quests/man/man0l1.lua (1311 lines, full body read)

## Stages (SEQ)
```
SEQ_000	= 0;  	-- (Private Area) Drowning Wench Echo Scene.
SEQ_003	= 3;  	-- Go attune to Camp Bearded Rock.
SEQ_005	= 5;  	-- Attuned, go back to Baderon. Info: <param1> If 1, Baderon gave you a tutorial guildleve else 0.
SEQ_006	= 6;  	-- Talk to Baderon again
SEQ_007	= 7;  	-- Find the CUL and MSK Guilds. Info: Params '0,5,20' will show the msg that you visited both guilds and to notify Baderon on the LS.
SEQ_035	= 35;	-- Go to the FSH Guild.
SEQ_040	= 40;	-- Learn hand signals from the guild
SEQ_048	= 48;	-- Travel to Zephyr Gate
SEQ_050	= 50;	-- Escort mission
SEQ_055	= 55;	-- Search lighthouse for corpse
SEQ_060	= 60;	-- Talk to Sisipu
SEQ_065	= 65;	-- Return to FSH Guild
SEQ_070	= 70;	-- Contact Baderon on LS
SEQ_075	= 75;	-- Go to the ARM and BSM Guilds. Talk to Bodenolf.
SEQ_080	= 80;	-- Speak with H'naanza
SEQ_085	= 85;	-- Walk into push trigger
SEQ_090	= 90;	-- Contact Baderon on LS
SEQ_092	= 92;	-- Return to Baderon.
```

## NPCs/Actors
```
YSHTOLA 				= 1000001;
CRAPULOUS_ADVENTURER 	= 1000075;
DUPLICITOUS_TRADER	 	= 1000076;
DEBONAIR_PIRATE 		= 1000077;
ONYXHAIRED_ADVENTURER	= 1000098;
SKITTISH_ADVENTURER		= 1000099;
RELAXING_ADVENTURER 	= 1000100;
BADERON 				= 1000137;
MYTESYN 				= 1000167;
COCKAHOOP_COCKSWAIN 	= 1001643;
SENTENIOUS_SELLSWORD 	= 1001649;
SOLICITOUS_SELLSWORD 	= 1001650;
BLOCKER					= 1090372;
BEARDEDROCK_AETHERYTE	= 1280002;
CHARLYS					= 1000138;
ISANDOREL				= 1000152;
MERLZIRN				= 1000472;
MSK_TRIGGER				= 1090001;
NERVOUS_BARRACUDA		= 1000096;
INTIMIDATING_BARRACUDA	= 1000097;
OVEREAGER_BARRACUDA		= 1000107;
SOPHISTICATED_BARRACUDA	= 1000108;
SMIRKING_BARRACUDA		= 1000109;
MANNSKOEN				= 1000142;
TOTORUTO				= 1000161;
ADVENTURER1				= 1000869;
ADVENTURER2				= 1000870;
ADVENTURER3				= 1000871;
ECHO_EXIT_TRIGGER		= 1090003;
NNMULIKA				= 1000153;
SISIPU_EMOTE			= 1000155;
FAUCILLIEN				= 1000164; -- Fishermen's Guild warning about the Reavers.
LOUVIAUNE				= 1000165; -- Reports the Reaver vessel at Oschon's Torch.
ZEPHYR_TRIGGER			= 1090004;
LIGHTHOUSE_TRIGGER		= 1090176;
SISIPU					= 1000156;
WINDWORN_CORPSE			= 1000091;
GLASSYEYED_CORPSE		= 1000092;
FEARSTRICKEN_CORPSE		= 1000378;
FSH_TRIGGER				= 1090006;
TATTOOED_PIRATE			= 1000111;
IOFA					= 1000135;
BODENOLF				= 1000144;
HNAANZA					= 1000145;
MIMIDOA					= 1000176;
JOELLAUT				= 1000163;
WERNER					= 1000247;
HIHINE					= 1000267;
TRINNE					= 1000268;
ECHO_EXIT_TRIGGER2		= 1090007;
NANAKA					= 1000276;
CARRILAUT				= 1000062;
BRICTT					= 1000051;
AENTFOET				= 1000064;
MRKR_BADERON			= 11000101;
MRKR_CAMPBEARDEDROCK	= 11000102;
MRKR_BADERON2			= 11000103;
MRKR_CULGUILD			= 11000104;
MRKR_MSKGUILD			= 11000105;
MRKR_MSKGUILD2			= 11000106;
... (+13 more)
```

## Markers
```
MRKR_BADERON			= 11000101;
MRKR_CAMPBEARDEDROCK	= 11000102;
MRKR_BADERON2			= 11000103;
MRKR_CULGUILD			= 11000104;
MRKR_MSKGUILD			= 11000105;
MRKR_MSKGUILD2			= 11000106;
MRKR_MSKGUILD3			= 11000107;
MRKR_MSKGUILD4			= 11000108;
MRKR_FSHGUILD			= 11000109;
MRKR_SISIPU				= 11000110;
MRKR_ESCORTSTART		= 11000111;
MRKR_LIGHTHOUSE			= 11000112;		--Used in Escort Mission
MRKR_CORPSE				= 11000113;
MRKR_SISIPU2			= 11000114;
MRKR_BODENOLF			= 11000115;
MRKR_HNAANZA			= 11000116;
MRKR_SEQ085PSH			= 11000117;
MRKR_QUESTCOMPLETE		= 11000118;
MRKR_FSHGUILD2			= 11000119;
```

## Flags/Counters
```
CNTR_SEQ7_CUL		= 1;
CNTR_SEQ7_MSK		= 2;
CNTR_SEQ40_FSH		= 3;
CNTR_LS_MSG			= 4;
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function seq000_onTalk(player, quest, npc, classId)
function seq007_onTalk(player, quest, npc, classId)
function seq080_085_onTalk(player, quest, npc, classId)
function repairShiftedSeq7CountersIfNeeded(player, quest)
function retryMissingTreasuresLs(player, quest, sequence)
function onPush(player, quest, npc)
function onEmote(player, quest, npc, eventName)
function onNotice(player, quest, target)
function onNpcLS(player, quest, from, msgStep)
function startMan0l1Content(player, quest)
function startMan0l1FinalEncounterTest(player, quest)
function testMan0l1CompletionCutscene(player, quest)
function finishMan0l1ToCorpseSceneNoCutscene(player, quest)
function finishMan0l1ToCorpseScene(player, quest, playCutscene)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
-- The quest archive explicitly assigns processEvent600_4 to Faucillien and
-- processEvent600_3 to Louviaune; these are dialogue actors, not inferred
callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent026");
callClientFunction(player, "delegateEvent", player, quest, "processEvent027");
callClientFunction(player, "delegateEvent", player, quest, "processEvent600");
-- processEvent600 ends with startFadeInCutSceneAfterWarp. Keep the
callClientFunction(player, "delegateEvent", player, quest, "processEvent601_1");
callClientFunction(player, "delegateEvent", player, quest, "processEvent601_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent601_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent601_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent601_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent601_6");
-- processEvent600_2 is N'nmulika's initial description of the
-- introduction is contextually wrong; processEvent1000_4 is the
callClientFunction(player, "delegateEvent", player, quest, "processEvent600_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent600");
-- processEvent600 owns the after-warp fade for this return as well.
callClientFunction(player, "delegateEvent", player, quest, "processEvent600_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent600_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent602_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent602_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent615");
-- processEvent615 is the after-warp variant. Do not close its
callClientFunction(player, "delegateEvent", player, quest, "processEvent605_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent610");
callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent625_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent625_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent615_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent630");
-- processEvent630 owns the after-warp fade into the forge copy.
callClientFunction(player, "delegateEvent", player, quest, "processEvent632");
callClientFunction(player, "delegateEvent", player, quest, "processEvent632_2");
callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
callClientFunction(player, "delegateEvent", player, quest, "sqrwa", REWARD_EXP, 1, 1, 2);
... (+91 more)
```

## Items / rewards
```
quest:SetENpc(BADERON, QFLAG_REWARD);
player:AddItem(1000001, 6000);
player:AddItem(1000001, 1000); -- give 1000 gil
player:AddItem(1000001, 3000);		-- Give 3000 gil
```

## Instance entry/exit
```
TREASURES_CONTENT_DIRECTOR = "Quest/QuestDirectorMan0l101";
TREASURES_CONTENT_ZONE = 128;
TREASURES_CORPSE_SCENE_PRIVATE_AREA = "PrivateAreaMasterPast";
-- Both NPCs are present in public Limsa and in PrivateAreaMasterPast type 5.
GetWorldManager():DoZoneChange(player, 133, "PrivateAreaMasterPast", 2, 15, -459.619873, 40.0005722, 196.370377, 2.010813);
-- processEvent600 ends with startFadeInCutSceneAfterWarp. Keep the
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 5);
local leavesEventForWarp = false;
leavesEventForWarp = true;
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 5);
if (not leavesEventForWarp) then
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -504.985, 42.490, 433.712, 2.35);
--local director = GetWorldManager():GetArea(133):CreateDirector("AfterQuestWarpDirector", false);
local leavesEventForWarp = false;
leavesEventForWarp = true;
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3);
if (not leavesEventForWarp) then
local leavesEventForWarp = false;
leavesEventForWarp = true;
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -504.985, 42.490, 433.712, 2.35);
if (not leavesEventForWarp) then
-- pending LS (e.g. packet lost across the immediate WarpToPublicArea or a
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():DoZoneChange(player, 128, "PrivateAreaMasterPast", 2, 15, 137.44, 60.33, 1322.0, -1.60);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPublicArea(player);
-- processEvent604 ends with startFadeInCutSceneAfterWarp. Keep the
-- source event alive through DoZoneChangeContent; its staged content
local sourceArea = GetWorldManager():GetArea(TREASURES_CONTENT_ZONE);
local contentArea = sourceArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0l101", "SimpleContentMan0l101", TREASURES_CONTENT_DIRECTOR);
... (+3 more)
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110002, 'Treasures of the Main', 'Man0l1', 110001, 1)
REWARDS:
none found in gamedata_quest_rewards.sql
```


