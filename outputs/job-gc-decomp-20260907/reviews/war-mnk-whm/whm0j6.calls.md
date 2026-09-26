# 111246 whm0j6: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x376; 5 instructions)

```text
pc003 0x382: quest:_loadTextDataPermanently(9812, "whm0j6")
return (no values)
```

## processEventStartBeforeRaya (3 parameters; 0x3E5; 26 instructions)

```text
pc003 0x3F1: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3FD: eventOwner:_runCharaScheduler(364761088)
pc011 0x411: eventOwner:say(quest, 4, 0)
pc016 0x425: eventOwner:say(quest, 5, 0)
pc022 0x43D: worldMaster:say(quest, 6, 0)
pc024 0x445: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `4`: For a blessing, the keening of the elementals has yet to reach such an intensity as would be cause for alarm. We have time to act still.
- `5`: I promise not to rest until the whereabouts of the last artifact are known to us. In the meantime, [@SPLIT([@STRING($EB(1))], ,1)], I would have you apply yourself to honing your abilities. You serve Eorzea and the elementals best by realizing your potential as a white mage.
- `6`: The next white mage quest will be available from Raya[@1F]O[@1F]Senna upon reaching level 50.

## processEventStartBeforeMogA (3 parameters; 0x510; 15 instructions)

```text
pc003 0x51C: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0x528: eventOwner:_runCharaScheduler(70021120)
pc011 0x53C: eventOwner:say(quest, 2, 0)
pc013 0x544: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Oha[@1F]Sok is somewhere out there, alone with her sorrow. The mere imagining of it makes my eyes rain, kupo... <sob>

## processEventStartBeforeMogB (3 parameters; 0x5F2; 15 instructions)

```text
pc003 0x5FE: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0x60A: eventOwner:_runCharaScheduler(70197248)
pc011 0x61E: eventOwner:say(quest, 3, 0)
pc013 0x626: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: Raya[@1F]O hasn't practiced with her staff in quite a while. Instead, she's had her nose buried in musty old tomes, kupo.

## processEventStart (3 parameters; 0x6D4; 126 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x6E0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x6EC: eventOwner:_runCharaScheduler(353964032)
pc011 0x700: eventOwner:say(quest, 7, 0)
pc016 0x714: eventOwner:say(quest, 8, 0)
pc019 0x720: eventOwner:_runCharaScheduler(353980416)
pc024 0x734: eventOwner:say(quest, 9, 0)
pc029 0x748: eventOwner:say(quest, 54, 0)
pc032 0x754: eventOwner:_runCharaScheduler(354103296)
pc037 0x768: eventOwner:say(quest, 10, 0)
pc042 0x77C: eventOwner:say(quest, 55, 0)
pc045 0x788: eventOwner:_runCharaScheduler(354082816)
pc050 0x79C: eventOwner:say(quest, 56, 0)
pc055 0x7B0: eventOwner:say(quest, 11, 0)
pc058 0x7BC: quest:_wait(0.5)
pc061 0x7C8: eventOwner:_runCharaScheduler(354078720)
pc066 0x7DC: eventOwner:say(quest, 57, 0)
pc071 0x7F0: eventOwner:say(quest, 58, 0)
pc074 0x7FC: eventOwner:_runCharaScheduler(79597568)
pc079 0x810: eventOwner:say(quest, 12, 0)
pc084 0x824: eventOwner:say(quest, 13, 0)
pc087 0x830: eventOwner:_runCharaScheduler(353959936)
pc092 0x844: eventOwner:say(quest, 16, 0)
pc097 0x858: eventOwner:say(quest, 17, 0)
pc099 0x860: quest:showQuestInfomation()
pc116 0x8A4: eventOwner:_runCharaScheduler(79589376)
pc121 0x8B8: eventOwner:say(quest, 18, 0)
pc123 0x8C0: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x6E0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x6EC: eventOwner:_runCharaScheduler(353964032)
pc011 0x700: eventOwner:say(quest, 7, 0)
pc016 0x714: eventOwner:say(quest, 8, 0)
pc019 0x720: eventOwner:_runCharaScheduler(353980416)
pc024 0x734: eventOwner:say(quest, 9, 0)
pc029 0x748: eventOwner:say(quest, 54, 0)
pc032 0x754: eventOwner:_runCharaScheduler(354103296)
pc037 0x768: eventOwner:say(quest, 10, 0)
pc042 0x77C: eventOwner:say(quest, 55, 0)
pc045 0x788: eventOwner:_runCharaScheduler(354082816)
pc050 0x79C: eventOwner:say(quest, 56, 0)
pc055 0x7B0: eventOwner:say(quest, 11, 0)
pc058 0x7BC: quest:_wait(0.5)
pc061 0x7C8: eventOwner:_runCharaScheduler(354078720)
pc066 0x7DC: eventOwner:say(quest, 57, 0)
pc071 0x7F0: eventOwner:say(quest, 58, 0)
pc074 0x7FC: eventOwner:_runCharaScheduler(79597568)
pc079 0x810: eventOwner:say(quest, 12, 0)
pc084 0x824: eventOwner:say(quest, 13, 0)
pc087 0x830: eventOwner:_runCharaScheduler(353959936)
pc092 0x844: eventOwner:say(quest, 16, 0)
pc097 0x858: eventOwner:say(quest, 17, 0)
pc099 0x860: quest:showQuestInfomation()
pc104 0x874: eventOwner:_runCharaScheduler(353964032)
pc109 0x888: eventOwner:say(quest, 19, 0)
pc111 0x890: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `7`: Can you hear it, [@SPLIT([@STRING($EB(1))], ,1)]? The elementals' keening has begun to rise in crescendo, a sound that sends a chill down my spine.
- `8`: Oha[@1F]Sok has returned to the Twelveswood, I am certain of it. Her presence stirs the rage of her kindred.
- `9`: Having observed the deeds of men through your eyes, Oha[@1F]Sok forbears passing her final judgment.
- `10`: Hm? Might we try treating with Oha[@1F]Sok directly? Would that the solution were so simple, [@SPLIT([@STRING($EB(1))], ,1)]. Alas, the problem lies not with Oha[@1F]Sok, but her kindred.
- `11`: ...But here I must needs make a confession. It pains me to say this, but I have failed to locate the final piece of the garb.
- `12`: [@SPLIT([@STRING($EB(1))], ,1)], your final mission is thus: you are to go forth and grant peace unto the elementals.
- `13`: The time is long past that men honor the oath made in the pact of Gelmorra─the oath to shine the light of succor throughout Eorzea.
- `16`: I will tell it to you plain: this task would ask much of the most experienced white mage.
- `17`: Yet it was through your eyes that Oha[@1F]Sok saw hope in mankind. We must pray that her kindred can be made to see the same.
- `18`: Our journey is almost at an end, [@SPLIT([@STRING($EB(1))], ,1)]. Would you truly forsake our cause now?
- `19`: The keening of the elementals is loudest southwest of Camp Bentbranch, and it is thither that you must take yourself. Go with the blessing of the Matron, [@SPLIT([@STRING($EB(1))], ,1)].
- `54`: However, being the collective wrath of the elementals given form, she cannot help but be swayed by the humours of her kind. It is only a matter of time before her hand is forced.
- `55`: Our only recourse is to pacify the enraged elementals, one after the next.
- `56`: If all goes well, some may be willing to render their essence unto the garb of succor, and our cause will grow stronger for it.
- `57`: I have explored every avenue known to me, exhausted every store of knowledge...yet I could not find so much as a single reference to its whereabouts.
- `58`: And now our time is spent. The hour of reckoning is upon us, and we must needs act, with or without all five artifacts of succor.

## processEventCutSceneBeforeBattle (3 parameters; 0xA68; 11 instructions)

```text
pc002 0xA70: quest:startFadeOutCutSceneDefault(player)
pc006 0xA80: quest:startNQCutScene("whm0j605", 1)
pc009 0xA8C: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEventRyaoAfter (3 parameters; 0xB29; 28 instructions)

```text
pc003 0xB35: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB41: eventOwner:_runCharaScheduler(364752896)
pc011 0xB55: eventOwner:say(quest, 23, 0)
pc016 0xB69: eventOwner:say(quest, 48, 0)
pc019 0xB75: eventOwner:_runCharaScheduler(79597568)
pc024 0xB89: eventOwner:say(quest, 46, 0)
pc026 0xB91: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `23`: The keening of the elementals is loudest southwest of Camp Bentbranch, and it is thither that you must take yourself.
- `46`: I shall pray for your safe return. May the Matron watch over you.
- `48`: Go forth, my stalwart white mage, and assuage the anguish of the elementals, that the light of succor might shine throughout Eorzea.

## processEventMoogleA00 (3 parameters; 0xC54; 20 instructions)

```text
pc003 0xC60: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xC6C: eventOwner:_runCharaScheduler(70017024)
pc011 0xC80: eventOwner:say(quest, 20, 0)
pc016 0xC94: eventOwner:say(quest, 21, 0)
pc018 0xC9C: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `20`: What's that? You'd like my blessing as well, you say? Happy to oblige, kupo! Ahem!
- `21`: Kupo... Kupopopo... KUPO![@CR]...It is done. Now you're [@1A(1)]certain[@1A(0)] to succeed, kupo!

## processEventMoogleB00 (3 parameters; 0xD53; 15 instructions)

```text
pc003 0xD5F: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xD6B: eventOwner:_runCharaScheduler(70197248)
pc011 0xD7F: eventOwner:say(quest, 22, 0)
pc013 0xD87: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `22`: How do you mean to deal with the elementals, kupo? With force...or with compassion?

## processEventMoogleA01 (3 parameters; 0xE35; 15 instructions)

```text
pc003 0xE41: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xE4D: eventOwner:_runCharaScheduler(70197248)
pc011 0xE61: eventOwner:say(quest, 38, 0)
pc013 0xE69: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `38`: <sniff> <sniff> Kupopo? The scent of Oha[@1F]Sok is all over you, adventurer...and that of several other elementals besides. I say, what in the world have you been up to, kupo?

## processEventMoogleB01 (3 parameters; 0xF17; 15 instructions)

```text
pc003 0xF23: eventOwner:startCliantTalkTurnNoWait(1, player)
pc006 0xF2F: eventOwner:_runCharaScheduler(70057984)
pc011 0xF43: eventOwner:say(quest, 39, 0)
pc013 0xF4B: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `39`: What took you so long, kupo? You ought to know by now that Raya[@1F]O doesn't care to be kept waiting.

## processEventNQ (3 parameters; 0xFF9; 11 instructions)

```text
pc002 0x1001: quest:startFadeOutCutSceneDefault(player)
pc006 0x1011: quest:startNQCutScene("whm0j610", 1)
pc009 0x101D: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEvent_getAF_info (3 parameters; 0x10BA; 20 instructions)

```text
pc002 0x10C2: quest:_wait(0.5)
pc008 0x10DA: desktopWidget:openPublicInformLongDialogWidget(quest, 49, 8032706)
pc011 0x10E6: quest:_wait(8)
pc015 0x10F6: quest:showGetJobItemWidget(player, 8032706)
pc018 0x1102: quest:_wait(6)
return (no values)
```

Quest-text references:

- `49`: Oha[@1F]Sok entrusts herself to you in the form of [@SWITCH([@SHEET(itemData,$E8(1),41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,2,$E8(1),1,1)][@EDGECOLOR($EC)][@COLOR($EC)]!

## processEventClear (3 parameters; 0x11BD; 140 instructions)

```text
pc003 0x11C9: eventOwner:startCliantTalkTurn(2, player)
pc006 0x11D5: eventOwner:_runCharaScheduler(354099200)
pc011 0x11E9: eventOwner:say(quest, 32, 0)
pc016 0x11FD: eventOwner:say(quest, 47, 0)
pc019 0x1209: eventOwner:_runCharaScheduler(67805184)
pc024 0x121D: eventOwner:say(quest, 62, 0)
pc028 0x122D: quest:startFadeOut(player, 1.5)
pc031 0x1239: quest:_wait(1)
pc034 0x1245: eventOwner:_runCharaScheduler(79577088)
pc037 0x1251: quest:_wait(0.5)
pc041 0x1261: quest:startFadeIn(player, 1.5)
pc044 0x126D: eventOwner:_runCharaScheduler(354082816)
pc049 0x1281: eventOwner:say(quest, 33, 0)
pc054 0x1295: eventOwner:say(quest, 34, 0)
pc057 0x12A1: eventOwner:_runCharaScheduler(354103296)
pc062 0x12B5: eventOwner:say(quest, 63, 0)
pc067 0x12C9: eventOwner:say(quest, 44, 0)
pc070 0x12D5: eventOwner:_runCharaScheduler(354000896)
pc075 0x12E9: eventOwner:say(quest, 45, 0)
pc080 0x12FD: eventOwner:say(quest, 35, 0)
pc083 0x1309: eventOwner:_runCharaScheduler(353972224)
pc088 0x131D: eventOwner:say(quest, 36, 0)
pc093 0x1331: desktopWidget:openPublicInformLongDialogWidget(quest, 50)
pc096 0x133D: quest:_wait(8)
pc101 0x1351: quest:showGetJobAbilityWidget(player, 27345, 1)
pc104 0x135D: quest:_wait(6)
pc107 0x1369: eventOwner:_runCharaScheduler(353964032)
pc112 0x137D: eventOwner:say(quest, 37, 0)
pc117 0x1391: eventOwner:say(quest, 64, 0)
pc120 0x139D: eventOwner:_runCharaScheduler(354103296)
pc125 0x13B1: eventOwner:say(quest, 65, 0)
pc130 0x13C5: eventOwner:say(quest, 66, 0)
pc133 0x13D1: player:_runCharaScheduler(67108919)
pc136 0x13DD: quest:_wait(2.5)
pc138 0x13E5: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `32`: Oh, thank the gods you're safe! You were so long abroad, I feared for the worst. But never mind that now. That you have returned to me could only mean one thing─your mission was a success!
- `33`: That the final artifact of succor would be Oha[@1F]Sok herself...
- `34`: That certainly explains why we were unable to locate it. Pray forgive my outburst─I would not have believed such a thing possible.
- `35`: On behalf of the nation, I offer you my deepest thanks.
- `36`: By the power vested in me, I hereby permit you the use of new white magic.
- `37`: I once taught you that to walk the path of white magic is to devote oneself to the salving of hurts and lifting of misery.
- `44`: It is no ordinary white mage who can quell the collective fury of the elementals and win the favor of wrath incarnate besides. You can hold your head up high, [@SPLIT([@STRING($EB(1))], ,1)].
- `45`: Gridania is fortunate indeed to count you among her allies.
- `47`: Hm? That robe...I do not recall seeing it amongst the artifacts you acquired.[@CR]<gasp> Is this Oha[@1F]Sok's presence I sense!?
- `50`: A brilliant white light shines forth from the Soul of the White Mage, suffusing your entire being!
- `62`: What is the meaning of this!? Explain yourself this instant!
- `63`: I knew from the first that you possessed the potential for greatness─but that you should realize it, and so [@1A(1)]soon[@1A(0)]... Words fail me.
- `64`: You have grown into the very embodiment of that ideal, [@SPLIT([@STRING($EB(1))], ,1)], and I say this without reserve.
- `65`: The future will be fraught with hardships, but so long as I draw breath, I shall give my all to ensure that peace ever reigns within the Twelveswood. I have no doubt that you will strive to do the same.
- `66`: Pray keep watching over us, Oha[@1F]Sok. I promise you, the day will come when the Eorzea you have envisioned is made reality...and you need mourn no more.

## processEventAfget (4 parameters; 0x1616; 21 instructions)

```text
pc002 0x161E: quest:_wait(6)
pc007 0x1632: quest:showGetJobAbilityWidget(player, 27345, 1)
pc010 0x163E: quest:_wait(6)
pc016 0x1656: desktopWidget:openPublicInformDialogWidget(quest, 49, arg4)
pc019 0x1662: quest:_wait(6)
return (no values)
```

Quest-text references:

- `49`: Oha[@1F]Sok entrusts herself to you in the form of [@SWITCH([@SHEET(itemData,$E8(1),41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,2,$E8(1),1,1)][@EDGECOLOR($EC)][@COLOR($EC)]!

## processEventChuui (3 parameters; 0x1713; 8 instructions)

```text
pc006 0x172B: worldMaster:say(worldMaster, 51131, 111246, 27)
return (no values)
```

## processEventChuui2 (3 parameters; 0x1790; 8 instructions)

```text
pc006 0x17A8: worldMaster:say(worldMaster, 51132, 111246, 27)
return (no values)
```

## processEventNQ03 (3 parameters; 0x180D; 11 instructions)

```text
pc002 0x1815: quest:startFadeOutCutSceneDefault(player)
pc006 0x1825: quest:startNQCutScene("whm0j610", 1)
pc009 0x1831: quest:startFadeInCutSceneDefault(player)
return (no values)
```

