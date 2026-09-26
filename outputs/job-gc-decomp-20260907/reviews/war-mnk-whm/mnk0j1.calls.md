# 111221 mnk0j1: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x255; 5 instructions)

```text
pc003 0x261: quest:_loadTextDataPermanently(8452, "mnk0j1")
return (no values)
```

## processEventGAGARUNAStart (5 parameters; 0x2C4; 95 instructions)

Variant 1: extras `[false, false]`, offer result `0`.

```text
pc003 0x2D0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DC: eventOwner:_runCharaScheduler(353968128)
pc011 0x2F0: eventOwner:say(quest, 2, 0)
pc016 0x304: eventOwner:say(quest, 3, 0)
pc021 0x318: eventOwner:say(quest, 36, 0)
pc026 0x32C: eventOwner:say(quest, 44, 0)
pc029 0x338: eventOwner:_runCharaScheduler(354041856)
pc034 0x34C: eventOwner:say(quest, 4, 0)
pc039 0x360: eventOwner:say(quest, 45, 0)
pc044 0x374: eventOwner:say(quest, 5, 0)
pc047 0x380: eventOwner:_runCharaScheduler(354099200)
pc062 0x3BC: eventOwner:say(quest, 6, 0)
pc067 0x3D0: eventOwner:say(quest, 46, 0)
pc069 0x3D8: quest:showQuestInfomation()
pc085 0x418: eventOwner:say(quest, 7, 0)
pc090 0x42C: eventOwner:say(quest, 37, 0)
pc092 0x434: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[false, false]`, offer result `1`.

```text
pc003 0x2D0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DC: eventOwner:_runCharaScheduler(353968128)
pc011 0x2F0: eventOwner:say(quest, 2, 0)
pc016 0x304: eventOwner:say(quest, 3, 0)
pc021 0x318: eventOwner:say(quest, 36, 0)
pc026 0x32C: eventOwner:say(quest, 44, 0)
pc029 0x338: eventOwner:_runCharaScheduler(354041856)
pc034 0x34C: eventOwner:say(quest, 4, 0)
pc039 0x360: eventOwner:say(quest, 45, 0)
pc044 0x374: eventOwner:say(quest, 5, 0)
pc047 0x380: eventOwner:_runCharaScheduler(354099200)
pc062 0x3BC: eventOwner:say(quest, 6, 0)
pc067 0x3D0: eventOwner:say(quest, 46, 0)
pc069 0x3D8: quest:showQuestInfomation()
pc074 0x3EC: eventOwner:_runCharaScheduler(353980416)
pc079 0x400: eventOwner:say(quest, 8, 0)
pc092 0x434: eventOwner:finishCliantTalkTurn()
return 1
```

Variant 3: extras `[false, true]`, offer result `0`.

```text
pc003 0x2D0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DC: eventOwner:_runCharaScheduler(353968128)
pc011 0x2F0: eventOwner:say(quest, 2, 0)
pc016 0x304: eventOwner:say(quest, 3, 0)
pc021 0x318: eventOwner:say(quest, 36, 0)
pc026 0x32C: eventOwner:say(quest, 44, 0)
pc029 0x338: eventOwner:_runCharaScheduler(354041856)
pc034 0x34C: eventOwner:say(quest, 4, 0)
pc039 0x360: eventOwner:say(quest, 45, 0)
pc044 0x374: eventOwner:say(quest, 5, 0)
pc047 0x380: eventOwner:_runCharaScheduler(354099200)
pc056 0x3A4: eventOwner:say(quest, 42, 0)
pc067 0x3D0: eventOwner:say(quest, 46, 0)
pc069 0x3D8: quest:showQuestInfomation()
pc085 0x418: eventOwner:say(quest, 7, 0)
pc090 0x42C: eventOwner:say(quest, 37, 0)
pc092 0x434: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 4: extras `[false, true]`, offer result `1`.

```text
pc003 0x2D0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DC: eventOwner:_runCharaScheduler(353968128)
pc011 0x2F0: eventOwner:say(quest, 2, 0)
pc016 0x304: eventOwner:say(quest, 3, 0)
pc021 0x318: eventOwner:say(quest, 36, 0)
pc026 0x32C: eventOwner:say(quest, 44, 0)
pc029 0x338: eventOwner:_runCharaScheduler(354041856)
pc034 0x34C: eventOwner:say(quest, 4, 0)
pc039 0x360: eventOwner:say(quest, 45, 0)
pc044 0x374: eventOwner:say(quest, 5, 0)
pc047 0x380: eventOwner:_runCharaScheduler(354099200)
pc056 0x3A4: eventOwner:say(quest, 42, 0)
pc067 0x3D0: eventOwner:say(quest, 46, 0)
pc069 0x3D8: quest:showQuestInfomation()
pc074 0x3EC: eventOwner:_runCharaScheduler(353980416)
pc079 0x400: eventOwner:say(quest, 8, 0)
pc092 0x434: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `2`: Tell me, do you know of Professor Erik? He is a scholar of Eorzean military history whose genius is second to none! And he is among our most valued clients.
- `3`: Some find him to be...verbose. Tedious. Haughty. But never mind all that! The man spends more gil on a moon's research than most people see in a lifetime! Hence our amicable relations!
- `4`: Whatever his reasons, should the Professor meet an untimely fate, we will be unable to collect the gil he has borrowed, much less the interest!
- `5`: The point is the man must needs be guarded. I sent a monk of Ala Mhigo to see to his safety, but it turns out the bloody oaf has no work ethic about him─just like an Ala Mhigan. Sadly, he was the only man available at the time.
- `6`: You have the look of one who knows [@IF($E9(4),her,his)] way around a battlefield─ancient or otherwise. Our defenseless Professor is at the chocobo stables as we speak, awaiting an escort.
- `7`: So be it. You'll not see me beg. As the resident task-giver of a guild, I've learned to accept the fickleness of you adventurers.
- `8`: The Professor is under contract to pay back his loan upon completion of his research. See to it our investment doesn't end up under the paw or in the maw of some nasty beast.
- `36`: His latest work has him visiting the sites of ancient battlefields. He insists on surveying lands plagued by savage beasts.
- `37`: You'll return─sooner or later. Your kind always do.
- `42`: That's why I'm so glad to see you, [@SPLIT([@STRING($EB(1))], ,1)]. The Professor is at the chocobo stables as we speak, awaiting an escort. I'd like for it to be you.
- `44`: According to him, the beasts keep man away, and less intrusion by man means greater preservation.
- `45`: Oh, and it would be a terrible loss for the academic community and so on and so forth, yes, yes.
- `46`: You are yet a mere pugilist. Perhaps this task would provide some insight into what it is the monkhood does for us around here. What say you?

## processEvent000_1 (3 parameters; 0x582; 15 instructions)

```text
pc003 0x58E: eventOwner:startCliantTalkTurn(2, player)
pc006 0x59A: eventOwner:_runCharaScheduler(353984512)
pc011 0x5AE: eventOwner:say(quest, 9, 0)
pc013 0x5B6: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `9`: Professor Erik's well-being is in your hands. He awaits an escort at the chocobo stables as we speak. Oh, and please do whatever he asks of you. He is an [@1A(1)]extremely[@1A(0)] valued customer.

## processEvent005 (3 parameters; 0x65E; 122 instructions)

```text
pc003 0x66A: eventOwner:startCliantTalkTurn(2, player)
pc006 0x676: eventOwner:_runCharaScheduler(354103296)
pc011 0x68A: eventOwner:say(quest, 10, 0)
pc016 0x69E: eventOwner:say(quest, 11, 0)
pc021 0x6B2: eventOwner:say(quest, 47, 0)
pc026 0x6C6: eventOwner:say(quest, 12, 0)
pc031 0x6DA: eventOwner:say(quest, 48, 0)
pc036 0x6EE: eventOwner:say(quest, 49, 0)
pc041 0x702: eventOwner:say(quest, 50, 0)
pc044 0x70E: eventOwner:_runCharaScheduler(354099200)
pc049 0x722: eventOwner:say(quest, 13, 0)
pc054 0x736: eventOwner:say(quest, 51, 0)
pc059 0x74A: eventOwner:say(quest, 52, 0)
pc064 0x75E: eventOwner:say(quest, 14, 0)
pc067 0x76A: eventOwner:_runCharaScheduler(354103296)
pc072 0x77E: eventOwner:say(quest, 15, 0)
pc077 0x792: eventOwner:say(quest, 38, 0)
pc082 0x7A6: eventOwner:say(quest, 16, 0)
pc087 0x7BA: eventOwner:say(quest, 39, 0)
pc090 0x7C6: eventOwner:_runCharaScheduler(354004992)
pc095 0x7DA: eventOwner:say(quest, 17, 0)
pc100 0x7EE: eventOwner:say(quest, 18, 0)
pc103 0x7FA: eventOwner:_runCharaScheduler(354000896)
pc108 0x80E: eventOwner:say(quest, 19, 0)
pc113 0x822: eventOwner:say(quest, 60, 0)
pc118 0x836: eventOwner:say(quest, 43, 0)
pc120 0x83E: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `10`: Ah, my punch-prone [@IF($E9(4),maidservant,manservant)], I presume? You may and shall call me Erik. You are to guard my life, even at the cost of your own, and aid in my revolutionary research whenever and however asked. I endeavor to reconstruct military histories of old through the aetherial analysis of ancient battlegrounds.
- `11`: I assume the word conjures in your simple mind romantic images of vast plains and open valleys, with armies charging blindly at one another. False!
- `12`: Since his dawn, man has waged war of every kind upon land of every lay. No doubt you think those lands to be those sung of in the indulgent songs of bards. False! They are [@1A(1)]here[@1A(0)], beneath our very feet! And by my methods I shall find them and determine [@1A(1)]precisely[@1A(0)] how the events they played host to unfolded.
- `13`: Bah, enough of him. Let us speak more of my research.
- `14`: Sil'dih was plunged into chaos in the wake of King Lalawefu's demise─or the King of Springs, as he was known. Despite the success of his economic reforms......untimely droughts......unrest among the people......violent outbreaks throughout the kingdom.
- `15`: Sil'dih was......sultan at the time......distant descendant......ordered an attack......
- `16`: In an irony of ironies......nation's financial affairs......
- `17`: One among my colleagues disagreed with this interpretation of events. He claimed to have evidence suggesting otherwise, but all trace of it mysteriously disappeared just before he was to publish it.
- `18`: Mine own research shall unearth any such evidence should it truly exist! I shall know the truth! Granted, you are not the brightest coal in the brazier, but surely such a prospect entices even you.
- `19`: Let us tarry no more. Your task is to travel to the west of Mythril Pit T[@1F]8, where the zombies of Sil'dih are said to still wander.
- `38`: ......[@CR]......[@CR]
- `39`: ...Such [@1A(1)]fascinating[@1A(0)] stuff, is it not? It is enough to convince one things could not have happened any other way, no? False!
- `43`: And should you ever care to know more of the Eorzean military history, do come and see me. It is a personal crusade of mine to guide the dullards of this realm towards some modicum of enlightenment.
- `47`: I seek to discover the places where armies of old were deployed. Where they made camp and marched. Points at the crux of military strategy.
- `48`: No doubt you jumped at the chance to aid in my work. Tell me, which of my treatises have you read? All of th─[@1A(1)]none!?[@1A(0)] Gods, I knew you adventurers had a reputation for being unlettered. I didn't know you actually made efforts to remain so.
- `49`: <sigh> It matters not. I require only that you work with diligence─unlike that Widargelt buffoon. I admit, he seemed keenly interested in my research, but the man proved to be sloth itself. Far from what I would expect of a man of the Platinum Mirage.
- `50`: Alas, he [@1A(1)]is[@1A(0)] a monk of Ala Mhigo. I suppose the fool is too busy opening his [@1A(1)]chakra[@1A(0)] or harnessing his inner power or whatever the bloody hells it is those barbarians do all day. How can one still believe such nonsense in this day and age?
- `51`: There is a location of great interest to me to the west of Mythril Pit T[@1F]8, which lies south of Camp Drybone. I believe events of great import to the history of Sil'dih transpired there.
- `52`: Surely if you have ears you have heard of Sil'dih? Or are you deaf as well as dull? <sigh> Very well. I see you require some instruction. It would be remiss of me as an academic to allow you to wallow in such ignorance.
- `60`: Once there, slay any runagate imps lurking about that might prove a hindrance to my research.

## processEvent005_1 (3 parameters; 0x9AC; 20 instructions)

```text
pc003 0x9B8: eventOwner:startCliantTalkTurn(2, player)
pc006 0x9C4: eventOwner:_runCharaScheduler(354103296)
pc011 0x9D8: eventOwner:say(quest, 20, 0)
pc016 0x9EC: eventOwner:say(quest, 40, 0)
pc018 0x9F4: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `20`: Tarry no more. Travel to the west of Mythril Pit T[@1F]8 and there slay any runagate imps lurking about that might prove a hindrance to my research.
- `40`: Perhaps you think them no more than mere beasts going about their natural lives. False! Those little fiends are preventing my research! They are enemies of truth! Kill them!

## processEvent010 (3 parameters; 0xAA5; 11 instructions)

```text
pc002 0xAAD: quest:startFadeOutCutSceneDefault(player)
pc006 0xABD: quest:startNQCutScene("mnk0j110", 1)
pc009 0xAC9: quest:startFadeInCutSceneDefault(player)
return (no values)
```

## processEvent010_2_system (4 parameters; 0xB66; 13 instructions)

```text
pc004 0xB76: worldMaster:say(quest, 35)
pc008 0xB86: quest:showGetJobItemWidget(player, arg4)
pc011 0xB92: quest:_wait(6)
return (no values)
```

Quest-text references:

- `35`: The next monk quest will be available from Erik upon reaching level 35.

## processEvent010_3_system (3 parameters; 0xC13; 17 instructions)

```text
pc004 0xC23: desktopWidget:openPublicInformLongDialogWidget(quest, 59)
pc007 0xC2F: quest:_wait(8)
pc012 0xC43: quest:showGetJobAbilityWidget(player, 27108, 1)
pc015 0xC4F: quest:_wait(6)
return (no values)
```

Quest-text references:

- `59`: Aether imbued with an ancient fighting spirit opens your chakra!

## processEventStart_Hint (3 parameters; 0xD0D; 11 instructions)

```text
pc009 0xD31: worldMaster:say(worldMaster, 51130, 111221, 2, 30, 8, 15)
return (no values)
```

## processEventChuui (3 parameters; 0xDB1; 8 instructions)

```text
pc006 0xDC9: worldMaster:say(worldMaster, 51131, 111221, 2)
return (no values)
```

## processEventChuui2 (3 parameters; 0xE2E; 8 instructions)

```text
pc006 0xE46: worldMaster:say(worldMaster, 51132, 111221, 2)
return (no values)
```

