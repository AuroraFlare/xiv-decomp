# 111223 mnk0j3: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x2AC; 5 instructions)

```text
pc003 0x2B8: quest:_loadTextDataPermanently(8484, "mnk0j3")
return (no values)
```

## processEventStartBefore (3 parameters; 0x31B; 26 instructions)

```text
pc003 0x327: eventOwner:startCliantTalkTurn(2, player)
pc006 0x333: eventOwner:_runCharaScheduler(353972224)
pc011 0x347: eventOwner:say(quest, 3, 0)
pc016 0x35B: eventOwner:say(quest, 4, 0)
pc022 0x373: worldMaster:say(quest, 5, 0)
pc024 0x37B: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: What? [@2B([@SWITCH([@SHEET(itemData,11000553,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,2,11000553,1,1)][@EDGECOLOR($EC)][@COLOR($EC)])] [@1A(1)]broke[@1A(0)]!? False! You [@1A(1)]allowed[@1A(0)] it to be broken! <sigh> Perhaps the new make is not so sturdy as the old.
- `4`: I shall require some time to ready a new device. In the meantime, just...go and fight something, or...do whatever it is you like wasting your life doing.
- `5`: The next monk quest will be available from Erik upon reaching level 40.

## processEventWidargeltHint (3 parameters; 0x446; 15 instructions)

```text
pc003 0x452: eventOwner:startCliantTalkTurn(2, player)
pc006 0x45E: eventOwner:_runCharaScheduler(353959936)
pc011 0x472: eventOwner:say(quest, 2, 0)
pc013 0x47A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: How did you fare, [@IF($E9(4),sister,brother)]? I have made much progress. I feel my power growing.

## processEventStart (3 parameters; 0x519; 115 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x525: eventOwner:startCliantTalkTurn(2, player)
pc006 0x531: eventOwner:_runCharaScheduler(353959936)
pc011 0x545: eventOwner:say(quest, 6, 0)
pc016 0x559: eventOwner:say(quest, 7, 0)
pc019 0x565: eventOwner:_runCharaScheduler(354086912)
pc024 0x579: eventOwner:say(quest, 8, 0)
pc029 0x58D: eventOwner:say(quest, 60, 0)
pc034 0x5A1: eventOwner:say(quest, 9, 0)
pc037 0x5AD: eventOwner:_runCharaScheduler(353959936)
pc042 0x5C1: eventOwner:say(quest, 78, 0)
pc047 0x5D5: eventOwner:say(quest, 10, 0)
pc052 0x5E9: eventOwner:say(quest, 11, 0)
pc055 0x5F5: eventOwner:_runCharaScheduler(353972224)
pc060 0x609: eventOwner:say(quest, 12, 0)
pc065 0x61D: eventOwner:say(quest, 64, 0)
pc068 0x629: eventOwner:_runCharaScheduler(354103296)
pc073 0x63D: eventOwner:say(quest, 61, 0)
pc078 0x651: eventOwner:say(quest, 65, 0)
pc081 0x65D: eventOwner:_runCharaScheduler(353968128)
pc086 0x671: eventOwner:say(quest, 13, 0)
pc088 0x679: quest:showQuestInfomation()
pc105 0x6BD: eventOwner:_runCharaScheduler(354041856)
pc110 0x6D1: eventOwner:say(quest, 15, 0)
pc112 0x6D9: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x525: eventOwner:startCliantTalkTurn(2, player)
pc006 0x531: eventOwner:_runCharaScheduler(353959936)
pc011 0x545: eventOwner:say(quest, 6, 0)
pc016 0x559: eventOwner:say(quest, 7, 0)
pc019 0x565: eventOwner:_runCharaScheduler(354086912)
pc024 0x579: eventOwner:say(quest, 8, 0)
pc029 0x58D: eventOwner:say(quest, 60, 0)
pc034 0x5A1: eventOwner:say(quest, 9, 0)
pc037 0x5AD: eventOwner:_runCharaScheduler(353959936)
pc042 0x5C1: eventOwner:say(quest, 78, 0)
pc047 0x5D5: eventOwner:say(quest, 10, 0)
pc052 0x5E9: eventOwner:say(quest, 11, 0)
pc055 0x5F5: eventOwner:_runCharaScheduler(353972224)
pc060 0x609: eventOwner:say(quest, 12, 0)
pc065 0x61D: eventOwner:say(quest, 64, 0)
pc068 0x629: eventOwner:_runCharaScheduler(354103296)
pc073 0x63D: eventOwner:say(quest, 61, 0)
pc078 0x651: eventOwner:say(quest, 65, 0)
pc081 0x65D: eventOwner:_runCharaScheduler(353968128)
pc086 0x671: eventOwner:say(quest, 13, 0)
pc088 0x679: quest:showQuestInfomation()
pc093 0x68D: eventOwner:_runCharaScheduler(353964032)
pc098 0x6A1: eventOwner:say(quest, 62, 0)
pc100 0x6A9: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `6`: Ah, dear [@SPLIT([@STRING($EB(1))], ,1)], so good of you to trouble yourself to come. Normally I might be cross, but my spirits are far too high just now. And it is you I have to thank!
- `7`: I speak of the data you procured! It is simply marvelous! You have a true gift for grunt work, my friend. I wish I had a hundred more assistants just like you.
- `8`: I have been in this field for a very long time, and I have been alone. Ever since that unfortunate mulled tea fungus culture incident sparked my passion for research. I regret nothing, [@SPLIT([@STRING($EB(1))], ,1)].
- `9`: There, how was that? Shall we dispense with any further pleasantries? Very good, then.
- `10`: My hypothesis was that such flux in the aether was indicative of a past battle, and all my research was predicated upon this. But turn the theory on its head, [@SPLIT([@STRING($EB(1))], ,1)], if your mind is able─what if the people of the past [@1A(1)]chose[@1A(0)] areas of roiling aether to hold their battles!?
- `11`: I have already sent the simpleton monk to take measurements at the Finesand Banks. As you are doubtless unaware, this lies on the border between Ala Mhigo and Gridania, and was the setting of the Autumn War.
- `12`: I ask that you find our monk friend and collect his aetheriometer. Manual and tedious, yes, but he has an early make of the device that is unable to transmit data.
- `13`: Here, take this [@SWITCH([@SHEET(itemData,11000553,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000553,1,1)][@EDGECOLOR($EC)][@COLOR($EC)]. It is markedly older than the [@SWITCH([@SHEET(itemData,11000552,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,3,11000552,1,1)][@EDGECOLOR($EC)][@COLOR($EC)]. The chain and crystal hang from a tripod which must be set upright in the ground. Frankly, I'm embarrassed to resort to using it. Right, then, are you ready?
- `15`: Oh, you are an escort, not an assistant, are you? False! You are whatever I pay you to be. I own you, [@SPLIT([@STRING($EB(1))], ,1)]. And let us not forget, you'll do exactly as I say if you mean to chase these dreams of monkhood you unaccountably seem to harbor.
- `60`: Save perhaps having to share so wondrous a world with souls as unlearned as yourself. Still, your performance has not left me completely bereft of joy. It is rewarding to think that my instruction has guided you to such success.
- `61`: You think I ask much of you? False! I ask more. Your other task is to travel to Emerald Moss in the Black Shroud, and there take measurements at the Mun[@1F]Tuy Cellars.
- `62`: I shall continue my search for other potential battlegrounds in your absence. As ever, should you care to be led from the dark of your allegorical cave, ask me anything at any time. I have much I could share with you of the Finesand Banks.
- `64`: He told me on the linkpearl that he has put in at Little Ala Mhigo, to the south of Camp Drybone. I assume your geography is as advanced as your history, so allow me to append: the entrance is on the western side of a great monolith in the most southwesterly region of southern Thanalan.
- `65`: There is a particularly vile fiend in the area known as the Prince of Pestilence. I have no desire to propagate the monkhood's dated and tribal beliefs, but all things being equal, this beast will likely prove the most worthwhile quarry to serve both our ends.
- `78`: I made yet another career-defining discovery while pondering which battleground to measure next. Eorzea is home to numerous locations where the aether is in an intensely chaotic state, yet which never played host to any war.

## processEventAfterTolk01 (3 parameters; 0x85B; 28 instructions)

```text
pc003 0x867: eventOwner:startCliantTalkTurn(2, player)
pc006 0x873: eventOwner:_runCharaScheduler(354103296)
pc011 0x887: eventOwner:say(quest, 30, 0)
pc016 0x89B: eventOwner:say(quest, 66, 0)
pc019 0x8A7: eventOwner:_runCharaScheduler(354041856)
pc024 0x8BB: eventOwner:say(quest, 31, 0)
pc026 0x8C3: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `30`: It is exceedingly simple, really. Travel to Little Ala Mhigo. Retrieve the simpleton monk's aetheriometer.
- `31`: Which part is it that you fail to understand, exactly?
- `66`: Travel to the Mun[@1F]Tuy Cellars. Kill the Prince of Pestilence. Take measurements of the area's aether.

## processEventStartAfter (3 parameters; 0x986; 57 instructions)

```text
pc003 0x992: eventOwner:startCliantTalkTurn(2, player)
pc008 0x9A6: eventOwner:say(quest, 32, 0)
pc012 0x9B6: quest:startFadeOut(player, 1.5)
pc015 0x9C2: quest:_wait(0.5)
pc018 0x9CE: eventOwner:_runCharaScheduler(354086912)
pc021 0x9DA: quest:_wait(1)
pc025 0x9EA: quest:startFadeIn(player, 1.5)
pc030 0x9FE: eventOwner:say(quest, 33, 0)
pc035 0xA12: eventOwner:say(quest, 34, 0)
pc040 0xA26: eventOwner:say(quest, 35, 0)
pc043 0xA32: eventOwner:_runCharaScheduler(353959936)
pc048 0xA46: eventOwner:say(quest, 36, 0)
pc053 0xA5A: eventOwner:say(quest, 67, 0)
pc055 0xA62: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `32`: You have come far. It is good to see you, [@IF($E9(4),sister,brother)].
- `33`: You come for my device? It is not ready to give. My work is not finished.
- `34`: The readings require more time. Do not worry. They will be ready soon.
- `35`: You make for the Mun[@1F]Tuy Cellars. Erik believes the aether is strong there? Though the Cellars hosted no battle?
- `36`: Leave me to my task here. Go to the Mun[@1F]Tuy Cellars. Take your readings. My work will soon be done. I will bring the device to you.
- `67`: I have troubled you to come here. I will not trouble you to wait. Go. We will meet again soon, [@IF($E9(4),sister,brother)].

## processEventAfterTolk02 (3 parameters; 0xB89; 28 instructions)

```text
pc003 0xB95: eventOwner:startCliantTalkTurn(2, player)
pc006 0xBA1: eventOwner:_runCharaScheduler(353959936)
pc011 0xBB5: eventOwner:say(quest, 43, 0)
pc016 0xBC9: eventOwner:say(quest, 69, 0)
pc019 0xBD5: eventOwner:_runCharaScheduler(354086912)
pc024 0xBE9: eventOwner:say(quest, 44, 0)
pc026 0xBF1: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `43`: Has even my simple explanation proven too much for you to recall? Gods be good, [@SPLIT([@STRING($EB(1))], ,1)], you truly know how to test a teacher's patience.
- `44`: Right, well, what's done is done─or in this case, not done, as it were. You'd best see to your other task. Make your way north of Emerald Moss to the Mun[@1F]Tuy Cellars. Slay the Prince of Pestilence and measure the area's aether.
- `69`: The simpleton monk has yet to finish his readings? Odd. Given when he departed, he should be well done by now. <sigh> Give an Ala Mhigan an ilm and he will take a malm.

## processEventWidargeltAfter (3 parameters; 0xCB4; 25 instructions)

```text
pc003 0xCC0: eventOwner:startCliantTalkTurn(2, player)
pc006 0xCCC: eventOwner:_runCharaScheduler(353959936)
pc011 0xCE0: eventOwner:say(quest, 37, 0)
pc016 0xCF4: eventOwner:say(quest, 68, 0)
pc021 0xD08: eventOwner:say(quest, 38, 0)
pc023 0xD10: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `37`: The Mun[@1F]Tuy Cellars? How did I know?
- `38`: He was excited. He spoke of a great discovery. Of a new truth for the realm. Of the Mun[@1F]Tuy Cellars. Of aether. Long he spoke. So very, very long.
- `68`: The teacher's linkpearl carried his voice to me. It woke me in the morning.

## processEventPoint (3 parameters; 0xDCA; 7 instructions)

```text
pc005 0xDDE: worldMaster:say(quest, 57, 0)
return (no values)
```

Quest-text references:

- `57`: This seems to be an ideal location. Slay the Prince of Pestilence and set up the aetheriometer.

## processEventClear (3 parameters; 0xE3A; 34 instructions)

```text
pc004 0xE4A: desktopWidget:openPublicInformDialogWidget(quest, 58)
pc010 0xE62: worldMaster:notify(quest, 58, 0)
pc013 0xE6E: quest:_wait(3)
pc016 0xE7A: quest:startFadeOutCutSceneDefault(player)
pc020 0xE8A: quest:startNQCutScene("mnk0j310", 1)
pc023 0xE96: quest:startFadeInCutSceneDefault(player)
pc026 0xEA2: quest:_wait(1)
pc032 0xEBA: worldMaster:say(quest, 55, 0)
return (no values)
```

Quest-text references:

- `55`: The next monk quest will be available from Erik upon reaching level 45.
- `58`: You set up [@SWITCH([@SHEET(itemData,11000553,41)],[@COLOR(#fff3f3f3)],[@COLOR(#ffc0ffa0)],[@COLOR(#ff60c8ff)],[@COLOR(#ffb38cff)],[@COLOR(#ffffa666)],[@COLOR(#ffe5dd7e)])][@EDGECOLOR(#ff262626)][@SHEETEN(xtx/itemName,2,11000553,1,1)][@EDGECOLOR($EC)][@COLOR($EC)].

## processEventAfget (4 parameters; 0xFE1; 17 instructions)

```text
pc004 0xFF1: desktopWidget:openPublicInformLongDialogWidget(quest, 79)
pc007 0xFFD: quest:_wait(8)
pc012 0x1011: quest:showGetJobAbilityWidget(player, 27109, 1)
pc015 0x101D: quest:_wait(6)
return (no values)
```

Quest-text references:

- `79`: The aether of the land opens your chakra!

## processEventChuui (3 parameters; 0x10DB; 8 instructions)

```text
pc006 0x10F3: worldMaster:say(worldMaster, 51132, 111223, 15)
return (no values)
```

## processEventChuui0 (3 parameters; 0x1158; 8 instructions)

```text
pc006 0x1170: worldMaster:say(worldMaster, 51131, 111223, 15)
return (no values)
```

