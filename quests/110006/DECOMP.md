# Quest 110006 (man0g1.lua)
Source: FF14-Memory/Data/scripts/quests/man/man0g1.lua (1262 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0;	-- (Private Area) Roost Echo Scene.
SEQ_005 = 5;	-- Go attune at Camp Bentbranch
SEQ_010 = 10;	-- Attuned, go back to Miuonne. Info: <param1> If 1, Miounne gave you a tutorial guildleve else 0.
SEQ_012 = 12;	-- Talk to Miuonne again.
SEQ_015 = 15;	-- Find the LTW and CNJ Guilds. Info: Params 2 and 3 set to 5 and 15 will show the msg that you visited both guilds and to notify Miounne on the LS.
SEQ_040 = 40;	-- Go to BTN guild and talk to Opyltyl.
SEQ_050 = 50;	-- Learn the dance from the kids.
SEQ_055 = 55;	-- Chat with the kids.
SEQ_060 = 60;	-- Meet at White Wolf Gate.
SEQ_065 = 65;	-- Escort Mission Duty
SEQ_070 = 70;	-- Walk to the stump.
SEQ_071 = 71;	-- Exit the stump area.
SEQ_072 = 72;	-- Return to the BTN guild.
SEQ_075 = 75;	-- Contact Miounne on LS
SEQ_080 = 80;	-- Visit the LNC guid and talk to Willelda.
SEQ_085 = 85;	-- Talk to Buchard.
SEQ_090 = 90;	-- Talk to Buchard again.
SEQ_095 = 95;	-- Talk to Nuala.
SEQ_100 = 100;	-- Contact Miounne on LS
SEQ_105 = 105;	-- Return to the Roost and talk to Miounne.
```

## NPCs/Actors
```
BENTBRANCH_AETHERYTE = 1280062;
MIOUNNE                         = 1000230;
VKOROLON                        = 1000458;
WISPILY_WHISKERED_WOODWORKER    = 1000562;
AMIABLE_ADVENTURER              = 1001057;
MOROSE_MERCHANT                 = 1001058;
NARROW_EYED_ADVENTURER          = 1001059;
BEAMING_ADVENTURER              = 1001062;
WELL_BUNDLED_ADVENTURER         = 1001060;
UNCONCERNED_PASSERBY            = 1001648;
BLOCKER		                    = 1090372;
HEREWARD		= 1000231;
SOILEINE		= 1000234;
CNJ_TRIG		= 1090200;
YDA				= 1000009;
PAPALYMO		= 1000010;
O_APP_PESI		= 1000033;
INGRAM			= 1000372;
HETZKIN			= 1000460;
GUGULA			= 1000513;
SWETHYNA		= 1000680;
BIDDY			= 1000737;
CHALLINIE		= 1000956;
OPYLTYL					= 1000236;
FUFUCHA					= 1000237;
POWLE					= 1000238;
SANSA					= 1000239;
NICOLLAUX				= 1000409;
AUNILLIE				= 1000410;
ELYN					= 1000411;
RYD						= 1000412;
KIDS_TRIGGER			= 1090201;  -- needs existence
ESCORT_START_TRIGGER	= 1090202;  -- needs existence -- Also seq 60
ESCORT_END_TRIGGER		= 1090203;
STUMP_TRIGGER		= 1090204;
STUMP_EXIT_TRIGGER	= 1090205;
BTN_TRIGGER			= 1090046;
WILLELDA			= 1000242;
BURCHARD			= 1000243;
BURCHARD_INSTANCE	= 1002061;
TKEBBE			= 1000015;
FARRIMOND		= 1000017;
NUALA			= 1000681;
MANSEL			= 1000682;
CECILIA			= 1000683;
TURSTIN			= 1000733;
LANGLOISIERT	= 1000734;
HELBHANTH		= 1000735;
PASDEVILLET		= 1000738;
JIJIMAYA		= 1000741;
MRKR_S000_MIOUNNE				= 11000601;
MRKR_BENTBRANCH					= 11000602;
MRKR_S010_MIOUNNE				= 11000603;
MRKR_S015_HEREWARD				= 11000604;
MRKR_S015_SOILEINE				= 11000605;
MRKR_S015_CNJGUILD				= 11000606;
MRKR_S015_SWETHYNA				= 11000607;
MRKR_S040_OPYLTYL				= 11000608;
MRKR_S050_KIDS					= 11000609;
MRKR_S055_KIDS_TRIGGER			= 11000610;
... (+10 more)
```

## Markers
```
MRKR_S000_MIOUNNE				= 11000601;
MRKR_BENTBRANCH					= 11000602;
MRKR_S010_MIOUNNE				= 11000603;
MRKR_S015_HEREWARD				= 11000604;
MRKR_S015_SOILEINE				= 11000605;
MRKR_S015_CNJGUILD				= 11000606;
MRKR_S015_SWETHYNA				= 11000607;
MRKR_S040_OPYLTYL				= 11000608;
MRKR_S050_KIDS					= 11000609;
MRKR_S055_KIDS_TRIGGER			= 11000610;
MRKR_S060_ESCORT_START			= 11000611;
MRKR_S065_ESCORT_END			= 11000612;
MRKR_S070_STUMP_TRIGGER			= 11000613;
MRKR_S071_STUMP_EXIT_TRIGGER	= 11000614;
MRKR_S072_BTN_TRIGGER			= 11000615;
MRKR_S080_WILLELDA				= 11000616;
MRKR_S085_BURCHARD				= 11000617;
MRKR_S090_BURCHARD				= 11000618;
MRKR_S095_NUALA					= 11000619;
MRKR_S105_MIOUNNE				= 11000620;
```

## Flags/Counters
```
FLAG_EMOTE_DONE1	= 1;
FLAG_EMOTE_DONE2	= 2;
FLAG_EMOTE_DONE3	= 3;
FLAG_EMOTE_DONE4	= 4;
FLAG_EMOTE_DONE5	= 5;
FLAG_EMOTE_DONE6	= 6;
CNTR_SEQ15_LTW		= 0;
CNTR_SEQ15_CNJ		= 1;
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function seq000_onTalk(player, quest, npc, classId)
function seq015_onTalk(player, quest, npc, classId)
function seq015_endSequence(player, quest)
function seq050_onTalk(player, quest, npc, classId)
function onPush(player, quest, npc)
function onEmote(player, quest, npc, eventName) -- Needs programming from etc3g0
function onNotice(player, quest, target)
function onNpcLS(player, quest, from, msgStep)
function startMan0g1Content(player, quest)
function startMan0g1FinalEncounterTest(player, quest)
function testMan0g1CompletionCutscene(player, quest)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
processEvent100	First cutscene meeting Miounne. Should kick into this.
processEvent100_1	WorldMaster message about instances.
processEvent100_2	Morose Merchant: "Impurity's as bad as a curse, I tell ye."
processEvent100_3	Amiable Adventurer: "You would do well to fear the Twelveswood - and live in awe of it."
processEvent100_4	Well-Bundled Adventurer: "If you are planning to stay a while, you might want to learn a bit about the elementals."
processEvent100_5	Well-Bundled Adventurer: "The ancient elementals of the Twelveswood are much more powerful and wise than those from other parts of the world."
processEvent100_6	Beaming Adventurer: "You met a moogle? Well, count yourself as one of the lucky ones."
processEvent100_7	Narrow-Eyed Adventurer: "As if breaking of the hedge wasn't enough, it seems an airship crashed in the forest as well."
processEvent100_8	Whispily-Whiskered Adventurer: "In Gridania, there live a chosen few who are blessed by the forest."
processEvent100_9	 ???: "The Twelveswood is a sacred place, and runs thicker and deeper than you can imagine."
processEvent110	Cutscene exiting echo and Miounne telling you to go to Camp Bentbranch.
processEvent110_2	Miounne reminder message to go to Bentbranch.
processEvent013		Linkshell chat message from Miounne when you touch the Aetheryte. Gives tutorial leve.
processEvent013_2	Linkshell chat message from Miounne when you touch the Aetheryte. Sans tutorial leve.
processEvent114		Miounne speech when you return.
processEvent115		Miounne speech when you talk again. Tells you to go to the CNJ and LTW guilds.
processEvent115_2	Reminder message to go to the CNJ and LTW guilds.
processEvent120		Cutscene at the LTW guild.
processEvent123		Worldmaster Message teaching you about npc linkshells.
processEvent120_2	Reminder message after talking to the LTW guild.
processEvent125	Soileine Telling you to enter the chamber in the CNJ guild.
processEvent125_2	Soileine Reminder message to enter the chamber.
processEvent130	Cutscene into echo meeting O-App-Pesi and then Yda/Papalimo.
processEvent130_2	 ???: "The two outsiders brought by Swethyna of the Wood Wailers... There was something strange about them."
processEvent130_3	O-App-Pesi: "I pray a moment, please. Swethyna has important words which must be heard."
processEvent130_4	Yda: "Look, Papalymo, he's got horns! This must be one of those Padjal!"
processEvent130_5	Papalymo: "Manners, Yda. Gods, the Gridanians will think us raised in a gutter."
processEvent130_6	Gugula: "The fury of the elementals is sure to be wakened whenever the Hedge is broken through."
processEvent130_7	Ingram: "Brother O-App is a Padjal, of course."
processEvent130_8	Challinie: "We conjurers hear the whispers of the elementals, and see to it that their will is made known to all Gridanians."
processEvent130_9	 ???: "Where are those two outsiders from? We've had dealings with those from beyond the wood before, but never have I witnessed such insolence."
processEvent130_10	 ???: "If Swethyna is involved, it must be a matter of some import. The leader of the Wood Wailers wouldn't waste time dabbling in aught else."
processEvent135		Exiting the echo and more elemental explanation.
processEvent136		Same as above, but adds a worldmaster message about linkshells.
processEvent135_2	Miounne recap message to go to the LTW guild if you already went to the CNJ guild.
processEvent137_2	Miounne recap message to go to the BTN guild.
processEvent140		Cutscene entering the BTN guild into the emote test instance.
processEvent140_10	Fufucha Reminder message: "Let the younglings teach you the dance."
processEvent140_1	Aunillie: "Watch how I do it. You have to beckon the elementals near. Like this."
processEvent141_1	Aunillie "I wonder if the elementals dance as we do..."
... (+176 more)
```

## Items / rewards
```
man0g120 - processEvent120 - done - s015 - works - HEREWARD - Name ID: 1000324 - Model ID: 1000231 - Marker ID: 11000604
HEREWARD		= 1000231;
MRKR_S015_HEREWARD				= 11000604;
quest:SetENpc(HEREWARD, (subseqLTW <= 1) and QFLAG_TALK or QFLAG_OFF);
quest:SetENpc(MIOUNNE, QFLAG_REWARD);
player:AddItem(1000001, 6000);
elseif (classId == HEREWARD) then
player:AddItem(1000001, 2000);  -- Add 2000 gil
player:AddItem(1000001, 3000);
table.insert(possibleMarkers, MRKR_S015_HEREWARD);
```

## Instance entry/exit
```
processEvent180	Escort Duty End Cutscene. Warps into echo.
SOULS_CONTENT_DIRECTOR = "Quest/QuestDirectorMan0g101";
SOULS_CONTENT_ZONE = 150;
SOULS_CONTENT_AREA_PATH = "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent";
SOULS_ENTRY_X = -195.221;
SOULS_ENTRY_Y = 3.535;
SOULS_ENTRY_Z = -1022.112;
GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 2, 15, 67.034, 4, -1205.6497, -1.074);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -223.792, 12, -1498.369, -1.74);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -223.792, 12, -1498.369, -1.74);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -231.474, 12, -1500.86, 0.73);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, 176.13, 27.5, -1581.84, -1.0);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -353.05, 6.25, -1697.39, 0.774);  --Place NPCs in this
GetWorldManager():WarpToPublicArea(player, -209.817, 18, -1477.372, 1.4);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -769.740, 22.945, -1086.493, -1.039);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -231.474, 12, -1500.86, 0.73); -- Different private area with kids whispering
local sourceArea = GetWorldManager():GetArea(SOULS_CONTENT_ZONE);
local contentArea = sourceArea:CreateContentArea(player, SOULS_CONTENT_AREA_PATH, SOULS_CONTENT_SCRIPT, SOULS_CONTENT_PRIVATE_AREA, SOULS_CONTENT_DIRECTOR);
GetWorldManager():DoZoneChangeContent(player, contentArea, x or SOULS_ENTRY_X, y or SOULS_ENTRY_Y, z or SOULS_ENTRY_Z, rot or SOULS_ENTRY_ROT, 16);
return startMan0g1ContentInternal(player, quest, false, nil, SOULS_ENTRY_X, SOULS_ENTRY_Y, SOULS_ENTRY_Z, SOULS_ENTRY_ROT);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110006, 'Souls Gone Wild', 'Man0g1', 110005, 1)
REWARDS:
none found in gamedata_quest_rewards.sql
```


