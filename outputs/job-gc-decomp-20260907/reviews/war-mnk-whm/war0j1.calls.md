# 111201 war0j1: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x254; 5 instructions)

```text
pc003 0x260: quest:_loadTextDataPermanently(8132, "war0j1")
return (no values)
```

## processEventStart (4 parameters; 0x2C3; 98 instructions)

Variant 1: extras `[0]`, offer result `0`.

```text
pc003 0x2CF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DB: eventOwner:_runCharaScheduler(354234368)
pc019 0x30F: eventOwner:say(quest, 39, 0)
pc024 0x323: eventOwner:say(quest, 3, 0)
pc029 0x337: eventOwner:say(quest, 4, 0)
pc034 0x34B: eventOwner:say(quest, 37, 0)
pc037 0x357: eventOwner:_runCharaScheduler(354234368)
pc042 0x36B: eventOwner:say(quest, 5, 0)
pc047 0x37F: eventOwner:say(quest, 6, 0)
pc052 0x393: eventOwner:say(quest, 7, 0)
pc057 0x3A7: eventOwner:say(quest, 38, 0)
pc062 0x3BB: eventOwner:say(quest, 8, 0)
pc065 0x3C7: eventOwner:_runCharaScheduler(354234368)
pc070 0x3DB: eventOwner:say(quest, 9, 0)
pc075 0x3EF: eventOwner:say(quest, 10, 0)
pc077 0x3F7: quest:showQuestInfomation()
pc093 0x437: eventOwner:say(quest, 11, 0)
pc095 0x43F: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[0]`, offer result `1`.

```text
pc003 0x2CF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DB: eventOwner:_runCharaScheduler(354234368)
pc019 0x30F: eventOwner:say(quest, 39, 0)
pc024 0x323: eventOwner:say(quest, 3, 0)
pc029 0x337: eventOwner:say(quest, 4, 0)
pc034 0x34B: eventOwner:say(quest, 37, 0)
pc037 0x357: eventOwner:_runCharaScheduler(354234368)
pc042 0x36B: eventOwner:say(quest, 5, 0)
pc047 0x37F: eventOwner:say(quest, 6, 0)
pc052 0x393: eventOwner:say(quest, 7, 0)
pc057 0x3A7: eventOwner:say(quest, 38, 0)
pc062 0x3BB: eventOwner:say(quest, 8, 0)
pc065 0x3C7: eventOwner:_runCharaScheduler(354234368)
pc070 0x3DB: eventOwner:say(quest, 9, 0)
pc075 0x3EF: eventOwner:say(quest, 10, 0)
pc077 0x3F7: quest:showQuestInfomation()
pc084 0x413: eventOwner:say(quest, 12, 0)
pc086 0x41B: eventOwner:finishCliantTalkTurn()
return 1
```

Variant 3: extras `[1]`, offer result `0`.

```text
pc003 0x2CF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DB: eventOwner:_runCharaScheduler(354234368)
pc013 0x2F7: eventOwner:say(quest, 2, 0)
pc024 0x323: eventOwner:say(quest, 3, 0)
pc029 0x337: eventOwner:say(quest, 4, 0)
pc034 0x34B: eventOwner:say(quest, 37, 0)
pc037 0x357: eventOwner:_runCharaScheduler(354234368)
pc042 0x36B: eventOwner:say(quest, 5, 0)
pc047 0x37F: eventOwner:say(quest, 6, 0)
pc052 0x393: eventOwner:say(quest, 7, 0)
pc057 0x3A7: eventOwner:say(quest, 38, 0)
pc062 0x3BB: eventOwner:say(quest, 8, 0)
pc065 0x3C7: eventOwner:_runCharaScheduler(354234368)
pc070 0x3DB: eventOwner:say(quest, 9, 0)
pc075 0x3EF: eventOwner:say(quest, 10, 0)
pc077 0x3F7: quest:showQuestInfomation()
pc093 0x437: eventOwner:say(quest, 11, 0)
pc095 0x43F: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 4: extras `[1]`, offer result `1`.

```text
pc003 0x2CF: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2DB: eventOwner:_runCharaScheduler(354234368)
pc013 0x2F7: eventOwner:say(quest, 2, 0)
pc024 0x323: eventOwner:say(quest, 3, 0)
pc029 0x337: eventOwner:say(quest, 4, 0)
pc034 0x34B: eventOwner:say(quest, 37, 0)
pc037 0x357: eventOwner:_runCharaScheduler(354234368)
pc042 0x36B: eventOwner:say(quest, 5, 0)
pc047 0x37F: eventOwner:say(quest, 6, 0)
pc052 0x393: eventOwner:say(quest, 7, 0)
pc057 0x3A7: eventOwner:say(quest, 38, 0)
pc062 0x3BB: eventOwner:say(quest, 8, 0)
pc065 0x3C7: eventOwner:_runCharaScheduler(354234368)
pc070 0x3DB: eventOwner:say(quest, 9, 0)
pc075 0x3EF: eventOwner:say(quest, 10, 0)
pc077 0x3F7: quest:showQuestInfomation()
pc084 0x413: eventOwner:say(quest, 12, 0)
pc086 0x41B: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `2`: Well, if it ain't me favorite scrag. Come to lick the shite off me boots like a good [@IF($E9(4),lass,lad)], have we?
- `3`: Or mayhap you're one of them as have been chasing ill rumors regarding a certain wild-eyed Hellsguard─the same one they say's been making his bloody mark with the Company of Heroes of late.
- `4`: Don't tell me you haven't heard of the Company. A hard band of bastards and brigands, they be─of the like this realm ain't never seen. Can't visit an alehouse, souphouse, or whorehouse in this town without having your ears crammed full of fanciful tales 'bout stronghold raidings and primal slayings.
- `5`: Yet there are those who've walked the Lance into Dravania with naught but a knife in their pocket and come back with the head of a hoary drake─only to be denied admittance to the Company. The fact that this stripling won a seat amongst that lot not five turns of the sun after rapping on their gates...well, that there be the true mystery.
- `6`: That is, a mystery to them as ain't never heard the legends of the Hellsguard warriors.
- `7`: Bards still sing of a time when whole cities were leveled by a handful of their kind. Like wild beasts, they were. The sound of their roaring alone would make stout knights soil themselves, and lesser men hide behind their whores.
- `8`: More's the bloody pity, too. With the Empire breathing down our necks, we could do with knowing exactly how a handful of men could butcher an army or ten.
- `9`: Speaking of which...mayhap this lad from the Farreach knows something of how they got the job done...and if he does, might be as someone could persuade him into giving the rest of us a few pointers, like.
- `10`: If he was here, I'd grab the scrag by the scruff of his dirty neck and bleed his secrets out of him, o' course! But lo, I've me duties to think of, and the cap'n would tan me hide and use it to patch his codpiece if he learned I'd left me post. So, I suppose that just leaves you, eh? Swear to me you'll seek the lad out and let us know if he's the genuine article, and I'll tell you where to look for him. Sounds fair, don't it?
- `11`: Hmph. No hair off my arse.
- `12`: It's settled then. The man calls himself Curious Gorge, and he's said to have set up camp in a cave to the southeast of Camp Horizon. In western Thanalan, it is. I'd tell you more, but that's as much as any bugger knows. Still, you adventurers ain't exactly short of a bit of resourcefulness, so I'm sure you'll manage.
- `37`: And now folks won't stop going on about their latest bloody recruit─some flame-skinned Roegadyn come down from the forsaken crags of the Farreach, apparently. Few have actually laid eyes on the man, but them as have reckon his veins must course with the blood of the Fury, for none can stay his axe once he takes the field.
- `38`: And then, one day, they simply up and vanished from the realm, taking the secrets of their success with them.
- `39`: Thought I smelled something rank. Another young whelp fresh from [@IF($E9(4),her,his)] mammy's pap come looking to play pirates, eh?

## processEventStartAfter (3 parameters; 0x579; 12 instructions)

```text
pc003 0x585: eventOwner:startCliantTalkTurn(2, player)
pc008 0x599: eventOwner:say(quest, 13, 0)
pc010 0x5A1: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `13`: I ain't never been to Thanalan meself, but I hear it's hotter than a forge, and dryer than a crone's...well, you get the idea[@IF($E9(4), missy,)]. If it be solitude the lad wants, he sure as hells chose the right bloody place.

## processEventCurious (3 parameters; 0x628; 70 instructions)

```text
pc003 0x634: eventOwner:startCliantTalkTurn(2, player)
pc006 0x640: eventOwner:_runCharaScheduler(353964032)
pc011 0x654: eventOwner:say(quest, 14, 0)
pc016 0x668: eventOwner:say(quest, 15, 0)
pc019 0x674: eventOwner:_runCharaScheduler(83914752)
pc022 0x680: quest:_wait(1.5)
pc027 0x694: eventOwner:say(quest, 16, 0)
pc030 0x6A0: eventOwner:_runCharaScheduler(354066432)
pc035 0x6B4: eventOwner:say(quest, 17, 0)
pc040 0x6C8: eventOwner:say(quest, 18, 0)
pc043 0x6D4: eventOwner:_runCharaScheduler(354099200)
pc048 0x6E8: eventOwner:say(quest, 19, 0)
pc053 0x6FC: eventOwner:say(quest, 40, 0)
pc058 0x710: eventOwner:say(quest, 20, 0)
pc061 0x71C: eventOwner:_runCharaScheduler(353968128)
pc066 0x730: eventOwner:say(quest, 34, 0)
pc068 0x738: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `14`: What? I ain't got words to mince with whelps...unless that is, you're here to become a wolf.
- `15`: If that's the case, then I'm Curious Gorge─but one remark about the name and I'll rip that [@IF($E9(4),pretty,ugly)] head from your shoulders and suck the marrow out of your twitching spine.
- `16`: Ahem. Now, I suppose you've heard the rumors about a bloodthirsty madman who, using lost battle techniques, has left a gruesome trail of carnage from Ablathia's Spine to the Sagolii Desert? Aye, well, they're all true─except for the parts about the carnage. Those have been greatly understated.
- `17`: That the techniques are “lost” is also untrue, for my tribe has been handing them down for thousands of years.
- `18`: Yet though our numbers dwindle with every new summer, the elders refuse to accept new acolytes from outside the village, apparently content to let the art die with us. This is why I left the mountain in which I was raised and came here─to spread the teachings of the warrior in hopes that the techniques will be passed on to future generations.
- `19`: If you wish, I can teach those techniques to you, but first I must measure whether your body and spirit have the capacity to bear such a burden. To walk the path of the warrior, one must call upon the primal instincts that slumber within the soul.
- `20`: To the north of this cave you will find an antling nest. Prove to me that you fear not the cries of battle, nor shun the call of death. Do this, and my knowledge is yours.
- `34`: The inner beast awaits. Wake [@IF($E9(4),her,him)] from [@IF($E9(4),her,his)] slumber and embrace [@IF($E9(4),her,his)] power.
- `40`: However, without a tempered mind and steely resolve, those instincts would engender such rage as could drive a man to madness.

## processEventCuriousAfter (3 parameters; 0x860; 15 instructions)

```text
pc003 0x86C: eventOwner:startCliantTalkTurn(2, player)
pc006 0x878: eventOwner:_runCharaScheduler(353968128)
pc011 0x88C: eventOwner:say(quest, 21, 0)
pc013 0x894: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `21`: Any [@IF($E9(4),woman,man)] can take up an axe and call [@IF($E9(4),herself,himself)] a marauder, but to become a true warrior, [@IF($E9(4),she,he)] must prove [@IF($E9(4),she,he)] can tame the inner beast that guides the blade. Slay the foul antlings who make their nest to the north of this cave and prove that your will is stone. Do this, and my knowledge is yours.

## processEventClear (3 parameters; 0x93C; 86 instructions)

```text
pc003 0x948: eventOwner:startCliantTalkTurn(2, player)
pc006 0x954: eventOwner:_runCharaScheduler(353964032)
pc011 0x968: eventOwner:say(quest, 22, 0)
pc014 0x974: player:_runCharaScheduler(354111488)
pc017 0x980: eventOwner:_runCharaScheduler(354107392)
pc022 0x994: eventOwner:say(quest, 23, 0)
pc027 0x9A8: eventOwner:say(quest, 24, 0)
pc030 0x9B4: eventOwner:_runCharaScheduler(353976320)
pc035 0x9C8: eventOwner:say(quest, 26, 0)
pc040 0x9DC: eventOwner:say(quest, 27, 0)
pc045 0x9F0: eventOwner:say(quest, 28, 0)
pc048 0x9FC: eventOwner:_runCharaScheduler(354041856)
pc053 0xA10: eventOwner:say(quest, 29, 0)
pc058 0xA24: eventOwner:say(quest, 30, 0)
pc061 0xA30: eventOwner:_runCharaScheduler(353968128)
pc066 0xA44: eventOwner:say(quest, 31, 0)
pc071 0xA58: eventOwner:say(quest, 32, 0)
pc076 0xA6C: eventOwner:say(quest, 41, 0)
pc078 0xA74: eventOwner:finishCliantTalkTurn()
pc084 0xA8C: worldMaster:say(quest, 33, 0)
return (no values)
```

Quest-text references:

- `22`: I witnessed your battle with the antlings, and must say that I was surprised. You have proven yourself far more worthy of this than I could have imagined.
- `23`: In your hands lies the Soul of the Warrior─a crystal within which the deeds of a thousand thousand warriors from history are recorded. For countless generations, the Soul has been passed on to those in my tribe who choose the path of the warrior, to guide them and aid them on their journey.
- `24`: When your inner beast awakens, the runes will resonate, further empowering your will, and granting you such strength as you never thought possible.
- `26`: Today, there is cause for celebration, my friend, for through you, I have ensured that my tribe's legacy will endure. This is why I left my home. This is why I joined the Company of Heroes. This is why I am here today.
- `27`: Yet however hard I try, and however earnestly I pursue my goal, I cannot deny that I believe that my mission will ultimately end in failure.
- `28`: While I style myself a warrior, the truth is that I left the mountains long before my training was complete.
- `29`: And while I carry with me the chronicles of my ancestors, detailing the ancient arts of war, I lack the ability to decipher the texts.
- `30`: Yet, there may still be hope, for there is another who fled my village─one who shared my dream of passing on the teachings of the tribe, and [@1A(1)]can[@1A(0)] read the tome... My brother.
- `31`: Without him, I fear there is little more I can teach you at this time.
- `32`: But that will not discourage me from continuing my studies of the chronicles, nor shake my belief that further secrets will soon reveal themselves to me.
- `33`: The next warrior quest will be available from Curious Gorge upon reaching level 35.
- `41`: Until then, I ask that you use the knowledge I've passed on to you, and continue your training. You must strive to harden your will so that it may endure the strain of future burdens. Good luck, my friend.

## processEventClearAfter (3 parameters; 0xBD5; 20 instructions)

```text
pc003 0xBE1: eventOwner:startCliantTalkTurn(2, player)
pc006 0xBED: eventOwner:_runCharaScheduler(354234368)
pc011 0xC01: eventOwner:say(quest, 35, 0)
pc016 0xC15: eventOwner:say(quest, 36, 0)
pc018 0xC1D: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `35`: Well, throw me in the fire and call me Rosy! You're back! What with you taking so long, I naturally made you for an oath-breaking cur, and was planning on sending the lads 'round to gut you! 'Tis lucky there were a few names higher up on me list, eh!? Heh heh!
- `36`: Hmm... This warrior lad sounds interesting...which means the cap'n will definitely want to hear about him...which means someone'll be getting extra rum rations tonight! Heh heh heh! Much obliged, scrag! Now bugger off!

## processEventJob (4 parameters; 0xCCE; 24 instructions)

```text
pc003 0xCDA: quest:showGetJobItemWidget(player, arg4)
pc006 0xCE6: quest:_wait(6)
pc011 0xCFA: desktopWidget:openPublicInformLongDialogWidget(quest, 42)
pc014 0xD06: quest:_wait(8)
pc019 0xD1A: quest:showGetJobAbilityWidget(player, 27186, 1)
pc022 0xD26: quest:_wait(6)
return (no values)
```

Quest-text references:

- `42`: The warriors of ages past have sensed your resolve and now grant you their undying strength!

## processEventStart_Hint (3 parameters; 0xDFE; 11 instructions)

```text
pc009 0xE22: worldMaster:say(worldMaster, 51130, 111201, 4, 30, 3, 15)
return (no values)
```

## processEventChuui (3 parameters; 0xEA2; 8 instructions)

```text
pc006 0xEBA: worldMaster:say(worldMaster, 51131, 111201, 4)
return (no values)
```

## processEventChuui2 (3 parameters; 0xF1F; 8 instructions)

```text
pc006 0xF37: worldMaster:say(worldMaster, 51132, 111201, 4)
return (no values)
```

