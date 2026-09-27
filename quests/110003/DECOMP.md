# Quest 110003 (man1l0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man1l0.lua (571 lines, full body read)

## Stages (SEQ)
```
SEQ_000	= 0;  	-- Echo intance with Y'shtola, Baderon, Etc. Talk to Y'shtola.
SEQ_010	= 10;  	-- Echo instance, talk with Baderon.
SEQ_020	= 20;  	-- Head to MRD guild and talk to Waekbyrt.
SEQ_030	= 30;  	-- Head down the Astalicia to the push trigger.
SEQ_040	= 40;  	-- Head up the Astalicia to the push trigger.
SEQ_050	= 50;	-- Contact Baderon on the Link Pearl.
SEQ_060	= 60;	-- Head to the FSH guild and push the trigger.
SEQ_070	= 70;	-- Head to a spot in Lower La Noscea.
SEQ_080	= 80;	-- Contact Baderon on the Link Pearl.
SEQ_090	= 90;	-- Speak to P'tahjha at the ACN guild.
SEQ_100	= 100;	-- Echo instance, head downstairs to push a trigger and cutscene.
SEQ_110	= 110;	-- Echo instance still, head upstairs to trigger a cutscene.
SEQ_120	= 120;	-- Contact Baderon on the Link Pearl.
SEQ_122	= 122;	-- Head back to Baderon to finish the quest.
```

## NPCs/Actors
```
BADERON 					= 1000137;
YSHTOLA 					= 1000001;
ADVENTURER					= 1000101;
WHISPERING_ADVENTURER		= 1000102;
UNAPPROACHABLE_ADVENTURER 	= 1000103;
FISH_SMELLING_ADVENTURER	= 1000104;
SPEAR_WIELDING_ADVENTURER	= 1000105;
TRIGGER_ADVGUILD			= 1090080;
WAEKBYRT					= 1000003;
HULKING_CUDA_KNIGHT			= 1000182;
SOPHISTICATED_CUDA_KNIGHT	= 1000108;
FRIGHTENED_CUDA_KNIGHT		= 1000110;
ZEALOUS_PIRATE				= 1000112;
ENRAGED_PIRATE				= 1000113;
TRIGGER_MRD					= 1090081;
DISGRUNTLED_PIRATE			= 1000087;
PINE_SCENTED_PIRATE			= 1000088;
BARITONE_PIRATE				= 1000089;
BAYARD						= 1000190;
NNMULIKA					= 1000153;
SISIPU						= 1000156;
TRIGGER_FSH					= 1090006;
TRIGGER_SEAFLD				= 1090082;
ASSESSOR1			 		= 1000120;
ASSESSOR2			 		= 1000121;
PTAHJHA						= 1000150;
HALDBERK		 			= 1000160;
LILINA			 			= 1000178;
DODOROBA					= 1000196;
IVAN			 			= 1000197;
MERODAULYN		 			= 1000008;
THEWY_PIRATE				= 1000117;
FRECKLED_PIRATE				= 1000119;
ASSESSOR3					= 1000452;
ASSESSOR4					= 1000453;
COQUETTISH_PIRATE			= 1000868;
VOLUPTUOUS_PIRATE			= 1000115;
PEACOCKISH_PIRATE			= 1000118;
TRIGGER_ACN_LOWER			= 1090083;
TRIGGER_ACN_UPPER			= 1090084;
ESTRILDA					= 1000273;
PFYNHAEMR					= 1000060;
MRKR_ADVGUILD				= 11000301;
MRKR_BADERON				= 11000302;
MRKR_WAEKBYRT				= 11000303;
MRKR_PSHASTALICIA1			= 11000304;
MRKR_PSHASTALICIA2			= 11000305;
MRKR_FSHGUILD				= 11000306;
MRKR_TRIGGER_SEAFLD			= 11000307;
MRKR_PTAHJHA				= 11000308;
MRKR_PSHARCGUILD1			= 11000309;
MRKR_PSHARCGUILD2			= 11000310;
```

## Markers
```
MRKR_ADVGUILD				= 11000301;
MRKR_BADERON				= 11000302;
MRKR_WAEKBYRT				= 11000303;
MRKR_PSHASTALICIA1			= 11000304;
MRKR_PSHASTALICIA2			= 11000305;
MRKR_FSHGUILD				= 11000306;
MRKR_TRIGGER_SEAFLD			= 11000307;
MRKR_PTAHJHA				= 11000308;
MRKR_PSHARCGUILD1			= 11000309;
MRKR_PSHARCGUILD2			= 11000310;
```

## Flags/Counters
```

```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function seq000_010_onTalk(player, quest, npc, classId)
function seq000_100_onTalk(player, quest, npc, classId)
function onPush(player, quest, npc)
function onNpcLS(player, quest, from, msgStep)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
-- processEvent2002 has just returned the player from the scholarlies and
-- processEvent2002_2 for the edge case where the player walks back to the
callClientFunction(player, "delegateEvent", player, quest, "processEvent200");
callClientFunction(player, "delegateEvent", player, quest, "processEvent215");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_8");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400");
callClientFunction(player, "delegateEvent", player, quest, "processEvent215_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400_7");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent400");
callClientFunction(player, "delegateEvent", player, quest, "processEvent410_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent410_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent410_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent410_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent600");
callClientFunction(player, "delegateEvent", player, quest, "processEvent420_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent600_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2000");
callClientFunction(player, "delegateEvent", player, quest, "processEvent610_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2000");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2000_10");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2000_11");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2000_10");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2000_10");
callClientFunction(player, "delegateEvent", player, quest, "processEvent2002_2");
callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
callClientFunction(player, "delegateEvent", player, quest, "sqrwa", REWARD_EXP, 1, 1, 2);
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200_7");
callClientFunction(player, "delegateEvent", player, quest, "processEvent200");
... (+19 more)
```

## Items / rewards
```
quest:SetENpc(BADERON, QFLAG_REWARD);
player:AddItem(1000001, 15000);
```

## Instance entry/exit
```
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -430.55, 40.2, 185.41, 1.89);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -430.55, 40.2, 185.41, 1.89);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6, -754.03, 7.352, 382.872, 3.133);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6, -754.03, 7.352, 382.872, 3.133);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6, -754.03, 7.352, 382.872, 3.133);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -430.55, 40.2, 185.41, 1.89);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7);
GetWorldManager():WarpToPosition(player, -764.519, -3.146, 384.154, 1.575);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPosition(player, -785.938, -0.62, 189.044, 3.09);
GetWorldManager():WarpToPublicArea(player);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110003, 'Legends Adrift', 'Man1l0', 110002, 8)
REWARDS:
none found in gamedata_quest_rewards.sql
```


