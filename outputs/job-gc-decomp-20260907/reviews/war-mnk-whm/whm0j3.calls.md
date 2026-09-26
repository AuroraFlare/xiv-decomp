# 111243 whm0j3: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x2A8; 5 instructions)

```text
pc003 0x2B4: quest:_loadTextDataPermanently(9764, "whm0j3")
return (no values)
```

## processEventRAYAOSENNAStart (3 parameters; 0x317; 95 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x323: eventOwner:startCliantTalkTurn(2, player)
pc006 0x32F: eventOwner:_runCharaScheduler(354045952)
pc011 0x343: eventOwner:say(quest, 6, 0)
pc016 0x357: eventOwner:say(quest, 7, 0)
pc019 0x363: eventOwner:_runCharaScheduler(353964032)
pc024 0x377: eventOwner:say(quest, 8, 0)
pc029 0x38B: eventOwner:say(quest, 9, 0)
pc034 0x39F: eventOwner:say(quest, 11, 0)
pc037 0x3AB: eventOwner:_runCharaScheduler(70815744)
pc042 0x3BF: eventOwner:say(quest, 12, 0)
pc045 0x3CB: eventOwner:_runCharaScheduler(354103296)
pc048 0x3D7: quest:_wait(1)
pc053 0x3EB: eventOwner:say(quest, 13, 0)
pc058 0x3FF: eventOwner:say(quest, 14, 0)
pc063 0x413: eventOwner:say(quest, 20, 0)
pc065 0x41B: quest:showQuestInfomation()
pc082 0x45F: eventOwner:_runCharaScheduler(353980416)
pc085 0x46B: quest:_wait(1)
pc090 0x47F: eventOwner:say(quest, 15, 0)
pc092 0x487: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x323: eventOwner:startCliantTalkTurn(2, player)
pc006 0x32F: eventOwner:_runCharaScheduler(354045952)
pc011 0x343: eventOwner:say(quest, 6, 0)
pc016 0x357: eventOwner:say(quest, 7, 0)
pc019 0x363: eventOwner:_runCharaScheduler(353964032)
pc024 0x377: eventOwner:say(quest, 8, 0)
pc029 0x38B: eventOwner:say(quest, 9, 0)
pc034 0x39F: eventOwner:say(quest, 11, 0)
pc037 0x3AB: eventOwner:_runCharaScheduler(70815744)
pc042 0x3BF: eventOwner:say(quest, 12, 0)
pc045 0x3CB: eventOwner:_runCharaScheduler(354103296)
pc048 0x3D7: quest:_wait(1)
pc053 0x3EB: eventOwner:say(quest, 13, 0)
pc058 0x3FF: eventOwner:say(quest, 14, 0)
pc063 0x413: eventOwner:say(quest, 20, 0)
pc065 0x41B: quest:showQuestInfomation()
pc070 0x42F: eventOwner:_runCharaScheduler(354000896)
pc073 0x43B: quest:_wait(1)
pc078 0x44F: eventOwner:say(quest, 16, 0)
pc092 0x487: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `6`: To those with the ears to hear and the heart to listen, the Twelveswood resounds with the voices of the elementals.
- `7`: They can be heard throughout creation, in the sound of a falling raindrop, and the silence of a mossy stone. In the call of the tiniest insect, and the creak of the grandest oak. Of late, however, their blissful harmony has given way to a cacophony of voices raised in anger.
- `8`: Left unchecked, that anger will be as a festering wound upon the Twelveswood. It will prolong winter and delay the coming of spring. It will call forth an early summer and lay to waste the bounty of autumn. So it will continue until the natural order gives way wholly to chaos, sowing the seeds of madness in the hearts of men and beasts...
- `9`: The elementals indulge we Gridanians in many and more ways, [@SPLIT([@STRING($EB(1))], ,1)]. Whatever has prompted their fury, we must help rid them of it.
- `11`: The elementals have done well by us─our turn is now come to do well by them.
- `12`: ...But what would they have us do? And how might we go about doing it without forsaking those hapless souls upon whom the elementals have turned their wrath? It pains me to admit it, but the answer eludes me even now. Yet we must forge ever onward, and pray that all will be made clear in time.
- `13`: But I shall waste no more time on exposition. I have received word from my brother, A[@1F]Ruhn.
- `14`: He tells me that a creature found east of Camp Horizon in western Thanalan has inexplicably grown savage of late.
- `15`: Is that so...? I thought you a friend of nature. Mayhap I was mistaken.
- `16`: Though Oha[@1F]Sok has not graced us with her presence of late, I daresay she is privy to all our conversations. If you can hear me, Oha[@1F]Sok, it would lighten my heart if you were to watch over [@SPLIT([@STRING($EB(1))], ,1)] in my stead.
- `20`: Cactuar Jack is its name, and you will already have deduced the reason for its sudden shift in temperament. As before, you must subdue the creature using what white magic you have at your command.

## processEventRAYAOSENNAStart_1 (3 parameters; 0x5E7; 21 instructions)

```text
pc003 0x5F3: eventOwner:startCliantTalkTurn(2, player)
pc006 0x5FF: eventOwner:_runCharaScheduler(353959936)
pc011 0x613: eventOwner:say(quest, 4, 0)
pc017 0x62B: worldMaster:say(quest, 5, 0)
pc019 0x633: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `4`: I have a mind to assign you another task, yet I must be certain of your readiness beyond a shadow of a doubt. Present yourself to me again when you have grown still stronger.
- `5`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 40.

## processEventMOOGLEAStart_1 (3 parameters; 0x6F5; 15 instructions)

```text
pc003 0x701: eventOwner:startCliantTalkTurn(2, player)
pc006 0x70D: eventOwner:_runCharaScheduler(70193152)
pc011 0x721: eventOwner:say(quest, 2, 0)
pc013 0x729: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Raya[@1F]O has been in a huff waiting for you to return. You should know better than to make her worry, kupo.

## processEventMOOGLEBStart_1 (3 parameters; 0x7C8; 15 instructions)

```text
pc003 0x7D4: eventOwner:startCliantTalkTurn(2, player)
pc006 0x7E0: eventOwner:_runCharaScheduler(70189056)
pc011 0x7F4: eventOwner:say(quest, 3, 0)
pc013 0x7FC: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: A Padjal's training regime is highly rigorous, kupo. Raya[@1F]O is constantly practicing with that heavy staff of hers.

## processEvent000 (3 parameters; 0x8A4; 15 instructions)

```text
pc003 0x8B0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x8BC: eventOwner:_runCharaScheduler(354066432)
pc011 0x8D0: eventOwner:say(quest, 19, 0)
pc013 0x8D8: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `19`: Take yourself to Camp Horizon in western Thanalan, thence strike east and seek out Cactuar Jack. The creature is believed to be under the influence of a rogue elemental, and you must subdue it using white magic. Once you have accomplished this task, pray return hither without delay.

## processEvent000_1 (3 parameters; 0x980; 15 instructions)

```text
pc003 0x98C: eventOwner:startCliantTalkTurn(2, player)
pc006 0x998: eventOwner:_runCharaScheduler(70086656)
pc011 0x9AC: eventOwner:say(quest, 17, 0)
pc013 0x9B4: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `17`: When the elementals are on edge, they close off certain parts of the Twelveswood...like the sun-dappled clearing with my favorite flower bed. Just where am I supposed to take my afternoon naps now, kupo!?

## processEvent000_2 (3 parameters; 0xA5C; 15 instructions)

```text
pc003 0xA68: eventOwner:startCliantTalkTurn(2, player)
pc006 0xA74: eventOwner:_runCharaScheduler(70197248)
pc011 0xA88: eventOwner:say(quest, 18, 0)
pc013 0xA90: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `18`: People are peculiar creatures, kupo. Why is it that they can never say what's in their hearts?

## processEvent005 (3 parameters; 0xB38; 77 instructions)

```text
pc003 0xB44: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB50: eventOwner:_runCharaScheduler(79577088)
pc011 0xB64: eventOwner:say(quest, 24, 0)
pc016 0xB78: eventOwner:say(quest, 25, 0)
pc019 0xB84: quest:_wait(0.5)
pc022 0xB90: eventOwner:_runCharaScheduler(70795264)
pc025 0xB9C: quest:_wait(0.5)
pc030 0xBB0: eventOwner:say(quest, 26, 0)
pc033 0xBBC: eventOwner:_runCharaScheduler(79593472)
pc038 0xBD0: eventOwner:say(quest, 27, 0)
pc043 0xBE4: desktopWidget:openPublicInformLongDialogWidget(quest, 31)
pc046 0xBF0: quest:_wait(8)
pc051 0xC04: quest:showGetJobAbilityWidget(player, 27357, 2)
pc054 0xC10: quest:_wait(6)
pc059 0xC24: eventOwner:say(quest, 28, 0)
pc062 0xC30: eventOwner:_runCharaScheduler(364756992)
pc067 0xC44: eventOwner:say(quest, 29, 0)
pc073 0xC5C: worldMaster:say(quest, 30, 0)
pc075 0xC64: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `24`: So no elementals appeared...? Not the outcome I had hoped for, to be sure, yet I am disinclined to think that A[@1F]Ruhn was mistaken─my brother's senses seldom lead him awry.
- `25`: It is too early to say with certainty, but I daresay the elementals refrain from manifesting themselves. We must continue our investigation.
- `26`: [@SPLIT([@STRING($EB(1))], ,1)]. Once again, you have served me well.
- `27`: By the power vested in me, I hereby permit you the use of new white magic.
- `28`: I shall redouble my efforts to commune with the elementals. It cannot be but that one among them possesses the knowledge we seek.
- `29`: In the meantime, I counsel you to spare no effort in preparing yourself for the next task. Go now, [@SPLIT([@STRING($EB(1))], ,1)], and return hither once you have progressed further along the path of the white mage.
- `30`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 45.
- `31`: A brilliant white light shines forth from the Soul of the White Mage, suffusing your entire being!

## processEvent005_1 (3 parameters; 0xDFC; 15 instructions)

```text
pc003 0xE08: eventOwner:startCliantTalkTurn(2, player)
pc006 0xE14: eventOwner:_runCharaScheduler(70086656)
pc011 0xE28: eventOwner:say(quest, 22, 0)
pc013 0xE30: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `22`: <sniff> <sniff> You smell of sand, sand, and...more sand. Aren't there any flower beds outside the Twelveswood, kupo?

## processEvent005_2 (3 parameters; 0xED8; 15 instructions)

```text
pc003 0xEE4: eventOwner:startCliantTalkTurn(2, player)
pc006 0xEF0: eventOwner:_runCharaScheduler(70197248)
pc011 0xF04: eventOwner:say(quest, 23, 0)
pc013 0xF0C: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `23`: We moogles love the elementals, kupo! On our list of favorite things, they rank as highly as singing and dancing and eating and napping!

## processEventChuui (3 parameters; 0xFB4; 8 instructions)

```text
pc006 0xFCC: worldMaster:say(worldMaster, 51131, 111243, 27)
return (no values)
```

## processEventChuui2 (3 parameters; 0x1031; 8 instructions)

```text
pc006 0x1049: worldMaster:say(worldMaster, 51132, 111243, 27)
return (no values)
```

