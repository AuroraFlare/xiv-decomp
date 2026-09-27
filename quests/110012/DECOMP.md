# Quest 110012 (man2u0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man2u0.lua (672 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0; -- Travel to Chocobo Stables and talk to Rururaji.
SEQ_005 = 5; -- Everyone sets out after Corguevais. Set out by Chocobo Coach and give pursuit.
SEQ_010 = 10; -- Corguevais summons a swarm of Minemites. Defeat them and escape.
SEQ_015 = 15; -- Visit the Phrontistery.
SEQ_020 = 20; -- Seek out F'lhaminn in the sickrooms.
SEQ_025 = 25; -- Find and speak to Thancred.
SEQ_030 = 30; -- Contact Momodi via Linkpearl.
SEQ_035 = 35; -- Head to Black Brush.
SEQ_040 = 40; -- Go to Ul'dah outside the Arrzaneth Ossuary (Thaumaturge's Guild).
SEQ_045 = 45; -- Niellefresne lying on ground with Ascilia by his side.
SEQ_050 = 50; -- Dark Clouds loom over Ul'dah, meteors rain down in all directions.
SEQ_055 = 55; -- Player found unconscious, brought back to Adventurer's Guild.
```

## NPCs/Actors
```
MOMODI                      = 1000841;
RURURAJI					= 1000840;
ASCILLIA					= 1000042;
FLHAMMIN					= 1000038;
NIELLEFRESNE				= 1001867;
PHRONTISTERY_TRIGGER		= 1090119;
NOGELOIX					= 1000597;
SICKROOM_TRIGGER			= 1090118;
PRIVATEAREA_EXIT_TRIGGER	= 1090144;
CHAPEAUED_CHAP				= 1001277;
WORRISOME_ASSISTANT			= 1001207;
WELLWASHED_LEECH			= 1001210;
SICKROOM_EXIT_TRIGGER		= 1090141;
PHRONTISTERY_EXIT_TRIGGER	= 1090168;
BLACKBRUSH_TRIGGER			= 1090169;
ARRZANETH_TRIGGER			= 1090253;
CRYPT_TRIGGER				= 1090131;
GOGOFU						= 1000046;
HAHAYO						= 1000047;
ROROJARU					= 1000374;
MRKR_RURURAJI 				= 11001201;
MRKR_PHRONTISTERTY 			= 11001202;
MRKR_BATTLE					= 11001203;
MRKR_FLHAMMIN				= 11001204;
MRKR_BLACKBRUSH				= 11001205;
MRKR_ARRZANETH				= 11001206;
MRKR_CRYPT					= 11001207;
MRKR_MOMODI					= 11001001; --Set Temporarily until "sqrwa" is played after player is warped into Quicksand.
```

## Markers
```
MRKR_RURURAJI 				= 11001201;
MRKR_PHRONTISTERTY 			= 11001202;
MRKR_BATTLE					= 11001203;
MRKR_FLHAMMIN				= 11001204;
MRKR_BLACKBRUSH				= 11001205;
MRKR_ARRZANETH				= 11001206;
MRKR_CRYPT					= 11001207;
MRKR_MOMODI					= 11001001; --Set Temporarily until "sqrwa" is played after player is warped into Quicksand.
```

## Flags/Counters
```
MAN2U0_CNTR_MINEMITE_KILLS		= 0;
MAN2U0_FLAG_DUTY_ACTIVE			= 0;
MAN2U0_FLAG_DUTY_COMPLETE_PENDING = 1;
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function isMan2u0BattleArea(area)
function setMan2u0BattleBoundary(area)
function removeMan2u0BattleExit(area)
function removeMan2u0BattleGreinfarr(area)
function removeMan2u0BattleNiellefresne(area)
function setMan2u0FlhamminWoundedPose(area)
function clearMan2u0ClaimParty(player)
function finishMan2u0MinemiteDuty(player, quest)
function canStartMan2u0MinemiteDuty(player)
function startMan2u0MinemiteDuty(player, quest, playEntryCutscene)
function onTalk(player, quest, npc)
function onPush(player, quest, npc)
function onNotice(player, quest, target, eventName)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
processEventMomodiStart			Quest Start from Momodi
processEvent000_2				Momodi: "Been hearin' naught but bad rumors of late. Dark talk of cursed magicks bringin' the dead back to life?proper nasty stuff."
processEvent005					Multiple Cutscenes and Warp into Battle Instance with Minemites
processEvent005_2				???: "F'lhaminn's in danger? Where!? Gods, not again... What the bloody hells is goin' on?"
processEvent005_3				???: "Help us, [@SPLIT([@STRING($EB(1))], ,1)]. Take this gold powder. The beasts will be drawn to it. You must keep them away from here."
processEvent005_4				???: "The beasts will be drawn to the gold powder. Use it to keep them away from here."
processEvent005_5				???: "Use the gold dust I gave you to lure the beasts. You must not let them come near here."
processEvent005_6				???: "Lure the bloody things to me. I'll see them all dead!"
processEvent005_7				???: "Bring them to my blade."
processEvent030					Cutscene and Warp
processEvent030_2				???: "Have you come to visit a patient? F'lhaminn? Yes, she is being treated here. The door at the end of the corridor will lead you to the sickrooms. You are free to pass."
processEvent040					Cutscene and Warp
processEvent040_2				???: "I have been ordered to care for Damielliot. There are now some twenty of us tending to him."
processEvent040_3				???: "Ow! Quit it. Ow! Quit it. Ow! Quit it."
processEvent040_4				???: "Are you here to visit a patient?"
processEvent040_5				???: "I thought the rumors of F'lhaminn's accident were just that?rumors. But then I saw a gaggle of Ul'dah's most prestigious personages pass by as if they were visiting someone. Could it be true?"
processEvent050					Cutscene and Warp
processEvent050_2				???: "Please, you must help us. If you happen to see the bard Thancred, tell him to come with all haste to Amajina & Sons Mineral Concern."
processEvent060					Cutscene and Warp
processEvent065_2				Gogofu/Bystander: "There's been sightin's of an exile wanderin' close to the city. Damn bold, whoever it is."
processEvent070					Cutscene
processEvent070_2				???: "So they'd already found the exile, eh? Shame, that. Still, say what you will of the city guard, them gladiators and pugilists do get things done."
processEvent080					Cutscene and Warp
processEvent085					Multiple Cutscenes and Warp
processEventSystemMessage		WorldMaster Message about Traveling to Ul'dah Market Ward
callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
-- Check the destination before processEvent005 can arm its after-warp fade.
callClientFunction(player, "delegateEvent", player, GetStaticActor("Man2u0"), "processEvent005");
callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent005_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent005_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_5");
... (+12 more)
```

## Items / rewards
```
-- Quest Items
quest:SetENpc(MOMODI, QFLAG_REWARD);
--			local hasIssuance = player:GetItemPackage(INVENTORY_KEYITEMS):HasItem(gcIssuances[classId]);
player:AddItem(1000001, 30000);
--			player:AddItem(2001006, 1);
```

## Instance entry/exit
```
processEvent005					Multiple Cutscenes and Warp into Battle Instance with Minemites
processEvent030					Cutscene and Warp
processEvent040					Cutscene and Warp
processEvent050					Cutscene and Warp
processEvent060					Cutscene and Warp
processEvent080					Cutscene and Warp
processEvent085					Multiple Cutscenes and Warp
MAN2U0_BATTLE_PRIVATE_AREA		= "PrivateAreaMasterPast";
MAN2U0_BATTLE_ENTRY_X			= -117.242;
MAN2U0_BATTLE_ENTRY_Y			= 215.653;
MAN2U0_BATTLE_ENTRY_Z			= -769.757;
MAN2U0_BATTLE_BOUNDARY_X		= MAN2U0_BATTLE_ENTRY_X;
MAN2U0_BATTLE_BOUNDARY_Z		= MAN2U0_BATTLE_ENTRY_Z;
and area:GetPrivateAreaName() == MAN2U0_BATTLE_PRIVATE_AREA
and area:GetPrivateAreaType() == MAN2U0_BATTLE_PRIVATE_TYPE;
GetWorldManager():DoZoneChange(player, MAN2U0_BATTLE_ZONE, MAN2U0_BATTLE_PRIVATE_AREA, MAN2U0_BATTLE_PRIVATE_TYPE, 15, MAN2U0_BATTLE_ENTRY_X, MAN2U0_BATTLE_ENTRY_Y, MAN2U0_BATTLE_ENTRY_Z, MAN2U0_BATTLE_ENTRY_ROT);
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 8, 15, -204.9441, 0, -159.944, 1.591);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, -160.687, 0, -131.861, -0.578);
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 8, 15, -204.9441, 0, -159.944, 1.591);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -148.108, 2, -178.924, -1.620);
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 8, 15, -204.9441, 0, -159.944, 1.591);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7, -250.265, 202, 209.839, -0.181);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7, -250.265, 202, 209.839, -0.181);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110012, 'Calamity Cometh', 'Man2u0', 110011, 13)
REWARDS:
none found in gamedata_quest_rewards.sql
```


