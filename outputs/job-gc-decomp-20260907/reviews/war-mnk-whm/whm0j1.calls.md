# 111241 whm0j1: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x35A; 5 instructions)

```text
pc003 0x366: quest:_loadTextDataPermanently(9732, "whm0j1")
return (no values)
```

## processEventStart (3 parameters; 0x3C9; 66 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x3D5: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3E1: eventOwner:_runCharaScheduler(353968128)
pc011 0x3F5: eventOwner:say(quest, 1, 0)
pc016 0x409: eventOwner:say(quest, 2, 0)
pc019 0x415: eventOwner:_runCharaScheduler(353959936)
pc024 0x429: eventOwner:say(quest, 3, 0)
pc029 0x43D: eventOwner:say(quest, 4, 0)
pc032 0x449: eventOwner:_runCharaScheduler(353964032)
pc037 0x45D: eventOwner:say(quest, 41, 0)
pc039 0x465: quest:showQuestInfomation()
pc056 0x4A9: eventOwner:_runCharaScheduler(353959936)
pc061 0x4BD: eventOwner:say(quest, 5, 0)
pc063 0x4C5: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x3D5: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3E1: eventOwner:_runCharaScheduler(353968128)
pc011 0x3F5: eventOwner:say(quest, 1, 0)
pc016 0x409: eventOwner:say(quest, 2, 0)
pc019 0x415: eventOwner:_runCharaScheduler(353959936)
pc024 0x429: eventOwner:say(quest, 3, 0)
pc029 0x43D: eventOwner:say(quest, 4, 0)
pc032 0x449: eventOwner:_runCharaScheduler(353964032)
pc037 0x45D: eventOwner:say(quest, 41, 0)
pc039 0x465: quest:showQuestInfomation()
pc044 0x479: eventOwner:_runCharaScheduler(353959936)
pc049 0x48D: eventOwner:say(quest, 6, 0)
pc051 0x495: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `1`: Well met, [@SPLIT([@STRING($EB(1))], ,1)]. No doubt you have already sensed the disturbance, but the Twelveswood has been ill at ease of late.[@CR]Our investigations have revealed that thieves have been making off with items left at Lifemend Stump.
- `2`: Stillglade Fane was about to dispatch the Gods' Quiver to track down the villains...when word arrived that an individual had already taken matters into her own hands.
- `3`: The individual in question was no less a personage than Seedseer Raya[@1F]O[@1F]Senna, younger sister to the Elder Seedseer. Desiring to put matters to rights, it would seem she ventured into the depths of the forest a little over a day past. She has not been heard from since.
- `4`: Fortunately, an elemental sensed our growing concern and confided details of her current location. We are given to understand that the Seedseer can be found within a cave situated beneath a lake west of Camp Emerald Moss.
- `5`: As the elementals' chosen representatives, the three Seedseer siblings represent the pillars of order upon which Gridanian society rests. The loss of but one would destabilize our nation, rendering it vulnerable to the forces of chaos. Understand what your refusal could entail, [@SPLIT([@STRING($EB(1))], ,1)].
- `6`: As the elementals' chosen representatives, the three Seedseer siblings represent the pillars of order upon which Gridanian society rests. The loss of but one would destabilize our nation, rendering it vulnerable to the forces of chaos. With that in mind, make haste to the cave and find Raya[@1F]O, [@SPLIT([@STRING($EB(1))], ,1)], that we might all put our fears to rest.
- `41`: Raya[@1F]O is a skilled practitioner of white magic, an ancient art wielded only by a chosen few, and she is more than capable of protecting herself. Nevertheless, the Seedseers' safety is of paramount importance, and we cannot leave anything to chance. On which note, I would entrust to you the task of ascertaining Raya[@1F]O's present state, [@SPLIT([@STRING($EB(1))], ,1)].

## processEventStartAfter (3 parameters; 0x5C9; 15 instructions)

```text
pc003 0x5D5: eventOwner:startCliantTalkTurn(2, player)
pc006 0x5E1: eventOwner:_runCharaScheduler(353959936)
pc011 0x5F5: eventOwner:say(quest, 7, 0)
pc013 0x5FD: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `7`: Never was there a sister more loving than Raya[@1F]O. In all likelihood, it was out of concern for her siblings that she set out to tend the Twelveswood's affliction.

## processEventRayao (4 parameters; 0x6A5; 100 instructions)

Variant 1: extras `[0]`, offer result `1`.

```text
pc003 0x6B1: eventOwner:startCliantTalkTurn(2, player)
pc017 0x6E9: eventOwner:_runCharaScheduler(353959936)
pc022 0x6FD: eventOwner:say(quest, 8, 0)
pc027 0x711: eventOwner:say(quest, 45, 0)
pc032 0x725: eventOwner:say(quest, 46, 0)
pc037 0x739: eventOwner:say(quest, 47, 0)
pc042 0x74D: eventOwner:say(quest, 48, 0)
pc047 0x761: eventOwner:say(quest, 10, 0)
pc050 0x76D: eventOwner:_runCharaScheduler(353976320)
pc055 0x781: eventOwner:say(quest, 11, 0)
pc060 0x795: eventOwner:say(quest, 12, 0)
pc063 0x7A1: eventOwner:_runCharaScheduler(354082816)
pc068 0x7B5: eventOwner:say(quest, 13, 0)
pc073 0x7C9: eventOwner:say(quest, 49, 0)
pc078 0x7DD: eventOwner:say(quest, 43, 0)
pc083 0x7F1: eventOwner:say(quest, 14, 0)
pc086 0x7FD: eventOwner:_runCharaScheduler(354103296)
pc091 0x811: eventOwner:say(quest, 15, 0)
pc096 0x825: eventOwner:say(quest, 16, 0)
pc098 0x82D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Variant 2: extras `[1]`, offer result `1`.

```text
pc003 0x6B1: eventOwner:startCliantTalkTurn(2, player)
pc008 0x6C5: eventOwner:_runCharaScheduler(354082816)
pc013 0x6D9: eventOwner:say(quest, 9, 0)
pc027 0x711: eventOwner:say(quest, 45, 0)
pc032 0x725: eventOwner:say(quest, 46, 0)
pc037 0x739: eventOwner:say(quest, 47, 0)
pc042 0x74D: eventOwner:say(quest, 48, 0)
pc047 0x761: eventOwner:say(quest, 10, 0)
pc050 0x76D: eventOwner:_runCharaScheduler(353976320)
pc055 0x781: eventOwner:say(quest, 11, 0)
pc060 0x795: eventOwner:say(quest, 12, 0)
pc063 0x7A1: eventOwner:_runCharaScheduler(354082816)
pc068 0x7B5: eventOwner:say(quest, 13, 0)
pc073 0x7C9: eventOwner:say(quest, 49, 0)
pc078 0x7DD: eventOwner:say(quest, 43, 0)
pc083 0x7F1: eventOwner:say(quest, 14, 0)
pc086 0x7FD: eventOwner:_runCharaScheduler(354103296)
pc091 0x811: eventOwner:say(quest, 15, 0)
pc096 0x825: eventOwner:say(quest, 16, 0)
pc098 0x82D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `8`: So, you are the one they call [@STRING($EB(1))]. Wonder not─though we meet for the first time, you are no stranger to the elementals, and it is they who told me of your coming.
- `9`: We meet again, [@SPLIT([@STRING($EB(1))], ,1)]. The elementals told me of your coming.
- `10`: I suspect you have already been apprised of the situation, but thieves have appeared who prey upon the items left at Lifemend Stump. Aye, the place of sanctity where one may leave broken objects, that they may be restored to newness by the moogles.
- `11`: I have come here for no other purpose than to investigate the thefts. In particular, I seek to recover the enchanted staff [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)], a Gridanian relic of immeasurable worth.
- `12`: Truth be told, Lifemend Stump is no stranger to grasping hands, and this is scarce the first time items have vanished. But something strikes me as unusual about this latest spate of incidents.
- `13`: [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)] is a mighty artifact, harboring a divine power that monsters find detestable. Yet the elementals say that the culprits are not men, but monsters─a family of vilekin, to be precise.
- `14`: <sigh> While the moogles' concern for my welfare is touching, I can scarce lace up my own bodice while they are about. Yet the stolen staff will not recover itself! Therefore, being to all intents and purposes [@1A(1)]detained[@1A(0)] here, I must rely upon another to act in my stead.
- `15`: At the risk of sounding presumptuous, I should be grateful beyond words if you would attempt to reclaim [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)] in Gridania's name. The thieves I seek are a diremite straggler and her miteling brood. They are ensconced within the Mun[@1F]Tuy Cellars, north of Camp Emerald Moss.
- `16`: Go now, [@SPLIT([@STRING($EB(1))], ,1)], and return once you have found that which was stolen. I look forward to our next meeting, and the glad tidings that shall doubtless accompany it.
- `43`: I had resolved to confront the thieves...but the moogles would not hear of it. They will not allow me to expose myself to the slightest danger, real or imagined, and have gone so far as to obstruct me when I attempt to leave this cave. No amount of reasoning will sway them.
- `45`: I'm given to understand your purpose here is to ascertain my safety. While the sentiment is appreciated, it is quite unnecessary. The Twelveswood is no less a home to me than Gridania herself─no ill shall befall me whilst I am here.
- `46`: Should this simple truth not suffice to assuage your anxiety, know that aside from our communion with the elementals through conjury, we Padjal are also keepers of white magic.
- `47`: White magic is an ancient healing art that has been passed down through the ages in Gridania. With its power at my disposal, I am not like to come to harm.
- `48`: Now, at this juncture I would ordinarily send you back to Gridania with my thanks. As it happens, however, I had been wanting for help, and in answer the Twelveswood delivered you to me.
- `49`: It defies reason that the creatures could even bring themselves to approach the staff, let alone spirit it away.

## processEventMoogleA00 (3 parameters; 0x977; 15 instructions)

```text
pc003 0x983: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0x98F: eventOwner:_runCharaScheduler(70086656)
pc011 0x9A3: eventOwner:say(quest, 17, 0)
pc013 0x9AB: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `17`: Kupopo... We really ought to head back. A[@1F]Ruhn will be beside himself with worry, kupo.

## processEventMoogleB00 (3 parameters; 0xA59; 15 instructions)

```text
pc003 0xA65: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xA71: eventOwner:_runCharaScheduler(70098944)
pc011 0xA85: eventOwner:say(quest, 18, 0)
pc013 0xA8D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `18`: Raya[@1F]O can be rather willful, kupo. Stubborn, too. And short-tempered. A bit like a chocobo during mating seaso─ N-No, that's not right. Anyway, she could stand to learn from Kan[@1F]E's example, kupo.

## processEventRyaoAfter (3 parameters; 0xB3B; 20 instructions)

```text
pc003 0xB47: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB53: eventOwner:_runCharaScheduler(354103296)
pc011 0xB67: eventOwner:say(quest, 21, 0)
pc016 0xB7B: eventOwner:say(quest, 22, 0)
pc018 0xB83: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `21`: Being the place where the pact between man and moogle was forged, Lifemend Stump is considered sacred. To profane its grounds with so base an act as theft is a sin most grievous.
- `22`: In the name of the elementals, I hereby grant you permission to put down the diremite straggler and her miteling brood, that [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)] might be reclaimed.

## processEventMoogleA01 (3 parameters; 0xC34; 15 instructions)

```text
pc003 0xC40: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xC4C: eventOwner:_runCharaScheduler(70098944)
pc011 0xC60: eventOwner:say(quest, 19, 0)
pc013 0xC68: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `19`: It's not easy attending Raya[@1F]O. Staying one flap ahead of her takes all of our energy, kupo.

## processEventMoogleB01 (3 parameters; 0xD16; 15 instructions)

```text
pc003 0xD22: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xD2E: eventOwner:_runCharaScheduler(70017024)
pc011 0xD42: eventOwner:say(quest, 20, 0)
pc013 0xD4A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `20`: We moogles will try and keep Raya[@1F]O from doing anything rash, but we're only forestalling the inevitable. Do make all haste, kupo.

## processEventClear (3 parameters; 0xDF8; 18 instructions)

```text
pc003 0xE04: eventOwner:startCliantTalkTurn(2, player)
pc008 0xE18: eventOwner:say(quest, 23, 0)
pc011 0xE24: eventOwner:_runCharaScheduler(354095104)
pc016 0xE38: eventOwner:say(quest, 24, 0)
return (no values)
```

Quest-text references:

- `23`: [@SPLIT([@STRING($EB(1))], ,1)]! You were so long in returning, I had begun to count the moments until my escape from this cave─and my endearing custodians.
- `24`: Ah, you've retrieved [@SWITCH([@SHEET(itemData,11000551,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000551,1,1)][@EDGECOLOR($EC)][@COLOR($EC)]! The Twelve be praised! Here, allow me to─

## processEventClearNQ (3 parameters; 0xECF; 16 instructions)

```text
pc002 0xED7: quest:startFadeOutCutSceneDefault(player)
pc004 0xEDF: eventOwner:finishCliantTalkTurn()
pc007 0xEEB: quest:_wait(1)
pc011 0xEFB: quest:startNQCutScene("whm0j110", 1)
pc014 0xF07: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEventMoogleA02 (3 parameters; 0xFC9; 15 instructions)

```text
pc003 0xFD5: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xFE1: eventOwner:_runCharaScheduler(70082560)
pc011 0xFF5: eventOwner:say(quest, 39, 0)
pc013 0xFFD: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `39`: Kupopo... I dread to think what the chieftain would do to us if any ill were to befall Raya[@1F]O...

## processEventMoogleB02 (3 parameters; 0x10AB; 15 instructions)

```text
pc003 0x10B7: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0x10C3: eventOwner:_runCharaScheduler(70021120)
pc011 0x10D7: eventOwner:say(quest, 40, 0)
pc013 0x10DF: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `40`: We thought you'd never return, kupo! Quickly now, report to Raya[@1F]O before she does something we'll live to regret!

## processEventJob (4 parameters; 0x118D; 22 instructions)

```text
pc005 0x11A1: worldMaster:say(quest, 38, 0)
pc009 0x11B1: quest:showGetJobItemWidget(player, arg4)
pc012 0x11BD: quest:_wait(6)
pc017 0x11D1: desktopWidget:openPublicInformLongDialogWidget(quest, 52)
pc020 0x11DD: quest:_wait(8)
return (no values)
```

Quest-text references:

- `38`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 35.
- `52`: A brilliant white light shines forth from the Soul of the White Mage, suffusing your entire being!

## processEventKokuti (4 parameters; 0x12B2; 9 instructions)

```text
pc004 0x12C2: quest:showGetJobAbilityWidget(player, 27344, 1)
pc007 0x12CE: quest:_wait(6)
return (no values)
```

## processEventStart_Hint (3 parameters; 0x1341; 11 instructions)

```text
pc009 0x1365: worldMaster:say(worldMaster, 51130, 111241, 23, 30, 3, 15)
return (no values)
```

## processEventChuui (3 parameters; 0x13E5; 8 instructions)

```text
pc006 0x13FD: worldMaster:say(worldMaster, 51131, 111241, 23)
return (no values)
```

## processEventChuui2 (3 parameters; 0x1462; 8 instructions)

```text
pc006 0x147A: worldMaster:say(worldMaster, 51132, 111241, 23)
return (no values)
```

