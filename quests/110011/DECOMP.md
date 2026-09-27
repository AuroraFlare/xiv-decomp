# Quest 110011 (man1u0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man1u0.lua (617 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0; 	-- Speak to Momodi and other Adventurers in the PrivateArea
SEQ_005 = 5; 	-- Speak with Attendant at the Platinum Mirage (Gagaruna).
SEQ_010 = 10; 	-- Enter the Gambling Halls beyond the lobby in Platinum Mirage.
SEQ_015 = 15;   -- Niellefresne and Greinfarr gambling and Thancred accused of cheating.
SEQ_020 = 20;	-- Contact Momodi via Linkpearl.
SEQ_025 = 25;	-- Talk to Deaustie at the Weaver's Guild.
SEQ_028 = 28;	-- Find Flhammin in Northern Thanalan
SEQ_030 = 30;	-- Same as SEQ_028.
SEQ_035 = 35;	-- Ascillia Appears in PrivateArea Northern Thanlan, talk to her.
SEQ_040 = 40;	-- Contact Momodi via Linkpearl.
SEQ_045 = 45;	-- Go to the Thaumaturges Guild -- rework section
SEQ_050 = 50;	-- Mumuepo tells player Flhammin spoke about the dark arts. Find someone among the Thaumaturges who knows more.
SEQ_055 = 55;	-- Speak to Niellefresne.
SEQ_060 = 60;	-- Seek out Mumepo of the thaumaturges guild.
SEQ_065 = 65;	-- Contact Momodi.
SEQ_070 = 70;	-- Meet Momodi back at the quicksand.
```

## NPCs/Actors
```
MOMODI                      = 1000841;
RUMINATING_ELEZEN			= 1000942;
WELL_DRESSED_MIDLANDER		= 1000943;
QUEERLY_CORDINATED_LALAFELL = 1000944;
SILVER_HAIR_SUDUCTRESS		= 1000945;
WAXEN_FACE_WIDOWER			= 1000946;
LUMBERING_LALAFELL			= 1000947;
GAGARUNA					= 1000862;
QATA_NELHAH					= 1001462;
MAMMET						= 1001455;
POPORI						= 1000651; --Npc show has no defaultTalk or quest Set. This Npc from what I can find no affilation with this quest?
GAMBHALL_TRIGG				= 1090114;
KOCKACHA					= 1001504;
PATIENT_CROW				= 1001505;
GWENOLIE					= 1001506;
RAGINHART					= 1001507;
ROOM_TRIGG					= 1090283;
THANCRED				 	= 1000948;
NIELLEFRENSE				= 1001867;
FLHAMINN					= 1000038;
CORGUEVAIS					= 1001054;
GREINFARR					= 1000039;
POPOKKULI					= 1000040;
SESERUKKA					= 1000041;
QOQOBA						= 1000855;
DEAUSTIE					= 1000293;
NORTH_THANTRIGG				= 1090077;
FLHAMINN_TRIGG				= 1090075;
ASCILLIA					= 1000042;
YAYAKE						= 1000846;
GEGEISSA					= 1001424;
THAUMA_TRIGG				= 1090045;
THAUMA2_TRIGG				= 1090047;
DOWNCAST_DERELICT			= 1001214;
SWOLLEN_EYED_STRUMPET		= 1001215;
ZSSAPA						= 1000887;
SINETTE						= 1001145;
AILING_ROEGADYN				= 1001216;
GOGOFU						= 1000046;
KUKUMUKO					= 1000070;
MRKR_MOMODI             	= 11001101; --SEQ 0/70
MRKR_GAGARUNA				= 11001102; --SEQ 5
MRKR_GAMBLINGHALL			= 11001103; --SEQ 10
MRKR_THANCRED				= 11001104; --SEQ 15
MRKR_DEAUSTIE				= 11001105; --SEQ 25
MRKR_NORTHERNTHANALAN		= 11001106; --SEQ 28\30
MRKR_ASCILLIA				= 11001108; --SEQ 35
MRKR_YAYAKE					= 11001109; --SEQ 40
MRKR_HALL					= 11001110; --SEQ 50
MRKR_NIELLEFRESNE			= 11001111; --SEQ 55
```

## Markers
```
MRKR_MOMODI             	= 11001101; --SEQ 0/70
MRKR_GAGARUNA				= 11001102; --SEQ 5
MRKR_GAMBLINGHALL			= 11001103; --SEQ 10
MRKR_THANCRED				= 11001104; --SEQ 15
MRKR_DEAUSTIE				= 11001105; --SEQ 25
MRKR_NORTHERNTHANALAN		= 11001106; --SEQ 28\30
MRKR_ASCILLIA				= 11001108; --SEQ 35
MRKR_YAYAKE					= 11001109; --SEQ 40
MRKR_HALL					= 11001110; --SEQ 50
MRKR_NIELLEFRESNE			= 11001111; --SEQ 55
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
function onPush(player, quest, npc)
function onNotice(player, quest, target)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
-- processEvent028_2, a warning about the route and its armed escort.
callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent010_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_7");
callClientFunction(player, "delegateEvent", player, quest, "processEvent015_8");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_5");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_6");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_7");
callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
callClientFunction(player, "delegateEvent", player, quest, "processEvent021");
callClientFunction(player, "delegateEvent", player, quest, "processEvent021_2"); --Needs investigating for retail accuracy.
callClientFunction(player, "delegateEvent", player, quest, "processEvent025_2"); --Needs investigating for retail accuracy.
callClientFunction(player, "delegateEvent", player, quest, "processEvent028");
callClientFunction(player, "delegateEvent", player, quest, "processEvent028_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
callClientFunction(player, "delegateEvent", player, quest, "processEvent055_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
callClientFunction(player, "delegateEvent", player, quest, "processEvent070_2");
callClientFunction(player, "delegateEvent", player, quest, "processEvent070_3");
... (+27 more)
```

## Items / rewards
```
-- Quest Items
quest:SetENpc(MOMODI, QFLAG_REWARD);
player:AddItem(1000001, 15000);
```

## Instance entry/exit
```
SEQ_000 = 0; 	-- Speak to Momodi and other Adventurers in the PrivateArea
SEQ_035 = 35;	-- Ascillia Appears in PrivateArea Northern Thanlan, talk to her.
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -73.811, 195, 78.759, -0.448);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -73.811, 195, 78.759, -0.448);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 6, 15, -204.9441, 0, -159.944, 1.591);
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 7, 15, -134.301, 1, -159.996, 1.581);
--This PrivateArea has a set of chairs in front of the desk, Thancred is sitting in one of them.
GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 6, 15, -204.9441, 0, -159.944, 1.591);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, 290.640, 245.201, -875.147, 2.315);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, 290.640, 245.201, -875.147, 2.315);
GetWorldManager():WarpToPosition(player, -294.941, 206, 231.882, -1.567);
GetWorldManager():WarpToPosition(player, -294.941, 206, 231.882, -1.567);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110011, 'Golden Sacrifices', 'Man1u0', 110010, 8)
REWARDS:
none found in gamedata_quest_rewards.sql
```


