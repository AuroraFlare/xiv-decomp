# Quest 110010 (man0u1.lua)
Source: FF14-Memory/Data/scripts/quests/man/man0u1.lua (1686 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0; -- Ul'dah Adventurer's Guild
SEQ_005 = 5; -- Run to Camp Black Brush & Attune
SEQ_010 = 10; -- Return to the Guild.
SEQ_012 = 12; -- Speak to Momodi
SEQ_015 = 15; -- Visiting guilds (GSM, GLD)
SEQ_045 = 45; -- Visit Amajina & Sons (Miners Guild)
SEQ_050 = 50; -- Emotes from Flhaminn
SEQ_057 = 57; -- Put an end to enraged Miners with Emotes
SEQ_058 = 58; -- Calm Thaumaturge down. Accused of stealing. Talk to Flhammin again.
SEQ_060 = 60; -- Head to the Gates of Nald
SEQ_065 = 65; -- Protect Flhaminn from beastmen\Escort Mission
SEQ_070 = 70; -- Arrived at Black Brush with Flhaminn and find out the camp was under attack.
SEQ_075 = 75; -- Thancred arrives at Black Brush, Ascillia is entrusted to him.
SEQ_080 = 80; -- Return to Miners Guild with Flhaminn after task is complete.
SEQ_085 = 85; -- Contact Momodi via Linkpearl.
SEQ_090 = 90; -- Talk to Nogeloix in the Alchemist Guild.
SEQ_095 = 95; -- Pass through doors in Alchemist Guild.
SEQ_100 = 100; -- Make rounds to the sickrooms.
SEQ_105 = 105; -- Contact Momodi via Linkpearl
SEQ_110 = 110; -- Meet Momodi back at the Quicksand.
```

## NPCs/Actors
```
MOMODI                      = 1000841;
UNDAUNTED_ADVENTURER		= 1000936;
GREEDY_MERCHANT				= 1000937;
LIONHEARTED_ADVENTURER		= 1000938;
SPRY_SALESMAN				= 1000939;
UPBEAT_ADVENTURER			= 1000940;
SEEMINGLY_CALM_ADVENTURER   = 1000941;
THANCRED					= 1000948; -- 1000010
OTOPA_POTTOPA               = 1000864;
OVERCOMPETITIVE_ADVENTURER	= 1000807;
PRIVATEAREA_PAST_EXIT		= 1290002;
OCOCO						= 1000666;
BLACKBRUSH_AETHERYTE			= 1280032;
ELECOTTE					= 1000950;
FRUHYBOLG					= 1000964;
ABYLGO_HAMYLGO				= 1000965;
QMHALAWI					= 1000969;
PAPAWA						= 1000962;
LULUTSU						= 1000863;
SWERDAHRM					= 1000967;
UNDEFEATED_GLADIATOR		= 1001020;
POORLY_OUTFITTED_GLADIATOR	= 1000995;
AGGRIEVED_GLADIATOR			= 1000997;
DISHEARTENED_GLADIATOR		= 1000999;
GLD_TRIG					= 1090283;
COL_TRIG					= 1090141;
GLD2_TRIG					= 1099502;
COLISEUM_POST_TRIG			= 1099501;
ESCORT_TRIG					= 1090004; --Placing this in Ul'dah rather than Thanalan fixes a bug SE never fixed.
SEQ70_TRIG					= 1090077; --Added temporarily to end "escort seq."
MIN_TRIGG					= 1090044;
ALCH_TRIGG					= 1090119;
SEQ100_TRIGG				= 1090121;
SEQ105_TRIGG				= 1090120;
LINETTE						= 1000861;
FLHAMINN					= 1000038;
FLHAMINN_EMOTE			    = 1000842;
LINETTE						= 1000861;
SHILGEN						= 1000637;
NORTMOEN					= 1600042;
TYAGO_MOUI					= 1001203;
NITTMA_GUTTMA				= 1001286;
CORGUEVAIS					= 1001054;
ASTONISHED_ADVENTURER		= 1000895;
MONITORING_MINER			= 1001289;
MOCKING_MINER				= 1001288;
MUSCULAR_MINER				= 1000690;
MAUDLIN_MINER				= 1001287;
MADDENED_MINER				= 1001284;
MANIC_MINER					= 1001283;
DISPLEASED_DANCER			= 1001290;
CLOSE_FISTED_WOMAN			= 1000981;
ASCILLIA					= 1000042;
REGARDING_ROEGADYN			= 1000811;
UNSAVORY_CUR				= 1000814;
UNTIDY_OUTLANDER			= 1000808;
HELPLESS_HYUR				= 1000817;
TROUBLED_TRADER				= 1000812;
FRIGHTENED_LALAFELL			= 1000810;
MALNOURISHED_MIDLANDER		= 1000809;
... (+32 more)
```

## Markers
```
MRKR_MOMODI             	= 11001001; --SEQ 0
MRKR_BLACKBRUSH  			= 11001002; --SEQ 5
MRKR_SEQ10_MOMODI			= 11001003; --SEQ 10
MRKR_SEQ12_MOMODI			= 11001004;	--SEQ 12
MRKR_GOLDSMITH				= 11001005; --SEQ 15
MRKR_GLADIATOR				= 11001006; --SEQ 15
MRKR_GLADIATOR2				= 11001007; --SEQ 15
MRKR_GLADIATOR3				= 11001008; --SEQ 15
MRKR_LINETTE				= 11001009;	--SEQ 45
MRKR_FLHAMMIN				= 11001010; --SEQ 50
MRKR_MANIC_MINER			= 11001011; --SEQ 57
MRKR_MADDENED_MINER			= 11001012; --SEQ 57
MRKR_FLHAMMIN2				= 11001013; --SEQ 58
MRKR_NALD_GATE				= 11001014; --SEQ 60
MRKR_ASCILLIA				= 11001015; --SEQ 65
MRKR_ASCILLIA2				= 11001016; --SEQ 70
MRKR_MINERS					= 11001017; --SEQ 75
MRKR_NOGELOIX				= 11001018; --SEQ 90
MRKR_DOOR2					= 11001019; --SEQ 95
MRKR_DOOR3					= 11001020; --SEQ 100
MRKR_MOMODI_END				= 11001021; --SEQ 105, 110
```

## Flags/Counters
```
CNTR_SEQ15_GSM			= 0;
CNTR_SEQ15_GLD			= 1;
CNTR_SEQ50_EMOTE		= 2; -- Also used for Manic and Maddened Miner.
FLAG_MANIC_EMOTE		= 0;
FLAG_MADDENED_EMOTE		= 1;
FLAG_SEQ15_COURT_FIGHT_ACTIVE = 2;
FLAG_SEQ15_POST_COLISEUM_CS_DONE = 3;
FLAG_SEQ000			= 0;
```

## Dialog branches / handlers
```
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function onTalk(player, quest, npc)
function onCommand(player, quest, npc, eventName)
function courtLog(message)
function hasCourtFightDirector(player)
function clearStaleCourtFightFlag(player, quest, data)
function courtRunProcessEvent035FromPush(player, quest, data, ownerName)
function courtRunGld2Followup(player, quest, data, subseqGSM)
function startCourtFightProbe(player, quest, data)
function startMan0u1EscortContent(player, quest)
function startMan0u1EscortContentDirect(player, quest)
function testMan0u1EscortCompletionCutscene(player, quest)
function onPush(player, quest, npc)
function courtCompleteMinerEmotes(player, quest, data)
function onEmote(player, quest, npc, eventName)
function onNotice(player, quest, target)
function onNpcLS(player, quest, from, msgStep)
function seq000_onTalk(player, quest, npc, classId)
function seq005_onTalk(player, quest, npc, classId)
function seq015_onTalk(player, quest, npc, classId)
function seq015_endSequence(player, quest)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
processEventMomodiStart				Initial cutscene upon quest starting.
processEvent000_1					"Instances are special areas that are entered upon fulfilling certain requirements, such as progressing in a quest. There will always be a message telling you when you have entered an instance, and your minimap will show its boundaries."
processEvent000_2					Undaunted Adventurer: "Gil, gil, gil. That's what it's all about here in Ul'dah. Everything's got a price―even life."
processEvent000_3					Greedy Merchant: "Were there any casualties at the parade? There's a pretty gil to be made out of funerals, you know."
processEvent000_4					Spry Salesman: "There's plenty of rich folk around here. If you try and wring a few gil out of one of them, just make sure you ain't the poor sod that ends up with a mark on his back."
processEvent000_5					Lionhearted Adventurer: "You've got to be one of three things to survive here―bloody clever, bloody strong, or bloody lucky! If you ain't, Ul'dah'll be the end of you, sure as your poxy-arsed ma was your beginning."
processEvent000_6					Upbeat Adventurer: "Did you hear!? Greinfarr the Great beat that rampaging beast at the parade to a bloody pulp!The Garlean presence in Eorzea is no cause for concern."
processEvent000_7					Seemingly Calm Adventurer: "The Garlean presence in Eorzea is no cause for concern."
processEvent000_8					Over-Competitive Adventurer: "ord is, an extremely valuable mineral vein was found deep within the Nanawa Mines. They say that's why they ain't allowin' none to enter."
processEvent000_9					Opotopa Pottopa: "Ala Mhigo has fallen into the hands of the Garlean Empire, and the number of Ala Mhigan refugees here in Ul'dah grows daily."
processEvent000_10					???: "No doubt that beast would have been ushered onto the bloodsands of the Coliseum with the greatest fanfare. A true shame that it had to be put down."
processEvent010						MOMODI - Expects a zone transition out of the PrivateArea afterwards
processEvent010_2					Momodi reminder: "Best attune yourself to the aetheryte at Camp Black Brush before aught else."
processEvent013						Momodi Linkshell speech when you touch the aetheryte.
processEvent013_2					Momodi Linkshell speech reminder?
processEvent015						Returning to Momodi speech. "The prodigal son returns! So, how went the treasure huntin'? Happen upon any more precious little flowers?"
processEvent017						Talking to Momodi again. "Ah, yes! I've remembered! Don't expect to find a flower like that last one every time you go traipsin' about. For most folk, a treasure such as that is a once-in-a-lifetime find."
processEvent017_2					Momodi reminder speech: "<sigh> Gods... Very well, let's try this again. I'll talk nice and slow this time. How's that?"
processEvent017_3					Momodi reminder speech: "Did you bother to head to the Coliseum with the pass I gave you? If you fancy learnin' to use a sword, there's no place finer in all Eorzea."
processEvent017_4					Momodi reminder speech: "Did you find Eshtaime's Lapidaries? Those greedy whoresons are always happy to get their mitts on a rare flower."
processEvent020
processEvent025						WorldMaster Message about Linkshells.
processEvent020_2					:"Our commitment to produce the finest in fineries has even attracted the patronage of the royal family."
processEvent030
processEvent030_2					???: "Do you wish to fight in the Coliseum? Hmph, another bloody <item>, is it? You damned adventurers and your special favor."
processEvent030_3					???: "I heard in addition to being a fearless warrior, Greinfarr is also the Coliseum owner's son. They say he oft goes on long trips alone─some sort of ascetic training ritual."
processEvent030_4					???: "Gods, have you any inkling how much gil went into organizing that parade? And the Coliseum's main attraction was killed."
processEvent030_5					???: "This will no doubt increase Greinfarr's popularity among the masses. Any pupils of his certainly have a bright future"
processEvent030_6					???: "They're short-handed for the next match...but I'm not at full strength. Still, I'd be less than a man if I didn't fight, seeing what Master Greinfarr did for us."
processEvent030_7					???: "That lackwit of a thaumaturge made a right bloody mess of things. The entire faith of Nald'thal should be held accountable for all costs, if you ask me."
processEvent030_8					???: "I can't believe the tourney of beasts was canceled. You have no idea..."
processEvent030_9					???: "The whole parade incident was Corguevais's fault, that accursed thaumaturge."
processEvent030_10					???: "I never studied logic at the Phrontistery, but it seems to me that if Greinfarr put down the beast at the parade..."
processEvent030_11					???: "The tourney...I... I meant to fight to show my dearly beloved the fierceness of my love for him─to fell the foul beast by the light of the sun, and then offer him my maidenhood by the light of the moons."
processEvent030_12					WorldMaster message.....
processEvent032_2					???: "The best of their warriors remain behind to carry on that useless fight."
processEvent032_3					???: "Master Greinfarr is close friends with Niellefresne, the son of the owner of Eshtaime's Lapidaries."
processEvent032_4					???: "You there, have you seen the owner? I heard that he headed out with the master of the Miners' Guild."
processEvent035
processEvent040
... (+247 more)
```

## Items / rewards
```
processEvent000_2					Undaunted Adventurer: "Gil, gil, gil. That's what it's all about here in Ul'dah. Everything's got a price―even life."
processEvent000_3					Greedy Merchant: "Were there any casualties at the parade? There's a pretty gil to be made out of funerals, you know."
processEvent000_4					Spry Salesman: "There's plenty of rich folk around here. If you try and wring a few gil out of one of them, just make sure you ain't the poor sod that ends up with a mark on his back."
processEvent030_4					???: "Gods, have you any inkling how much gil went into organizing that parade? And the Coliseum's main attraction was killed."
-- Quest Items
quest:SetENpc(MOMODI, QFLAG_REWARD);
player:AddItem(1000001, 6000);
player:AddItem(1000001, 3000);
player:AddItem(1000001, 2000);
```

## Instance entry/exit
```
processEvent010						MOMODI - Expects a zone transition out of the PrivateArea afterwards
SEQ_000  PrivateArea 4, Quicksand needs doors shut.
SEQ_070  Blockers for PrivateArea 4, where player leaves radius teleports player back to privatezone.
COURT_ESCORT_CONTENT_DIRECTOR = "Quest/QuestDirectorMan0u102";
COURT_ESCORT_CONTENT_ZONE	= 170;
COURT_ESCORT_CONTENT_AREA_PATH = "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent";
COURT_ESCORT_ENTRY_X			= -31.239;
COURT_ESCORT_ENTRY_Y			= 183.087;
COURT_ESCORT_ENTRY_Z			= -74.303;
GetWorldManager():DoZoneChange(player, 175, "PrivateAreaMasterPast", 4, 15, -75.242, 195.009, 74.572, -0.046);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
--GetWorldManager():WarpToPublicArea(player);
-- processEvent035 ends with startFadeInCutSceneAfterWarp. Complete that
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, unpack(returnPosition));
GetWorldManager():WarpToPublicArea(player, unpack(returnPosition));
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -192.400, 174.890, 160.119, 1.576);
if (player.CurrentArea.ZoneId ~= COURT_ESCORT_CONTENT_ZONE or player.CurrentArea:IsPrivate()) then
local sourceArea = GetWorldManager():GetArea(COURT_ESCORT_CONTENT_ZONE);
COURT_ESCORT_CONTENT_DIRECTOR);
-- processEvent075 ends with startFadeInCutSceneAfterWarp. Keep the Gate
-- event alive until DoZoneChangeContent captures it; the staged transition
GetWorldManager():DoZoneChangeContent(
COURT_ESCORT_ENTRY_X,
COURT_ESCORT_ENTRY_Y,
COURT_ESCORT_ENTRY_Z,
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -192.241, 194.5, 195.317, -0.008);
... (+5 more)
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110010, 'Court in the Sands', 'Man0u1', 110009, 1)
REWARDS:
none found in gamedata_quest_rewards.sql
```


