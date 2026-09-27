# Quest 110004 (man2l0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man2l0.lua (539 lines, full body read)

## Stages (SEQ)
```
SEQ_000	= 0;  	-- Talk to Captain Hob.
SEQ_010	= 10;  	-- Ship instance, enter the hold.
SEQ_015	= 15;  	-- Exit the hold, go back upstairs.
SEQ_020	= 20;  	-- Duty, fight Emerick and Merodaulyn
SEQ_035	= 35;  	-- Head to Baderon and chat.
SEQ_037	= 37;  	-- Head to outcrop in La Noscea.
SEQ_040	= 40;  	-- Talk to Baderon on the Link Pearl
SEQ_042	= 42;  	-- Enter and push at the MSK guild.
SEQ_045	= 45;  	-- Talk to Isaudorel
SEQ_050	= 50;  	-- Head to God's Grip push, talk with Blackburn.
SEQ_055	= 55;  	-- Continue to the other push with Y'shtola in the subecho.
SEQ_060	= 60;  	-- Unused? Talks about spying Stahlmann, Emerick, and Merod scheming.
SEQ_065	= 65;  	-- Unused? Talks about the meteor shower and the Ascian stealing the key.
SEQ_070	= 70;  	-- Unused? Talks about heading to Ul'dah.
```

## NPCs/Actors
```
BADERON 					= 1000137;
YSHTOLA 					= 1000001;
HOB							= 1000151;
ISAUDOREL					= 1000152;
BARRACUDA_KNIGHT1			= 1000183;
BARRACUDA_KNIGHT2			= 1000184;
TRIGGER_DOCKS				= 1090386;
EVENTDOOR_SHIP1				= 1090098;
EVENTDOOR_SHIP2				= 1090099;
TRIGGER_DUTYSTART			= 1090085;
TRIGGER_MSK					= 1090003;
TRIGGER_SEAFLD1				= 1090082;
TRIGGER_SEAFLD2				= 1090086;
TRIGGER_SEAFLD3				= 1090087;
MRKR_HOB					= 11000401;
MRKR_PSHSHIP				= 11000402;
MRKR_PSHSHIP2				= 11000403;
MRKR_S037_SEAFLD1			= 11000404;
MRKR_PSHMSKGUILD			= 11000405;
MRKR_ISAUDOREL				= 11000406;
MRKR_S050_SEAFLD2			= 11000407;
MRKR_PSHSEAFLD				= 11000408;
MRKR_BADERON				= 11000409;
```

## Markers
```
MRKR_HOB					= 11000401;
MRKR_PSHSHIP				= 11000402;
MRKR_PSHSHIP2				= 11000403;
MRKR_S037_SEAFLD1			= 11000404;
MRKR_PSHMSKGUILD			= 11000405;
MRKR_ISAUDOREL				= 11000406;
MRKR_S050_SEAFLD2			= 11000407;
MRKR_PSHSEAFLD				= 11000408;
MRKR_BADERON				= 11000409;
```

## Flags/Counters
```
MAN2L0_CNTR_DUTY_SIDE			= 0;
MAN2L0_FLAG_DUTY_ACTIVE			= 0;
MAN2L0_FLAG_DUTY_COMPLETE_PENDING	= 1;
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function startMan2l0TwainDuty(player, quest, playEntryCutscene)
function onTalk(player, quest, npc)
function onTalk_shipSequences(player, quest, npc, classId, sequence)
function onPush(player, quest, npc)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
callClientFunction(player, "delegateEvent", player, quest, "processEvent013");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent060_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent075");
callClientFunction(player, "delegateEvent", player, quest, "processEvent080_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent081_2", 1);
callClientFunction(player, "delegateEvent", player, quest, "sqrwa", REWARD_EXP, 1, 1, 2);
local returnToShip = callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
local returnToPublic = callClientFunction(player, "delegateEvent", player, quest, "processEvent011_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent011_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent011_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent012");
local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020", side);
callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
callClientFunction(player, "delegateEvent", player, quest, "processEvent081");
callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
```

## Items / rewards
```
quest:SetENpc(BADERON, QFLAG_REWARD);
player:AddItem(1000001, 30000);
--			player:AddItem(2001006, 1);
```

## Instance entry/exit
```
local targetArea = GetWorldManager():GetArea(192, "PrivateAreaMasterPast", 0);
GetWorldManager():DoZoneChange(player, 192, "PrivateAreaMasterPast", 0, 15, MAN2L0_DUTY_BATTLE_X, MAN2L0_DUTY_BATTLE_Y, MAN2L0_DUTY_BATTLE_Z, MAN2L0_DUTY_BATTLE_ROT);
GetWorldManager():DoZoneChange(player, 192, "PrivateAreaMasterPast", 0, 0, 1832.243, 16.352, 1834.965, 1.584);
GetWorldManager():DoZoneChange(player, 192, "PrivateAreaMasterPast", 0, 0, 1828.785, 11.852, 1829.20, -1.675);
GetWorldManager():DoZoneChange(player, 192, "PrivateAreaMasterPast", 0, 0, 1832.243, 16.352, 1834.965, 1.584);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 8, -631.93, 2, 391.75, -0.05);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, 1823.579, -61.65, 1816.102, 2.42);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, MAN2L0_DUTY_PROMPT_X, MAN2L0_DUTY_PROMPT_Y, MAN2L0_DUTY_PROMPT_Z, MAN2L0_DUTY_PROMPT_ROT);
GetWorldManager():DoZoneChange(player, 128, "PrivateAreaMasterPast", 3, 0, 198.314, 25.928, 1186.126, 1.6);
GetWorldManager():DoZoneChange(player, 128, "PrivateAreaMasterPast", 3, 0, 198.314, 25.928, 1186.126, 1.6);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110004, 'Never the Twain Shall Meet', 'Man2l0', 110003, 13)
REWARDS:
none found in gamedata_quest_rewards.sql
```


