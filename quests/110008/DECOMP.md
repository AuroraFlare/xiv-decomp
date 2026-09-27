# Quest 110008 (man2g0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man2g0.lua (925 lines, full body read)

## Stages (SEQ)
```
SEQ_000 = 0;		-- Speak with Nonolato at ARC Guild							[@SHEET(xtx/journalxtxFst,47]			"According to Miounne at the Adventurers' Guild, Dunstan has yet to be found despite the guilds' best efforts. She suggests that you offer to take part in a ranging to contribute to the effort. Proceed to the Quiver's Hold and speak to Nonolato."
SEQ_003 = 3;		-- Cutscene at ARC guild. Escort O-App						[@SHEET(xtx/journalxtxFst,48]			"During your visit, the Quiver's Hold is thrown into chaos as news arrives of some happening in the forest. Archers surge forth from the Hold, and Brother O-App-Pesi of the conjurers himself heads in the direction of the disturbance, as well. Whatever trouble has taken place, the situation is no doubt a perilous one. Speak with Nonolato, make whatever preparations you must, and escort Brother O-App-Pesi to the scene."
SEQ_004 = 4;		-- Instanced Fight with Elemental							[@SHEET(xtx/journalxtxFst,49]			"You find the young boy Khrimm standing before a tree afire... Before long the arbor elemental within comes forth in a fury, and Brother E[@1F]Sumi[@1F]Yan is unable to quell its greenwrath. You are left with no recourse but to battle the elemental. Make use of Brother O[@1F]App[@1F]Pesi's powers over the elements, and fight alongside the members of the Gods' Quiver and Wood Wailers."
SEQ_005 = 5;		-- Speak with A'naidjaa at CRP guild.						[@SHEET(xtx/journalxtxFst,50]			"You defeated the enraged elemental, yet the fury of the forest will not be quelled so easily. Brother O-App-Pesi suggests that it may be in the best interest of all to have Fye and her brother Dunstan leave the forest altogether. He has asked that you seek her out. Travel back to the Oak Atrium to find her."
SEQ_010 = 10;		-- Contact Miounne on the Linkpearl							[@SHEET(xtx/journalxtxFst,51]			"Fye comes to the Oak Atrium to see Zezekuta after hearing that Khrimm has angered the elementals. Thinking Khrimm to have been in the forest searching for her brother in her place, she cannot help but feel responsible. Contact Miounne via linkpearl and see if you can learn anything more of Khrimm."
SEQ_015 = 15;		-- Cutscene at CNJ Guild with Yda and Papalymo				[@SHEET(xtx/journalxtxFst,182]			"Miounne has informed you that there is word of a commotion at Stillglade Fane. Fearing that Khrimm may become a wildling, it is likely that the conjurers have taken him in to tend to his woodsin. Make your way there and see what is happening."
SEQ_020 = 20;		-- Instanced area at CNJ Guild with E-Sumi-Yan				[@SHEET(xtx/journalxtxFst,52]			"As you are asking Brother O-App-Pesi about Khrimm's condition, Papalymo and Yda return from the wood together with the wildling Dunstan, throwing Stillglade Fane into a maelstrom of confusion and terror. Go and have a closer look at this dreaded wildling."
SEQ_025 = 25;		-- Instanced area at CNJ Guild with Fye						[@SHEET(xtx/journalxtxFst,53]			"Brother E[@1F]Sumi[@1F]Yan has ordered a grand rite of purification, but fears that saving young Khrimm may require Dunstan to give his life. There are many preparations to be made for the festival. Leave Stillglade Fane so as not to get in the way. Speak to Soileine should you lose your way outside the guild."
SEQ_030 = 30;		-- Contact Miounne on Linkpearl								[@SHEET(xtx/journalxtxFst,54]			"At the entrance to Stillglade Fane you find Fye, who has come after hearing about the commotion. She wants nothing more than to see Khrimm, but the conjurers will not permit her entry. She has asked you to seek out one of the Brothers to allow her within."
SEQ_035 = 35;		-- Travel to Mih Khetto Amphitheatre						[@SHEET(xtx/journalxtxFst,55]			"You have asked Brother O-App-Pesi's permission for Fye to see Khrimm, but he has refused out of fear of Khrimm's woodsin. He instead introduces you to Dunstan, and requests that you tell Fye that her brother has returned to Gridania. Perhaps the two of them will be able to meet at the grand rite of purification. Head to Mih Khetto's Amphitheatre to make ready for the festival."
SEQ_040 = 40;		-- Instanced area in Mih Khetto Amphitheatre				[@SHEET(xtx/journalxtxFst,56]			"The grand rite is underway, and before long a group of moogles arrives, much to the delight of the children. They come bearing a message for you from the elementals. It seems that your role in being beckoned to the wood is to be a messenger of the Matron herself, the goddess Nophica. But what could that mean...? For now, seek out Fye and tell her that her brother is attending the festival."
SEQ_045 = 45;		-- Cutscene at Amphitheatre. Warp to instanced area			[@SHEET(xtx/journalxtxFst,57]			"You have told Fye of her brother's presence at the festival. The purification dances are almost underway, and the wildlings Khrimm and Dunstan have taken to the stage. However, when Brother E[@1F]Sumi[@1F]Yan begins to chant the ritual verses, Dunstan collapses. As you move to help him, the Echo reverberates and you suddenly find yourself in the middle of the forest..."
SEQ_050 = 50;		-- Echo cutscene											[@SHEET(xtx/journalxtxFst,58]			"Together with Papalymo and Yda, whom the Echo has brought with you, you walk until coming upon a familiar place. Before a large tree stands Khrimm, speaking to his parents and Dunstanâ”€the same people believed to have been turned into wildlings by the greenwrath. Angered by the conversation, Khrimm sets fire to the nearby tree..."
SEQ_055 = 55;		-- Cutscene back at Amphitheatre							[@SHEET(xtx/journalxtxFst,59]			"Finding yourself back at the festival in Gridania, you see Khrimm awakening following the success of the purification rite. But just then, dark clouds roll across the skies, and in their midst a great rift opens from which fiery meteors begin to fall in all directions. Amid the awe and terror of the people, Papalymo remarks that the winds of change have swept over Eorzea. Suddenly, you feel light-headed..."
SEQ_060 = 60;		-- Turn in quest with Miounne								[@SHEET(xtx/journalxtxFst,60]			"The calling of your name wakens you as if from a dream. Opening your eyes, you find yourself in the Roost in Gridania. Miounne of the Adventurers' Guild tells you that upon collapsing at the festival, you were brought to the inn by the mysterious hermit of the wood you saw earlier. He has asked that you come pay him a visit at the Waking Sands in the Merchants Ward of Ul'dah when you are able. It seems the time has come for you to journey forth from Gridania."
```

## NPCs/Actors
```
MIOUNNE						= 1000230;
OAPPPESI					= 1000033;
OAPPPESI_SEQ004				= 1000235;
NONOLATO					= 1000463;
ANAIDJAA					= 1000465;
YDA							= 1000009;
PAPALYMO					= 1000010;
ZEZEKUTA					= 1000240;
SOILEINE					= 1000234;
SOILEINE_INSTANCE			= 1700030;
DISQUIETEDLANCER			= 1000744;
DISCONCERTEDCONJURER		= 1000747;
ENTHUSIASTICARCHER			= 1000745;
EMBITTEREDARCHER			= 1000746;
SILKYHAIREDCONJURER			= 1000748;
WISELOOKINGNONJURER			= 1000743;
ENIGMATICCONJURER			= 1000749;
HERMENOST					= 1000751;
DUNSTAN						= 1000013;
DALMAS						= 1000750;
NHABAMAIMHOV				= 1000752;
ESUMIYAN					= 1000011;
FYE							= 1000014;
NIALL						= 1000754;
FUFUCHA						= 1000237;
BURCHARD					= 1000243;
URSBAEN						= 1001873;
NGOLBB						= 1000016;
FARRIMOND					= 1000017;
TKEBBE						= 1000876;
HANDELOUP					= 1000023;
GRINNAUX					= 1000024;
SQUEALINGSPRAT				= 1000826;
UNDERPRIVILEGEDORPHAN		= 1000825;
SUGARSTRUNGSCHOOLGIRL		= 1000824;
DESERTEDDAUGHTER			= 1000827;
TROUBLESOMETOMBOY			= 1000828;
AGINGELEZEN					= 1000756;
WISPILYWOODWORKER			= 1000562;
RESPECTABLEROEGADYN			= 1000755;
URBANEELEZEN				= 1000757;
MERRYOLDMATRON				= 1001488;
WELLGROOMEDWOMAN			= 1001489;
GOODNATUREDGOODWIFE			= 1001486;
OVERANIMATEDHYUR			= 1001485;
FASTIDIOUSFELLOW			= 1001487;
PSHCJGUILD					= 1090178;
PSHAMPHITHEATRE				= 1090179;
PSHSEQ045					= 1090180;
ELDID						= 1001469;
CECILY						= 1000326;
VKOROLON					= 1000458;
BECKON_WIND_WARD_ITEM		= 11000082;
BECKON_EARTH_WARD_ITEM		= 11000083;
BECKON_WATER_WARD_ITEM		= 11000084;
MRKR_NONOLATO			= 11000801; -- SEQ_000
MRKR_SEQ003OAPPPESI		= 11000802; -- SEQ_003
MRKR_ANAIDJAA			= 11000803; -- SEQ_005
MRKR_SOILEINE			= 11000804; -- SEQ_015
MRKR_PSHCNJGUILD		= 11000805;
... (+5 more)
```

## Markers
```
MRKR_NONOLATO			= 11000801; -- SEQ_000
MRKR_SEQ003OAPPPESI		= 11000802; -- SEQ_003
MRKR_ANAIDJAA			= 11000803; -- SEQ_005
MRKR_SOILEINE			= 11000804; -- SEQ_015
MRKR_PSHCNJGUILD		= 11000805;
MRKR_FYE				= 11000806;
MRKR_CNJOAPPPESI		= 11000807;
MRKR_AMPHITHEATRE		= 11000808; -- SEQ_035
MRKR_FYE2				= 11000809; -- SEQ_040
MRKR_PSHCUTSCENE		= 11000810; -- SEQ_050
```

## Flags/Counters
```
FLAG_SEQ025_FYE		= 0;
```

## Dialog branches / handlers
```
function configureBeckonQuestAlly(ally, data)
function startMan2g0EntryTest(player, quest)
function onStart(player, quest)
function onFinish(player, quest)
function onStateChange(player, quest, sequence)
function doSEQ004CombatInstance(player, quest, playEntryCutscene)
function onTalk(player, quest, npc)
function onPush(player, quest, npc)
function onNpcLS(player, quest, from, msgStep)
function getJournalInformation(player, quest)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
processEventMiounneStart			Miounne: "You certainly seem to be coming into your own around here. Though you may not be aware of it, you're quite the talk of the town. But there will be time enough for praises later."
processEvent005_2					Miounne: "After countless rangings, Dunstan remains unfound. Despite their best efforts, none among the archers, lancers, or conjurers have the faintest idea where he is."
processEvent007						<Cutscene in Archer's Guild with Lewin and O-App-Pesi>
processEvent007_2					O-App-Pesi: "I feel a great disturbance in the forest...as if millions of voices suddenly cried out in terror. The elementals... We must leave at once! Set forth into the wood?" <yes>
processEvent007_2_2					O-App-Pesi: "I feel a great disturbance in the forest...as if millions of voices suddenly cried out in terror. The elementals... We must leave at once! Set forth into the wood?" <no>
processEvent007_3					Miounne: "You mean to go with them? Have you taken leave of your senses!?"
processEvent010						<cutscene>
processEvent010_2					"Mioune: How did you find things at Quiver's Hold? A ranging!? By the Twelve, you have a deal more courage than I imagined!"
processEvent020						<cutscene>
processEvent020_2					Miounne: "[@SPLIT([@STRING($EB(1))], ,1)], There is word of a commotion over at Stillglade Fane. Haven't been to see for myself, but I've heard talk of [@1A(1)]wildlings[@1A(0)]."
processEvent020_3					Zezekuta: "You wish to know more of Khrimm'm past? For that you must speak to the conjurers. I warn you, thoughâ”€the good brothers and sisters of Stillglade Fane may not be eager to speak of such things as wildlings."
processEvent030						Soileine: "Welcome, [@SPLIT([@STRING($EB(1))], ,1)]. Please, feel free to join the others within. Brother O-App has been expecting you." <cutscene> <warp to instanced area>
processEvent030_2					Soileine: "A wildling within the city... I fear we have all been placed in great danger. Brother E[@1F]Sumi will know what to do. He always does."
processEvent030_3					Disquieted Lancer: "Dunstan was next in line to command the Wood Wailers until he was...taken from us."
processEvent030_4					Disconcerted Conjurer: "My head... It pounds. And my ears scream with ringing. The voices... The elementals are in great distress."
processEvent030_5					Wise-looking Conjurer: "I don't know what to make of all this. I've never seen the greenwrath so fierce."
processEvent030_6					Enigmatic Conjurer: "Truly, my heart goes out to the poor lad, but is it wise to bring one so tainted to the Fane?"
processEvent030_7					Silky-haired Conjurer: "What does Brother E[@1F]Sumi mean to do? If there were some way to assist him, we would, but...the truth is, the rest of us don't have the first idea how."
processEvent030_8					Enthusiastic Archer: "This Papalymo and this Yda... Where in the bloody hells have they come from? They wield powers unlike any we've ever seen."
processEvent030_9					Embittered Archer: "My gut tells me Bowlord Lewin may be hiding something from the Quiver. But that would mean Brother E[@1F]Sumi is, as well. Could it be?"
processEvent040						<cutscene>
processEvent040_2					Silky-haired Conjurer: "Calm down, child! You can't see him now. It's too dangerous."
processEvent040_3					Disconcerted Conjurer: "You cannot pass, Fye. Trust us, it is for your own good."
processEvent040_4					O-App-Pesi: "The grand rite is one of conjury's most sacred and powerful acts. It requires all of our order to come together as one."
processEvent040_5					O-App-Pesi: "I must do all that I am able to aid Brother E[@1F]Sumi. We cannot fail!"
processEvent040_6					O-App-Pesi: "Brother E[@1F]Sumi plans to hold counsel with the Seedseers. For now, we must send word to the conjurers still within the wood to return."
processEvent045						Fye: "Let me in! I have to see him! I have to see Khrimm!" "You'll help me, won't you, [@SPLIT([@STRING($EB(1))], ,1)]? Find Brother E-Sumi, or Brother O-App. Tell them I'm here!" "I have to see Khrimm. I have to talk to him. To tell him I...I'm sorry."
processEvent045_2					Fye: "Let me in! I have to see him! I have to see Khrimm!" "You'll help me, won't you, [@SPLIT([@STRING($EB(1))], ,1)]? Find Brother E-Sumi, or Brother O-App. Tell them I'm here!" "I have to see Khrimm. I have to talk to him. To tell him I...I'm sorry."
processEvent050						<cutscene>
processEvent050_2					Miounne: "The grand rite is about to begin. I daresay you must be looking forward to getting all that woodsin off your back. "Not that there are any guarantees when it comes to cleansing the stuff. Oh, but I'm sure you'll be alright. Now stop wasting time and run along to Mih Khetto's Amphitheatre!"
processEvent060						<cutscene>
processEvent060_2					Niall: "This grand rite shall be the most important in recent memory. We can afford no mistakesâ”€all the woodsin must be purged. And if the children and the rest enjoy themselves in the process, so much the better."
processEvent060_3					Yda: "What strange and ridiculous dancing! We have nothing like it back in Sharlayanâ”€thank the gods for that!"
processEvent060_4					Papalymo: "They put on joyous airs, to be sure, but there is a sick desperation in their dancing. They fear this greenwrathâ”€that much is obvious."
processEvent060_5					Fufucha: "We like to think that even the elementals are soothed by the laughter of innocent children. But I fear that Khrimm's treachery in the wood may have placed the rest of our younglings at the greatest risk. I pray the conjurers are able to keep them safe."
processEvent060_6					Burchard: "You are no forestborn. What right have you to take part in this...er...rite? Brother O-App, you say? Hmph, I will look into this, I assure you. Twelve save you if you have told me false."
processEvent060_7					Ursbaen: "If Dunstan flees, Khrimm's life would be forfeit. No, he will not run. Not Dunstan. He wasâ”€ He [@1A(1)]is[@1A(0)] a man of honor."
processEvent060_8					N'golbb: "Once all are onstage and the rites begin, the forest takes on a very solemn air. And when all is done, that is replaced by an air of peace."
processEvent060_9					Farrimond: "So you are to be cleansed too, are you? Don't remember seeing you around before. An adventurer, I take it? Try not to make a mess of things."
processEvent060_10					T'kebbe: "Afraid you're going to stick out like an Ul'dahn whore in an Ishgardian church? Hah! Don't worry, it will be over before you know it."
... (+92 more)
```

## Items / rewards
```
BECKON_WIND_WARD_ITEM		= 11000082;
BECKON_EARTH_WARD_ITEM		= 11000083;
BECKON_WATER_WARD_ITEM		= 11000084;
local function removeBeckonWardItems(player)
local wardItems = { BECKON_WIND_WARD_ITEM, BECKON_EARTH_WARD_ITEM, BECKON_WATER_WARD_ITEM };
for _, itemId in ipairs(wardItems) do
if (player:HasItem(itemId)) then
player:RemoveItem(itemId, 1);
local wardItems = {
BECKON_WIND_WARD_ITEM,
BECKON_EARTH_WARD_ITEM,
BECKON_WATER_WARD_ITEM
local itemId = wardItems[selection];
if (itemId == nil) then
removeBeckonWardItems(player);
player:AddItem(itemId, 1);
removeBeckonWardItems(player);
quest:SetENpc(MIOUNNE, QFLAG_REWARD);
removeBeckonWardItems(player);
if (player:HasItem(BECKON_WIND_WARD_ITEM) or player:HasItem(BECKON_EARTH_WARD_ITEM) or player:HasItem(BECKON_WATER_WARD_ITEM)) then
player:AddItem(1000001, 30000);
--			player:AddItem(2001005, 1);
```

## Instance entry/exit
```
SEQ_045 = 45;		-- Cutscene at Amphitheatre. Warp to instanced area			[@SHEET(xtx/journalxtxFst,57]			"You have told Fye of her brother's presence at the festival. The purification dances are almost underway, and the wildlings Khrimm and Dunstan have taken to the stage. However, when Brother E[@1F]Sumi[@1F]Yan begins to chant the ritual verses, Dunstan collapses. As you move to help him, the Echo reverberates and you suddenly find yourself in the middle of the forest..."
BECKON_ENTRY_ZONE			= 206;
BECKON_ENTRY_PRIVATE_AREA	= "PrivateAreaMasterPast";
BECKON_ENTRY_X				= 228.307;
BECKON_ENTRY_Y				= 12.010;
BECKON_ENTRY_Z				= -1257.005;
BECKON_COMBAT_PRIVATE_AREA	= "PrivateAreaMasterPast";
and area:GetPrivateAreaName() == BECKON_COMBAT_PRIVATE_AREA
and area:GetPrivateAreaType() == BECKON_COMBAT_PRIVATE_TYPE;
if (area.ZoneId ~= BECKON_ENTRY_ZONE) then
GetWorldManager():DoZoneChange(player, BECKON_ENTRY_ZONE, nil, 0, 15, BECKON_ENTRY_X, BECKON_ENTRY_Y, BECKON_ENTRY_Z, BECKON_ENTRY_ROT);
if (area:GetPrivateAreaName() == BECKON_ENTRY_PRIVATE_AREA and area:GetPrivateAreaType() == BECKON_ENTRY_PRIVATE_TYPE) then
GetWorldManager():WarpToPrivateArea(player, BECKON_ENTRY_PRIVATE_AREA, BECKON_ENTRY_PRIVATE_TYPE, BECKON_ENTRY_X, BECKON_ENTRY_Y, BECKON_ENTRY_Z, BECKON_ENTRY_ROT);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, 228.307, 12.010, -1257.005, 0);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, 228.307, 12.010, -1257.005, 0);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, 228.307, 12.010, -1257.005, 0);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -239.329, 19.495, -1646.319, 3.316);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -239.329, 19.495, -1646.319, 3.316);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -239.329, 19.495, -1646.319, 3.316);
GetWorldManager():DoZoneChange(player, 153, 'PrivateAreaMasterPast', 2, 15, -1939.459, 0.147, -891.202, -1.867);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 11, -322.202, 8, -1666.206, 0.775);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 12, -96.219, 10.356, -1632.551, 3.118);
contentArea = player.CurrentArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man2g01", "SimpleContentMan2g01", "Quest/QuestDirectorMan2g001");
GetWorldManager():DoZoneChangeContent(player, contentArea, -2020, - 11.986, -926, 3);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110008, 'Beckon of the Elementals', 'Man2g0', 110007, 13)
REWARDS:
none found in gamedata_quest_rewards.sql
```


