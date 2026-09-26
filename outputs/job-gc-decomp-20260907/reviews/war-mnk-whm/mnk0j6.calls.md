# 111226 mnk0j6: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x340; 5 instructions)

```text
pc003 0x34C: quest:_loadTextDataPermanently(8532, "mnk0j6")
return (no values)
```

## processEventERIK_Hint (3 parameters; 0x3AF; 26 instructions)

```text
pc003 0x3BB: eventOwner:startCliantTalkTurn(2, player)
pc006 0x3C7: eventOwner:_runCharaScheduler(354041856)
pc011 0x3DB: eventOwner:say(quest, 3, 0)
pc016 0x3EF: eventOwner:say(quest, 87, 0)
pc022 0x407: worldMaster:say(quest, 4, 0)
pc024 0x40F: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `3`: You! My discovery─the greatest discovery of our lifetime─it is all thanks to you, you beautiful, wonderful fool! All that remains is to publish it.
- `4`: The next monk quest will be available from Erik upon reaching level 50.
- `87`: Ohhh, to see the looks upon my colleague's faces when I revolutionize mankind's very perception of reality!

## processEventWIDARGELT_HintUnder50 (3 parameters; 0x4DA; 28 instructions)

```text
pc003 0x4E6: eventOwner:startCliantTalkTurn(2, player)
pc006 0x4F2: eventOwner:_runCharaScheduler(354099200)
pc011 0x506: eventOwner:say(quest, 2, 0)
pc016 0x51A: eventOwner:say(quest, 82, 0)
pc019 0x526: eventOwner:_runCharaScheduler(353959936)
pc024 0x53A: eventOwner:say(quest, 83, 0)
pc026 0x542: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Well done, [@IF($E9(4),sister,brother)]. You have claimed the first four pieces. I knew that you would.
- `82`: Now you must train. You must learn to wear what you have won. To draw power from it.
- `83`: I will keep my promise. The fifth will be yours. But not yet. Your strength must peak. Ala Mhigo requires it.

## processEventWIDARGELT_HintOver50 (3 parameters; 0x5FC; 28 instructions)

```text
pc003 0x608: eventOwner:startCliantTalkTurn(2, player)
pc006 0x614: eventOwner:_runCharaScheduler(354082816)
pc011 0x628: eventOwner:say(quest, 84, 0)
pc016 0x63C: eventOwner:say(quest, 85, 0)
pc019 0x648: eventOwner:_runCharaScheduler(354062336)
pc024 0x65C: eventOwner:say(quest, 86, 0)
pc026 0x664: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `84`: Your trial is at an end. You have passed. I will keep the promise made in time.
- `85`: Many talk of the teacher's findings. He has made a great discovery. The man knows much. He would be a mighty ally. Speak to him. Try to win him to our cause.
- `86`: The fifth piece must be prepared. I require time. Leave me for now, [@IF($E9(4),sister,brother)].

## processEventERIKStart (3 parameters; 0x727; 146 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x733: eventOwner:startCliantTalkTurn(2, player)
pc006 0x73F: eventOwner:_runCharaScheduler(354041856)
pc011 0x753: eventOwner:say(quest, 5, 0)
pc016 0x767: eventOwner:say(quest, 80, 0)
pc019 0x773: eventOwner:_runCharaScheduler(354041856)
pc024 0x787: eventOwner:say(quest, 6, 0)
pc029 0x79B: eventOwner:say(quest, 81, 0)
pc032 0x7A7: eventOwner:_runCharaScheduler(354086912)
pc037 0x7BB: eventOwner:say(quest, 88, 0)
pc042 0x7CF: eventOwner:say(quest, 7, 0)
pc045 0x7DB: eventOwner:_runCharaScheduler(354058240)
pc048 0x7E7: quest:_wait(1)
pc053 0x7FB: eventOwner:say(quest, 8, 0)
pc058 0x80F: eventOwner:say(quest, 9, 0)
pc063 0x823: eventOwner:say(quest, 10, 0)
pc066 0x82F: eventOwner:_runCharaScheduler(354103296)
pc071 0x843: eventOwner:say(quest, 11, 0)
pc076 0x857: eventOwner:say(quest, 12, 0)
pc079 0x863: eventOwner:_runCharaScheduler(354099200)
pc084 0x877: eventOwner:say(quest, 89, 0)
pc089 0x88B: eventOwner:say(quest, 90, 0)
pc092 0x897: eventOwner:_runCharaScheduler(353972224)
pc097 0x8AB: eventOwner:say(quest, 91, 0)
pc102 0x8BF: eventOwner:say(quest, 13, 0)
pc105 0x8CB: eventOwner:_runCharaScheduler(354000896)
pc110 0x8DF: eventOwner:say(quest, 14, 0)
pc115 0x8F3: eventOwner:say(quest, 92, 0)
pc117 0x8FB: quest:showQuestInfomation()
pc131 0x933: eventOwner:_runCharaScheduler(354078720)
pc136 0x947: eventOwner:say(quest, 58, 0)
pc141 0x95B: eventOwner:say(quest, 93, 0)
pc143 0x963: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x733: eventOwner:startCliantTalkTurn(2, player)
pc006 0x73F: eventOwner:_runCharaScheduler(354041856)
pc011 0x753: eventOwner:say(quest, 5, 0)
pc016 0x767: eventOwner:say(quest, 80, 0)
pc019 0x773: eventOwner:_runCharaScheduler(354041856)
pc024 0x787: eventOwner:say(quest, 6, 0)
pc029 0x79B: eventOwner:say(quest, 81, 0)
pc032 0x7A7: eventOwner:_runCharaScheduler(354086912)
pc037 0x7BB: eventOwner:say(quest, 88, 0)
pc042 0x7CF: eventOwner:say(quest, 7, 0)
pc045 0x7DB: eventOwner:_runCharaScheduler(354058240)
pc048 0x7E7: quest:_wait(1)
pc053 0x7FB: eventOwner:say(quest, 8, 0)
pc058 0x80F: eventOwner:say(quest, 9, 0)
pc063 0x823: eventOwner:say(quest, 10, 0)
pc066 0x82F: eventOwner:_runCharaScheduler(354103296)
pc071 0x843: eventOwner:say(quest, 11, 0)
pc076 0x857: eventOwner:say(quest, 12, 0)
pc079 0x863: eventOwner:_runCharaScheduler(354099200)
pc084 0x877: eventOwner:say(quest, 89, 0)
pc089 0x88B: eventOwner:say(quest, 90, 0)
pc092 0x897: eventOwner:_runCharaScheduler(353972224)
pc097 0x8AB: eventOwner:say(quest, 91, 0)
pc102 0x8BF: eventOwner:say(quest, 13, 0)
pc105 0x8CB: eventOwner:_runCharaScheduler(354000896)
pc110 0x8DF: eventOwner:say(quest, 14, 0)
pc115 0x8F3: eventOwner:say(quest, 92, 0)
pc117 0x8FB: quest:showQuestInfomation()
pc122 0x90F: eventOwner:_runCharaScheduler(354099200)
pc127 0x923: eventOwner:say(quest, 59, 0)
pc143 0x963: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `5`: Muahahahaha! My theory was correct! Correct, I tell you!
- `6`: The announcement of my theory before a council of my peers was met with thunderous applause!
- `7`: I have attempted several times to reach him on the linkpearl and inform him of the grand news, but he will not answer. I left a recording explaining all the details of my theory, but...
- `8`: [@1A(1)]...Aaahhh![@1A(0)]
- `9`: What have I done!? [@SPLIT([@STRING($EB(1))], ,1)], I fear the words I offered may have driven Widargelt to attempt the insane.
- `10`: I analyzed the ethereal waves of your bodies, second by second. I was able to isolate and identify those of the final aetherial regulation mechanism─the so-called seventh chakra! From that, I was able to find the land which was most likely to resonate with those waves. Silvertear Falls!
- `11`: I went to the site myself to investigate, and it was there that I made my great discovery─the discovery of the century!
- `12`: <sigh> It occurs to me that you shall never accomplish such a feat of the mind, [@SPLIT([@STRING($EB(1))], ,1)], and I find myself pitying you. But I digress.
- `13`: Yet battling the Empire on such terms will only result in another tragedy like that which befell Ala Mhigo. I pray you do not mean to follow him in this fool's crusade, [@SPLIT([@STRING($EB(1))], ,1)].
- `14`: He has gone to Silvertear Falls. I am certain of it! You must go, [@SPLIT([@STRING($EB(1))], ,1)]! You must stop him!
- `58`: By the gods, [@IF($E9(4),woman,man)]... Surely you don't mean...? Would you have [@1A(1)]me[@1A(0)] go in your stead!?
- `59`: My words will not sway him─just as they could not sway my son. Perhaps yours will.
- `80`: I shall spare you the details of my experiment─as you are not like to comprehend their significance anyway─and proceed directly to the all-important conclusion!
- `81`: And to think I owe it all to a fool adventurer and a simpleton monk! Both you and the Platinum Mirage that sent you are due a debt of gratitude.
- `88`: Speaking of the monk, where in Eorzea has the semiliterate oaf wandered off to?
- `89`: News of my findings has already been printed in the [@1A(1)]Mythril Eye[@1A(0)]. No doubt all of the region knows of it by now─and soon all the realm! I used the linkpearl to tell the simpleton monk [@1A(1)]everything[@1A(0)].
- `90`: Do you not see what I have done, [@SPLIT([@STRING($EB(1))], ,1)]! I told him [@1A(1)]precisely[@1A(0)] where he must go to unlock the seventh chakra!
- `91`: He has given his life to the fight to reclaim Ala Mhigo from the Empire. More than anything, he desires the power needed to achieve that end─the power to combat the might of all Garlemald. Any fool can see that─ Ahem, [@1A(1)]almost[@1A(0)] any fool can see that he imagines the seventh chakra to be that power!
- `92`: Will you do this?
- `93`: <sigh> If you fail to see the importance of this, then I have failed as a teacher. Just as I failed as a father...

## processEvent000_ERIK_Follow (3 parameters; 0xB26; 15 instructions)

```text
pc003 0xB32: eventOwner:startCliantTalkTurn(2, player)
pc006 0xB3E: eventOwner:_runCharaScheduler(354103296)
pc011 0xB52: eventOwner:say(quest, 76, 0)
pc013 0xB5A: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `76`: I will put this as plainly as possible so that even you might understand. Hasten─that's “go fast”─to Silvertear Falls, [@1A(1)]now[@1A(0)]! Stop the simpleton monk!

## processEvent000_WIDARGELT_Follow (3 parameters; 0xC02; 33 instructions)

```text
pc003 0xC0E: eventOwner:startCliantTalkTurn(2, player)
pc006 0xC1A: eventOwner:_runCharaScheduler(354041856)
pc011 0xC2E: eventOwner:say(quest, 15, 0)
pc016 0xC42: eventOwner:say(quest, 94, 0)
pc019 0xC4E: eventOwner:_runCharaScheduler(354078720)
pc024 0xC62: eventOwner:say(quest, 16, 0)
pc029 0xC76: eventOwner:say(quest, 17, 0)
pc031 0xC7E: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `15`: Save your words. None will serve you. The teacher did not come himself. He is a weak, craven man.
- `16`: I thought him a fellow Ala Mhigan. One who could be reasoned with. I see now that was folly. He is one of the others. He has chosen the craven's path. He is dead to me.
- `17`: Hasten to Silvertear Falls. Let us meet there, [@IF($E9(4),sister,brother)].
- `94`: Yet his is a brilliant mind. Why does he refuse to see? He has betrayed his country. He escapes into study. Theories will not slay Garleans. Theories will not win our war.

## processEvent005 (4 parameters; 0xD4A; 17 instructions)

Variant 1: extras `[false]`, offer result `1`.

```text
pc002 0xD52: quest:startFadeOutCutSceneDefault(player)
pc006 0xD62: quest:startNQCutScene("mnk0j610", 1)
pc015 0xD86: quest:startFadeInCutSceneAfterWarp(player)
return (no values)
```

Variant 2: extras `[true]`, offer result `1`.

```text
pc002 0xD52: quest:startFadeOutCutSceneDefault(player)
pc006 0xD62: quest:startNQCutScene("mnk0j610", 1)
pc011 0xD76: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEvent015 (3 parameters; 0xE47; 11 instructions)

```text
pc002 0xE4F: quest:startFadeOutCutSceneDefault(player)
pc006 0xE5F: quest:startNQCutScene("mnk0j620", 1)
pc009 0xE6B: quest:startFadeInCutSceneAfterWarp(player)
return (no values)
```

## processEvent020 (4 parameters; 0xF0A; 103 instructions)

```text
pc003 0xF16: eventOwner:startCliantTalkTurn(2, player)
pc006 0xF22: eventOwner:_runCharaScheduler(353959936)
pc011 0xF36: eventOwner:say(quest, 41, 0)
pc016 0xF4A: eventOwner:say(quest, 69, 0)
pc021 0xF5E: eventOwner:say(quest, 117, 0)
pc024 0xF6A: eventOwner:_runCharaScheduler(353964032)
pc029 0xF7E: eventOwner:say(quest, 70, 0)
pc034 0xF92: eventOwner:say(quest, 71, 0)
pc037 0xF9E: eventOwner:_runCharaScheduler(354107392)
pc040 0xFAA: quest:_wait(1.5)
pc045 0xFBE: eventOwner:say(quest, 72, 0)
pc049 0xFCE: quest:showGetJobItemWidget(player, arg4)
pc052 0xFDA: quest:_wait(6)
pc055 0xFE6: eventOwner:_runCharaScheduler(353968128)
pc060 0xFFA: eventOwner:say(quest, 73, 0)
pc065 0x100E: eventOwner:say(quest, 109, 0)
pc068 0x101A: eventOwner:_runCharaScheduler(353964032)
pc073 0x102E: eventOwner:say(quest, 110, 0)
pc078 0x1042: eventOwner:say(quest, 111, 0)
pc081 0x104E: eventOwner:_runCharaScheduler(353959936)
pc086 0x1062: eventOwner:say(quest, 112, 0)
pc091 0x1076: eventOwner:say(quest, 113, 0)
pc094 0x1082: eventOwner:_runCharaScheduler(354062336)
pc099 0x1096: eventOwner:say(quest, 114, 0)
pc101 0x109E: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `41`: Not long ago, I spoke with a man. An Ala Mhigan. He too was of the resistance. He asked me a simple question. Why do I fight?
- `69`: I did not hesitate. I did not think. The word came of its own will─[@1A(1)]revenge[@1A(0)].
- `70`: I did not think on it then. Perhaps now I should.
- `71`: I thought of nothing else. But you thought of me, [@IF($E9(4),sister,brother)]. You and the teacher. For that I thank you both.
- `72`: I made a promise. I will keep it. The fifth piece is yours. It is meant for you. For one whose seventh chakra is open.
- `73`: Ala Mhigo fought to protect itself. To protect all Eorzea from the Empire.
- `109`: And yet we are despised. Ignored. Worse, we are forgotten.
- `110`: Even so, the teacher preached peace. For a long time, I did not understand. I hated him for it.
- `111`: Ala Mhigans are a proud people. This pride is strong in me. And in the teacher. As it was in his son.
- `112`: He fought in the resistance. Yet it cost him his life. He too cursed his father for being a coward.
- `113`: I wish I could speak to him. I wish to tell him this is not so.
- `114`: Farewell, [@IF($E9(4),sister,brother)]. May Rhalgr watch over you.
- `117`: He said revenge is in all our hearts. That it is the most common of reasons. The easiest. And the most dangerous.

## processEvent020_ERIC_Follow (3 parameters; 0x120D; 20 instructions)

```text
pc003 0x1219: eventOwner:startCliantTalkTurn(2, player)
pc006 0x1225: eventOwner:_runCharaScheduler(353959936)
pc011 0x1239: eventOwner:say(quest, 74, 0)
pc016 0x124D: eventOwner:say(quest, 75, 0)
pc018 0x1255: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `74`: Widargelt is stubborn, as most monks are. I do not know if it will be possible for him to change his mind. But I pray he does. For his own sake, and for the world's.
- `75`: He calls you his [@IF($E9(4),sister,brother)]. Go now. Speak to him as one.

## processEventClear (3 parameters; 0x1306; 17 instructions)

```text
pc004 0x1316: desktopWidget:openPublicInformLongDialogWidget(quest, 115)
pc007 0x1322: quest:_wait(8)
pc012 0x1336: quest:showGetJobAbilityWidget(player, 27106, 1)
pc015 0x1342: quest:_wait(6)
return (no values)
```

Quest-text references:

- `115`: The ancient aether of Silvertear Falls opens your seventh chakra!

## processEvent020_ERIC_PUB (3 parameters; 0x1400; 15 instructions)

```text
pc003 0x140C: eventOwner:startCliantTalkTurn(2, player)
pc006 0x1418: eventOwner:_runCharaScheduler(353959936)
pc011 0x142C: eventOwner:say(quest, 79, 0)
pc013 0x1434: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `79`: The simpleton monk awaits you at Silvertear Falls. Go and speak to him as the [@IF($E9(4),sister,brother)] he names you.

## processEventWIDARGELT_PUB (3 parameters; 0x14DC; 15 instructions)

```text
pc003 0x14E8: eventOwner:startCliantTalkTurn(2, player)
pc006 0x14F4: eventOwner:_runCharaScheduler(353959936)
pc011 0x1508: eventOwner:say(quest, 78, 0)
pc013 0x1510: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `78`: I have nothing left to say. If you must see me, I am at Silvertear Falls.

## processEventChuui (3 parameters; 0x15B8; 8 instructions)

```text
pc006 0x15D0: worldMaster:say(worldMaster, 51131, 111226, 15)
return (no values)
```

## processEventChuui2 (3 parameters; 0x1635; 8 instructions)

```text
pc006 0x164D: worldMaster:say(worldMaster, 51132, 111226, 15)
return (no values)
```

