# 111205 war0j5: exact recorded client calls

`quest`, `player`, and `eventOwner` name R0, R1, and R2; `arg4`/`arg5` are passed parameters, not recovered semantic names. Calls retain source PCs and chunk offsets. Client APIs are inert stubs. Choices 0/1 below are explicit test inputs; each offer returns its single stored API result.

## initText (1 parameters; 0x1F3; 5 instructions)

```text
pc003 0x1FF: quest:_loadTextDataPermanently(8196, "war0j5")
return (no values)
```

## processEventCURIOUS_GORGEStart (3 parameters; 0x262; 124 instructions)

Variant 1: extras `[]`, offer result `0`.

```text
pc003 0x26E: eventOwner:startCliantTalkTurn(2, player)
pc006 0x27A: eventOwner:_runCharaScheduler(354099200)
pc011 0x28E: eventOwner:say(quest, 2, 0)
pc015 0x29E: quest:startFadeOut(player, 1)
pc018 0x2AA: quest:_wait(1)
pc022 0x2BA: quest:startFadeIn(player, 1)
pc027 0x2CE: eventOwner:say(quest, 3, 0)
pc032 0x2E2: eventOwner:say(quest, 17, 0)
pc035 0x2EE: eventOwner:_runCharaScheduler(354058240)
pc040 0x302: eventOwner:say(quest, 4, 0)
pc043 0x30E: quest:_wait(1)
pc048 0x322: eventOwner:say(quest, 5, 0)
pc053 0x336: eventOwner:say(quest, 6, 0)
pc056 0x342: eventOwner:_runCharaScheduler(353964032)
pc059 0x34E: quest:_wait(1)
pc064 0x362: eventOwner:say(quest, 7, 0)
pc067 0x36E: eventOwner:_runCharaScheduler(354103296)
pc072 0x382: eventOwner:say(quest, 8, 0)
pc077 0x396: eventOwner:say(quest, 9, 0)
pc082 0x3AA: eventOwner:say(quest, 10, 0)
pc085 0x3B6: eventOwner:_runCharaScheduler(70881280)
pc090 0x3CA: eventOwner:say(quest, 11, 0)
pc095 0x3DE: eventOwner:say(quest, 12, 0)
pc097 0x3E6: quest:showQuestInfomation()
pc111 0x41E: eventOwner:_runCharaScheduler(354082816)
pc114 0x42A: quest:_wait(1)
pc119 0x43E: eventOwner:say(quest, 13, 0)
pc121 0x446: eventOwner:finishCliantTalkTurn()
return 0
```

Variant 2: extras `[]`, offer result `1`.

```text
pc003 0x26E: eventOwner:startCliantTalkTurn(2, player)
pc006 0x27A: eventOwner:_runCharaScheduler(354099200)
pc011 0x28E: eventOwner:say(quest, 2, 0)
pc015 0x29E: quest:startFadeOut(player, 1)
pc018 0x2AA: quest:_wait(1)
pc022 0x2BA: quest:startFadeIn(player, 1)
pc027 0x2CE: eventOwner:say(quest, 3, 0)
pc032 0x2E2: eventOwner:say(quest, 17, 0)
pc035 0x2EE: eventOwner:_runCharaScheduler(354058240)
pc040 0x302: eventOwner:say(quest, 4, 0)
pc043 0x30E: quest:_wait(1)
pc048 0x322: eventOwner:say(quest, 5, 0)
pc053 0x336: eventOwner:say(quest, 6, 0)
pc056 0x342: eventOwner:_runCharaScheduler(353964032)
pc059 0x34E: quest:_wait(1)
pc064 0x362: eventOwner:say(quest, 7, 0)
pc067 0x36E: eventOwner:_runCharaScheduler(354103296)
pc072 0x382: eventOwner:say(quest, 8, 0)
pc077 0x396: eventOwner:say(quest, 9, 0)
pc082 0x3AA: eventOwner:say(quest, 10, 0)
pc085 0x3B6: eventOwner:_runCharaScheduler(70881280)
pc090 0x3CA: eventOwner:say(quest, 11, 0)
pc095 0x3DE: eventOwner:say(quest, 12, 0)
pc097 0x3E6: quest:showQuestInfomation()
pc102 0x3FA: eventOwner:_runCharaScheduler(354050048)
pc107 0x40E: eventOwner:say(quest, 14, 0)
pc121 0x446: eventOwner:finishCliantTalkTurn()
return 1
```

Quest-text references:

- `2`: So, my friend, have you tried donning the armor? Did you sense anything different? Did my ancestors lend you their strength?
- `3`: The detail of these markings... It will be difficult, but I believe with time, I will be able to reproduce them. The problem now is the final piece that I retrieved. Unlike those on your four pieces, the engravings on the cuirass fade the moment I lay my hands upon it...as if it does not accept me, does not accept my strength.
- `4`: Since our foray into the Silver Bazaar, I have sensed that something may be amiss. The Soul of the Warrior which I carry no longer speaks with me, no matter how valiant my deeds on the battlefield. After much thought, I believe the silence may be a message in itself─one telling me that I must not grow content with these petty victories.
- `5`: I must ever test the boundaries of my strength, as my father and grandfather did before me, and as my brother does even now. To deny the challenge set out by my ancestors would make me no better than the tired village elders who cower behind rock and crag while my tribe's pride fades with each passing day.
- `6`: I, for one, will not suffer the fetters of fear to prevent me from surpassing my limits!
- `7`: And I shall help others break free from their own chains, so that we may form a mighty alliance the like of which this world has never seen! An alliance of noble warriors, fearless and strong, trained by me in the ancient ways of my ancestors! No beastman army or imperial cannon will be able to stop us!
- `8`: But first I must have the power of the armor...and to do that I must prove my worth!
- `9`: Though it was I who led you to their final places of resting, I will not ask that you give your four pieces to me. Rather, I would propose a contest. A contest to show my ancestors who truly deserves to don a hundred generations of history!
- `10`: The chronicles speak of a rare battle technique passed down via the Soul of the Warrior to those who have displayed peerless courage in slaying the most monstrous of foes.
- `11`: I say, let us both seek out such a creature, and declare the first to defeat it and learn the last technique the keeper of the armor.
- `12`: In the La Noscea highlands, deep within the caves of Iron Lake, dwells Audhumbla─one of the largest land-dwelling beasts in all of Eorzea. This shall be our prey.
- `13`: Are you afraid? Then you may as well hand over your four pieces now, for they will avail a coward nothing and less.
- `14`: Then it is settled. And once I have shown my ancestors I am worthy of their praise, perhaps they will speak to me once more...
- `17`: Perhaps it requires that I prove myself further... That [@1A(1)]we[@1A(0)] prove ourselves further.

## processEvent000 (3 parameters; 0x5E4; 20 instructions)

```text
pc003 0x5F0: eventOwner:startCliantTalkTurn(2, player)
pc006 0x5FC: eventOwner:_runCharaScheduler(354000896)
pc011 0x610: eventOwner:say(quest, 15, 0)
pc016 0x624: eventOwner:say(quest, 16, 0)
pc018 0x62C: eventOwner:finishCliantTalkTurn()
return (no values)
```

Quest-text references:

- `15`: Audhumbla of Iron Lake is said to have a hide so thick that even the legendary blades of the Allagan Empire could not penetrate it.
- `16`: But the Allagans looked solely to their weaponry for power, while I may look to the beast within! And thus shall I succeed where they failed!

## onJobQuestCompleteFirst (2 parameters; 0x6DD; 6 instructions)

```text
pc004 0x6ED: desktopWidget:openPublicInformLongDialogWidget(worldMaster, 51119)
return (no values)
```

## onJobQuestCompleteSecond (2 parameters; 0x770; 6 instructions)

```text
pc004 0x780: quest:showGetJobAbilityWidget(player, 27192, 3)
return (no values)
```

## onJobQuestCompleteThird (2 parameters; 0x7DF; 6 instructions)

```text
pc004 0x7EF: quest:showEventBeforeNpsLS(player, 1600318, 77)
return (no values)
```

## processEventChuui (3 parameters; 0x84B; 8 instructions)

```text
pc006 0x863: worldMaster:say(worldMaster, 51131, 111205, 17)
return (no values)
```

## processEventChuui2 (3 parameters; 0x8C8; 8 instructions)

```text
pc006 0x8E0: worldMaster:say(worldMaster, 51132, 111205, 17)
return (no values)
```

