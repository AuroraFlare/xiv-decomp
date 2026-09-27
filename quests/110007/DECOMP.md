# Quest 110007 (man1g0.lua)
Source: FF14-Memory/Data/scripts/quests/man/man1g0.lua (666 lines, full body read)

## Stages (SEQ)
```
SEQ_000	= 0;  -- 000@SHEETxtx/journalxtxFst34  --  MRKR_s000_ANAIDJAA		-- 11000701	-- A'naidjaa	-- CRP Gld 		-- processEvent010		-- Into Private 1	 -- 1000465 	-- 1900034	-- "206 11 Y -1265"
SEQ_005	= 5;  -- 005@SHEETxtx/journalxtxFst35  --  MRKR_s005_Push6CRP 		-- 11000702	-- ???			-- Outside CRP 	-- processEvent020		-- In Private 1	 	 -- 1090170 	-- 4000257 	-- "206 -34.5, 8, -1271, 0" ???
SEQ_010	= 10; -- 010@SHEETxtx/journalxtxFst36  --  MRKR_s010_FYE 			-- 11000703	-- Fye			-- Outside CRP 	-- processEvent030		-- Into Private 2?	 -- 1000014 	-- 1100019	-- "206 -31, 8, -1244.5, -2.5" Fye
SEQ_015	= 15; -- 015@SHEETxtx/journalxtxFst37  --  MRKR_s015_Push6CRP 		-- 11000704	-- ???			-- Outside CRP 	-- processEvent040		-- Back to public	 -- 1090171 	-- 4000257 	-- "206 -31.5, 8, -1274.5, 0" ???
SEQ_020	= 20; -- 020@SHEETxtx/journalxtxFst38  --  Miounne Linkpearl 		-- 			-- 				--  			-- 						-- 					 --  		-- 					--
SEQ_025	= 25; -- 025@SHEETxtx/journalxtxFst39  --  MRKR_s025_Push6BOT 		-- 11000706	-- ???			-- Botany 		-- processEvent050		-- Public			 -- 1090172 	-- 4000257	-- "206 -204, 18, -1477, 0" ???
SEQ_030	= 30; -- 030@SHEETxtx/journalxtxFst40  --  MRKR_s030_Push6MOOGLE	-- 11000707	-- ???			-- Stump 		-- processEvent060		-- Into Private		 -- 1090173 	-- 4000257	-- "150 -639, 23, -1086, 0" ??? 12.0
SEQ_035	= 35; -- 035@SHEETxtx/journalxtxFst41  --  MRKR_s035_Push6MOOGLE	-- 11000708	-- ???			-- Near stump 	-- processEvent070		-- Back to Public	 -- 1090174 	-- 4000257	-- "150 -631 22 -1067" ??? Spawn inside and walk out?
SEQ_040	= 40; -- 040@SHEETxtx/journalxtxFst42  --  MRKR_s040_OPYLTYL 		-- 11000709	-- Opyltyl		-- Botany		-- processEvent080		-- Public			 -- 1000236 	-- 1600132	-- "206 -205 Y -1454"
SEQ_045	= 45; -- 045@SHEETxtx/journalxtxFst43  --  Miounne Linkpearl		-- 			--  			-- 						-- 				--  				 --
SEQ_050	= 50; -- 050@SHEETxtx/journalxtxFst44  --  MRKR_s050_NONOLATO 		-- 11000711	-- Nonolato		-- Archers 		-- processEvent090		-- Public			 -- 1000463 	-- 1400007	-- "206 232 Y -1268"
SEQ_055	= 55; -- 055@SHEETxtx/journalxtxFst45  --  MRKR_s055_Push6ARC 		-- 11000712	-- ???			-- Archers 		-- processEvent100		-- Public			 -- 1090175 	-- 4000257	-- "206 238.5, 12, -1274, 0" ???
SEQ_060	= 60; -- 060@SHEETxtx/journalxtxFst46  --  Miounne Linkpearl		-- 			--  			-- 						-- 				--  				 --
SEQ_065	= 65; -- 065@SHEETxtx/journalxtxFst186 --  MRKR_s065_MIOUNNE		-- 11000713	-- Miounne		-- Adv Gld 		-- processEventComplete	-- Public			 -- 1000230 	-- 1300018	-- "155 55 Y -1196"
```

## NPCs/Actors
```
MIOUNNE				= 1000230;-- SEQ start and SEQ_65
ANAIDJAA			= 1000465;-- SEQ_000
CAPLAN				= 1000822;-- SEQ_005
FRANCES				= 1000466;-- SEQ_005
ZEZEKUTA			= 1000240;-- SEQ_005
DECIMA				= 1000622;-- SEQ_005
CHALYOTAMLYO		= 1000623;-- SEQ_005
ULMHYLT				= 1000823;-- SEQ_005
FYE					= 1000014;-- SEQ_010
DESERTEDDAUGHTER	= 1000827;-- SEQ_010
TROUBLESOMETOMBOY	= 1000828;-- SEQ_010
SQUEALINGSPRAT      = 1000826;-- SEQ_005
SUGARSCHOOLGIRL		= 1000824;-- SEQ_005
OPYLTYL				= 1000236;-- SEQ_040
NONOLATO			= 1000463;-- SEQ_050
```

## Markers
```
MRKR_s000_ANAIDJAA	= 11000701; -- A'naidhjaa - Carpenters' Guild - The Oak Atrium
MRKR_s005_Push6CRP	= 11000702; -- ??? - Outside Carpenters' Guild
MRKR_s010_FYE		= 11000703; -- Fye - Outside Carpenters' Guild
MRKR_s015_Push6CRP	= 11000704; -- ??? - Outside Carpenters' Guild
MRKR_s025_Push6BOT 		= 11000706; -- ??? - Outside Botanists' Guild
MRKR_s030_Push6MOOGLE	= 11000707; -- ??? - Leading to Lifemend Stump
MRKR_s035_Push6MOOGLE	= 11000708; -- ??? - A bit further from Lifemend Stump
MRKR_s040_OPYLTYL		= 11000709; -- Opyltyl - Botanists' Guild
MRKR_s050_NONOLATO 		= 11000711; -- Nonolato - Archers' Guild
MRKR_s055_Push6ARC 		= 11000712; -- ??? - Doorway next to Nonolato
MRKR_s065_MIOUNNE 		= 11000713; -- Miounne - Adventurers' Guild
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
function onNpcLS(player, quest, from, msgStep)
function getJournalMapMarkerList(player, quest)
```

## Cutscenes / processEvents
```
processEventMiounneStart	Quest start text from Miounne. Go to the CRP guild.
processEvent000_2	Miounne reminder text: "I wonder what it is the elementals are after... You might be able to find out for yourself, seeing as how you are able to converse with the moogles, and all."
processEvent010	Cutscene at the CRP guild, warps into echo.
processEvent010_2	Zezekuta: "A message from the moogle to young Fye..."
processEvent010_3	A'naldjaa: "The Acorn Orchard? Yes, it is the small playground outside, on the west side of the Atrium."
processEvent010_4	Frances: "Aye, the dead mask. Its powers have left it. A tragedy, that. It was meant for Fye's elder brother, Dunstan. "
processEvent010_5	 ???: "Looking for Fye, you say? She's out playing in the Orchard, I imagine, as all the little runts do. Just head west."
processEvent010_6	Ulmhylt: "There are very few among us capable of making the purification masks. I myself have never even attempted the feat."
processEvent010_7	Decima: "The moogles certainly can't repair everything"
processEvent010_8	Chalyo Tamlyo: "Fye's brother Dunstan was a mighty lancer, and one of the Wood Wailers."
processEvent020	Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
processEvent020_2	Zezekuta reminder: "Your mask has been fashioned. That is truly good news. Now the conjurers may carry out the rites, and you will be purified before the eyes of the elementals."
processEvent020_3	Deserted Daughter: "Poor Fye. Khrimm can be such a bully. He really shouldn't pick on girls."
processEvent020_4	Troublesome Tomboy: "<whisper> Ya know what? Don't tell anyone, but both Khrimm's and Fye's families got turned into wildlings."
processEvent030	Cutscene with Fye
processEvent040	Cutscene in the CRP guild with Yda and Papalymo. Exit echo.
processEvent040_2	Miounne reminder: "Brother E-Sumi has returned to Gridania to conduct the rites at the festival."
processEvent050	Cutscene at the BTN guild to get Pearl Clover Fruit
processEvent050_2	Miounne reminder: "Off to find Pearl Clover Fruit, are you? I fancy Brother E-Sumi has taken quite a liking to you. He would not teach you the location of such rare fruits otherwise."
processEvent060	Cutscene with moogle, warp into instance
processEvent060_2	 ???: "Just a moment, kupo. I'll try and speak to the elementals of the trees."
processEvent070	Cutscene with Powle, Moogle, and you.
processEvent080	Cutscene at the BTN guild.
processEvent080_2	 ???: "The moogles love nothing if not their Pearl Clover Fruit. Even so, I'd not thought you like to find one so quickly. Gods, all these exceptional adventurers! How does Miounne do it?"
processEvent080_3	Miounne reminder: "The archers asked that you come to the Quiver's Hold as soon as possible. You'll find an agreeable Lalafell bloke by the name of Nonolato there."
processEvent090	Cutscene at the ARC guild.
processEvent090_2	Nonolato reminder: "The safety of Gridania is the duty of the archers of the Gods' Quiver, the lancers of the Wood Wailers, and the conjurers of Stillglade Fane."
processEvent090_3	 ???: "We make efforts to learn mooglespeak, but our control of the language is rudimentary at best. Without the conjurers, this endeavor would be completely hopeless."
processEvent090_4	 ???: "I know not of such things, but there are some that can use mooglespeak, whether through divine providence or study. And not all of them are forestborn."
processEvent090_5	 ???: "You know the mooglespeak? Then you must help us, please! Speak to Bowlord Lewin right away!"
processEvent100	Cutscene 2 at the ARC guild.
processEventComplete	Talk to Miounne to complete quest.
processEvent1000_2	 ???: "If the woodsin upon a soul is too great, the power of the purification mask may collapse under the burden. But I do not think you are in any such danger."
processEvent1000_5	Shows a "Enter the Instance?" dialog.
man1g000 - processEventMiounneStart
processEventComplete
man1g000 - processEventMiounneStart  - Miounne - Quest start text from Miounne. Go to the CRP guild.
man1g010 - processEvent010 -  - s    -  - Cutscene at the CRP guild, warps into echo. -  - Name ID: 1300018 - Model ID: 1000230 - Marker ID: 11000601 11000603 11000620 11000713 11008101 11040110
man1g020 - processEvent020 -  - s    -  - Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
man1g030 - processEvent030 -  - s    -  - Cutscene with Fye
... (+95 more)
```

## Items / rewards
```
030@SHEETxtx/journalxtxFst40  - 40,"At the Greatloam Growery, Brother E[@1F]Sumi[@1F]Yan seems concerned for Fye. To aid in her wish to find a way to save a wildling, he teaches you where in the forest you may find [ITEM] â”€a known favorite of the moogles, and your best chance of attracting one near enough to speak to it."
035@SHEETxtx/journalxtxFst41  - 41,"You locate one of [ITEM] Brother E[@1F]Sumi[@1F]Yan spoke of, which quickly attracts the attention of a moogle. In return for the delectable, the moogle agrees to ask the elementals themselves if a wildling soul can be returned from the wood. Wander around nearby until the moogle is finished conversing with the elementals."
man1g020 - processEvent020 -  - s020 -  - HEREWARD - Name ID: 1000324 - Model ID: 1000231 - Marker ID: 11000604
030@SHEETxtx/journalxtxFst40  - 40,"At the Greatloam Growery, Brother E[@1F]Sumi[@1F]Yan seems concerned for Fye. To aid in her wish to find a way to save a wildling, he teaches you where in the forest you may find [ITEM] â”€a known favorite of the moogles, and your best chance of attracting one near enough to speak to it."
035@SHEETxtx/journalxtxFst41  - 41,"You locate one of [ITEM] Brother E[@1F]Sumi[@1F]Yan spoke of, which quickly attracts the attention of a moogle. In return for the delectable, the moogle agrees to ask the elementals themselves if a wildling soul can be returned from the wood. Wander around nearby until the moogle is finished conversing with the elementals."
quest:SetENpc(MIOUNNE, QFLAG_REWARD);
player:AddItem(1000001, 15000);
```

## Instance entry/exit
```
processEvent020	Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
man1g020 - processEvent020 -  - s    -  - Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
processEvent020	Cutscene of Fye getting bullied by Khrimm. Warp into another echo.
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 8); -- warp to 8
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 6); -- place out of door
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7); --already in area
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -650.565, 21.530, -1109.064, 0.398);
GetWorldManager():WarpToPublicArea(player);
GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2, -650.565, 21.530, -1109.064, 0.398);
```

## Parley
```
none
```


## Quest registry + rewards (SQL, inspected)
```
QUEST: (110007, 'Whispers in the Wood', 'Man1g0', 110006, 8)
REWARDS:
none found in gamedata_quest_rewards.sql
```


