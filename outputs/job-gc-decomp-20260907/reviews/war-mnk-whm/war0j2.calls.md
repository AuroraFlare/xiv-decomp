# 111202 war0j2: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x225; 5 instructions)

```text
pc003 0x231: quest:_loadTextDataPermanently(8148, "war0j2")
return (no values)
```

## processEventCURIOUS_GORGEStart (3 parameters; 0x294; 125 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x2A0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2AC: eventOwner:_runCharaScheduler(354066432)
pc011 0x2C0: eventOwner:say(quest, 4, 0)
pc016 0x2D4: eventOwner:say(quest, 5, 0)
pc019 0x2E0: eventOwner:_runCharaScheduler(354086912)
pc024 0x2F4: eventOwner:say(quest, 6, 0)
pc029 0x308: eventOwner:say(quest, 7, 0)
pc034 0x31C: eventOwner:say(quest, 8, 0)
pc039 0x330: eventOwner:say(quest, 9, 0)
pc042 0x33C: eventOwner:_runCharaScheduler(354082816)
pc045 0x348: quest:_wait(1)
pc047 0x350: eventOwner:finishCliantTalkTurn()
pc052 0x364: eventOwner:say(quest, 10, 0)
pc056 0x374: eventOwner:startCliantTalkTurn(2, player)
pc059 0x380: eventOwner:_runCharaScheduler(70881280)
pc064 0x394: eventOwner:say(quest, 11, 0)
pc067 0x3A0: eventOwner:_runCharaScheduler(70795264)
pc072 0x3B4: eventOwner:say(quest, 12, 0)
pc075 0x3C0: eventOwner:_runCharaScheduler(353980416)
pc080 0x3D4: eventOwner:say(quest, 13, 0)
pc085 0x3E8: eventOwner:say(quest, 14, 0)
pc088 0x3F4: eventOwner:_runCharaScheduler(353964032)
pc093 0x408: eventOwner:say(quest, 15, 0)
pc095 0x410: quest:showQuestInfomation()
pc112 0x454: eventOwner:_runCharaScheduler(354041856)
pc115 0x460: quest:_wait(1)
pc120 0x474: eventOwner:say(quest, 16, 0)
pc122 0x47C: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x2A0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x2AC: eventOwner:_runCharaScheduler(354066432)
pc011 0x2C0: eventOwner:say(quest, 4, 0)
pc016 0x2D4: eventOwner:say(quest, 5, 0)
pc019 0x2E0: eventOwner:_runCharaScheduler(354086912)
pc024 0x2F4: eventOwner:say(quest, 6, 0)
pc029 0x308: eventOwner:say(quest, 7, 0)
pc034 0x31C: eventOwner:say(quest, 8, 0)
pc039 0x330: eventOwner:say(quest, 9, 0)
pc042 0x33C: eventOwner:_runCharaScheduler(354082816)
pc045 0x348: quest:_wait(1)
pc047 0x350: eventOwner:finishCliantTalkTurn()
pc052 0x364: eventOwner:say(quest, 10, 0)
pc056 0x374: eventOwner:startCliantTalkTurn(2, player)
pc059 0x380: eventOwner:_runCharaScheduler(70881280)
pc064 0x394: eventOwner:say(quest, 11, 0)
pc067 0x3A0: eventOwner:_runCharaScheduler(70795264)
pc072 0x3B4: eventOwner:say(quest, 12, 0)
pc075 0x3C0: eventOwner:_runCharaScheduler(353980416)
pc080 0x3D4: eventOwner:say(quest, 13, 0)
pc085 0x3E8: eventOwner:say(quest, 14, 0)
pc088 0x3F4: eventOwner:_runCharaScheduler(353964032)
pc093 0x408: eventOwner:say(quest, 15, 0)
pc095 0x410: quest:showQuestInfomation()
pc100 0x424: eventOwner:_runCharaScheduler(354107392)
pc103 0x430: player:_runCharaScheduler(354111488)
pc108 0x444: eventOwner:say(quest, 17, 0)
pc122 0x47C: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `4`: Welcome back, my friend. Much has happened in the short span since last we spoke.
- `5`: These past several turns of the sun, my duties with the Company of Heroes have taken me back and forth across the realm in search of a mysterious feral beast that's been terrorizing the smallfolk. People know not whence this monstrosity came, but witnesses say its thirst for blood is unlike anything they've ever seen.
- `6`: Unfortunately, the time I have spent in pursuit of the beast is time I have not spent studying the chronicles, and I am sorry to say I have made little progress.
- `7`: However, while on the road, I was able to decipher one passage that may be of interest to us both. From what I can gather, the chronicles tell of an ancient set of armor forged by my ancestors in the flames of the seven hells, and inscribed with the same arcane incantations that adorn the Soul of the Warrior.
- `8`: Apparently, this mighty armor was passed down from hero to apprentice for centuries, until one man, driven by rage and vainglory, cast all five pieces from Ablathia's highest peak. Since that day, the armor has remained lost...and with it, the power that it harbors.
- `9`: As far as I can make out, the next passage in the chronicles concerns the whereabouts of the missing artifacts...though I have only been able to make sense of the odd word thus far. Still, I must confess to some excitement. It may well be that the pieces cannot be found, of course, but if they [@1A(1)]could[@1A(0)]...imagine what a warrior thus clad could achieve!
- `10`: Ah, if only my brother were here... We could decipher the text together and spread the teachings of our people to the entire realm!
- `11`: Alas, he is not. His whereabouts are as hidden to me as those of the ancient armor. I would have liked you to meet him...if only so that you could have looked upon a true warrior.
- `12`: Well, perhaps you still shall. Eorzea is not as large as most people perceive. Paths cross, fates intertwine. Such is the will of the Spinner. It may be that my brother has chosen a similar path to mine. It may be that─
- `13`: Ah, but enough of my rambling. I shall not tire you with my words any longer. You are here to take the next step in your training, and so I shall oblige.
- `14`: Far to the north, beyond the boundaries of this forsaken desert, lies the Black Shroud. In a corner of this primeval wood can be found an area which the locals have dubbed “Humblehearth,” and it is here that a deadly hunter lurks─Sirocco.
- `15`: When facing this cold-blooded creature, you will soon realize that the labored swings of your axe are ill-suited to the task of felling such a nimble foe─but do not let this dissuade you from your mission. Wake the slumbering beast within and allow it to guide your hand. Learn to anticipate the movements of your mark, and wheresoever it leaps, be there to meet it with your killing edge.
- `16`: I understand that you may require more time for preparation. Speak with me again when you have steeled your resolve.
- `17`: Excellent. I sense your will growing stronger with every step you take. Here, accept this linkpearl. It will allow me to contact you when I have finished my next round of deciphering. Better that than have you make the long journey here on the off[@1F]chance that my studies have borne fruit. Good luck, and may the Fury be with you.

## processEventCURIOUS_GORGEStart_1 (3 parameters; 0x61B; 21 instructions)

```text
pc003 0x627: eventOwner:startCliantTalkTurn(2, player)
pc006 0x633: eventOwner:_runCharaScheduler(354066432)
pc011 0x647: eventOwner:say(quest, 2, 0)
pc017 0x65F: worldMaster:say(quest, 3, 0)
pc019 0x667: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `2`: Deciphering the chronicles is proving to be a much more demanding task than I had imagined. I shall continue my work, but ask that you be patient.
- `3`: The next warrior quest will be available from Curious Gorge upon reaching level 35.

## processEvent000 (3 parameters; 0x720; 20 instructions)

```text
pc003 0x72C: eventOwner:startCliantTalkTurn(2, player)
pc006 0x738: eventOwner:_runCharaScheduler(353968128)
pc011 0x74C: eventOwner:say(quest, 18, 0)
pc016 0x760: eventOwner:say(quest, 19, 0)
pc018 0x768: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `18`: Sirocco is said to hunt with its mate─the female acting as a decoy while he circles to subdue his prey from behind.
- `19`: He is an agile creature who will use his speed to dodge the deliberate blows of your axe. But if you can wake your inner beast, it will help you anticipate your mark's movements, allowing you to situate your blade directly in Sirocco's path the moment he arrives.

## onJobQuestCompleteFirst (2 parameters; 0x819; 6 instructions)

```text
pc004 0x829: desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51119)
return (no values)
```

## onJobQuestCompleteSecond (2 parameters; 0x8AC; 6 instructions)

```text
pc004 0x8BC: quest:showGetJobAbilityWidget(player, 27187, 1)
return (no values)
```

## onJobQuestCompleteThird (2 parameters; 0x91B; 6 instructions)

```text
pc004 0x92B: quest:showEventBeforeNpsLS(player, 1600318, 75)
return (no values)
```

## processEventChuui (3 parameters; 0x987; 8 instructions)

```text
pc006 0x99F: worldMaster:say(worldMaster, 51131, 111202, 17)
return (no values)
```

## processEventChuui2 (3 parameters; 0xA04; 8 instructions)

```text
pc006 0xA1C: worldMaster:say(worldMaster, 51132, 111202, 17)
return (no values)
```

