# 111225 mnk0j5: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x1FE; 5 instructions)

```text
pc003 0x20A: quest:_loadTextDataPermanently(8516, "mnk0j5")
return (no values)
```

## processEvent_ERIK_Hint (3 parameters; 0x26D; 41 instructions)

```text
pc003 0x279: eventOwner:startCliantTalkTurn(2, player)
pc006 0x285: eventOwner:_runCharaScheduler(353959936)
pc011 0x299: eventOwner:say(quest, 2, 0)
pc016 0x2AD: eventOwner:say(quest, 38, 0)
pc021 0x2C1: eventOwner:say(quest, 3, 0)
pc026 0x2D5: eventOwner:say(quest, 42, 0)
pc031 0x2E9: eventOwner:say(quest, 39, 0)
pc037 0x301: worldMaster:say(quest, 35, 0)
pc039 0x309: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Summoned by the simpleton monk? Whatever for?
- `3`: You thought I did not know? How saddening it is that on the rare occasions you [@1A(1)]do[@1A(0)] trouble yourself to think, you are wrong. Of course I know. What manner of imbecile do you take me for?
- `35`: The next monk quest is now available from Widargelt.
- `38`: He is far too caught up in revolution and revenge. You seem to be getting along well with him. I do wish you'd tell him yourself that people should live for the future rather than in the past.
- `39`: No doubt the simpleton monk thinks [@1A(1)]me[@1A(0)] to be the idiot. False! For these two eyes see far more than you know. Go, hurry to Little Ala Mhigo. I daresay he is already awaiting your arrival.
- `42`: Mine own wife and children, whom a man should love more than aught else... My love for them was not as it should have been.

## processEvent_WIDARGELT_Start (3 parameters; 0x3E6; 189 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x3F2: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3FE: eventOwner:_runCharaScheduler(354082816)
pc011 0x412: eventOwner:say(quest, 4, 0)
pc016 0x426: eventOwner:say(quest, 5, 0)
pc021 0x43A: eventOwner:say(quest, 6, 0)
pc026 0x44E: eventOwner:say(quest, 7, 0)
pc029 0x45A: eventOwner:_runCharaScheduler(353959936)
pc034 0x46E: eventOwner:say(quest, 8, 0)
pc039 0x482: eventOwner:say(quest, 34, 0)
pc042 0x48E: eventOwner:_runCharaScheduler(353964032)
pc047 0x4A2: eventOwner:say(quest, 36, 0)
pc052 0x4B6: eventOwner:say(quest, 9, 0)
pc055 0x4C2: eventOwner:_runCharaScheduler(354103296)
pc060 0x4D6: eventOwner:say(quest, 10, 0)
pc065 0x4EA: eventOwner:say(quest, 11, 0)
pc070 0x4FE: eventOwner:say(quest, 12, 0)
pc073 0x50A: eventOwner:_runCharaScheduler(353968128)
pc078 0x51E: eventOwner:say(quest, 43, 0)
pc083 0x532: eventOwner:say(quest, 44, 0)
pc086 0x53E: eventOwner:_runCharaScheduler(353976320)
pc091 0x552: eventOwner:say(quest, 45, 0)
pc096 0x566: eventOwner:say(quest, 46, 0)
pc101 0x57A: eventOwner:say(quest, 47, 0)
pc103 0x582: quest:showQuestInfomation()
pc179 0x6B2: eventOwner:_runCharaScheduler(354041856)
pc184 0x6C6: eventOwner:say(quest, 13, 0)
pc186 0x6CE: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x3F2: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3FE: eventOwner:_runCharaScheduler(354082816)
pc011 0x412: eventOwner:say(quest, 4, 0)
pc016 0x426: eventOwner:say(quest, 5, 0)
pc021 0x43A: eventOwner:say(quest, 6, 0)
pc026 0x44E: eventOwner:say(quest, 7, 0)
pc029 0x45A: eventOwner:_runCharaScheduler(353959936)
pc034 0x46E: eventOwner:say(quest, 8, 0)
pc039 0x482: eventOwner:say(quest, 34, 0)
pc042 0x48E: eventOwner:_runCharaScheduler(353964032)
pc047 0x4A2: eventOwner:say(quest, 36, 0)
pc052 0x4B6: eventOwner:say(quest, 9, 0)
pc055 0x4C2: eventOwner:_runCharaScheduler(354103296)
pc060 0x4D6: eventOwner:say(quest, 10, 0)
pc065 0x4EA: eventOwner:say(quest, 11, 0)
pc070 0x4FE: eventOwner:say(quest, 12, 0)
pc073 0x50A: eventOwner:_runCharaScheduler(353968128)
pc078 0x51E: eventOwner:say(quest, 43, 0)
pc083 0x532: eventOwner:say(quest, 44, 0)
pc086 0x53E: eventOwner:_runCharaScheduler(353976320)
pc091 0x552: eventOwner:say(quest, 45, 0)
pc096 0x566: eventOwner:say(quest, 46, 0)
pc101 0x57A: eventOwner:say(quest, 47, 0)
pc103 0x582: quest:showQuestInfomation()
pc108 0x596: eventOwner:_runCharaScheduler(354066432)
pc113 0x5AA: eventOwner:say(quest, 14, 0)
pc118 0x5BE: eventOwner:say(quest, 48, 0)
pc123 0x5D2: eventOwner:say(quest, 49, 0)
pc128 0x5E6: eventOwner:say(quest, 50, 0)
pc131 0x5F2: eventOwner:_runCharaScheduler(354103296)
pc136 0x606: eventOwner:say(quest, 51, 0)
pc141 0x61A: eventOwner:say(quest, 52, 0)
pc144 0x626: eventOwner:_runCharaScheduler(353968128)
pc149 0x63A: eventOwner:say(quest, 53, 0)
pc154 0x64E: eventOwner:say(quest, 54, 0)
pc157 0x65A: eventOwner:_runCharaScheduler(353959936)
pc162 0x66E: eventOwner:say(quest, 55, 0)
pc167 0x682: eventOwner:say(quest, 56, 0)
pc170 0x68E: eventOwner:_runCharaScheduler(354066432)
pc175 0x6A2: eventOwner:say(quest, 57, 0)
pc186 0x6CE: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `4`: You spoke to the teacher. Do not lie to me, [@IF($E9(4),sister,brother)]. You told him who I am.
- `5`: I am not angered. He tried to sway me from my path. He believes resistance will only leave more dead. I expected as much from him.
- `6`: I feigned understanding. He asked much of me. Of the monkhood and the Fist. He asked of the seventh chakra.
- `7`: My answers excited him. He said they would advance his studies. I too learned from him. I am nearer the seventh chakra now.
- `8`: Soon the resistance will rise up. You too will see. Very soon.
- `9`: I have traveled far and wide. I have met many souls. But none are as you. You have a gift, [@IF($E9(4),sister,brother)].
- `10`: Yours is a great strength. Unite it to ours, [@IF($E9(4),sister,brother)]. Help us reclaim our home.
- `11`: Your efforts will be rewarded. Look upon my garments. This is the war garb of the monkhood.
- `12`: It attunes to its wearer. It empowers the chakra. Enables it to realize its full potential.
- `13`: Your decision saddens me. But know that my offer stands. I pray you change your mind.
- `14`: You have the heart of a true monk. You are different from the others in this realm.
- `34`: Others do not understand. Ala Mhigo tried to protect them. We were the shield of the realm. [@1A(1)]We[@1A(0)] bled to fend off Garlemald.
- `36`: None here know our suffering. None here can imagine it. The lives we led after the fall. After the shield was sundered.
- `43`: The cloth is imbued with the power of Rhalgr. Only monks of his Fist may don it. Only those who overcome many trials.
- `44`: I will make a gift of this to you. With it I offer words. Words of instruction.
- `45`: You need not enter the Fist. I require you to speak no vows. I ask only that you fight. Give yourself to our cause.
- `46`: You long for adventure. I understand. But such longings can wait. This cannot. See Ala Mhigo freed. Then enjoy your own freedoms.
- `47`: What say you, [@IF($E9(4),sister,brother)]?
- `48`: This is what you must do. See it done, and the garb will be yours. Remember well these words...
- `49`: Dzemael Darkhold, south and west of Camp Dragonhead in the central Coerthas highlands. The U'Ghamaro Mines, north and east of Camp Iron Lake in upper La Noscea.
- `50`: Turning Leaf, south of Camp Crimson Bark in the West Shroud. Cape Deadwind, south and east of the city of Ul'dah.
- `51`: I have hidden your garb in these places. The way to them will not be easy. There are great dangers. This is to be your test.
- `52`: Each garment rests within a chest. These are no ordinary chests. They sense the chakra of man. At the coming of a worthy soul, they will open. Look to your map should the way be lost.
- `53`: This trial will yield but four pieces. There is a fifth. I hold it.
- `54`: But I am bound by tradition. Only after the four are taken can the fifth be given.
- `55`: I can say no more. I am master of your trial. I am forbidden to speak beyond what I have.
- `56`: The teacher knows much of the Fist and the monkhood. If you would know more, ask him.
- `57`: I await the day we fight side by side, [@IF($E9(4),sister,brother)]. Go now, and go well.

## processEvent_WIDARGELT_Follow (3 parameters; 0x8CE; 25 instructions)

```text
pc003 0x8DA: eventOwner:startCliantTalkTurn(2, player)
pc006 0x8E6: eventOwner:_runCharaScheduler(353976320)
pc011 0x8FA: eventOwner:say(quest, 15, 0)
pc016 0x90E: eventOwner:say(quest, 58, 0)
pc021 0x922: eventOwner:say(quest, 40, 0)
pc023 0x92A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `15`: Dzemael Darkhold, south and west of Camp Dragonhead in the central Coerthas highlands. The U'Ghamaro Mines, north and east of Camp Iron Lake in upper La Noscea.
- `40`: There I have hidden your monk's garb. Look to your map should the way be lost. Go now, and go well.
- `58`: Turning Leaf, south of Camp Crimson Bark in the West Shroud. Cape Deadwind, south and east of the city of Ul'dah.

## processEvent_ERIK_Follow (3 parameters; 0x9E4; 25 instructions)

```text
pc003 0x9F0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x9FC: eventOwner:_runCharaScheduler(353968128)
pc011 0xA10: eventOwner:say(quest, 32, 0)
pc016 0xA24: eventOwner:say(quest, 33, 0)
pc021 0xA38: eventOwner:say(quest, 59, 0)
pc023 0xA40: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `32`: That simpleton told you to ask [@1A(1)]me[@1A(0)]? Why would he send you to me? And why would you listen? Does your idiocy know [@1A(1)]no[@1A(0)] bounds? What has he bid you do?
- `33`: I am highly intelligent, [@SPLIT([@STRING($EB(1))], ,1)], but I am not omniscient. And yet...my powers of deduction tell me that if Widargelt [@1A(1)]has[@1A(0)] charged you with a task, and you would like to know precisely what it entails...
- `59`: [@1A(1)]You should ask Widargelt![@1A(0)] Just a suggestion. Idiot.

## processEvent_getAF_info (4 parameters; 0xAFA; 9 instructions)

```text
pc002 0xB02: eventOwner:_runCharaScheduler(67108910)
pc007 0xB16: quest:showGetJobItemWidget(player, arg4, 0)
return (no values)
```

## processEventChuui (3 parameters; 0xB8A; 8 instructions)

```text
pc006 0xBA2: worldMaster:say(worldMaster, 51131, 111225, 15)
return (no values)
```

## processEventChuui2 (3 parameters; 0xC07; 8 instructions)

```text
pc006 0xC1F: worldMaster:say(worldMaster, 51132, 111225, 15)
return (no values)
```

